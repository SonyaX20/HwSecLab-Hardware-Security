import time
import random
from decipher_api import DecipherAPI  # Assuming a new module for decryption
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

def collect_power_traces(decipher, scope, N):
    for _ in range(N):
        # Generate uniformly random distributed ciphertext
        ciphertext = generate_random_ciphertext()

        # Set the ciphertext using DecipherAPI
        decipher.set_state(ciphertext)

        # Arm the scope
        scope.arm()

        # Request decryption
        decipher.decrypt()

        # Wait until the scope gets triggered
        while scope.triggered():
            time.sleep(0.1)  # Add a short delay to avoid busy-waiting

        # Download the Power Trace
        power_trace = scope.get_samples(channel=1)  # Assuming channel 1, adjust if needed

        # Request plaintext
        plaintext = decipher.get_state()

        ciphertext_bytes = list(ciphertext)
        plaintext_bytes = list(plaintext)

        # Store the power trace along with plaintext and ciphertext for later analysis
        store_data(plaintext_bytes, ciphertext_bytes, power_trace)

    save_collected_data()

def generate_random_ciphertext():
    # Implement your logic to generate a random ciphertext
    # For simplicity, let's assume ciphertext is a 16-byte value
    return bytes([random.randint(0, 255) for _ in range(16)])

if __name__ == "_main_":
    N = 10  # Adjust the value of N as needed
    decipher = DecipherAPI(port='/dev/ttyUSB0')  # Change port as needed
    scope = open_scope()  # Open the scope

    # Assuming the scope setup is done outside of this script
    # Make sure the vertical resolution, horizontal resolution, and trigger setup are configured correctly

    collect_power_traces(decipher, scope, N)

    # Optionally, plot the power traces for visualization
    plot_channel(scope, channel=1)  # Assuming channel 1, adjust if needed