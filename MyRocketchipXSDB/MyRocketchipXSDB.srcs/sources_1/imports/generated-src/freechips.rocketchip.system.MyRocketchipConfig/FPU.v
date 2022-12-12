module FPU(
  input         clock,
  input         reset,
  input  [31:0] io_inst,
  input  [63:0] io_fromint_data,
  input  [2:0]  io_fcsr_rm,
  output        io_fcsr_flags_valid,
  output [4:0]  io_fcsr_flags_bits,
  output [63:0] io_store_data,
  output [63:0] io_toint_data,
  input         io_dmem_resp_val,
  input  [2:0]  io_dmem_resp_type,
  input  [4:0]  io_dmem_resp_tag,
  input  [63:0] io_dmem_resp_data,
  input         io_valid,
  output        io_fcsr_rdy,
  output        io_nack_mem,
  output        io_illegal_rm,
  input         io_killx,
  input         io_killm,
  output        io_dec_wen,
  output        io_dec_ren1,
  output        io_dec_ren2,
  output        io_dec_ren3,
  output        io_sboard_set,
  output        io_sboard_clr,
  output [4:0]  io_sboard_clra
);
`ifdef RANDOMIZE_MEM_INIT
  reg [95:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
`endif // RANDOMIZE_REG_INIT
  wire [31:0] fp_decoder_io_inst; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_wen; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_ren1; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_ren2; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_ren3; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_swap12; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_swap23; // @[FPU.scala 741:26]
  wire [1:0] fp_decoder_io_sigs_typeTagIn; // @[FPU.scala 741:26]
  wire [1:0] fp_decoder_io_sigs_typeTagOut; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_fromint; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_toint; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_fastpipe; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_fma; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_div; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_sqrt; // @[FPU.scala 741:26]
  wire  fp_decoder_io_sigs_wflags; // @[FPU.scala 741:26]
  reg [64:0] regfile [0:31]; // @[FPU.scala 795:20]
  wire  regfile_ex_rs_0_en; // @[FPU.scala 795:20]
  wire [4:0] regfile_ex_rs_0_addr; // @[FPU.scala 795:20]
  wire [64:0] regfile_ex_rs_0_data; // @[FPU.scala 795:20]
  wire  regfile_ex_rs_1_en; // @[FPU.scala 795:20]
  wire [4:0] regfile_ex_rs_1_addr; // @[FPU.scala 795:20]
  wire [64:0] regfile_ex_rs_1_data; // @[FPU.scala 795:20]
  wire  regfile_ex_rs_2_en; // @[FPU.scala 795:20]
  wire [4:0] regfile_ex_rs_2_addr; // @[FPU.scala 795:20]
  wire [64:0] regfile_ex_rs_2_data; // @[FPU.scala 795:20]
  wire [64:0] regfile_MPORT_data; // @[FPU.scala 795:20]
  wire [4:0] regfile_MPORT_addr; // @[FPU.scala 795:20]
  wire  regfile_MPORT_mask; // @[FPU.scala 795:20]
  wire  regfile_MPORT_en; // @[FPU.scala 795:20]
  wire [64:0] regfile_MPORT_1_data; // @[FPU.scala 795:20]
  wire [4:0] regfile_MPORT_1_addr; // @[FPU.scala 795:20]
  wire  regfile_MPORT_1_mask; // @[FPU.scala 795:20]
  wire  regfile_MPORT_1_en; // @[FPU.scala 795:20]
  wire  sfma_clock; // @[FPU.scala 843:20]
  wire  sfma_reset; // @[FPU.scala 843:20]
  wire  sfma_io_in_valid; // @[FPU.scala 843:20]
  wire  sfma_io_in_bits_ren3; // @[FPU.scala 843:20]
  wire  sfma_io_in_bits_swap23; // @[FPU.scala 843:20]
  wire [2:0] sfma_io_in_bits_rm; // @[FPU.scala 843:20]
  wire [1:0] sfma_io_in_bits_fmaCmd; // @[FPU.scala 843:20]
  wire [64:0] sfma_io_in_bits_in1; // @[FPU.scala 843:20]
  wire [64:0] sfma_io_in_bits_in2; // @[FPU.scala 843:20]
  wire [64:0] sfma_io_in_bits_in3; // @[FPU.scala 843:20]
  wire [64:0] sfma_io_out_bits_data; // @[FPU.scala 843:20]
  wire [4:0] sfma_io_out_bits_exc; // @[FPU.scala 843:20]
  wire  fpiu_clock; // @[FPU.scala 847:20]
  wire  fpiu_io_in_valid; // @[FPU.scala 847:20]
  wire  fpiu_io_in_bits_ren2; // @[FPU.scala 847:20]
  wire [1:0] fpiu_io_in_bits_typeTagIn; // @[FPU.scala 847:20]
  wire [1:0] fpiu_io_in_bits_typeTagOut; // @[FPU.scala 847:20]
  wire  fpiu_io_in_bits_wflags; // @[FPU.scala 847:20]
  wire [2:0] fpiu_io_in_bits_rm; // @[FPU.scala 847:20]
  wire [1:0] fpiu_io_in_bits_typ; // @[FPU.scala 847:20]
  wire [1:0] fpiu_io_in_bits_fmt; // @[FPU.scala 847:20]
  wire [64:0] fpiu_io_in_bits_in1; // @[FPU.scala 847:20]
  wire [64:0] fpiu_io_in_bits_in2; // @[FPU.scala 847:20]
  wire [2:0] fpiu_io_out_bits_in_rm; // @[FPU.scala 847:20]
  wire [64:0] fpiu_io_out_bits_in_in1; // @[FPU.scala 847:20]
  wire [64:0] fpiu_io_out_bits_in_in2; // @[FPU.scala 847:20]
  wire  fpiu_io_out_bits_lt; // @[FPU.scala 847:20]
  wire [63:0] fpiu_io_out_bits_store; // @[FPU.scala 847:20]
  wire [63:0] fpiu_io_out_bits_toint; // @[FPU.scala 847:20]
  wire [4:0] fpiu_io_out_bits_exc; // @[FPU.scala 847:20]
  wire  ifpu_clock; // @[FPU.scala 857:20]
  wire  ifpu_reset; // @[FPU.scala 857:20]
  wire  ifpu_io_in_valid; // @[FPU.scala 857:20]
  wire [1:0] ifpu_io_in_bits_typeTagIn; // @[FPU.scala 857:20]
  wire  ifpu_io_in_bits_wflags; // @[FPU.scala 857:20]
  wire [2:0] ifpu_io_in_bits_rm; // @[FPU.scala 857:20]
  wire [1:0] ifpu_io_in_bits_typ; // @[FPU.scala 857:20]
  wire [63:0] ifpu_io_in_bits_in1; // @[FPU.scala 857:20]
  wire [64:0] ifpu_io_out_bits_data; // @[FPU.scala 857:20]
  wire [4:0] ifpu_io_out_bits_exc; // @[FPU.scala 857:20]
  wire  fpmu_clock; // @[FPU.scala 862:20]
  wire  fpmu_reset; // @[FPU.scala 862:20]
  wire  fpmu_io_in_valid; // @[FPU.scala 862:20]
  wire  fpmu_io_in_bits_ren2; // @[FPU.scala 862:20]
  wire [1:0] fpmu_io_in_bits_typeTagOut; // @[FPU.scala 862:20]
  wire  fpmu_io_in_bits_wflags; // @[FPU.scala 862:20]
  wire [2:0] fpmu_io_in_bits_rm; // @[FPU.scala 862:20]
  wire [64:0] fpmu_io_in_bits_in1; // @[FPU.scala 862:20]
  wire [64:0] fpmu_io_in_bits_in2; // @[FPU.scala 862:20]
  wire [64:0] fpmu_io_out_bits_data; // @[FPU.scala 862:20]
  wire [4:0] fpmu_io_out_bits_exc; // @[FPU.scala 862:20]
  wire  fpmu_io_lt; // @[FPU.scala 862:20]
  wire  dfma_clock; // @[FPU.scala 881:28]
  wire  dfma_reset; // @[FPU.scala 881:28]
  wire  dfma_io_in_valid; // @[FPU.scala 881:28]
  wire  dfma_io_in_bits_ren3; // @[FPU.scala 881:28]
  wire  dfma_io_in_bits_swap23; // @[FPU.scala 881:28]
  wire [2:0] dfma_io_in_bits_rm; // @[FPU.scala 881:28]
  wire [1:0] dfma_io_in_bits_fmaCmd; // @[FPU.scala 881:28]
  wire [64:0] dfma_io_in_bits_in1; // @[FPU.scala 881:28]
  wire [64:0] dfma_io_in_bits_in2; // @[FPU.scala 881:28]
  wire [64:0] dfma_io_in_bits_in3; // @[FPU.scala 881:28]
  wire [64:0] dfma_io_out_bits_data; // @[FPU.scala 881:28]
  wire [4:0] dfma_io_out_bits_exc; // @[FPU.scala 881:28]
  wire  divSqrt_clock; // @[FPU.scala 984:55]
  wire  divSqrt_reset; // @[FPU.scala 984:55]
  wire  divSqrt_io_inReady; // @[FPU.scala 984:55]
  wire  divSqrt_io_inValid; // @[FPU.scala 984:55]
  wire  divSqrt_io_sqrtOp; // @[FPU.scala 984:55]
  wire [32:0] divSqrt_io_a; // @[FPU.scala 984:55]
  wire [32:0] divSqrt_io_b; // @[FPU.scala 984:55]
  wire [2:0] divSqrt_io_roundingMode; // @[FPU.scala 984:55]
  wire  divSqrt_io_outValid_div; // @[FPU.scala 984:55]
  wire  divSqrt_io_outValid_sqrt; // @[FPU.scala 984:55]
  wire [32:0] divSqrt_io_out; // @[FPU.scala 984:55]
  wire [4:0] divSqrt_io_exceptionFlags; // @[FPU.scala 984:55]
  wire  divSqrt_1_clock; // @[FPU.scala 984:55]
  wire  divSqrt_1_reset; // @[FPU.scala 984:55]
  wire  divSqrt_1_io_inReady; // @[FPU.scala 984:55]
  wire  divSqrt_1_io_inValid; // @[FPU.scala 984:55]
  wire  divSqrt_1_io_sqrtOp; // @[FPU.scala 984:55]
  wire [64:0] divSqrt_1_io_a; // @[FPU.scala 984:55]
  wire [64:0] divSqrt_1_io_b; // @[FPU.scala 984:55]
  wire [2:0] divSqrt_1_io_roundingMode; // @[FPU.scala 984:55]
  wire  divSqrt_1_io_outValid_div; // @[FPU.scala 984:55]
  wire  divSqrt_1_io_outValid_sqrt; // @[FPU.scala 984:55]
  wire [64:0] divSqrt_1_io_out; // @[FPU.scala 984:55]
  wire [4:0] divSqrt_1_io_exceptionFlags; // @[FPU.scala 984:55]
  reg  ex_reg_valid; // @[FPU.scala 745:25]
  reg [31:0] ex_reg_inst; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_ren2; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_ren3; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_swap23; // @[Reg.scala 16:16]
  reg [1:0] ex_reg_ctrl_typeTagIn; // @[Reg.scala 16:16]
  reg [1:0] ex_reg_ctrl_typeTagOut; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_fromint; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_toint; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_fastpipe; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_fma; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_div; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_sqrt; // @[Reg.scala 16:16]
  reg  ex_reg_ctrl_wflags; // @[Reg.scala 16:16]
  reg [4:0] ex_ra_0; // @[FPU.scala 748:31]
  reg [4:0] ex_ra_1; // @[FPU.scala 748:31]
  reg [4:0] ex_ra_2; // @[FPU.scala 748:31]
  reg  load_wb; // @[FPU.scala 751:20]
  wire [1:0] _load_wb_typeTag_T_2 = io_dmem_resp_type[1:0] - 2'h2; // @[FPU.scala 752:58]
  reg [1:0] load_wb_typeTag; // @[Reg.scala 16:16]
  reg [63:0] load_wb_data; // @[Reg.scala 16:16]
  reg [4:0] load_wb_tag; // @[Reg.scala 16:16]
  reg  mem_reg_valid; // @[FPU.scala 762:30]
  wire  killm = io_killm | io_nack_mem; // @[FPU.scala 763:25]
  wire  killx = io_killx | mem_reg_valid & killm; // @[FPU.scala 767:24]
  reg [31:0] mem_reg_inst; // @[Reg.scala 16:16]
  wire  _wb_reg_valid_x8_T = ~killm; // @[FPU.scala 770:49]
  wire  wb_reg_valid_x8 = mem_reg_valid & ~killm; // @[FPU.scala 770:45]
  reg  wb_reg_valid; // @[FPU.scala 770:25]
  reg [1:0] mem_ctrl_typeTagOut; // @[Reg.scala 16:16]
  reg  mem_ctrl_fromint; // @[Reg.scala 16:16]
  reg  mem_ctrl_toint; // @[Reg.scala 16:16]
  reg  mem_ctrl_fastpipe; // @[Reg.scala 16:16]
  reg  mem_ctrl_fma; // @[Reg.scala 16:16]
  reg  mem_ctrl_div; // @[Reg.scala 16:16]
  reg  mem_ctrl_sqrt; // @[Reg.scala 16:16]
  reg  mem_ctrl_wflags; // @[Reg.scala 16:16]
  reg  wb_ctrl_toint; // @[Reg.scala 16:16]
  wire  wdata_truncIdx = load_wb_typeTag[0]; // @[package.scala 31:49]
  wire [63:0] _wdata_T_1 = wdata_truncIdx ? 64'h0 : 64'hffffffff00000000; // @[package.scala 32:76]
  wire [63:0] _wdata_T_2 = _wdata_T_1 | load_wb_data; // @[FPU.scala 426:23]
  wire  wdata_rawIn_sign = _wdata_T_2[63]; // @[rawFloatFromFN.scala 46:22]
  wire [10:0] wdata_rawIn_expIn = _wdata_T_2[62:52]; // @[rawFloatFromFN.scala 47:23]
  wire [51:0] wdata_rawIn_fractIn = _wdata_T_2[51:0]; // @[rawFloatFromFN.scala 48:25]
  wire  wdata_rawIn_isZeroExpIn = wdata_rawIn_expIn == 11'h0; // @[rawFloatFromFN.scala 50:34]
  wire  wdata_rawIn_isZeroFractIn = wdata_rawIn_fractIn == 52'h0; // @[rawFloatFromFN.scala 51:38]
  wire [5:0] _wdata_rawIn_normDist_T_52 = wdata_rawIn_fractIn[1] ? 6'h32 : 6'h33; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_53 = wdata_rawIn_fractIn[2] ? 6'h31 : _wdata_rawIn_normDist_T_52; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_54 = wdata_rawIn_fractIn[3] ? 6'h30 : _wdata_rawIn_normDist_T_53; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_55 = wdata_rawIn_fractIn[4] ? 6'h2f : _wdata_rawIn_normDist_T_54; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_56 = wdata_rawIn_fractIn[5] ? 6'h2e : _wdata_rawIn_normDist_T_55; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_57 = wdata_rawIn_fractIn[6] ? 6'h2d : _wdata_rawIn_normDist_T_56; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_58 = wdata_rawIn_fractIn[7] ? 6'h2c : _wdata_rawIn_normDist_T_57; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_59 = wdata_rawIn_fractIn[8] ? 6'h2b : _wdata_rawIn_normDist_T_58; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_60 = wdata_rawIn_fractIn[9] ? 6'h2a : _wdata_rawIn_normDist_T_59; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_61 = wdata_rawIn_fractIn[10] ? 6'h29 : _wdata_rawIn_normDist_T_60; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_62 = wdata_rawIn_fractIn[11] ? 6'h28 : _wdata_rawIn_normDist_T_61; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_63 = wdata_rawIn_fractIn[12] ? 6'h27 : _wdata_rawIn_normDist_T_62; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_64 = wdata_rawIn_fractIn[13] ? 6'h26 : _wdata_rawIn_normDist_T_63; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_65 = wdata_rawIn_fractIn[14] ? 6'h25 : _wdata_rawIn_normDist_T_64; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_66 = wdata_rawIn_fractIn[15] ? 6'h24 : _wdata_rawIn_normDist_T_65; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_67 = wdata_rawIn_fractIn[16] ? 6'h23 : _wdata_rawIn_normDist_T_66; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_68 = wdata_rawIn_fractIn[17] ? 6'h22 : _wdata_rawIn_normDist_T_67; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_69 = wdata_rawIn_fractIn[18] ? 6'h21 : _wdata_rawIn_normDist_T_68; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_70 = wdata_rawIn_fractIn[19] ? 6'h20 : _wdata_rawIn_normDist_T_69; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_71 = wdata_rawIn_fractIn[20] ? 6'h1f : _wdata_rawIn_normDist_T_70; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_72 = wdata_rawIn_fractIn[21] ? 6'h1e : _wdata_rawIn_normDist_T_71; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_73 = wdata_rawIn_fractIn[22] ? 6'h1d : _wdata_rawIn_normDist_T_72; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_74 = wdata_rawIn_fractIn[23] ? 6'h1c : _wdata_rawIn_normDist_T_73; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_75 = wdata_rawIn_fractIn[24] ? 6'h1b : _wdata_rawIn_normDist_T_74; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_76 = wdata_rawIn_fractIn[25] ? 6'h1a : _wdata_rawIn_normDist_T_75; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_77 = wdata_rawIn_fractIn[26] ? 6'h19 : _wdata_rawIn_normDist_T_76; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_78 = wdata_rawIn_fractIn[27] ? 6'h18 : _wdata_rawIn_normDist_T_77; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_79 = wdata_rawIn_fractIn[28] ? 6'h17 : _wdata_rawIn_normDist_T_78; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_80 = wdata_rawIn_fractIn[29] ? 6'h16 : _wdata_rawIn_normDist_T_79; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_81 = wdata_rawIn_fractIn[30] ? 6'h15 : _wdata_rawIn_normDist_T_80; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_82 = wdata_rawIn_fractIn[31] ? 6'h14 : _wdata_rawIn_normDist_T_81; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_83 = wdata_rawIn_fractIn[32] ? 6'h13 : _wdata_rawIn_normDist_T_82; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_84 = wdata_rawIn_fractIn[33] ? 6'h12 : _wdata_rawIn_normDist_T_83; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_85 = wdata_rawIn_fractIn[34] ? 6'h11 : _wdata_rawIn_normDist_T_84; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_86 = wdata_rawIn_fractIn[35] ? 6'h10 : _wdata_rawIn_normDist_T_85; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_87 = wdata_rawIn_fractIn[36] ? 6'hf : _wdata_rawIn_normDist_T_86; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_88 = wdata_rawIn_fractIn[37] ? 6'he : _wdata_rawIn_normDist_T_87; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_89 = wdata_rawIn_fractIn[38] ? 6'hd : _wdata_rawIn_normDist_T_88; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_90 = wdata_rawIn_fractIn[39] ? 6'hc : _wdata_rawIn_normDist_T_89; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_91 = wdata_rawIn_fractIn[40] ? 6'hb : _wdata_rawIn_normDist_T_90; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_92 = wdata_rawIn_fractIn[41] ? 6'ha : _wdata_rawIn_normDist_T_91; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_93 = wdata_rawIn_fractIn[42] ? 6'h9 : _wdata_rawIn_normDist_T_92; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_94 = wdata_rawIn_fractIn[43] ? 6'h8 : _wdata_rawIn_normDist_T_93; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_95 = wdata_rawIn_fractIn[44] ? 6'h7 : _wdata_rawIn_normDist_T_94; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_96 = wdata_rawIn_fractIn[45] ? 6'h6 : _wdata_rawIn_normDist_T_95; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_97 = wdata_rawIn_fractIn[46] ? 6'h5 : _wdata_rawIn_normDist_T_96; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_98 = wdata_rawIn_fractIn[47] ? 6'h4 : _wdata_rawIn_normDist_T_97; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_99 = wdata_rawIn_fractIn[48] ? 6'h3 : _wdata_rawIn_normDist_T_98; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_100 = wdata_rawIn_fractIn[49] ? 6'h2 : _wdata_rawIn_normDist_T_99; // @[Mux.scala 47:70]
  wire [5:0] _wdata_rawIn_normDist_T_101 = wdata_rawIn_fractIn[50] ? 6'h1 : _wdata_rawIn_normDist_T_100; // @[Mux.scala 47:70]
  wire [5:0] wdata_rawIn_normDist = wdata_rawIn_fractIn[51] ? 6'h0 : _wdata_rawIn_normDist_T_101; // @[Mux.scala 47:70]
  wire [114:0] _GEN_0 = {{63'd0}, wdata_rawIn_fractIn}; // @[rawFloatFromFN.scala 54:36]
  wire [114:0] _wdata_rawIn_subnormFract_T = _GEN_0 << wdata_rawIn_normDist; // @[rawFloatFromFN.scala 54:36]
  wire [51:0] wdata_rawIn_subnormFract = {_wdata_rawIn_subnormFract_T[50:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [11:0] _GEN_168 = {{6'd0}, wdata_rawIn_normDist}; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _wdata_rawIn_adjustedExp_T = _GEN_168 ^ 12'hfff; // @[rawFloatFromFN.scala 57:26]
  wire [11:0] _wdata_rawIn_adjustedExp_T_1 = wdata_rawIn_isZeroExpIn ? _wdata_rawIn_adjustedExp_T : {{1'd0},
    wdata_rawIn_expIn}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _wdata_rawIn_adjustedExp_T_2 = wdata_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [10:0] _GEN_169 = {{9'd0}, _wdata_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 60:22]
  wire [10:0] _wdata_rawIn_adjustedExp_T_3 = 11'h400 | _GEN_169; // @[rawFloatFromFN.scala 60:22]
  wire [11:0] _GEN_170 = {{1'd0}, _wdata_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 59:15]
  wire [11:0] wdata_rawIn_adjustedExp = _wdata_rawIn_adjustedExp_T_1 + _GEN_170; // @[rawFloatFromFN.scala 59:15]
  wire  wdata_rawIn_isZero = wdata_rawIn_isZeroExpIn & wdata_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 62:34]
  wire  wdata_rawIn_isSpecial = wdata_rawIn_adjustedExp[11:10] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  wdata_rawIn__isNaN = wdata_rawIn_isSpecial & ~wdata_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 66:33]
  wire [12:0] wdata_rawIn__sExp = {1'b0,$signed(wdata_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 70:48]
  wire  _wdata_rawIn_out_sig_T = ~wdata_rawIn_isZero; // @[rawFloatFromFN.scala 72:29]
  wire [51:0] _wdata_rawIn_out_sig_T_1 = wdata_rawIn_isZeroExpIn ? wdata_rawIn_subnormFract : wdata_rawIn_fractIn; // @[rawFloatFromFN.scala 72:42]
  wire [53:0] wdata_rawIn__sig = {1'h0,_wdata_rawIn_out_sig_T,_wdata_rawIn_out_sig_T_1}; // @[Cat.scala 31:58]
  wire [2:0] _wdata_T_4 = wdata_rawIn_isZero ? 3'h0 : wdata_rawIn__sExp[11:9]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_171 = {{2'd0}, wdata_rawIn__isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _wdata_T_6 = _wdata_T_4 | _GEN_171; // @[recFNFromFN.scala 48:79]
  wire [64:0] _wdata_T_9 = {wdata_rawIn_sign,_wdata_T_6,wdata_rawIn__sExp[8:0],wdata_rawIn__sig[51:0]}; // @[Cat.scala 31:58]
  wire  wdata_rawIn_sign_1 = _wdata_T_2[31]; // @[rawFloatFromFN.scala 46:22]
  wire [7:0] wdata_rawIn_expIn_1 = _wdata_T_2[30:23]; // @[rawFloatFromFN.scala 47:23]
  wire [22:0] wdata_rawIn_fractIn_1 = _wdata_T_2[22:0]; // @[rawFloatFromFN.scala 48:25]
  wire  wdata_rawIn_isZeroExpIn_1 = wdata_rawIn_expIn_1 == 8'h0; // @[rawFloatFromFN.scala 50:34]
  wire  wdata_rawIn_isZeroFractIn_1 = wdata_rawIn_fractIn_1 == 23'h0; // @[rawFloatFromFN.scala 51:38]
  wire [4:0] _wdata_rawIn_normDist_T_125 = wdata_rawIn_fractIn_1[1] ? 5'h15 : 5'h16; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_126 = wdata_rawIn_fractIn_1[2] ? 5'h14 : _wdata_rawIn_normDist_T_125; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_127 = wdata_rawIn_fractIn_1[3] ? 5'h13 : _wdata_rawIn_normDist_T_126; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_128 = wdata_rawIn_fractIn_1[4] ? 5'h12 : _wdata_rawIn_normDist_T_127; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_129 = wdata_rawIn_fractIn_1[5] ? 5'h11 : _wdata_rawIn_normDist_T_128; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_130 = wdata_rawIn_fractIn_1[6] ? 5'h10 : _wdata_rawIn_normDist_T_129; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_131 = wdata_rawIn_fractIn_1[7] ? 5'hf : _wdata_rawIn_normDist_T_130; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_132 = wdata_rawIn_fractIn_1[8] ? 5'he : _wdata_rawIn_normDist_T_131; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_133 = wdata_rawIn_fractIn_1[9] ? 5'hd : _wdata_rawIn_normDist_T_132; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_134 = wdata_rawIn_fractIn_1[10] ? 5'hc : _wdata_rawIn_normDist_T_133; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_135 = wdata_rawIn_fractIn_1[11] ? 5'hb : _wdata_rawIn_normDist_T_134; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_136 = wdata_rawIn_fractIn_1[12] ? 5'ha : _wdata_rawIn_normDist_T_135; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_137 = wdata_rawIn_fractIn_1[13] ? 5'h9 : _wdata_rawIn_normDist_T_136; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_138 = wdata_rawIn_fractIn_1[14] ? 5'h8 : _wdata_rawIn_normDist_T_137; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_139 = wdata_rawIn_fractIn_1[15] ? 5'h7 : _wdata_rawIn_normDist_T_138; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_140 = wdata_rawIn_fractIn_1[16] ? 5'h6 : _wdata_rawIn_normDist_T_139; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_141 = wdata_rawIn_fractIn_1[17] ? 5'h5 : _wdata_rawIn_normDist_T_140; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_142 = wdata_rawIn_fractIn_1[18] ? 5'h4 : _wdata_rawIn_normDist_T_141; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_143 = wdata_rawIn_fractIn_1[19] ? 5'h3 : _wdata_rawIn_normDist_T_142; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_144 = wdata_rawIn_fractIn_1[20] ? 5'h2 : _wdata_rawIn_normDist_T_143; // @[Mux.scala 47:70]
  wire [4:0] _wdata_rawIn_normDist_T_145 = wdata_rawIn_fractIn_1[21] ? 5'h1 : _wdata_rawIn_normDist_T_144; // @[Mux.scala 47:70]
  wire [4:0] wdata_rawIn_normDist_1 = wdata_rawIn_fractIn_1[22] ? 5'h0 : _wdata_rawIn_normDist_T_145; // @[Mux.scala 47:70]
  wire [53:0] _GEN_1 = {{31'd0}, wdata_rawIn_fractIn_1}; // @[rawFloatFromFN.scala 54:36]
  wire [53:0] _wdata_rawIn_subnormFract_T_2 = _GEN_1 << wdata_rawIn_normDist_1; // @[rawFloatFromFN.scala 54:36]
  wire [22:0] wdata_rawIn_subnormFract_1 = {_wdata_rawIn_subnormFract_T_2[21:0], 1'h0}; // @[rawFloatFromFN.scala 54:64]
  wire [8:0] _GEN_172 = {{4'd0}, wdata_rawIn_normDist_1}; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _wdata_rawIn_adjustedExp_T_5 = _GEN_172 ^ 9'h1ff; // @[rawFloatFromFN.scala 57:26]
  wire [8:0] _wdata_rawIn_adjustedExp_T_6 = wdata_rawIn_isZeroExpIn_1 ? _wdata_rawIn_adjustedExp_T_5 : {{1'd0},
    wdata_rawIn_expIn_1}; // @[rawFloatFromFN.scala 56:16]
  wire [1:0] _wdata_rawIn_adjustedExp_T_7 = wdata_rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 60:27]
  wire [7:0] _GEN_173 = {{6'd0}, _wdata_rawIn_adjustedExp_T_7}; // @[rawFloatFromFN.scala 60:22]
  wire [7:0] _wdata_rawIn_adjustedExp_T_8 = 8'h80 | _GEN_173; // @[rawFloatFromFN.scala 60:22]
  wire [8:0] _GEN_174 = {{1'd0}, _wdata_rawIn_adjustedExp_T_8}; // @[rawFloatFromFN.scala 59:15]
  wire [8:0] wdata_rawIn_adjustedExp_1 = _wdata_rawIn_adjustedExp_T_6 + _GEN_174; // @[rawFloatFromFN.scala 59:15]
  wire  wdata_rawIn_isZero_1 = wdata_rawIn_isZeroExpIn_1 & wdata_rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 62:34]
  wire  wdata_rawIn_isSpecial_1 = wdata_rawIn_adjustedExp_1[8:7] == 2'h3; // @[rawFloatFromFN.scala 63:62]
  wire  wdata_rawIn_1_isNaN = wdata_rawIn_isSpecial_1 & ~wdata_rawIn_isZeroFractIn_1; // @[rawFloatFromFN.scala 66:33]
  wire [9:0] wdata_rawIn_1_sExp = {1'b0,$signed(wdata_rawIn_adjustedExp_1)}; // @[rawFloatFromFN.scala 70:48]
  wire  _wdata_rawIn_out_sig_T_3 = ~wdata_rawIn_isZero_1; // @[rawFloatFromFN.scala 72:29]
  wire [22:0] _wdata_rawIn_out_sig_T_4 = wdata_rawIn_isZeroExpIn_1 ? wdata_rawIn_subnormFract_1 : wdata_rawIn_fractIn_1; // @[rawFloatFromFN.scala 72:42]
  wire [24:0] wdata_rawIn_1_sig = {1'h0,_wdata_rawIn_out_sig_T_3,_wdata_rawIn_out_sig_T_4}; // @[Cat.scala 31:58]
  wire [2:0] _wdata_T_11 = wdata_rawIn_isZero_1 ? 3'h0 : wdata_rawIn_1_sExp[8:6]; // @[recFNFromFN.scala 48:16]
  wire [2:0] _GEN_175 = {{2'd0}, wdata_rawIn_1_isNaN}; // @[recFNFromFN.scala 48:79]
  wire [2:0] _wdata_T_13 = _wdata_T_11 | _GEN_175; // @[recFNFromFN.scala 48:79]
  wire [32:0] _wdata_T_16 = {wdata_rawIn_sign_1,_wdata_T_13,wdata_rawIn_1_sExp[5:0],wdata_rawIn_1_sig[22:0]}; // @[Cat.scala 31:58]
  wire  _wdata_swizzledNaN_T_2 = &_wdata_T_9[51:32]; // @[FPU.scala 333:42]
  wire [64:0] wdata_swizzledNaN = {_wdata_T_9[64:61],_wdata_swizzledNaN_T_2,_wdata_T_9[59:53],_wdata_T_16[31],_wdata_T_9
    [51:32],_wdata_T_16[32],_wdata_T_16[30:0]}; // @[Cat.scala 31:58]
  wire  _wdata_T_18 = &_wdata_T_9[63:61]; // @[FPU.scala 244:56]
  wire [64:0] wdata = _wdata_T_18 ? wdata_swizzledNaN : _wdata_T_9; // @[FPU.scala 339:8]
  wire  _curOK_T_1 = &wdata[63:61]; // @[FPU.scala 244:56]
  wire  curOK = ~_curOK_T_1 | wdata[60] == &wdata[51:32]; // @[FPU.scala 380:31]
  wire  _T_2 = ~reset; // @[FPU.scala 799:11]
  wire  _T_4 = ~fp_decoder_io_sigs_swap12; // @[FPU.scala 810:13]
  wire [4:0] _GEN_59 = ~fp_decoder_io_sigs_swap12 ? io_inst[19:15] : ex_ra_0; // @[FPU.scala 810:30 748:31 810:41]
  wire [4:0] _GEN_60 = fp_decoder_io_sigs_swap12 ? io_inst[19:15] : ex_ra_1; // @[FPU.scala 811:29 748:31 811:40]
  wire [4:0] _GEN_61 = fp_decoder_io_sigs_ren1 ? _GEN_59 : ex_ra_0; // @[FPU.scala 809:25 748:31]
  wire [4:0] _GEN_62 = fp_decoder_io_sigs_ren1 ? _GEN_60 : ex_ra_1; // @[FPU.scala 809:25 748:31]
  wire  _sfma_io_in_valid_T = ex_reg_valid & ex_reg_ctrl_fma; // @[FPU.scala 844:33]
  wire  _sfma_io_in_valid_T_1 = ex_reg_ctrl_typeTagOut == 2'h0; // @[FPU.scala 844:70]
  wire [32:0] sfma_io_in_bits_req_in1_floats_0 = {regfile_ex_rs_0_data[31],regfile_ex_rs_0_data[52],regfile_ex_rs_0_data
    [30:0]}; // @[Cat.scala 31:58]
  wire  sfma_io_in_bits_req_in1_isbox = &regfile_ex_rs_0_data[64:60]; // @[FPU.scala 327:84]
  wire [32:0] _sfma_io_in_bits_req_in1_T = sfma_io_in_bits_req_in1_isbox ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire [32:0] _sfma_io_in_bits_req_in1_T_1 = sfma_io_in_bits_req_in1_floats_0 | _sfma_io_in_bits_req_in1_T; // @[FPU.scala 367:26]
  wire [32:0] sfma_io_in_bits_req_in2_floats_0 = {regfile_ex_rs_1_data[31],regfile_ex_rs_1_data[52],regfile_ex_rs_1_data
    [30:0]}; // @[Cat.scala 31:58]
  wire  sfma_io_in_bits_req_in2_isbox = &regfile_ex_rs_1_data[64:60]; // @[FPU.scala 327:84]
  wire [32:0] _sfma_io_in_bits_req_in2_T = sfma_io_in_bits_req_in2_isbox ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire [32:0] _sfma_io_in_bits_req_in2_T_1 = sfma_io_in_bits_req_in2_floats_0 | _sfma_io_in_bits_req_in2_T; // @[FPU.scala 367:26]
  wire [32:0] sfma_io_in_bits_req_in3_floats_0 = {regfile_ex_rs_2_data[31],regfile_ex_rs_2_data[52],regfile_ex_rs_2_data
    [30:0]}; // @[Cat.scala 31:58]
  wire  sfma_io_in_bits_req_in3_isbox = &regfile_ex_rs_2_data[64:60]; // @[FPU.scala 327:84]
  wire [32:0] _sfma_io_in_bits_req_in3_T = sfma_io_in_bits_req_in3_isbox ? 33'h0 : 33'he0400000; // @[FPU.scala 367:31]
  wire [32:0] _sfma_io_in_bits_req_in3_T_1 = sfma_io_in_bits_req_in3_floats_0 | _sfma_io_in_bits_req_in3_T; // @[FPU.scala 367:26]
  wire  _sfma_io_in_bits_req_fmaCmd_T_3 = ~ex_reg_ctrl_ren3 & ex_reg_inst[27]; // @[FPU.scala 832:53]
  wire [1:0] _GEN_176 = {{1'd0}, _sfma_io_in_bits_req_fmaCmd_T_3}; // @[FPU.scala 832:36]
  wire  fpiu_io_in_bits_req_in1_sign = sfma_io_in_bits_req_in1_floats_0[32]; // @[FPU.scala 269:17]
  wire [22:0] fpiu_io_in_bits_req_in1_fractIn = sfma_io_in_bits_req_in1_floats_0[22:0]; // @[FPU.scala 270:20]
  wire [8:0] fpiu_io_in_bits_req_in1_expIn = sfma_io_in_bits_req_in1_floats_0[31:23]; // @[FPU.scala 271:18]
  wire [75:0] _fpiu_io_in_bits_req_in1_fractOut_T = {fpiu_io_in_bits_req_in1_fractIn, 53'h0}; // @[FPU.scala 272:28]
  wire [51:0] fpiu_io_in_bits_req_in1_fractOut = _fpiu_io_in_bits_req_in1_fractOut_T[75:24]; // @[FPU.scala 272:38]
  wire [2:0] fpiu_io_in_bits_req_in1_expOut_expCode = fpiu_io_in_bits_req_in1_expIn[8:6]; // @[FPU.scala 274:26]
  wire [11:0] _GEN_177 = {{3'd0}, fpiu_io_in_bits_req_in1_expIn}; // @[FPU.scala 275:31]
  wire [11:0] _fpiu_io_in_bits_req_in1_expOut_commonCase_T_1 = _GEN_177 + 12'h800; // @[FPU.scala 275:31]
  wire [11:0] fpiu_io_in_bits_req_in1_expOut_commonCase = _fpiu_io_in_bits_req_in1_expOut_commonCase_T_1 - 12'h100; // @[FPU.scala 275:48]
  wire [11:0] _fpiu_io_in_bits_req_in1_expOut_T_4 = {fpiu_io_in_bits_req_in1_expOut_expCode,
    fpiu_io_in_bits_req_in1_expOut_commonCase[8:0]}; // @[Cat.scala 31:58]
  wire [11:0] fpiu_io_in_bits_req_in1_expOut = fpiu_io_in_bits_req_in1_expOut_expCode == 3'h0 |
    fpiu_io_in_bits_req_in1_expOut_expCode >= 3'h6 ? _fpiu_io_in_bits_req_in1_expOut_T_4 :
    fpiu_io_in_bits_req_in1_expOut_commonCase; // @[FPU.scala 276:10]
  wire [64:0] fpiu_io_in_bits_req_in1_floats_0 = {fpiu_io_in_bits_req_in1_sign,fpiu_io_in_bits_req_in1_expOut,
    fpiu_io_in_bits_req_in1_fractOut}; // @[Cat.scala 31:58]
  wire  fpiu_io_in_bits_req_in1_truncIdx = ex_reg_ctrl_typeTagIn[0]; // @[package.scala 31:49]
  wire  _fpiu_io_in_bits_req_in1_T_1 = fpiu_io_in_bits_req_in1_truncIdx | sfma_io_in_bits_req_in1_isbox; // @[package.scala 32:76]
  wire [64:0] _fpiu_io_in_bits_req_in1_T_3 = fpiu_io_in_bits_req_in1_truncIdx ? regfile_ex_rs_0_data :
    fpiu_io_in_bits_req_in1_floats_0; // @[package.scala 32:76]
  wire  fpiu_io_in_bits_req_in2_sign = sfma_io_in_bits_req_in2_floats_0[32]; // @[FPU.scala 269:17]
  wire [22:0] fpiu_io_in_bits_req_in2_fractIn = sfma_io_in_bits_req_in2_floats_0[22:0]; // @[FPU.scala 270:20]
  wire [8:0] fpiu_io_in_bits_req_in2_expIn = sfma_io_in_bits_req_in2_floats_0[31:23]; // @[FPU.scala 271:18]
  wire [75:0] _fpiu_io_in_bits_req_in2_fractOut_T = {fpiu_io_in_bits_req_in2_fractIn, 53'h0}; // @[FPU.scala 272:28]
  wire [51:0] fpiu_io_in_bits_req_in2_fractOut = _fpiu_io_in_bits_req_in2_fractOut_T[75:24]; // @[FPU.scala 272:38]
  wire [2:0] fpiu_io_in_bits_req_in2_expOut_expCode = fpiu_io_in_bits_req_in2_expIn[8:6]; // @[FPU.scala 274:26]
  wire [11:0] _GEN_178 = {{3'd0}, fpiu_io_in_bits_req_in2_expIn}; // @[FPU.scala 275:31]
  wire [11:0] _fpiu_io_in_bits_req_in2_expOut_commonCase_T_1 = _GEN_178 + 12'h800; // @[FPU.scala 275:31]
  wire [11:0] fpiu_io_in_bits_req_in2_expOut_commonCase = _fpiu_io_in_bits_req_in2_expOut_commonCase_T_1 - 12'h100; // @[FPU.scala 275:48]
  wire [11:0] _fpiu_io_in_bits_req_in2_expOut_T_4 = {fpiu_io_in_bits_req_in2_expOut_expCode,
    fpiu_io_in_bits_req_in2_expOut_commonCase[8:0]}; // @[Cat.scala 31:58]
  wire [11:0] fpiu_io_in_bits_req_in2_expOut = fpiu_io_in_bits_req_in2_expOut_expCode == 3'h0 |
    fpiu_io_in_bits_req_in2_expOut_expCode >= 3'h6 ? _fpiu_io_in_bits_req_in2_expOut_T_4 :
    fpiu_io_in_bits_req_in2_expOut_commonCase; // @[FPU.scala 276:10]
  wire [64:0] fpiu_io_in_bits_req_in2_floats_0 = {fpiu_io_in_bits_req_in2_sign,fpiu_io_in_bits_req_in2_expOut,
    fpiu_io_in_bits_req_in2_fractOut}; // @[Cat.scala 31:58]
  wire  _fpiu_io_in_bits_req_in2_T_1 = fpiu_io_in_bits_req_in1_truncIdx | sfma_io_in_bits_req_in2_isbox; // @[package.scala 32:76]
  wire [64:0] _fpiu_io_in_bits_req_in2_T_3 = fpiu_io_in_bits_req_in1_truncIdx ? regfile_ex_rs_1_data :
    fpiu_io_in_bits_req_in2_floats_0; // @[package.scala 32:76]
  wire [64:0] _ifpu_io_in_bits_in1_T = {{1'd0}, io_fromint_data}; // @[FPU.scala 860:29]
  reg [4:0] divSqrt_waddr; // @[FPU.scala 869:26]
  wire  _dfma_io_in_valid_T_1 = ex_reg_ctrl_typeTagOut == 2'h1; // @[FPU.scala 882:78]
  wire  _memLatencyMask_T_2 = mem_ctrl_typeTagOut == 2'h0; // @[FPU.scala 879:72]
  wire  _memLatencyMask_T_3 = mem_ctrl_fma & mem_ctrl_typeTagOut == 2'h0; // @[FPU.scala 879:56]
  wire [1:0] _memLatencyMask_T_4 = _memLatencyMask_T_3 ? 2'h2 : 2'h0; // @[FPU.scala 894:23]
  wire  _memLatencyMask_T_5 = mem_ctrl_typeTagOut == 2'h1; // @[FPU.scala 884:78]
  wire  _memLatencyMask_T_6 = mem_ctrl_fma & mem_ctrl_typeTagOut == 2'h1; // @[FPU.scala 884:62]
  wire [2:0] _memLatencyMask_T_7 = _memLatencyMask_T_6 ? 3'h4 : 3'h0; // @[FPU.scala 894:23]
  wire  _memLatencyMask_T_8 = mem_ctrl_fastpipe | mem_ctrl_fromint; // @[FPU.scala 894:78]
  wire [1:0] _GEN_185 = {{1'd0}, _memLatencyMask_T_8}; // @[FPU.scala 894:78]
  wire [1:0] _memLatencyMask_T_9 = _GEN_185 | _memLatencyMask_T_4; // @[FPU.scala 894:78]
  wire [2:0] _GEN_186 = {{1'd0}, _memLatencyMask_T_9}; // @[FPU.scala 894:78]
  wire [2:0] memLatencyMask = _GEN_186 | _memLatencyMask_T_7; // @[FPU.scala 894:78]
  reg [2:0] wen; // @[FPU.scala 907:16]
  reg [4:0] wbInfo_0_rd; // @[FPU.scala 908:19]
  reg  wbInfo_0_typeTag; // @[FPU.scala 908:19]
  reg [1:0] wbInfo_0_pipeid; // @[FPU.scala 908:19]
  reg [4:0] wbInfo_1_rd; // @[FPU.scala 908:19]
  reg  wbInfo_1_typeTag; // @[FPU.scala 908:19]
  reg [1:0] wbInfo_1_pipeid; // @[FPU.scala 908:19]
  reg [4:0] wbInfo_2_rd; // @[FPU.scala 908:19]
  reg  wbInfo_2_typeTag; // @[FPU.scala 908:19]
  reg [1:0] wbInfo_2_pipeid; // @[FPU.scala 908:19]
  wire  mem_wen = mem_reg_valid & (mem_ctrl_fma | mem_ctrl_fastpipe | mem_ctrl_fromint); // @[FPU.scala 909:31]
  wire [1:0] _write_port_busy_T = ex_reg_ctrl_fastpipe ? 2'h2 : 2'h0; // @[FPU.scala 894:23]
  wire [1:0] _write_port_busy_T_1 = ex_reg_ctrl_fromint ? 2'h2 : 2'h0; // @[FPU.scala 894:23]
  wire  _write_port_busy_T_3 = ex_reg_ctrl_fma & _sfma_io_in_valid_T_1; // @[FPU.scala 879:56]
  wire [2:0] _write_port_busy_T_4 = _write_port_busy_T_3 ? 3'h4 : 3'h0; // @[FPU.scala 894:23]
  wire  _write_port_busy_T_6 = ex_reg_ctrl_fma & _dfma_io_in_valid_T_1; // @[FPU.scala 884:62]
  wire [3:0] _write_port_busy_T_7 = _write_port_busy_T_6 ? 4'h8 : 4'h0; // @[FPU.scala 894:23]
  wire [1:0] _write_port_busy_T_8 = _write_port_busy_T | _write_port_busy_T_1; // @[FPU.scala 894:78]
  wire [2:0] _GEN_187 = {{1'd0}, _write_port_busy_T_8}; // @[FPU.scala 894:78]
  wire [2:0] _write_port_busy_T_9 = _GEN_187 | _write_port_busy_T_4; // @[FPU.scala 894:78]
  wire [3:0] _GEN_188 = {{1'd0}, _write_port_busy_T_9}; // @[FPU.scala 894:78]
  wire [3:0] _write_port_busy_T_10 = _GEN_188 | _write_port_busy_T_7; // @[FPU.scala 894:78]
  wire [3:0] _GEN_189 = {{1'd0}, memLatencyMask}; // @[FPU.scala 910:62]
  wire [3:0] _write_port_busy_T_11 = _GEN_189 & _write_port_busy_T_10; // @[FPU.scala 910:62]
  wire [2:0] _write_port_busy_T_14 = ex_reg_ctrl_fastpipe ? 3'h4 : 3'h0; // @[FPU.scala 894:23]
  wire [2:0] _write_port_busy_T_15 = ex_reg_ctrl_fromint ? 3'h4 : 3'h0; // @[FPU.scala 894:23]
  wire [3:0] _write_port_busy_T_18 = _write_port_busy_T_3 ? 4'h8 : 4'h0; // @[FPU.scala 894:23]
  wire [4:0] _write_port_busy_T_21 = _write_port_busy_T_6 ? 5'h10 : 5'h0; // @[FPU.scala 894:23]
  wire [2:0] _write_port_busy_T_22 = _write_port_busy_T_14 | _write_port_busy_T_15; // @[FPU.scala 894:78]
  wire [3:0] _GEN_190 = {{1'd0}, _write_port_busy_T_22}; // @[FPU.scala 894:78]
  wire [3:0] _write_port_busy_T_23 = _GEN_190 | _write_port_busy_T_18; // @[FPU.scala 894:78]
  wire [4:0] _GEN_191 = {{1'd0}, _write_port_busy_T_23}; // @[FPU.scala 894:78]
  wire [4:0] _write_port_busy_T_24 = _GEN_191 | _write_port_busy_T_21; // @[FPU.scala 894:78]
  wire [4:0] _GEN_192 = {{2'd0}, wen}; // @[FPU.scala 910:101]
  wire [4:0] _write_port_busy_T_25 = _GEN_192 & _write_port_busy_T_24; // @[FPU.scala 910:101]
  wire  _write_port_busy_T_27 = mem_wen & |_write_port_busy_T_11 | |_write_port_busy_T_25; // @[FPU.scala 910:93]
  reg  write_port_busy; // @[Reg.scala 16:16]
  wire [4:0] _GEN_113 = wen[1] ? wbInfo_1_rd : wbInfo_0_rd; // @[FPU.scala 908:19 914:{21,33}]
  wire  _GEN_114 = wen[1] ? wbInfo_1_typeTag : wbInfo_0_typeTag; // @[FPU.scala 908:19 914:{21,33}]
  wire [1:0] _GEN_116 = wen[1] ? wbInfo_1_pipeid : wbInfo_0_pipeid; // @[FPU.scala 908:19 914:{21,33}]
  wire [4:0] _GEN_117 = wen[2] ? wbInfo_2_rd : wbInfo_1_rd; // @[FPU.scala 908:19 914:{21,33}]
  wire  _GEN_118 = wen[2] ? wbInfo_2_typeTag : wbInfo_1_typeTag; // @[FPU.scala 908:19 914:{21,33}]
  wire [1:0] _GEN_120 = wen[2] ? wbInfo_2_pipeid : wbInfo_1_pipeid; // @[FPU.scala 908:19 914:{21,33}]
  wire [2:0] _GEN_193 = {{1'd0}, wen[2:1]}; // @[FPU.scala 919:23]
  wire [2:0] _wen_T_2 = _GEN_193 | memLatencyMask; // @[FPU.scala 919:23]
  wire [1:0] _wbInfo_0_pipeid_T_7 = _memLatencyMask_T_6 ? 2'h3 : 2'h0; // @[FPU.scala 896:63]
  wire [1:0] _GEN_194 = {{1'd0}, mem_ctrl_fromint}; // @[FPU.scala 896:108]
  wire [1:0] _wbInfo_0_pipeid_T_9 = _GEN_194 | _memLatencyMask_T_4; // @[FPU.scala 896:108]
  wire [1:0] _wbInfo_0_pipeid_T_10 = _wbInfo_0_pipeid_T_9 | _wbInfo_0_pipeid_T_7; // @[FPU.scala 896:108]
  wire [1:0] _GEN_123 = ~write_port_busy & memLatencyMask[0] ? mem_ctrl_typeTagOut : {{1'd0}, _GEN_114}; // @[FPU.scala 922:52 924:27]
  wire [1:0] _GEN_127 = ~write_port_busy & memLatencyMask[1] ? mem_ctrl_typeTagOut : {{1'd0}, _GEN_118}; // @[FPU.scala 922:52 924:27]
  wire [1:0] _GEN_131 = ~write_port_busy & memLatencyMask[2] ? mem_ctrl_typeTagOut : {{1'd0}, wbInfo_2_typeTag}; // @[FPU.scala 908:19 922:52 924:27]
  wire [1:0] _GEN_136 = mem_wen ? _GEN_123 : {{1'd0}, _GEN_114}; // @[FPU.scala 917:18]
  wire [1:0] _GEN_140 = mem_wen ? _GEN_127 : {{1'd0}, _GEN_118}; // @[FPU.scala 917:18]
  wire [1:0] _GEN_144 = mem_wen ? _GEN_131 : {{1'd0}, wbInfo_2_typeTag}; // @[FPU.scala 917:18 908:19]
  wire  divSqrt_typeTag = divSqrt_1_io_outValid_div | divSqrt_1_io_outValid_sqrt; // @[FPU.scala 994:37]
  reg  divSqrt_killed; // @[FPU.scala 973:33]
  wire  divSqrt_wen = divSqrt_typeTag ? ~divSqrt_killed : (divSqrt_io_outValid_div | divSqrt_io_outValid_sqrt) & ~
    divSqrt_killed; // @[FPU.scala 994:66 995:21]
  wire  wtypeTag = divSqrt_wen ? divSqrt_typeTag : wbInfo_0_typeTag; // @[FPU.scala 932:21]
  wire [64:0] _wdata_T_20 = wbInfo_0_pipeid == 2'h1 ? ifpu_io_out_bits_data : fpmu_io_out_bits_data; // @[package.scala 32:76]
  wire [64:0] _wdata_T_22 = wbInfo_0_pipeid == 2'h2 ? sfma_io_out_bits_data : _wdata_T_20; // @[package.scala 32:76]
  wire  _wdata_T_23 = wbInfo_0_pipeid == 2'h3; // @[package.scala 32:86]
  wire [64:0] _wdata_T_24 = wbInfo_0_pipeid == 2'h3 ? dfma_io_out_bits_data : _wdata_T_22; // @[package.scala 32:76]
  wire  _divSqrt_wdata_T_1 = &divSqrt_1_io_out[63:61]; // @[FPU.scala 244:56]
  wire [64:0] divSqrt_wdata_maskedNaN = divSqrt_1_io_out & 65'h1efefffffffffffff; // @[FPU.scala 408:25]
  wire [64:0] _divSqrt_wdata_T_2 = _divSqrt_wdata_T_1 ? divSqrt_wdata_maskedNaN : divSqrt_1_io_out; // @[FPU.scala 409:10]
  wire [32:0] _GEN_159 = divSqrt_io_out; // @[FPU.scala 994:66 996:23]
  wire [64:0] divSqrt_wdata = divSqrt_typeTag ? _divSqrt_wdata_T_2 : {{32'd0}, _GEN_159}; // @[FPU.scala 994:66 996:23]
  wire [64:0] _wdata_T_25 = divSqrt_wen ? divSqrt_wdata : _wdata_T_24; // @[FPU.scala 933:22]
  wire [64:0] wdata_opts_bigger_swizzledNaN = {5'h1f,7'h7f,_wdata_T_25[31],20'hfffff,_wdata_T_25[32],_wdata_T_25[30:0]}; // @[Cat.scala 31:58]
  wire [64:0] wdata_1 = wtypeTag ? _wdata_T_25 : wdata_opts_bigger_swizzledNaN; // @[package.scala 32:76]
  wire [4:0] _wexc_T_1 = wbInfo_0_pipeid == 2'h1 ? ifpu_io_out_bits_exc : fpmu_io_out_bits_exc; // @[package.scala 32:76]
  wire [4:0] _wexc_T_3 = wbInfo_0_pipeid == 2'h2 ? sfma_io_out_bits_exc : _wexc_T_1; // @[package.scala 32:76]
  wire [4:0] wexc = wbInfo_0_pipeid == 2'h3 ? dfma_io_out_bits_exc : _wexc_T_3; // @[package.scala 32:76]
  wire  frfWriteBundle_1_wrenf = wen[0] | divSqrt_wen; // @[FPU.scala 935:35]
  wire  _curOK_T_8 = &wdata_1[63:61]; // @[FPU.scala 244:56]
  wire  curOK_1 = ~_curOK_T_8 | wdata_1[60] == &wdata_1[51:32]; // @[FPU.scala 380:31]
  wire  wb_toint_valid = wb_reg_valid & wb_ctrl_toint; // @[FPU.scala 951:37]
  reg [4:0] wb_toint_exc; // @[Reg.scala 16:16]
  wire [4:0] _io_fcsr_flags_bits_T = wb_toint_valid ? wb_toint_exc : 5'h0; // @[FPU.scala 955:8]
  wire [4:0] _GEN_160 = divSqrt_io_exceptionFlags; // @[FPU.scala 994:66 997:23]
  wire [4:0] divSqrt_flags = divSqrt_typeTag ? divSqrt_1_io_exceptionFlags : _GEN_160; // @[FPU.scala 994:66 997:23]
  wire [4:0] _io_fcsr_flags_bits_T_1 = divSqrt_wen ? divSqrt_flags : 5'h0; // @[FPU.scala 956:8]
  wire [4:0] _io_fcsr_flags_bits_T_2 = _io_fcsr_flags_bits_T | _io_fcsr_flags_bits_T_1; // @[FPU.scala 955:48]
  wire [4:0] _io_fcsr_flags_bits_T_4 = wen[0] ? wexc : 5'h0; // @[FPU.scala 957:8]
  wire  _divSqrt_write_port_busy_T = mem_ctrl_div | mem_ctrl_sqrt; // @[FPU.scala 959:47]
  wire  _divSqrt_write_port_busy_T_1 = |wen; // @[FPU.scala 959:72]
  wire  divSqrt_write_port_busy = (mem_ctrl_div | mem_ctrl_sqrt) & |wen; // @[FPU.scala 959:65]
  wire  _GEN_162 = ~divSqrt_1_io_inReady | ~divSqrt_io_inReady; // @[FPU.scala 992:{34,53}]
  wire  divSqrt_inFlight = divSqrt_killed ? 1'h0 : _GEN_162; // @[FPU.scala 1002:{27,46}]
  reg  io_sboard_set_REG; // @[FPU.scala 964:55]
  wire  _io_illegal_rm_T_1 = io_inst[14:12] == 3'h5; // @[package.scala 15:47]
  wire  _io_illegal_rm_T_2 = io_inst[14:12] == 3'h6; // @[package.scala 15:47]
  wire  _io_illegal_rm_T_3 = _io_illegal_rm_T_1 | _io_illegal_rm_T_2; // @[package.scala 72:59]
  wire  divSqrt_inValid = mem_reg_valid & _divSqrt_write_port_busy_T & ~divSqrt_inFlight; // @[FPU.scala 972:76]
  wire  divSqrt_io_a_sign = fpiu_io_out_bits_in_in1[64]; // @[FPU.scala 269:17]
  wire [51:0] divSqrt_io_a_fractIn = fpiu_io_out_bits_in_in1[51:0]; // @[FPU.scala 270:20]
  wire [11:0] divSqrt_io_a_expIn = fpiu_io_out_bits_in_in1[63:52]; // @[FPU.scala 271:18]
  wire [75:0] _divSqrt_io_a_fractOut_T = {divSqrt_io_a_fractIn, 24'h0}; // @[FPU.scala 272:28]
  wire [22:0] divSqrt_io_a_fractOut = _divSqrt_io_a_fractOut_T[75:53]; // @[FPU.scala 272:38]
  wire [2:0] divSqrt_io_a_expOut_expCode = divSqrt_io_a_expIn[11:9]; // @[FPU.scala 274:26]
  wire [11:0] _divSqrt_io_a_expOut_commonCase_T_1 = divSqrt_io_a_expIn + 12'h100; // @[FPU.scala 275:31]
  wire [11:0] divSqrt_io_a_expOut_commonCase = _divSqrt_io_a_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 275:48]
  wire [8:0] _divSqrt_io_a_expOut_T_4 = {divSqrt_io_a_expOut_expCode,divSqrt_io_a_expOut_commonCase[5:0]}; // @[Cat.scala 31:58]
  wire [8:0] divSqrt_io_a_expOut = divSqrt_io_a_expOut_expCode == 3'h0 | divSqrt_io_a_expOut_expCode >= 3'h6 ?
    _divSqrt_io_a_expOut_T_4 : divSqrt_io_a_expOut_commonCase[8:0]; // @[FPU.scala 276:10]
  wire [9:0] divSqrt_io_a_hi = {divSqrt_io_a_sign,divSqrt_io_a_expOut}; // @[Cat.scala 31:58]
  wire  divSqrt_io_b_sign = fpiu_io_out_bits_in_in2[64]; // @[FPU.scala 269:17]
  wire [51:0] divSqrt_io_b_fractIn = fpiu_io_out_bits_in_in2[51:0]; // @[FPU.scala 270:20]
  wire [11:0] divSqrt_io_b_expIn = fpiu_io_out_bits_in_in2[63:52]; // @[FPU.scala 271:18]
  wire [75:0] _divSqrt_io_b_fractOut_T = {divSqrt_io_b_fractIn, 24'h0}; // @[FPU.scala 272:28]
  wire [22:0] divSqrt_io_b_fractOut = _divSqrt_io_b_fractOut_T[75:53]; // @[FPU.scala 272:38]
  wire [2:0] divSqrt_io_b_expOut_expCode = divSqrt_io_b_expIn[11:9]; // @[FPU.scala 274:26]
  wire [11:0] _divSqrt_io_b_expOut_commonCase_T_1 = divSqrt_io_b_expIn + 12'h100; // @[FPU.scala 275:31]
  wire [11:0] divSqrt_io_b_expOut_commonCase = _divSqrt_io_b_expOut_commonCase_T_1 - 12'h800; // @[FPU.scala 275:48]
  wire [8:0] _divSqrt_io_b_expOut_T_4 = {divSqrt_io_b_expOut_expCode,divSqrt_io_b_expOut_commonCase[5:0]}; // @[Cat.scala 31:58]
  wire [8:0] divSqrt_io_b_expOut = divSqrt_io_b_expOut_expCode == 3'h0 | divSqrt_io_b_expOut_expCode >= 3'h6 ?
    _divSqrt_io_b_expOut_T_4 : divSqrt_io_b_expOut_commonCase[8:0]; // @[FPU.scala 276:10]
  wire [9:0] divSqrt_io_b_hi = {divSqrt_io_b_sign,divSqrt_io_b_expOut}; // @[Cat.scala 31:58]
  FPUDecoder fp_decoder ( // @[FPU.scala 741:26]
    .io_inst(fp_decoder_io_inst),
    .io_sigs_wen(fp_decoder_io_sigs_wen),
    .io_sigs_ren1(fp_decoder_io_sigs_ren1),
    .io_sigs_ren2(fp_decoder_io_sigs_ren2),
    .io_sigs_ren3(fp_decoder_io_sigs_ren3),
    .io_sigs_swap12(fp_decoder_io_sigs_swap12),
    .io_sigs_swap23(fp_decoder_io_sigs_swap23),
    .io_sigs_typeTagIn(fp_decoder_io_sigs_typeTagIn),
    .io_sigs_typeTagOut(fp_decoder_io_sigs_typeTagOut),
    .io_sigs_fromint(fp_decoder_io_sigs_fromint),
    .io_sigs_toint(fp_decoder_io_sigs_toint),
    .io_sigs_fastpipe(fp_decoder_io_sigs_fastpipe),
    .io_sigs_fma(fp_decoder_io_sigs_fma),
    .io_sigs_div(fp_decoder_io_sigs_div),
    .io_sigs_sqrt(fp_decoder_io_sigs_sqrt),
    .io_sigs_wflags(fp_decoder_io_sigs_wflags)
  );
  FPUFMAPipe sfma ( // @[FPU.scala 843:20]
    .clock(sfma_clock),
    .reset(sfma_reset),
    .io_in_valid(sfma_io_in_valid),
    .io_in_bits_ren3(sfma_io_in_bits_ren3),
    .io_in_bits_swap23(sfma_io_in_bits_swap23),
    .io_in_bits_rm(sfma_io_in_bits_rm),
    .io_in_bits_fmaCmd(sfma_io_in_bits_fmaCmd),
    .io_in_bits_in1(sfma_io_in_bits_in1),
    .io_in_bits_in2(sfma_io_in_bits_in2),
    .io_in_bits_in3(sfma_io_in_bits_in3),
    .io_out_bits_data(sfma_io_out_bits_data),
    .io_out_bits_exc(sfma_io_out_bits_exc)
  );
  FPToInt fpiu ( // @[FPU.scala 847:20]
    .clock(fpiu_clock),
    .io_in_valid(fpiu_io_in_valid),
    .io_in_bits_ren2(fpiu_io_in_bits_ren2),
    .io_in_bits_typeTagIn(fpiu_io_in_bits_typeTagIn),
    .io_in_bits_typeTagOut(fpiu_io_in_bits_typeTagOut),
    .io_in_bits_wflags(fpiu_io_in_bits_wflags),
    .io_in_bits_rm(fpiu_io_in_bits_rm),
    .io_in_bits_typ(fpiu_io_in_bits_typ),
    .io_in_bits_fmt(fpiu_io_in_bits_fmt),
    .io_in_bits_in1(fpiu_io_in_bits_in1),
    .io_in_bits_in2(fpiu_io_in_bits_in2),
    .io_out_bits_in_rm(fpiu_io_out_bits_in_rm),
    .io_out_bits_in_in1(fpiu_io_out_bits_in_in1),
    .io_out_bits_in_in2(fpiu_io_out_bits_in_in2),
    .io_out_bits_lt(fpiu_io_out_bits_lt),
    .io_out_bits_store(fpiu_io_out_bits_store),
    .io_out_bits_toint(fpiu_io_out_bits_toint),
    .io_out_bits_exc(fpiu_io_out_bits_exc)
  );
  IntToFP ifpu ( // @[FPU.scala 857:20]
    .clock(ifpu_clock),
    .reset(ifpu_reset),
    .io_in_valid(ifpu_io_in_valid),
    .io_in_bits_typeTagIn(ifpu_io_in_bits_typeTagIn),
    .io_in_bits_wflags(ifpu_io_in_bits_wflags),
    .io_in_bits_rm(ifpu_io_in_bits_rm),
    .io_in_bits_typ(ifpu_io_in_bits_typ),
    .io_in_bits_in1(ifpu_io_in_bits_in1),
    .io_out_bits_data(ifpu_io_out_bits_data),
    .io_out_bits_exc(ifpu_io_out_bits_exc)
  );
  FPToFP fpmu ( // @[FPU.scala 862:20]
    .clock(fpmu_clock),
    .reset(fpmu_reset),
    .io_in_valid(fpmu_io_in_valid),
    .io_in_bits_ren2(fpmu_io_in_bits_ren2),
    .io_in_bits_typeTagOut(fpmu_io_in_bits_typeTagOut),
    .io_in_bits_wflags(fpmu_io_in_bits_wflags),
    .io_in_bits_rm(fpmu_io_in_bits_rm),
    .io_in_bits_in1(fpmu_io_in_bits_in1),
    .io_in_bits_in2(fpmu_io_in_bits_in2),
    .io_out_bits_data(fpmu_io_out_bits_data),
    .io_out_bits_exc(fpmu_io_out_bits_exc),
    .io_lt(fpmu_io_lt)
  );
  FPUFMAPipe_1 dfma ( // @[FPU.scala 881:28]
    .clock(dfma_clock),
    .reset(dfma_reset),
    .io_in_valid(dfma_io_in_valid),
    .io_in_bits_ren3(dfma_io_in_bits_ren3),
    .io_in_bits_swap23(dfma_io_in_bits_swap23),
    .io_in_bits_rm(dfma_io_in_bits_rm),
    .io_in_bits_fmaCmd(dfma_io_in_bits_fmaCmd),
    .io_in_bits_in1(dfma_io_in_bits_in1),
    .io_in_bits_in2(dfma_io_in_bits_in2),
    .io_in_bits_in3(dfma_io_in_bits_in3),
    .io_out_bits_data(dfma_io_out_bits_data),
    .io_out_bits_exc(dfma_io_out_bits_exc)
  );
  DivSqrtRecFN_small divSqrt ( // @[FPU.scala 984:55]
    .clock(divSqrt_clock),
    .reset(divSqrt_reset),
    .io_inReady(divSqrt_io_inReady),
    .io_inValid(divSqrt_io_inValid),
    .io_sqrtOp(divSqrt_io_sqrtOp),
    .io_a(divSqrt_io_a),
    .io_b(divSqrt_io_b),
    .io_roundingMode(divSqrt_io_roundingMode),
    .io_outValid_div(divSqrt_io_outValid_div),
    .io_outValid_sqrt(divSqrt_io_outValid_sqrt),
    .io_out(divSqrt_io_out),
    .io_exceptionFlags(divSqrt_io_exceptionFlags)
  );
  DivSqrtRecFN_small_1 divSqrt_1 ( // @[FPU.scala 984:55]
    .clock(divSqrt_1_clock),
    .reset(divSqrt_1_reset),
    .io_inReady(divSqrt_1_io_inReady),
    .io_inValid(divSqrt_1_io_inValid),
    .io_sqrtOp(divSqrt_1_io_sqrtOp),
    .io_a(divSqrt_1_io_a),
    .io_b(divSqrt_1_io_b),
    .io_roundingMode(divSqrt_1_io_roundingMode),
    .io_outValid_div(divSqrt_1_io_outValid_div),
    .io_outValid_sqrt(divSqrt_1_io_outValid_sqrt),
    .io_out(divSqrt_1_io_out),
    .io_exceptionFlags(divSqrt_1_io_exceptionFlags)
  );
  assign regfile_ex_rs_0_en = 1'h1;
  assign regfile_ex_rs_0_addr = ex_ra_0;
  assign regfile_ex_rs_0_data = regfile[regfile_ex_rs_0_addr]; // @[FPU.scala 795:20]
  assign regfile_ex_rs_1_en = 1'h1;
  assign regfile_ex_rs_1_addr = ex_ra_1;
  assign regfile_ex_rs_1_data = regfile[regfile_ex_rs_1_addr]; // @[FPU.scala 795:20]
  assign regfile_ex_rs_2_en = 1'h1;
  assign regfile_ex_rs_2_addr = ex_ra_2;
  assign regfile_ex_rs_2_data = regfile[regfile_ex_rs_2_addr]; // @[FPU.scala 795:20]
  assign regfile_MPORT_data = _wdata_T_18 ? wdata_swizzledNaN : _wdata_T_9;
  assign regfile_MPORT_addr = load_wb_tag;
  assign regfile_MPORT_mask = 1'h1;
  assign regfile_MPORT_en = load_wb;
  assign regfile_MPORT_1_data = wtypeTag ? _wdata_T_25 : wdata_opts_bigger_swizzledNaN;
  assign regfile_MPORT_1_addr = divSqrt_wen ? divSqrt_waddr : wbInfo_0_rd;
  assign regfile_MPORT_1_mask = 1'h1;
  assign regfile_MPORT_1_en = wen[0] | divSqrt_wen;
  assign io_fcsr_flags_valid = wb_toint_valid | divSqrt_wen | wen[0]; // @[FPU.scala 953:56]
  assign io_fcsr_flags_bits = _io_fcsr_flags_bits_T_2 | _io_fcsr_flags_bits_T_4; // @[FPU.scala 956:46]
  assign io_store_data = fpiu_io_out_bits_store; // @[FPU.scala 850:17]
  assign io_toint_data = fpiu_io_out_bits_toint; // @[FPU.scala 851:17]
  assign io_fcsr_rdy = ~(ex_reg_valid & ex_reg_ctrl_wflags | mem_reg_valid & mem_ctrl_wflags | wb_toint_valid |
    _divSqrt_write_port_busy_T_1 | divSqrt_inFlight); // @[FPU.scala 960:18]
  assign io_nack_mem = write_port_busy | divSqrt_write_port_busy | divSqrt_inFlight; // @[FPU.scala 961:61]
  assign io_illegal_rm = _io_illegal_rm_T_3 | io_inst[14:12] == 3'h7 & io_fcsr_rm >= 3'h5; // @[FPU.scala 969:49]
  assign io_dec_wen = fp_decoder_io_sigs_wen; // @[FPU.scala 962:10]
  assign io_dec_ren1 = fp_decoder_io_sigs_ren1; // @[FPU.scala 962:10]
  assign io_dec_ren2 = fp_decoder_io_sigs_ren2; // @[FPU.scala 962:10]
  assign io_dec_ren3 = fp_decoder_io_sigs_ren3; // @[FPU.scala 962:10]
  assign io_sboard_set = wb_reg_valid & io_sboard_set_REG; // @[FPU.scala 964:49]
  assign io_sboard_clr = divSqrt_wen | wen[0] & _wdata_T_23; // @[FPU.scala 965:49]
  assign io_sboard_clra = divSqrt_wen ? divSqrt_waddr : wbInfo_0_rd; // @[FPU.scala 931:18]
  assign fp_decoder_io_inst = io_inst; // @[FPU.scala 742:22]
  assign sfma_clock = clock;
  assign sfma_reset = reset;
  assign sfma_io_in_valid = ex_reg_valid & ex_reg_ctrl_fma & ex_reg_ctrl_typeTagOut == 2'h0; // @[FPU.scala 844:48]
  assign sfma_io_in_bits_ren3 = ex_reg_ctrl_ren3; // @[FPU.scala 833:24 834:11 825:9]
  assign sfma_io_in_bits_swap23 = ex_reg_ctrl_swap23; // @[FPU.scala 833:24 834:11 825:9]
  assign sfma_io_in_bits_rm = ex_reg_inst[14:12] == 3'h7 ? io_fcsr_rm : ex_reg_inst[14:12]; // @[FPU.scala 820:18]
  assign sfma_io_in_bits_fmaCmd = ex_reg_inst[3:2] | _GEN_176; // @[FPU.scala 832:36]
  assign sfma_io_in_bits_in1 = {{32'd0}, _sfma_io_in_bits_req_in1_T_1}; // @[FPU.scala 833:24 834:11 827:13]
  assign sfma_io_in_bits_in2 = {{32'd0}, _sfma_io_in_bits_req_in2_T_1}; // @[FPU.scala 828:13 833:24]
  assign sfma_io_in_bits_in3 = {{32'd0}, _sfma_io_in_bits_req_in3_T_1}; // @[FPU.scala 829:13 833:24]
  assign fpiu_clock = clock;
  assign fpiu_io_in_valid = ex_reg_valid & (ex_reg_ctrl_toint | ex_reg_ctrl_div | ex_reg_ctrl_sqrt |
    ex_reg_ctrl_fastpipe & ex_reg_ctrl_wflags); // @[FPU.scala 848:33]
  assign fpiu_io_in_bits_ren2 = ex_reg_ctrl_ren2; // @[FPU.scala 833:24 834:11 825:9]
  assign fpiu_io_in_bits_typeTagIn = ex_reg_ctrl_typeTagIn; // @[FPU.scala 833:24 834:11 825:9]
  assign fpiu_io_in_bits_typeTagOut = ex_reg_ctrl_typeTagOut; // @[FPU.scala 833:24 834:11 825:9]
  assign fpiu_io_in_bits_wflags = ex_reg_ctrl_wflags; // @[FPU.scala 833:24 834:11 825:9]
  assign fpiu_io_in_bits_rm = ex_reg_inst[14:12] == 3'h7 ? io_fcsr_rm : ex_reg_inst[14:12]; // @[FPU.scala 820:18]
  assign fpiu_io_in_bits_typ = ex_reg_inst[21:20]; // @[FPU.scala 830:27]
  assign fpiu_io_in_bits_fmt = ex_reg_inst[26:25]; // @[FPU.scala 831:27]
  assign fpiu_io_in_bits_in1 = _fpiu_io_in_bits_req_in1_T_1 ? _fpiu_io_in_bits_req_in1_T_3 : 65'he008000000000000; // @[FPU.scala 364:10]
  assign fpiu_io_in_bits_in2 = _fpiu_io_in_bits_req_in2_T_1 ? _fpiu_io_in_bits_req_in2_T_3 : 65'he008000000000000; // @[FPU.scala 364:10]
  assign ifpu_clock = clock;
  assign ifpu_reset = reset;
  assign ifpu_io_in_valid = ex_reg_valid & ex_reg_ctrl_fromint; // @[FPU.scala 858:33]
  assign ifpu_io_in_bits_typeTagIn = fpiu_io_in_bits_typeTagIn; // @[FPU.scala 859:19]
  assign ifpu_io_in_bits_wflags = fpiu_io_in_bits_wflags; // @[FPU.scala 859:19]
  assign ifpu_io_in_bits_rm = fpiu_io_in_bits_rm; // @[FPU.scala 859:19]
  assign ifpu_io_in_bits_typ = fpiu_io_in_bits_typ; // @[FPU.scala 859:19]
  assign ifpu_io_in_bits_in1 = _ifpu_io_in_bits_in1_T[63:0]; // @[FPU.scala 860:23]
  assign fpmu_clock = clock;
  assign fpmu_reset = reset;
  assign fpmu_io_in_valid = ex_reg_valid & ex_reg_ctrl_fastpipe; // @[FPU.scala 863:33]
  assign fpmu_io_in_bits_ren2 = fpiu_io_in_bits_ren2; // @[FPU.scala 864:19]
  assign fpmu_io_in_bits_typeTagOut = fpiu_io_in_bits_typeTagOut; // @[FPU.scala 864:19]
  assign fpmu_io_in_bits_wflags = fpiu_io_in_bits_wflags; // @[FPU.scala 864:19]
  assign fpmu_io_in_bits_rm = fpiu_io_in_bits_rm; // @[FPU.scala 864:19]
  assign fpmu_io_in_bits_in1 = fpiu_io_in_bits_in1; // @[FPU.scala 864:19]
  assign fpmu_io_in_bits_in2 = fpiu_io_in_bits_in2; // @[FPU.scala 864:19]
  assign fpmu_io_lt = fpiu_io_out_bits_lt; // @[FPU.scala 865:14]
  assign dfma_clock = clock;
  assign dfma_reset = reset;
  assign dfma_io_in_valid = _sfma_io_in_valid_T & ex_reg_ctrl_typeTagOut == 2'h1; // @[FPU.scala 882:56]
  assign dfma_io_in_bits_ren3 = ex_reg_ctrl_ren3; // @[FPU.scala 833:24 834:11 825:9]
  assign dfma_io_in_bits_swap23 = ex_reg_ctrl_swap23; // @[FPU.scala 833:24 834:11 825:9]
  assign dfma_io_in_bits_rm = ex_reg_inst[14:12] == 3'h7 ? io_fcsr_rm : ex_reg_inst[14:12]; // @[FPU.scala 820:18]
  assign dfma_io_in_bits_fmaCmd = ex_reg_inst[3:2] | _GEN_176; // @[FPU.scala 832:36]
  assign dfma_io_in_bits_in1 = regfile_ex_rs_0_data; // @[FPU.scala 367:26]
  assign dfma_io_in_bits_in2 = regfile_ex_rs_1_data; // @[FPU.scala 367:26]
  assign dfma_io_in_bits_in3 = regfile_ex_rs_2_data; // @[FPU.scala 367:26]
  assign divSqrt_clock = clock;
  assign divSqrt_reset = divSqrt_killed;
  assign divSqrt_io_inValid = divSqrt_inValid & _memLatencyMask_T_2; // @[FPU.scala 985:45]
  assign divSqrt_io_sqrtOp = mem_ctrl_sqrt; // @[FPU.scala 986:25]
  assign divSqrt_io_a = {divSqrt_io_a_hi,divSqrt_io_a_fractOut}; // @[Cat.scala 31:58]
  assign divSqrt_io_b = {divSqrt_io_b_hi,divSqrt_io_b_fractOut}; // @[Cat.scala 31:58]
  assign divSqrt_io_roundingMode = fpiu_io_out_bits_in_rm; // @[FPU.scala 989:31]
  assign divSqrt_1_clock = clock;
  assign divSqrt_1_reset = divSqrt_killed;
  assign divSqrt_1_io_inValid = divSqrt_inValid & _memLatencyMask_T_5; // @[FPU.scala 985:45]
  assign divSqrt_1_io_sqrtOp = mem_ctrl_sqrt; // @[FPU.scala 986:25]
  assign divSqrt_1_io_a = fpiu_io_out_bits_in_in1; // @[FPU.scala 987:20]
  assign divSqrt_1_io_b = fpiu_io_out_bits_in_in2; // @[FPU.scala 988:20]
  assign divSqrt_1_io_roundingMode = fpiu_io_out_bits_in_rm; // @[FPU.scala 989:31]
  always @(posedge clock) begin
    if (regfile_MPORT_en & regfile_MPORT_mask) begin
      regfile[regfile_MPORT_addr] <= regfile_MPORT_data; // @[FPU.scala 795:20]
    end
    if (regfile_MPORT_1_en & regfile_MPORT_1_mask) begin
      regfile[regfile_MPORT_1_addr] <= regfile_MPORT_1_data; // @[FPU.scala 795:20]
    end
    if (reset) begin // @[FPU.scala 745:25]
      ex_reg_valid <= 1'h0; // @[FPU.scala 745:25]
    end else begin
      ex_reg_valid <= io_valid; // @[FPU.scala 745:25]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_inst <= io_inst; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_ren2 <= fp_decoder_io_sigs_ren2; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_ren3 <= fp_decoder_io_sigs_ren3; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_swap23 <= fp_decoder_io_sigs_swap23; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_typeTagIn <= fp_decoder_io_sigs_typeTagIn; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_typeTagOut <= fp_decoder_io_sigs_typeTagOut; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_fromint <= fp_decoder_io_sigs_fromint; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_toint <= fp_decoder_io_sigs_toint; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_fastpipe <= fp_decoder_io_sigs_fastpipe; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_fma <= fp_decoder_io_sigs_fma; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_div <= fp_decoder_io_sigs_div; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_sqrt <= fp_decoder_io_sigs_sqrt; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[Reg.scala 17:18]
      ex_reg_ctrl_wflags <= fp_decoder_io_sigs_wflags; // @[Reg.scala 17:22]
    end
    if (io_valid) begin // @[FPU.scala 808:19]
      if (fp_decoder_io_sigs_ren2) begin // @[FPU.scala 813:25]
        if (fp_decoder_io_sigs_swap12) begin // @[FPU.scala 814:29]
          ex_ra_0 <= io_inst[24:20]; // @[FPU.scala 814:40]
        end else begin
          ex_ra_0 <= _GEN_61;
        end
      end else begin
        ex_ra_0 <= _GEN_61;
      end
    end
    if (io_valid) begin // @[FPU.scala 808:19]
      if (fp_decoder_io_sigs_ren2) begin // @[FPU.scala 813:25]
        if (_T_4 & ~fp_decoder_io_sigs_swap23) begin // @[FPU.scala 816:49]
          ex_ra_1 <= io_inst[24:20]; // @[FPU.scala 816:60]
        end else begin
          ex_ra_1 <= _GEN_62;
        end
      end else begin
        ex_ra_1 <= _GEN_62;
      end
    end
    if (io_valid) begin // @[FPU.scala 808:19]
      if (fp_decoder_io_sigs_ren3) begin // @[FPU.scala 818:25]
        ex_ra_2 <= io_inst[31:27]; // @[FPU.scala 818:36]
      end else if (fp_decoder_io_sigs_ren2) begin // @[FPU.scala 813:25]
        if (fp_decoder_io_sigs_swap23) begin // @[FPU.scala 815:29]
          ex_ra_2 <= io_inst[24:20]; // @[FPU.scala 815:40]
        end
      end
    end
    load_wb <= io_dmem_resp_val; // @[FPU.scala 751:20]
    if (io_dmem_resp_val) begin // @[Reg.scala 17:18]
      load_wb_typeTag <= _load_wb_typeTag_T_2; // @[Reg.scala 17:22]
    end
    if (io_dmem_resp_val) begin // @[Reg.scala 17:18]
      load_wb_data <= io_dmem_resp_data; // @[Reg.scala 17:22]
    end
    if (io_dmem_resp_val) begin // @[Reg.scala 17:18]
      load_wb_tag <= io_dmem_resp_tag; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[FPU.scala 762:30]
      mem_reg_valid <= 1'h0; // @[FPU.scala 762:30]
    end else begin
      mem_reg_valid <= ex_reg_valid & ~killx; // @[FPU.scala 768:17]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_reg_inst <= ex_reg_inst; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[FPU.scala 770:25]
      wb_reg_valid <= 1'h0; // @[FPU.scala 770:25]
    end else begin
      wb_reg_valid <= wb_reg_valid_x8; // @[FPU.scala 770:25]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_typeTagOut <= ex_reg_ctrl_typeTagOut; // @[Reg.scala 17:22]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_fromint <= ex_reg_ctrl_fromint; // @[Reg.scala 17:22]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_toint <= ex_reg_ctrl_toint; // @[Reg.scala 17:22]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_fastpipe <= ex_reg_ctrl_fastpipe; // @[Reg.scala 17:22]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_fma <= ex_reg_ctrl_fma; // @[Reg.scala 17:22]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_div <= ex_reg_ctrl_div; // @[Reg.scala 17:22]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_sqrt <= ex_reg_ctrl_sqrt; // @[Reg.scala 17:22]
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      mem_ctrl_wflags <= ex_reg_ctrl_wflags; // @[Reg.scala 17:22]
    end
    if (mem_reg_valid) begin // @[Reg.scala 17:18]
      wb_ctrl_toint <= mem_ctrl_toint; // @[Reg.scala 17:22]
    end
    if (divSqrt_inValid) begin // @[FPU.scala 974:28]
      divSqrt_waddr <= mem_reg_inst[11:7]; // @[FPU.scala 975:21]
    end
    if (reset) begin // @[FPU.scala 907:16]
      wen <= 3'h0; // @[FPU.scala 907:16]
    end else if (mem_wen) begin // @[FPU.scala 917:18]
      if (_wb_reg_valid_x8_T) begin // @[FPU.scala 918:19]
        wen <= _wen_T_2; // @[FPU.scala 919:11]
      end else begin
        wen <= {{1'd0}, wen[2:1]}; // @[FPU.scala 916:7]
      end
    end else begin
      wen <= {{1'd0}, wen[2:1]}; // @[FPU.scala 916:7]
    end
    if (mem_wen) begin // @[FPU.scala 917:18]
      if (~write_port_busy & memLatencyMask[0]) begin // @[FPU.scala 922:52]
        wbInfo_0_rd <= mem_reg_inst[11:7]; // @[FPU.scala 926:22]
      end else begin
        wbInfo_0_rd <= _GEN_113;
      end
    end else begin
      wbInfo_0_rd <= _GEN_113;
    end
    wbInfo_0_typeTag <= _GEN_136[0];
    if (mem_wen) begin // @[FPU.scala 917:18]
      if (~write_port_busy & memLatencyMask[0]) begin // @[FPU.scala 922:52]
        wbInfo_0_pipeid <= _wbInfo_0_pipeid_T_10; // @[FPU.scala 925:26]
      end else begin
        wbInfo_0_pipeid <= _GEN_116;
      end
    end else begin
      wbInfo_0_pipeid <= _GEN_116;
    end
    if (mem_wen) begin // @[FPU.scala 917:18]
      if (~write_port_busy & memLatencyMask[1]) begin // @[FPU.scala 922:52]
        wbInfo_1_rd <= mem_reg_inst[11:7]; // @[FPU.scala 926:22]
      end else begin
        wbInfo_1_rd <= _GEN_117;
      end
    end else begin
      wbInfo_1_rd <= _GEN_117;
    end
    wbInfo_1_typeTag <= _GEN_140[0];
    if (mem_wen) begin // @[FPU.scala 917:18]
      if (~write_port_busy & memLatencyMask[1]) begin // @[FPU.scala 922:52]
        wbInfo_1_pipeid <= _wbInfo_0_pipeid_T_10; // @[FPU.scala 925:26]
      end else begin
        wbInfo_1_pipeid <= _GEN_120;
      end
    end else begin
      wbInfo_1_pipeid <= _GEN_120;
    end
    if (mem_wen) begin // @[FPU.scala 917:18]
      if (~write_port_busy & memLatencyMask[2]) begin // @[FPU.scala 922:52]
        wbInfo_2_rd <= mem_reg_inst[11:7]; // @[FPU.scala 926:22]
      end
    end
    wbInfo_2_typeTag <= _GEN_144[0];
    if (mem_wen) begin // @[FPU.scala 917:18]
      if (~write_port_busy & memLatencyMask[2]) begin // @[FPU.scala 922:52]
        wbInfo_2_pipeid <= _wbInfo_0_pipeid_T_10; // @[FPU.scala 925:26]
      end
    end
    if (ex_reg_valid) begin // @[Reg.scala 17:18]
      write_port_busy <= _write_port_busy_T_27; // @[Reg.scala 17:22]
    end
    divSqrt_killed <= reset | divSqrt_inValid & killm; // @[FPU.scala 973:{33,33,33}]
    if (mem_ctrl_toint) begin // @[Reg.scala 17:18]
      wb_toint_exc <= fpiu_io_out_bits_exc; // @[Reg.scala 17:22]
    end
    io_sboard_set_REG <= _memLatencyMask_T_6 | mem_ctrl_div | mem_ctrl_sqrt; // @[FPU.scala 964:112]
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~curOK & (load_wb & ~reset)) begin
          $fatal; // @[FPU.scala 799:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (load_wb & ~reset & ~curOK) begin
          $fwrite(32'h80000002,"Assertion failed\n    at FPU.scala:799 assert(consistent(wdata))\n"); // @[FPU.scala 799:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~curOK_1 & (frfWriteBundle_1_wrenf & _T_2)) begin
          $fatal; // @[FPU.scala 936:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (frfWriteBundle_1_wrenf & _T_2 & ~curOK_1) begin
          $fwrite(32'h80000002,"Assertion failed\n    at FPU.scala:936 assert(consistent(wdata))\n"); // @[FPU.scala 936:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {3{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_0[64:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ex_reg_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  ex_reg_inst = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  ex_reg_ctrl_ren2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ex_reg_ctrl_ren3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ex_reg_ctrl_swap23 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ex_reg_ctrl_typeTagIn = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  ex_reg_ctrl_typeTagOut = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  ex_reg_ctrl_fromint = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  ex_reg_ctrl_toint = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ex_reg_ctrl_fastpipe = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ex_reg_ctrl_fma = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ex_reg_ctrl_div = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  ex_reg_ctrl_sqrt = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  ex_reg_ctrl_wflags = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  ex_ra_0 = _RAND_15[4:0];
  _RAND_16 = {1{`RANDOM}};
  ex_ra_1 = _RAND_16[4:0];
  _RAND_17 = {1{`RANDOM}};
  ex_ra_2 = _RAND_17[4:0];
  _RAND_18 = {1{`RANDOM}};
  load_wb = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  load_wb_typeTag = _RAND_19[1:0];
  _RAND_20 = {2{`RANDOM}};
  load_wb_data = _RAND_20[63:0];
  _RAND_21 = {1{`RANDOM}};
  load_wb_tag = _RAND_21[4:0];
  _RAND_22 = {1{`RANDOM}};
  mem_reg_valid = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  mem_reg_inst = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  wb_reg_valid = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  mem_ctrl_typeTagOut = _RAND_25[1:0];
  _RAND_26 = {1{`RANDOM}};
  mem_ctrl_fromint = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_ctrl_toint = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  mem_ctrl_fastpipe = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  mem_ctrl_fma = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  mem_ctrl_div = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  mem_ctrl_sqrt = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  mem_ctrl_wflags = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  wb_ctrl_toint = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  divSqrt_waddr = _RAND_34[4:0];
  _RAND_35 = {1{`RANDOM}};
  wen = _RAND_35[2:0];
  _RAND_36 = {1{`RANDOM}};
  wbInfo_0_rd = _RAND_36[4:0];
  _RAND_37 = {1{`RANDOM}};
  wbInfo_0_typeTag = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  wbInfo_0_pipeid = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  wbInfo_1_rd = _RAND_39[4:0];
  _RAND_40 = {1{`RANDOM}};
  wbInfo_1_typeTag = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  wbInfo_1_pipeid = _RAND_41[1:0];
  _RAND_42 = {1{`RANDOM}};
  wbInfo_2_rd = _RAND_42[4:0];
  _RAND_43 = {1{`RANDOM}};
  wbInfo_2_typeTag = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  wbInfo_2_pipeid = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  write_port_busy = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  divSqrt_killed = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  wb_toint_exc = _RAND_47[4:0];
  _RAND_48 = {1{`RANDOM}};
  io_sboard_set_REG = _RAND_48[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
