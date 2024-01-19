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
    # Implement your logic to generate a random plaintext
    # For simplicity, let's assume plaintext is a 16-byte value
    return bytes([random.randint(0, 255) for _ in range(16)])
                    
if __name__ == "__main__":
    N = 4000  # Adjust the value of N as needed
    encipher = EncipherAPI(port='COM3')  # Change port as needed
    scope = open_scope()  # Open the scope
    
    # Assuming the scope setup is done outside of this script
    # Make sure the vertical resolution, horizontal resolution, and trigger setup are configured correctly

    collect_power_traces(encipher, scope, N)

    # Optionally, plot the power traces for visualization
    # scope.plot_channel(1)  # Assuming channel 1, adjust if needed