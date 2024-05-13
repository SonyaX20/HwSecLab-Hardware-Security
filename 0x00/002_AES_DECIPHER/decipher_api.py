import serial
import time
from typing import *

class DecipherAPI(object):
    CMD_SET_STATE       = b'0'
    CMD_GET_STATE       = b'1'
    CMD_DECRYPT         = b'2'
    
    def __init__(self, port, baudrate=115_200, timeout=1):
        self.ser = serial.Serial(port, baudrate=baudrate, timeout=timeout)
        time.sleep(2) # this is required for Arduino to properly initialize!
        
    def set_state(self, state: bytes):
        assert len(state) == 16
        self.ser.write(self.CMD_SET_STATE)
        self.ser.write(state)
        
    def get_state(self) -> bytes:
        self.ser.write(self.CMD_GET_STATE)
        return self.ser.read(16)
            
    def decrypt(self):
        self.ser.write(self.CMD_DECRYPT)