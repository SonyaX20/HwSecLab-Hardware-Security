"""
Plot data for sum vs. width and offset.
But not so useful.
"""

import json
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from scipy.interpolate import griddata
import numpy as np

data = []
for i in range(10):
    with open(f'sum_json/data_{i}.json', 'r') as f:
        data += json.load(f)

for entry in data:
    if entry['sum']:  
        entry['sum'] = int(entry['sum'], 16)
        if entry['sum'] >= 0x137a0000:
            entry['sum'] = 0
    else:
        entry['sum'] = 0

offsets = [entry['offset'] for entry in data]
widths = [entry['width'] for entry in data]
sums = [entry['sum'] for entry in data]  


grid_x, grid_y = np.mgrid[min(offsets):max(offsets):100j, min(widths):max(widths):100j]
grid_z = griddata((offsets, widths), sums, (grid_x, grid_y), method='cubic')

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
surface = ax.plot_surface(grid_x, grid_y, grid_z, cmap='viridis')

ax.set_xlabel('Offset')
ax.set_ylabel('Width')
ax.set_zlabel('Sum')
ax.set_title('Surface Plot of Sum vs. Width and Offset')

fig.colorbar(surface)
plt.show()