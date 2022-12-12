module IntToFP(
  input         clock,
  input         reset,
  input         io_in_valid,
  input  [1:0]  io_in_bits_typeTagIn,
  input         io_in_bits_wflags,
  input  [2:0]  io_in_bits_rm,
  input  [1:0]  io_in_bits_typ,
  input  [63:0] io_in_bits_in1,
  output [64:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [95:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  i2f_io_signedIn; // @[FPU.scala 550:23]
  wire [63:0] i2f_io_in; // @[FPU.scala 550:23]
  wire [2:0] i2f_io_roundingMode; // @[FPU.scala 550:23]
  wire [32:0] i2f_io_out; // @[FPU.scala 550:23]
  wire [4:0] i2f_io_exceptionFlags; // @[FPU.scala 550:23]
  wire  i2f_1_io_signedIn; // @[FPU.scala 550:23]
  wire [63:0] i2f_1_io_in; // @[FPU.scala 550:23]
  wire [2:0] i2f_1_io_roundingMode; // @[FPU.scala 550:23]
  wire [64:0] i2f_1_io_out; // @[FPU.scala 550:23]
  wire [4:0] i2f_1_io_exceptionFlags; // @[FPU.scala 550:23]
  reg  inPipe_valid; // @[Valid.scala 127:22]
  reg [1:0] inPipe_bits_typeTagIn; // @[Reg.scala 16:16]
  reg  inPipe_bits_wflags; // @[Reg.scala 16:16]
  reg [2:0] inPipe_bits_rm; // @[Reg.scala 16:16]
  reg [1:0] inPipe_bits_typ; // @[Reg.scala 16:16]
  reg [63:0] inPipe_bits_in1; // @[Reg.scala 16:16]
  wire  mux_data_truncIdx = inPipe_bits_typeTagIn[0]; // @[package.scala 31:49]
  wire [63:0] _mux_data_T_1 = mux_data_truncIdx ? 64'h0 : 64'hffffffff00000000; // @[package.scala 32:76]
  wire [63:0] _mux_data_T_2 = _mux_data_T_1 | inPipe_bits_in1; // @[FPU.scala 426:23]
  wire  mux_data_rawIn_sign = _mux_data_T_2[63]; // @[rawFloatFromFN.scala 46:22]
  wire [10:0] mux_data_rawIn_expIn = _mux_data_T_2[62:52]; // @[rawFloatFromFN.scala 47:23]
  wire [51:0] mux_data_rawIn_fractIn = _mux_data_T_2[51:0]; // @[rawFloatFromFN.scala 48:25]
  wire  mux_data_rawIn_isZeroExpIn = mux_data_rawIn_expIn == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  mux_data_rawIn_isZeroFractIn = mux_data_rawIn_fractIn == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _mux_data_rawIn_normDist_T_52 = mux_data_rawIn_fractIn[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_53 = mux_data_rawIn_fractIn[2] ? 6'h31 : _mux_data_rawIn_normDist_T_52; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_54 = mux_data_rawIn_fractIn[3] ? 6'h30 : _mux_data_rawIn_normDist_T_53; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_55 = mux_data_rawIn_fractIn[4] ? 6'h2f : _mux_data_rawIn_normDist_T_54; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_56 = mux_data_rawIn_fractIn[5] ? 6'h2e : _mux_data_rawIn_normDist_T_55; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_57 = mux_data_rawIn_fractIn[6] ? 6'h2d : _mux_data_rawIn_normDist_T_56; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_58 = mux_data_rawIn_fractIn[7] ? 6'h2c : _mux_data_rawIn_normDist_T_57; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_59 = mux_data_rawIn_fractIn[8] ? 6'h2b : _mux_data_rawIn_normDist_T_58; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_60 = mux_data_rawIn_fractIn[9] ? 6'h2a : _mux_data_rawIn_normDist_T_59; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_61 = mux_data_rawIn_fractIn[10] ? 6'h29 : _mux_data_rawIn_normDist_T_60; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_62 = mux_data_rawIn_fractIn[11] ? 6'h28 : _mux_data_rawIn_normDist_T_61; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_63 = mux_data_rawIn_fractIn[12] ? 6'h27 : _mux_data_rawIn_normDist_T_62; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_64 = mux_data_rawIn_fractIn[13] ? 6'h26 : _mux_data_rawIn_normDist_T_63; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_65 = mux_data_rawIn_fractIn[14] ? 6'h25 : _mux_data_rawIn_normDist_T_64; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_66 = mux_data_rawIn_fractIn[15] ? 6'h24 : _mux_data_rawIn_normDist_T_65; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_67 = mux_data_rawIn_fractIn[16] ? 6'h23 : _mux_data_rawIn_normDist_T_66; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_68 = mux_data_rawIn_fractIn[17] ? 6'h22 : _mux_data_rawIn_normDist_T_67; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_69 = mux_data_rawIn_fractIn[18] ? 6'h21 : _mux_data_rawIn_normDist_T_68; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_70 = mux_data_rawIn_fractIn[19] ? 6'h20 : _mux_data_rawIn_normDist_T_69; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_71 = mux_data_rawIn_fractIn[20] ? 6'h1f : _mux_data_rawIn_normDist_T_70; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_72 = mux_data_rawIn_fractIn[21] ? 6'h1e : _mux_data_rawIn_normDist_T_71; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_73 = mux_data_rawIn_fractIn[22] ? 6'h1d : _mux_data_rawIn_normDist_T_72; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_74 = mux_data_rawIn_fractIn[23] ? 6'h1c : _mux_data_rawIn_normDist_T_73; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_75 = mux_data_rawIn_fractIn[24] ? 6'h1b : _mux_data_rawIn_normDist_T_74; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_76 = mux_data_rawIn_fractIn[25] ? 6'h1a : _mux_data_rawIn_normDist_T_75; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_77 = mux_data_rawIn_fractIn[26] ? 6'h19 : _mux_data_rawIn_normDist_T_76; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_78 = mux_data_rawIn_fractIn[27] ? 6'h18 : _mux_data_rawIn_normDist_T_77; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_79 = mux_data_rawIn_fractIn[28] ? 6'h17 : _mux_data_rawIn_normDist_T_78; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_80 = mux_data_rawIn_fractIn[29] ? 6'h16 : _mux_data_rawIn_normDist_T_79; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_81 = mux_data_rawIn_fractIn[30] ? 6'h15 : _mux_data_rawIn_normDist_T_80; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_82 = mux_data_rawIn_fractIn[31] ? 6'h14 : _mux_data_rawIn_normDist_T_81; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_83 = mux_data_rawIn_fractIn[32] ? 6'h13 : _mux_data_rawIn_normDist_T_82; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_84 = mux_data_rawIn_fractIn[33] ? 6'h12 : _mux_data_rawIn_normDist_T_83; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_85 = mux_data_rawIn_fractIn[34] ? 6'h11 : _mux_data_rawIn_normDist_T_84; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_86 = mux_data_rawIn_fractIn[35] ? 6'h10 : _mux_data_rawIn_normDist_T_85; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_87 = mux_data_rawIn_fractIn[36] ? 6'hf : _mux_data_rawIn_normDist_T_86; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_88 = mux_data_rawIn_fractIn[37] ? 6'he : _mux_data_rawIn_normDist_T_87; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_89 = mux_data_rawIn_fractIn[38] ? 6'hd : _mux_data_rawIn_normDist_T_88; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_90 = mux_data_rawIn_fractIn[39] ? 6'hc : _mux_data_rawIn_normDist_T_89; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_91 = mux_data_rawIn_fractIn[40] ? 6'hb : _mux_data_rawIn_normDist_T_90; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_92 = mux_data_rawIn_fractIn[41] ? 6'ha : _mux_data_rawIn_normDist_T_91; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_93 = mux_data_rawIn_fractIn[42] ? 6'h9 : _mux_data_rawIn_normDist_T_92; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_94 = mux_data_rawIn_fractIn[43] ? 6'h8 : _mux_data_rawIn_normDist_T_93; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_95 = mux_data_rawIn_fractIn[44] ? 6'h7 : _mux_data_rawIn_normDist_T_94; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_96 = mux_data_rawIn_fractIn[45] ? 6'h6 : _mux_data_rawIn_normDist_T_95; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_97 = mux_data_rawIn_fractIn[46] ? 6'h5 : _mux_data_rawIn_normDist_T_96; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_98 = mux_data_rawIn_fractIn[47] ? 6'h4 : _mux_data_rawIn_normDist_T_97; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_99 = mux_data_rawIn_fractIn[48] ? 6'h3 : _mux_data_rawIn_normDist_T_98; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_100 = mux_data_rawIn_fractIn[49] ? 6'h2 : _mux_data_rawIn_normDist_T_99; // @[Mux.scala 47:70]
  wire [5:0] _mux_data_rawIn_normDist_T_101 = mux_data_rawIn_fractIn[50] ? 6'h1 : _mux_data_rawIn_normDist_T_100; // @[Mux.scala 47:70]
  wire [5:0] mux_data_rawIn_normDist = mux_data_rawIn_fractIn[51] ? 6'h0 : _mux_data_rawIn_normDist_T_101; // @[Mux.scala 47:70]
  wire [114:0] _GEN_0 = {{63'd0}, mux_data_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _mux_data_rawIn_subnormFract_T = _GEN_0 << mux_data_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] mux_data_rawIn_subnormFract = {_mux_data_rawIn_subnormFract_T[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_24 = {{6'd0}, mux_data_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _mux_data_rawIn_adjustedExp_T = _GEN_24 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _mux_data_rawIn_adjustedExp_T_1 = mux_data_rawIn_isZeroExpIn ? _mux_data_rawIn_adjustedExp_T : {{1'd0},
    mux_data_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _mux_data_rawIn_adjustedExp_T_2 = mux_data_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_25 = {{9'd0}, _mux_data_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _mux_data_rawIn_adjustedExp_T_3 = 11'h400 | _GEN_25; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_26 = {{1'd0}, _mux_data_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] mux_data_rawIn_adjustedExp = _mux_data_rawIn_adjustedExp_T_1 + _GEN_26; // @[rawFloatFromFN.scala 59:15]
  wire  mux_data_rawIn_isZero = mux_data_rawIn_isZeroExpIn & mux_data_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  mux_data_rawIn_isSpecial = mux_data_rawIn_adjustedExp[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  mux_data_rawIn__isNaN = mux_data_rawIn_isSpecial & ~mux_data_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] mux_data_rawIn__sExp = {1'b0,$signed(mux_data_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _mux_data_rawIn_out_sig_T = ~mux_data_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] _mux_data_rawIn_out_sig_T_1 = mux_data_rawIn_isZeroExpIn ? mux_data_rawIn_subnormFract :
    mux_data_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] mux_data_rawIn__sig = {1'h0,_mux_data_rawIn_out_sig_T,_mux_data_rawIn_out_sig_T_1}; // @[Cat.scala 31:58]
  wire [2:0] _mux_data_T_4 = mux_data_rawIn_isZero ? 3'h0 : mux_data_rawIn__sExp[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_27 = {{2'd0}, mux_data_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _mux_data_T_6 = _mux_data_T_4 | _GEN_27; // @[recFNFromFN.scala 48:79]
  wire [64:0] _mux_data_T_9 = {mux_data_rawIn_sign,_mux_data_T_6,mux_data_rawIn__sExp[8:0],mux_data_rawIn__sig[51:0]}; // @[Cat.scala 31:58]
  wire  mux_data_rawIn_sign_1 = _mux_data_T_2[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] mux_data_rawIn_expIn_1 = _mux_data_T_2[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] mux_data_rawIn_fractIn_1 = _mux_data_T_2[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  mux_data_rawIn_isZeroExpIn_1 = mux_data_rawIn_expIn_1 == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  mux_data_rawIn_isZeroFractIn_1 = mux_data_rawIn_fractIn_1 == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _mux_data_rawIn_normDist_T_125 = mux_data_rawIn_fractIn_1[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_126 = mux_data_rawIn_fractIn_1[2] ? 5'h14 : _mux_data_rawIn_normDist_T_125; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_127 = mux_data_rawIn_fractIn_1[3] ? 5'h13 : _mux_data_rawIn_normDist_T_126; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_128 = mux_data_rawIn_fractIn_1[4] ? 5'h12 : _mux_data_rawIn_normDist_T_127; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_129 = mux_data_rawIn_fractIn_1[5] ? 5'h11 : _mux_data_rawIn_normDist_T_128; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_130 = mux_data_rawIn_fractIn_1[6] ? 5'h10 : _mux_data_rawIn_normDist_T_129; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_131 = mux_data_rawIn_fractIn_1[7] ? 5'hf : _mux_data_rawIn_normDist_T_130; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_132 = mux_data_rawIn_fractIn_1[8] ? 5'he : _mux_data_rawIn_normDist_T_131; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_133 = mux_data_rawIn_fractIn_1[9] ? 5'hd : _mux_data_rawIn_normDist_T_132; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_134 = mux_data_rawIn_fractIn_1[10] ? 5'hc : _mux_data_rawIn_normDist_T_133; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_135 = mux_data_rawIn_fractIn_1[11] ? 5'hb : _mux_data_rawIn_normDist_T_134; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_136 = mux_data_rawIn_fractIn_1[12] ? 5'ha : _mux_data_rawIn_normDist_T_135; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_137 = mux_data_rawIn_fractIn_1[13] ? 5'h9 : _mux_data_rawIn_normDist_T_136; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_138 = mux_data_rawIn_fractIn_1[14] ? 5'h8 : _mux_data_rawIn_normDist_T_137; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_139 = mux_data_rawIn_fractIn_1[15] ? 5'h7 : _mux_data_rawIn_normDist_T_138; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_140 = mux_data_rawIn_fractIn_1[16] ? 5'h6 : _mux_data_rawIn_normDist_T_139; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_141 = mux_data_rawIn_fractIn_1[17] ? 5'h5 : _mux_data_rawIn_normDist_T_140; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_142 = mux_data_rawIn_fractIn_1[18] ? 5'h4 : _mux_data_rawIn_normDist_T_141; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_143 = mux_data_rawIn_fractIn_1[19] ? 5'h3 : _mux_data_rawIn_normDist_T_142; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_144 = mux_data_rawIn_fractIn_1[20] ? 5'h2 : _mux_data_rawIn_normDist_T_143; // @[Mux.scala 47:70]
  wire [4:0] _mux_data_rawIn_normDist_T_145 = mux_data_rawIn_fractIn_1[21] ? 5'h1 : _mux_data_rawIn_normDist_T_144; // @[Mux.scala 47:70]
  wire [4:0] mux_data_rawIn_normDist_1 = mux_data_rawIn_fractIn_1[22] ? 5'h0 : _mux_data_rawIn_normDist_T_145; // @[Mux.scala 47:70]
  wire [53:0] _GEN_1 = {{31'd0}, mux_data_rawIn_fractIn_1}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _mux_data_rawIn_subnormFract_T_2 = _GEN_1 << mux_data_rawIn_normDist_1; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] mux_data_rawIn_subnormFract_1 = {_mux_data_rawIn_subnormFract_T_2[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_28 = {{4'd0}, mux_data_rawIn_normDist_1}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _mux_data_rawIn_adjustedExp_T_5 = _GEN_28 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _mux_data_rawIn_adjustedExp_T_6 = mux_data_rawIn_isZeroExpIn_1 ? _mux_data_rawIn_adjustedExp_T_5 : {{1
    'd0}, mux_data_rawIn_expIn_1}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _mux_data_rawIn_adjustedExp_T_7 = mux_data_rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_29 = {{6'd0}, _mux_data_rawIn_adjustedExp_T_7}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _mux_data_rawIn_adjustedExp_T_8 = 8'h80 | _GEN_29; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_30 = {{1'd0}, _mux_data_rawIn_adjustedExp_T_8}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] mux_data_rawIn_adjustedExp_1 = _mux_data_rawIn_adjustedExp_T_6 + _GEN_30; // @[rawFloatFromFN.scala 59:15]
  wire  mux_data_rawIn_isZero_1 = mux_data_rawIn_isZeroExpIn_1 & mux_data_rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 62:34]
  wire  mux_data_rawIn_isSpecial_1 = mux_data_rawIn_adjustedExp_1[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  mux_data_rawIn_1_isNaN = mux_data_rawIn_isSpecial_1 & ~mux_data_rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] mux_data_rawIn_1_sExp = {1'b0,$signed(mux_data_rawIn_adjustedExp_1)}; // @[rawFloatFromFN.scala 70:48]
  wire  _mux_data_rawIn_out_sig_T_3 = ~mux_data_rawIn_isZero_1; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _mux_data_rawIn_out_sig_T_4 = mux_data_rawIn_isZeroExpIn_1 ? mux_data_rawIn_subnormFract_1 :
    mux_data_rawIn_fractIn_1; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] mux_data_rawIn_1_sig = {1'h0,_mux_data_rawIn_out_sig_T_3,_mux_data_rawIn_out_sig_T_4}; // @[Cat.scala 31:58]
  wire [2:0] _mux_data_T_11 = mux_data_rawIn_isZero_1 ? 3'h0 : mux_data_rawIn_1_sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_31 = {{2'd0}, mux_data_rawIn_1_isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _mux_data_T_13 = _mux_data_T_11 | _GEN_31; // @[recFNFromFN.scala 48:79]
  wire [32:0] _mux_data_T_16 = {mux_data_rawIn_sign_1,_mux_data_T_13,mux_data_rawIn_1_sExp[5:0],mux_data_rawIn_1_sig[22:
    0]}; // @[Cat.scala 31:58]
  wire  _mux_data_swizzledNaN_T_2 = &_mux_data_T_9[51:32]; // @[FPU.scala 333:42]
  wire [64:0] mux_data_swizzledNaN = {_mux_data_T_9[64:61],_mux_data_swizzledNaN_T_2,_mux_data_T_9[59:53],_mux_data_T_16
    [31],_mux_data_T_9[51:32],_mux_data_T_16[32],_mux_data_T_16[30:0]}; // @[Cat.scala 31:58]
  wire  _mux_data_T_18 = &_mux_data_T_9[63:61]; // @[FPU.scala 244:56]
  wire [31:0] intValue_smallInt = inPipe_bits_in1[31:0]; // @[FPU.scala 538:33]
  wire [32:0] _intValue_res_T_1 = {1'b0,$signed(intValue_smallInt)}; // @[FPU.scala 540:45]
  wire [31:0] _intValue_res_T_2 = inPipe_bits_in1[31:0]; // @[FPU.scala 540:60]
  wire [32:0] _intValue_res_T_3 = inPipe_bits_typ[0] ? $signed(_intValue_res_T_1) : $signed({{1{_intValue_res_T_2[31]}},
    _intValue_res_T_2}); // @[FPU.scala 540:19]
  wire [64:0] maskedNaN = i2f_1_io_out & 65'h1efefffffffffffff; // @[FPU.scala 408:25]
  wire  _T_1 = &i2f_1_io_out[63:61]; // @[FPU.scala 244:56]
  wire [64:0] _T_2 = _T_1 ? maskedNaN : i2f_1_io_out; // @[FPU.scala 409:10]
  wire [64:0] dataPadded_0 = {_T_2[64:33],i2f_io_out}; // @[Cat.scala 31:58]
  reg [64:0] io_out_b_data; // @[Reg.scala 16:16]
  reg [4:0] io_out_b_exc; // @[Reg.scala 16:16]
  INToRecFN i2f ( // @[FPU.scala 550:23]
    .io_signedIn(i2f_io_signedIn),
    .io_in(i2f_io_in),
    .io_roundingMode(i2f_io_roundingMode),
    .io_out(i2f_io_out),
    .io_exceptionFlags(i2f_io_exceptionFlags)
  );
  INToRecFN_1 i2f_1 ( // @[FPU.scala 550:23]
    .io_signedIn(i2f_1_io_signedIn),
    .io_in(i2f_1_io_in),
    .io_roundingMode(i2f_1_io_roundingMode),
    .io_out(i2f_1_io_out),
    .io_exceptionFlags(i2f_1_io_exceptionFlags)
  );
  assign io_out_bits_data = io_out_b_data; // @[Valid.scala 122:21 124:16]
  assign io_out_bits_exc = io_out_b_exc; // @[Valid.scala 122:21 124:16]
  assign i2f_io_signedIn = ~inPipe_bits_typ[0]; // @[FPU.scala 551:26]
  assign i2f_io_in = ~inPipe_bits_typ[1] ? $signed({{31{_intValue_res_T_3[32]}},_intValue_res_T_3}) : $signed(
    inPipe_bits_in1); // @[FPU.scala 543:9]
  assign i2f_io_roundingMode = inPipe_bits_rm; // @[Valid.scala 122:21 124:16]
  assign i2f_1_io_signedIn = ~inPipe_bits_typ[0]; // @[FPU.scala 551:26]
  assign i2f_1_io_in = ~inPipe_bits_typ[1] ? $signed({{31{_intValue_res_T_3[32]}},_intValue_res_T_3}) : $signed(
    inPipe_bits_in1); // @[FPU.scala 543:9]
  assign i2f_1_io_roundingMode = inPipe_bits_rm; // @[Valid.scala 122:21 124:16]
  always @(posedge clock) begin
    if (reset) begin // @[Valid.scala 127:22]
      inPipe_valid <= 1'h0; // @[Valid.scala 127:22]
    end else begin
      inPipe_valid <= io_in_valid; // @[Valid.scala 127:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_typeTagIn <= io_in_bits_typeTagIn; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_wflags <= io_in_bits_wflags; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_rm <= io_in_bits_rm; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_typ <= io_in_bits_typ; // @[Reg.scala 17:22]
    end
    if (io_in_valid) begin // @[Reg.scala 17:18]
      inPipe_bits_in1 <= io_in_bits_in1; // @[Reg.scala 17:22]
    end
    if (inPipe_valid) begin // @[Reg.scala 17:18]
      if (inPipe_bits_wflags) begin // @[FPU.scala 546:25]
        if (mux_data_truncIdx) begin // @[package.scala 32:76]
          if (_T_1) begin // @[FPU.scala 409:10]
            io_out_b_data <= maskedNaN;
          end else begin
            io_out_b_data <= i2f_1_io_out;
          end
        end else begin
          io_out_b_data <= dataPadded_0;
        end
      end else if (_mux_data_T_18) begin // @[FPU.scala 339:8]
        io_out_b_data <= mux_data_swizzledNaN;
      end else begin
        io_out_b_data <= _mux_data_T_9;
      end
    end
    if (inPipe_valid) begin // @[Reg.scala 17:18]
      if (inPipe_bits_wflags) begin // @[FPU.scala 546:25]
        if (mux_data_truncIdx) begin // @[package.scala 32:76]
          io_out_b_exc <= i2f_1_io_exceptionFlags;
        end else begin
          io_out_b_exc <= i2f_io_exceptionFlags;
        end
      end else begin
        io_out_b_exc <= 5'h0; // @[FPU.scala 532:11]
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
  inPipe_bits_typeTagIn = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  inPipe_bits_wflags = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  inPipe_bits_rm = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  inPipe_bits_typ = _RAND_4[1:0];
  _RAND_5 = {2{`RANDOM}};
  inPipe_bits_in1 = _RAND_5[63:0];
  _RAND_6 = {3{`RANDOM}};
  io_out_b_data = _RAND_6[64:0];
  _RAND_7 = {1{`RANDOM}};
  io_out_b_exc = _RAND_7[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
