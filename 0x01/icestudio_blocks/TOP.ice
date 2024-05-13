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
          "id": "26ce296c-0a97-40e9-9860-0688f4978548",
          "type": "basic.input",
          "data": {
            "name": "RX",
            "virtual": false,
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
            "x": -304,
            "y": 248
          }
        },
        {
          "id": "0e73683d-2004-40ae-843a-451676d965bd",
          "type": "basic.output",
          "data": {
            "name": "TX",
            "virtual": false,
            "pins": [
              {
                "index": "0",
                "name": "TX",
                "value": "8"
              }
            ]
          },
          "position": {
            "x": 816,
            "y": 360
          }
        },
        {
          "id": "c10c4196-5a06-4d56-ada8-10ec8deb5f06",
          "type": "f066592bcd3513fd3162795abd21cea233dbfd9a",
          "position": {
            "x": -136,
            "y": 232
          },
          "size": {
            "width": 96,
            "height": 64
          }
        },
        {
          "id": "8d1088ba-3993-447f-8c7a-8f84fdf1efd3",
          "type": "1e9d5dafbedc4a0d0c7538d7ebf795274ae74dd6",
          "position": {
            "x": 576,
            "y": 320
          },
          "size": {
            "width": 96,
            "height": 96
          }
        },
        {
          "id": "ae73e18a-de92-4a8c-abcb-912cf5ac52af",
          "type": "a596a20764aaef555f4e111dc7b0615806954682",
          "position": {
            "x": 576,
            "y": -80
          },
          "size": {
            "width": 96,
            "height": 224
          }
        },
        {
          "id": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
          "type": "34e68748a987dd16aa162d7d9b29a3c836d97f1f",
          "position": {
            "x": 216,
            "y": 96
          },
          "size": {
            "width": 96,
            "height": 224
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "5ccbd30f-cdce-46ee-a423-8bc7813cee01"
          },
          "target": {
            "block": "8d1088ba-3993-447f-8c7a-8f84fdf1efd3",
            "port": "855ac604-c91a-4297-9d8b-a1b968424580"
          },
          "vertices": [
            {
              "x": 424,
              "y": 320
            }
          ]
        },
        {
          "source": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "a957a175-89c2-4a7b-96f9-b869eb1ffb5d"
          },
          "target": {
            "block": "8d1088ba-3993-447f-8c7a-8f84fdf1efd3",
            "port": "5664c9ab-a178-4e87-bf2c-ad21b591cced"
          },
          "vertices": [
            {
              "x": 456,
              "y": 312
            }
          ],
          "size": 8
        },
        {
          "source": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "fa07a90f-c020-4aec-9b02-cb4f6739ed0a"
          },
          "target": {
            "block": "ae73e18a-de92-4a8c-abcb-912cf5ac52af",
            "port": "7934cc29-cab7-48b5-8564-5d86af46c0f0"
          },
          "vertices": [
            {
              "x": 408,
              "y": 56
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "e9590a8d-5bdb-47d9-b18f-044226322d54"
          },
          "target": {
            "block": "ae73e18a-de92-4a8c-abcb-912cf5ac52af",
            "port": "05316a1c-fa50-40fc-97da-7a95c174d13e"
          },
          "vertices": [
            {
              "x": 432,
              "y": 48
            }
          ],
          "size": 16
        },
        {
          "source": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "9f13a17c-f4fe-451a-8417-63bd03aaedca"
          },
          "target": {
            "block": "ae73e18a-de92-4a8c-abcb-912cf5ac52af",
            "port": "ff6da238-74d3-4e58-8e22-395f1f03d329"
          },
          "vertices": [
            {
              "x": 480,
              "y": 80
            }
          ]
        },
        {
          "source": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "f7a63938-5b56-4cfd-888e-82f2c9880957"
          },
          "target": {
            "block": "ae73e18a-de92-4a8c-abcb-912cf5ac52af",
            "port": "1a4adee6-a5ae-4259-85d0-d52ab53c5958"
          },
          "vertices": [
            {
              "x": 456,
              "y": 64
            }
          ],
          "size": 2
        },
        {
          "source": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "fdb25ec2-30c8-4797-b60a-78cfdd30518f"
          },
          "target": {
            "block": "ae73e18a-de92-4a8c-abcb-912cf5ac52af",
            "port": "ee63e615-9baa-4748-9c54-388714b0dd27"
          }
        },
        {
          "source": {
            "block": "c10c4196-5a06-4d56-ada8-10ec8deb5f06",
            "port": "083dd726-5525-47e3-ba4b-f0993a44da82"
          },
          "target": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "e4c116f1-2a66-4895-b33e-1585e483b9ef"
          },
          "vertices": [
            {
              "x": 72,
              "y": 192
            }
          ],
          "size": 8
        },
        {
          "source": {
            "block": "c10c4196-5a06-4d56-ada8-10ec8deb5f06",
            "port": "7c2a81cc-afb2-472a-a01c-8cbd1774e342"
          },
          "target": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "c9a559a0-2cdc-4cbb-8bfd-e4cb473a2e4c"
          },
          "vertices": [
            {
              "x": 104,
              "y": 232
            }
          ]
        },
        {
          "source": {
            "block": "8d1088ba-3993-447f-8c7a-8f84fdf1efd3",
            "port": "0275b275-1136-41ab-90c6-ec1577e485b5"
          },
          "target": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "20181974-921d-46a5-be4d-67e3906a966a"
          },
          "vertices": [
            {
              "x": 120,
              "y": 336
            }
          ]
        },
        {
          "source": {
            "block": "ae73e18a-de92-4a8c-abcb-912cf5ac52af",
            "port": "07b83513-5cd3-4cd2-940d-d5b0ad0cc25b"
          },
          "target": {
            "block": "5dd6e93c-5cce-4e73-b24a-b92d41df798f",
            "port": "099d6b81-4bc5-42ec-ab08-73b97015bea1"
          },
          "vertices": [
            {
              "x": 600,
              "y": 448
            }
          ]
        },
        {
          "source": {
            "block": "26ce296c-0a97-40e9-9860-0688f4978548",
            "port": "out"
          },
          "target": {
            "block": "c10c4196-5a06-4d56-ada8-10ec8deb5f06",
            "port": "5dbd4509-9830-4292-974c-59f55ea82d8a"
          }
        },
        {
          "source": {
            "block": "8d1088ba-3993-447f-8c7a-8f84fdf1efd3",
            "port": "e34b8a4b-de1f-4be6-9905-0c8d30336eed"
          },
          "target": {
            "block": "0e73683d-2004-40ae-843a-451676d965bd",
            "port": "in"
          }
        }
      ]
    }
  },
  "dependencies": {
    "f066592bcd3513fd3162795abd21cea233dbfd9a": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "b0de2c90-2916-4b75-bb4a-6f115b89f0d0",
              "type": "basic.input",
              "data": {
                "name": "CLK",
                "clock": false
              },
              "position": {
                "x": 24,
                "y": 192
              }
            },
            {
              "id": "083dd726-5525-47e3-ba4b-f0993a44da82",
              "type": "basic.output",
              "data": {
                "name": "RX_DATA",
                "range": "[7:0]",
                "size": 8
              },
              "position": {
                "x": 976,
                "y": 192
              }
            },
            {
              "id": "5dbd4509-9830-4292-974c-59f55ea82d8a",
              "type": "basic.input",
              "data": {
                "name": "RX",
                "clock": false
              },
              "position": {
                "x": 24,
                "y": 408
              }
            },
            {
              "id": "7c2a81cc-afb2-472a-a01c-8cbd1774e342",
              "type": "basic.output",
              "data": {
                "name": "RX_VALID"
              },
              "position": {
                "x": 976,
                "y": 408
              }
            },
            {
              "id": "e6eb7f25-38c2-42a2-9422-e5acbcd270dc",
              "type": "basic.constant",
              "data": {
                "name": "CLKDIV",
                "value": "104",
                "local": false
              },
              "position": {
                "x": 496,
                "y": -88
              }
            },
            {
              "id": "e15ced7e-e2a6-44e5-96d9-7e0a9a3f1003",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "i_rx"
                    }
                  ],
                  "out": [
                    {
                      "name": "o_data",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "o_valid"
                    }
                  ]
                },
                "params": [
                  {
                    "name": "CLKDIV"
                  }
                ],
                "code": "localparam IDLE  = 0;\nlocalparam DELAY = 1;\nlocalparam READ  = 2;\nlocalparam STOP  = 3;\n\nreg[15:0] clk_cnt  = 0;\nreg[ 7:0] rx_cnt   = 0;\nreg[ 1:0] state    = IDLE;\nreg[ 7:0] data_reg = 0;\n\n\nreg r_valid = 0;\n\nassign o_data  = data_reg;\n\nalways @ (posedge clk)\nbegin\n    clk_cnt  <= clk_cnt + 1;\n    r_valid  <= 0;\n    data_reg <= data_reg;\n    state    <= state;\n    rx_cnt   <= rx_cnt;\n\n    case (state)\n        IDLE:\n        begin\n            clk_cnt <= 0;\n            if (!i_rx)\n                state <= DELAY;\n        end\n\n        DELAY:\n        begin\n            // Always sample in the center of each symbol.\n            if (clk_cnt >= CLKDIV/2)\n            begin\n                clk_cnt <= 0;\n                state <= READ;\n            end\n        end\n\n        READ:\n        begin\n            if (clk_cnt >= CLKDIV)\n            begin\n                // Shift bit into data register.\n                data_reg <= {i_rx, data_reg[7:1]};\n                rx_cnt <= rx_cnt + 1;\n                clk_cnt <= 0;\n            end\n\n            if (rx_cnt >= 8)\n            begin\n                rx_cnt <= 0;\n                state <= STOP;\n                r_valid <= 1;\n            end\n        end\n        STOP:\n        begin\n            if (clk_cnt >= CLKDIV)\n                state <= IDLE;\n        end\n    endcase\nend\n\n// output matching\nassign o_valid = r_valid;\n\n// for degug only\nalways @ (state)\nbegin\n    if (state == IDLE)\n        $display(\"%m: %t data: %h\", $time, data_reg);\nend"
              },
              "position": {
                "x": 232,
                "y": 112
              },
              "size": {
                "width": 616,
                "height": 432
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "e6eb7f25-38c2-42a2-9422-e5acbcd270dc",
                "port": "constant-out"
              },
              "target": {
                "block": "e15ced7e-e2a6-44e5-96d9-7e0a9a3f1003",
                "port": "CLKDIV"
              }
            },
            {
              "source": {
                "block": "5dbd4509-9830-4292-974c-59f55ea82d8a",
                "port": "out"
              },
              "target": {
                "block": "e15ced7e-e2a6-44e5-96d9-7e0a9a3f1003",
                "port": "i_rx"
              }
            },
            {
              "source": {
                "block": "b0de2c90-2916-4b75-bb4a-6f115b89f0d0",
                "port": "out"
              },
              "target": {
                "block": "e15ced7e-e2a6-44e5-96d9-7e0a9a3f1003",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "e15ced7e-e2a6-44e5-96d9-7e0a9a3f1003",
                "port": "o_data"
              },
              "target": {
                "block": "083dd726-5525-47e3-ba4b-f0993a44da82",
                "port": "in"
              },
              "size": 8
            },
            {
              "source": {
                "block": "e15ced7e-e2a6-44e5-96d9-7e0a9a3f1003",
                "port": "o_valid"
              },
              "target": {
                "block": "7c2a81cc-afb2-472a-a01c-8cbd1774e342",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "1e9d5dafbedc4a0d0c7538d7ebf795274ae74dd6": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "7746381f-18fe-480e-8fe6-efb470196ee1",
              "type": "basic.input",
              "data": {
                "name": "CLK",
                "clock": false
              },
              "position": {
                "x": -40,
                "y": 168
              }
            },
            {
              "id": "0275b275-1136-41ab-90c6-ec1577e485b5",
              "type": "basic.output",
              "data": {
                "name": "TX_BUSY"
              },
              "position": {
                "x": 976,
                "y": 200
              }
            },
            {
              "id": "5664c9ab-a178-4e87-bf2c-ad21b591cced",
              "type": "basic.input",
              "data": {
                "name": "TX_DATA",
                "range": "[7:0]",
                "clock": false,
                "size": 8
              },
              "position": {
                "x": -40,
                "y": 280
              }
            },
            {
              "id": "e34b8a4b-de1f-4be6-9905-0c8d30336eed",
              "type": "basic.output",
              "data": {
                "name": "TX"
              },
              "position": {
                "x": 976,
                "y": 368
              }
            },
            {
              "id": "855ac604-c91a-4297-9d8b-a1b968424580",
              "type": "basic.input",
              "data": {
                "name": "TX_VALID",
                "clock": false
              },
              "position": {
                "x": -40,
                "y": 392
              }
            },
            {
              "id": "87215bb6-5888-49d9-804f-384b8a75eb7f",
              "type": "basic.constant",
              "data": {
                "name": "CLKDIV",
                "value": "104",
                "local": false
              },
              "position": {
                "x": 496,
                "y": -64
              }
            },
            {
              "id": "dcef5368-904d-4a0f-bd0a-2618bf938a4d",
              "type": "basic.code",
              "data": {
                "ports": {
                  "in": [
                    {
                      "name": "clk"
                    },
                    {
                      "name": "i_data",
                      "range": "[7:0]",
                      "size": 8
                    },
                    {
                      "name": "i_valid"
                    }
                  ],
                  "out": [
                    {
                      "name": "o_busy"
                    },
                    {
                      "name": "o_tx"
                    }
                  ]
                },
                "params": [
                  {
                    "name": "CLKDIV"
                  }
                ],
                "code": "localparam IDLE  = 0;\nlocalparam START = 1;\nlocalparam SEND  = 2;\nlocalparam STOP  = 3;\n\nreg[15:0] clk_cnt   = 0;\nreg[ 7:0] tx_cnt    = 0;\nreg[ 1:0] state     = IDLE;\nreg[ 7:0] data_reg  = 0;\n\n\nreg r_busy = 0;\nreg r_tx   = 1;\n\n\nalways @ (posedge clk)\nbegin\n\tclk_cnt  <= clk_cnt + 1;\n    r_busy   <= r_busy;\n    r_tx     <= r_tx;\n    data_reg <= data_reg;\n    state    <= state;\n    tx_cnt   <= tx_cnt;\n    \n    case (state)\n        IDLE: // Wait for next transmission.\n        begin\n            r_busy <= 0;\n            r_tx <= 1;\n        \tclk_cnt <= clk_cnt;\n            if (i_valid)\n            begin\n                state <= START;\n                data_reg <= i_data;\n                r_busy <= 1;\n            end\n        end\n        \n        START: // Transmit start bit.\n        begin\n            r_tx <= 0;\n            if (clk_cnt >= CLKDIV)\n                state <= SEND;\n        end\n        \n        SEND: // Transmit 8 data bits.\n        begin\n            r_tx <= data_reg[0];\n            \n            if (clk_cnt >= CLKDIV)\n            begin\n            \tdata_reg <= data_reg[7:1];\n            \ttx_cnt <= tx_cnt + 1;\n            end\n            \t\n            if (tx_cnt >= 8)\n            begin\n            \ttx_cnt <= 0;\n                state <= STOP;\n            end\n        end\n        \n        STOP: // Transmit stop bit.\n        begin\n            r_tx <= 1;\n            if (clk_cnt >= CLKDIV)\n                state <= IDLE;\n        end\n    endcase\n    \n    if (clk_cnt >= CLKDIV)\n    \tclk_cnt <= 0;\nend\n\n// output matching\nassign o_busy = r_busy;\nassign o_tx = r_tx;"
              },
              "position": {
                "x": 216,
                "y": 144
              },
              "size": {
                "width": 648,
                "height": 336
              }
            }
          ],
          "wires": [
            {
              "source": {
                "block": "87215bb6-5888-49d9-804f-384b8a75eb7f",
                "port": "constant-out"
              },
              "target": {
                "block": "dcef5368-904d-4a0f-bd0a-2618bf938a4d",
                "port": "CLKDIV"
              }
            },
            {
              "source": {
                "block": "855ac604-c91a-4297-9d8b-a1b968424580",
                "port": "out"
              },
              "target": {
                "block": "dcef5368-904d-4a0f-bd0a-2618bf938a4d",
                "port": "i_valid"
              }
            },
            {
              "source": {
                "block": "5664c9ab-a178-4e87-bf2c-ad21b591cced",
                "port": "out"
              },
              "target": {
                "block": "dcef5368-904d-4a0f-bd0a-2618bf938a4d",
                "port": "i_data"
              },
              "size": 8
            },
            {
              "source": {
                "block": "7746381f-18fe-480e-8fe6-efb470196ee1",
                "port": "out"
              },
              "target": {
                "block": "dcef5368-904d-4a0f-bd0a-2618bf938a4d",
                "port": "clk"
              }
            },
            {
              "source": {
                "block": "dcef5368-904d-4a0f-bd0a-2618bf938a4d",
                "port": "o_busy"
              },
              "target": {
                "block": "0275b275-1136-41ab-90c6-ec1577e485b5",
                "port": "in"
              }
            },
            {
              "source": {
                "block": "dcef5368-904d-4a0f-bd0a-2618bf938a4d",
                "port": "o_tx"
              },
              "target": {
                "block": "e34b8a4b-de1f-4be6-9905-0c8d30336eed",
                "port": "in"
              }
            }
          ]
        }
      }
    },
    "a596a20764aaef555f4e111dc7b0615806954682": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "24ae6458-370f-4994-84bb-6a2824f1344b",
              "type": "basic.input",
              "data": {
                "name": "CLK",
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
                "range": "[15:0]",
                "clock": false,
                "size": 16
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
                "name": "TRIGGERED"
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
                "range": "[15:0]",
                "clock": false,
                "size": 16
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
                "range": "[1:0]",
                "clock": false,
                "size": 2
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
                "name": "NMOS_CTRL"
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
      }
    },
    "34e68748a987dd16aa162d7d9b29a3c836d97f1f": {
      "package": {
        "name": "",
        "version": "",
        "description": "",
        "author": "",
        "image": ""
      },
      "design": {
        "graph": {
          "blocks": [
            {
              "id": "fa07a90f-c020-4aec-9b02-cb4f6739ed0a",
              "type": "basic.output",
              "data": {
                "name": "WIDTH",
                "range": "[15:0]",
                "size": 16
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
                "range": "[15:0]",
                "size": 16
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
                "range": "[7:0]",
                "clock": false,
                "size": 8
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
                "range": "[1:0]",
                "size": 2
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
                "name": "SOFT_TRIG"
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
                "range": "[7:0]",
                "size": 8
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
                "name": "TX_VALID"
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
                "name": "DISARM"
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
      }
    }
  }
}