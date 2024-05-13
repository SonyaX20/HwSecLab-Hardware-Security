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
          "id": "7746381f-18fe-480e-8fe6-efb470196ee1",
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
            "x": -40,
            "y": 168
          }
        },
        {
          "id": "0275b275-1136-41ab-90c6-ec1577e485b5",
          "type": "basic.output",
          "data": {
            "name": "TX_BUSY",
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
            "y": 200
          }
        },
        {
          "id": "5664c9ab-a178-4e87-bf2c-ad21b591cced",
          "type": "basic.input",
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
            ],
            "clock": false
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
            "name": "TX",
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
            "y": 368
          }
        },
        {
          "id": "855ac604-c91a-4297-9d8b-a1b968424580",
          "type": "basic.input",
          "data": {
            "name": "TX_VALID",
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
  },
  "dependencies": {}
}