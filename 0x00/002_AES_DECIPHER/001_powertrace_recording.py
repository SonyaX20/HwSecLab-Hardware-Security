"""
Use scope_api.py in combination with the decipher_api.py to record and record N Power Traces automatically.
Don’t forget that power traces need to be stored with some context for later analysis (i.e. input and output).
The procedure of collecting N power traces goes as:
	4. Keep the configuration (vertical resolution, horizontal resolution and trigger setup) from the previous subtask
	5. Do the following N times:
		a. Generate uniformly random distributed ciphertext
		b. Set the ciphertext (decipher_api.py)
		c. Arm the scope (scope_api.py)
		d. Request decryption (decipher_api.py)
		e. Wait until the scope gets triggered (scope_api.py)
		f. Download the Power Trace (scope_api.py)
		g. Request plaintext (decipher_api.py)
	6. Store all triples of (plaintexts, ciphertexts, power traces) for later analysis.
	For this, chose an arbitrary format you like to work with.
	If you cannot think about something reasonable, you could, e.g., refer to Python’s pickle library.
	After serializing also attempt to deserialize to make sure you have stored the correct data.
"""

import time
import random
from decipher_api import DecipherAPI
from scope_api import open_scope
import pickle

all_data = []
file_index = 28

def store_data(plaintext, ciphertext, power_trace):
    data = {
        'plaintext': plaintext,
        'ciphertext': ciphertext,
        'power_trace': power_trace
    }
    all_data.append(data)

def save_collected_data():
    global file_index
    with open('data/collected_data_'+str(file_index)+'.pkl', 'wb') as file:
        pickle.dump(all_data, file)
    file_index += 1
    all_data.clear()

def collect_power_traces(decipher, scope, N):
    for _  in range(N):
        try:
            # Generate uniformly random distributed plaintext
            ciphertext = generate_random_plaintext()

            # Set the plaintext using EncipherAPI
            decipher.set_state(ciphertext)

            # Arm the scope
            scope.arm()

            # Request ciphertext
            decipher.decrypt()

            # Wait until the scope gets triggered
            while not scope.triggered():
                time.sleep(0.1)  # Add a short delay to avoid busy-waiting

            # Download the Power Trace
            power_trace = scope.get_samples(channel=1)  # Assuming channel 1, adjust if needed
            #get ciphertext
            plaintext = decipher.get_state()

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
    N = 2300  # Adjust the value of N as needed
    decipher = DecipherAPI(port='COM4')  # Change port as needed
    scope = open_scope()  # Open the scope
    
    collect_power_traces(decipher, scope, N)