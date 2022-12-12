module FPToFP(
  input         clock,
  input         reset,
  input         io_in_valid,
  input         io_in_bits_ren2,
  input  [1:0]  io_in_bits_typeTagOut,
  input         io_in_bits_wflags,
  input  [2:0]  io_in_bits_rm,
  input  [64:0] io_in_bits_in1,
  input  [64:0] io_in_bits_in2,
  output [64:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc,
  input         io_lt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [95:0] _RAND_5;
  reg [95:0] _RAND_6;
  reg [95:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire [64:0] narrower_io_in; // @[FPU.scala 613:30]
  wire [2:0] narrower_io_roundingMode; // @[FPU.scala 613:30]
  wire [32:0] narrower_io_out; // @[FPU.scala 613:30]
  wire [4:0] narrower_io_exceptionFlags; // @[FPU.scala 613:30]
  reg  inPipe_valid; // @[Valid.scala 127:22]
  reg  inPipe_bits_ren2; // @[Reg.scala 16:16]
  reg [1:0] inPipe_bits_typeTagOut; // @[Reg.scala 16:16]
  reg  inPipe_bits_wflags; // @[Reg.scala 16:16]
  reg [2:0] inPipe_bits_rm; // @[Reg.scala 16:16]
  reg [64:0] inPipe_bits_in1; // @[Reg.scala 16:16]
  reg [64:0] inPipe_bits_in2; // @[Reg.scala 16:16]
  wire [64:0] _signNum_T_1 = inPipe_bits_in1 ^ inPipe_bits_in2; // @[FPU.scala 576:48]
  wire [64:0] _signNum_T_3 = ~inPipe_bits_in2; // @[FPU.scala 576:82]
  wire [64:0] _signNum_T_4 = inPipe_bits_rm[0] ? _signNum_T_3 : inPipe_bits_in2; // @[FPU.scala 576:66]
  wire [64:0] signNum = inPipe_bits_rm[1] ? _signNum_T_1 : _signNum_T_4; // @[FPU.scala 576:20]
  wire [64:0] fsgnj = {signNum[64],inPipe_bits_in1[63:0]}; // @[Cat.scala 31:58]
  wire  isnan1 = &inPipe_bits_in1[63:61]; // @[FPU.scala 244:56]
  wire  isnan2 = &inPipe_bits_in2[63:61]; // @[FPU.scala 244:56]
  wire  _isInvalid_T_4 = isnan1 & ~inPipe_bits_in1[51]; // @[FPU.scala 245:34]
  wire  _isInvalid_T_9 = isnan2 & ~inPipe_bits_in2[51]; // @[FPU.scala 245:34]
  wire  isInvalid = _isInvalid_T_4 | _isInvalid_T_9; // @[FPU.scala 586:49]
  wire  isNaNOut = isnan1 & isnan2; // @[FPU.scala 587:27]
  wire  isLHS = isnan2 | inPipe_bits_rm[0] != io_lt & ~isnan1; // @[FPU.scala 588:24]
  wire [4:0] _fsgnjMux_exc_T = {isInvalid, 4'h0}; // @[FPU.scala 589:31]
  wire [64:0] _fsgnjMux_data_T = isLHS ? inPipe_bits_in1 : inPipe_bits_in2; // @[FPU.scala 590:53]
  wire [64:0] _fsgnjMux_data_T_1 = isNaNOut ? 65'he008000000000000 : _fsgnjMux_data_T; // @[FPU.scala 590:25]
  wire [4:0] _GEN_23 = inPipe_bits_wflags ? _fsgnjMux_exc_T : 5'h0; // @[FPU.scala 580:16 583:25 589:18]
  wire [64:0] _GEN_24 = inPipe_bits_wflags ? _fsgnjMux_data_T_1 : fsgnj; // @[FPU.scala 581:17 583:25 590:19]
  wire  _T = inPipe_bits_typeTagOut == 2'h0; // @[FPU.scala 597:18]
  wire [64:0] widened = isnan1 ? 65'he008000000000000 : inPipe_bits_in1; // @[FPU.scala 605:24]
  wire [64:0] fsgnjMux_data = inPipe_bits_wflags & ~inPipe_bits_ren2 ? widened : _GEN_24; // @[FPU.scala 602:42 606:21]
  wire  mux_data_sign = fsgnjMux_data[64]; // @[FPU.scala 269:17]
  wire [51:0] mux_data_fractIn = fsgnjMux_data[51:0]; // @[FPU.scala 270:20]
  wire [11:0] mux_data_expIn = fsgnjMux_data[63:52]; // @[FPU.scala 271:18]
  wire [75:0] _mux_data_fractOut_T = {mux_data_fractIn, 24'h0}; // @[FPU.scala 272:28]
  wire [22:0] mux_data_fractOut = _mux_data_fractOut_T[75:53]; // @[FPU.scala 272:38]
  wire [2:0] mux_data_expOut_expCode = mux_data_expIn[11:9]; // @[FPU.scala 274:26]
  wire [11:0] _mux_data_expOut_commonCase_T_1 = mux_data_expIn + 12'h100; // @[FPU.scala 275:31]
  wire [11:0] mux_data_expOut_commonCase = _mux_data_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 275:48]
  wire [8:0] _mux_data_expOut_T_4 = {mux_data_expOut_expCode,mux_data_expOut_commonCase[5:0]}; // @[Cat.scala 31:58]
  wire [8:0] mux_data_expOut = mux_data_expOut_expCode == 3'h0 | mux_data_expOut_expCode >= 3'h6 ? _mux_data_expOut_T_4
     : mux_data_expOut_commonCase[8:0]; // @[FPU.scala 276:10]
  wire [64:0] _mux_data_T_2 = {fsgnjMux_data[64:33],mux_data_sign,mux_data_expOut,mux_data_fractOut}; // @[Cat.scala 31:58]
  wire [64:0] _GEN_25 = inPipe_bits_typeTagOut == 2'h0 ? _mux_data_T_2 : fsgnjMux_data; // @[FPU.scala 597:34 598:16]
  wire [4:0] _fsgnjMux_exc_T_6 = {_isInvalid_T_4, 4'h0}; // @[FPU.scala 607:51]
  wire [64:0] _mux_data_T_4 = {fsgnjMux_data[64:33],narrower_io_out}; // @[Cat.scala 31:58]
  wire [4:0] fsgnjMux_exc = inPipe_bits_wflags & ~inPipe_bits_ren2 ? _fsgnjMux_exc_T_6 : _GEN_23; // @[FPU.scala 602:42 607:20]
  reg [64:0] io_out_b_data; // @[Reg.scala 16:16]
  reg [4:0] io_out_b_exc; // @[Reg.scala 16:16]
  RecFNToRecFN narrower ( // @[FPU.scala 613:30]
    .io_in(narrower_io_in),
    .io_roundingMode(narrower_io_roundingMode),
    .io_out(narrower_io_out),
    .io_exceptionFlags(narrower_io_exceptionFlags)
  );
  assign io_out_bits_data = io_out_b_data; // @[Valid.scala 122:21 124:16]
  assign io_out_bits_exc = io_out_b_exc; // @[Valid.scala 122:21 124:16]
  assign narrower_io_in = inPipe_bits_in1; // @[Valid.scala 122:21 124:16]
  assign narrower_io_roundingMode = inPipe_bits_rm; // @[Valid.scala 122:21 124:16]
  always @(posedge clock) begin
    if (reset) begin // @[Valid.scala 127:22]
      inPipe_valid <= 1'h0; // @[Valid.scala 127:22]
    end else begin
      inPipe_valid <= io_in_valid; // @[Valid.scala 127:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_ren2 <= io_in_bits_ren2; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_typeTagOut <= io_in_bits_typeTagOut; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_wflags <= io_in_bits_wflags; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_rm <= io_in_bits_rm; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_in1 <= io_in_bits_in1; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_in2 <= io_in_bits_in2; // @[Reg.scala 17:22]
    end
    if (inPipe_valid) begin // @[Reg.scala 17:18]
      if (inPipe_bits_wflags & ~inPipe_bits_ren2) begin // @[FPU.scala 602:42]
        if (_T) begin // @[FPU.scala 612:120]
          io_out_b_data <= _mux_data_T_4; // @[FPU.scala 618:18]
        end else begin
          io_out_b_data <= _GEN_25;
        end
      end else begin
        io_out_b_data <= _GEN_25;
      end
    end
    if (inPipe_valid) begin // @[Reg.scala 17:18]
      if (inPipe_bits_wflags & ~inPipe_bits_ren2) begin // @[FPU.scala 602:42]
        if (_T) begin // @[FPU.scala 612:120]
          io_out_b_exc <= narrower_io_exceptionFlags; // @[FPU.scala 619:17]
        end else begin
          io_out_b_exc <= fsgnjMux_exc;
        end
      end else begin
        io_out_b_exc <= fsgnjMux_exc;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  inPipe_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  inPipe_bits_ren2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  inPipe_bits_typeTagOut = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  inPipe_bits_wflags = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  inPipe_bits_rm = _RAND_4[2:0];
  _RAND_5 = {3{`RANDOM}};
  inPipe_bits_in1 = _RAND_5[64:0];
  _RAND_6 = {3{`RANDOM}};
  inPipe_bits_in2 = _RAND_6[64:0];
  _RAND_7 = {3{`RANDOM}};
  io_out_b_data = _RAND_7[64:0];
  _RAND_8 = {1{`RANDOM}};
  io_out_b_exc = _RAND_8[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
