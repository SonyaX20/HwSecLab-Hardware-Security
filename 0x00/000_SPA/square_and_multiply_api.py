import serial
import time

class SquareAndMultiplyAPI(object):
    CMD_PERFORM_MODULAR_EXPONENTIATION  	= b'0'
    CMD_GET_KEY_SIZE         			= b'1'

    def __init__(self, port: str, baudrate=115_200, timeout=1) -> 'SquareAndMultiplyAPI':
        self.ser = serial.Serial(port, baudrate, timeout=timeout)
        time.sleep(2)
        self.keysize = self.get_keysize()
        assert (self.keysize != b'') and (self.keysize > 0)

    def get_keysize(self) -> int:
        self.ser.write(self.CMD_GET_KEY_SIZE)
        return int.from_bytes(self.ser.read(2), 'little')

    def modexp(self):
        self.ser.write(self.CMD_PERFORM_MODULAR_EXPONENTIATION)
