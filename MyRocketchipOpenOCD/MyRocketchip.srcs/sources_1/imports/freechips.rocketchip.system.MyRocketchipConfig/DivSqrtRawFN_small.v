module DivSqrtRawFN_small(
  input         clock,
  input         reset,
  output        io_inReady,
  input         io_inValid,
  input         io_sqrtOp,
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [24:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [24:0] io_b_sig,
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
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] cycleNum; // @[DivSqrtRecFN_small.scala 223:33]
  reg  inReady; // @[DivSqrtRecFN_small.scala 224:33]
  reg  rawOutValid; // @[DivSqrtRecFN_small.scala 225:33]
  reg  sqrtOp_Z; // @[DivSqrtRecFN_small.scala 227:29]
  reg  majorExc_Z; // @[DivSqrtRecFN_small.scala 228:29]
  reg  isNaN_Z; // @[DivSqrtRecFN_small.scala 230:29]
  reg  isInf_Z; // @[DivSqrtRecFN_small.scala 231:29]
  reg  isZero_Z; // @[DivSqrtRecFN_small.scala 232:29]
  reg  sign_Z; // @[DivSqrtRecFN_small.scala 233:29]
  reg [9:0] sExp_Z; // @[DivSqrtRecFN_small.scala 234:29]
  reg [23:0] fractB_Z; // @[DivSqrtRecFN_small.scala 235:29]
  reg [2:0] roundingMode_Z; // @[DivSqrtRecFN_small.scala 236:29]
  reg [25:0] rem_Z; // @[DivSqrtRecFN_small.scala 242:29]
  reg  notZeroRem_Z; // @[DivSqrtRecFN_small.scala 243:29]
  reg [25:0] sigX_Z; // @[DivSqrtRecFN_small.scala 244:29]
  wire  notSigNaNIn_invalidExc_S_div = io_a_isZero & io_b_isZero | io_a_isInf & io_b_isInf; // @[DivSqrtRecFN_small.scala 253:42]
  wire  _notSigNaNIn_invalidExc_S_sqrt_T = ~io_a_isNaN; // @[DivSqrtRecFN_small.scala 255:9]
  wire  notSigNaNIn_invalidExc_S_sqrt = ~io_a_isNaN & ~io_a_isZero & io_a_sign; // @[DivSqrtRecFN_small.scala 255:43]
  wire  _majorExc_S_T_2 = io_a_isNaN & ~io_a_sig[22]; // @[common.scala 82:46]
  wire  _majorExc_S_T_3 = _majorExc_S_T_2 | notSigNaNIn_invalidExc_S_sqrt; // @[DivSqrtRecFN_small.scala 258:38]
  wire  _majorExc_S_T_9 = io_b_isNaN & ~io_b_sig[22]; // @[common.scala 82:46]
  wire  _majorExc_S_T_11 = _majorExc_S_T_2 | _majorExc_S_T_9 | notSigNaNIn_invalidExc_S_div; // @[DivSqrtRecFN_small.scala 259:66]
  wire  _majorExc_S_T_15 = _notSigNaNIn_invalidExc_S_sqrt_T & ~io_a_isInf & io_b_isZero; // @[DivSqrtRecFN_small.scala 261:51]
  wire  _majorExc_S_T_16 = _majorExc_S_T_11 | _majorExc_S_T_15; // @[DivSqrtRecFN_small.scala 260:46]
  wire  _isNaN_S_T = io_a_isNaN | notSigNaNIn_invalidExc_S_sqrt; // @[DivSqrtRecFN_small.scala 265:26]
  wire  _isNaN_S_T_2 = io_a_isNaN | io_b_isNaN | notSigNaNIn_invalidExc_S_div; // @[DivSqrtRecFN_small.scala 266:42]
  wire  _sign_S_T = ~io_sqrtOp; // @[DivSqrtRecFN_small.scala 270:33]
  wire  sign_S = io_a_sign ^ ~io_sqrtOp & io_b_sign; // @[DivSqrtRecFN_small.scala 270:30]
  wire  specialCaseA_S = io_a_isNaN | io_a_isInf | io_a_isZero; // @[DivSqrtRecFN_small.scala 272:55]
  wire  specialCaseB_S = io_b_isNaN | io_b_isInf | io_b_isZero; // @[DivSqrtRecFN_small.scala 273:55]
  wire  _normalCase_S_div_T = ~specialCaseA_S; // @[DivSqrtRecFN_small.scala 274:28]
  wire  normalCase_S_div = ~specialCaseA_S & ~specialCaseB_S; // @[DivSqrtRecFN_small.scala 274:45]
  wire  normalCase_S_sqrt = _normalCase_S_div_T & ~io_a_sign; // @[DivSqrtRecFN_small.scala 275:46]
  wire  normalCase_S = io_sqrtOp ? normalCase_S_sqrt : normalCase_S_div; // @[DivSqrtRecFN_small.scala 276:27]
  wire [7:0] _sExpQuot_S_div_T_2 = ~io_b_sExp[7:0]; // @[DivSqrtRecFN_small.scala 280:40]
  wire [8:0] _sExpQuot_S_div_T_4 = {io_b_sExp[8],_sExpQuot_S_div_T_2}; // @[DivSqrtRecFN_small.scala 280:71]
  wire [9:0] _GEN_15 = {{1{_sExpQuot_S_div_T_4[8]}},_sExpQuot_S_div_T_4}; // @[DivSqrtRecFN_small.scala 279:21]
  wire [10:0] sExpQuot_S_div = $signed(io_a_sExp) + $signed(_GEN_15); // @[DivSqrtRecFN_small.scala 279:21]
  wire [3:0] _sSatExpQuot_S_div_T_2 = 11'sh1c0 <= $signed(sExpQuot_S_div) ? 4'h6 : sExpQuot_S_div[9:6]; // @[DivSqrtRecFN_small.scala 283:16]
  wire [9:0] sSatExpQuot_S_div = {_sSatExpQuot_S_div_T_2,sExpQuot_S_div[5:0]}; // @[DivSqrtRecFN_small.scala 288:11]
  wire  _evenSqrt_S_T_1 = ~io_a_sExp[0]; // @[DivSqrtRecFN_small.scala 290:35]
  wire  evenSqrt_S = io_sqrtOp & ~io_a_sExp[0]; // @[DivSqrtRecFN_small.scala 290:32]
  wire  oddSqrt_S = io_sqrtOp & io_a_sExp[0]; // @[DivSqrtRecFN_small.scala 291:32]
  wire  idle = cycleNum == 5'h0; // @[DivSqrtRecFN_small.scala 295:25]
  wire  entering = inReady & io_inValid; // @[DivSqrtRecFN_small.scala 296:28]
  wire  entering_normalCase = entering & normalCase_S; // @[DivSqrtRecFN_small.scala 297:40]
  wire  skipCycle2 = cycleNum == 5'h3 & sigX_Z[25]; // @[DivSqrtRecFN_small.scala 300:39]
  wire  _inReady_T_1 = entering & ~normalCase_S; // @[DivSqrtRecFN_small.scala 304:26]
  wire [4:0] _inReady_T_17 = cycleNum - 5'h1; // @[DivSqrtRecFN_small.scala 312:56]
  wire  _inReady_T_18 = _inReady_T_17 <= 5'h1; // @[DivSqrtRecFN_small.scala 316:38]
  wire  _inReady_T_19 = ~entering & ~skipCycle2 & _inReady_T_18; // @[DivSqrtRecFN_small.scala 312:16]
  wire  _inReady_T_20 = _inReady_T_1 | _inReady_T_19; // @[DivSqrtRecFN_small.scala 311:15]
  wire  _inReady_T_23 = _inReady_T_20 | skipCycle2; // @[DivSqrtRecFN_small.scala 312:95]
  wire  _rawOutValid_T_18 = _inReady_T_17 == 5'h1; // @[DivSqrtRecFN_small.scala 317:42]
  wire  _rawOutValid_T_19 = ~entering & ~skipCycle2 & _rawOutValid_T_18; // @[DivSqrtRecFN_small.scala 312:16]
  wire  _rawOutValid_T_20 = _inReady_T_1 | _rawOutValid_T_19; // @[DivSqrtRecFN_small.scala 311:15]
  wire  _rawOutValid_T_23 = _rawOutValid_T_20 | skipCycle2; // @[DivSqrtRecFN_small.scala 312:95]
  wire [4:0] _cycleNum_T_4 = io_a_sExp[0] ? 5'h18 : 5'h19; // @[DivSqrtRecFN_small.scala 307:24]
  wire [4:0] _cycleNum_T_5 = io_sqrtOp ? _cycleNum_T_4 : 5'h1a; // @[DivSqrtRecFN_small.scala 306:20]
  wire [4:0] _cycleNum_T_6 = entering_normalCase ? _cycleNum_T_5 : 5'h0; // @[DivSqrtRecFN_small.scala 305:16]
  wire [4:0] _GEN_16 = {{4'd0}, _inReady_T_1}; // @[DivSqrtRecFN_small.scala 304:57]
  wire [4:0] _cycleNum_T_7 = _GEN_16 | _cycleNum_T_6; // @[DivSqrtRecFN_small.scala 304:57]
  wire [4:0] _cycleNum_T_14 = ~entering & ~skipCycle2 ? _inReady_T_17 : 5'h0; // @[DivSqrtRecFN_small.scala 312:16]
  wire [4:0] _cycleNum_T_15 = _cycleNum_T_7 | _cycleNum_T_14; // @[DivSqrtRecFN_small.scala 311:15]
  wire [4:0] _GEN_17 = {{4'd0}, skipCycle2}; // @[DivSqrtRecFN_small.scala 312:95]
  wire [4:0] _cycleNum_T_17 = _cycleNum_T_15 | _GEN_17; // @[DivSqrtRecFN_small.scala 312:95]
  wire  _GEN_0 = ~idle | entering ? _inReady_T_23 : inReady; // @[DivSqrtRecFN_small.scala 302:31 316:17 224:33]
  wire [8:0] _sExp_Z_T = io_a_sExp[9:1]; // @[DivSqrtRecFN_small.scala 334:29]
  wire [9:0] _sExp_Z_T_1 = $signed(_sExp_Z_T) + 9'sh80; // @[DivSqrtRecFN_small.scala 334:34]
  wire  _T_2 = ~inReady; // @[DivSqrtRecFN_small.scala 339:23]
  wire  _T_3 = ~inReady & sqrtOp_Z; // @[DivSqrtRecFN_small.scala 339:33]
  wire  _fractB_Z_T_1 = inReady & _sign_S_T; // @[DivSqrtRecFN_small.scala 341:25]
  wire [23:0] _fractB_Z_T_3 = {io_b_sig[22:0], 1'h0}; // @[DivSqrtRecFN_small.scala 341:90]
  wire [23:0] _fractB_Z_T_4 = inReady & _sign_S_T ? _fractB_Z_T_3 : 24'h0; // @[DivSqrtRecFN_small.scala 341:16]
  wire  _fractB_Z_T_5 = inReady & io_sqrtOp; // @[DivSqrtRecFN_small.scala 342:25]
  wire [22:0] _fractB_Z_T_8 = inReady & io_sqrtOp & io_a_sExp[0] ? 23'h400000 : 23'h0; // @[DivSqrtRecFN_small.scala 342:16]
  wire [23:0] _GEN_18 = {{1'd0}, _fractB_Z_T_8}; // @[DivSqrtRecFN_small.scala 341:100]
  wire [23:0] _fractB_Z_T_9 = _fractB_Z_T_4 | _GEN_18; // @[DivSqrtRecFN_small.scala 341:100]
  wire [23:0] _fractB_Z_T_14 = _fractB_Z_T_5 & _evenSqrt_S_T_1 ? 24'h800000 : 24'h0; // @[DivSqrtRecFN_small.scala 343:16]
  wire [23:0] _fractB_Z_T_15 = _fractB_Z_T_9 | _fractB_Z_T_14; // @[DivSqrtRecFN_small.scala 342:100]
  wire [22:0] _fractB_Z_T_25 = _T_2 ? fractB_Z[23:1] : 23'h0; // @[DivSqrtRecFN_small.scala 345:16]
  wire [23:0] _GEN_19 = {{1'd0}, _fractB_Z_T_25}; // @[DivSqrtRecFN_small.scala 344:100]
  wire [23:0] _fractB_Z_T_26 = _fractB_Z_T_15 | _GEN_19; // @[DivSqrtRecFN_small.scala 344:100]
  wire [25:0] _rem_T_2 = {io_a_sig, 1'h0}; // @[DivSqrtRecFN_small.scala 351:47]
  wire [25:0] _rem_T_3 = inReady & ~oddSqrt_S ? _rem_T_2 : 26'h0; // @[DivSqrtRecFN_small.scala 351:12]
  wire  _rem_T_4 = inReady & oddSqrt_S; // @[DivSqrtRecFN_small.scala 352:21]
  wire [1:0] _rem_T_7 = io_a_sig[23:22] - 2'h1; // @[DivSqrtRecFN_small.scala 353:56]
  wire [24:0] _rem_T_9 = {io_a_sig[21:0], 3'h0}; // @[DivSqrtRecFN_small.scala 354:44]
  wire [26:0] _rem_T_10 = {_rem_T_7,_rem_T_9}; // @[Cat.scala 31:58]
  wire [26:0] _rem_T_11 = inReady & oddSqrt_S ? _rem_T_10 : 27'h0; // @[DivSqrtRecFN_small.scala 352:12]
  wire [26:0] _GEN_20 = {{1'd0}, _rem_T_3}; // @[DivSqrtRecFN_small.scala 351:57]
  wire [26:0] _rem_T_12 = _GEN_20 | _rem_T_11; // @[DivSqrtRecFN_small.scala 351:57]
  wire [26:0] _rem_T_14 = {rem_Z, 1'h0}; // @[DivSqrtRecFN_small.scala 358:29]
  wire [26:0] _rem_T_15 = _T_2 ? _rem_T_14 : 27'h0; // @[DivSqrtRecFN_small.scala 358:12]
  wire [26:0] rem = _rem_T_12 | _rem_T_15; // @[DivSqrtRecFN_small.scala 357:11]
  wire [31:0] _bitMask_T = 32'h1 << cycleNum; // @[DivSqrtRecFN_small.scala 359:23]
  wire [29:0] bitMask = _bitMask_T[31:2]; // @[DivSqrtRecFN_small.scala 359:34]
  wire [25:0] _trialTerm_T_2 = {io_b_sig, 1'h0}; // @[DivSqrtRecFN_small.scala 361:48]
  wire [25:0] _trialTerm_T_3 = _fractB_Z_T_1 ? _trialTerm_T_2 : 26'h0; // @[DivSqrtRecFN_small.scala 361:12]
  wire [24:0] _trialTerm_T_5 = inReady & evenSqrt_S ? 25'h1000000 : 25'h0; // @[DivSqrtRecFN_small.scala 362:12]
  wire [25:0] _GEN_21 = {{1'd0}, _trialTerm_T_5}; // @[DivSqrtRecFN_small.scala 361:74]
  wire [25:0] _trialTerm_T_6 = _trialTerm_T_3 | _GEN_21; // @[DivSqrtRecFN_small.scala 361:74]
  wire [25:0] _trialTerm_T_8 = _rem_T_4 ? 26'h2800000 : 26'h0; // @[DivSqrtRecFN_small.scala 363:12]
  wire [25:0] _trialTerm_T_9 = _trialTerm_T_6 | _trialTerm_T_8; // @[DivSqrtRecFN_small.scala 362:74]
  wire [23:0] _trialTerm_T_11 = _T_2 ? fractB_Z : 24'h0; // @[DivSqrtRecFN_small.scala 364:12]
  wire [25:0] _GEN_22 = {{2'd0}, _trialTerm_T_11}; // @[DivSqrtRecFN_small.scala 363:74]
  wire [25:0] _trialTerm_T_12 = _trialTerm_T_9 | _GEN_22; // @[DivSqrtRecFN_small.scala 363:74]
  wire  _trialTerm_T_14 = ~sqrtOp_Z; // @[DivSqrtRecFN_small.scala 365:26]
  wire [24:0] _trialTerm_T_17 = _T_2 & ~sqrtOp_Z ? 25'h1000000 : 25'h0; // @[DivSqrtRecFN_small.scala 365:12]
  wire [25:0] _GEN_23 = {{1'd0}, _trialTerm_T_17}; // @[DivSqrtRecFN_small.scala 364:74]
  wire [25:0] _trialTerm_T_18 = _trialTerm_T_12 | _GEN_23; // @[DivSqrtRecFN_small.scala 364:74]
  wire [26:0] _trialTerm_T_21 = {sigX_Z, 1'h0}; // @[DivSqrtRecFN_small.scala 366:44]
  wire [26:0] _trialTerm_T_22 = _T_3 ? _trialTerm_T_21 : 27'h0; // @[DivSqrtRecFN_small.scala 366:12]
  wire [26:0] _GEN_24 = {{1'd0}, _trialTerm_T_18}; // @[DivSqrtRecFN_small.scala 365:74]
  wire [26:0] trialTerm = _GEN_24 | _trialTerm_T_22; // @[DivSqrtRecFN_small.scala 365:74]
  wire [27:0] _trialRem_T = {1'b0,$signed(rem)}; // @[DivSqrtRecFN_small.scala 367:24]
  wire [27:0] _trialRem_T_1 = {1'b0,$signed(trialTerm)}; // @[DivSqrtRecFN_small.scala 367:42]
  wire [28:0] trialRem = $signed(_trialRem_T) - $signed(_trialRem_T_1); // @[DivSqrtRecFN_small.scala 367:29]
  wire  newBit = 29'sh0 <= $signed(trialRem); // @[DivSqrtRecFN_small.scala 368:23]
  wire [28:0] _nextRem_Z_T = $signed(_trialRem_T) - $signed(_trialRem_T_1); // @[DivSqrtRecFN_small.scala 370:42]
  wire [28:0] _nextRem_Z_T_1 = newBit ? _nextRem_Z_T : {{2'd0}, rem}; // @[DivSqrtRecFN_small.scala 370:24]
  wire [25:0] nextRem_Z = _nextRem_Z_T_1[25:0]; // @[DivSqrtRecFN_small.scala 370:54]
  wire [25:0] _sigX_Z_T_2 = {newBit, 25'h0}; // @[DivSqrtRecFN_small.scala 393:50]
  wire [25:0] _sigX_Z_T_3 = _fractB_Z_T_1 ? _sigX_Z_T_2 : 26'h0; // @[DivSqrtRecFN_small.scala 393:16]
  wire [24:0] _sigX_Z_T_5 = _fractB_Z_T_5 ? 25'h1000000 : 25'h0; // @[DivSqrtRecFN_small.scala 394:16]
  wire [25:0] _GEN_30 = {{1'd0}, _sigX_Z_T_5}; // @[DivSqrtRecFN_small.scala 393:74]
  wire [25:0] _sigX_Z_T_6 = _sigX_Z_T_3 | _GEN_30; // @[DivSqrtRecFN_small.scala 393:74]
  wire [23:0] _sigX_Z_T_8 = {newBit, 23'h0}; // @[DivSqrtRecFN_small.scala 395:50]
  wire [23:0] _sigX_Z_T_9 = _rem_T_4 ? _sigX_Z_T_8 : 24'h0; // @[DivSqrtRecFN_small.scala 395:16]
  wire [25:0] _GEN_31 = {{2'd0}, _sigX_Z_T_9}; // @[DivSqrtRecFN_small.scala 394:74]
  wire [25:0] _sigX_Z_T_10 = _sigX_Z_T_6 | _GEN_31; // @[DivSqrtRecFN_small.scala 394:74]
  wire [25:0] _sigX_Z_T_12 = _T_2 ? sigX_Z : 26'h0; // @[DivSqrtRecFN_small.scala 396:16]
  wire [25:0] _sigX_Z_T_13 = _sigX_Z_T_10 | _sigX_Z_T_12; // @[DivSqrtRecFN_small.scala 395:74]
  wire [29:0] _sigX_Z_T_16 = _T_2 & newBit ? bitMask : 30'h0; // @[DivSqrtRecFN_small.scala 397:16]
  wire [29:0] _GEN_32 = {{4'd0}, _sigX_Z_T_13}; // @[DivSqrtRecFN_small.scala 396:74]
  wire [29:0] _sigX_Z_T_17 = _GEN_32 | _sigX_Z_T_16; // @[DivSqrtRecFN_small.scala 396:74]
  wire [29:0] _GEN_14 = entering | _T_2 ? _sigX_Z_T_17 : {{4'd0}, sigX_Z}; // @[DivSqrtRecFN_small.scala 389:34 392:16 244:29]
  wire [26:0] _GEN_33 = {{26'd0}, notZeroRem_Z}; // @[DivSqrtRecFN_small.scala 413:35]
  assign io_inReady = inReady; // @[DivSqrtRecFN_small.scala 321:16]
  assign io_rawOutValid_div = rawOutValid & _trialTerm_T_14; // @[DivSqrtRecFN_small.scala 403:40]
  assign io_rawOutValid_sqrt = rawOutValid & sqrtOp_Z; // @[DivSqrtRecFN_small.scala 404:40]
  assign io_roundingModeOut = roundingMode_Z; // @[DivSqrtRecFN_small.scala 405:25]
  assign io_invalidExc = majorExc_Z & isNaN_Z; // @[DivSqrtRecFN_small.scala 406:36]
  assign io_infiniteExc = majorExc_Z & ~isNaN_Z; // @[DivSqrtRecFN_small.scala 407:36]
  assign io_rawOut_isNaN = isNaN_Z; // @[DivSqrtRecFN_small.scala 408:22]
  assign io_rawOut_isInf = isInf_Z; // @[DivSqrtRecFN_small.scala 409:22]
  assign io_rawOut_isZero = isZero_Z; // @[DivSqrtRecFN_small.scala 410:22]
  assign io_rawOut_sign = sign_Z; // @[DivSqrtRecFN_small.scala 411:22]
  assign io_rawOut_sExp = sExp_Z; // @[DivSqrtRecFN_small.scala 412:22]
  assign io_rawOut_sig = _trialTerm_T_21 | _GEN_33; // @[DivSqrtRecFN_small.scala 413:35]
  always @(posedge clock) begin
    if (reset) begin // @[DivSqrtRecFN_small.scala 223:33]
      cycleNum <= 5'h0; // @[DivSqrtRecFN_small.scala 223:33]
    end else if (~idle | entering) begin // @[DivSqrtRecFN_small.scala 302:31]
      cycleNum <= _cycleNum_T_17; // @[DivSqrtRecFN_small.scala 318:18]
    end
    inReady <= reset | _GEN_0; // @[DivSqrtRecFN_small.scala 224:{33,33}]
    if (reset) begin // @[DivSqrtRecFN_small.scala 225:33]
      rawOutValid <= 1'h0; // @[DivSqrtRecFN_small.scala 225:33]
    end else if (~idle | entering) begin // @[DivSqrtRecFN_small.scala 302:31]
      rawOutValid <= _rawOutValid_T_23; // @[DivSqrtRecFN_small.scala 317:21]
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      sqrtOp_Z <= io_sqrtOp; // @[DivSqrtRecFN_small.scala 326:20]
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      if (io_sqrtOp) begin // @[DivSqrtRecFN_small.scala 257:12]
        majorExc_Z <= _majorExc_S_T_3;
      end else begin
        majorExc_Z <= _majorExc_S_T_16;
      end
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      if (io_sqrtOp) begin // @[DivSqrtRecFN_small.scala 264:12]
        isNaN_Z <= _isNaN_S_T;
      end else begin
        isNaN_Z <= _isNaN_S_T_2;
      end
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      if (io_sqrtOp) begin // @[DivSqrtRecFN_small.scala 268:23]
        isInf_Z <= io_a_isInf;
      end else begin
        isInf_Z <= io_a_isInf | io_b_isZero;
      end
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      if (io_sqrtOp) begin // @[DivSqrtRecFN_small.scala 269:23]
        isZero_Z <= io_a_isZero;
      end else begin
        isZero_Z <= io_a_isZero | io_b_isInf;
      end
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      sign_Z <= sign_S; // @[DivSqrtRecFN_small.scala 331:20]
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      if (io_sqrtOp) begin // @[DivSqrtRecFN_small.scala 333:16]
        sExp_Z <= _sExp_Z_T_1;
      end else begin
        sExp_Z <= sSatExpQuot_S_div;
      end
    end
    if (entering | ~inReady & sqrtOp_Z) begin // @[DivSqrtRecFN_small.scala 339:46]
      fractB_Z <= _fractB_Z_T_26; // @[DivSqrtRecFN_small.scala 340:18]
    end
    if (entering) begin // @[DivSqrtRecFN_small.scala 325:21]
      roundingMode_Z <= io_roundingMode; // @[DivSqrtRecFN_small.scala 337:24]
    end
    if (entering | _T_2) begin // @[DivSqrtRecFN_small.scala 389:34]
      rem_Z <= nextRem_Z; // @[DivSqrtRecFN_small.scala 391:15]
    end
    if (entering | _T_2) begin // @[DivSqrtRecFN_small.scala 389:34]
      if (inReady | newBit) begin // @[DivSqrtRecFN_small.scala 379:31]
        notZeroRem_Z <= $signed(trialRem) != 29'sh0;
      end
    end
    sigX_Z <= _GEN_14[25:0];
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
  cycleNum = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  inReady = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  rawOutValid = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  sqrtOp_Z = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  majorExc_Z = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  isNaN_Z = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  isInf_Z = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  isZero_Z = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sign_Z = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  sExp_Z = _RAND_9[9:0];
  _RAND_10 = {1{`RANDOM}};
  fractB_Z = _RAND_10[23:0];
  _RAND_11 = {1{`RANDOM}};
  roundingMode_Z = _RAND_11[2:0];
  _RAND_12 = {1{`RANDOM}};
  rem_Z = _RAND_12[25:0];
  _RAND_13 = {1{`RANDOM}};
  notZeroRem_Z = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  sigX_Z = _RAND_14[25:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
