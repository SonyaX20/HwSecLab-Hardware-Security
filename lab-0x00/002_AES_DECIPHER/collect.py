import time
import random
from decipher_api import DecipherAPI
from scope_api import open_scope
import pickle

all_data = []
file_index = 1

def store_data(plaintext, ciphertext, power_trace):
    data = {
        'plaintext': plaintext,
        'ciphertext': ciphertext,
        'power_trace': power_trace
    }
    all_data.append(data)

def save_collected_data():
    global file_index
    with open('./data/collected_data_'+str(file_index)+'.pkl', 'wb') as file:
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

            if (_+1) % 2 == 0:
                save_collected_data()
        
        except Exception as e:
            print(e)

def generate_random_plaintext():
    # Implement your logic to generate a random plaintext
    # For simplicity, let's assume plaintext is a 16-byte value
    return bytes([random.randint(0, 255) for _ in range(16)])
                    
if __name__ == "__main__":
    N = 10  # Adjust the value of N as needed
    decipher = DecipherAPI(port='/dev/tty.usbmodem14301')  # Change port as needed
    scope = open_scope()  # Open the scope
    
    # Assuming the scope setup is done outside of this script
    # Make sure the vertical resolution, horizontal resolution, and trigger setup are configured correctly

    collect_power_traces(decipher, scope, N)

    # Optionally, plot the power traces for visualization
    # scope.plot_channel(1)  # Assuming channel 1, adjust if needed