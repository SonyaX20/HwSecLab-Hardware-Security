import time
from matplotlib import pyplot as plt
from scope_api import Scope
from square_and_multiply_api import SquareAndMultiplyAPI
"""
use square_and_multiply_api.py from this script.

You are now asked to write a script which asks the Device under Test to perform Modular Exponentiation (MODEXP) over and over again, with a given sleep period in between.
While executing this script:
	1. Set the scope’s trigger to Channel-2 (PC0).
	2. Set the horizontal resolution (time/division) such that you observe the whole MODEXP computation
	3. Set the vertical resolution (volts/division) such that the Power Trace spreads as much of the vertical axis as possible, without losing any information (i.e. without cutoff).
"""
SLEEP_PERIOD = 2  # 单位：秒

def perform_modexp_continuously(scope: Scope, modexp_api: SquareAndMultiplyAPI, sleep_period: int):
    try:
        while True:
            modexp_api.modexp()
            scope.arm()
            while not scope.triggered():
                time.sleep(0.1)
            scope.plot_channel(1)  # Assuming you want to plot data from channel 1
            time.sleep(sleep_period)
    except KeyboardInterrupt:
        print("Script terminated by user.")

def main():
    scp = Scope()
    scope = scp.open_scope()
    modexp_api = SquareAndMultiplyAPI(port="COM1")  # Replace with the correct port
    sleep_period = 5  # Adjust the sleep period as needed
    perform_modexp_continuously(scope, modexp_api, sleep_period)
    
if __name__ == '__main__':
    main()
