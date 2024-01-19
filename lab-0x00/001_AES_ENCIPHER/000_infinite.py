"""
Same as with SPA, this task serves to configure the oscilloscope’s parameters correctly, such that Differential/Correlation Power Analysis attacks can be successfully mounted.
For this, Channel-1 should be AC coupled to the signal from the High-Side Shunt resistor, whereas Channel-2 should be connected to the Trigger (it’s PC0, again).

You are now asked to write a script which asks the Device under Test to perform AES Encryptions over and over again, with a given sleep period in between.
While executing this script:
	1. Set the scope’s trigger to Channel-2 (PC0).
	2. Set the horizontal resolution (time/division) such that you observe the whole AES Encryption
	3. Set the vertical resolution (volts/division) such that the Power Trace spreads as much of the vertical axis as possible, without losing any information (i.e. without cutoff).

You have now successfully setup the vertical resolution as well as the trigger for the second task.
The horizontal resolution has been set to cover full AES, however, this is not necessary and we are going to refine it.
"""
import time
import random
from encipher_api import EncipherAPI

all_data = []


def collect_power_traces_infinite(encipher):
    while True:
        # Generate uniformly random distributed plaintext
        plaintext = generate_random_plaintext()
        
        # Set the plaintext using EncipherAPI
        encipher.set_state(plaintext)
        # Request ciphertext
        encipher.encrypt()
        
        time.sleep(0.1)

def generate_random_plaintext():
    # Implement your logic to generate a random plaintext
    # For simplicity, let's assume plaintext is a 16-byte value
    return bytes([random.randint(0, 255) for _ in range(16)])
                    
if __name__ == "__main__":
    N = 10  # Adjust the value of N as needed
    encipher = EncipherAPI(port='/dev/tty.usbmodem14101')  # Change port as needed
    
    # Assuming the scope setup is done outside of this script
    # Make sure the vertical resolution, horizontal resolution, and trigger setup are configured correctly
    
    collect_power_traces_infinite(encipher)
