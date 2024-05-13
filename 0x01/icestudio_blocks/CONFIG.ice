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
          "id": "fa07a90f-c020-4aec-9b02-cb4f6739ed0a",
          "type": "basic.output",
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
            ]
          },
          "position": {
            "x": 808,
            "y": 64
          }
        },
        {
          "id": "aa15f1ec-10fc-47e5-8d3c-be89a1d03c30",
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
            "x": 128,
            "y": 80
          }
        },
        {
          "id": "e9590a8d-5bdb-47d9-b18f-044226322d54",
          "type": "basic.output",
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
            ]
          },
          "position": {
            "x": 808,
            "y": 120
          }
        },
        {
          "id": "e4c116f1-2a66-4895-b33e-1585e483b9ef",
          "type": "basic.input",
          "data": {
            "name": "RX_DATA",
            "virtual": true,
            "range": "[7:0]",
            "pins": [
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
            "x": 128,
            "y": 152
          }
        },
        {
          "id": "f7a63938-5b56-4cfd-888e-82f2c9880957",
          "type": "basic.output",
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
            ]
          },
          "position": {
            "x": 808,
            "y": 176
          }
        },
        {
          "id": "c9a559a0-2cdc-4cbb-8bfd-e4cb473a2e4c",
          "type": "basic.input",
          "data": {
            "name": "RX_VALID",
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
            "x": 128,
            "y": 232
          }
        },
        {
          "id": "9f13a17c-f4fe-451a-8417-63bd03aaedca",
          "type": "basic.output",
          "data": {
            "name": "SOFT_TRIG",
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
            "x": 808,
            "y": 232
          }
        },
        {
          "id": "a957a175-89c2-4a7b-96f9-b869eb1ffb5d",
          "type": "basic.output",
          "data": {
            "name": "TX_DATA",
            "virtual": true,
            "range": "[7:0]",
            "pins": [
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
            ]
          },
          "position": {
            "x": 808,
            "y": 288
          }
        },
        {
          "id": "20181974-921d-46a5-be4d-67e3906a966a",
          "type": "basic.input",
          "data": {
            "name": "TX_BUSY",
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
            "x": 128,
            "y": 312
          }
        },
        {
          "id": "5ccbd30f-cdce-46ee-a423-8bc7813cee01",
          "type": "basic.output",
          "data": {
            "name": "TX_VALID",
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
            "x": 808,
            "y": 344
          }
        },
        {
          "id": "099d6b81-4bc5-42ec-ab08-73b97015bea1",
          "type": "basic.input",
          "data": {
            "name": "TRIGGERED",
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
            "x": 128,
            "y": 384
          }
        },
        {
          "id": "fdb25ec2-30c8-4797-b60a-78cfdd30518f",
          "type": "basic.output",
          "data": {
            "name": "DISARM",
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
            "x": 808,
            "y": 400
          }
        },
        {
          "id": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
          "type": "basic.code",
          "data": {
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "i_data_reg",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "i_valid_rx"
                },
                {
                  "name": "i_busy"
                },
                {
                  "name": "i_trigger_done"
                }
              ],
              "out": [
                {
                  "name": "o_width_reg",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "o_delay_reg",
                  "range": "[15:0]",
                  "size": 16
                },
                {
                  "name": "o_trigger_edge",
                  "range": "[1:0]",
                  "size": 2
                },
                {
                  "name": "o_trigger_now"
                },
                {
                  "name": "o_data_reg",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "o_valid_tx"
                },
                {
                  "name": "o_disarm"
                }
              ]
            },
            "params": [],
            "code": "// latch in\nreg [7:0] r_data_reg = 0;\nalways @ (posedge clk)\nbegin\n    r_data_reg <= (i_valid_rx)? i_data_reg: r_data_reg;\nend\n\n// internal command code representation, shorted for case-insensitive 7-bit code\nwire [5:0] w_commandcode = {i_data_reg[6], i_data_reg[4:0]};\n\n//  ------------------------------------------------------------------\n//      Finite State Machine\n//  ------------------------------------------------------------------\n\n    // states w/ encoding\n    localparam IDLE     = 0;\n    localparam CCMD     = 1;\n    localparam CHIGH    = 2;\n    localparam CLOW     = 3;\n    localparam DCMD     = 4;\n    localparam DHIGH    = 5;\n    localparam DLOW     = 6;\n    localparam TRIG     = 7;\n    localparam WCMD     = 8;\n    localparam WHIGH    = 9;\n    localparam WLOW     = 10;\n    //\n    localparam RESET    = 11;\n    //\n    localparam BACKD    = 16;\n    localparam BACKDH   = 17;\n    localparam BACKDL   = 18;\n    localparam BACKW    = 19;\n    localparam BACKWH   = 20;\n    localparam BACKWL   = 21;\n    localparam BACKC    = 22;\n    localparam BACKCH   = 23;\n    localparam BACKCL   = 24;\n    localparam BACKS    = 25;\n    localparam BACKSH   = 26;\n    localparam BACKSL   = 27;\n    \nreg [4:0] w_nextstate;                  // cased !!\nreg [4:0] r_currentstate = IDLE;\n\n\n// combinatorial, next state process\nalways @* // (r_currentstate, w_commandcode)\nbegin\n    case (r_currentstate)\n        IDLE:   if (i_valid_rx)\n                    case (w_commandcode)\n                    'b1_0_0010: w_nextstate = BACKD;// 'B'\n                    'b1_0_0011: w_nextstate = CCMD; // 'C'\n                    'b1_0_0100: w_nextstate = DCMD; // 'D'\n                    'b1_1_0011: w_nextstate = BACKS;// 'S'\n                    'b1_1_0100: w_nextstate = TRIG; // 'T'\n                    'b1_1_0111: w_nextstate = WCMD; // 'W'\n                    'b1_1_0010: w_nextstate = RESET;// 'R'\n                    default:    w_nextstate = r_currentstate; // hold\n                    endcase\n                else\n                    w_nextstate = r_currentstate; // hold\n        WCMD:   if (i_valid_rx)\n                    w_nextstate = WHIGH;\n                else\n                    w_nextstate = r_currentstate; // hold\n        WHIGH:  if (i_valid_rx)\n                    w_nextstate = WLOW;\n                else\n                    w_nextstate = r_currentstate; // hold\n        WLOW:   if (i_valid_rx)\n                    case (w_commandcode)\n                    'b1_0_0010: w_nextstate = BACKD;// 'B'\n                    'b1_0_0011: w_nextstate = CCMD; // 'C'\n                    'b1_1_0011: w_nextstate = BACKS;// 'S'\n                    'b1_1_0100: w_nextstate = TRIG; // 'T'\n                    'b1_1_0010: w_nextstate = RESET;// 'R'\n                    default:    w_nextstate = r_currentstate; // hold\n                    endcase\n                else\n                    w_nextstate = r_currentstate; // hold\n        DCMD:   if (i_valid_rx)\n                    w_nextstate = DHIGH;\n                else\n                    w_nextstate = r_currentstate; // hold\n        DHIGH:  if (i_valid_rx)\n                    w_nextstate = DLOW;\n                else\n                    w_nextstate = r_currentstate; // hold\n        DLOW:   if (i_valid_rx)\n                    case (w_commandcode)\n                    'b1_0_0010: w_nextstate = BACKD;// 'B'\n                    'b1_1_0011: w_nextstate = BACKS;// 'S'\n                    'b1_1_0111: w_nextstate = WCMD; // 'W'\n                    'b1_1_0010: w_nextstate = RESET;// 'R'\n                    default:    w_nextstate = r_currentstate; // hold\n                    endcase\n                else\n                    w_nextstate = r_currentstate; // hold\n        CCMD:   if (i_valid_rx)\n                    w_nextstate = CHIGH;\n                else\n                    w_nextstate = r_currentstate; // hold\n        CHIGH:  if (i_valid_rx)\n                    w_nextstate = CLOW;\n                else\n                    w_nextstate = r_currentstate; // hold\n        CLOW:   if (i_valid_rx)\n                    case (w_commandcode)\n                    'b1_0_0010: w_nextstate = BACKD;// 'B'\n                    'b1_1_0011: w_nextstate = BACKS;// 'S'\n                    'b1_1_0010: w_nextstate = RESET;// 'R'\n                    default:    w_nextstate = r_currentstate; // hold\n                    endcase\n                else\n                    w_nextstate = r_currentstate; // hold\n        TRIG:   if (i_valid_rx)\n                    case (w_commandcode)\n                    'b1_0_0010: w_nextstate = BACKD;// 'B'\n                    'b1_1_0011: w_nextstate = BACKS;// 'S'\n                    'b1_1_0010: w_nextstate = RESET;// 'R'\n                    default:    w_nextstate = r_currentstate; // hold\n                    endcase\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKD:  if (!i_busy)\n                    w_nextstate = BACKDH;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKDH: if (!i_busy)\n                    w_nextstate = BACKDL;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKDL: if (!i_busy)\n                    w_nextstate = BACKW;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKW:  if (!i_busy)\n                    w_nextstate = BACKWH;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKWH: if (!i_busy)\n                    w_nextstate = BACKWL;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKWL: if (!i_busy)\n                    w_nextstate = BACKC;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKC:  if (!i_busy)\n                    w_nextstate = BACKCH;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKCH: if (!i_busy)\n                    w_nextstate = BACKCL;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKCL: if (!i_busy)\n                    w_nextstate = IDLE;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKS:  if (!i_busy)\n                    w_nextstate = BACKSH;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKSH: if (!i_busy)\n                    w_nextstate = BACKSL;\n                else\n                    w_nextstate = r_currentstate; // hold\n        BACKSL: if (!i_busy)\n                    w_nextstate = IDLE;\n                else\n                    w_nextstate = r_currentstate; // hold\n        default: w_nextstate = IDLE; // something went wrong\n    endcase \nend\n\n\n// registered, current state process\nalways @ (posedge clk)\nbegin\n    r_currentstate <= w_nextstate;\nend\n\n\n//  ------------------------------------------------------------------\n//      internal storage (register)\n//  ------------------------------------------------------------------\n\nreg [15:0] r_width_reg      = 0;\nreg [15:0] r_delay_reg      = 0;\nreg [15:0] r_config_reg     = 0;\nreg [15:0] r_shotcount_reg  = 0;\n\n// pulse width\nalways @ (posedge clk)\nbegin\n    case (r_currentstate)\n        RESET:  r_width_reg <= 0;    // clear\n        WHIGH:  r_width_reg[15:8] <= r_data_reg; // get MSB\n        WLOW:   r_width_reg[7:0]  <= r_data_reg;  // get LSB\n        default: r_width_reg <= r_width_reg;     // hold\n    endcase\nend\n\nassign o_width_reg = r_width_reg;\n\n\n// delay width\nalways @ (posedge clk)\nbegin\n    case (r_currentstate)\n        RESET:  r_delay_reg <= 0;    // clear\n        DHIGH:  r_delay_reg[15:8] <= r_data_reg; // get MSB\n        DLOW:   r_delay_reg[7:0]  <= r_data_reg;  // get LSB\n        default: r_delay_reg <= r_delay_reg;     // hold\n    endcase\nend\n\nassign o_delay_reg = r_delay_reg;\n\n\n// configuration\nalways @ (posedge clk)\nbegin\n    if (r_config_reg[2] && i_trigger_done)\n        // disarm configuration\n        r_config_reg <= 0;  // clear\n    else case (r_currentstate)\n            RESET:  r_config_reg <= 0;   // clear\n            CHIGH:  r_config_reg[15:8] <= 'd0; //r_data_reg;// get MSB\n            CLOW:   r_config_reg[7:0]  <= {5'd0, r_data_reg[2:0]}; // get LSB\n            default: r_config_reg <= r_config_reg;\n        endcase\nend\n\nassign o_trigger_edge = r_config_reg[1:0];\nassign o_disarm = r_config_reg[2];\n\n// shot count\nalways @ (posedge clk)\nbegin\n    if (i_trigger_done)\n        r_shotcount_reg <= r_shotcount_reg + 1; // count\n    else case (r_currentstate)\n            RESET:  r_shotcount_reg <= 0;   // clear\n            default: r_shotcount_reg <= r_shotcount_reg;\n        endcase\nend\n\n//  ------------------------------------------------------------------\n//      Read Back\n//  ------------------------------------------------------------------\n\nreg w_valid_tx; // cased\nreg [7:00] w_data_reg; // cased!!\n\n// output data multiplexor\nalways @ (r_currentstate, i_busy, r_delay_reg, r_width_reg, r_config_reg)\nbegin\n    case (r_currentstate)\n        BACKD:  begin\n                w_data_reg = \"D\";\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKDH: begin\n                w_data_reg = r_delay_reg[15:8];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKDL: begin\n                w_data_reg = r_delay_reg[7:0];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKW:  begin\n                w_data_reg = \"W\";\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKWH: begin\n                w_data_reg = r_width_reg[15:8];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKWL: begin\n                w_data_reg = r_width_reg[7:0];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKC:  begin\n                w_data_reg = \"C\";\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKCH: begin\n                w_data_reg = r_config_reg[15:8];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKCL: begin\n                w_data_reg = r_config_reg[7:0];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKS:  begin\n                w_data_reg = \"S\";\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKSH: begin\n                w_data_reg = r_shotcount_reg[15:8];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        BACKSL: begin\n                w_data_reg = r_shotcount_reg[7:0];\n                w_valid_tx = !i_busy;   // this becomes Mealy-like\n                end\n        default:begin\n                w_data_reg = 'd0;\n                w_valid_tx = 'b0;\n                end\n    endcase\nend\n\n// output matching\nassign o_data_reg = w_data_reg;\nassign o_valid_tx = w_valid_tx;\n\n//  ------------------------------------------------------------------\n//      Trigger\n//  ------------------------------------------------------------------\n\n// just the state\nassign o_trigger_now = (TRIG == r_currentstate);"
          },
          "position": {
            "x": 368,
            "y": 72
          },
          "size": {
            "width": 304,
            "height": 384
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "o_width_reg"
          },
          "target": {
            "block": "fa07a90f-c020-4aec-9b02-cb4f6739ed0a",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "o_delay_reg"
          },
          "target": {
            "block": "e9590a8d-5bdb-47d9-b18f-044226322d54",
            "port": "in"
          },
          "size": 16
        },
        {
          "source": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "o_trigger_edge"
          },
          "target": {
            "block": "f7a63938-5b56-4cfd-888e-82f2c9880957",
            "port": "in"
          },
          "size": 2
        },
        {
          "source": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "o_trigger_now"
          },
          "target": {
            "block": "9f13a17c-f4fe-451a-8417-63bd03aaedca",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "o_data_reg"
          },
          "target": {
            "block": "a957a175-89c2-4a7b-96f9-b869eb1ffb5d",
            "port": "in"
          },
          "size": 8
        },
        {
          "source": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "o_valid_tx"
          },
          "target": {
            "block": "5ccbd30f-cdce-46ee-a423-8bc7813cee01",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "o_disarm"
          },
          "target": {
            "block": "fdb25ec2-30c8-4797-b60a-78cfdd30518f",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "aa15f1ec-10fc-47e5-8d3c-be89a1d03c30",
            "port": "out"
          },
          "target": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "e4c116f1-2a66-4895-b33e-1585e483b9ef",
            "port": "out"
          },
          "target": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "i_data_reg"
          },
          "size": 8
        },
        {
          "source": {
            "block": "c9a559a0-2cdc-4cbb-8bfd-e4cb473a2e4c",
            "port": "out"
          },
          "target": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "i_valid_rx"
          }
        },
        {
          "source": {
            "block": "20181974-921d-46a5-be4d-67e3906a966a",
            "port": "out"
          },
          "target": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "i_busy"
          }
        },
        {
          "source": {
            "block": "099d6b81-4bc5-42ec-ab08-73b97015bea1",
            "port": "out"
          },
          "target": {
            "block": "81778bfa-2d5a-4c43-94f1-2a636ba2e20a",
            "port": "i_trigger_done"
          }
        }
      ]
    }
  },
  "dependencies": {}
}