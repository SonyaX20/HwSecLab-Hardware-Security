import time
# from matplotlib import pyplot as plt
from scope_api import open_scope
from square_and_multiply_api import SquareAndMultiplyAPI
import csv
"""
use square_and_multiply_api.py from this script.

You are now asked to write a script which asks the Device under Test to perform Modular Exponentiation (MODEXP) over and over again, with a given sleep period in between.
While executing this script:
	1. Set the scope’s trigger to Channel-2 (PC0).
	2. Set the horizontal resolution (time/division) such that you observe the whole MODEXP computation
	3. Set the vertical resolution (volts/division) such that the Power Trace spreads as much of the vertical axis as possible, without losing any information (i.e. without cutoff).
"""
SLEEP_PERIOD = 0.5  # 单位：秒
CHANNEL = 0

def perform_modexp_continuously(scope, modexp_api: SquareAndMultiplyAPI, sleep_period: int):
    try:
        modexp_api.modexp()
        time.sleep(SLEEP_PERIOD)
    except KeyboardInterrupt:
        print("Script terminated by user.")

def main():
    scope = open_scope()
    modexp_api = SquareAndMultiplyAPI(port="/dev/tty.usbmodem14301")  # Replace with the correct port
    sleep_period = 5  # Adjust the sleep period as needed
    while True:
        perform_modexp_continuously(scope, modexp_api, sleep_period)
    
if __name__ == '__main__':
    main()
