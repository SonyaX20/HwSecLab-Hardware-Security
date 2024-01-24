"""
Perform Differential Power Analysis to disclose the secret key based on the power traces you recorded, as discussed in the lecture.
Do not forget to annotate your implementation with comments and describe what you have been doing in the lab report.
Plots depicting your analysis must be included in the Lab report.
"""
import pickle
import matplotlib
import matplotlib.pyplot as plt
matplotlib.use('TkAgg')
import os
from datetime import datetime
'''
manual parameters: block index, hypothetic key's range
'''
SBOX = [
    [int('63', 16), int('7c', 16), int('77', 16), int('7b', 16), int('f2', 16), int('6b', 16), int('6f', 16), int('c5', 16), int(
        '30', 16), int('01', 16), int('67', 16), int('2b', 16), int('fe', 16), int('d7', 16), int('ab', 16), int('76', 16)],
    [int('ca', 16), int('82', 16), int('c9', 16), int('7d', 16), int('fa', 16), int('59', 16), int('47', 16), int('f0', 16), int(
        'ad', 16), int('d4', 16), int('a2', 16), int('af', 16), int('9c', 16), int('a4', 16), int('72', 16), int('c0', 16)],
    [int('b7', 16), int('fd', 16), int('93', 16), int('26', 16), int('36', 16), int('3f', 16), int('f7', 16), int('cc', 16), int(
        '34', 16), int('a5', 16), int('e5', 16), int('f1', 16), int('71', 16), int('d8', 16), int('31', 16), int('15', 16)],
    [int('04', 16), int('c7', 16), int('23', 16), int('c3', 16), int('18', 16), int('96', 16), int('05', 16), int('9a', 16), int(
        '07', 16), int('12', 16), int('80', 16), int('e2', 16), int('eb', 16), int('27', 16), int('b2', 16), int('75', 16)],
    [int('09', 16), int('83', 16), int('2c', 16), int('1a', 16), int('1b', 16), int('6e', 16), int('5a', 16), int('a0', 16), int(
        '52', 16), int('3b', 16), int('d6', 16), int('b3', 16), int('29', 16), int('e3', 16), int('2f', 16), int('84', 16)],
    [int('53', 16), int('d1', 16), int('00', 16), int('ed', 16), int('20', 16), int('fc', 16), int('b1', 16), int('5b', 16), int(
        '6a', 16), int('cb', 16), int('be', 16), int('39', 16), int('4a', 16), int('4c', 16), int('58', 16), int('cf', 16)],
    [int('d0', 16), int('ef', 16), int('aa', 16), int('fb', 16), int('43', 16), int('4d', 16), int('33', 16), int('85', 16), int(
        '45', 16), int('f9', 16), int('02', 16), int('7f', 16), int('50', 16), int('3c', 16), int('9f', 16), int('a8', 16)],
    [int('51', 16), int('a3', 16), int('40', 16), int('8f', 16), int('92', 16), int('9d', 16), int('38', 16), int('f5', 16), int(
        'bc', 16), int('b6', 16), int('da', 16), int('21', 16), int('10', 16), int('ff', 16), int('f3', 16), int('d2', 16)],
    [int('cd', 16), int('0c', 16), int('13', 16), int('ec', 16), int('5f', 16), int('97', 16), int('44', 16), int('17', 16), int(
        'c4', 16), int('a7', 16), int('7e', 16), int('3d', 16), int('64', 16), int('5d', 16), int('19', 16), int('73', 16)],
    [int('60', 16), int('81', 16), int('4f', 16), int('dc', 16), int('22', 16), int('2a', 16), int('90', 16), int('88', 16), int(
        '46', 16), int('ee', 16), int('b8', 16), int('14', 16), int('de', 16), int('5e', 16), int('0b', 16), int('db', 16)],
    [int('e0', 16), int('32', 16), int('3a', 16), int('0a', 16), int('49', 16), int('06', 16), int('24', 16), int('5c', 16), int(
        'c2', 16), int('d3', 16), int('ac', 16), int('62', 16), int('91', 16), int('95', 16), int('e4', 16), int('79', 16)],
    [int('e7', 16), int('c8', 16), int('37', 16), int('6d', 16), int('8d', 16), int('d5', 16), int('4e', 16), int('a9', 16), int(
        '6c', 16), int('56', 16), int('f4', 16), int('ea', 16), int('65', 16), int('7a', 16), int('ae', 16), int('08', 16)],
    [int('ba', 16), int('78', 16), int('25', 16), int('2e', 16), int('1c', 16), int('a6', 16), int('b4', 16), int('c6', 16), int(
        'e8', 16), int('dd', 16), int('74', 16), int('1f', 16), int('4b', 16), int('bd', 16), int('8b', 16), int('8a', 16)],
    [int('70', 16), int('3e', 16), int('b5', 16), int('66', 16), int('48', 16), int('03', 16), int('f6', 16), int('0e', 16), int(
        '61', 16), int('35', 16), int('57', 16), int('b9', 16), int('86', 16), int('c1', 16), int('1d', 16), int('9e', 16)],
    [int('e1', 16), int('f8', 16), int('98', 16), int('11', 16), int('69', 16), int('d9', 16), int('8e', 16), int('94', 16), int(
        '9b', 16), int('1e', 16), int('87', 16), int('e9', 16), int('ce', 16), int('55', 16), int('28', 16), int('df', 16)],
    [int('8c', 16), int('a1', 16), int('89', 16), int('0d', 16), int('bf', 16), int('e6', 16), int('42', 16), int('68', 16), int(
        '41', 16), int('99', 16), int('2d', 16), int('0f', 16), int('b0', 16), int('54', 16), int('bb', 16), int('16', 16)]
]
block_index = 4

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

