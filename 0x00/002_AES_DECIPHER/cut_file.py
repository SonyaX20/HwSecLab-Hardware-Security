import pickle
import os

def cut(sample_begin, sample_end):
    for i in range(40):
        file_path = f"D:/backup_for_e/0x00-files/lab-0x00/002_AES_DECIPHER/data/collected_data_{str(i+1)}.pkl"
        dec = 0

        # 从 pickle 文件中加载数据
        with open(file_path, 'rb') as file:
            data = pickle.load(file)

        # 裁剪
        for entry in data:
            trace_array = entry['power_trace']
            entry['power_trace'] = trace_array[sample_begin:sample_end]

        # 将修改后的数据保存回 pickle 文件
        file_path = f"D:/backup_for_e/0x00-files/lab-0x00/002_AES_DECIPHER/data_modified_{sample_begin}_{sample_end}"
        if not os.path.exists(file_path):
            os.makedirs(file_path)
        with open(file_path+"/collected_data_"+str(i+1)+".pkl", 'wb') as file:
            pickle.dump(data, file)

def check(sample_begin, sample_end):
    for i in range(40):
        file_path = f"D:/backup_for_e/0x00-files/lab-0x00/002_AES_DECIPHER/data_modified_{sample_begin}_{sample_end}/collected_data_{str(i+1)}.pkl"
        with open(file_path, 'rb') as file:
            data = pickle.load(file)
        
        for j, entry in enumerate(data):
            import pdb; pdb.set_trace()
            print(entry['power_trace'])
            if len(entry['power_trace']) != 6000:
                print(f"{i,j}...")
        #     print(f"{i}th, len[cipher]:{len(entry['ciphertext'])}, len[trace]:{len(entry['power_trace'])}")

cut(18000,21000)
print('finished')
cut(20000,23000)
print('finished')
cut(22000,25000)
print('finished')
cut(24000,27000)

# check(18000,21000)

    