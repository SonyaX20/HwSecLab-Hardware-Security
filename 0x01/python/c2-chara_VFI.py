"""
Use the "S" operation to test the glitcher.
Collect data to characterize VFI.
"""

from glitch_ctrl import GlitchController, TriggerConfiguration
from dut import DuT
from time import sleep
import json
from random import randint

def save_data(data,i):
# Save data to a JSON file
    with open(f'data_{i}.json', 'w') as json_file:
        json.dump(data, json_file)

# Initialize devices
dut = DuT()
dut.reset()
glitcher = GlitchController()
edge = TriggerConfiguration.TRIGGER_EXTERNAL_FALLING_EDGE

# List to store data
data = []

# Main loop
for i in range(50, 100):
    for j in range(50, 100):
        glitcher.reset()
        glitcher.pulse_offset = i
        glitcher.pulse_width = j
        glitcher.trigger_on = edge
        sum_value = dut.read_sum()
        print(f" offset:{i} width:{j} sum:{sum_value}")

        # Add data to the list
        data.append({
            "offset": i,
            "width": j,
            "sum": sum_value.hex()
        })
    save_data(data,i-50)
    data =[ ]

