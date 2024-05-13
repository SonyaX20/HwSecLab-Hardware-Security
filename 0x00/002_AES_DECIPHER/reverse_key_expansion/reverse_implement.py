from aeskeyschedule import reverse_key_schedule
base_key = reverse_key_schedule(b'\x4e\x54\x5c\xd7\xcf\xfa\x97\x2d\xf1\x42\x75\x97\x1d\x95\x3f\x0d', 10)
print(base_key)
# convert to string
print(base_key.split(base_key, "\x"))

""" result
b'\x2a\xc3\x0b\xdb\xfe\xe2\x7f\x07\xb0\x3b\xe6\x93\x73\x1a\xb7\x86'
2a c3 0b db fe e2 7f 07 b0 3b e6 93 73 1a b7 86
"""