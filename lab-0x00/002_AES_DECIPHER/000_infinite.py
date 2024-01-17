"""
Similar to before, this task is dedicated to configuring the oscilloscope’s parameters correctly, such that Correlation Power Analysis attacks can be successfully mounted.
For this, Channel-1 should be AC coupled to the signal from the High-Side Shunt resistor, whereas Channel-2 should be connected to the Trigger (it’s PC0, again).
You are now asked to write a script which asks the Device under Test tocperform AES Decryptions over and over again, with a given sleep period incbetween.
While executing this script:
	1. Set the scope’s trigger to Channel-2 (PC0).
	2. Set the horizontal resolution (time/division) such that you observe the whole AES Decryption
	3. Set the vertical resolution (volts/division) such that the Power Trace spreads as much of the vertical axis as possible, without losing any information (i.e. without cutoff).

You have now successfully setup the vertical resolution as well as the trigger for the third subtask.
The horizontal resolution has been set to cover full AES decryption. 
However, this is not necessary and we are going to refine it.
"""

def main():
    pass

if __name__ == '__main__':
    main()
