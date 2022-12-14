module DivSqrtRecFNToRaw_small(
  input         clock,
  input         reset,
  output        io_inReady,
  input         io_inValid,
  input         io_sqrtOp,
  input  [32:0] io_a,
  input  [32:0] io_b,
  input  [2:0]  io_roundingMode,
  output        io_rawOutValid_div,
  output        io_rawOutValid_sqrt,
  output [2:0]  io_roundingModeOut,
  output        io_invalidExc,
  output        io_infiniteExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [26:0] io_rawOut_sig
);
  wire  divSqrtRawFN__clock; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__reset; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_inReady; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_inValid; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_sqrtOp; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_a_isNaN; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_a_isInf; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_a_isZero; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_a_sign; // @[DivSqrtRecFN_small.scala 444:15]
  wire [9:0] divSqrtRawFN__io_a_sExp; // @[DivSqrtRecFN_small.scala 444:15]
  wire [24:0] divSqrtRawFN__io_a_sig; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_b_isNaN; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_b_isInf; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_b_isZero; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_b_sign; // @[DivSqrtRecFN_small.scala 444:15]
  wire [9:0] divSqrtRawFN__io_b_sExp; // @[DivSqrtRecFN_small.scala 444:15]
  wire [24:0] divSqrtRawFN__io_b_sig; // @[DivSqrtRecFN_small.scala 444:15]
  wire [2:0] divSqrtRawFN__io_roundingMode; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_rawOutValid_div; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_rawOutValid_sqrt; // @[DivSqrtRecFN_small.scala 444:15]
  wire [2:0] divSqrtRawFN__io_roundingModeOut; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_invalidExc; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_infiniteExc; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_rawOut_isNaN; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_rawOut_isInf; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_rawOut_isZero; // @[DivSqrtRecFN_small.scala 444:15]
  wire  divSqrtRawFN__io_rawOut_sign; // @[DivSqrtRecFN_small.scala 444:15]
  wire [9:0] divSqrtRawFN__io_rawOut_sExp; // @[DivSqrtRecFN_small.scala 444:15]
  wire [26:0] divSqrtRawFN__io_rawOut_sig; // @[DivSqrtRecFN_small.scala 444:15]
  wire [8:0] divSqrtRawFN_io_a_exp = io_a[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  divSqrtRawFN_io_a_isZero = divSqrtRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  divSqrtRawFN_io_a_isSpecial = divSqrtRawFN_io_a_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _divSqrtRawFN_io_a_out_sig_T = ~divSqrtRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] divSqrtRawFN_io_a_out_sig_hi = {1'h0,_divSqrtRawFN_io_a_out_sig_T}; // @[Cat.scala 31:58]
  wire [8:0] divSqrtRawFN_io_b_exp = io_b[31:23]; // @[rawFloatFromRecFN.scala 50:21]
  wire  divSqrtRawFN_io_b_isZero = divSqrtRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  divSqrtRawFN_io_b_isSpecial = divSqrtRawFN_io_b_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  _divSqrtRawFN_io_b_out_sig_T = ~divSqrtRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [1:0] divSqrtRawFN_io_b_out_sig_hi = {1'h0,_divSqrtRawFN_io_b_out_sig_T}; // @[Cat.scala 31:58]
  DivSqrtRawFN_small divSqrtRawFN_ ( // @[DivSqrtRecFN_small.scala 444:15]
    .clock(divSqrtRawFN__clock),
    .reset(divSqrtRawFN__reset),
    .io_inReady(divSqrtRawFN__io_inReady),
    .io_inValid(divSqrtRawFN__io_inValid),
    .io_sqrtOp(divSqrtRawFN__io_sqrtOp),
    .io_a_isNaN(divSqrtRawFN__io_a_isNaN),
    .io_a_isInf(divSqrtRawFN__io_a_isInf),
    .io_a_isZero(divSqrtRawFN__io_a_isZero),
    .io_a_sign(divSqrtRawFN__io_a_sign),
    .io_a_sExp(divSqrtRawFN__io_a_sExp),
    .io_a_sig(divSqrtRawFN__io_a_sig),
    .io_b_isNaN(divSqrtRawFN__io_b_isNaN),
    .io_b_isInf(divSqrtRawFN__io_b_isInf),
    .io_b_isZero(divSqrtRawFN__io_b_isZero),
    .io_b_sign(divSqrtRawFN__io_b_sign),
    .io_b_sExp(divSqrtRawFN__io_b_sExp),
    .io_b_sig(divSqrtRawFN__io_b_sig),
    .io_roundingMode(divSqrtRawFN__io_roundingMode),
    .io_rawOutValid_div(divSqrtRawFN__io_rawOutValid_div),
    .io_rawOutValid_sqrt(divSqrtRawFN__io_rawOutValid_sqrt),
    .io_roundingModeOut(divSqrtRawFN__io_roundingModeOut),
    .io_invalidExc(divSqrtRawFN__io_invalidExc),
    .io_infiniteExc(divSqrtRawFN__io_infiniteExc),
    .io_rawOut_isNaN(divSqrtRawFN__io_rawOut_isNaN),
    .io_rawOut_isInf(divSqrtRawFN__io_rawOut_isInf),
    .io_rawOut_isZero(divSqrtRawFN__io_rawOut_isZero),
    .io_rawOut_sign(divSqrtRawFN__io_rawOut_sign),
    .io_rawOut_sExp(divSqrtRawFN__io_rawOut_sExp),
    .io_rawOut_sig(divSqrtRawFN__io_rawOut_sig)
  );
  assign io_inReady = divSqrtRawFN__io_inReady; // @[DivSqrtRecFN_small.scala 446:16]
  assign io_rawOutValid_div = divSqrtRawFN__io_rawOutValid_div; // @[DivSqrtRecFN_small.scala 453:25]
  assign io_rawOutValid_sqrt = divSqrtRawFN__io_rawOutValid_sqrt; // @[DivSqrtRecFN_small.scala 454:25]
  assign io_roundingModeOut = divSqrtRawFN__io_roundingModeOut; // @[DivSqrtRecFN_small.scala 455:25]
  assign io_invalidExc = divSqrtRawFN__io_invalidExc; // @[DivSqrtRecFN_small.scala 456:25]
  assign io_infiniteExc = divSqrtRawFN__io_infiniteExc; // @[DivSqrtRecFN_small.scala 457:25]
  assign io_rawOut_isNaN = divSqrtRawFN__io_rawOut_isNaN; // @[DivSqrtRecFN_small.scala 458:25]
  assign io_rawOut_isInf = divSqrtRawFN__io_rawOut_isInf; // @[DivSqrtRecFN_small.scala 458:25]
  assign io_rawOut_isZero = divSqrtRawFN__io_rawOut_isZero; // @[DivSqrtRecFN_small.scala 458:25]
  assign io_rawOut_sign = divSqrtRawFN__io_rawOut_sign; // @[DivSqrtRecFN_small.scala 458:25]
  assign io_rawOut_sExp = divSqrtRawFN__io_rawOut_sExp; // @[DivSqrtRecFN_small.scala 458:25]
  assign io_rawOut_sig = divSqrtRawFN__io_rawOut_sig; // @[DivSqrtRecFN_small.scala 458:25]
  assign divSqrtRawFN__clock = clock;
  assign divSqrtRawFN__reset = reset;
  assign divSqrtRawFN__io_inValid = io_inValid; // @[DivSqrtRecFN_small.scala 447:34]
  assign divSqrtRawFN__io_sqrtOp = io_sqrtOp; // @[DivSqrtRecFN_small.scala 448:34]
  assign divSqrtRawFN__io_a_isNaN = divSqrtRawFN_io_a_isSpecial & divSqrtRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign divSqrtRawFN__io_a_isInf = divSqrtRawFN_io_a_isSpecial & ~divSqrtRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign divSqrtRawFN__io_a_isZero = divSqrtRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign divSqrtRawFN__io_a_sign = io_a[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign divSqrtRawFN__io_a_sExp = {1'b0,$signed(divSqrtRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign divSqrtRawFN__io_a_sig = {divSqrtRawFN_io_a_out_sig_hi,io_a[22:0]}; // @[Cat.scala 31:58]
  assign divSqrtRawFN__io_b_isNaN = divSqrtRawFN_io_b_isSpecial & divSqrtRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 55:33]
  assign divSqrtRawFN__io_b_isInf = divSqrtRawFN_io_b_isSpecial & ~divSqrtRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign divSqrtRawFN__io_b_isZero = divSqrtRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign divSqrtRawFN__io_b_sign = io_b[32]; // @[rawFloatFromRecFN.scala 58:25]
  assign divSqrtRawFN__io_b_sExp = {1'b0,$signed(divSqrtRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  assign divSqrtRawFN__io_b_sig = {divSqrtRawFN_io_b_out_sig_hi,io_b[22:0]}; // @[Cat.scala 31:58]
  assign divSqrtRawFN__io_roundingMode = io_roundingMode; // @[DivSqrtRecFN_small.scala 451:34]
endmodule
