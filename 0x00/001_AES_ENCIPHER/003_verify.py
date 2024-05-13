import pickle
import matplotlib.pyplot as plt
import matplotlib
import os
matplotlib.use('TkAgg')


# Assuming you have stored the data in a file named 'stored_data.pkl'
def load_data():
    try:
        with open('data\collected_data_1.pkl', 'rb') as file:
            loaded_data = pickle.load(file)
        return loaded_data
    except FileNotFoundError:
        print("Error: File 'stored_data.pkl' not found.")
        return []

def plot_all_power_traces(all_data):
    num_traces = len(all_data)
    if num_traces == 0:
        print("No data to plot.")
        return

    # Determine the number of rows and columns for subplots
    rows = int(num_traces**0.5)
    cols = (num_traces // rows) + (1 if num_traces % rows != 0 else 0)

    # Create subplots
    fig, axes = plt.subplots(rows, cols, figsize=(10, 8))
    fig.suptitle('Power Trace Plots')

    # Flatten the axes array in case there is only one row or column
    axes = axes.flatten()

    for i, data in enumerate(all_data):
        power_trace = data.get('power_trace', [])
        if power_trace:
            # Plot power trace in the ith subplot
            axes[i].plot(power_trace)
            axes[i].set_title(f'Trace {i+1}')
            axes[i].set_xlabel('Sample Number')
            axes[i].set_ylabel('Power Value')
        else:
            print(f"Warning: Power trace not found for data {i+1}.")

    # Adjust layout to prevent overlap of titles and labels
    plt.tight_layout(rect=[0, 0.03, 1, 0.95])

    # Show the plots
    plt.show()

def save_power_trace_plot(power_trace, index):
    plt.plot(power_trace)
    plt.title(f'Power Trace Plot - Trace {index+1}')
    plt.xlabel('Sample Number')
    plt.ylabel('Power Value')
    
    # Create a folder named 'plots' to save the images
    if not os.path.exists('plots'):
        os.makedirs('plots')

    # Save the plot as an image file (e.g., PNG)
    plt.savefig(f'plots/trace_{index+1}.png')

    # Clear the plot for the next iteration
    plt.clf()

    

try:
    # Load the stored data
    all_data = load_data()

    # Plot all power traces in subplots
    # plot_all_power_traces(all_data)

    # Iterate through the loaded data and save each power trace plot
    for i, data in enumerate(all_data):
        power_trace = data.get('power_trace', [])
        if power_trace:
            save_power_trace_plot(power_trace, i)
        else:
            print(f"Warning: Power trace not found for data {i+1}.")
except KeyboardInterrupt:
        print("Script terminated by user.")