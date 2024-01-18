import time
import random
from encipher_api import EncipherAPI
from scope_api import open_scope, arm, triggered, get_samples, plot_channel
import pickle

all_data = []

def store_data(plaintext, ciphertext, power_trace):
    data = {
        'plaintext': plaintext,
        'ciphertext': ciphertext,
        'power_trace': power_trace
    }
    all_data.append(data)

def save_collected_data():
    with open('collected_data.pkl', 'wb') as file:
        pickle.dump(all_data, file)

def collect_power_traces(encipher, scope, N):
    for _ in range(N):
        # Generate uniformly random distributed plaintext
        plaintext = generate_random_plaintext()

        # Set the plaintext using EncipherAPI
        encipher.set_state(plaintext)

        # Arm the scope
        scope.arm()

        # Request ciphertext
        encipher.encrypt()

        # Wait until the scope gets triggered
        while scope.triggered():
            time.sleep(0.1)  # Add a short delay to avoid busy-waiting

        # Download the Power Trace
        power_trace = scope.get_samples(channel=1)  # Assuming channel 1, adjust if needed

        #get ciphertext
        ciphertext = encipher.get_state()

        plaintext_bytes = list(plaintext)
        ciphertext_bytes = list(ciphertext)
        # Store the power trace along with plaintext and ciphertext for later analysis
        store_data(plaintext_bytes, ciphertext_bytes, power_trace)
        
    save_collected_data()

def generate_random_plaintext():
    # Implement your logic to generate a random plaintext
    # For simplicity, let's assume plaintext is a 16-byte value
    return bytes([random.randint(0, 255) for _ in range(16)])
                    
if __name__ == "_main_":
    N = 10  # Adjust the value of N as needed
    encipher = EncipherAPI(port='/dev/ttyUSB0')  # Change port as needed
    scope = open_scope()  # Open the scope
    
    # Assuming the scope setup is done outside of this script
    # Make sure the vertical resolution, horizontal resolution, and trigger setup are configured correctly

    collect_power_traces(encipher, scope, N)

    # Optionally, plot the power traces for visualization
    plot_channel(scope, channel=1)  # Assuming channel 1, adjust if needed