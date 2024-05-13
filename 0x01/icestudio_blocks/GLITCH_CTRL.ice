{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "icestick",
    "graph": {
      "blocks": [
        {
          "id": "24ae6458-370f-4994-84bb-6a2824f1344b",
          "type": "basic.input",
          "data": {
            "name": "CLK",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 120
          }
        },
        {
          "id": "7934cc29-cab7-48b5-8564-5d86af46c0f0",
          "type": "basic.input",
          "data": {
            "name": "WIDTH",
            "virtual": true,
            "range": "[15:0]",
            "pins": [
              {
                "index": "15",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "14",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "13",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "12",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 216
          }
        },
        {
          "id": "07b83513-5cd3-4cd2-940d-d5b0ad0cc25b",
          "type": "basic.output",
          "data": {
            "name": "TRIGGERED",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1072,
            "y": 248
          }
        },
        {
          "id": "05316a1c-fa50-40fc-97da-7a95c174d13e",
          "type": "basic.input",
          "data": {
            "name": "OFFSET",
            "virtual": true,
            "range": "[15:0]",
            "pins": [
              {
                "index": "15",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "14",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "13",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "12",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "11",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "10",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "9",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "8",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "7",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "6",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "5",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "4",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "3",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "2",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 320
          }
        },
        {
          "id": "1a4adee6-a5ae-4259-85d0-d52ab53c5958",
          "type": "basic.input",
          "data": {
            "name": "EDGE",
            "virtual": true,
            "range": "[1:0]",
            "pins": [
              {
                "index": "1",
                "name": "NULL",
                "value": "NULL"
              },
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 416
          }
        },
        {
          "id": "ff6da238-74d3-4e58-8e22-395f1f03d329",
          "type": "basic.input",
          "data": {
            "name": "SOFT_TRIG",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 512
          }
        },
        {
          "id": "53e019df-6e07-4277-bcf0-a831c4811826",
          "type": "basic.output",
          "data": {
            "name": "NMOS_CTRL",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ]
          },
          "position": {
            "x": 1072,
            "y": 592
          }
        },
        {
          "id": "ee63e615-9baa-4748-9c54-388714b0dd27",
          "type": "basic.input",
          "data": {
            "name": "DISARM",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 616
          }
        },
        {
          "id": "3707bb16-37e4-4807-96e2-86d6ba8b47a1",
          "type": "basic.input",
          "data": {
            "name": "EXT_TRIG",
            "virtual": true,
            "pins": [
              {
                "index": "0",
                "name": "NULL",
                "value": "NULL"
              }
            ],
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 712
          }
        },
        {
          "id": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "i_width_reg",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "i_delay_reg",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "i_trigger_edge",
                  "range": "[1:0]",
                  "size": 2
                },
                {
                  "name": "i_trigger_now"
                },
                {
                  "name": "i_trigger_disarm"
                },
                {
                  "name": "i_trigger_ext"
                }
              ],
              "out": [
                {
                  "name": "o_trigger_done"
                },
                {
                  "name": "o_glitch"
                }
              ]
            },
            "params": [],
            "code": "// trigger edge configuration\nlocalparam SOFT = 0;\nlocalparam RISING = 1;\nlocalparam FALLING = 2;\nlocalparam BOTH = 3;\n\n//  ------------------------------------------------------------------\n//      Sync-in external signals\n//  ------------------------------------------------------------------\n\nlocalparam syncin = 3;      // optimal 2..3\n\nreg [syncin:0] r_shiftreg_ext = 0;\n\n// external trigger\nalways @ (posedge clk)\nbegin\n    r_shiftreg_ext <= {i_trigger_ext, r_shiftreg_ext[syncin:1]};\nend\n\nreg [1:0] r_shiftreg_now = 0;   // bar minimum for edge detection\n\n// trigger now\nalways @ (posedge clk)\nbegin\n    r_shiftreg_now <= {i_trigger_now, r_shiftreg_now[1]};\nend\n\n//  ------------------------------------------------------------------\n//      Edge detection\n//  ------------------------------------------------------------------\n\n// external trigger\nwire w_rising_ext = (r_shiftreg_ext[1] && !r_shiftreg_ext[0]);\nwire w_falling_ext = (!r_shiftreg_ext[1] && r_shiftreg_ext[0]);\n\n// trigger now\nwire w_rising_now = (r_shiftreg_now[1] && !r_shiftreg_now[0]);\n\n//  ------------------------------------------------------------------\n//      Timer\n//  ------------------------------------------------------------------\n\n// pulse width\nreg [15:0] r_width_reg;\nwire w_width_done = (r_width_reg == 1);\n\n// delay width\nreg [15:0] r_delay_reg;\nwire w_delay_done = (r_delay_reg == 1);\n\n//  ------------------------------------------------------------------\n//      Finite State Machine\n//  ------------------------------------------------------------------\n\n    // states w/ encoding\n    localparam IDLE  = 0;\n    localparam DELAY = 1;\n    localparam SHOT = 2;\n    localparam DONE = 3;\n    localparam STOP = 4;\n\nreg [3:0] w_nextstate;                  // cased !!\nreg [3:0] r_currentstate = IDLE;\n\n// combinatorial, next state process\nalways @ (r_currentstate,\n          w_rising_now, w_rising_ext, w_falling_ext,\n          w_delay_done, w_width_done)\nbegin\n    case (r_currentstate)\n        IDLE:   case (i_trigger_edge)\n                    // select trigger condition regarding configuration\n                    SOFT:   if (w_rising_now)   // software only\n                                w_nextstate = SHOT;\n                            else\n                                w_nextstate = r_currentstate;\n                    RISING: if (w_rising_ext)   // external w/ rising edge\n                                w_nextstate = DELAY;\n                            else\n                                w_nextstate = r_currentstate;\n                    FALLING:if (w_falling_ext)  // external w/ falling edge\n                                w_nextstate = DELAY;\n                            else\n                                w_nextstate = r_currentstate;\n                    default:if (w_rising_ext || w_falling_ext) // external on both edges\n                                w_nextstate = DELAY;\n                            else\n                                w_nextstate = r_currentstate;\n                endcase\n        DELAY:  if (w_delay_done)   // wait, delay configured time\n                    w_nextstate = SHOT;\n                else\n                    w_nextstate = r_currentstate;\n        SHOT:   if (w_width_done)   // shot, width time\n                    w_nextstate = DONE;\n                else\n                    w_nextstate = r_currentstate;\n        DONE:   w_nextstate = STOP; // just one clock cycle\n        STOP:   if (i_trigger_disarm)\n                    w_nextstate = r_currentstate; // hold as long as disarmed\n                else\n                    w_nextstate = IDLE; // run continously, next shot\n        default: w_nextstate = IDLE; // something went wrong\n    endcase\nend\n\n// registered, current state process\nalways @ (posedge clk)\nbegin\n    r_currentstate <= w_nextstate;\nend\n\n\n//  ------------------------------------------------------------------\n//      internal timer (register)\n//  ------------------------------------------------------------------\n\n// pulse width\nalways @ (posedge clk)\nbegin\n    case (r_currentstate)\n        IDLE:   r_width_reg <= i_width_reg;\n        SHOT:   r_width_reg <= r_width_reg - 1; // count down\n        default:r_width_reg <= r_width_reg;  // hold\n    endcase\nend\n\n// delay width\nalways @ (posedge clk)\nbegin\n    case (r_currentstate)\n        IDLE:   r_delay_reg <= i_delay_reg;\n        DELAY:  r_delay_reg <= r_delay_reg - 1; // count down\n        default:r_delay_reg <= r_delay_reg;  // hold\n    endcase\nend\n\n//  ------------------------------------------------------------------\n//      glitch\n//  ------------------------------------------------------------------\n\n// just the state\nassign o_glitch = (SHOT == r_currentstate);\n\n//  ------------------------------------------------------------------\n//      feed back\n//  ------------------------------------------------------------------\n\n// just the state\nassign o_trigger_done = (DONE == r_currentstate);"
          },
          "position": {
            "x": 240,
            "y": 104
          },
          "size": {
            "width": 656,
            "height": 688
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "24ae6458-370f-4994-84bb-6a2824f1344b",
            "port": "out"
          },
          "target": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "7934cc29-cab7-48b5-8564-5d86af46c0f0",
            "port": "out"
          },
          "target": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "i_width_reg"
          },
          "size": 16
        },
        {
          "source": {
            "block": "05316a1c-fa50-40fc-97da-7a95c174d13e",
            "port": "out"
          },
          "target": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "i_delay_reg"
          },
          "size": 16
        },
        {
          "source": {
            "block": "1a4adee6-a5ae-4259-85d0-d52ab53c5958",
            "port": "out"
          },
          "target": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "i_trigger_edge"
          },
          "size": 2
        },
        {
          "source": {
            "block": "ff6da238-74d3-4e58-8e22-395f1f03d329",
            "port": "out"
          },
          "target": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "i_trigger_now"
          }
        },
        {
          "source": {
            "block": "ee63e615-9baa-4748-9c54-388714b0dd27",
            "port": "out"
          },
          "target": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "i_trigger_disarm"
          }
        },
        {
          "source": {
            "block": "3707bb16-37e4-4807-96e2-86d6ba8b47a1",
            "port": "out"
          },
          "target": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "i_trigger_ext"
          }
        },
        {
          "source": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "o_glitch"
          },
          "target": {
            "block": "53e019df-6e07-4277-bcf0-a831c4811826",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "1e44e8f2-65cf-4232-b1a4-beb6fbbb45fe",
            "port": "o_trigger_done"
          },
          "target": {
            "block": "07b83513-5cd3-4cd2-940d-d5b0ad0cc25b",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {}
}