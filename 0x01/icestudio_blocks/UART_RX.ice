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
          "id": "b0de2c90-2916-4b75-bb4a-6f115b89f0d0",
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
            "x": 24,
            "y": 192
          }
        },
        {
          "id": "083dd726-5525-47e3-ba4b-f0993a44da82",
          "type": "basic.output",
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
            ]
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
            "x": 24,
            "y": 408
          }
        },
        {
          "id": "7c2a81cc-afb2-472a-a01c-8cbd1774e342",
          "type": "basic.output",
          "data": {
            "name": "RX_VALID",
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
  },
  "dependencies": {}
}