def traces_difference_plt(traces_difference_set,hyp_key,save):
    plt.plot(traces_difference_set)
    plt.title(f'DPA Plot - hypothetic key: {hyp_key}')
    plt.xlabel('Sample Number')
    plt.ylabel('Power Value')
    plt.ylim(-0.025,0.025)

    file_path = f'byte_{block_index}/plots/trace_{hyp_key}.png' 
    if not os.path.exists(file_path.split('/')[0]+'/'+file_path.split('/')[1]):
        os.makedirs(file_path.split('/')[0]+'/'+file_path.split('/')[1])
    if save:
        plt.savefig(file_path)
    else:
        plt.show()
    plt.clf()

def get_average(trace_set):
    lens = len(trace_set)
    aves = [sum(item)/lens for item in zip(*trace_set)]
    return aves

def read_collected_data(file_index):
    with open('data/collected_data_'+str(file_index)+'.pkl', 'rb') as file:
            collected_data = pickle.load(file)
    plaintexts = [entry['plaintext'] for entry in collected_data]
    traces = [entry['power_trace'] for entry in collected_data]
    # file.close()
    return plaintexts,traces

def write_ave_for_key_byte(hyp_key:int,lsb:int,ave_sub:list):
    file_path = f'byte_{block_index}/key_{hyp_key}.pkl'
    if not os.path.exists(file_path.split('/')[0]):
        os.makedirs(file_path.split('/')[0])
    with open(file_path, 'ab') as f:
        pickle.dump({'trace':ave_sub,'lsb':lsb},f)
    # f.close()

def read_ave_for_key_byte(hyp_key:int):
    a0,a1 = [],[]
    file_path = f'byte_{block_index}/key_{hyp_key}.pkl'
    with open(file_path,'rb') as f:
        while True:
            try:
                data = pickle.load(f)
                if data['lsb'] == 0:
                    a0.append(data['trace'])
                elif data['lsb'] == 1:
                    a1.append(data['trace'])
            except EOFError:
                break
    return a0,a1
    # f.close()

def del_file(hyp_key):
    try:
        os.remove(f'byte_{block_index}/key_{hyp_key}.pkl')
    except FileNotFoundError:
        print(f"file not exist...")
    except Exception as e:
        print(f"error:{e}...")

def main():    
    ave_sub0,ave_sub1 = [],[]
    subset = {'subset0': [], 'subset1': []}

    try:
        for file_index in range(1,101): 
            plaintexts, traces = read_collected_data(file_index)

            for hyp_key in range(0,256):
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
        for hyp_key in range(0,256):
            ave_sub0,ave_sub1 = read_ave_for_key_byte(hyp_key)
            _ave_sub0 = get_average(ave_sub0)
            _ave_sub1 = get_average(ave_sub1)
            
            difference = [a - b for a, b in zip(_ave_sub0,_ave_sub1)]
            _ave_sub0.clear()
            _ave_sub1.clear()
            del_file(hyp_key)
            
            traces_difference_plt(difference,hyp_key,1)
            tmp = max(difference) 
            if tmp > max_val:
                key_res, max_val = hyp_key, tmp 
            print(f'[{t.strftime("%H:%M:%S")}] end for key-byte:{block_index}; key-guess:{hyp_key}...')
        
        with open(f'result.txt','a') as f:
            f.write(f"the {block_index}th key: {key_res}.\n")
        f.close()
    except KeyboardInterrupt:
        return

if __name__ == '__main__':
    main()

