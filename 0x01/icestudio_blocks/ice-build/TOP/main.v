// Code generated by Icestudio 0.11.0-rc2

`default_nettype none

//---- Top entity
module main (
 input v49fe0a,
 input vee77da,
 output v5da4b6,
 output v0e9b3b,
 output [0:4] vinit
);
 wire w0;
 wire [0:7] w1;
 wire [0:15] w2;
 wire [0:15] w3;
 wire w4;
 wire [0:1] w5;
 wire w6;
 wire [0:7] w7;
 wire w8;
 wire w9;
 wire w10;
 wire w11;
 wire w12;
 wire w13;
 wire w14;
 wire w15;
 wire w16;
 wire w17;
 assign w11 = v49fe0a;
 assign v5da4b6 = w12;
 assign w13 = vee77da;
 assign w14 = vee77da;
 assign w15 = vee77da;
 assign w16 = vee77da;
 assign v0e9b3b = w17;
 assign w14 = w13;
 assign w15 = w13;
 assign w15 = w14;
 assign w16 = w13;
 assign w16 = w14;
 assign w16 = w15;
 vf06659 v973252 (
  .vcf85e9(w7),
  .va7581c(w8),
  .v02b0bb(w11),
  .vcc8b27(w14)
 );
 v1e9d5d vb88b45 (
  .v6407b1(w0),
  .v2a8982(w1),
  .v7d46e8(w9),
  .v0850a4(w12),
  .vb6afa8(w16)
 );
 va596a2 v289d7a (
  .vc367c8(w2),
  .vfed70b(w3),
  .vf6e261(w4),
  .v234140(w5),
  .v379aae(w6),
  .v5cffb0(w10),
  .va451df(w15),
  .vb1faa8(w17)
 );
 v34e687 v2cf542 (
  .vda0439(w0),
  .v2afaaa(w1),
  .v13e4dc(w2),
  .v73c767(w3),
  .v8e2569(w4),
  .v357aa1(w5),
  .vd4115c(w6),
  .vc6ea6a(w7),
  .va62987(w8),
  .v2d34ca(w9),
  .ve09ece(w10),
  .v94c1e6(w13)
 );
 assign vinit = 5'b00000;
endmodule

//---- Top entity
module vf06659 #(
 parameter ve73eb3 = 104
) (
 input vcc8b27,
 input v02b0bb,
 output [7:0] vcf85e9,
 output va7581c
);
 localparam p0 = ve73eb3;
 wire w1;
 wire w2;
 wire [0:7] w3;
 wire w4;
 assign w1 = v02b0bb;
 assign w2 = vcc8b27;
 assign vcf85e9 = w3;
 assign va7581c = w4;
 vf06659_v6703d2 #(
  .CLKDIV(p0)
 ) v6703d2 (
  .i_rx(w1),
  .clk(w2),
  .o_data(w3),
  .o_valid(w4)
 );
endmodule


module vf06659_v6703d2 #(
 parameter CLKDIV = 0
) (
 input clk,
 input i_rx,
 output [7:0] o_data,
 output o_valid
);
 localparam IDLE  = 0;
 localparam DELAY = 1;
 localparam READ  = 2;
 localparam STOP  = 3;
 
 reg[15:0] clk_cnt  = 0;
 reg[ 7:0] rx_cnt   = 0;
 reg[ 1:0] state    = IDLE;
 reg[ 7:0] data_reg = 0;
 
 
 reg r_valid = 0;
 
 assign o_data  = data_reg;
 
 always @ (posedge clk)
 begin
     clk_cnt  <= clk_cnt + 1;
     r_valid  <= 0;
     data_reg <= data_reg;
     state    <= state;
     rx_cnt   <= rx_cnt;
 
     case (state)
         IDLE:
         begin
             clk_cnt <= 0;
             if (!i_rx)
                 state <= DELAY;
         end
 
         DELAY:
         begin
             // Always sample in the center of each symbol.
             if (clk_cnt >= CLKDIV/2)
             begin
                 clk_cnt <= 0;
                 state <= READ;
             end
         end
 
         READ:
         begin
             if (clk_cnt >= CLKDIV)
             begin
                 // Shift bit into data register.
                 data_reg <= {i_rx, data_reg[7:1]};
                 rx_cnt <= rx_cnt + 1;
                 clk_cnt <= 0;
             end
 
             if (rx_cnt >= 8)
             begin
                 rx_cnt <= 0;
                 state <= STOP;
                 r_valid <= 1;
             end
         end
         STOP:
         begin
             if (clk_cnt >= CLKDIV)
                 state <= IDLE;
         end
     endcase
 end
 
 // output matching
 assign o_valid = r_valid;
 
 // for degug only
 always @ (state)
 begin
     if (state == IDLE)
         $display("%m: %t data: %h", $time, data_reg);
 end
endmodule
//---- Top entity
module v1e9d5d #(
 parameter ve01704 = 104
) (
 input vb6afa8,
 input [7:0] v2a8982,
 input v6407b1,
 output v7d46e8,
 output v0850a4
);
 localparam p0 = ve01704;
 wire w1;
 wire [0:7] w2;
 wire w3;
 wire w4;
 wire w5;
 assign w1 = v6407b1;
 assign w2 = v2a8982;
 assign w3 = vb6afa8;
 assign v7d46e8 = w4;
 assign v0850a4 = w5;
 v1e9d5d_v2d795b #(
  .CLKDIV(p0)
 ) v2d795b (
  .i_valid(w1),
  .i_data(w2),
  .clk(w3),
  .o_busy(w4),
  .o_tx(w5)
 );
endmodule


module v1e9d5d_v2d795b #(
 parameter CLKDIV = 0
) (
 input clk,
 input [7:0] i_data,
 input i_valid,
 output o_busy,
 output o_tx
);
 localparam IDLE  = 0;
 localparam START = 1;
 localparam SEND  = 2;
 localparam STOP  = 3;
 
 reg[15:0] clk_cnt   = 0;
 reg[ 7:0] tx_cnt    = 0;
 reg[ 1:0] state     = IDLE;
 reg[ 7:0] data_reg  = 0;
 
 
 reg r_busy = 0;
 reg r_tx   = 1;
 
 
 always @ (posedge clk)
 begin
 	clk_cnt  <= clk_cnt + 1;
     r_busy   <= r_busy;
     r_tx     <= r_tx;
     data_reg <= data_reg;
     state    <= state;
     tx_cnt   <= tx_cnt;
     
     case (state)
         IDLE: // Wait for next transmission.
         begin
             r_busy <= 0;
             r_tx <= 1;
         	clk_cnt <= clk_cnt;
             if (i_valid)
             begin
                 state <= START;
                 data_reg <= i_data;
                 r_busy <= 1;
             end
         end
         
         START: // Transmit start bit.
         begin
             r_tx <= 0;
             if (clk_cnt >= CLKDIV)
                 state <= SEND;
         end
         
         SEND: // Transmit 8 data bits.
         begin
             r_tx <= data_reg[0];
             
             if (clk_cnt >= CLKDIV)
             begin
             	data_reg <= data_reg[7:1];
             	tx_cnt <= tx_cnt + 1;
             end
             	
             if (tx_cnt >= 8)
             begin
             	tx_cnt <= 0;
                 state <= STOP;
             end
         end
         
         STOP: // Transmit stop bit.
         begin
             r_tx <= 1;
             if (clk_cnt >= CLKDIV)
                 state <= IDLE;
         end
     endcase
     
     if (clk_cnt >= CLKDIV)
     	clk_cnt <= 0;
 end
 
 // output matching
 assign o_busy = r_busy;
 assign o_tx = r_tx;
endmodule
//---- Top entity
module va596a2 (
 input va451df,
 input [15:0] vc367c8,
 input [15:0] vfed70b,
 input [1:0] v234140,
 input vf6e261,
 input v379aae,
 input v37d81e,
 output v5cffb0,
 output vb1faa8
);
 wire w0;
 wire [0:15] w1;
 wire [0:15] w2;
 wire [0:1] w3;
 wire w4;
 wire w5;
 wire w6;
 wire w7;
 wire w8;
 assign w0 = va451df;
 assign w1 = vc367c8;
 assign w2 = vfed70b;
 assign w3 = v234140;
 assign w4 = vf6e261;
 assign w5 = v379aae;
 assign w6 = v37d81e;
 assign vb1faa8 = w7;
 assign v5cffb0 = w8;
 va596a2_v03bddb v03bddb (
  .clk(w0),
  .i_width_reg(w1),
  .i_delay_reg(w2),
  .i_trigger_edge(w3),
  .i_trigger_now(w4),
  .i_trigger_disarm(w5),
  .i_trigger_ext(w6),
  .o_glitch(w7),
  .o_trigger_done(w8)
 );
endmodule


module va596a2_v03bddb (
 input clk,
 input [15:0] i_width_reg,
 input [15:0] i_delay_reg,
 input [1:0] i_trigger_edge,
 input i_trigger_now,
 input i_trigger_disarm,
 input i_trigger_ext,
 output o_trigger_done,
 output o_glitch
);
 // trigger edge configuration
 localparam SOFT = 0;
 localparam RISING = 1;
 localparam FALLING = 2;
 localparam BOTH = 3;
 
 //  ------------------------------------------------------------------
 //      Sync-in external signals
 //  ------------------------------------------------------------------
 
 localparam syncin = 3;      // optimal 2..3
 
 reg [syncin:0] r_shiftreg_ext = 0;
 
 // external trigger
 always @ (posedge clk)
 begin
     r_shiftreg_ext <= {i_trigger_ext, r_shiftreg_ext[syncin:1]};
 end
 
 reg [1:0] r_shiftreg_now = 0;   // bar minimum for edge detection
 
 // trigger now
 always @ (posedge clk)
 begin
     r_shiftreg_now <= {i_trigger_now, r_shiftreg_now[1]};
 end
 
 //  ------------------------------------------------------------------
 //      Edge detection
 //  ------------------------------------------------------------------
 
 // external trigger
 wire w_rising_ext = (r_shiftreg_ext[1] && !r_shiftreg_ext[0]);
 wire w_falling_ext = (!r_shiftreg_ext[1] && r_shiftreg_ext[0]);
 
 // trigger now
 wire w_rising_now = (r_shiftreg_now[1] && !r_shiftreg_now[0]);
 
 //  ------------------------------------------------------------------
 //      Timer
 //  ------------------------------------------------------------------
 
 // pulse width
 reg [15:0] r_width_reg;
 wire w_width_done = (r_width_reg == 1);
 
 // delay width
 reg [15:0] r_delay_reg;
 wire w_delay_done = (r_delay_reg == 1);
 
 //  ------------------------------------------------------------------
 //      Finite State Machine
 //  ------------------------------------------------------------------
 
     // states w/ encoding
     localparam IDLE  = 0;
     localparam DELAY = 1;
     localparam SHOT = 2;
     localparam DONE = 3;
     localparam STOP = 4;
 
 reg [3:0] w_nextstate;                  // cased !!
 reg [3:0] r_currentstate = IDLE;
 
 // combinatorial, next state process
 always @ (r_currentstate,
           w_rising_now, w_rising_ext, w_falling_ext,
           w_delay_done, w_width_done)
 begin
     case (r_currentstate)
         IDLE:   case (i_trigger_edge)
                     // select trigger condition regarding configuration
                     SOFT:   if (w_rising_now)   // software only
                                 w_nextstate = SHOT;
                             else
                                 w_nextstate = r_currentstate;
                     RISING: if (w_rising_ext)   // external w/ rising edge
                                 w_nextstate = DELAY;
                             else
                                 w_nextstate = r_currentstate;
                     FALLING:if (w_falling_ext)  // external w/ falling edge
                                 w_nextstate = DELAY;
                             else
                                 w_nextstate = r_currentstate;
                     default:if (w_rising_ext || w_falling_ext) // external on both edges
                                 w_nextstate = DELAY;
                             else
                                 w_nextstate = r_currentstate;
                 endcase
         DELAY:  if (w_delay_done)   // wait, delay configured time
                     w_nextstate = SHOT;
                 else
                     w_nextstate = r_currentstate;
         SHOT:   if (w_width_done)   // shot, width time
                     w_nextstate = DONE;
                 else
                     w_nextstate = r_currentstate;
         DONE:   w_nextstate = STOP; // just one clock cycle
         STOP:   if (i_trigger_disarm)
                     w_nextstate = r_currentstate; // hold as long as disarmed
                 else
                     w_nextstate = IDLE; // run continously, next shot
         default: w_nextstate = IDLE; // something went wrong
     endcase
 end
 
 // registered, current state process
 always @ (posedge clk)
 begin
     r_currentstate <= w_nextstate;
 end
 
 
 //  ------------------------------------------------------------------
 //      internal timer (register)
 //  ------------------------------------------------------------------
 
 // pulse width
 always @ (posedge clk)
 begin
     case (r_currentstate)
         IDLE:   r_width_reg <= i_width_reg;
         SHOT:   r_width_reg <= r_width_reg - 1; // count down
         default:r_width_reg <= r_width_reg;  // hold
     endcase
 end
 
 // delay width
 always @ (posedge clk)
 begin
     case (r_currentstate)
         IDLE:   r_delay_reg <= i_delay_reg;
         DELAY:  r_delay_reg <= r_delay_reg - 1; // count down
         default:r_delay_reg <= r_delay_reg;  // hold
     endcase
 end
 
 //  ------------------------------------------------------------------
 //      glitch
 //  ------------------------------------------------------------------
 
 // just the state
 assign o_glitch = (SHOT == r_currentstate);
 
 //  ------------------------------------------------------------------
 //      feed back
 //  ------------------------------------------------------------------
 
 // just the state
 assign o_trigger_done = (DONE == r_currentstate);
endmodule
//---- Top entity
module v34e687 (
 input v94c1e6,
 input [7:0] vc6ea6a,
 input va62987,
 input v2d34ca,
 input ve09ece,
 output [15:0] v13e4dc,
 output [15:0] v73c767,
 output [1:0] v357aa1,
 output v8e2569,
 output [7:0] v2afaaa,
 output vda0439,
 output vd4115c
);
 wire [0:15] w0;
 wire [0:15] w1;
 wire [0:1] w2;
 wire w3;
 wire [0:7] w4;
 wire w5;
 wire w6;
 wire w7;
 wire [0:7] w8;
 wire w9;
 wire w10;
 wire w11;
 assign v13e4dc = w0;
 assign v73c767 = w1;
 assign v357aa1 = w2;
 assign v8e2569 = w3;
 assign v2afaaa = w4;
 assign vda0439 = w5;
 assign vd4115c = w6;
 assign w7 = v94c1e6;
 assign w8 = vc6ea6a;
 assign w9 = va62987;
 assign w10 = v2d34ca;
 assign w11 = ve09ece;
 v34e687_vf9ba7c vf9ba7c (
  .o_width_reg(w0),
  .o_delay_reg(w1),
  .o_trigger_edge(w2),
  .o_trigger_now(w3),
  .o_data_reg(w4),
  .o_valid_tx(w5),
  .o_disarm(w6),
  .clk(w7),
  .i_data_reg(w8),
  .i_valid_rx(w9),
  .i_busy(w10),
  .i_trigger_done(w11)
 );
endmodule


module v34e687_vf9ba7c (
 input clk,
 input [7:0] i_data_reg,
 input i_valid_rx,
 input i_busy,
 input i_trigger_done,
 output [15:0] o_width_reg,
 output [15:0] o_delay_reg,
 output [1:0] o_trigger_edge,
 output o_trigger_now,
 output [7:0] o_data_reg,
 output o_valid_tx,
 output o_disarm
);
 // latch in
 reg [7:0] r_data_reg = 0;
 always @ (posedge clk)
 begin
     r_data_reg <= (i_valid_rx)? i_data_reg: r_data_reg;
 end
 
 // internal command code representation, shorted for case-insensitive 7-bit code
 wire [5:0] w_commandcode = {i_data_reg[6], i_data_reg[4:0]};
 
 //  ------------------------------------------------------------------
 //      Finite State Machine
 //  ------------------------------------------------------------------
 
     // states w/ encoding
     localparam IDLE     = 0;
     localparam CCMD     = 1;
     localparam CHIGH    = 2;
     localparam CLOW     = 3;
     localparam DCMD     = 4;
     localparam DHIGH    = 5;
     localparam DLOW     = 6;
     localparam TRIG     = 7;
     localparam WCMD     = 8;
     localparam WHIGH    = 9;
     localparam WLOW     = 10;
     //
     localparam RESET    = 11;
     //
     localparam BACKD    = 16;
     localparam BACKDH   = 17;
     localparam BACKDL   = 18;
     localparam BACKW    = 19;
     localparam BACKWH   = 20;
     localparam BACKWL   = 21;
     localparam BACKC    = 22;
     localparam BACKCH   = 23;
     localparam BACKCL   = 24;
     localparam BACKS    = 25;
     localparam BACKSH   = 26;
     localparam BACKSL   = 27;
     
 reg [4:0] w_nextstate;                  // cased !!
 reg [4:0] r_currentstate = IDLE;
 
 
 // combinatorial, next state process
 always @* // (r_currentstate, w_commandcode)
 begin
     case (r_currentstate)
         IDLE:   if (i_valid_rx)
                     case (w_commandcode)
                     'b1_0_0010: w_nextstate = BACKD;// 'B'
                     'b1_0_0011: w_nextstate = CCMD; // 'C'
                     'b1_0_0100: w_nextstate = DCMD; // 'D'
                     'b1_1_0011: w_nextstate = BACKS;// 'S'
                     'b1_1_0100: w_nextstate = TRIG; // 'T'
                     'b1_1_0111: w_nextstate = WCMD; // 'W'
                     'b1_1_0010: w_nextstate = RESET;// 'R'
                     default:    w_nextstate = r_currentstate; // hold
                     endcase
                 else
                     w_nextstate = r_currentstate; // hold
         WCMD:   if (i_valid_rx)
                     w_nextstate = WHIGH;
                 else
                     w_nextstate = r_currentstate; // hold
         WHIGH:  if (i_valid_rx)
                     w_nextstate = WLOW;
                 else
                     w_nextstate = r_currentstate; // hold
         WLOW:   if (i_valid_rx)
                     case (w_commandcode)
                     'b1_0_0010: w_nextstate = BACKD;// 'B'
                     'b1_0_0011: w_nextstate = CCMD; // 'C'
                     'b1_1_0011: w_nextstate = BACKS;// 'S'
                     'b1_1_0100: w_nextstate = TRIG; // 'T'
                     'b1_1_0010: w_nextstate = RESET;// 'R'
                     default:    w_nextstate = r_currentstate; // hold
                     endcase
                 else
                     w_nextstate = r_currentstate; // hold
         DCMD:   if (i_valid_rx)
                     w_nextstate = DHIGH;
                 else
                     w_nextstate = r_currentstate; // hold
         DHIGH:  if (i_valid_rx)
                     w_nextstate = DLOW;
                 else
                     w_nextstate = r_currentstate; // hold
         DLOW:   if (i_valid_rx)
                     case (w_commandcode)
                     'b1_0_0010: w_nextstate = BACKD;// 'B'
                     'b1_1_0011: w_nextstate = BACKS;// 'S'
                     'b1_1_0111: w_nextstate = WCMD; // 'W'
                     'b1_1_0010: w_nextstate = RESET;// 'R'
                     default:    w_nextstate = r_currentstate; // hold
                     endcase
                 else
                     w_nextstate = r_currentstate; // hold
         CCMD:   if (i_valid_rx)
                     w_nextstate = CHIGH;
                 else
                     w_nextstate = r_currentstate; // hold
         CHIGH:  if (i_valid_rx)
                     w_nextstate = CLOW;
                 else
                     w_nextstate = r_currentstate; // hold
         CLOW:   if (i_valid_rx)
                     case (w_commandcode)
                     'b1_0_0010: w_nextstate = BACKD;// 'B'
                     'b1_1_0011: w_nextstate = BACKS;// 'S'
                     'b1_1_0010: w_nextstate = RESET;// 'R'
                     default:    w_nextstate = r_currentstate; // hold
                     endcase
                 else
                     w_nextstate = r_currentstate; // hold
         TRIG:   if (i_valid_rx)
                     case (w_commandcode)
                     'b1_0_0010: w_nextstate = BACKD;// 'B'
                     'b1_1_0011: w_nextstate = BACKS;// 'S'
                     'b1_1_0010: w_nextstate = RESET;// 'R'
                     default:    w_nextstate = r_currentstate; // hold
                     endcase
                 else
                     w_nextstate = r_currentstate; // hold
         BACKD:  if (!i_busy)
                     w_nextstate = BACKDH;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKDH: if (!i_busy)
                     w_nextstate = BACKDL;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKDL: if (!i_busy)
                     w_nextstate = BACKW;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKW:  if (!i_busy)
                     w_nextstate = BACKWH;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKWH: if (!i_busy)
                     w_nextstate = BACKWL;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKWL: if (!i_busy)
                     w_nextstate = BACKC;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKC:  if (!i_busy)
                     w_nextstate = BACKCH;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKCH: if (!i_busy)
                     w_nextstate = BACKCL;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKCL: if (!i_busy)
                     w_nextstate = IDLE;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKS:  if (!i_busy)
                     w_nextstate = BACKSH;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKSH: if (!i_busy)
                     w_nextstate = BACKSL;
                 else
                     w_nextstate = r_currentstate; // hold
         BACKSL: if (!i_busy)
                     w_nextstate = IDLE;
                 else
                     w_nextstate = r_currentstate; // hold
         default: w_nextstate = IDLE; // something went wrong
     endcase 
 end
 
 
 // registered, current state process
 always @ (posedge clk)
 begin
     r_currentstate <= w_nextstate;
 end
 
 
 //  ------------------------------------------------------------------
 //      internal storage (register)
 //  ------------------------------------------------------------------
 
 reg [15:0] r_width_reg      = 0;
 reg [15:0] r_delay_reg      = 0;
 reg [15:0] r_config_reg     = 0;
 reg [15:0] r_shotcount_reg  = 0;
 
 // pulse width
 always @ (posedge clk)
 begin
     case (r_currentstate)
         RESET:  r_width_reg <= 0;    // clear
         WHIGH:  r_width_reg[15:8] <= r_data_reg; // get MSB
         WLOW:   r_width_reg[7:0]  <= r_data_reg;  // get LSB
         default: r_width_reg <= r_width_reg;     // hold
     endcase
 end
 
 assign o_width_reg = r_width_reg;
 
 
 // delay width
 always @ (posedge clk)
 begin
     case (r_currentstate)
         RESET:  r_delay_reg <= 0;    // clear
         DHIGH:  r_delay_reg[15:8] <= r_data_reg; // get MSB
         DLOW:   r_delay_reg[7:0]  <= r_data_reg;  // get LSB
         default: r_delay_reg <= r_delay_reg;     // hold
     endcase
 end
 
 assign o_delay_reg = r_delay_reg;
 
 
 // configuration
 always @ (posedge clk)
 begin
     if (r_config_reg[2] && i_trigger_done)
         // disarm configuration
         r_config_reg <= 0;  // clear
     else case (r_currentstate)
             RESET:  r_config_reg <= 0;   // clear
             CHIGH:  r_config_reg[15:8] <= 'd0; //r_data_reg;// get MSB
             CLOW:   r_config_reg[7:0]  <= {5'd0, r_data_reg[2:0]}; // get LSB
             default: r_config_reg <= r_config_reg;
         endcase
 end
 
 assign o_trigger_edge = r_config_reg[1:0];
 assign o_disarm = r_config_reg[2];
 
 // shot count
 always @ (posedge clk)
 begin
     if (i_trigger_done)
         r_shotcount_reg <= r_shotcount_reg + 1; // count
     else case (r_currentstate)
             RESET:  r_shotcount_reg <= 0;   // clear
             default: r_shotcount_reg <= r_shotcount_reg;
         endcase
 end
 
 //  ------------------------------------------------------------------
 //      Read Back
 //  ------------------------------------------------------------------
 
 reg w_valid_tx; // cased
 reg [7:00] w_data_reg; // cased!!
 
 // output data multiplexor
 always @ (r_currentstate, i_busy, r_delay_reg, r_width_reg, r_config_reg)
 begin
     case (r_currentstate)
         BACKD:  begin
                 w_data_reg = "D";
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKDH: begin
                 w_data_reg = r_delay_reg[15:8];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKDL: begin
                 w_data_reg = r_delay_reg[7:0];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKW:  begin
                 w_data_reg = "W";
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKWH: begin
                 w_data_reg = r_width_reg[15:8];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKWL: begin
                 w_data_reg = r_width_reg[7:0];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKC:  begin
                 w_data_reg = "C";
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKCH: begin
                 w_data_reg = r_config_reg[15:8];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKCL: begin
                 w_data_reg = r_config_reg[7:0];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKS:  begin
                 w_data_reg = "S";
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKSH: begin
                 w_data_reg = r_shotcount_reg[15:8];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         BACKSL: begin
                 w_data_reg = r_shotcount_reg[7:0];
                 w_valid_tx = !i_busy;   // this becomes Mealy-like
                 end
         default:begin
                 w_data_reg = 'd0;
                 w_valid_tx = 'b0;
                 end
     endcase
 end
 
 // output matching
 assign o_data_reg = w_data_reg;
 assign o_valid_tx = w_valid_tx;
 
 //  ------------------------------------------------------------------
 //      Trigger
 //  ------------------------------------------------------------------
 
 // just the state
 assign o_trigger_now = (TRIG == r_currentstate);
endmodule
