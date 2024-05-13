import serial
from serial.tools import list_ports
import enum

class TriggerConfiguration(enum.Enum):
	TRIGGER_INTERNAL							= 0b00000000
	TRIGGER_INTERNAL_SINGLE_SHOT 				= 0b00000100
	TRIGGER_EXTERNAL_RISING_EDGE				= 0b00000001
	TRIGGER_EXTERNAL_RISING_EDGE_SINGLE_SHOT 	= 0b00000101
	TRIGGER_EXTERNAL_FALLING_EDGE				= 0b00000010
	TRIGGER_EXTERNAL_FALLING_EDGE_SINGLE_SHOT	= 0b00000110
	TRIGGER_EXTERNAL_ANY_EDGE					= 0b00000011
	TRIGGER_EXTERNAL_ANY_EDGE_SINGLE_SHOT 		= 0b00000111

class GlitchController(object):
	CMD_RESET 						= b'R'
	CMD_SET_PULSE_WIDTH 			= b'W'
	CMD_SET_PULSE_DELAY 			= b'D'
	CMD_SET_MODE 					= b'C'
	CMD_DO_SOFT_TRIGGER 			= b'T'
	CMD_GET_CONFIG 					= b'B'
	CMD_GET_SHOT_COUNTER			= b'S'
	BAUDRATE 						= 115_200

	VENDOR_ID_ICE_SUGAR_NANO		= 0x1D50
	PRODUCT_ID_ICE_SUGAR_NANO		= 0x602B

	VENDOR_ID_ICE_STICK				= 0x0403
	PRODUCT_ID_ICE_STICK			= 0x6010

	"""
	Looks for a matching serial port and opens the Device under test, accordingly.
	"""
	def __init__(self):
		port 		= "COM7"
		device_list = list_ports.comports()
		for device in device_list:
			if device.vid is not None and device.pid is not None:
				if device.vid == self.VENDOR_ID_ICE_STICK and device.pid == self.PRODUCT_ID_ICE_STICK:
					print("Found Ice-Stick!")
					port = device.device
					print(port)
				elif device.vid == self.VENDOR_ID_ICE_SUGAR_NANO and device.pid == self.PRODUCT_ID_ICE_SUGAR_NANO:
					print("Found Ice-Sugar Nano!")
					port = device.device
					print(port)
		assert port is not None
		self.__port = port
		self.__ser = serial.Serial(self.__port, baudrate=self.BAUDRATE, timeout=1.0)
		self.reset()

	"""
	Sends the reset command to the Glitcher.
	"""
	def reset(self):
		self.__ser.write(self.CMD_RESET)

	"""
	Reads the configuration from the glitcher.
	This is a 9-Byte array, consisting of.
	"""
	@property
	def config(self) -> bytes:
		self.__ser.write(self.CMD_GET_CONFIG)
		config = self.__ser.read(9)
		return config

	"""
	Reads the currently configured pulse width of the glitcher.
	"""
	@property
	def pulse_width(self) -> int:
		config 				= self.config
		assert len(config) 	== 9
		width_bytes 		= config[4:6]
		return int.from_bytes(width_bytes, 'big')

	"""
	Sets the pulse width of the glitcher.
	"""
	@pulse_width.setter
	def pulse_width(self, width: int):
		assert 1 <= width <= 0xFFFF, "Width must be between 1 and 0xFFFF"
		self.__ser.write(self.CMD_SET_PULSE_WIDTH)
		self.__ser.write(width.to_bytes(2, 'big'))
		width_readback = self.pulse_width
		assert width == width_readback

	"""
	Reads the currently configured pulse offset of the glitcher.
	"""
	@property
	def pulse_offset(self) -> int:
		config 				= self.config
		assert len(config) 	== 9
		delay_bytes 		= config[1:3]
		return int.from_bytes(delay_bytes, 'big')

	"""
	Sets the pulse offset of the glitcher.
	"""
	@pulse_offset.setter
	def pulse_offset(self, offset: int):
		assert 1 <= offset<= 0xFFFF, "Offset must be between 1 and 0xFFFF"
		self.__ser.write(self.CMD_SET_PULSE_DELAY)
		self.__ser.write(offset.to_bytes(2, 'big'))

	"""
	Reads the currently configured trigger configuration.
	"""
	@property
	def trigger_on(self) -> TriggerConfiguration:
		config 				= self.config
		assert len(config) 	== 9
		trigger_config 		= config[len(config)-1]
		return TriggerConfiguration(trigger_config)
	
	"""
	Sets the trigger behavior of the glitcher. Can be any of TriggerConfiguration.
	"""
	@trigger_on.setter
	def trigger_on(self, trigger_config: TriggerConfiguration):
		config 				= self.config
		assert len(config) 	== 9
		self.__ser.write(self.CMD_SET_MODE)
		self.__ser.write(trigger_config.value.to_bytes(2, 'big'))

	"""
	Reads out how many times the trigger has been asserted and hence, how many faults have been injected.
	"""
	@property
	def shot_counter(self) -> int:
		self.__ser.write(self.CMD_GET_SHOT_COUNTER)
		s = self.__ser.read(1)
		assert s == b'S'
		shots_fired 		= self.__ser.read(2)
		return int.from_bytes(shots_fired, 'big')

	"""
	Forces the soft-trigger to be asserted.
	"""
	def trigger_sw(self) -> None:
		self.__ser.write(self.CMD_DO_SOFT_TRIGGER)