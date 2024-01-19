def gen_s_box():
    s_box = [0] * 256

    p = q = 1
    while True:
        p = p ^ (p << 1) ^ (0x11B if p & 0x80 else 0)
        p &= 0xFF

        q ^= (q << 1)
        q ^= (q << 2)
        q ^= (q << 4)
        q ^= (0x09 if q & 0x80 else 0)
        q &= 0xFF

        s = (q << 1) ^ q
        s ^= (s << 1) ^ q
        s ^= (s << 2) ^ q
        s ^= (s << 4) ^ q
        s ^= (p & 0xFF)

        s_box[p] = s
        if p == 1:
            break

    s_box[0] = 0x63  # 0x63 is the affine constant
    return s_box

rijndael_s_box = gen_s_box()

# Print the generated Rijndael S-Box
for i in range(16):
    row = [f"{val:02X}" for val in rijndael_s_box[i * 16 : (i + 1) * 16]]
    print(" ".join(row))