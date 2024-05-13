"""
Use scope_api.py in combination with the encipher_api.py to record and extract N Power Traces automatically.
Don’t forget that power traces need to be stored with some context for later analysis (i.e. input and output).
The procedure of collecting N power traces goes as:
	1. Keep the configuration (vertical resolution, horizontal resolution and trigger setup) from the previous subtask
	2. Do the following N times:
		a. Generate uniformly random distributed plaintext
		b. Set the plaintext (encipher_api.py)
		c. Arm the scope (scope_api.py)
		d. Request encryption (encipher_api.py)
		e. Wait until the scope gets triggered (scope_api.py)
		f. Download the Power Trace (scope_api.py)
		g. Request ciphertext (encipher_api.py)
	3. Store all triples of (plaintexts, ciphertexts, power traces) for later analysis.
	For this, chose an arbitrary format you like to work with.
	If you cannot think about something reasonable, you could, e.g., refer to Python’s pickle library.
	After serializing also attempt to deserialize to make sure you have stored the correct data.
"""

import time
import random
from encipher_api import EncipherAPI
from scope_api import open_scope
import pickle

all_data = []
file_index = 61

def store_data(plaintext, ciphertext, power_trace):
    data = {
        'plaintext': plaintext,
        'ciphertext': ciphertext,
        'power_trace': power_trace
    }
    all_data.append(data)

def save_collected_data():
    global file_index
    with open('lab-0x00/001_AES_ENCIPHER/data/collected_data_'+str(file_index)+'.pkl', 'wb') as file:
        pickle.dump(all_data, file)
    file_index += 1
    all_data.clear()

def collect_power_traces(encipher, scope, N):
    for _  in range(N):
        try:
            # Generate uniformly random distributed plaintext
            plaintext = generate_random_plaintext()

            # Set the plaintext using EncipherAPI
            encipher.set_state(plaintext)

            # Arm the scope
            scope.arm()

            # Request ciphertext
            encipher.encrypt()

            # Wait until the scope gets triggered
            while not scope.triggered():
                time.sleep(0.1)  # Add a short delay to avoid busy-waiting

            # Download the Power Trace
            power_trace = scope.get_samples(channel=1)  # Assuming channel 1, adjust if needed
            #get ciphertext
            ciphertext = encipher.get_state()

            plaintext_bytes = list(plaintext)
            ciphertext_bytes = list(ciphertext)
            # Store the power trace along with plaintext and ciphertext for later analysis
            store_data(plaintext_bytes, ciphertext_bytes, power_trace)

            if (_+1) % 100 == 0:
                save_collected_data()
        
        except Exception as e:
            print(e)

def generate_random_plaintext():
    return bytes([random.randint(0, 255) for _ in range(16)])
                    
if __name__ == "__main__":
    N = 4000  # Adjust the value of N as needed
    encipher = EncipherAPI(port='COM3')  # Change port as needed
    scope = open_scope()  # Open the scope
    collect_power_traces(encipher, scope, N)
