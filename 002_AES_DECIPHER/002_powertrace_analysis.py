import pickle
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from datetime import datetime

matplotlib.use('TkAgg')
import os

# for i'th key-byte, select the right position in a trace
group = {0:18000,
         1:20000,
         2:22000,
         3:24000}

TRACE_NUM = 3600 # total num. of traces(some records are somehow damaged, so instead of 4000 there are only 36000)
SAMPLE_NUM = 3000 # num of sample points in a plot
BLOCK_NUM = 16 # num of blocks in a state
KEY_GUESS_NUM =256 # num of hypothetic keys
FILE_NUM = 40 # num of collected files

key_cur = -1 
SAMPLE_BEGIN = -1

reverse_aes_sbox = np.array([
    [0x52, 0x09, 0x6a, 0xd5, 0x30, 0x36, 0xa5, 0x38, 0xbf, 0x40, 0xa3, 0x9e, 0x81, 0xf3, 0xd7, 0xfb],
    [0x7c, 0xe3, 0x39, 0x82, 0x9b, 0x2f, 0xff, 0x87, 0x34, 0x8e, 0x43, 0x44, 0xc4, 0xde, 0xe9, 0xcb],
    [0x54, 0x7b, 0x94, 0x32, 0xa6, 0xc2, 0x23, 0x3d, 0xee, 0x4c, 0x95, 0x0b, 0x42, 0xfa, 0xc3, 0x4e],
    [0x08, 0x2e, 0xa1, 0x66, 0x28, 0xd9, 0x24, 0xb2, 0x76, 0x5b, 0xa2, 0x49, 0x6d, 0x8b, 0xd1, 0x25],
    [0x72, 0xf8, 0xf6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xd4, 0xa4, 0x5c, 0xcc, 0x5d, 0x65, 0xb6, 0x92],
    [0x6c, 0x70, 0x48, 0x50, 0xfd, 0xed, 0xb9, 0xda, 0x5e, 0x15, 0x46, 0x57, 0xa7, 0x8d, 0x9d, 0x84],
    [0x90, 0xd8, 0xab, 0x00, 0x8c, 0xbc, 0xd3, 0x0a, 0xf7, 0xe4, 0x58, 0x05, 0xb8, 0xb3, 0x45, 0x06],
    [0xd0, 0x2c, 0x1e, 0x8f, 0xca, 0x3f, 0x0f, 0x02, 0xc1, 0xaf, 0xbd, 0x03, 0x01, 0x13, 0x8a, 0x6b],
    [0x3a, 0x91, 0x11, 0x41, 0x4f, 0x67, 0xdc, 0xea, 0x97, 0xf2, 0xcf, 0xce, 0xf0, 0xb4, 0xe6, 0x73],
    [0x96, 0xac, 0x74, 0x22, 0xe7, 0xad, 0x35, 0x85, 0xe2, 0xf9, 0x37, 0xe8, 0x1c, 0x75, 0xdf, 0x6e],
    [0x47, 0xf1, 0x1a, 0x71, 0x1d, 0x29, 0xc5, 0x89, 0x6f, 0xb7, 0x62, 0x0e, 0xaa, 0x18, 0xbe, 0x1b],
    [0xfc, 0x56, 0x3e, 0x4b, 0xc6, 0xd2, 0x79, 0x20, 0x9a, 0xdb, 0xc0, 0xfe, 0x78, 0xcd, 0x5a, 0xf4],
    [0x1f, 0xdd, 0xa8, 0x33, 0x88, 0x07, 0xc7, 0x31, 0xb1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xec, 0x5f],
    [0x60, 0x51, 0x7f, 0xa9, 0x19, 0xb5, 0x4a, 0x0d, 0x2d, 0xe5, 0x7a, 0x9f, 0x93, 0xc9, 0x9c, 0xef],
    [0xa0, 0xe0, 0x3b, 0x4d, 0xae, 0x2a, 0xf5, 0xb0, 0xc8, 0xeb, 0xbb, 0x3c, 0x83, 0x53, 0x99, 0x61],
    [0x17, 0x2b, 0x04, 0x7e, 0xba, 0x77, 0xd6, 0x26, 0xe1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0c, 0x7d]
], dtype=np.uint8)

def lookup(byte):
    x = byte >> 4
    y = byte & 15
    return reverse_aes_sbox[x,y]

def inverse_shift_rows(state):
    """Apply the Inverse Shift Rows operation to the state."""
    return np.array([state[i] for i in [0, 13, 10, 7, 4, 1, 14, 11, 8, 5, 2, 15, 12, 9, 6, 3]])

