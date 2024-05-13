"""
Try with simple operation like "A" to test the dut
"""
from dut import DuT
from time import sleep
import time

dut = DuT()
dut.reset()

while True:
    dut.authorize(b"1234567890123456789012345678901234567890123456789012345678901234")
    sleep(0.5)
    if(dut.authorized):
        time_stamp = time.time()
        print(time_stamp)
    print(dut.authorized)






