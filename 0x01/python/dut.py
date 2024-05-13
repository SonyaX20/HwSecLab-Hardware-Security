import serial
from serial.tools import list_ports
import time
import enum

class DuT(object):
	CMD_WHOAMI                	= b'W'
	CMD_AUTHORIZE             	= b'A'
	CMD_READ_SECURE_MEMORY    	= b'R'
	CMD_PING					= b'P'
	CMD_SUM						= b'S'

	VENDOR_ID 									= 0x2341
	PRODUCT_ID 									= 0x0001

	"""
	Looks for a matching serial port and opens the Device under test, accordingly.
	"""
	def __init__(self):
		port 		= "COM9"
		device_list = list_ports.comports()
		for device in device_list:
			if device.vid is not None and device.pid is not None:
				if device.vid == self.VENDOR_ID and device.pid == self.PRODUCT_ID:
					port = device.device
		assert port is not None
		self.__port = port
		self.__ser 	= serial.Serial(self.__port, baudrate=115_200, timeout=0.5)
		time.sleep(2)

	def __del__(self):
		self.__ser.close()

	"""
	Due to faults there may some unwanted data being transmitted.
	Solution is to clear buffers before each communication attempt.
	"""
	def __clear_buffers(self):
		self.__ser.reset_input_buffer()
		self.__ser.reset_output_buffer()

	"""
	Due to faults there will be some unintended crashes.
	If the device is not responding accordingly, it needs to be reset.
	"""
	def reset(self):
		self.__clear_buffers()
		self.__ser.dtr = False
		time.sleep(1)
		self.__ser.dtr = True
		time.sleep(2)


	"""
	Returns whether or not the currently signed in user is authorized.
	"""
	@property
	def authorized(self) -> bool:
		try:
			self.__clear_buffers()
			self.__ser.write(self.CMD_WHOAMI)
			authrorization_state = self.__ser.readline()
			return authrorization_state.decode("ASCII").replace('\r\n', '') == 'AUTHORIZED'
		except Exception as e:
			return False

	"""
	Send an authorization request followed by a 64-Byte Password.
	If the password is correct, priviledges will be escalated to system user.
	"""
	def authorize(self, password: bytes):
		assert len(password) == 64
		self.__clear_buffers()
		self.__ser.write(self.CMD_AUTHORIZE)
		self.__ser.write(password)

	"""
	Reading the secure memory is your goal.
	This is only possible, however, if property authorized returns True.
	Otherwise, calling this function will result in a total lock-down of the device.
	You'd have to find a way of reading the secure memory.
	"""
	def read_secure_memory(self):
		self.__clear_buffers()
		self.__ser.write(self.CMD_READ_SECURE_MEMORY)
		lines 		= b''
		tmp 			= self.__ser.readline()
		while tmp != b'':
			lines 	= lines + tmp
			tmp 		= self.__ser.readline()
		print(lines.decode("ASCII"))

	"""
	Returns True if the device answers 'Wallet Pong', otherwise False.
	"""
	def ping(self) -> bool:
		self.__clear_buffers()
		self.__ser.write(self.CMD_PING)
		response 		= self.__ser.readline()
		try:
			response 	= response.decode("ASCII").replace('\r\n', '')
			return response == "Wallet Pong"
		except:
			return False
		
	def read_sum(self):
		self.__clear_buffers()
		self.__ser.write(self.CMD_SUM)
		bytes_sum = self.__ser.readall()
		print(bytes_sum)
		return bytes_sum