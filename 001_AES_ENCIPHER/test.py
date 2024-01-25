import pickle
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from datetime import datetime

matplotlib.use('TkAgg')
import os

SBOX = np.array([
    [0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76],
    [0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0],
    [0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15],
    [0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75],
    [0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84],
    [0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf],
    [0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8],
    [0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2],
    [0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73],
    [0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb],
    [0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79],
    [0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08],
    [0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a],
    [0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e],
    [0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf],
    [0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16]
])
block_index = 5

def last_significant_bit(value):
    return value & 0b1

def lookup(byte):
    x = byte >> 4
    y = byte & 15
    return SBOX[x][y]

def plaintext_LSB_trace_clf(trace, plaintext, subset, hyp_key):
    s_box_lookup = lookup(plaintext[block_index] ^ hyp_key)
    if last_significant_bit(s_box_lookup) == 1:
        subset['subset1'].append(trace)
    else:
        subset['subset0'].append(trace)

def traces_difference_plt(traces_difference_set, hyp_key, save):
    plt.plot(traces_difference_set)
    plt.title(f'DPA Plot - hypothetic key: {hyp_key}')
    plt.xlabel('Sample Number')
    plt.ylabel('Power Value')
    plt.ylim(-0.025, 0.025)

    file_path = f'byte_{block_index}/plots/trace_{hyp_key}.png'
    if not os.path.exists(file_path.split('/')[0] + '/' + file_path.split('/')[1]):
        os.makedirs(file_path.split('/')[0] + '/' + file_path.split('/')[1])
    if save:
        plt.savefig(file_path)
    else:
        plt.show()
    plt.clf()

def get_average(trace_set):
    lens = len(trace_set)
    aves = np.sum(trace_set, axis=0) / lens
    return aves

def read_collected_data(file_index):
    with open(f'D:/backup_for_e/zabc_lab0/001_AES_ENCIPHER/data/collected_data_{file_index}.pkl', 'rb') as file:
        collected_data = pickle.load(file)
    plaintexts = np.array([entry['plaintext'] for entry in collected_data])
    traces = np.array([entry['power_trace'] for entry in collected_data])
    return plaintexts, traces

def write_ave_for_key_byte(hyp_key, lsb, ave_sub):
    file_path = f'byte_{block_index}/key_{hyp_key}.pkl'
    if not os.path.exists(file_path.split('/')[0]):
        os.makedirs(file_path.split('/')[0])
    with open(file_path, 'ab') as f:
        pickle.dump({'trace': ave_sub, 'lsb': lsb}, f)

def read_ave_for_key_byte(hyp_key):
    a0, a1 = [], []
    file_path = f'byte_{block_index}/key_{hyp_key}.pkl'
    with open(file_path, 'rb') as f:
        while True:
            try:
                data = pickle.load(f)
                if data['lsb'] == 0:
                    a0.append(data['trace'])
                elif data['lsb'] == 1:
                    a1.append(data['trace'])
            except EOFError:
                break
    return a0, a1

def del_file(hyp_key):
    try:
        os.remove(f'byte_{block_index}/key_{hyp_key}.pkl')
    except FileNotFoundError:
        print(f"file not exist...")
    except Exception as e:
        print(f"error:{e}...")

def main():
    ave_sub0, ave_sub1 = [], []
    subset = {'subset0': [], 'subset1': []}

    try:
        for file_index in range(1, 101):
            plaintexts, traces = read_collected_data(file_index)

            for hyp_key in range(256):
                for plaintext, trace in zip(plaintexts, traces):
                    plaintext_LSB_trace_clf(trace, plaintext, subset, hyp_key)

                write_ave_for_key_byte(hyp_key, 0, get_average(subset['subset0']))
                write_ave_for_key_byte(hyp_key, 1, get_average(subset['subset1']))
                subset['subset0'].clear()
                subset['subset1'].clear()

            t = datetime.now()
            print(f'[{t.strftime("%H:%M:%S")}] end processing file_{file_index}...')

        print(f'[{t.strftime("%H:%M:%S")}] end collecting average...')

        key_res, max_val = -1, -1
        for hyp_key in range(256):
            ave_sub0, ave_sub1 = read_ave_for_key_byte(hyp_key)
            _ave_sub0 = get_average(ave_sub0)
            _ave_sub1 = get_average(ave_sub1)

            difference = _ave_sub0 - _ave_sub1
            ave_sub0.clear()
            ave_sub1.clear()
            del_file(hyp_key)

            traces_difference_plt(difference, hyp_key, 1)
            tmp = np.max(difference)
            if tmp > max_val:
                key_res, max_val = hyp_key, tmp
            print(f'[{t.strftime("%H:%M:%S")}] end for key-byte:{block_index}; key-guess:{hyp_key}...')

        with open(f'result.txt', 'a') as f:
            f.write(f"the {block_index}th key: {key_res}.\n")
    except KeyboardInterrupt:
        return

if __name__ == '__main__':
    main()

