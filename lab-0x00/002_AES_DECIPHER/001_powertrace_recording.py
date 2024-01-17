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

def main():
    pass

if __name__ == '__main__':
    main()
