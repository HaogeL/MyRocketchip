module MulAddRecFNToRaw_preMul_1(
  input  [1:0]   io_op,
  input  [64:0]  io_a,
  input  [64:0]  io_b,
  input  [64:0]  io_c,
  output [52:0]  io_mulAddA,
  output [52:0]  io_mulAddB,
  output [105:0] io_mulAddC,
  output         io_toPostMul_isSigNaNAny,
  output         io_toPostMul_isNaNAOrB,
  output         io_toPostMul_isInfA,
  output         io_toPostMul_isZeroA,
  output         io_toPostMul_isInfB,
  output         io_toPostMul_isZeroB,
  output         io_toPostMul_signProd,
  output         io_toPostMul_isNaNC,
  output         io_toPostMul_isInfC,
  output         io_toPostMul_isZeroC,
  output [12:0]  io_toPostMul_sExpSum,
  output         io_toPostMul_doSubMags,
  output         io_toPostMul_CIsDominant,
  output [5:0]   io_toPostMul_CDom_CAlignDist,
  output [54:0]  io_toPostMul_highAlignedSigC,
  output         io_toPostMul_bit0AlignedSigC
);
  wire [11:0] rawA_exp = io_a[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  rawA_isZero = rawA_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  rawA_isSpecial = rawA_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawA__isNaN = rawA_isSpecial & rawA_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawA__sign = io_a[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] rawA__sExp = {1'b0,$signed(rawA_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _rawA_out_sig_T = ~rawA_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [53:0] rawA__sig = {1'h0,_rawA_out_sig_T,io_a[51:0]}; // @[Cat.scala 31:58]
  wire [11:0] rawB_exp = io_b[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  rawB_isZero = rawB_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  rawB_isSpecial = rawB_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawB__isNaN = rawB_isSpecial & rawB_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawB__sign = io_b[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] rawB__sExp = {1'b0,$signed(rawB_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _rawB_out_sig_T = ~rawB_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [53:0] rawB__sig = {1'h0,_rawB_out_sig_T,io_b[51:0]}; // @[Cat.scala 31:58]
  wire [11:0] rawC_exp = io_c[63:52]; // @[rawFloatFromRecFN.scala 50:21]
  wire  rawC_isZero = rawC_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  wire  rawC_isSpecial = rawC_exp[11:10] == 2'h3; // @[rawFloatFromRecFN.scala 52:54]
  wire  rawC__isNaN = rawC_isSpecial & rawC_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  wire  rawC__sign = io_c[64]; // @[rawFloatFromRecFN.scala 58:25]
  wire [12:0] rawC__sExp = {1'b0,$signed(rawC_exp)}; // @[rawFloatFromRecFN.scala 59:27]
  wire  _rawC_out_sig_T = ~rawC_isZero; // @[rawFloatFromRecFN.scala 60:39]
  wire [53:0] rawC__sig = {1'h0,_rawC_out_sig_T,io_c[51:0]}; // @[Cat.scala 31:58]
  wire  signProd = rawA__sign ^ rawB__sign ^ io_op[1]; // @[MulAddRecFN.scala 95:42]
  wire [13:0] _sExpAlignedProd_T = $signed(rawA__sExp) + $signed(rawB__sExp); // @[MulAddRecFN.scala 98:19]
  wire [13:0] sExpAlignedProd = $signed(_sExpAlignedProd_T) - 14'sh7c8; // @[MulAddRecFN.scala 98:32]
  wire  doSubMags = signProd ^ rawC__sign ^ io_op[0]; // @[MulAddRecFN.scala 100:42]
  wire [13:0] _GEN_0 = {{1{rawC__sExp[12]}},rawC__sExp}; // @[MulAddRecFN.scala 104:42]
  wire [13:0] sNatCAlignDist = $signed(sExpAlignedProd) - $signed(_GEN_0); // @[MulAddRecFN.scala 104:42]
  wire [12:0] posNatCAlignDist = sNatCAlignDist[12:0]; // @[MulAddRecFN.scala 105:42]
  wire  isMinCAlign = rawA_isZero | rawB_isZero | $signed(sNatCAlignDist) < 14'sh0; // @[MulAddRecFN.scala 106:50]
  wire  CIsDominant = _rawC_out_sig_T & (isMinCAlign | posNatCAlignDist <= 13'h35); // @[MulAddRecFN.scala 108:23]
  wire [7:0] _CAlignDist_T_2 = posNatCAlignDist < 13'ha1 ? posNatCAlignDist[7:0] : 8'ha1; // @[MulAddRecFN.scala 112:16]
  wire [7:0] CAlignDist = isMinCAlign ? 8'h0 : _CAlignDist_T_2; // @[MulAddRecFN.scala 110:12]
  wire [53:0] _mainAlignedSigC_T = ~rawC__sig; // @[MulAddRecFN.scala 118:28]
  wire [53:0] _mainAlignedSigC_T_1 = doSubMags ? _mainAlignedSigC_T : rawC__sig; // @[MulAddRecFN.scala 118:16]
  wire [110:0] _mainAlignedSigC_T_3 = doSubMags ? 111'h7fffffffffffffffffffffffffff : 111'h0; // @[Bitwise.scala 74:12]
  wire [164:0] _mainAlignedSigC_T_5 = {_mainAlignedSigC_T_1,_mainAlignedSigC_T_3}; // @[MulAddRecFN.scala 120:11]
  wire [164:0] mainAlignedSigC = $signed(_mainAlignedSigC_T_5) >>> CAlignDist; // @[MulAddRecFN.scala 120:17]
  wire  reduced4CExtra_reducedVec_0 = |rawC__sig[3:0]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_1 = |rawC__sig[7:4]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_2 = |rawC__sig[11:8]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_3 = |rawC__sig[15:12]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_4 = |rawC__sig[19:16]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_5 = |rawC__sig[23:20]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_6 = |rawC__sig[27:24]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_7 = |rawC__sig[31:28]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_8 = |rawC__sig[35:32]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_9 = |rawC__sig[39:36]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_10 = |rawC__sig[43:40]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_11 = |rawC__sig[47:44]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_12 = |rawC__sig[51:48]; // @[primitives.scala 121:54]
  wire  reduced4CExtra_reducedVec_13 = |rawC__sig[53:52]; // @[primitives.scala 124:57]
  wire [6:0] reduced4CExtra_lo = {reduced4CExtra_reducedVec_6,reduced4CExtra_reducedVec_5,reduced4CExtra_reducedVec_4,
    reduced4CExtra_reducedVec_3,reduced4CExtra_reducedVec_2,reduced4CExtra_reducedVec_1,reduced4CExtra_reducedVec_0}; // @[primitives.scala 125:20]
  wire [13:0] _reduced4CExtra_T_1 = {reduced4CExtra_reducedVec_13,reduced4CExtra_reducedVec_12,
    reduced4CExtra_reducedVec_11,reduced4CExtra_reducedVec_10,reduced4CExtra_reducedVec_9,reduced4CExtra_reducedVec_8,
    reduced4CExtra_reducedVec_7,reduced4CExtra_lo}; // @[primitives.scala 125:20]
  wire [64:0] reduced4CExtra_shift = 65'sh10000000000000000 >>> CAlignDist[7:2]; // @[primitives.scala 77:58]
  wire [7:0] _GEN_1 = {{4'd0}, reduced4CExtra_shift[31:28]}; // @[Bitwise.scala 105:31]
  wire [7:0] _reduced4CExtra_T_8 = _GEN_1 & 8'hf; // @[Bitwise.scala 105:31]
  wire [7:0] _reduced4CExtra_T_10 = {reduced4CExtra_shift[27:24], 4'h0}; // @[Bitwise.scala 105:70]
  wire [7:0] _reduced4CExtra_T_12 = _reduced4CExtra_T_10 & 8'hf0; // @[Bitwise.scala 105:80]
  wire [7:0] _reduced4CExtra_T_13 = _reduced4CExtra_T_8 | _reduced4CExtra_T_12; // @[Bitwise.scala 105:39]
  wire [7:0] _GEN_2 = {{2'd0}, _reduced4CExtra_T_13[7:2]}; // @[Bitwise.scala 105:31]
  wire [7:0] _reduced4CExtra_T_18 = _GEN_2 & 8'h33; // @[Bitwise.scala 105:31]
  wire [7:0] _reduced4CExtra_T_20 = {_reduced4CExtra_T_13[5:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [7:0] _reduced4CExtra_T_22 = _reduced4CExtra_T_20 & 8'hcc; // @[Bitwise.scala 105:80]
  wire [7:0] _reduced4CExtra_T_23 = _reduced4CExtra_T_18 | _reduced4CExtra_T_22; // @[Bitwise.scala 105:39]
  wire [7:0] _GEN_3 = {{1'd0}, _reduced4CExtra_T_23[7:1]}; // @[Bitwise.scala 105:31]
  wire [7:0] _reduced4CExtra_T_28 = _GEN_3 & 8'h55; // @[Bitwise.scala 105:31]
  wire [7:0] _reduced4CExtra_T_30 = {_reduced4CExtra_T_23[6:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [7:0] _reduced4CExtra_T_32 = _reduced4CExtra_T_30 & 8'haa; // @[Bitwise.scala 105:80]
  wire [7:0] _reduced4CExtra_T_33 = _reduced4CExtra_T_28 | _reduced4CExtra_T_32; // @[Bitwise.scala 105:39]
  wire [12:0] _reduced4CExtra_T_47 = {_reduced4CExtra_T_33,reduced4CExtra_shift[32],reduced4CExtra_shift[33],
    reduced4CExtra_shift[34],reduced4CExtra_shift[35],reduced4CExtra_shift[36]}; // @[Cat.scala 31:58]
  wire [13:0] _GEN_4 = {{1'd0}, _reduced4CExtra_T_47}; // @[MulAddRecFN.scala 122:68]
  wire [13:0] _reduced4CExtra_T_48 = _reduced4CExtra_T_1 & _GEN_4; // @[MulAddRecFN.scala 122:68]
  wire  reduced4CExtra = |_reduced4CExtra_T_48; // @[MulAddRecFN.scala 130:11]
  wire  _alignedSigC_T_4 = &mainAlignedSigC[2:0] & ~reduced4CExtra; // @[MulAddRecFN.scala 134:44]
  wire  _alignedSigC_T_7 = |mainAlignedSigC[2:0] | reduced4CExtra; // @[MulAddRecFN.scala 135:44]
  wire  _alignedSigC_T_8 = doSubMags ? _alignedSigC_T_4 : _alignedSigC_T_7; // @[MulAddRecFN.scala 133:16]
  wire [161:0] alignedSigC_hi = mainAlignedSigC[164:3]; // @[Cat.scala 31:58]
  wire [162:0] alignedSigC = {alignedSigC_hi,_alignedSigC_T_8}; // @[Cat.scala 31:58]
  wire  _io_toPostMul_isSigNaNAny_T_2 = rawA__isNaN & ~rawA__sig[51]; // @[common.scala 82:46]
  wire  _io_toPostMul_isSigNaNAny_T_5 = rawB__isNaN & ~rawB__sig[51]; // @[common.scala 82:46]
  wire  _io_toPostMul_isSigNaNAny_T_9 = rawC__isNaN & ~rawC__sig[51]; // @[common.scala 82:46]
  wire [13:0] _io_toPostMul_sExpSum_T_2 = $signed(sExpAlignedProd) - 14'sh35; // @[MulAddRecFN.scala 158:53]
  wire [13:0] _io_toPostMul_sExpSum_T_3 = CIsDominant ? $signed({{1{rawC__sExp[12]}},rawC__sExp}) : $signed(
    _io_toPostMul_sExpSum_T_2); // @[MulAddRecFN.scala 158:12]
  assign io_mulAddA = rawA__sig[52:0]; // @[MulAddRecFN.scala 141:16]
  assign io_mulAddB = rawB__sig[52:0]; // @[MulAddRecFN.scala 142:16]
  assign io_mulAddC = alignedSigC[106:1]; // @[MulAddRecFN.scala 143:30]
  assign io_toPostMul_isSigNaNAny = _io_toPostMul_isSigNaNAny_T_2 | _io_toPostMul_isSigNaNAny_T_5 |
    _io_toPostMul_isSigNaNAny_T_9; // @[MulAddRecFN.scala 146:58]
  assign io_toPostMul_isNaNAOrB = rawA__isNaN | rawB__isNaN; // @[MulAddRecFN.scala 148:42]
  assign io_toPostMul_isInfA = rawA_isSpecial & ~rawA_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  assign io_toPostMul_isZeroA = rawA_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign io_toPostMul_isInfB = rawB_isSpecial & ~rawB_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  assign io_toPostMul_isZeroB = rawB_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign io_toPostMul_signProd = rawA__sign ^ rawB__sign ^ io_op[1]; // @[MulAddRecFN.scala 95:42]
  assign io_toPostMul_isNaNC = rawC_isSpecial & rawC_exp[9]; // @[rawFloatFromRecFN.scala 55:33]
  assign io_toPostMul_isInfC = rawC_isSpecial & ~rawC_exp[9]; // @[rawFloatFromRecFN.scala 56:33]
  assign io_toPostMul_isZeroC = rawC_exp[11:9] == 3'h0; // @[rawFloatFromRecFN.scala 51:54]
  assign io_toPostMul_sExpSum = _io_toPostMul_sExpSum_T_3[12:0]; // @[MulAddRecFN.scala 157:28]
  assign io_toPostMul_doSubMags = signProd ^ rawC__sign ^ io_op[0]; // @[MulAddRecFN.scala 100:42]
  assign io_toPostMul_CIsDominant = _rawC_out_sig_T & (isMinCAlign | posNatCAlignDist <= 13'h35); // @[MulAddRecFN.scala 108:23]
  assign io_toPostMul_CDom_CAlignDist = CAlignDist[5:0]; // @[MulAddRecFN.scala 161:47]
  assign io_toPostMul_highAlignedSigC = alignedSigC[161:107]; // @[MulAddRecFN.scala 163:20]
  assign io_toPostMul_bit0AlignedSigC = alignedSigC[0]; // @[MulAddRecFN.scala 164:48]
endmodule
