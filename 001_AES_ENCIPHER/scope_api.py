import pyvisa
import sys
import struct
from matplotlib import pyplot as plt
import matplotlib
matplotlib.use('TkAgg')

READ_RAW_SIZE = 250000

class Scope():
    def __init__(self, resource):
        self._resource = resource

    def __write(self, message):
        self._resource.write(message)

    def __query(self, message):
        return self._resource.query(message)

    def __query_raw(self, message, size=READ_RAW_SIZE):
        self.__write(message)
        return self._resource.read_raw(size=size)

    def __interpret_channel(self, channel):
        if type(channel) == int:
            channel = 'CHAN' + str(channel)
        return channel

    def __waveform_preamble(self):
        values = self.__query(":WAVeform:PREamble?")
        values = values.split(',')
        assert len(values) == 10
        fmt, typ, pnts, cnt, xref, yorig, yref = (int(val) for val in values[:4] + values[6:7] + values[8:10])
        xinc, xorig, yinc = (float(val) for val in values[4:6] + values[7:8])
        return fmt, typ, pnts, cnt, xinc, xorig, xref, yinc, yorig, yref

    def __waveform_preamble_dict(self):
        keys = 'fmt, typ, pnts, cnt, xinc, xorig, xref, yinc, yorig, yref'.split(', ')
        return dict(zip(keys, self.__waveform_preamble()))

    def __running(self):
        return self.__query(':TRIGger:STATus?') in ('TD', 'WAIT', 'RUN', 'AUTO')

    def __decode_ieee_block(self, ieee_bytes):
        n_header_bytes = int(chr(ieee_bytes[1])) + 2
        n_data_bytes = int(ieee_bytes[2:n_header_bytes].decode('ascii'))
        return ieee_bytes[n_header_bytes:n_header_bytes + n_data_bytes]

    def __get_waveform_bytes_internal(self, channel):
        if self.__running:
            self.__stop()
        self.__write(":WAVeform:SOURce " + channel)
        self.__write(":WAVeform:FORMat BYTE")
        self.__write(":WAVeform:MODE RAW")
        
        wp              = self.__waveform_preamble_dict()
        pnts            = wp['pnts']
        buf             = b""
        max_byte_len    = 250000
        pos             = 1

        while len(buf) < pnts:
            self.__write(":WAVeform:STARt {0}".format(pos))
            end_pos     = min(pnts, pos + max_byte_len - 1)
            self.__write(":WAVeform:STOP {0}".format(end_pos))
            tmp_buf     = self.__query_raw(":WAVeform:DATA?")
            buf         = buf + self.__decode_ieee_block(tmp_buf)
            pos         = pos + max_byte_len
        return buf

    # Equivalent to pressing "SINGLE" button on the oscilloscope
    # Starts acquisition in single mode
    def __run_single(self):
        self.__write(":SINGle")

    # Equivalent to pressing "STOP" button on the oscilloscope
    # Stops the acquisition
    def __stop(self):
        self.__write(":STOP")

    # Returns the triggers status
    def __get_trigger_status(self):
        return self.__query(':TRIGger:STATus?')






    ###########################################
    ############ Student Functions ############
    ###########################################
    def arm(self):
        """
        Starts acqusition in the "Single mode" and waits (i.e. is blocking) until the trigger is asserted!
        """
        self.__run_single()
        while 'WAIT' not in self.__get_trigger_status():
            pass

    def triggered(self) -> bool:
        """
        Returns True if scpoe has been triggered.
        False otherwise.
        """
        return 'STOP' in self.__get_trigger_status()

    def get_samples(self, channel: int):
        """
        Collects the current screen of the oscilloscope from the memory, i.e. takes all the points that are currently viewed
        Data is collected from "channel" argument, e.g. 1
        Returns array of floats representing the recording.
        """
        channel                                                     = self.__interpret_channel(channel)
        buff                                                        = self.__get_waveform_bytes_internal(channel)
        fmt, typ, pnts, cnt, xinc, xorig, xref, yinc, yorig, yref   = self.__waveform_preamble()
        samples                                                     = list(struct.unpack(str(len(buff)) + 'B', buff))
        samples                                                     = [(val - yorig - yref) * yinc for val in samples]
        return samples

    def plot_channel(self, channel: int):
        """
        Extracts samples and plots data using matplotlib.
        """
        samples = self.get_samples(channel)
        ax      = plt.gca()
        plt.plot(samples)
        ax.set_xlabel('Samples')
        ax.set_ylabel('Voltage')
        plt.show()

def open_scope() -> Scope:
    resource_manager    = pyvisa.ResourceManager()
    instruments         = resource_manager.list_resources()
    resource_name       = list(filter(lambda x: x.startswith('USB'), instruments))
    
    print("usb is {}".format(resource_name))
    if len(resource_name) != 1:
        print('Bad instrument list', instruments)
        sys.exit(-1)
    return Scope(resource_manager.open_resource(resource_name[0]))