def get_hamming_weight(byte):
    """Return the Hamming weight of the given byte."""
    # print(byte)
    res = bin(byte).count('1')
    # print(res)
    return res

def calculate_pearson_coefficient(trace_set1, trace_set2):
    """Calculate the Pearson correlation coefficient between two sets of traces."""
    return np.corrcoef(trace_set1, trace_set2)[0, 1]

def traces_correlation_plt(traces, key_guess, block_index):
    plt.figure(figsize=(4, 5))
    plt.plot(traces)
    plt.title(f'CPA Plot - byte:{block_index+1} - key guess:{key_guess}')
    plt.xlabel('Sample Number')
    plt.ylabel('Power Value')
    plt.ylim(-1, 1)
    cur_xticks = np.arange(0,SAMPLE_NUM+1,1000)
    plt.xticks(ticks=cur_xticks,labels=cur_xticks+SAMPLE_BEGIN)

    file_path = f'byte_{block_index}'
    if not os.path.exists(file_path):
        os.makedirs(file_path)
    plt.savefig(f"{file_path}/key_{key_guess}.png")
    plt.close()

def main():
    global key_cur, SAMPLE_BEGIN
    key_cur = int(input("give the index of the desired key-bytes(0 to 15):"))
    SAMPLE_BEGIN = group[key_cur % 4]

    '''read data from files'''
    # initialize
    collected_data = []
    key_res = np.zeros((BLOCK_NUM,KEY_GUESS_NUM),dtype=np.float32)

    ciphertext_range = np.zeros((TRACE_NUM,BLOCK_NUM),dtype=np.uint8)
    traces = np.zeros((TRACE_NUM,SAMPLE_NUM),dtype=np.float32)

    pos = 0
    for i in range(FILE_NUM):        
        # skip the defect files
        if i == 7 or i == 11 or i == 12 or i == 18:
            continue
        
        file_path = f"D:/backup_for_e/0x00-files/lab-0x00/002_AES_DECIPHER/data_modified_{SAMPLE_BEGIN}_{SAMPLE_BEGIN+SAMPLE_NUM}/collected_data_{str(i+1)}.pkl"
        with open(file_path, 'rb') as file:
            collected_data = pickle.load(file)
        
        for j, entry in enumerate(collected_data):
            ciphertext_range[pos*100+j,:]=entry['ciphertext']
            traces[pos*100+j,:]=entry['power_trace']
        collected_data.clear()
        pos += 1
    
    '''remark'''
    t = datetime.now()
    print(f'[{t.strftime("%H:%M:%S")}] finish reading collected data...')
    
    # Generate all possible key guesses as bytes
    key_guess_range = np.arange(KEY_GUESS_NUM)
    key_guess_range_bytes = key_guess_range.astype(np.uint8)
    
    # CPA process
    for key_guess in key_guess_range_bytes:
        '''remark...'''
        t = datetime.now()
        print(f'[{t.strftime("%H:%M:%S")}] start processing key guess: {key_guess}...')
        hamming_power = np.zeros((TRACE_NUM,KEY_GUESS_NUM))

        # Calculate Hamming weight for each byte in the S-box lookup
        for i, ciphertext in enumerate(ciphertext_range):
            # Apply Inverse Shift Rows
            addroundkey_res = np.bitwise_xor(ciphertext.astype(np.uint8), key_guess)
            state = inverse_shift_rows(addroundkey_res)
            s_box_lookup = lookup(state)
            
            for j in range(key_cur,key_cur+1):
                hw_res = get_hamming_weight(s_box_lookup[j])
                hamming_power[i,j] = hw_res

        # Process actual power array for each data point
        traces = traces.astype(np.float64)
        for block in range(key_cur,key_cur+1):
            # Calculate Pearson coefficient between actual power and Hamming power
            trace_res = [0]*SAMPLE_NUM
            for sample_point in range(SAMPLE_NUM):
                trace_res[sample_point] = calculate_pearson_coefficient(traces.T[sample_point], hamming_power.T[block])
            
            traces_correlation_plt(trace_res, key_guess, block)
            key_res[block,key_guess] = max(trace_res)

        '''remark...'''
        t = datetime.now()
        print(f'[{t.strftime("%H:%M:%S")}] +++ finish corr. calculation...')
    
    # select the max trace
    max_trace_index = hex(np.argmax(key_res[key_cur,:]))
    print(f"{key_cur+1}st key-byte: {max_trace_index}.")
    with open(f"result.txt",'a') as f:
        f.write(f"{key_cur+1}th key-byte: {max_trace_index}.\n")

if __name__ == "__main__":
    main()


