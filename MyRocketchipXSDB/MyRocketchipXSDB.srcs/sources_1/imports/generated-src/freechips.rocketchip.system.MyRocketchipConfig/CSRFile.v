module CSRFile(
  input         clock,
  input         reset,
  input         io_ungated_clock,
  input         io_interrupts_debug,
  input         io_interrupts_mtip,
  input         io_interrupts_msip,
  input         io_interrupts_meip,
  input         io_interrupts_seip,
  input         io_hartid,
  input  [11:0] io_rw_addr,
  input  [2:0]  io_rw_cmd,
  output [63:0] io_rw_rdata,
  input  [63:0] io_rw_wdata,
  input  [31:0] io_decode_0_inst,
  output        io_decode_0_fp_illegal,
  output        io_decode_0_fp_csr,
  output        io_decode_0_rocc_illegal,
  output        io_decode_0_read_illegal,
  output        io_decode_0_write_illegal,
  output        io_decode_0_write_flush,
  output        io_decode_0_system_illegal,
  output        io_csr_stall,
  output        io_eret,
  output        io_singleStep,
  output        io_status_debug,
  output        io_status_cease,
  output        io_status_wfi,
  output [31:0] io_status_isa,
  output [1:0]  io_status_dprv,
  output        io_status_dv,
  output [1:0]  io_status_prv,
  output        io_status_v,
  output        io_status_sd,
  output [22:0] io_status_zero2,
  output        io_status_mpv,
  output        io_status_gva,
  output        io_status_mbe,
  output        io_status_sbe,
  output [1:0]  io_status_sxl,
  output [1:0]  io_status_uxl,
  output        io_status_sd_rv32,
  output [7:0]  io_status_zero1,
  output        io_status_tsr,
  output        io_status_tw,
  output        io_status_tvm,
  output        io_status_mxr,
  output        io_status_sum,
  output        io_status_mprv,
  output [1:0]  io_status_xs,
  output [1:0]  io_status_fs,
  output [1:0]  io_status_mpp,
  output [1:0]  io_status_vs,
  output        io_status_spp,
  output        io_status_mpie,
  output        io_status_ube,
  output        io_status_spie,
  output        io_status_upie,
  output        io_status_mie,
  output        io_status_hie,
  output        io_status_sie,
  output        io_status_uie,
  output [3:0]  io_ptbr_mode,
  output [43:0] io_ptbr_ppn,
  output [39:0] io_evec,
  input         io_exception,
  input         io_retire,
  input  [63:0] io_cause,
  input  [39:0] io_pc,
  input  [39:0] io_tval,
  input         io_gva,
  output [63:0] io_time,
  output [2:0]  io_fcsr_rm,
  input         io_fcsr_flags_valid,
  input  [4:0]  io_fcsr_flags_bits,
  output        io_interrupt,
  output [63:0] io_interrupt_cause,
  output        io_bp_0_control_action,
  output [1:0]  io_bp_0_control_tmatch,
  output        io_bp_0_control_m,
  output        io_bp_0_control_s,
  output        io_bp_0_control_u,
  output        io_bp_0_control_x,
  output        io_bp_0_control_w,
  output        io_bp_0_control_r,
  output [38:0] io_bp_0_address,
  output        io_pmp_0_cfg_l,
  output [1:0]  io_pmp_0_cfg_a,
  output        io_pmp_0_cfg_x,
  output        io_pmp_0_cfg_w,
  output        io_pmp_0_cfg_r,
  output [29:0] io_pmp_0_addr,
  output [31:0] io_pmp_0_mask,
  output        io_pmp_1_cfg_l,
  output [1:0]  io_pmp_1_cfg_a,
  output        io_pmp_1_cfg_x,
  output        io_pmp_1_cfg_w,
  output        io_pmp_1_cfg_r,
  output [29:0] io_pmp_1_addr,
  output [31:0] io_pmp_1_mask,
  output        io_pmp_2_cfg_l,
  output [1:0]  io_pmp_2_cfg_a,
  output        io_pmp_2_cfg_x,
  output        io_pmp_2_cfg_w,
  output        io_pmp_2_cfg_r,
  output [29:0] io_pmp_2_addr,
  output [31:0] io_pmp_2_mask,
  output        io_pmp_3_cfg_l,
  output [1:0]  io_pmp_3_cfg_a,
  output        io_pmp_3_cfg_x,
  output        io_pmp_3_cfg_w,
  output        io_pmp_3_cfg_r,
  output [29:0] io_pmp_3_addr,
  output [31:0] io_pmp_3_mask,
  output        io_pmp_4_cfg_l,
  output [1:0]  io_pmp_4_cfg_a,
  output        io_pmp_4_cfg_x,
  output        io_pmp_4_cfg_w,
  output        io_pmp_4_cfg_r,
  output [29:0] io_pmp_4_addr,
  output [31:0] io_pmp_4_mask,
  output        io_pmp_5_cfg_l,
  output [1:0]  io_pmp_5_cfg_a,
  output        io_pmp_5_cfg_x,
  output        io_pmp_5_cfg_w,
  output        io_pmp_5_cfg_r,
  output [29:0] io_pmp_5_addr,
  output [31:0] io_pmp_5_mask,
  output        io_pmp_6_cfg_l,
  output [1:0]  io_pmp_6_cfg_a,
  output        io_pmp_6_cfg_x,
  output        io_pmp_6_cfg_w,
  output        io_pmp_6_cfg_r,
  output [29:0] io_pmp_6_addr,
  output [31:0] io_pmp_6_mask,
  output        io_pmp_7_cfg_l,
  output [1:0]  io_pmp_7_cfg_a,
  output        io_pmp_7_cfg_x,
  output        io_pmp_7_cfg_w,
  output        io_pmp_7_cfg_r,
  output [29:0] io_pmp_7_addr,
  output [31:0] io_pmp_7_mask,
  output        io_inhibit_cycle,
  input  [31:0] io_inst_0,
  output        io_trace_0_valid,
  output [39:0] io_trace_0_iaddr,
  output [31:0] io_trace_0_insn,
  output        io_trace_0_exception,
  output [63:0] io_customCSRs_0_value
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
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [63:0] _RAND_25;
  reg [63:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [63:0] _RAND_36;
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
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [63:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [63:0] _RAND_89;
  reg [63:0] _RAND_90;
  reg [63:0] _RAND_91;
  reg [63:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [63:0] _RAND_96;
  reg [63:0] _RAND_97;
  reg [63:0] _RAND_98;
  reg [63:0] _RAND_99;
  reg [63:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [63:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [63:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [63:0] _RAND_110;
  reg [63:0] _RAND_111;
  reg [63:0] _RAND_112;
  reg [31:0] _RAND_113;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] reg_mstatus_prv; // @[CSR.scala 370:24]
  reg  reg_mstatus_gva; // @[CSR.scala 370:24]
  reg  reg_mstatus_tsr; // @[CSR.scala 370:24]
  reg  reg_mstatus_tw; // @[CSR.scala 370:24]
  reg  reg_mstatus_tvm; // @[CSR.scala 370:24]
  reg  reg_mstatus_mxr; // @[CSR.scala 370:24]
  reg  reg_mstatus_sum; // @[CSR.scala 370:24]
  reg  reg_mstatus_mprv; // @[CSR.scala 370:24]
  reg [1:0] reg_mstatus_fs; // @[CSR.scala 370:24]
  reg [1:0] reg_mstatus_mpp; // @[CSR.scala 370:24]
  reg  reg_mstatus_spp; // @[CSR.scala 370:24]
  reg  reg_mstatus_mpie; // @[CSR.scala 370:24]
  reg  reg_mstatus_spie; // @[CSR.scala 370:24]
  reg  reg_mstatus_mie; // @[CSR.scala 370:24]
  reg  reg_mstatus_sie; // @[CSR.scala 370:24]
  wire  system_insn = io_rw_cmd == 3'h4; // @[CSR.scala 814:31]
  wire [31:0] _T_230 = {io_rw_addr, 20'h0}; // @[CSR.scala 830:44]
  wire [31:0] decoded_plaInput = 32'h73 | _T_230; // @[CSR.scala 830:30]
  wire [31:0] decoded_invInputs = ~decoded_plaInput; // @[pla.scala 78:21]
  wire  decoded_andMatrixInput_0 = decoded_invInputs[20]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_1 = decoded_invInputs[21]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_2 = decoded_invInputs[22]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_3 = decoded_invInputs[23]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_4 = decoded_invInputs[24]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_5 = decoded_invInputs[25]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_6 = decoded_invInputs[26]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_7 = decoded_invInputs[27]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_8 = decoded_invInputs[28]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_9 = decoded_invInputs[29]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_10 = decoded_invInputs[30]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_11 = decoded_invInputs[31]; // @[pla.scala 91:29]
  wire [5:0] decoded_lo = {decoded_andMatrixInput_6,decoded_andMatrixInput_7,decoded_andMatrixInput_8,
    decoded_andMatrixInput_9,decoded_andMatrixInput_10,decoded_andMatrixInput_11}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_T = {decoded_andMatrixInput_0,decoded_andMatrixInput_1,decoded_andMatrixInput_2,
    decoded_andMatrixInput_3,decoded_andMatrixInput_4,decoded_andMatrixInput_5,decoded_lo}; // @[Cat.scala 31:58]
  wire  _decoded_T_1 = &_decoded_T; // @[pla.scala 98:74]
  wire  _decoded_orMatrixOutputs_T_6 = |_decoded_T_1; // @[pla.scala 114:39]
  wire  decoded_andMatrixInput_0_1 = decoded_plaInput[20]; // @[pla.scala 90:45]
  wire [11:0] _decoded_T_2 = {decoded_andMatrixInput_0_1,decoded_andMatrixInput_1,decoded_andMatrixInput_2,
    decoded_andMatrixInput_3,decoded_andMatrixInput_4,decoded_andMatrixInput_5,decoded_lo}; // @[Cat.scala 31:58]
  wire  _decoded_T_3 = &_decoded_T_2; // @[pla.scala 98:74]
  wire  _decoded_orMatrixOutputs_T_5 = |_decoded_T_3; // @[pla.scala 114:39]
  wire  decoded_andMatrixInput_0_2 = decoded_plaInput[0]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_7_2 = decoded_plaInput[28]; // @[pla.scala 90:45]
  wire [9:0] _decoded_T_4 = {decoded_andMatrixInput_0_2,decoded_andMatrixInput_2,decoded_andMatrixInput_3,
    decoded_andMatrixInput_4,decoded_andMatrixInput_5,decoded_andMatrixInput_6,decoded_andMatrixInput_7,
    decoded_andMatrixInput_7_2,decoded_andMatrixInput_10,decoded_andMatrixInput_11}; // @[Cat.scala 31:58]
  wire  _decoded_T_5 = &_decoded_T_4; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_6 = decoded_plaInput[30]; // @[pla.scala 90:45]
  wire [1:0] _decoded_T_12 = {decoded_andMatrixInput_0_6,decoded_andMatrixInput_11}; // @[Cat.scala 31:58]
  wire  _decoded_T_13 = &_decoded_T_12; // @[pla.scala 98:74]
  wire [1:0] _decoded_orMatrixOutputs_T_3 = {_decoded_T_5,_decoded_T_13}; // @[Cat.scala 31:58]
  wire  _decoded_orMatrixOutputs_T_4 = |_decoded_orMatrixOutputs_T_3; // @[pla.scala 114:39]
  wire  decoded_andMatrixInput_0_5 = decoded_plaInput[22]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_7_5 = decoded_plaInput[29]; // @[pla.scala 90:45]
  wire [9:0] _decoded_T_10 = {decoded_andMatrixInput_0_5,decoded_andMatrixInput_3,decoded_andMatrixInput_4,
    decoded_andMatrixInput_5,decoded_andMatrixInput_6,decoded_andMatrixInput_7,decoded_andMatrixInput_7_2,
    decoded_andMatrixInput_7_5,decoded_andMatrixInput_10,decoded_andMatrixInput_11}; // @[Cat.scala 31:58]
  wire  _decoded_T_11 = &_decoded_T_10; // @[pla.scala 98:74]
  wire  _decoded_orMatrixOutputs_T_2 = |_decoded_T_11; // @[pla.scala 114:39]
  wire [9:0] _decoded_T_6 = {decoded_andMatrixInput_0_5,decoded_andMatrixInput_3,decoded_andMatrixInput_4,
    decoded_andMatrixInput_5,decoded_andMatrixInput_6,decoded_andMatrixInput_7,decoded_andMatrixInput_7_2,
    decoded_andMatrixInput_9,decoded_andMatrixInput_10,decoded_andMatrixInput_11}; // @[Cat.scala 31:58]
  wire  _decoded_T_7 = &_decoded_T_6; // @[pla.scala 98:74]
  wire  _decoded_orMatrixOutputs_T_1 = |_decoded_T_7; // @[pla.scala 114:39]
  wire  decoded_andMatrixInput_1_4 = decoded_plaInput[1]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_2_4 = decoded_invInputs[2]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_3_4 = decoded_invInputs[3]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_4_4 = decoded_plaInput[4]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_5_4 = decoded_plaInput[5]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_6_4 = decoded_plaInput[6]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_7_4 = decoded_invInputs[7]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_8_4 = decoded_invInputs[8]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_9_4 = decoded_invInputs[9]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_10_2 = decoded_plaInput[25]; // @[pla.scala 90:45]
  wire [7:0] decoded_lo_4 = {decoded_andMatrixInput_9_4,decoded_andMatrixInput_10_2,decoded_andMatrixInput_6,
    decoded_andMatrixInput_7,decoded_andMatrixInput_7_2,decoded_andMatrixInput_9,decoded_andMatrixInput_10,
    decoded_andMatrixInput_11}; // @[Cat.scala 31:58]
  wire [16:0] _decoded_T_8 = {decoded_andMatrixInput_0_2,decoded_andMatrixInput_1_4,decoded_andMatrixInput_2_4,
    decoded_andMatrixInput_3_4,decoded_andMatrixInput_4_4,decoded_andMatrixInput_5_4,decoded_andMatrixInput_6_4,
    decoded_andMatrixInput_7_4,decoded_andMatrixInput_8_4,decoded_lo_4}; // @[Cat.scala 31:58]
  wire  _decoded_T_9 = &_decoded_T_8; // @[pla.scala 98:74]
  wire  _decoded_orMatrixOutputs_T = |_decoded_T_9; // @[pla.scala 114:39]
  wire [8:0] decoded_orMatrixOutputs = {_decoded_orMatrixOutputs_T_6,_decoded_orMatrixOutputs_T_5,
    _decoded_orMatrixOutputs_T_4,_decoded_orMatrixOutputs_T_2,_decoded_orMatrixOutputs_T_1,_decoded_orMatrixOutputs_T,1'h0
    ,2'h0}; // @[Cat.scala 31:58]
  wire [8:0] decoded_invMatrixOutputs = {decoded_orMatrixOutputs[8],decoded_orMatrixOutputs[7],decoded_orMatrixOutputs[6
    ],decoded_orMatrixOutputs[5],decoded_orMatrixOutputs[4],decoded_orMatrixOutputs[3],decoded_orMatrixOutputs[2],
    decoded_orMatrixOutputs[1],decoded_orMatrixOutputs[0]}; // @[Cat.scala 31:58]
  wire  insn_ret = system_insn & decoded_invMatrixOutputs[6]; // @[CSR.scala 831:83]
  reg [1:0] reg_dcsr_prv; // @[CSR.scala 378:21]
  wire [1:0] _GEN_238 = io_rw_addr[10] & io_rw_addr[7] ? reg_dcsr_prv : reg_mstatus_mpp; // @[CSR.scala 1067:70 1068:15]
  wire [1:0] ret_prv = ~io_rw_addr[9] ? {{1'd0}, reg_mstatus_spp} : _GEN_238; // @[CSR.scala 1050:52]
  wire  insn_call = system_insn & decoded_invMatrixOutputs[8]; // @[CSR.scala 831:83]
  wire  insn_break = system_insn & decoded_invMatrixOutputs[7]; // @[CSR.scala 831:83]
  wire  _exception_T = insn_call | insn_break; // @[CSR.scala 956:29]
  wire  exception = insn_call | insn_break | io_exception; // @[CSR.scala 956:43]
  reg  reg_singleStepped; // @[CSR.scala 454:30]
  wire [3:0] _GEN_36 = {{2'd0}, reg_mstatus_prv}; // @[CSR.scala 896:38]
  wire [3:0] _cause_T_4 = 4'h8 + _GEN_36; // @[CSR.scala 896:38]
  wire [63:0] _cause_T_5 = insn_break ? 64'h3 : io_cause; // @[CSR.scala 897:14]
  wire [63:0] cause = insn_call ? {{60'd0}, _cause_T_4} : _cause_T_5; // @[CSR.scala 896:8]
  wire [7:0] cause_lsbs = cause[7:0]; // @[CSR.scala 898:25]
  wire  _causeIsDebugInt_T_1 = cause_lsbs == 8'he; // @[CSR.scala 899:53]
  wire  causeIsDebugInt = cause[63] & cause_lsbs == 8'he; // @[CSR.scala 899:39]
  wire  _causeIsDebugTrigger_T_1 = ~cause[63]; // @[CSR.scala 900:29]
  wire  causeIsDebugTrigger = ~cause[63] & _causeIsDebugInt_T_1; // @[CSR.scala 900:44]
  reg  reg_dcsr_ebreakm; // @[CSR.scala 378:21]
  reg  reg_dcsr_ebreaks; // @[CSR.scala 378:21]
  reg  reg_dcsr_ebreaku; // @[CSR.scala 378:21]
  wire [3:0] _causeIsDebugBreak_T_3 = {reg_dcsr_ebreakm,1'h0,reg_dcsr_ebreaks,reg_dcsr_ebreaku}; // @[Cat.scala 31:58]
  wire [3:0] _causeIsDebugBreak_T_4 = _causeIsDebugBreak_T_3 >> reg_mstatus_prv; // @[CSR.scala 901:134]
  wire  causeIsDebugBreak = _causeIsDebugTrigger_T_1 & insn_break & _causeIsDebugBreak_T_4[0]; // @[CSR.scala 901:56]
  reg  reg_debug; // @[CSR.scala 450:22]
  wire  trapToDebug = reg_singleStepped | causeIsDebugInt | causeIsDebugTrigger | causeIsDebugBreak | reg_debug; // @[CSR.scala 902:123]
  wire  _T_297 = ~reg_debug; // @[CSR.scala 972:13]
  wire [1:0] _GEN_58 = ~reg_debug ? 2'h3 : reg_mstatus_prv; // @[CSR.scala 972:25 979:17]
  wire  _delegate_T = reg_mstatus_prv <= 2'h1; // @[CSR.scala 906:59]
  reg [63:0] reg_mideleg; // @[CSR.scala 465:18]
  wire [63:0] read_mideleg = reg_mideleg & 64'h222; // @[CSR.scala 466:36]
  wire [63:0] _delegate_T_3 = read_mideleg >> cause_lsbs; // @[CSR.scala 906:102]
  reg [63:0] reg_medeleg; // @[CSR.scala 469:18]
  wire [63:0] read_medeleg = reg_medeleg & 64'hf0b55d; // @[CSR.scala 470:36]
  wire [63:0] _delegate_T_5 = read_medeleg >> cause_lsbs; // @[CSR.scala 906:128]
  wire  _delegate_T_7 = cause[63] ? _delegate_T_3[0] : _delegate_T_5[0]; // @[CSR.scala 906:74]
  wire  delegate = reg_mstatus_prv <= 2'h1 & _delegate_T_7; // @[CSR.scala 906:68]
  wire [1:0] _GEN_77 = delegate ? 2'h1 : 2'h3; // @[CSR.scala 1000:35 1012:15 1024:15]
  wire [1:0] _GEN_152 = trapToDebug ? _GEN_58 : _GEN_77; // @[CSR.scala 971:24]
  wire [1:0] _GEN_189 = exception ? _GEN_152 : reg_mstatus_prv; // @[CSR.scala 970:20]
  wire [1:0] new_prv = insn_ret ? ret_prv : _GEN_189; // @[CSR.scala 1048:19 1087:13]
  reg [2:0] reg_dcsr_cause; // @[CSR.scala 378:21]
  reg  reg_dcsr_step; // @[CSR.scala 378:21]
  reg [39:0] reg_dpc; // @[CSR.scala 451:20]
  reg [63:0] reg_dscratch0; // @[CSR.scala 452:26]
  reg  reg_bp_0_control_dmode; // @[CSR.scala 460:19]
  reg  reg_bp_0_control_action; // @[CSR.scala 460:19]
  reg [1:0] reg_bp_0_control_tmatch; // @[CSR.scala 460:19]
  reg  reg_bp_0_control_m; // @[CSR.scala 460:19]
  reg  reg_bp_0_control_s; // @[CSR.scala 460:19]
  reg  reg_bp_0_control_u; // @[CSR.scala 460:19]
  reg  reg_bp_0_control_x; // @[CSR.scala 460:19]
  reg  reg_bp_0_control_w; // @[CSR.scala 460:19]
  reg  reg_bp_0_control_r; // @[CSR.scala 460:19]
  reg [38:0] reg_bp_0_address; // @[CSR.scala 460:19]
  reg  reg_pmp_0_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_0_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_0_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_0_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_0_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_0_addr; // @[CSR.scala 461:20]
  reg  reg_pmp_1_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_1_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_1_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_1_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_1_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_1_addr; // @[CSR.scala 461:20]
  reg  reg_pmp_2_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_2_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_2_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_2_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_2_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_2_addr; // @[CSR.scala 461:20]
  reg  reg_pmp_3_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_3_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_3_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_3_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_3_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_3_addr; // @[CSR.scala 461:20]
  reg  reg_pmp_4_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_4_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_4_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_4_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_4_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_4_addr; // @[CSR.scala 461:20]
  reg  reg_pmp_5_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_5_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_5_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_5_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_5_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_5_addr; // @[CSR.scala 461:20]
  reg  reg_pmp_6_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_6_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_6_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_6_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_6_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_6_addr; // @[CSR.scala 461:20]
  reg  reg_pmp_7_cfg_l; // @[CSR.scala 461:20]
  reg [1:0] reg_pmp_7_cfg_a; // @[CSR.scala 461:20]
  reg  reg_pmp_7_cfg_x; // @[CSR.scala 461:20]
  reg  reg_pmp_7_cfg_w; // @[CSR.scala 461:20]
  reg  reg_pmp_7_cfg_r; // @[CSR.scala 461:20]
  reg [29:0] reg_pmp_7_addr; // @[CSR.scala 461:20]
  reg [63:0] reg_mie; // @[CSR.scala 463:20]
  reg  reg_mip_seip; // @[CSR.scala 472:20]
  reg  reg_mip_stip; // @[CSR.scala 472:20]
  reg  reg_mip_ssip; // @[CSR.scala 472:20]
  reg [39:0] reg_mepc; // @[CSR.scala 473:21]
  reg [63:0] reg_mcause; // @[CSR.scala 474:27]
  reg [39:0] reg_mtval; // @[CSR.scala 475:22]
  reg [63:0] reg_mscratch; // @[CSR.scala 477:25]
  reg [31:0] reg_mtvec; // @[CSR.scala 480:27]
  reg [31:0] reg_mcounteren; // @[CSR.scala 495:18]
  wire [31:0] read_mcounteren = reg_mcounteren & 32'h7; // @[CSR.scala 496:30]
  reg [31:0] reg_scounteren; // @[CSR.scala 499:18]
  wire [31:0] read_scounteren = reg_scounteren & 32'h7; // @[CSR.scala 500:36]
  wire [15:0] _read_hvip_T = {4'h0,2'h0,reg_mip_seip,1'h0,2'h0,reg_mip_stip,1'h0,2'h0,reg_mip_ssip,1'h0}; // @[CSR.scala 519:27]
  reg [39:0] reg_sepc; // @[CSR.scala 533:21]
  reg [63:0] reg_scause; // @[CSR.scala 534:23]
  reg [39:0] reg_stval; // @[CSR.scala 535:22]
  reg [63:0] reg_sscratch; // @[CSR.scala 536:25]
  reg [38:0] reg_stvec; // @[CSR.scala 537:22]
  reg [3:0] reg_satp_mode; // @[CSR.scala 538:21]
  reg [43:0] reg_satp_ppn; // @[CSR.scala 538:21]
  reg  reg_wfi; // @[CSR.scala 539:50]
  reg [4:0] reg_fflags; // @[CSR.scala 541:23]
  reg [2:0] reg_frm; // @[CSR.scala 542:20]
  reg [2:0] reg_mcountinhibit; // @[CSR.scala 548:34]
  wire  x79 = reg_mcountinhibit[2]; // @[CSR.scala 550:75]
  reg [5:0] small_; // @[Counters.scala 45:37]
  wire [5:0] _GEN_37 = {{5'd0}, io_retire}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall = small_ + _GEN_37; // @[Counters.scala 46:33]
  wire  _T_18 = ~x79; // @[Counters.scala 47:9]
  wire [6:0] _GEN_0 = ~x79 ? nextSmall : {{1'd0}, small_}; // @[Counters.scala 47:{19,27} 45:37]
  reg [57:0] large_; // @[Counters.scala 50:27]
  wire [57:0] _large_r_T_1 = large_ + 58'h1; // @[Counters.scala 51:55]
  wire [57:0] _GEN_1 = nextSmall[6] & _T_18 ? _large_r_T_1 : large_; // @[Counters.scala 50:27 51:{46,50}]
  wire [63:0] value = {large_,small_}; // @[Cat.scala 31:58]
  wire  x86 = ~io_csr_stall; // @[CSR.scala 552:56]
  reg [5:0] small_1; // @[Counters.scala 45:37]
  wire [5:0] _GEN_42 = {{5'd0}, x86}; // @[Counters.scala 46:33]
  wire [6:0] nextSmall_1 = small_1 + _GEN_42; // @[Counters.scala 46:33]
  wire  _T_19 = ~reg_mcountinhibit[0]; // @[Counters.scala 47:9]
  wire [6:0] _GEN_2 = ~reg_mcountinhibit[0] ? nextSmall_1 : {{1'd0}, small_1}; // @[Counters.scala 47:{19,27} 45:37]
  reg [57:0] large_1; // @[Counters.scala 50:27]
  wire [57:0] _large_r_T_3 = large_1 + 58'h1; // @[Counters.scala 51:55]
  wire [57:0] _GEN_3 = nextSmall_1[6] & _T_19 ? _large_r_T_3 : large_1; // @[Counters.scala 50:27 51:{46,50}]
  wire [63:0] value_1 = {large_1,small_1}; // @[Cat.scala 31:58]
  wire  mip_seip = reg_mip_seip | io_interrupts_seip; // @[CSR.scala 564:57]
  wire [7:0] read_mip_lo = {io_interrupts_mtip,1'h0,reg_mip_stip,1'h0,io_interrupts_msip,1'h0,reg_mip_ssip,1'h0}; // @[CSR.scala 568:22]
  wire [15:0] _read_mip_T = {4'h0,io_interrupts_meip,1'h0,mip_seip,1'h0,read_mip_lo}; // @[CSR.scala 568:22]
  wire [15:0] read_mip = _read_mip_T & 16'haaa; // @[CSR.scala 568:29]
  wire [63:0] _GEN_43 = {{48'd0}, read_mip}; // @[CSR.scala 572:56]
  wire [63:0] pending_interrupts = _GEN_43 & reg_mie; // @[CSR.scala 572:56]
  wire [14:0] d_interrupts = {io_interrupts_debug, 14'h0}; // @[CSR.scala 573:42]
  wire [63:0] _m_interrupts_T_3 = ~pending_interrupts; // @[CSR.scala 578:83]
  wire [63:0] _m_interrupts_T_4 = _m_interrupts_T_3 | read_mideleg; // @[CSR.scala 578:103]
  wire [63:0] _m_interrupts_T_5 = ~_m_interrupts_T_4; // @[CSR.scala 578:81]
  wire [63:0] m_interrupts = _delegate_T | reg_mstatus_mie ? _m_interrupts_T_5 : 64'h0; // @[CSR.scala 578:25]
  wire [63:0] _s_interrupts_T_6 = pending_interrupts & read_mideleg; // @[CSR.scala 579:147]
  wire [63:0] s_interrupts = reg_mstatus_prv < 2'h1 | reg_mstatus_prv == 2'h1 & reg_mstatus_sie ? _s_interrupts_T_6 : 64'h0
    ; // @[CSR.scala 579:25]
  wire  _any_T_78 = d_interrupts[14] | d_interrupts[13] | d_interrupts[12] | d_interrupts[11] | d_interrupts[3] |
    d_interrupts[7] | d_interrupts[9] | d_interrupts[1] | d_interrupts[5] | d_interrupts[10] | d_interrupts[2] |
    d_interrupts[6] | d_interrupts[8] | d_interrupts[0] | d_interrupts[4] | m_interrupts[15]; // @[CSR.scala 1537:90]
  wire  _any_T_93 = _any_T_78 | m_interrupts[14] | m_interrupts[13] | m_interrupts[12] | m_interrupts[11] | m_interrupts
    [3] | m_interrupts[7] | m_interrupts[9] | m_interrupts[1] | m_interrupts[5] | m_interrupts[10] | m_interrupts[2] |
    m_interrupts[6] | m_interrupts[8] | m_interrupts[0] | m_interrupts[4]; // @[CSR.scala 1537:90]
  wire  _any_T_108 = _any_T_93 | s_interrupts[15] | s_interrupts[14] | s_interrupts[13] | s_interrupts[12] |
    s_interrupts[11] | s_interrupts[3] | s_interrupts[7] | s_interrupts[9] | s_interrupts[1] | s_interrupts[5] |
    s_interrupts[10] | s_interrupts[2] | s_interrupts[6] | s_interrupts[8] | s_interrupts[0]; // @[CSR.scala 1537:90]
  wire  anyInterrupt = _any_T_108 | s_interrupts[4]; // @[CSR.scala 1537:90]
  wire [3:0] _which_T_79 = s_interrupts[0] ? 4'h0 : 4'h4; // @[Mux.scala 47:70]
  wire [3:0] _which_T_80 = s_interrupts[8] ? 4'h8 : _which_T_79; // @[Mux.scala 47:70]
  wire [3:0] _which_T_81 = s_interrupts[6] ? 4'h6 : _which_T_80; // @[Mux.scala 47:70]
  wire [3:0] _which_T_82 = s_interrupts[2] ? 4'h2 : _which_T_81; // @[Mux.scala 47:70]
  wire [3:0] _which_T_83 = s_interrupts[10] ? 4'ha : _which_T_82; // @[Mux.scala 47:70]
  wire [3:0] _which_T_84 = s_interrupts[5] ? 4'h5 : _which_T_83; // @[Mux.scala 47:70]
  wire [3:0] _which_T_85 = s_interrupts[1] ? 4'h1 : _which_T_84; // @[Mux.scala 47:70]
  wire [3:0] _which_T_86 = s_interrupts[9] ? 4'h9 : _which_T_85; // @[Mux.scala 47:70]
  wire [3:0] _which_T_87 = s_interrupts[7] ? 4'h7 : _which_T_86; // @[Mux.scala 47:70]
  wire [3:0] _which_T_88 = s_interrupts[3] ? 4'h3 : _which_T_87; // @[Mux.scala 47:70]
  wire [3:0] _which_T_89 = s_interrupts[11] ? 4'hb : _which_T_88; // @[Mux.scala 47:70]
  wire [3:0] _which_T_90 = s_interrupts[12] ? 4'hc : _which_T_89; // @[Mux.scala 47:70]
  wire [3:0] _which_T_91 = s_interrupts[13] ? 4'hd : _which_T_90; // @[Mux.scala 47:70]
  wire [3:0] _which_T_92 = s_interrupts[14] ? 4'he : _which_T_91; // @[Mux.scala 47:70]
  wire [3:0] _which_T_93 = s_interrupts[15] ? 4'hf : _which_T_92; // @[Mux.scala 47:70]
  wire [3:0] _which_T_94 = m_interrupts[4] ? 4'h4 : _which_T_93; // @[Mux.scala 47:70]
  wire [3:0] _which_T_95 = m_interrupts[0] ? 4'h0 : _which_T_94; // @[Mux.scala 47:70]
  wire [3:0] _which_T_96 = m_interrupts[8] ? 4'h8 : _which_T_95; // @[Mux.scala 47:70]
  wire [3:0] _which_T_97 = m_interrupts[6] ? 4'h6 : _which_T_96; // @[Mux.scala 47:70]
  wire [3:0] _which_T_98 = m_interrupts[2] ? 4'h2 : _which_T_97; // @[Mux.scala 47:70]
  wire [3:0] _which_T_99 = m_interrupts[10] ? 4'ha : _which_T_98; // @[Mux.scala 47:70]
  wire [3:0] _which_T_100 = m_interrupts[5] ? 4'h5 : _which_T_99; // @[Mux.scala 47:70]
  wire [3:0] _which_T_101 = m_interrupts[1] ? 4'h1 : _which_T_100; // @[Mux.scala 47:70]
  wire [3:0] _which_T_102 = m_interrupts[9] ? 4'h9 : _which_T_101; // @[Mux.scala 47:70]
  wire [3:0] _which_T_103 = m_interrupts[7] ? 4'h7 : _which_T_102; // @[Mux.scala 47:70]
  wire [3:0] _which_T_104 = m_interrupts[3] ? 4'h3 : _which_T_103; // @[Mux.scala 47:70]
  wire [3:0] _which_T_105 = m_interrupts[11] ? 4'hb : _which_T_104; // @[Mux.scala 47:70]
  wire [3:0] _which_T_106 = m_interrupts[12] ? 4'hc : _which_T_105; // @[Mux.scala 47:70]
  wire [3:0] _which_T_107 = m_interrupts[13] ? 4'hd : _which_T_106; // @[Mux.scala 47:70]
  wire [3:0] _which_T_108 = m_interrupts[14] ? 4'he : _which_T_107; // @[Mux.scala 47:70]
  wire [3:0] _which_T_109 = m_interrupts[15] ? 4'hf : _which_T_108; // @[Mux.scala 47:70]
  wire [3:0] _which_T_111 = d_interrupts[4] ? 4'h4 : _which_T_109; // @[Mux.scala 47:70]
  wire [3:0] _which_T_112 = d_interrupts[0] ? 4'h0 : _which_T_111; // @[Mux.scala 47:70]
  wire [3:0] _which_T_113 = d_interrupts[8] ? 4'h8 : _which_T_112; // @[Mux.scala 47:70]
  wire [3:0] _which_T_114 = d_interrupts[6] ? 4'h6 : _which_T_113; // @[Mux.scala 47:70]
  wire [3:0] _which_T_115 = d_interrupts[2] ? 4'h2 : _which_T_114; // @[Mux.scala 47:70]
  wire [3:0] _which_T_116 = d_interrupts[10] ? 4'ha : _which_T_115; // @[Mux.scala 47:70]
  wire [3:0] _which_T_117 = d_interrupts[5] ? 4'h5 : _which_T_116; // @[Mux.scala 47:70]
  wire [3:0] _which_T_118 = d_interrupts[1] ? 4'h1 : _which_T_117; // @[Mux.scala 47:70]
  wire [3:0] _which_T_119 = d_interrupts[9] ? 4'h9 : _which_T_118; // @[Mux.scala 47:70]
  wire [3:0] _which_T_120 = d_interrupts[7] ? 4'h7 : _which_T_119; // @[Mux.scala 47:70]
  wire [3:0] _which_T_121 = d_interrupts[3] ? 4'h3 : _which_T_120; // @[Mux.scala 47:70]
  wire [3:0] _which_T_122 = d_interrupts[11] ? 4'hb : _which_T_121; // @[Mux.scala 47:70]
  wire [3:0] _which_T_123 = d_interrupts[12] ? 4'hc : _which_T_122; // @[Mux.scala 47:70]
  wire [3:0] _which_T_124 = d_interrupts[13] ? 4'hd : _which_T_123; // @[Mux.scala 47:70]
  wire [3:0] whichInterrupt = d_interrupts[14] ? 4'he : _which_T_124; // @[Mux.scala 47:70]
  wire [63:0] _GEN_659 = {{60'd0}, whichInterrupt}; // @[CSR.scala 583:67]
  wire  _io_interrupt_T = ~io_singleStep; // @[CSR.scala 584:36]
  wire [30:0] pmp_mask_base = {reg_pmp_0_addr,reg_pmp_0_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_1 = pmp_mask_base + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_2 = ~_pmp_mask_T_1; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_3 = pmp_mask_base & _pmp_mask_T_2; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_4 = {_pmp_mask_T_3,2'h3}; // @[Cat.scala 31:58]
  wire [30:0] pmp_mask_base_1 = {reg_pmp_1_addr,reg_pmp_1_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_6 = pmp_mask_base_1 + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_7 = ~_pmp_mask_T_6; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_8 = pmp_mask_base_1 & _pmp_mask_T_7; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_9 = {_pmp_mask_T_8,2'h3}; // @[Cat.scala 31:58]
  wire [30:0] pmp_mask_base_2 = {reg_pmp_2_addr,reg_pmp_2_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_11 = pmp_mask_base_2 + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_12 = ~_pmp_mask_T_11; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_13 = pmp_mask_base_2 & _pmp_mask_T_12; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_14 = {_pmp_mask_T_13,2'h3}; // @[Cat.scala 31:58]
  wire [30:0] pmp_mask_base_3 = {reg_pmp_3_addr,reg_pmp_3_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_16 = pmp_mask_base_3 + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_17 = ~_pmp_mask_T_16; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_18 = pmp_mask_base_3 & _pmp_mask_T_17; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_19 = {_pmp_mask_T_18,2'h3}; // @[Cat.scala 31:58]
  wire [30:0] pmp_mask_base_4 = {reg_pmp_4_addr,reg_pmp_4_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_21 = pmp_mask_base_4 + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_22 = ~_pmp_mask_T_21; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_23 = pmp_mask_base_4 & _pmp_mask_T_22; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_24 = {_pmp_mask_T_23,2'h3}; // @[Cat.scala 31:58]
  wire [30:0] pmp_mask_base_5 = {reg_pmp_5_addr,reg_pmp_5_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_26 = pmp_mask_base_5 + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_27 = ~_pmp_mask_T_26; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_28 = pmp_mask_base_5 & _pmp_mask_T_27; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_29 = {_pmp_mask_T_28,2'h3}; // @[Cat.scala 31:58]
  wire [30:0] pmp_mask_base_6 = {reg_pmp_6_addr,reg_pmp_6_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_31 = pmp_mask_base_6 + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_32 = ~_pmp_mask_T_31; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_33 = pmp_mask_base_6 & _pmp_mask_T_32; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_34 = {_pmp_mask_T_33,2'h3}; // @[Cat.scala 31:58]
  wire [30:0] pmp_mask_base_7 = {reg_pmp_7_addr,reg_pmp_7_cfg_a[0]}; // @[Cat.scala 31:58]
  wire [30:0] _pmp_mask_T_36 = pmp_mask_base_7 + 31'h1; // @[PMP.scala 58:23]
  wire [30:0] _pmp_mask_T_37 = ~_pmp_mask_T_36; // @[PMP.scala 58:16]
  wire [30:0] _pmp_mask_T_38 = pmp_mask_base_7 & _pmp_mask_T_37; // @[PMP.scala 58:14]
  wire [32:0] _pmp_mask_T_39 = {_pmp_mask_T_38,2'h3}; // @[Cat.scala 31:58]
  reg [63:0] reg_misa; // @[CSR.scala 606:21]
  wire [8:0] read_mstatus_lo_lo = {io_status_spp,io_status_mpie,io_status_ube,io_status_spie,io_status_upie,
    io_status_mie,io_status_hie,io_status_sie,io_status_uie}; // @[CSR.scala 607:38]
  wire [21:0] read_mstatus_lo = {io_status_tw,io_status_tvm,io_status_mxr,io_status_sum,io_status_mprv,io_status_xs,
    io_status_fs,io_status_mpp,io_status_vs,read_mstatus_lo_lo}; // @[CSR.scala 607:38]
  wire [64:0] read_mstatus_hi_hi = {io_status_debug,io_status_cease,io_status_wfi,io_status_isa,io_status_dprv,
    io_status_dv,io_status_prv,io_status_v,io_status_sd,io_status_zero2}; // @[CSR.scala 607:38]
  wire [82:0] read_mstatus_hi = {read_mstatus_hi_hi,io_status_mpv,io_status_gva,io_status_mbe,io_status_sbe,
    io_status_sxl,io_status_uxl,io_status_sd_rv32,io_status_zero1,io_status_tsr}; // @[CSR.scala 607:38]
  wire [104:0] _read_mstatus_T = {read_mstatus_hi,read_mstatus_lo}; // @[CSR.scala 607:38]
  wire [63:0] read_mstatus = _read_mstatus_T[63:0]; // @[CSR.scala 607:40]
  wire [7:0] _read_mtvec_T_1 = reg_mtvec[0] ? 8'hfe : 8'h2; // @[CSR.scala 1566:39]
  wire [31:0] _read_mtvec_T_3 = {{24'd0}, _read_mtvec_T_1}; // @[package.scala 165:41]
  wire [31:0] _read_mtvec_T_4 = ~_read_mtvec_T_3; // @[package.scala 165:37]
  wire [31:0] _read_mtvec_T_5 = reg_mtvec & _read_mtvec_T_4; // @[package.scala 165:35]
  wire [63:0] read_mtvec = {32'h0,_read_mtvec_T_5}; // @[Cat.scala 31:58]
  wire [7:0] _read_stvec_T_1 = reg_stvec[0] ? 8'hfe : 8'h2; // @[CSR.scala 1566:39]
  wire [38:0] _read_stvec_T_3 = {{31'd0}, _read_stvec_T_1}; // @[package.scala 165:41]
  wire [38:0] _read_stvec_T_4 = ~_read_stvec_T_3; // @[package.scala 165:37]
  wire [38:0] _read_stvec_T_5 = reg_stvec & _read_stvec_T_4; // @[package.scala 165:35]
  wire [24:0] _read_stvec_T_8 = _read_stvec_T_5[38] ? 25'h1ffffff : 25'h0; // @[Bitwise.scala 74:12]
  wire [63:0] read_stvec = {_read_stvec_T_8,_read_stvec_T_5}; // @[Cat.scala 31:58]
  wire [6:0] lo_4 = {reg_bp_0_control_m,1'h0,reg_bp_0_control_s,reg_bp_0_control_u,reg_bp_0_control_x,reg_bp_0_control_w
    ,reg_bp_0_control_r}; // @[CSR.scala 613:48]
  wire [63:0] _T_20 = {4'h2,reg_bp_0_control_dmode,46'h40000000000,reg_bp_0_control_action,1'h0,2'h0,
    reg_bp_0_control_tmatch,lo_4}; // @[CSR.scala 613:48]
  wire [24:0] _T_23 = reg_bp_0_address[38] ? 25'h1ffffff : 25'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _T_24 = {_T_23,reg_bp_0_address}; // @[Cat.scala 31:58]
  wire [39:0] _T_26 = ~reg_mepc; // @[CSR.scala 1565:28]
  wire [1:0] _T_28 = reg_misa[2] ? 2'h1 : 2'h3; // @[CSR.scala 1565:36]
  wire [39:0] _GEN_660 = {{38'd0}, _T_28}; // @[CSR.scala 1565:31]
  wire [39:0] _T_29 = _T_26 | _GEN_660; // @[CSR.scala 1565:31]
  wire [39:0] _T_30 = ~_T_29; // @[CSR.scala 1565:26]
  wire [23:0] _T_33 = _T_30[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _T_34 = {_T_33,_T_30}; // @[Cat.scala 31:58]
  wire [23:0] _T_37 = reg_mtval[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _T_38 = {_T_37,reg_mtval}; // @[Cat.scala 31:58]
  wire [10:0] lo_6 = {2'h0,reg_dcsr_cause,1'h0,2'h0,reg_dcsr_step,reg_dcsr_prv}; // @[CSR.scala 628:27]
  wire [31:0] _T_39 = {4'h4,12'h0,reg_dcsr_ebreakm,1'h0,reg_dcsr_ebreaks,reg_dcsr_ebreaku,1'h0,lo_6}; // @[CSR.scala 628:27]
  wire [39:0] _T_40 = ~reg_dpc; // @[CSR.scala 1565:28]
  wire [39:0] _T_43 = _T_40 | _GEN_660; // @[CSR.scala 1565:31]
  wire [39:0] _T_44 = ~_T_43; // @[CSR.scala 1565:26]
  wire [23:0] _T_47 = _T_44[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _T_48 = {_T_47,_T_44}; // @[Cat.scala 31:58]
  wire [7:0] read_fcsr = {reg_frm,reg_fflags}; // @[Cat.scala 31:58]
  wire [63:0] sie_mask = read_mideleg & 64'hefff; // @[CSR.scala 704:18]
  wire [63:0] read_sie = reg_mie & sie_mask; // @[CSR.scala 707:28]
  wire [63:0] read_sip = _GEN_43 & sie_mask; // @[CSR.scala 708:29]
  wire [8:0] lo_lo_6 = {io_status_spp,1'h0,1'h0,io_status_spie,1'h0,2'h0,io_status_sie,1'h0}; // @[CSR.scala 722:57]
  wire [21:0] lo_7 = {2'h0,io_status_mxr,io_status_sum,1'h0,io_status_xs,io_status_fs,2'h0,io_status_vs,lo_lo_6}; // @[CSR.scala 722:57]
  wire [104:0] _T_49 = {37'h0,4'h0,io_status_sd,23'h0,6'h0,io_status_uxl,io_status_sd_rv32,9'h0,lo_7}; // @[CSR.scala 722:57]
  wire [23:0] _T_53 = reg_stval[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _T_54 = {_T_53,reg_stval}; // @[Cat.scala 31:58]
  wire [63:0] _T_55 = {reg_satp_mode,16'h0,reg_satp_ppn}; // @[CSR.scala 728:43]
  wire [39:0] _T_56 = ~reg_sepc; // @[CSR.scala 1565:28]
  wire [39:0] _T_59 = _T_56 | _GEN_660; // @[CSR.scala 1565:31]
  wire [39:0] _T_60 = ~_T_59; // @[CSR.scala 1565:26]
  wire [23:0] _T_63 = _T_60[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _T_64 = {_T_63,_T_60}; // @[Cat.scala 31:58]
  wire [7:0] _T_65 = {reg_pmp_0_cfg_l,2'h0,reg_pmp_0_cfg_a,reg_pmp_0_cfg_x,reg_pmp_0_cfg_w,reg_pmp_0_cfg_r}; // @[package.scala 36:38]
  wire [7:0] _T_67 = {reg_pmp_2_cfg_l,2'h0,reg_pmp_2_cfg_a,reg_pmp_2_cfg_x,reg_pmp_2_cfg_w,reg_pmp_2_cfg_r}; // @[package.scala 36:38]
  wire [7:0] _T_69 = {reg_pmp_4_cfg_l,2'h0,reg_pmp_4_cfg_a,reg_pmp_4_cfg_x,reg_pmp_4_cfg_w,reg_pmp_4_cfg_r}; // @[package.scala 36:38]
  wire [7:0] _T_71 = {reg_pmp_6_cfg_l,2'h0,reg_pmp_6_cfg_a,reg_pmp_6_cfg_x,reg_pmp_6_cfg_w,reg_pmp_6_cfg_r}; // @[package.scala 36:38]
  wire [15:0] lo_lo_7 = {reg_pmp_1_cfg_l,2'h0,reg_pmp_1_cfg_a,reg_pmp_1_cfg_x,reg_pmp_1_cfg_w,reg_pmp_1_cfg_r,_T_65}; // @[Cat.scala 31:58]
  wire [31:0] lo_16 = {reg_pmp_3_cfg_l,2'h0,reg_pmp_3_cfg_a,reg_pmp_3_cfg_x,reg_pmp_3_cfg_w,reg_pmp_3_cfg_r,_T_67,
    lo_lo_7}; // @[Cat.scala 31:58]
  wire [15:0] hi_lo_7 = {reg_pmp_5_cfg_l,2'h0,reg_pmp_5_cfg_a,reg_pmp_5_cfg_x,reg_pmp_5_cfg_w,reg_pmp_5_cfg_r,_T_69}; // @[Cat.scala 31:58]
  wire [63:0] _T_73 = {reg_pmp_7_cfg_l,2'h0,reg_pmp_7_cfg_a,reg_pmp_7_cfg_x,reg_pmp_7_cfg_w,reg_pmp_7_cfg_r,_T_71,
    hi_lo_7,lo_16}; // @[Cat.scala 31:58]
  reg [63:0] reg_custom_0; // @[CSR.scala 751:43]
  wire [12:0] addr = {io_status_v,io_rw_addr}; // @[Cat.scala 31:58]
  wire [11:0] decoded_decoded_plaInput = addr[11:0]; // @[decoder.scala 38:16 pla.scala 77:22]
  wire [11:0] decoded_decoded_invInputs = ~decoded_decoded_plaInput; // @[pla.scala 78:21]
  wire  decoded_decoded_andMatrixInput_0 = decoded_decoded_invInputs[1]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_1 = decoded_decoded_invInputs[2]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_2 = decoded_decoded_invInputs[3]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_3 = decoded_decoded_invInputs[4]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_4 = decoded_decoded_invInputs[5]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_5 = decoded_decoded_invInputs[6]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_6 = decoded_decoded_invInputs[7]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_7 = decoded_decoded_invInputs[8]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_8 = decoded_decoded_invInputs[9]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_9 = decoded_decoded_invInputs[10]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_10 = decoded_decoded_invInputs[11]; // @[pla.scala 91:29]
  wire [4:0] decoded_decoded_lo = {decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_7,
    decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [10:0] _decoded_decoded_T = {decoded_decoded_andMatrixInput_0,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_1 = &_decoded_decoded_T; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_0_1 = decoded_decoded_invInputs[0]; // @[pla.scala 91:29]
  wire  decoded_decoded_andMatrixInput_1_1 = decoded_decoded_plaInput[1]; // @[pla.scala 90:45]
  wire [5:0] decoded_decoded_lo_1 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_7,decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_9,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_2 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_1}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_3 = &_decoded_decoded_T_2; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_0_2 = decoded_decoded_plaInput[0]; // @[pla.scala 90:45]
  wire [11:0] _decoded_decoded_T_4 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_1}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_5 = &_decoded_decoded_T_4; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_6_3 = decoded_decoded_plaInput[8]; // @[pla.scala 90:45]
  wire [4:0] decoded_decoded_lo_3 = {decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,
    decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [9:0] _decoded_decoded_T_6 = {decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,
    decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,decoded_decoded_andMatrixInput_5,
    decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_8,
    decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_7 = &_decoded_decoded_T_6; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_2_4 = decoded_decoded_plaInput[2]; // @[pla.scala 90:45]
  wire [5:0] decoded_decoded_lo_4 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_9,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_8 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_4}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_9 = &_decoded_decoded_T_8; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_10 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_4}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_11 = &_decoded_decoded_T_10; // @[pla.scala 98:74]
  wire [10:0] _decoded_decoded_T_12 = {decoded_decoded_andMatrixInput_1_1,decoded_decoded_andMatrixInput_2_4,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_3}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_13 = &_decoded_decoded_T_12; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_6_7 = decoded_decoded_plaInput[6]; // @[pla.scala 90:45]
  wire [5:0] decoded_decoded_lo_7 = {decoded_decoded_andMatrixInput_6_7,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_9,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_14 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_7}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_15 = &_decoded_decoded_T_14; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_16 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_7}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_17 = &_decoded_decoded_T_16; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_18 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_7}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_19 = &_decoded_decoded_T_18; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_20 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_7}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_21 = &_decoded_decoded_T_20; // @[pla.scala 98:74]
  wire [9:0] _decoded_decoded_T_22 = {decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,
    decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,decoded_decoded_andMatrixInput_6_7,
    decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_8,
    decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_23 = &_decoded_decoded_T_22; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_0_12 = decoded_decoded_plaInput[7]; // @[pla.scala 90:45]
  wire [4:0] _decoded_decoded_T_24 = {decoded_decoded_andMatrixInput_0_12,decoded_decoded_andMatrixInput_6_3,
    decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_25 = &_decoded_decoded_T_24; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_9_12 = decoded_decoded_plaInput[9]; // @[pla.scala 90:45]
  wire [5:0] decoded_decoded_lo_13 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_9,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_26 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_27 = &_decoded_decoded_T_26; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_28 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_29 = &_decoded_decoded_T_28; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_30 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_31 = &_decoded_decoded_T_30; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_32 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_33 = &_decoded_decoded_T_32; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_34 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_35 = &_decoded_decoded_T_34; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_36 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_37 = &_decoded_decoded_T_36; // @[pla.scala 98:74]
  wire [4:0] decoded_decoded_lo_19 = {decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,
    decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [10:0] _decoded_decoded_T_38 = {decoded_decoded_andMatrixInput_1_1,decoded_decoded_andMatrixInput_2_4,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_19}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_39 = &_decoded_decoded_T_38; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_4_20 = decoded_decoded_plaInput[5]; // @[pla.scala 90:45]
  wire [10:0] _decoded_decoded_T_40 = {decoded_decoded_andMatrixInput_0,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4_20,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_19}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_41 = &_decoded_decoded_T_40; // @[pla.scala 98:74]
  wire [10:0] _decoded_decoded_T_42 = {decoded_decoded_andMatrixInput_1_1,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4_20,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_19}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_43 = &_decoded_decoded_T_42; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_44 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_45 = &_decoded_decoded_T_44; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_46 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_47 = &_decoded_decoded_T_46; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_48 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_49 = &_decoded_decoded_T_48; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_50 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_51 = &_decoded_decoded_T_50; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_3_26 = decoded_decoded_plaInput[3]; // @[pla.scala 90:45]
  wire [11:0] _decoded_decoded_T_52 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_53 = &_decoded_decoded_T_52; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_54 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_55 = &_decoded_decoded_T_54; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_56 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_57 = &_decoded_decoded_T_56; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_58 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_59 = &_decoded_decoded_T_58; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_60 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_61 = &_decoded_decoded_T_60; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_62 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_63 = &_decoded_decoded_T_62; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_64 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_65 = &_decoded_decoded_T_64; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_66 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_67 = &_decoded_decoded_T_66; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_4_34 = decoded_decoded_plaInput[4]; // @[pla.scala 90:45]
  wire [11:0] _decoded_decoded_T_68 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_69 = &_decoded_decoded_T_68; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_70 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_71 = &_decoded_decoded_T_70; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_72 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_73 = &_decoded_decoded_T_72; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_74 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_75 = &_decoded_decoded_T_74; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_76 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_77 = &_decoded_decoded_T_76; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_78 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_79 = &_decoded_decoded_T_78; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_80 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_81 = &_decoded_decoded_T_80; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_82 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_83 = &_decoded_decoded_T_82; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_84 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_85 = &_decoded_decoded_T_84; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_86 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_87 = &_decoded_decoded_T_86; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_88 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_89 = &_decoded_decoded_T_88; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_90 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_91 = &_decoded_decoded_T_90; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_92 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_93 = &_decoded_decoded_T_92; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_94 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_95 = &_decoded_decoded_T_94; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_96 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_97 = &_decoded_decoded_T_96; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_98 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_99 = &_decoded_decoded_T_98; // @[pla.scala 98:74]
  wire [5:0] decoded_decoded_lo_50 = {decoded_decoded_andMatrixInput_6_7,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_9,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_100 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_50}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_101 = &_decoded_decoded_T_100; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_102 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_50}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_103 = &_decoded_decoded_T_102; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_104 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_50}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_105 = &_decoded_decoded_T_104; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_106 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_50}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_107 = &_decoded_decoded_T_106; // @[pla.scala 98:74]
  wire [9:0] _decoded_decoded_T_108 = {decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,
    decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,decoded_decoded_andMatrixInput_6_7,
    decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,
    decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_109 = &_decoded_decoded_T_108; // @[pla.scala 98:74]
  wire [4:0] decoded_decoded_lo_55 = {decoded_decoded_andMatrixInput_0_12,decoded_decoded_andMatrixInput_6_3,
    decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [10:0] _decoded_decoded_T_110 = {decoded_decoded_andMatrixInput_0,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4_20,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_55}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_111 = &_decoded_decoded_T_110; // @[pla.scala 98:74]
  wire [10:0] _decoded_decoded_T_112 = {decoded_decoded_andMatrixInput_1_1,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4_20,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_55}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_113 = &_decoded_decoded_T_112; // @[pla.scala 98:74]
  wire [5:0] decoded_decoded_lo_57 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_0_12,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_9,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_114 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_115 = &_decoded_decoded_T_114; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_116 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_117 = &_decoded_decoded_T_116; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_118 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_119 = &_decoded_decoded_T_118; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_120 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_121 = &_decoded_decoded_T_120; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_122 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_123 = &_decoded_decoded_T_122; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_124 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_125 = &_decoded_decoded_T_124; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_126 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_127 = &_decoded_decoded_T_126; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_128 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_129 = &_decoded_decoded_T_128; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_130 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_131 = &_decoded_decoded_T_130; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_132 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_133 = &_decoded_decoded_T_132; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_134 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_135 = &_decoded_decoded_T_134; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_136 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_137 = &_decoded_decoded_T_136; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_138 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_139 = &_decoded_decoded_T_138; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_140 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_141 = &_decoded_decoded_T_140; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_142 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_143 = &_decoded_decoded_T_142; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_144 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_145 = &_decoded_decoded_T_144; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_10_69 = decoded_decoded_plaInput[10]; // @[pla.scala 90:45]
  wire [5:0] decoded_decoded_lo_73 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_0_12,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_10_69,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_146 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_73}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_147 = &_decoded_decoded_T_146; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_148 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_73}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_149 = &_decoded_decoded_T_148; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_150 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_73}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_151 = &_decoded_decoded_T_150; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_152 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_73}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_153 = &_decoded_decoded_T_152; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_154 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_73}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_155 = &_decoded_decoded_T_154; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_156 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4_20,decoded_decoded_lo_73}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_157 = &_decoded_decoded_T_156; // @[pla.scala 98:74]
  wire [4:0] decoded_decoded_lo_79 = {decoded_decoded_andMatrixInput_0_12,decoded_decoded_andMatrixInput_6_3,
    decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_10_69,decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [10:0] _decoded_decoded_T_158 = {decoded_decoded_andMatrixInput_1_1,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,decoded_decoded_andMatrixInput_4_20,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_79}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_159 = &_decoded_decoded_T_158; // @[pla.scala 98:74]
  wire [5:0] _decoded_decoded_T_160 = {decoded_decoded_andMatrixInput_6_7,decoded_decoded_andMatrixInput_0_12,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_10_69,
    decoded_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_161 = &_decoded_decoded_T_160; // @[pla.scala 98:74]
  wire  decoded_decoded_andMatrixInput_10_76 = decoded_decoded_plaInput[11]; // @[pla.scala 90:45]
  wire [4:0] decoded_decoded_lo_81 = {decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,
    decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_9,decoded_decoded_andMatrixInput_10_76}; // @[Cat.scala 31:58]
  wire [10:0] _decoded_decoded_T_162 = {decoded_decoded_andMatrixInput_0,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_81}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_163 = &_decoded_decoded_T_162; // @[pla.scala 98:74]
  wire [5:0] decoded_decoded_lo_82 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_9,
    decoded_decoded_andMatrixInput_10_76}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_164 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_165 = &_decoded_decoded_T_164; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_166 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_167 = &_decoded_decoded_T_166; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_168 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_169 = &_decoded_decoded_T_168; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_170 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_171 = &_decoded_decoded_T_170; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_172 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_173 = &_decoded_decoded_T_172; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_174 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_175 = &_decoded_decoded_T_174; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_176 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_177 = &_decoded_decoded_T_176; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_178 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_179 = &_decoded_decoded_T_178; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_180 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_181 = &_decoded_decoded_T_180; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_182 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_183 = &_decoded_decoded_T_182; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_184 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_185 = &_decoded_decoded_T_184; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_186 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_187 = &_decoded_decoded_T_186; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_188 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_189 = &_decoded_decoded_T_188; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_190 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_191 = &_decoded_decoded_T_190; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_192 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_193 = &_decoded_decoded_T_192; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_194 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_195 = &_decoded_decoded_T_194; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_196 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_197 = &_decoded_decoded_T_196; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_198 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_199 = &_decoded_decoded_T_198; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_200 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_201 = &_decoded_decoded_T_200; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_202 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_203 = &_decoded_decoded_T_202; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_204 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_205 = &_decoded_decoded_T_204; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_206 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_207 = &_decoded_decoded_T_206; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_208 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_209 = &_decoded_decoded_T_208; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_210 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_211 = &_decoded_decoded_T_210; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_212 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_213 = &_decoded_decoded_T_212; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_214 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_215 = &_decoded_decoded_T_214; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_216 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_217 = &_decoded_decoded_T_216; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_218 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_219 = &_decoded_decoded_T_218; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_220 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_221 = &_decoded_decoded_T_220; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_222 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_82}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_223 = &_decoded_decoded_T_222; // @[pla.scala 98:74]
  wire [4:0] decoded_decoded_lo_112 = {decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_7,
    decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_10_69,decoded_decoded_andMatrixInput_10_76}; // @[Cat.scala 31:58]
  wire [10:0] _decoded_decoded_T_224 = {decoded_decoded_andMatrixInput_0,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,decoded_decoded_andMatrixInput_4,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_112}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_225 = &_decoded_decoded_T_224; // @[pla.scala 98:74]
  wire [5:0] decoded_decoded_lo_113 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_7,decoded_decoded_andMatrixInput_8,decoded_decoded_andMatrixInput_10_69,
    decoded_decoded_andMatrixInput_10_76}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_226 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_227 = &_decoded_decoded_T_226; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_228 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_229 = &_decoded_decoded_T_228; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_230 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_231 = &_decoded_decoded_T_230; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_232 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_233 = &_decoded_decoded_T_232; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_234 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_235 = &_decoded_decoded_T_234; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_236 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_237 = &_decoded_decoded_T_236; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_238 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_239 = &_decoded_decoded_T_238; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_240 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_241 = &_decoded_decoded_T_240; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_242 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_243 = &_decoded_decoded_T_242; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_244 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_245 = &_decoded_decoded_T_244; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_246 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_247 = &_decoded_decoded_T_246; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_248 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_249 = &_decoded_decoded_T_248; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_250 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_251 = &_decoded_decoded_T_250; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_252 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_3,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_253 = &_decoded_decoded_T_252; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_254 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_255 = &_decoded_decoded_T_254; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_256 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_257 = &_decoded_decoded_T_256; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_258 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_259 = &_decoded_decoded_T_258; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_260 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_261 = &_decoded_decoded_T_260; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_262 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_263 = &_decoded_decoded_T_262; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_264 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_265 = &_decoded_decoded_T_264; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_266 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_267 = &_decoded_decoded_T_266; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_268 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_269 = &_decoded_decoded_T_268; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_270 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_271 = &_decoded_decoded_T_270; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_272 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_273 = &_decoded_decoded_T_272; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_274 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_275 = &_decoded_decoded_T_274; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_276 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_277 = &_decoded_decoded_T_276; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_278 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_279 = &_decoded_decoded_T_278; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_280 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_0,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_281 = &_decoded_decoded_T_280; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_282 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_283 = &_decoded_decoded_T_282; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_284 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_3_26,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_285 = &_decoded_decoded_T_284; // @[pla.scala 98:74]
  wire [4:0] decoded_decoded_lo_143 = {decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,
    decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_10_69,decoded_decoded_andMatrixInput_10_76}; // @[Cat.scala 31:58]
  wire [10:0] _decoded_decoded_T_286 = {decoded_decoded_andMatrixInput_0,decoded_decoded_andMatrixInput_1,
    decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,decoded_decoded_andMatrixInput_4,
    decoded_decoded_andMatrixInput_5,decoded_decoded_lo_143}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_287 = &_decoded_decoded_T_286; // @[pla.scala 98:74]
  wire [5:0] decoded_decoded_lo_144 = {decoded_decoded_andMatrixInput_5,decoded_decoded_andMatrixInput_6,
    decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,decoded_decoded_andMatrixInput_10_69,
    decoded_decoded_andMatrixInput_10_76}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_decoded_T_288 = {decoded_decoded_andMatrixInput_0_1,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_144}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_289 = &_decoded_decoded_T_288; // @[pla.scala 98:74]
  wire [11:0] _decoded_decoded_T_290 = {decoded_decoded_andMatrixInput_0_2,decoded_decoded_andMatrixInput_1_1,
    decoded_decoded_andMatrixInput_1,decoded_decoded_andMatrixInput_2,decoded_decoded_andMatrixInput_4_34,
    decoded_decoded_andMatrixInput_4,decoded_decoded_lo_144}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_291 = &_decoded_decoded_T_290; // @[pla.scala 98:74]
  wire [9:0] _decoded_decoded_T_292 = {decoded_decoded_andMatrixInput_2_4,decoded_decoded_andMatrixInput_2,
    decoded_decoded_andMatrixInput_4_34,decoded_decoded_andMatrixInput_4,decoded_decoded_andMatrixInput_5,
    decoded_decoded_andMatrixInput_6,decoded_decoded_andMatrixInput_6_3,decoded_decoded_andMatrixInput_9_12,
    decoded_decoded_andMatrixInput_10_69,decoded_decoded_andMatrixInput_10_76}; // @[Cat.scala 31:58]
  wire  _decoded_decoded_T_293 = &_decoded_decoded_T_292; // @[pla.scala 98:74]
  wire  _decoded_decoded_orMatrixOutputs_T = |_decoded_decoded_T_291; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_1 = |_decoded_decoded_T_287; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_2 = |_decoded_decoded_T_289; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_3 = |_decoded_decoded_T_161; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_4 = |_decoded_decoded_T_145; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_5 = |_decoded_decoded_T_143; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_6 = |_decoded_decoded_T_141; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_7 = |_decoded_decoded_T_139; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_8 = |_decoded_decoded_T_137; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_9 = |_decoded_decoded_T_135; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_10 = |_decoded_decoded_T_133; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_11 = |_decoded_decoded_T_131; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_12 = |_decoded_decoded_T_129; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_13 = |_decoded_decoded_T_127; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_14 = |_decoded_decoded_T_125; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_15 = |_decoded_decoded_T_123; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_16 = |_decoded_decoded_T_121; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_17 = |_decoded_decoded_T_119; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_18 = |_decoded_decoded_T_117; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_19 = |_decoded_decoded_T_115; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_20 = |_decoded_decoded_T_113; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_21 = |_decoded_decoded_T_111; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_22 = |_decoded_decoded_T_31; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_23 = |_decoded_decoded_T_33; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_24 = |_decoded_decoded_T_13; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_25 = |_decoded_decoded_T_11; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_26 = |_decoded_decoded_T_17; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_27 = |_decoded_decoded_T_25; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_28 = |_decoded_decoded_T_21; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_29 = |_decoded_decoded_T_19; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_30 = |_decoded_decoded_T_15; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_31 = |_decoded_decoded_T_9; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_32 = |_decoded_decoded_T_23; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_33 = |_decoded_decoded_T_7; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_34 = |_decoded_decoded_T_227; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_35 = |_decoded_decoded_T_225; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_36 = |_decoded_decoded_T_39; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_37 = |_decoded_decoded_T_285; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_38 = |_decoded_decoded_T_223; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_39 = |_decoded_decoded_T_99; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_40 = |_decoded_decoded_T_283; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_41 = |_decoded_decoded_T_221; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_42 = |_decoded_decoded_T_97; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_43 = |_decoded_decoded_T_281; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_44 = |_decoded_decoded_T_219; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_45 = |_decoded_decoded_T_95; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_46 = |_decoded_decoded_T_279; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_47 = |_decoded_decoded_T_217; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_48 = |_decoded_decoded_T_93; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_49 = |_decoded_decoded_T_277; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_50 = |_decoded_decoded_T_215; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_51 = |_decoded_decoded_T_91; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_52 = |_decoded_decoded_T_275; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_53 = |_decoded_decoded_T_213; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_54 = |_decoded_decoded_T_89; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_55 = |_decoded_decoded_T_273; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_56 = |_decoded_decoded_T_211; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_57 = |_decoded_decoded_T_87; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_58 = |_decoded_decoded_T_271; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_59 = |_decoded_decoded_T_209; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_60 = |_decoded_decoded_T_85; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_61 = |_decoded_decoded_T_269; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_62 = |_decoded_decoded_T_207; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_63 = |_decoded_decoded_T_83; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_64 = |_decoded_decoded_T_267; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_65 = |_decoded_decoded_T_205; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_66 = |_decoded_decoded_T_81; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_67 = |_decoded_decoded_T_265; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_68 = |_decoded_decoded_T_203; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_69 = |_decoded_decoded_T_79; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_70 = |_decoded_decoded_T_263; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_71 = |_decoded_decoded_T_201; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_72 = |_decoded_decoded_T_77; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_73 = |_decoded_decoded_T_261; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_74 = |_decoded_decoded_T_199; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_75 = |_decoded_decoded_T_75; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_76 = |_decoded_decoded_T_259; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_77 = |_decoded_decoded_T_197; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_78 = |_decoded_decoded_T_73; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_79 = |_decoded_decoded_T_257; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_80 = |_decoded_decoded_T_195; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_81 = |_decoded_decoded_T_71; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_82 = |_decoded_decoded_T_255; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_83 = |_decoded_decoded_T_193; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_84 = |_decoded_decoded_T_69; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_85 = |_decoded_decoded_T_253; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_86 = |_decoded_decoded_T_191; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_87 = |_decoded_decoded_T_67; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_88 = |_decoded_decoded_T_251; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_89 = |_decoded_decoded_T_189; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_90 = |_decoded_decoded_T_65; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_91 = |_decoded_decoded_T_249; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_92 = |_decoded_decoded_T_187; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_93 = |_decoded_decoded_T_63; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_94 = |_decoded_decoded_T_247; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_95 = |_decoded_decoded_T_185; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_96 = |_decoded_decoded_T_61; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_97 = |_decoded_decoded_T_245; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_98 = |_decoded_decoded_T_183; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_99 = |_decoded_decoded_T_59; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_100 = |_decoded_decoded_T_243; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_101 = |_decoded_decoded_T_181; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_102 = |_decoded_decoded_T_57; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_103 = |_decoded_decoded_T_241; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_104 = |_decoded_decoded_T_179; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_105 = |_decoded_decoded_T_55; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_106 = |_decoded_decoded_T_239; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_107 = |_decoded_decoded_T_177; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_108 = |_decoded_decoded_T_53; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_109 = |_decoded_decoded_T_237; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_110 = |_decoded_decoded_T_175; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_111 = |_decoded_decoded_T_51; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_112 = |_decoded_decoded_T_235; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_113 = |_decoded_decoded_T_173; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_114 = |_decoded_decoded_T_49; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_115 = |_decoded_decoded_T_233; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_116 = |_decoded_decoded_T_171; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_117 = |_decoded_decoded_T_47; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_118 = |_decoded_decoded_T_231; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_119 = |_decoded_decoded_T_169; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_120 = |_decoded_decoded_T_45; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_121 = |_decoded_decoded_T_229; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_122 = |_decoded_decoded_T_167; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_123 = |_decoded_decoded_T_43; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_124 = |_decoded_decoded_T_165; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_125 = |_decoded_decoded_T_163; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_126 = |_decoded_decoded_T_41; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_127 = |_decoded_decoded_T_5; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_128 = |_decoded_decoded_T_3; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_129 = |_decoded_decoded_T_1; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_130 = |_decoded_decoded_T_159; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_131 = |_decoded_decoded_T_157; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_132 = |_decoded_decoded_T_155; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_133 = |_decoded_decoded_T_293; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_134 = |_decoded_decoded_T_105; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_135 = |_decoded_decoded_T_107; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_136 = |_decoded_decoded_T_103; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_137 = |_decoded_decoded_T_101; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_138 = |_decoded_decoded_T_35; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_139 = |_decoded_decoded_T_109; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_140 = |_decoded_decoded_T_37; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_141 = |_decoded_decoded_T_27; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_142 = |_decoded_decoded_T_29; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_143 = |_decoded_decoded_T_153; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_144 = |_decoded_decoded_T_151; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_145 = |_decoded_decoded_T_149; // @[pla.scala 114:39]
  wire  _decoded_decoded_orMatrixOutputs_T_146 = |_decoded_decoded_T_147; // @[pla.scala 114:39]
  wire [8:0] decoded_decoded_orMatrixOutputs_lo_lo_lo_lo = {_decoded_decoded_orMatrixOutputs_T_8,
    _decoded_decoded_orMatrixOutputs_T_7,_decoded_decoded_orMatrixOutputs_T_6,_decoded_decoded_orMatrixOutputs_T_5,
    _decoded_decoded_orMatrixOutputs_T_4,_decoded_decoded_orMatrixOutputs_T_3,_decoded_decoded_orMatrixOutputs_T_2,
    _decoded_decoded_orMatrixOutputs_T_1,_decoded_decoded_orMatrixOutputs_T}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_orMatrixOutputs_lo_lo_lo = {_decoded_decoded_orMatrixOutputs_T_17,
    _decoded_decoded_orMatrixOutputs_T_16,_decoded_decoded_orMatrixOutputs_T_15,_decoded_decoded_orMatrixOutputs_T_14,
    _decoded_decoded_orMatrixOutputs_T_13,_decoded_decoded_orMatrixOutputs_T_12,_decoded_decoded_orMatrixOutputs_T_11,
    _decoded_decoded_orMatrixOutputs_T_10,_decoded_decoded_orMatrixOutputs_T_9,
    decoded_decoded_orMatrixOutputs_lo_lo_lo_lo}; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_orMatrixOutputs_lo_lo_hi_lo = {_decoded_decoded_orMatrixOutputs_T_26,
    _decoded_decoded_orMatrixOutputs_T_25,_decoded_decoded_orMatrixOutputs_T_24,_decoded_decoded_orMatrixOutputs_T_23,
    _decoded_decoded_orMatrixOutputs_T_22,_decoded_decoded_orMatrixOutputs_T_21,_decoded_decoded_orMatrixOutputs_T_20,
    _decoded_decoded_orMatrixOutputs_T_19,_decoded_decoded_orMatrixOutputs_T_18}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_orMatrixOutputs_lo_lo_hi = {_decoded_decoded_orMatrixOutputs_T_35,
    _decoded_decoded_orMatrixOutputs_T_34,_decoded_decoded_orMatrixOutputs_T_33,_decoded_decoded_orMatrixOutputs_T_32,
    _decoded_decoded_orMatrixOutputs_T_31,_decoded_decoded_orMatrixOutputs_T_30,_decoded_decoded_orMatrixOutputs_T_29,
    _decoded_decoded_orMatrixOutputs_T_28,_decoded_decoded_orMatrixOutputs_T_27,
    decoded_decoded_orMatrixOutputs_lo_lo_hi_lo}; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_orMatrixOutputs_lo_hi_lo_lo = {_decoded_decoded_orMatrixOutputs_T_44,
    _decoded_decoded_orMatrixOutputs_T_43,_decoded_decoded_orMatrixOutputs_T_42,_decoded_decoded_orMatrixOutputs_T_41,
    _decoded_decoded_orMatrixOutputs_T_40,_decoded_decoded_orMatrixOutputs_T_39,_decoded_decoded_orMatrixOutputs_T_38,
    _decoded_decoded_orMatrixOutputs_T_37,_decoded_decoded_orMatrixOutputs_T_36}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_orMatrixOutputs_lo_hi_lo = {_decoded_decoded_orMatrixOutputs_T_53,
    _decoded_decoded_orMatrixOutputs_T_52,_decoded_decoded_orMatrixOutputs_T_51,_decoded_decoded_orMatrixOutputs_T_50,
    _decoded_decoded_orMatrixOutputs_T_49,_decoded_decoded_orMatrixOutputs_T_48,_decoded_decoded_orMatrixOutputs_T_47,
    _decoded_decoded_orMatrixOutputs_T_46,_decoded_decoded_orMatrixOutputs_T_45,
    decoded_decoded_orMatrixOutputs_lo_hi_lo_lo}; // @[Cat.scala 31:58]
  wire [9:0] decoded_decoded_orMatrixOutputs_lo_hi_hi_hi = {_decoded_decoded_orMatrixOutputs_T_72,
    _decoded_decoded_orMatrixOutputs_T_71,_decoded_decoded_orMatrixOutputs_T_70,_decoded_decoded_orMatrixOutputs_T_69,
    _decoded_decoded_orMatrixOutputs_T_68,_decoded_decoded_orMatrixOutputs_T_67,_decoded_decoded_orMatrixOutputs_T_66,
    _decoded_decoded_orMatrixOutputs_T_65,_decoded_decoded_orMatrixOutputs_T_64,_decoded_decoded_orMatrixOutputs_T_63}; // @[Cat.scala 31:58]
  wire [18:0] decoded_decoded_orMatrixOutputs_lo_hi_hi = {decoded_decoded_orMatrixOutputs_lo_hi_hi_hi,
    _decoded_decoded_orMatrixOutputs_T_62,_decoded_decoded_orMatrixOutputs_T_61,_decoded_decoded_orMatrixOutputs_T_60,
    _decoded_decoded_orMatrixOutputs_T_59,_decoded_decoded_orMatrixOutputs_T_58,_decoded_decoded_orMatrixOutputs_T_57,
    _decoded_decoded_orMatrixOutputs_T_56,_decoded_decoded_orMatrixOutputs_T_55,_decoded_decoded_orMatrixOutputs_T_54}; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_orMatrixOutputs_hi_lo_lo_lo = {_decoded_decoded_orMatrixOutputs_T_81,
    _decoded_decoded_orMatrixOutputs_T_80,_decoded_decoded_orMatrixOutputs_T_79,_decoded_decoded_orMatrixOutputs_T_78,
    _decoded_decoded_orMatrixOutputs_T_77,_decoded_decoded_orMatrixOutputs_T_76,_decoded_decoded_orMatrixOutputs_T_75,
    _decoded_decoded_orMatrixOutputs_T_74,_decoded_decoded_orMatrixOutputs_T_73}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_orMatrixOutputs_hi_lo_lo = {_decoded_decoded_orMatrixOutputs_T_90,
    _decoded_decoded_orMatrixOutputs_T_89,_decoded_decoded_orMatrixOutputs_T_88,_decoded_decoded_orMatrixOutputs_T_87,
    _decoded_decoded_orMatrixOutputs_T_86,_decoded_decoded_orMatrixOutputs_T_85,_decoded_decoded_orMatrixOutputs_T_84,
    _decoded_decoded_orMatrixOutputs_T_83,_decoded_decoded_orMatrixOutputs_T_82,
    decoded_decoded_orMatrixOutputs_hi_lo_lo_lo}; // @[Cat.scala 31:58]
  wire [9:0] decoded_decoded_orMatrixOutputs_hi_lo_hi_hi = {_decoded_decoded_orMatrixOutputs_T_109,
    _decoded_decoded_orMatrixOutputs_T_108,_decoded_decoded_orMatrixOutputs_T_107,_decoded_decoded_orMatrixOutputs_T_106
    ,_decoded_decoded_orMatrixOutputs_T_105,_decoded_decoded_orMatrixOutputs_T_104,
    _decoded_decoded_orMatrixOutputs_T_103,_decoded_decoded_orMatrixOutputs_T_102,_decoded_decoded_orMatrixOutputs_T_101
    ,_decoded_decoded_orMatrixOutputs_T_100}; // @[Cat.scala 31:58]
  wire [18:0] decoded_decoded_orMatrixOutputs_hi_lo_hi = {decoded_decoded_orMatrixOutputs_hi_lo_hi_hi,
    _decoded_decoded_orMatrixOutputs_T_99,_decoded_decoded_orMatrixOutputs_T_98,_decoded_decoded_orMatrixOutputs_T_97,
    _decoded_decoded_orMatrixOutputs_T_96,_decoded_decoded_orMatrixOutputs_T_95,_decoded_decoded_orMatrixOutputs_T_94,
    _decoded_decoded_orMatrixOutputs_T_93,_decoded_decoded_orMatrixOutputs_T_92,_decoded_decoded_orMatrixOutputs_T_91}; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_orMatrixOutputs_hi_hi_lo_lo = {_decoded_decoded_orMatrixOutputs_T_118,
    _decoded_decoded_orMatrixOutputs_T_117,_decoded_decoded_orMatrixOutputs_T_116,_decoded_decoded_orMatrixOutputs_T_115
    ,_decoded_decoded_orMatrixOutputs_T_114,_decoded_decoded_orMatrixOutputs_T_113,
    _decoded_decoded_orMatrixOutputs_T_112,_decoded_decoded_orMatrixOutputs_T_111,_decoded_decoded_orMatrixOutputs_T_110
    }; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_orMatrixOutputs_hi_hi_lo = {_decoded_decoded_orMatrixOutputs_T_127,
    _decoded_decoded_orMatrixOutputs_T_126,_decoded_decoded_orMatrixOutputs_T_125,_decoded_decoded_orMatrixOutputs_T_124
    ,_decoded_decoded_orMatrixOutputs_T_123,_decoded_decoded_orMatrixOutputs_T_122,
    _decoded_decoded_orMatrixOutputs_T_121,_decoded_decoded_orMatrixOutputs_T_120,_decoded_decoded_orMatrixOutputs_T_119
    ,decoded_decoded_orMatrixOutputs_hi_hi_lo_lo}; // @[Cat.scala 31:58]
  wire [9:0] decoded_decoded_orMatrixOutputs_hi_hi_hi_hi = {_decoded_decoded_orMatrixOutputs_T_146,
    _decoded_decoded_orMatrixOutputs_T_145,_decoded_decoded_orMatrixOutputs_T_144,_decoded_decoded_orMatrixOutputs_T_143
    ,_decoded_decoded_orMatrixOutputs_T_142,_decoded_decoded_orMatrixOutputs_T_141,
    _decoded_decoded_orMatrixOutputs_T_140,_decoded_decoded_orMatrixOutputs_T_139,_decoded_decoded_orMatrixOutputs_T_138
    ,_decoded_decoded_orMatrixOutputs_T_137}; // @[Cat.scala 31:58]
  wire [18:0] decoded_decoded_orMatrixOutputs_hi_hi_hi = {decoded_decoded_orMatrixOutputs_hi_hi_hi_hi,
    _decoded_decoded_orMatrixOutputs_T_136,_decoded_decoded_orMatrixOutputs_T_135,_decoded_decoded_orMatrixOutputs_T_134
    ,_decoded_decoded_orMatrixOutputs_T_133,_decoded_decoded_orMatrixOutputs_T_132,
    _decoded_decoded_orMatrixOutputs_T_131,_decoded_decoded_orMatrixOutputs_T_130,_decoded_decoded_orMatrixOutputs_T_129
    ,_decoded_decoded_orMatrixOutputs_T_128}; // @[Cat.scala 31:58]
  wire [146:0] decoded_decoded_orMatrixOutputs = {decoded_decoded_orMatrixOutputs_hi_hi_hi,
    decoded_decoded_orMatrixOutputs_hi_hi_lo,decoded_decoded_orMatrixOutputs_hi_lo_hi,
    decoded_decoded_orMatrixOutputs_hi_lo_lo,decoded_decoded_orMatrixOutputs_lo_hi_hi,
    decoded_decoded_orMatrixOutputs_lo_hi_lo,decoded_decoded_orMatrixOutputs_lo_lo_hi,
    decoded_decoded_orMatrixOutputs_lo_lo_lo}; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_invMatrixOutputs_lo_lo_lo_lo = {decoded_decoded_orMatrixOutputs[8],
    decoded_decoded_orMatrixOutputs[7],decoded_decoded_orMatrixOutputs[6],decoded_decoded_orMatrixOutputs[5],
    decoded_decoded_orMatrixOutputs[4],decoded_decoded_orMatrixOutputs[3],decoded_decoded_orMatrixOutputs[2],
    decoded_decoded_orMatrixOutputs[1],decoded_decoded_orMatrixOutputs[0]}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_invMatrixOutputs_lo_lo_lo = {decoded_decoded_orMatrixOutputs[17],
    decoded_decoded_orMatrixOutputs[16],decoded_decoded_orMatrixOutputs[15],decoded_decoded_orMatrixOutputs[14],
    decoded_decoded_orMatrixOutputs[13],decoded_decoded_orMatrixOutputs[12],decoded_decoded_orMatrixOutputs[11],
    decoded_decoded_orMatrixOutputs[10],decoded_decoded_orMatrixOutputs[9],decoded_decoded_invMatrixOutputs_lo_lo_lo_lo}
    ; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_invMatrixOutputs_lo_lo_hi_lo = {decoded_decoded_orMatrixOutputs[26],
    decoded_decoded_orMatrixOutputs[25],decoded_decoded_orMatrixOutputs[24],decoded_decoded_orMatrixOutputs[23],
    decoded_decoded_orMatrixOutputs[22],decoded_decoded_orMatrixOutputs[21],decoded_decoded_orMatrixOutputs[20],
    decoded_decoded_orMatrixOutputs[19],decoded_decoded_orMatrixOutputs[18]}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_invMatrixOutputs_lo_lo_hi = {decoded_decoded_orMatrixOutputs[35],
    decoded_decoded_orMatrixOutputs[34],decoded_decoded_orMatrixOutputs[33],decoded_decoded_orMatrixOutputs[32],
    decoded_decoded_orMatrixOutputs[31],decoded_decoded_orMatrixOutputs[30],decoded_decoded_orMatrixOutputs[29],
    decoded_decoded_orMatrixOutputs[28],decoded_decoded_orMatrixOutputs[27],decoded_decoded_invMatrixOutputs_lo_lo_hi_lo
    }; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_invMatrixOutputs_lo_hi_lo_lo = {decoded_decoded_orMatrixOutputs[44],
    decoded_decoded_orMatrixOutputs[43],decoded_decoded_orMatrixOutputs[42],decoded_decoded_orMatrixOutputs[41],
    decoded_decoded_orMatrixOutputs[40],decoded_decoded_orMatrixOutputs[39],decoded_decoded_orMatrixOutputs[38],
    decoded_decoded_orMatrixOutputs[37],decoded_decoded_orMatrixOutputs[36]}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_invMatrixOutputs_lo_hi_lo = {decoded_decoded_orMatrixOutputs[53],
    decoded_decoded_orMatrixOutputs[52],decoded_decoded_orMatrixOutputs[51],decoded_decoded_orMatrixOutputs[50],
    decoded_decoded_orMatrixOutputs[49],decoded_decoded_orMatrixOutputs[48],decoded_decoded_orMatrixOutputs[47],
    decoded_decoded_orMatrixOutputs[46],decoded_decoded_orMatrixOutputs[45],decoded_decoded_invMatrixOutputs_lo_hi_lo_lo
    }; // @[Cat.scala 31:58]
  wire [9:0] decoded_decoded_invMatrixOutputs_lo_hi_hi_hi = {decoded_decoded_orMatrixOutputs[72],
    decoded_decoded_orMatrixOutputs[71],decoded_decoded_orMatrixOutputs[70],decoded_decoded_orMatrixOutputs[69],
    decoded_decoded_orMatrixOutputs[68],decoded_decoded_orMatrixOutputs[67],decoded_decoded_orMatrixOutputs[66],
    decoded_decoded_orMatrixOutputs[65],decoded_decoded_orMatrixOutputs[64],decoded_decoded_orMatrixOutputs[63]}; // @[Cat.scala 31:58]
  wire [18:0] decoded_decoded_invMatrixOutputs_lo_hi_hi = {decoded_decoded_invMatrixOutputs_lo_hi_hi_hi,
    decoded_decoded_orMatrixOutputs[62],decoded_decoded_orMatrixOutputs[61],decoded_decoded_orMatrixOutputs[60],
    decoded_decoded_orMatrixOutputs[59],decoded_decoded_orMatrixOutputs[58],decoded_decoded_orMatrixOutputs[57],
    decoded_decoded_orMatrixOutputs[56],decoded_decoded_orMatrixOutputs[55],decoded_decoded_orMatrixOutputs[54]}; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_invMatrixOutputs_hi_lo_lo_lo = {decoded_decoded_orMatrixOutputs[81],
    decoded_decoded_orMatrixOutputs[80],decoded_decoded_orMatrixOutputs[79],decoded_decoded_orMatrixOutputs[78],
    decoded_decoded_orMatrixOutputs[77],decoded_decoded_orMatrixOutputs[76],decoded_decoded_orMatrixOutputs[75],
    decoded_decoded_orMatrixOutputs[74],decoded_decoded_orMatrixOutputs[73]}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_invMatrixOutputs_hi_lo_lo = {decoded_decoded_orMatrixOutputs[90],
    decoded_decoded_orMatrixOutputs[89],decoded_decoded_orMatrixOutputs[88],decoded_decoded_orMatrixOutputs[87],
    decoded_decoded_orMatrixOutputs[86],decoded_decoded_orMatrixOutputs[85],decoded_decoded_orMatrixOutputs[84],
    decoded_decoded_orMatrixOutputs[83],decoded_decoded_orMatrixOutputs[82],decoded_decoded_invMatrixOutputs_hi_lo_lo_lo
    }; // @[Cat.scala 31:58]
  wire [9:0] decoded_decoded_invMatrixOutputs_hi_lo_hi_hi = {decoded_decoded_orMatrixOutputs[109],
    decoded_decoded_orMatrixOutputs[108],decoded_decoded_orMatrixOutputs[107],decoded_decoded_orMatrixOutputs[106],
    decoded_decoded_orMatrixOutputs[105],decoded_decoded_orMatrixOutputs[104],decoded_decoded_orMatrixOutputs[103],
    decoded_decoded_orMatrixOutputs[102],decoded_decoded_orMatrixOutputs[101],decoded_decoded_orMatrixOutputs[100]}; // @[Cat.scala 31:58]
  wire [18:0] decoded_decoded_invMatrixOutputs_hi_lo_hi = {decoded_decoded_invMatrixOutputs_hi_lo_hi_hi,
    decoded_decoded_orMatrixOutputs[99],decoded_decoded_orMatrixOutputs[98],decoded_decoded_orMatrixOutputs[97],
    decoded_decoded_orMatrixOutputs[96],decoded_decoded_orMatrixOutputs[95],decoded_decoded_orMatrixOutputs[94],
    decoded_decoded_orMatrixOutputs[93],decoded_decoded_orMatrixOutputs[92],decoded_decoded_orMatrixOutputs[91]}; // @[Cat.scala 31:58]
  wire [8:0] decoded_decoded_invMatrixOutputs_hi_hi_lo_lo = {decoded_decoded_orMatrixOutputs[118],
    decoded_decoded_orMatrixOutputs[117],decoded_decoded_orMatrixOutputs[116],decoded_decoded_orMatrixOutputs[115],
    decoded_decoded_orMatrixOutputs[114],decoded_decoded_orMatrixOutputs[113],decoded_decoded_orMatrixOutputs[112],
    decoded_decoded_orMatrixOutputs[111],decoded_decoded_orMatrixOutputs[110]}; // @[Cat.scala 31:58]
  wire [17:0] decoded_decoded_invMatrixOutputs_hi_hi_lo = {decoded_decoded_orMatrixOutputs[127],
    decoded_decoded_orMatrixOutputs[126],decoded_decoded_orMatrixOutputs[125],decoded_decoded_orMatrixOutputs[124],
    decoded_decoded_orMatrixOutputs[123],decoded_decoded_orMatrixOutputs[122],decoded_decoded_orMatrixOutputs[121],
    decoded_decoded_orMatrixOutputs[120],decoded_decoded_orMatrixOutputs[119],
    decoded_decoded_invMatrixOutputs_hi_hi_lo_lo}; // @[Cat.scala 31:58]
  wire [9:0] decoded_decoded_invMatrixOutputs_hi_hi_hi_hi = {decoded_decoded_orMatrixOutputs[146],
    decoded_decoded_orMatrixOutputs[145],decoded_decoded_orMatrixOutputs[144],decoded_decoded_orMatrixOutputs[143],
    decoded_decoded_orMatrixOutputs[142],decoded_decoded_orMatrixOutputs[141],decoded_decoded_orMatrixOutputs[140],
    decoded_decoded_orMatrixOutputs[139],decoded_decoded_orMatrixOutputs[138],decoded_decoded_orMatrixOutputs[137]}; // @[Cat.scala 31:58]
  wire [18:0] decoded_decoded_invMatrixOutputs_hi_hi_hi = {decoded_decoded_invMatrixOutputs_hi_hi_hi_hi,
    decoded_decoded_orMatrixOutputs[136],decoded_decoded_orMatrixOutputs[135],decoded_decoded_orMatrixOutputs[134],
    decoded_decoded_orMatrixOutputs[133],decoded_decoded_orMatrixOutputs[132],decoded_decoded_orMatrixOutputs[131],
    decoded_decoded_orMatrixOutputs[130],decoded_decoded_orMatrixOutputs[129],decoded_decoded_orMatrixOutputs[128]}; // @[Cat.scala 31:58]
  wire [146:0] decoded_decoded_invMatrixOutputs = {decoded_decoded_invMatrixOutputs_hi_hi_hi,
    decoded_decoded_invMatrixOutputs_hi_hi_lo,decoded_decoded_invMatrixOutputs_hi_lo_hi,
    decoded_decoded_invMatrixOutputs_hi_lo_lo,decoded_decoded_invMatrixOutputs_lo_hi_hi,
    decoded_decoded_invMatrixOutputs_lo_hi_lo,decoded_decoded_invMatrixOutputs_lo_lo_hi,
    decoded_decoded_invMatrixOutputs_lo_lo_lo}; // @[Cat.scala 31:58]
  wire  decoded_1 = decoded_decoded_invMatrixOutputs[145]; // @[Decode.scala 50:77]
  wire  decoded_2 = decoded_decoded_invMatrixOutputs[144]; // @[Decode.scala 50:77]
  wire  decoded_4 = decoded_decoded_invMatrixOutputs[142]; // @[Decode.scala 50:77]
  wire  decoded_5 = decoded_decoded_invMatrixOutputs[141]; // @[Decode.scala 50:77]
  wire  decoded_6 = decoded_decoded_invMatrixOutputs[140]; // @[Decode.scala 50:77]
  wire  decoded_7 = decoded_decoded_invMatrixOutputs[139]; // @[Decode.scala 50:77]
  wire  decoded_8 = decoded_decoded_invMatrixOutputs[138]; // @[Decode.scala 50:77]
  wire  decoded_9 = decoded_decoded_invMatrixOutputs[137]; // @[Decode.scala 50:77]
  wire  decoded_10 = decoded_decoded_invMatrixOutputs[136]; // @[Decode.scala 50:77]
  wire  decoded_11 = decoded_decoded_invMatrixOutputs[135]; // @[Decode.scala 50:77]
  wire  decoded_12 = decoded_decoded_invMatrixOutputs[134]; // @[Decode.scala 50:77]
  wire  decoded_13 = decoded_decoded_invMatrixOutputs[133]; // @[Decode.scala 50:77]
  wire  decoded_14 = decoded_decoded_invMatrixOutputs[132]; // @[Decode.scala 50:77]
  wire  decoded_15 = decoded_decoded_invMatrixOutputs[131]; // @[Decode.scala 50:77]
  wire  decoded_16 = decoded_decoded_invMatrixOutputs[130]; // @[Decode.scala 50:77]
  wire  decoded_17 = decoded_decoded_invMatrixOutputs[129]; // @[Decode.scala 50:77]
  wire  decoded_18 = decoded_decoded_invMatrixOutputs[128]; // @[Decode.scala 50:77]
  wire  decoded_19 = decoded_decoded_invMatrixOutputs[127]; // @[Decode.scala 50:77]
  wire  decoded_20 = decoded_decoded_invMatrixOutputs[126]; // @[Decode.scala 50:77]
  wire  decoded_21 = decoded_decoded_invMatrixOutputs[125]; // @[Decode.scala 50:77]
  wire  decoded_22 = decoded_decoded_invMatrixOutputs[124]; // @[Decode.scala 50:77]
  wire  decoded_110 = decoded_decoded_invMatrixOutputs[36]; // @[Decode.scala 50:77]
  wire  decoded_111 = decoded_decoded_invMatrixOutputs[35]; // @[Decode.scala 50:77]
  wire  decoded_112 = decoded_decoded_invMatrixOutputs[34]; // @[Decode.scala 50:77]
  wire  decoded_113 = decoded_decoded_invMatrixOutputs[33]; // @[Decode.scala 50:77]
  wire  decoded_114 = decoded_decoded_invMatrixOutputs[32]; // @[Decode.scala 50:77]
  wire  decoded_115 = decoded_decoded_invMatrixOutputs[31]; // @[Decode.scala 50:77]
  wire  decoded_116 = decoded_decoded_invMatrixOutputs[30]; // @[Decode.scala 50:77]
  wire  decoded_117 = decoded_decoded_invMatrixOutputs[29]; // @[Decode.scala 50:77]
  wire  decoded_118 = decoded_decoded_invMatrixOutputs[28]; // @[Decode.scala 50:77]
  wire  decoded_119 = decoded_decoded_invMatrixOutputs[27]; // @[Decode.scala 50:77]
  wire  decoded_120 = decoded_decoded_invMatrixOutputs[26]; // @[Decode.scala 50:77]
  wire  decoded_121 = decoded_decoded_invMatrixOutputs[25]; // @[Decode.scala 50:77]
  wire  decoded_122 = decoded_decoded_invMatrixOutputs[24]; // @[Decode.scala 50:77]
  wire  decoded_123 = decoded_decoded_invMatrixOutputs[23]; // @[Decode.scala 50:77]
  wire  decoded_124 = decoded_decoded_invMatrixOutputs[22]; // @[Decode.scala 50:77]
  wire  decoded_125 = decoded_decoded_invMatrixOutputs[21]; // @[Decode.scala 50:77]
  wire  decoded_127 = decoded_decoded_invMatrixOutputs[19]; // @[Decode.scala 50:77]
  wire  decoded_128 = decoded_decoded_invMatrixOutputs[18]; // @[Decode.scala 50:77]
  wire  decoded_129 = decoded_decoded_invMatrixOutputs[17]; // @[Decode.scala 50:77]
  wire  decoded_130 = decoded_decoded_invMatrixOutputs[16]; // @[Decode.scala 50:77]
  wire  decoded_131 = decoded_decoded_invMatrixOutputs[15]; // @[Decode.scala 50:77]
  wire  decoded_132 = decoded_decoded_invMatrixOutputs[14]; // @[Decode.scala 50:77]
  wire  decoded_133 = decoded_decoded_invMatrixOutputs[13]; // @[Decode.scala 50:77]
  wire  decoded_134 = decoded_decoded_invMatrixOutputs[12]; // @[Decode.scala 50:77]
  wire  decoded_143 = decoded_decoded_invMatrixOutputs[3]; // @[Decode.scala 50:77]
  wire  decoded_144 = decoded_decoded_invMatrixOutputs[2]; // @[Decode.scala 50:77]
  wire  decoded_146 = decoded_decoded_invMatrixOutputs[0]; // @[Decode.scala 50:77]
  wire [63:0] _wdata_T_1 = io_rw_cmd[1] ? io_rw_rdata : 64'h0; // @[CSR.scala 1543:9]
  wire [63:0] _wdata_T_2 = _wdata_T_1 | io_rw_wdata; // @[CSR.scala 1543:34]
  wire [63:0] _wdata_T_5 = &io_rw_cmd[1:0] ? io_rw_wdata : 64'h0; // @[CSR.scala 1543:49]
  wire [63:0] _wdata_T_6 = ~_wdata_T_5; // @[CSR.scala 1543:45]
  wire [63:0] wdata = _wdata_T_2 & _wdata_T_6; // @[CSR.scala 1543:43]
  wire  insn_cease = system_insn & decoded_invMatrixOutputs[5]; // @[CSR.scala 831:83]
  wire  insn_wfi = system_insn & decoded_invMatrixOutputs[4]; // @[CSR.scala 831:83]
  wire [11:0] addr_1 = io_decode_0_inst[31:20]; // @[CSR.scala 835:27]
  wire [31:0] decoded_invInputs_1 = ~io_decode_0_inst; // @[pla.scala 78:21]
  wire  decoded_andMatrixInput_0_7 = decoded_invInputs_1[20]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_1_7 = decoded_invInputs_1[21]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_2_6 = decoded_invInputs_1[22]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_3_6 = decoded_invInputs_1[23]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_4_6 = decoded_invInputs_1[24]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_5_6 = decoded_invInputs_1[25]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_6_6 = decoded_invInputs_1[26]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_7_6 = decoded_invInputs_1[27]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_8_6 = decoded_invInputs_1[28]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_9_6 = decoded_invInputs_1[29]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_10_3 = decoded_invInputs_1[30]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_11_3 = decoded_invInputs_1[31]; // @[pla.scala 91:29]
  wire [5:0] decoded_lo_6 = {decoded_andMatrixInput_6_6,decoded_andMatrixInput_7_6,decoded_andMatrixInput_8_6,
    decoded_andMatrixInput_9_6,decoded_andMatrixInput_10_3,decoded_andMatrixInput_11_3}; // @[Cat.scala 31:58]
  wire [11:0] _decoded_T_14 = {decoded_andMatrixInput_0_7,decoded_andMatrixInput_1_7,decoded_andMatrixInput_2_6,
    decoded_andMatrixInput_3_6,decoded_andMatrixInput_4_6,decoded_andMatrixInput_5_6,decoded_lo_6}; // @[Cat.scala 31:58]
  wire  _decoded_T_15 = &_decoded_T_14; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_8 = io_decode_0_inst[20]; // @[pla.scala 90:45]
  wire [11:0] _decoded_T_16 = {decoded_andMatrixInput_0_8,decoded_andMatrixInput_1_7,decoded_andMatrixInput_2_6,
    decoded_andMatrixInput_3_6,decoded_andMatrixInput_4_6,decoded_andMatrixInput_5_6,decoded_lo_6}; // @[Cat.scala 31:58]
  wire  _decoded_T_17 = &_decoded_T_16; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_9 = io_decode_0_inst[0]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_7_8 = io_decode_0_inst[28]; // @[pla.scala 90:45]
  wire [9:0] _decoded_T_18 = {decoded_andMatrixInput_0_9,decoded_andMatrixInput_2_6,decoded_andMatrixInput_3_6,
    decoded_andMatrixInput_4_6,decoded_andMatrixInput_5_6,decoded_andMatrixInput_6_6,decoded_andMatrixInput_7_6,
    decoded_andMatrixInput_7_8,decoded_andMatrixInput_10_3,decoded_andMatrixInput_11_3}; // @[Cat.scala 31:58]
  wire  _decoded_T_19 = &_decoded_T_18; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_10 = io_decode_0_inst[22]; // @[pla.scala 90:45]
  wire [9:0] _decoded_T_20 = {decoded_andMatrixInput_0_10,decoded_andMatrixInput_3_6,decoded_andMatrixInput_4_6,
    decoded_andMatrixInput_5_6,decoded_andMatrixInput_6_6,decoded_andMatrixInput_7_6,decoded_andMatrixInput_7_8,
    decoded_andMatrixInput_9_6,decoded_andMatrixInput_10_3,decoded_andMatrixInput_11_3}; // @[Cat.scala 31:58]
  wire  _decoded_T_21 = &_decoded_T_20; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_1_11 = io_decode_0_inst[1]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_2_10 = decoded_invInputs_1[2]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_3_10 = decoded_invInputs_1[3]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_4_10 = io_decode_0_inst[4]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_5_10 = io_decode_0_inst[5]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_6_10 = io_decode_0_inst[6]; // @[pla.scala 90:45]
  wire  decoded_andMatrixInput_7_10 = decoded_invInputs_1[7]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_8_10 = decoded_invInputs_1[8]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_9_10 = decoded_invInputs_1[9]; // @[pla.scala 91:29]
  wire  decoded_andMatrixInput_10_5 = io_decode_0_inst[25]; // @[pla.scala 90:45]
  wire [7:0] decoded_lo_10 = {decoded_andMatrixInput_9_10,decoded_andMatrixInput_10_5,decoded_andMatrixInput_6_6,
    decoded_andMatrixInput_7_6,decoded_andMatrixInput_7_8,decoded_andMatrixInput_9_6,decoded_andMatrixInput_10_3,
    decoded_andMatrixInput_11_3}; // @[Cat.scala 31:58]
  wire [16:0] _decoded_T_22 = {decoded_andMatrixInput_0_9,decoded_andMatrixInput_1_11,decoded_andMatrixInput_2_10,
    decoded_andMatrixInput_3_10,decoded_andMatrixInput_4_10,decoded_andMatrixInput_5_10,decoded_andMatrixInput_6_10,
    decoded_andMatrixInput_7_10,decoded_andMatrixInput_8_10,decoded_lo_10}; // @[Cat.scala 31:58]
  wire  _decoded_T_23 = &_decoded_T_22; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_7_11 = io_decode_0_inst[29]; // @[pla.scala 90:45]
  wire [9:0] _decoded_T_24 = {decoded_andMatrixInput_0_10,decoded_andMatrixInput_3_6,decoded_andMatrixInput_4_6,
    decoded_andMatrixInput_5_6,decoded_andMatrixInput_6_6,decoded_andMatrixInput_7_6,decoded_andMatrixInput_7_8,
    decoded_andMatrixInput_7_11,decoded_andMatrixInput_10_3,decoded_andMatrixInput_11_3}; // @[Cat.scala 31:58]
  wire  _decoded_T_25 = &_decoded_T_24; // @[pla.scala 98:74]
  wire  decoded_andMatrixInput_0_13 = io_decode_0_inst[30]; // @[pla.scala 90:45]
  wire [1:0] _decoded_T_26 = {decoded_andMatrixInput_0_13,decoded_andMatrixInput_11_3}; // @[Cat.scala 31:58]
  wire  _decoded_T_27 = &_decoded_T_26; // @[pla.scala 98:74]
  wire  _decoded_orMatrixOutputs_T_7 = |_decoded_T_23; // @[pla.scala 114:39]
  wire  _decoded_orMatrixOutputs_T_8 = |_decoded_T_21; // @[pla.scala 114:39]
  wire  _decoded_orMatrixOutputs_T_9 = |_decoded_T_25; // @[pla.scala 114:39]
  wire [1:0] _decoded_orMatrixOutputs_T_10 = {_decoded_T_19,_decoded_T_27}; // @[Cat.scala 31:58]
  wire  _decoded_orMatrixOutputs_T_11 = |_decoded_orMatrixOutputs_T_10; // @[pla.scala 114:39]
  wire  _decoded_orMatrixOutputs_T_12 = |_decoded_T_17; // @[pla.scala 114:39]
  wire  _decoded_orMatrixOutputs_T_13 = |_decoded_T_15; // @[pla.scala 114:39]
  wire [8:0] decoded_orMatrixOutputs_1 = {_decoded_orMatrixOutputs_T_13,_decoded_orMatrixOutputs_T_12,
    _decoded_orMatrixOutputs_T_11,_decoded_orMatrixOutputs_T_9,_decoded_orMatrixOutputs_T_8,_decoded_orMatrixOutputs_T_7
    ,1'h0,2'h0}; // @[Cat.scala 31:58]
  wire [8:0] decoded_invMatrixOutputs_1 = {decoded_orMatrixOutputs_1[8],decoded_orMatrixOutputs_1[7],
    decoded_orMatrixOutputs_1[6],decoded_orMatrixOutputs_1[5],decoded_orMatrixOutputs_1[4],decoded_orMatrixOutputs_1[3],
    decoded_orMatrixOutputs_1[2],decoded_orMatrixOutputs_1[1],decoded_orMatrixOutputs_1[0]}; // @[Cat.scala 31:58]
  wire  is_ret = decoded_invMatrixOutputs_1[6]; // @[Decode.scala 50:77]
  wire  is_wfi = decoded_invMatrixOutputs_1[4]; // @[Decode.scala 50:77]
  wire  is_sfence = decoded_invMatrixOutputs_1[3]; // @[Decode.scala 50:77]
  wire  is_hfence_gvma = decoded_invMatrixOutputs_1[1]; // @[Decode.scala 50:77]
  wire  is_hlsv = decoded_invMatrixOutputs_1[0]; // @[Decode.scala 50:77]
  wire  _is_counter_T_2 = addr_1 >= 12'hc00 & addr_1 < 12'hc20; // @[package.scala 204:55]
  wire  _is_counter_T_5 = addr_1 >= 12'hc80 & addr_1 < 12'hca0; // @[package.scala 204:55]
  wire  is_counter = _is_counter_T_2 | _is_counter_T_5; // @[CSR.scala 842:75]
  wire  _allow_wfi_T = reg_mstatus_prv > 2'h1; // @[CSR.scala 844:63]
  wire  allow_wfi = reg_mstatus_prv > 2'h1 | ~reg_mstatus_tw; // @[CSR.scala 844:71]
  wire  allow_sfence_vma = _allow_wfi_T | ~reg_mstatus_tvm; // @[CSR.scala 845:70]
  wire  _allow_hfence_vvma_T_1 = reg_mstatus_prv >= 2'h1; // @[CSR.scala 846:90]
  wire  allow_sret = _allow_wfi_T | ~reg_mstatus_tsr; // @[CSR.scala 848:72]
  wire [4:0] counter_addr = addr_1[4:0]; // @[CSR.scala 849:28]
  wire [31:0] _allow_counter_T_1 = read_mcounteren >> counter_addr; // @[CSR.scala 850:68]
  wire [31:0] _allow_counter_T_6 = read_scounteren >> counter_addr; // @[CSR.scala 851:71]
  wire  _allow_counter_T_8 = _allow_hfence_vvma_T_1 | _allow_counter_T_6[0]; // @[CSR.scala 851:53]
  wire  allow_counter = (_allow_wfi_T | _allow_counter_T_1[0]) & _allow_counter_T_8; // @[CSR.scala 850:84]
  wire [11:0] io_decode_0_fp_csr_invInputs = ~addr_1; // @[pla.scala 78:21]
  wire  io_decode_0_fp_csr_andMatrixInput_0 = io_decode_0_fp_csr_invInputs[8]; // @[pla.scala 91:29]
  wire  io_decode_0_fp_csr_andMatrixInput_1 = io_decode_0_fp_csr_invInputs[9]; // @[pla.scala 91:29]
  wire  io_decode_0_fp_csr_andMatrixInput_2 = io_decode_0_fp_csr_invInputs[10]; // @[pla.scala 91:29]
  wire  io_decode_0_fp_csr_andMatrixInput_3 = io_decode_0_fp_csr_invInputs[11]; // @[pla.scala 91:29]
  wire [3:0] _io_decode_0_fp_csr_T = {io_decode_0_fp_csr_andMatrixInput_0,io_decode_0_fp_csr_andMatrixInput_1,
    io_decode_0_fp_csr_andMatrixInput_2,io_decode_0_fp_csr_andMatrixInput_3}; // @[Cat.scala 31:58]
  wire  _io_decode_0_fp_csr_T_1 = &_io_decode_0_fp_csr_T; // @[pla.scala 98:74]
  wire  csr_addr_legal = reg_mstatus_prv >= addr_1[9:8]; // @[CSR.scala 857:42]
  wire  _csr_exists_T_15 = addr_1 == 12'h7b1; // @[CSR.scala 837:93]
  wire  _csr_exists_T_119 = addr_1 == 12'h180; // @[CSR.scala 837:93]
  wire  _csr_exists_T_161 = addr_1 == 12'h7a0 | addr_1 == 12'h7a1 | addr_1 == 12'h7a2 | addr_1 == 12'h7a3 | addr_1 == 12'h301
     | addr_1 == 12'h300 | addr_1 == 12'h305 | addr_1 == 12'h344 | addr_1 == 12'h304 | addr_1 == 12'h340 | addr_1 == 12'h341
     | addr_1 == 12'h343 | addr_1 == 12'h342 | addr_1 == 12'hf14 | addr_1 == 12'h7b0 | _csr_exists_T_15; // @[CSR.scala 837:109]
  wire  _csr_exists_T_176 = _csr_exists_T_161 | addr_1 == 12'h7b2 | addr_1 == 12'h1 | addr_1 == 12'h2 | addr_1 == 12'h3
     | addr_1 == 12'h320 | addr_1 == 12'hb00 | addr_1 == 12'hb02 | addr_1 == 12'h323 | addr_1 == 12'hb03 | addr_1 == 12'hc03
     | addr_1 == 12'h324 | addr_1 == 12'hb04 | addr_1 == 12'hc04 | addr_1 == 12'h325 | addr_1 == 12'hb05; // @[CSR.scala 837:109]
  wire  _csr_exists_T_191 = _csr_exists_T_176 | addr_1 == 12'hc05 | addr_1 == 12'h326 | addr_1 == 12'hb06 | addr_1 == 12'hc06
     | addr_1 == 12'h327 | addr_1 == 12'hb07 | addr_1 == 12'hc07 | addr_1 == 12'h328 | addr_1 == 12'hb08 | addr_1 == 12'hc08
     | addr_1 == 12'h329 | addr_1 == 12'hb09 | addr_1 == 12'hc09 | addr_1 == 12'h32a | addr_1 == 12'hb0a; // @[CSR.scala 837:109]
  wire  _csr_exists_T_206 = _csr_exists_T_191 | addr_1 == 12'hc0a | addr_1 == 12'h32b | addr_1 == 12'hb0b | addr_1 == 12'hc0b
     | addr_1 == 12'h32c | addr_1 == 12'hb0c | addr_1 == 12'hc0c | addr_1 == 12'h32d | addr_1 == 12'hb0d | addr_1 == 12'hc0d
     | addr_1 == 12'h32e | addr_1 == 12'hb0e | addr_1 == 12'hc0e | addr_1 == 12'h32f | addr_1 == 12'hb0f; // @[CSR.scala 837:109]
  wire  _csr_exists_T_221 = _csr_exists_T_206 | addr_1 == 12'hc0f | addr_1 == 12'h330 | addr_1 == 12'hb10 | addr_1 == 12'hc10
     | addr_1 == 12'h331 | addr_1 == 12'hb11 | addr_1 == 12'hc11 | addr_1 == 12'h332 | addr_1 == 12'hb12 | addr_1 == 12'hc12
     | addr_1 == 12'h333 | addr_1 == 12'hb13 | addr_1 == 12'hc13 | addr_1 == 12'h334 | addr_1 == 12'hb14; // @[CSR.scala 837:109]
  wire  _csr_exists_T_236 = _csr_exists_T_221 | addr_1 == 12'hc14 | addr_1 == 12'h335 | addr_1 == 12'hb15 | addr_1 == 12'hc15
     | addr_1 == 12'h336 | addr_1 == 12'hb16 | addr_1 == 12'hc16 | addr_1 == 12'h337 | addr_1 == 12'hb17 | addr_1 == 12'hc17
     | addr_1 == 12'h338 | addr_1 == 12'hb18 | addr_1 == 12'hc18 | addr_1 == 12'h339 | addr_1 == 12'hb19; // @[CSR.scala 837:109]
  wire  _csr_exists_T_251 = _csr_exists_T_236 | addr_1 == 12'hc19 | addr_1 == 12'h33a | addr_1 == 12'hb1a | addr_1 == 12'hc1a
     | addr_1 == 12'h33b | addr_1 == 12'hb1b | addr_1 == 12'hc1b | addr_1 == 12'h33c | addr_1 == 12'hb1c | addr_1 == 12'hc1c
     | addr_1 == 12'h33d | addr_1 == 12'hb1d | addr_1 == 12'hc1d | addr_1 == 12'h33e | addr_1 == 12'hb1e; // @[CSR.scala 837:109]
  wire  _csr_exists_T_266 = _csr_exists_T_251 | addr_1 == 12'hc1e | addr_1 == 12'h33f | addr_1 == 12'hb1f | addr_1 == 12'hc1f
     | addr_1 == 12'h306 | addr_1 == 12'hc00 | addr_1 == 12'hc02 | addr_1 == 12'h100 | addr_1 == 12'h144 | addr_1 == 12'h104
     | addr_1 == 12'h140 | addr_1 == 12'h142 | addr_1 == 12'h143 | addr_1 == 12'h180 | addr_1 == 12'h141; // @[CSR.scala 837:109]
  wire  _csr_exists_T_281 = _csr_exists_T_266 | addr_1 == 12'h105 | addr_1 == 12'h106 | addr_1 == 12'h303 | addr_1 == 12'h302
     | addr_1 == 12'h3a0 | addr_1 == 12'h3a2 | addr_1 == 12'h3b0 | addr_1 == 12'h3b1 | addr_1 == 12'h3b2 | addr_1 == 12'h3b3
     | addr_1 == 12'h3b4 | addr_1 == 12'h3b5 | addr_1 == 12'h3b6 | addr_1 == 12'h3b7 | addr_1 == 12'h3b8; // @[CSR.scala 837:109]
  wire  csr_exists = _csr_exists_T_281 | addr_1 == 12'h3b9 | addr_1 == 12'h3ba | addr_1 == 12'h3bb | addr_1 == 12'h3bc
     | addr_1 == 12'h3bd | addr_1 == 12'h3be | addr_1 == 12'h3bf | addr_1 == 12'h7c1 | addr_1 == 12'hf12 | addr_1 == 12'hf11
     | addr_1 == 12'hf13; // @[CSR.scala 837:109]
  wire  _io_decode_0_read_illegal_T = ~csr_addr_legal; // @[CSR.scala 860:28]
  wire  _io_decode_0_read_illegal_T_1 = ~csr_exists; // @[CSR.scala 861:7]
  wire  _io_decode_0_read_illegal_T_2 = ~csr_addr_legal | _io_decode_0_read_illegal_T_1; // @[CSR.scala 860:44]
  wire  _io_decode_0_read_illegal_T_6 = ~allow_sfence_vma; // @[CSR.scala 862:55]
  wire  _io_decode_0_read_illegal_T_7 = (_csr_exists_T_119 | addr_1 == 12'h680) & ~allow_sfence_vma; // @[CSR.scala 862:52]
  wire  _io_decode_0_read_illegal_T_8 = _io_decode_0_read_illegal_T_2 | _io_decode_0_read_illegal_T_7; // @[CSR.scala 861:19]
  wire  _io_decode_0_read_illegal_T_10 = is_counter & ~allow_counter; // @[CSR.scala 863:18]
  wire  _io_decode_0_read_illegal_T_11 = _io_decode_0_read_illegal_T_8 | _io_decode_0_read_illegal_T_10; // @[CSR.scala 862:74]
  wire  io_decode_0_read_illegal_andMatrixInput_0 = addr_1[4]; // @[pla.scala 90:45]
  wire  io_decode_0_read_illegal_andMatrixInput_1 = addr_1[5]; // @[pla.scala 90:45]
  wire  io_decode_0_read_illegal_andMatrixInput_2 = io_decode_0_fp_csr_invInputs[6]; // @[pla.scala 91:29]
  wire  io_decode_0_read_illegal_andMatrixInput_3 = addr_1[7]; // @[pla.scala 90:45]
  wire  io_decode_0_read_illegal_andMatrixInput_4 = addr_1[8]; // @[pla.scala 90:45]
  wire  io_decode_0_read_illegal_andMatrixInput_5 = addr_1[9]; // @[pla.scala 90:45]
  wire  io_decode_0_read_illegal_andMatrixInput_6 = addr_1[10]; // @[pla.scala 90:45]
  wire [7:0] _io_decode_0_read_illegal_T_12 = {io_decode_0_read_illegal_andMatrixInput_0,
    io_decode_0_read_illegal_andMatrixInput_1,io_decode_0_read_illegal_andMatrixInput_2,
    io_decode_0_read_illegal_andMatrixInput_3,io_decode_0_read_illegal_andMatrixInput_4,
    io_decode_0_read_illegal_andMatrixInput_5,io_decode_0_read_illegal_andMatrixInput_6,
    io_decode_0_fp_csr_andMatrixInput_3}; // @[Cat.scala 31:58]
  wire  _io_decode_0_read_illegal_T_13 = &_io_decode_0_read_illegal_T_12; // @[pla.scala 98:74]
  wire  io_decode_0_read_illegal_orMatrixOutputs = |_io_decode_0_read_illegal_T_13; // @[pla.scala 114:39]
  wire  _io_decode_0_read_illegal_T_16 = io_decode_0_read_illegal_orMatrixOutputs & _T_297; // @[CSR.scala 864:42]
  wire  _io_decode_0_read_illegal_T_17 = _io_decode_0_read_illegal_T_11 | _io_decode_0_read_illegal_T_16; // @[CSR.scala 863:36]
  wire  _io_decode_0_read_illegal_T_21 = io_decode_0_fp_csr & io_decode_0_fp_illegal; // @[CSR.scala 866:21]
  wire [11:0] io_decode_0_write_flush_addr_m = addr_1 | 12'h300; // @[CSR.scala 869:25]
  wire  _io_decode_0_system_illegal_T_4 = is_wfi & ~allow_wfi; // @[CSR.scala 873:14]
  wire  _io_decode_0_system_illegal_T_5 = _io_decode_0_read_illegal_T & ~is_hlsv | _io_decode_0_system_illegal_T_4; // @[CSR.scala 872:58]
  wire  _io_decode_0_system_illegal_T_7 = is_ret & ~allow_sret; // @[CSR.scala 874:14]
  wire  _io_decode_0_system_illegal_T_8 = _io_decode_0_system_illegal_T_5 | _io_decode_0_system_illegal_T_7; // @[CSR.scala 873:28]
  wire  _io_decode_0_system_illegal_T_14 = is_ret & io_decode_0_read_illegal_andMatrixInput_6 &
    io_decode_0_read_illegal_andMatrixInput_3 & _T_297; // @[CSR.scala 875:37]
  wire  _io_decode_0_system_illegal_T_15 = _io_decode_0_system_illegal_T_8 | _io_decode_0_system_illegal_T_14; // @[CSR.scala 874:29]
  wire  _io_decode_0_system_illegal_T_18 = (is_sfence | is_hfence_gvma) & _io_decode_0_read_illegal_T_6; // @[CSR.scala 876:37]
  wire [11:0] _debugTVec_T = insn_break ? 12'h800 : 12'h808; // @[CSR.scala 905:37]
  wire [11:0] debugTVec = reg_debug ? _debugTVec_T : 12'h800; // @[CSR.scala 905:22]
  wire [63:0] notDebugTVec_base = delegate ? read_stvec : read_mtvec; // @[CSR.scala 914:19]
  wire [7:0] notDebugTVec_interruptOffset = {cause[5:0], 2'h0}; // @[CSR.scala 915:59]
  wire [63:0] notDebugTVec_interruptVec = {notDebugTVec_base[63:8],notDebugTVec_interruptOffset}; // @[Cat.scala 31:58]
  wire  notDebugTVec_doVector = notDebugTVec_base[0] & cause[63] & cause_lsbs[7:6] == 2'h0; // @[CSR.scala 917:55]
  wire [63:0] _notDebugTVec_T_1 = {notDebugTVec_base[63:2], 2'h0}; // @[CSR.scala 918:56]
  wire [63:0] notDebugTVec = notDebugTVec_doVector ? notDebugTVec_interruptVec : _notDebugTVec_T_1; // @[CSR.scala 918:8]
  wire [63:0] tvec = trapToDebug ? {{52'd0}, debugTVec} : notDebugTVec; // @[CSR.scala 931:17]
  wire [1:0] _T_265 = insn_ret + insn_call; // @[Bitwise.scala 48:55]
  wire [1:0] _T_267 = insn_break + io_exception; // @[Bitwise.scala 48:55]
  wire [2:0] _T_269 = _T_265 + _T_267; // @[Bitwise.scala 48:55]
  wire  _T_273 = ~reset; // @[CSR.scala 957:9]
  wire  _GEN_48 = insn_wfi & _io_interrupt_T & _T_297 | reg_wfi; // @[CSR.scala 539:50 959:{51,61}]
  wire  _GEN_50 = io_retire | exception | reg_singleStepped; // @[CSR.scala 454:30 963:{36,56}]
  wire [39:0] _epc_T = ~io_pc; // @[CSR.scala 1564:28]
  wire [39:0] _epc_T_1 = _epc_T | 40'h1; // @[CSR.scala 1564:31]
  wire [39:0] epc = ~_epc_T_1; // @[CSR.scala 1564:26]
  wire [1:0] _reg_dcsr_cause_T = causeIsDebugTrigger ? 2'h2 : 2'h1; // @[CSR.scala 976:86]
  wire [1:0] _reg_dcsr_cause_T_1 = causeIsDebugInt ? 2'h3 : _reg_dcsr_cause_T; // @[CSR.scala 976:56]
  wire [2:0] _reg_dcsr_cause_T_2 = reg_singleStepped ? 3'h4 : {{1'd0}, _reg_dcsr_cause_T_1}; // @[CSR.scala 976:30]
  wire  _GEN_53 = ~reg_debug | reg_debug; // @[CSR.scala 972:25 974:19 450:22]
  wire [39:0] _GEN_54 = ~reg_debug ? epc : reg_dpc; // @[CSR.scala 972:25 975:17 451:20]
  wire [1:0] _GEN_56 = ~reg_debug ? reg_mstatus_prv : reg_dcsr_prv; // @[CSR.scala 378:21 972:25 977:22]
  wire [39:0] _GEN_70 = delegate ? epc : reg_sepc; // @[CSR.scala 1000:35 1005:16 533:21]
  wire [63:0] _GEN_71 = delegate ? cause : reg_scause; // @[CSR.scala 1000:35 1006:18 534:23]
  wire [39:0] _GEN_72 = delegate ? io_tval : reg_stval; // @[CSR.scala 1000:35 1007:17 535:22]
  wire  _GEN_74 = delegate ? reg_mstatus_sie : reg_mstatus_spie; // @[CSR.scala 1000:35 1009:24 370:24]
  wire [1:0] _GEN_75 = delegate ? reg_mstatus_prv : {{1'd0}, reg_mstatus_spp}; // @[CSR.scala 1000:35 1010:23 370:24]
  wire  _GEN_76 = delegate ? 1'h0 : reg_mstatus_sie; // @[CSR.scala 1000:35 1011:23 370:24]
  wire [39:0] _GEN_80 = delegate ? reg_mepc : epc; // @[CSR.scala 1000:35 1017:16 473:21]
  wire [63:0] _GEN_81 = delegate ? reg_mcause : cause; // @[CSR.scala 1000:35 1018:18 474:27]
  wire [39:0] _GEN_82 = delegate ? reg_mtval : io_tval; // @[CSR.scala 1000:35 1019:17 475:22]
  wire  _GEN_84 = delegate ? reg_mstatus_mpie : reg_mstatus_mie; // @[CSR.scala 1000:35 1021:24 370:24]
  wire [1:0] _GEN_85 = delegate ? reg_mstatus_mpp : reg_mstatus_prv; // @[CSR.scala 1000:35 1022:23 370:24]
  wire  _GEN_86 = delegate & reg_mstatus_mie; // @[CSR.scala 1000:35 1023:23 370:24]
  wire  _GEN_147 = trapToDebug ? _GEN_53 : reg_debug; // @[CSR.scala 450:22 971:24]
  wire [39:0] _GEN_148 = trapToDebug ? _GEN_54 : reg_dpc; // @[CSR.scala 451:20 971:24]
  wire [1:0] _GEN_150 = trapToDebug ? _GEN_56 : reg_dcsr_prv; // @[CSR.scala 378:21 971:24]
  wire [39:0] _GEN_167 = trapToDebug ? reg_sepc : _GEN_70; // @[CSR.scala 533:21 971:24]
  wire [63:0] _GEN_168 = trapToDebug ? reg_scause : _GEN_71; // @[CSR.scala 534:23 971:24]
  wire [39:0] _GEN_169 = trapToDebug ? reg_stval : _GEN_72; // @[CSR.scala 535:22 971:24]
  wire  _GEN_171 = trapToDebug ? reg_mstatus_spie : _GEN_74; // @[CSR.scala 370:24 971:24]
  wire [1:0] _GEN_172 = trapToDebug ? {{1'd0}, reg_mstatus_spp} : _GEN_75; // @[CSR.scala 370:24 971:24]
  wire  _GEN_173 = trapToDebug ? reg_mstatus_sie : _GEN_76; // @[CSR.scala 370:24 971:24]
  wire [39:0] _GEN_176 = trapToDebug ? reg_mepc : _GEN_80; // @[CSR.scala 473:21 971:24]
  wire [63:0] _GEN_177 = trapToDebug ? reg_mcause : _GEN_81; // @[CSR.scala 971:24 474:27]
  wire [39:0] _GEN_178 = trapToDebug ? reg_mtval : _GEN_82; // @[CSR.scala 475:22 971:24]
  wire  _GEN_180 = trapToDebug ? reg_mstatus_mpie : _GEN_84; // @[CSR.scala 370:24 971:24]
  wire [1:0] _GEN_181 = trapToDebug ? reg_mstatus_mpp : _GEN_85; // @[CSR.scala 370:24 971:24]
  wire  _GEN_182 = trapToDebug ? reg_mstatus_mie : _GEN_86; // @[CSR.scala 370:24 971:24]
  wire  _GEN_184 = exception ? _GEN_147 : reg_debug; // @[CSR.scala 970:20 450:22]
  wire [39:0] _GEN_185 = exception ? _GEN_148 : reg_dpc; // @[CSR.scala 451:20 970:20]
  wire [1:0] _GEN_187 = exception ? _GEN_150 : reg_dcsr_prv; // @[CSR.scala 970:20 378:21]
  wire [39:0] _GEN_204 = exception ? _GEN_167 : reg_sepc; // @[CSR.scala 970:20 533:21]
  wire [63:0] _GEN_205 = exception ? _GEN_168 : reg_scause; // @[CSR.scala 970:20 534:23]
  wire [39:0] _GEN_206 = exception ? _GEN_169 : reg_stval; // @[CSR.scala 970:20 535:22]
  wire  _GEN_208 = exception ? _GEN_171 : reg_mstatus_spie; // @[CSR.scala 970:20 370:24]
  wire [1:0] _GEN_209 = exception ? _GEN_172 : {{1'd0}, reg_mstatus_spp}; // @[CSR.scala 970:20 370:24]
  wire  _GEN_210 = exception ? _GEN_173 : reg_mstatus_sie; // @[CSR.scala 970:20 370:24]
  wire [39:0] _GEN_213 = exception ? _GEN_176 : reg_mepc; // @[CSR.scala 970:20 473:21]
  wire [63:0] _GEN_214 = exception ? _GEN_177 : reg_mcause; // @[CSR.scala 970:20 474:27]
  wire [39:0] _GEN_215 = exception ? _GEN_178 : reg_mtval; // @[CSR.scala 970:20 475:22]
  wire  _GEN_217 = exception ? _GEN_180 : reg_mstatus_mpie; // @[CSR.scala 970:20 370:24]
  wire [1:0] _GEN_218 = exception ? _GEN_181 : reg_mstatus_mpp; // @[CSR.scala 970:20 370:24]
  wire  _GEN_219 = exception ? _GEN_182 : reg_mstatus_mie; // @[CSR.scala 970:20 370:24]
  wire [39:0] _GEN_241 = io_rw_addr[10] & io_rw_addr[7] ? _T_44 : _T_30; // @[CSR.scala 1067:70 1071:15]
  wire  _GEN_243 = io_rw_addr[10] & io_rw_addr[7] ? _GEN_219 : reg_mstatus_mpie; // @[CSR.scala 1067:70]
  wire  _GEN_244 = io_rw_addr[10] & io_rw_addr[7] ? _GEN_217 : 1'h1; // @[CSR.scala 1067:70]
  wire [1:0] _GEN_245 = io_rw_addr[10] & io_rw_addr[7] ? _GEN_218 : 2'h0; // @[CSR.scala 1067:70]
  wire  _GEN_247 = ~io_rw_addr[9] ? reg_mstatus_spie : _GEN_210; // @[CSR.scala 1050:52]
  wire  _GEN_248 = ~io_rw_addr[9] | _GEN_208; // @[CSR.scala 1050:52]
  wire [1:0] _GEN_249 = ~io_rw_addr[9] ? 2'h0 : _GEN_209; // @[CSR.scala 1050:52]
  wire [39:0] _GEN_252 = ~io_rw_addr[9] ? _T_60 : _GEN_241; // @[CSR.scala 1050:52]
  wire  _GEN_259 = ~io_rw_addr[9] ? _GEN_219 : _GEN_243; // @[CSR.scala 1050:52]
  wire  _GEN_260 = ~io_rw_addr[9] ? _GEN_217 : _GEN_244; // @[CSR.scala 1050:52]
  wire [1:0] _GEN_261 = ~io_rw_addr[9] ? _GEN_218 : _GEN_245; // @[CSR.scala 1050:52]
  wire  _GEN_263 = ret_prv <= 2'h1 ? 1'h0 : reg_mstatus_mprv; // @[CSR.scala 1088:42 1089:24 370:24]
  wire  _GEN_264 = insn_ret ? _GEN_247 : _GEN_210; // @[CSR.scala 1048:19]
  wire  _GEN_265 = insn_ret ? _GEN_248 : _GEN_208; // @[CSR.scala 1048:19]
  wire [1:0] _GEN_266 = insn_ret ? _GEN_249 : _GEN_209; // @[CSR.scala 1048:19]
  wire [63:0] _GEN_268 = insn_ret ? {{24'd0}, _GEN_252} : tvec; // @[CSR.scala 1048:19 932:11]
  wire  _GEN_275 = insn_ret ? _GEN_259 : _GEN_219; // @[CSR.scala 1048:19]
  wire  _GEN_276 = insn_ret ? _GEN_260 : _GEN_217; // @[CSR.scala 1048:19]
  wire [1:0] _GEN_277 = insn_ret ? _GEN_261 : _GEN_218; // @[CSR.scala 1048:19]
  wire  _GEN_280 = insn_ret ? _GEN_263 : reg_mstatus_mprv; // @[CSR.scala 1048:19 370:24]
  reg  io_status_cease_r; // @[Reg.scala 28:20]
  wire  _GEN_281 = insn_cease | io_status_cease_r; // @[Reg.scala 29:18 28:20 29:22]
  wire [63:0] _io_rw_rdata_T_1 = decoded_1 ? _T_20 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_2 = decoded_2 ? _T_24 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_4 = decoded_4 ? reg_misa : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_5 = decoded_5 ? read_mstatus : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_6 = decoded_6 ? read_mtvec : 64'h0; // @[Mux.scala 27:73]
  wire [15:0] _io_rw_rdata_T_7 = decoded_7 ? read_mip : 16'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_8 = decoded_8 ? reg_mie : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_9 = decoded_9 ? reg_mscratch : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_10 = decoded_10 ? _T_34 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_11 = decoded_11 ? _T_38 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_12 = decoded_12 ? reg_mcause : 64'h0; // @[Mux.scala 27:73]
  wire  _io_rw_rdata_T_13 = decoded_13 & io_hartid; // @[Mux.scala 27:73]
  wire [31:0] _io_rw_rdata_T_14 = decoded_14 ? _T_39 : 32'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_15 = decoded_15 ? _T_48 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_16 = decoded_16 ? reg_dscratch0 : 64'h0; // @[Mux.scala 27:73]
  wire [4:0] _io_rw_rdata_T_17 = decoded_17 ? reg_fflags : 5'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rw_rdata_T_18 = decoded_18 ? reg_frm : 3'h0; // @[Mux.scala 27:73]
  wire [7:0] _io_rw_rdata_T_19 = decoded_19 ? read_fcsr : 8'h0; // @[Mux.scala 27:73]
  wire [2:0] _io_rw_rdata_T_20 = decoded_20 ? reg_mcountinhibit : 3'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_21 = decoded_21 ? value_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_22 = decoded_22 ? value : 64'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_rw_rdata_T_110 = decoded_110 ? read_mcounteren : 32'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_111 = decoded_111 ? value_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_112 = decoded_112 ? value : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_113 = decoded_113 ? _T_49[63:0] : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_114 = decoded_114 ? read_sip : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_115 = decoded_115 ? read_sie : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_116 = decoded_116 ? reg_sscratch : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_117 = decoded_117 ? reg_scause : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_118 = decoded_118 ? _T_54 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_119 = decoded_119 ? _T_55 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_120 = decoded_120 ? _T_64 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_121 = decoded_121 ? read_stvec : 64'h0; // @[Mux.scala 27:73]
  wire [31:0] _io_rw_rdata_T_122 = decoded_122 ? read_scounteren : 32'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_123 = decoded_123 ? read_mideleg : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_124 = decoded_124 ? read_medeleg : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_125 = decoded_125 ? _T_73 : 64'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_127 = decoded_127 ? reg_pmp_0_addr : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_128 = decoded_128 ? reg_pmp_1_addr : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_129 = decoded_129 ? reg_pmp_2_addr : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_130 = decoded_130 ? reg_pmp_3_addr : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_131 = decoded_131 ? reg_pmp_4_addr : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_132 = decoded_132 ? reg_pmp_5_addr : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_133 = decoded_133 ? reg_pmp_6_addr : 30'h0; // @[Mux.scala 27:73]
  wire [29:0] _io_rw_rdata_T_134 = decoded_134 ? reg_pmp_7_addr : 30'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_143 = decoded_143 ? reg_custom_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_144 = decoded_144 ? 64'h1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_146 = decoded_146 ? 64'h20181004 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_148 = _io_rw_rdata_T_1 | _io_rw_rdata_T_2; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_150 = _io_rw_rdata_T_148 | _io_rw_rdata_T_4; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_151 = _io_rw_rdata_T_150 | _io_rw_rdata_T_5; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_152 = _io_rw_rdata_T_151 | _io_rw_rdata_T_6; // @[Mux.scala 27:73]
  wire [63:0] _GEN_668 = {{48'd0}, _io_rw_rdata_T_7}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_153 = _io_rw_rdata_T_152 | _GEN_668; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_154 = _io_rw_rdata_T_153 | _io_rw_rdata_T_8; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_155 = _io_rw_rdata_T_154 | _io_rw_rdata_T_9; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_156 = _io_rw_rdata_T_155 | _io_rw_rdata_T_10; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_157 = _io_rw_rdata_T_156 | _io_rw_rdata_T_11; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_158 = _io_rw_rdata_T_157 | _io_rw_rdata_T_12; // @[Mux.scala 27:73]
  wire [63:0] _GEN_669 = {{63'd0}, _io_rw_rdata_T_13}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_159 = _io_rw_rdata_T_158 | _GEN_669; // @[Mux.scala 27:73]
  wire [63:0] _GEN_670 = {{32'd0}, _io_rw_rdata_T_14}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_160 = _io_rw_rdata_T_159 | _GEN_670; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_161 = _io_rw_rdata_T_160 | _io_rw_rdata_T_15; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_162 = _io_rw_rdata_T_161 | _io_rw_rdata_T_16; // @[Mux.scala 27:73]
  wire [63:0] _GEN_671 = {{59'd0}, _io_rw_rdata_T_17}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_163 = _io_rw_rdata_T_162 | _GEN_671; // @[Mux.scala 27:73]
  wire [63:0] _GEN_672 = {{61'd0}, _io_rw_rdata_T_18}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_164 = _io_rw_rdata_T_163 | _GEN_672; // @[Mux.scala 27:73]
  wire [63:0] _GEN_673 = {{56'd0}, _io_rw_rdata_T_19}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_165 = _io_rw_rdata_T_164 | _GEN_673; // @[Mux.scala 27:73]
  wire [63:0] _GEN_674 = {{61'd0}, _io_rw_rdata_T_20}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_166 = _io_rw_rdata_T_165 | _GEN_674; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_167 = _io_rw_rdata_T_166 | _io_rw_rdata_T_21; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_168 = _io_rw_rdata_T_167 | _io_rw_rdata_T_22; // @[Mux.scala 27:73]
  wire [63:0] _GEN_675 = {{32'd0}, _io_rw_rdata_T_110}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_256 = _io_rw_rdata_T_168 | _GEN_675; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_257 = _io_rw_rdata_T_256 | _io_rw_rdata_T_111; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_258 = _io_rw_rdata_T_257 | _io_rw_rdata_T_112; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_259 = _io_rw_rdata_T_258 | _io_rw_rdata_T_113; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_260 = _io_rw_rdata_T_259 | _io_rw_rdata_T_114; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_261 = _io_rw_rdata_T_260 | _io_rw_rdata_T_115; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_262 = _io_rw_rdata_T_261 | _io_rw_rdata_T_116; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_263 = _io_rw_rdata_T_262 | _io_rw_rdata_T_117; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_264 = _io_rw_rdata_T_263 | _io_rw_rdata_T_118; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_265 = _io_rw_rdata_T_264 | _io_rw_rdata_T_119; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_266 = _io_rw_rdata_T_265 | _io_rw_rdata_T_120; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_267 = _io_rw_rdata_T_266 | _io_rw_rdata_T_121; // @[Mux.scala 27:73]
  wire [63:0] _GEN_676 = {{32'd0}, _io_rw_rdata_T_122}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_268 = _io_rw_rdata_T_267 | _GEN_676; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_269 = _io_rw_rdata_T_268 | _io_rw_rdata_T_123; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_270 = _io_rw_rdata_T_269 | _io_rw_rdata_T_124; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_271 = _io_rw_rdata_T_270 | _io_rw_rdata_T_125; // @[Mux.scala 27:73]
  wire [63:0] _GEN_677 = {{34'd0}, _io_rw_rdata_T_127}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_273 = _io_rw_rdata_T_271 | _GEN_677; // @[Mux.scala 27:73]
  wire [63:0] _GEN_678 = {{34'd0}, _io_rw_rdata_T_128}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_274 = _io_rw_rdata_T_273 | _GEN_678; // @[Mux.scala 27:73]
  wire [63:0] _GEN_679 = {{34'd0}, _io_rw_rdata_T_129}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_275 = _io_rw_rdata_T_274 | _GEN_679; // @[Mux.scala 27:73]
  wire [63:0] _GEN_680 = {{34'd0}, _io_rw_rdata_T_130}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_276 = _io_rw_rdata_T_275 | _GEN_680; // @[Mux.scala 27:73]
  wire [63:0] _GEN_681 = {{34'd0}, _io_rw_rdata_T_131}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_277 = _io_rw_rdata_T_276 | _GEN_681; // @[Mux.scala 27:73]
  wire [63:0] _GEN_682 = {{34'd0}, _io_rw_rdata_T_132}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_278 = _io_rw_rdata_T_277 | _GEN_682; // @[Mux.scala 27:73]
  wire [63:0] _GEN_683 = {{34'd0}, _io_rw_rdata_T_133}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_279 = _io_rw_rdata_T_278 | _GEN_683; // @[Mux.scala 27:73]
  wire [63:0] _GEN_684 = {{34'd0}, _io_rw_rdata_T_134}; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_280 = _io_rw_rdata_T_279 | _GEN_684; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_289 = _io_rw_rdata_T_280 | _io_rw_rdata_T_143; // @[Mux.scala 27:73]
  wire [63:0] _io_rw_rdata_T_290 = _io_rw_rdata_T_289 | _io_rw_rdata_T_144; // @[Mux.scala 27:73]
  wire  _T_437 = io_rw_cmd == 3'h5; // @[package.scala 15:47]
  wire  _T_438 = io_rw_cmd == 3'h6; // @[package.scala 15:47]
  wire  _T_439 = io_rw_cmd == 3'h7; // @[package.scala 15:47]
  wire [4:0] _reg_fflags_T = reg_fflags | io_fcsr_flags_bits; // @[CSR.scala 1138:30]
  wire [4:0] _GEN_282 = io_fcsr_flags_valid ? _reg_fflags_T : reg_fflags; // @[CSR.scala 1137:30 1138:16 541:23]
  wire  csr_wen = _T_438 | _T_439 | _T_437; // @[package.scala 72:59]
  wire [104:0] _new_mstatus_WIRE = {{41'd0}, wdata};
  wire  new_mstatus_sie = _new_mstatus_WIRE[1]; // @[CSR.scala 1156:47]
  wire  new_mstatus_mie = _new_mstatus_WIRE[3]; // @[CSR.scala 1156:47]
  wire  new_mstatus_spie = _new_mstatus_WIRE[5]; // @[CSR.scala 1156:47]
  wire  new_mstatus_mpie = _new_mstatus_WIRE[7]; // @[CSR.scala 1156:47]
  wire  new_mstatus_spp = _new_mstatus_WIRE[8]; // @[CSR.scala 1156:47]
  wire [1:0] new_mstatus_mpp = _new_mstatus_WIRE[12:11]; // @[CSR.scala 1156:47]
  wire [1:0] new_mstatus_fs = _new_mstatus_WIRE[14:13]; // @[CSR.scala 1156:47]
  wire  new_mstatus_mprv = _new_mstatus_WIRE[17]; // @[CSR.scala 1156:47]
  wire  new_mstatus_sum = _new_mstatus_WIRE[18]; // @[CSR.scala 1156:47]
  wire  new_mstatus_mxr = _new_mstatus_WIRE[19]; // @[CSR.scala 1156:47]
  wire  new_mstatus_tvm = _new_mstatus_WIRE[20]; // @[CSR.scala 1156:47]
  wire  new_mstatus_tw = _new_mstatus_WIRE[21]; // @[CSR.scala 1156:47]
  wire  new_mstatus_tsr = _new_mstatus_WIRE[22]; // @[CSR.scala 1156:47]
  wire  _reg_mstatus_fs_T = |new_mstatus_fs; // @[CSR.scala 1568:73]
  wire [1:0] _reg_mstatus_fs_T_2 = _reg_mstatus_fs_T ? 2'h3 : 2'h0; // @[Bitwise.scala 74:12]
  wire [1:0] _GEN_288 = decoded_5 ? {{1'd0}, new_mstatus_spp} : _GEN_266; // @[CSR.scala 1155:39 1164:27]
  wire  f = wdata[5]; // @[CSR.scala 1186:20]
  wire [63:0] _reg_misa_T = ~wdata; // @[CSR.scala 1190:25]
  wire  _reg_misa_T_1 = ~f; // @[CSR.scala 1190:35]
  wire [3:0] _reg_misa_T_2 = {_reg_misa_T_1, 3'h0}; // @[CSR.scala 1190:38]
  wire [63:0] _GEN_685 = {{60'd0}, _reg_misa_T_2}; // @[CSR.scala 1190:32]
  wire [63:0] _reg_misa_T_3 = _reg_misa_T | _GEN_685; // @[CSR.scala 1190:32]
  wire [63:0] _reg_misa_T_4 = ~_reg_misa_T_3; // @[CSR.scala 1190:23]
  wire [63:0] _reg_misa_T_5 = _reg_misa_T_4 & 64'h102d; // @[CSR.scala 1190:55]
  wire [63:0] _reg_misa_T_7 = reg_misa & 64'hffffffffffffefd2; // @[CSR.scala 1190:73]
  wire [63:0] _reg_misa_T_8 = _reg_misa_T_5 | _reg_misa_T_7; // @[CSR.scala 1190:62]
  wire [15:0] _new_mip_T_2 = io_rw_cmd[1] ? _read_hvip_T : 16'h0; // @[CSR.scala 1543:9]
  wire [63:0] _GEN_686 = {{48'd0}, _new_mip_T_2}; // @[CSR.scala 1543:34]
  wire [63:0] _new_mip_T_3 = _GEN_686 | io_rw_wdata; // @[CSR.scala 1543:34]
  wire [63:0] _new_mip_T_8 = _new_mip_T_3 & _wdata_T_6; // @[CSR.scala 1543:43]
  wire  new_mip_ssip = _new_mip_T_8[1]; // @[CSR.scala 1198:88]
  wire  new_mip_stip = _new_mip_T_8[5]; // @[CSR.scala 1198:88]
  wire  new_mip_seip = _new_mip_T_8[9]; // @[CSR.scala 1198:88]
  wire [63:0] _reg_mie_T = wdata & 64'haaa; // @[CSR.scala 1208:59]
  wire [63:0] _reg_mepc_T_1 = _reg_misa_T | 64'h1; // @[CSR.scala 1564:31]
  wire [63:0] _reg_mepc_T_2 = ~_reg_mepc_T_1; // @[CSR.scala 1564:26]
  wire [63:0] _GEN_304 = decoded_10 ? _reg_mepc_T_2 : {{24'd0}, _GEN_213}; // @[CSR.scala 1209:{40,51}]
  wire [63:0] _GEN_306 = decoded_6 ? wdata : {{32'd0}, reg_mtvec}; // @[CSR.scala 1212:{40,52} 480:27]
  wire [63:0] _reg_mcause_T = wdata & 64'h800000000000000f; // @[CSR.scala 1213:62]
  wire [63:0] _GEN_308 = decoded_11 ? wdata : {{24'd0}, _GEN_215}; // @[CSR.scala 1214:{40,52}]
  wire [63:0] _reg_mcountinhibit_T_1 = wdata & 64'hfffffffffffffffd; // @[CSR.scala 1233:76]
  wire [63:0] _GEN_309 = decoded_20 ? _reg_mcountinhibit_T_1 : {{61'd0}, reg_mcountinhibit}; // @[CSR.scala 1233:{47,67} 548:34]
  wire [63:0] _GEN_310 = decoded_21 ? wdata : {{57'd0}, _GEN_2}; // @[CSR.scala 1561:31 Counters.scala 65:11]
  wire [63:0] _GEN_312 = decoded_22 ? wdata : {{57'd0}, _GEN_0}; // @[CSR.scala 1561:31 Counters.scala 65:11]
  wire [63:0] _GEN_315 = decoded_17 ? wdata : {{59'd0}, _GEN_282}; // @[CSR.scala 1239:{40,75}]
  wire [63:0] _GEN_317 = decoded_18 ? wdata : {{61'd0}, reg_frm}; // @[CSR.scala 1240:{40,72} 542:20]
  wire [63:0] _GEN_319 = decoded_19 ? wdata : _GEN_315; // @[CSR.scala 1241:38 1243:20]
  wire [63:0] _GEN_320 = decoded_19 ? {{5'd0}, wdata[63:5]} : _GEN_317; // @[CSR.scala 1241:38 1244:17]
  wire [1:0] new_dcsr_prv = wdata[1:0]; // @[CSR.scala 1249:43]
  wire  new_dcsr_step = wdata[2]; // @[CSR.scala 1249:43]
  wire  new_dcsr_ebreaku = wdata[12]; // @[CSR.scala 1249:43]
  wire  new_dcsr_ebreaks = wdata[13]; // @[CSR.scala 1249:43]
  wire  new_dcsr_ebreakm = wdata[15]; // @[CSR.scala 1249:43]
  wire [63:0] _GEN_326 = decoded_15 ? _reg_mepc_T_2 : {{24'd0}, _GEN_185}; // @[CSR.scala 1257:{42,52}]
  wire [1:0] _GEN_330 = decoded_113 ? {{1'd0}, new_mstatus_spp} : _GEN_288; // @[CSR.scala 1264:41 1268:25]
  wire [63:0] _new_sip_T = ~read_mideleg; // @[CSR.scala 1277:54]
  wire [63:0] _new_sip_T_1 = _GEN_43 & _new_sip_T; // @[CSR.scala 1277:52]
  wire [63:0] _new_sip_T_2 = wdata & read_mideleg; // @[CSR.scala 1277:78]
  wire [63:0] _new_sip_T_3 = _new_sip_T_1 | _new_sip_T_2; // @[CSR.scala 1277:69]
  wire  new_sip_ssip = _new_sip_T_3[1]; // @[CSR.scala 1277:41]
  wire [43:0] new_satp_ppn = wdata[43:0]; // @[CSR.scala 1282:45]
  wire [3:0] new_satp_mode = wdata[63:60]; // @[CSR.scala 1282:45]
  wire  _T_1858 = new_satp_mode == 4'h0; // @[package.scala 15:47]
  wire  _T_1859 = new_satp_mode == 4'h8; // @[package.scala 15:47]
  wire  _T_1860 = _T_1858 | _T_1859; // @[package.scala 72:59]
  wire [3:0] _reg_satp_mode_T = new_satp_mode & 4'h8; // @[CSR.scala 1284:44]
  wire [63:0] _reg_mie_T_1 = ~sie_mask; // @[CSR.scala 1290:66]
  wire [63:0] _reg_mie_T_2 = reg_mie & _reg_mie_T_1; // @[CSR.scala 1290:64]
  wire [63:0] _reg_mie_T_3 = wdata & sie_mask; // @[CSR.scala 1290:86]
  wire [63:0] _reg_mie_T_4 = _reg_mie_T_2 | _reg_mie_T_3; // @[CSR.scala 1290:77]
  wire [63:0] _GEN_342 = decoded_120 ? _reg_mepc_T_2 : {{24'd0}, _GEN_204}; // @[CSR.scala 1292:{42,53}]
  wire [63:0] _GEN_343 = decoded_121 ? wdata : {{25'd0}, reg_stvec}; // @[CSR.scala 1293:{42,54} 537:22]
  wire [63:0] _reg_scause_T = wdata & 64'h800000000000001f; // @[CSR.scala 1294:64]
  wire [63:0] _GEN_345 = decoded_118 ? wdata : {{24'd0}, _GEN_206}; // @[CSR.scala 1295:{42,54}]
  wire [63:0] _GEN_348 = decoded_122 ? wdata : {{32'd0}, reg_scounteren}; // @[CSR.scala 1298:{44,61} 499:18]
  wire [63:0] _GEN_349 = decoded_110 ? wdata : {{32'd0}, reg_mcounteren}; // @[CSR.scala 1372:{44,61} 495:18]
  wire [63:0] _GEN_351 = decoded_2 ? wdata : {{25'd0}, reg_bp_0_address}; // @[CSR.scala 1379:{44,57} 460:19]
  wire [63:0] _newBPC_T_2 = io_rw_cmd[1] ? _T_20 : 64'h0; // @[CSR.scala 1543:9]
  wire [63:0] _newBPC_T_3 = _newBPC_T_2 | io_rw_wdata; // @[CSR.scala 1543:34]
  wire [63:0] _newBPC_T_8 = _newBPC_T_3 & _wdata_T_6; // @[CSR.scala 1543:43]
  wire  newBPC_action = _newBPC_T_8[12]; // @[CSR.scala 1397:96]
  wire  newBPC_dmode = _newBPC_T_8[59]; // @[CSR.scala 1397:96]
  wire  dMode = newBPC_dmode & reg_debug; // @[CSR.scala 1398:38]
  wire  _GEN_352 = dMode & newBPC_action; // @[CSR.scala 1400:{120,51,71}]
  wire [63:0] _GEN_368 = ~reg_bp_0_control_dmode | reg_debug ? _GEN_351 : {{25'd0}, reg_bp_0_address}; // @[CSR.scala 1378:70 460:19]
  wire  newCfg_r = wdata[0]; // @[CSR.scala 1411:46]
  wire  newCfg_w = wdata[1]; // @[CSR.scala 1411:46]
  wire  newCfg_x = wdata[2]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_a = wdata[4:3]; // @[CSR.scala 1411:46]
  wire  newCfg_l = wdata[7]; // @[CSR.scala 1411:46]
  wire  _T_1878 = ~reg_pmp_1_cfg_a[1] & reg_pmp_1_cfg_a[0]; // @[PMP.scala 47:20]
  wire  _T_1880 = reg_pmp_0_cfg_l | reg_pmp_1_cfg_l & _T_1878; // @[PMP.scala 49:44]
  wire [63:0] _GEN_423 = decoded_127 & ~_T_1880 ? wdata : {{34'd0}, reg_pmp_0_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire  newCfg_1_r = wdata[8]; // @[CSR.scala 1411:46]
  wire  newCfg_1_w = wdata[9]; // @[CSR.scala 1411:46]
  wire  newCfg_1_x = wdata[10]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_1_a = wdata[12:11]; // @[CSR.scala 1411:46]
  wire  newCfg_1_l = wdata[15]; // @[CSR.scala 1411:46]
  wire  _T_1888 = ~reg_pmp_2_cfg_a[1] & reg_pmp_2_cfg_a[0]; // @[PMP.scala 47:20]
  wire  _T_1890 = reg_pmp_1_cfg_l | reg_pmp_2_cfg_l & _T_1888; // @[PMP.scala 49:44]
  wire [63:0] _GEN_430 = decoded_128 & ~_T_1890 ? wdata : {{34'd0}, reg_pmp_1_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire  newCfg_2_r = wdata[16]; // @[CSR.scala 1411:46]
  wire  newCfg_2_w = wdata[17]; // @[CSR.scala 1411:46]
  wire  newCfg_2_x = wdata[18]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_2_a = wdata[20:19]; // @[CSR.scala 1411:46]
  wire  newCfg_2_l = wdata[23]; // @[CSR.scala 1411:46]
  wire  _T_1898 = ~reg_pmp_3_cfg_a[1] & reg_pmp_3_cfg_a[0]; // @[PMP.scala 47:20]
  wire  _T_1900 = reg_pmp_2_cfg_l | reg_pmp_3_cfg_l & _T_1898; // @[PMP.scala 49:44]
  wire [63:0] _GEN_437 = decoded_129 & ~_T_1900 ? wdata : {{34'd0}, reg_pmp_2_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire  newCfg_3_r = wdata[24]; // @[CSR.scala 1411:46]
  wire  newCfg_3_w = wdata[25]; // @[CSR.scala 1411:46]
  wire  newCfg_3_x = wdata[26]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_3_a = wdata[28:27]; // @[CSR.scala 1411:46]
  wire  newCfg_3_l = wdata[31]; // @[CSR.scala 1411:46]
  wire  _T_1908 = ~reg_pmp_4_cfg_a[1] & reg_pmp_4_cfg_a[0]; // @[PMP.scala 47:20]
  wire  _T_1910 = reg_pmp_3_cfg_l | reg_pmp_4_cfg_l & _T_1908; // @[PMP.scala 49:44]
  wire [63:0] _GEN_444 = decoded_130 & ~_T_1910 ? wdata : {{34'd0}, reg_pmp_3_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire  newCfg_4_r = wdata[32]; // @[CSR.scala 1411:46]
  wire  newCfg_4_w = wdata[33]; // @[CSR.scala 1411:46]
  wire  newCfg_4_x = wdata[34]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_4_a = wdata[36:35]; // @[CSR.scala 1411:46]
  wire  newCfg_4_l = wdata[39]; // @[CSR.scala 1411:46]
  wire  _T_1918 = ~reg_pmp_5_cfg_a[1] & reg_pmp_5_cfg_a[0]; // @[PMP.scala 47:20]
  wire  _T_1920 = reg_pmp_4_cfg_l | reg_pmp_5_cfg_l & _T_1918; // @[PMP.scala 49:44]
  wire [63:0] _GEN_451 = decoded_131 & ~_T_1920 ? wdata : {{34'd0}, reg_pmp_4_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire  newCfg_5_r = wdata[40]; // @[CSR.scala 1411:46]
  wire  newCfg_5_w = wdata[41]; // @[CSR.scala 1411:46]
  wire  newCfg_5_x = wdata[42]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_5_a = wdata[44:43]; // @[CSR.scala 1411:46]
  wire  newCfg_5_l = wdata[47]; // @[CSR.scala 1411:46]
  wire  _T_1928 = ~reg_pmp_6_cfg_a[1] & reg_pmp_6_cfg_a[0]; // @[PMP.scala 47:20]
  wire  _T_1930 = reg_pmp_5_cfg_l | reg_pmp_6_cfg_l & _T_1928; // @[PMP.scala 49:44]
  wire [63:0] _GEN_458 = decoded_132 & ~_T_1930 ? wdata : {{34'd0}, reg_pmp_5_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire  newCfg_6_r = wdata[48]; // @[CSR.scala 1411:46]
  wire  newCfg_6_w = wdata[49]; // @[CSR.scala 1411:46]
  wire  newCfg_6_x = wdata[50]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_6_a = wdata[52:51]; // @[CSR.scala 1411:46]
  wire  newCfg_6_l = wdata[55]; // @[CSR.scala 1411:46]
  wire  _T_1938 = ~reg_pmp_7_cfg_a[1] & reg_pmp_7_cfg_a[0]; // @[PMP.scala 47:20]
  wire  _T_1940 = reg_pmp_6_cfg_l | reg_pmp_7_cfg_l & _T_1938; // @[PMP.scala 49:44]
  wire [63:0] _GEN_465 = decoded_133 & ~_T_1940 ? wdata : {{34'd0}, reg_pmp_6_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire  newCfg_7_r = wdata[56]; // @[CSR.scala 1411:46]
  wire  newCfg_7_w = wdata[57]; // @[CSR.scala 1411:46]
  wire  newCfg_7_x = wdata[58]; // @[CSR.scala 1411:46]
  wire [1:0] newCfg_7_a = wdata[60:59]; // @[CSR.scala 1411:46]
  wire  newCfg_7_l = wdata[63]; // @[CSR.scala 1411:46]
  wire  _T_1950 = reg_pmp_7_cfg_l | reg_pmp_7_cfg_l & _T_1938; // @[PMP.scala 49:44]
  wire [63:0] _GEN_472 = decoded_134 & ~_T_1950 ? wdata : {{34'd0}, reg_pmp_7_addr}; // @[CSR.scala 1419:71 1420:18 461:20]
  wire [63:0] _reg_custom_0_T = wdata & 64'h208; // @[CSR.scala 1426:23]
  wire [63:0] _reg_custom_0_T_2 = reg_custom_0 & 64'hfffffffffffffdf7; // @[CSR.scala 1426:38]
  wire [63:0] _reg_custom_0_T_3 = _reg_custom_0_T | _reg_custom_0_T_2; // @[CSR.scala 1426:31]
  wire [1:0] _GEN_485 = csr_wen ? _GEN_330 : _GEN_266; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_500 = csr_wen ? _GEN_304 : {{24'd0}, _GEN_213}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_502 = csr_wen ? _GEN_306 : {{32'd0}, reg_mtvec}; // @[CSR.scala 1151:18 480:27]
  wire [63:0] _GEN_504 = csr_wen ? _GEN_308 : {{24'd0}, _GEN_215}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_505 = csr_wen ? _GEN_309 : {{61'd0}, reg_mcountinhibit}; // @[CSR.scala 1151:18 548:34]
  wire [63:0] _GEN_506 = csr_wen ? _GEN_310 : {{57'd0}, _GEN_2}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_508 = csr_wen ? _GEN_312 : {{57'd0}, _GEN_0}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_511 = csr_wen ? _GEN_319 : {{59'd0}, _GEN_282}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_512 = csr_wen ? _GEN_320 : {{61'd0}, reg_frm}; // @[CSR.scala 1151:18 542:20]
  wire [63:0] _GEN_518 = csr_wen ? _GEN_326 : {{24'd0}, _GEN_185}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_523 = csr_wen ? _GEN_342 : {{24'd0}, _GEN_204}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_524 = csr_wen ? _GEN_343 : {{25'd0}, reg_stvec}; // @[CSR.scala 1151:18 537:22]
  wire [63:0] _GEN_526 = csr_wen ? _GEN_345 : {{24'd0}, _GEN_206}; // @[CSR.scala 1151:18]
  wire [63:0] _GEN_529 = csr_wen ? _GEN_348 : {{32'd0}, reg_scounteren}; // @[CSR.scala 1151:18 499:18]
  wire [63:0] _GEN_530 = csr_wen ? _GEN_349 : {{32'd0}, reg_mcounteren}; // @[CSR.scala 1151:18 495:18]
  wire [63:0] _GEN_532 = csr_wen ? _GEN_368 : {{25'd0}, reg_bp_0_address}; // @[CSR.scala 1151:18 460:19]
  wire [63:0] _GEN_570 = csr_wen ? _GEN_423 : {{34'd0}, reg_pmp_0_addr}; // @[CSR.scala 1151:18 461:20]
  wire [63:0] _GEN_577 = csr_wen ? _GEN_430 : {{34'd0}, reg_pmp_1_addr}; // @[CSR.scala 1151:18 461:20]
  wire [63:0] _GEN_584 = csr_wen ? _GEN_437 : {{34'd0}, reg_pmp_2_addr}; // @[CSR.scala 1151:18 461:20]
  wire [63:0] _GEN_591 = csr_wen ? _GEN_444 : {{34'd0}, reg_pmp_3_addr}; // @[CSR.scala 1151:18 461:20]
  wire [63:0] _GEN_598 = csr_wen ? _GEN_451 : {{34'd0}, reg_pmp_4_addr}; // @[CSR.scala 1151:18 461:20]
  wire [63:0] _GEN_605 = csr_wen ? _GEN_458 : {{34'd0}, reg_pmp_5_addr}; // @[CSR.scala 1151:18 461:20]
  wire [63:0] _GEN_612 = csr_wen ? _GEN_465 : {{34'd0}, reg_pmp_6_addr}; // @[CSR.scala 1151:18 461:20]
  wire [63:0] _GEN_619 = csr_wen ? _GEN_472 : {{34'd0}, reg_pmp_7_addr}; // @[CSR.scala 1151:18 461:20]
  assign io_rw_rdata = _io_rw_rdata_T_290 | _io_rw_rdata_T_146; // @[Mux.scala 27:73]
  assign io_decode_0_fp_illegal = io_status_fs == 2'h0 | ~reg_misa[5]; // @[CSR.scala 853:87]
  assign io_decode_0_fp_csr = |_io_decode_0_fp_csr_T_1; // @[pla.scala 114:39]
  assign io_decode_0_rocc_illegal = io_status_xs == 2'h0 | ~reg_misa[23]; // @[CSR.scala 856:89]
  assign io_decode_0_read_illegal = _io_decode_0_read_illegal_T_17 | _io_decode_0_read_illegal_T_21; // @[CSR.scala 865:68]
  assign io_decode_0_write_illegal = &addr_1[11:10]; // @[CSR.scala 867:41]
  assign io_decode_0_write_flush = ~(io_decode_0_write_flush_addr_m >= 12'h340 & io_decode_0_write_flush_addr_m <= 12'h343
    ); // @[CSR.scala 870:7]
  assign io_decode_0_system_illegal = _io_decode_0_system_illegal_T_15 | _io_decode_0_system_illegal_T_18; // @[CSR.scala 875:51]
  assign io_csr_stall = reg_wfi | io_status_cease; // @[CSR.scala 1094:27]
  assign io_eret = _exception_T | insn_ret; // @[CSR.scala 936:38]
  assign io_singleStep = reg_dcsr_step & _T_297; // @[CSR.scala 937:34]
  assign io_status_debug = reg_debug; // @[CSR.scala 940:19]
  assign io_status_cease = io_status_cease_r; // @[CSR.scala 1095:19]
  assign io_status_wfi = reg_wfi; // @[CSR.scala 1096:17]
  assign io_status_isa = reg_misa[31:0]; // @[CSR.scala 941:17]
  assign io_status_dprv = reg_mstatus_mprv & _T_297 ? reg_mstatus_mpp : reg_mstatus_prv; // @[CSR.scala 944:24]
  assign io_status_dv = 1'h0; // @[CSR.scala 945:39]
  assign io_status_prv = reg_mstatus_prv; // @[CSR.scala 938:13]
  assign io_status_v = 1'h0; // @[CSR.scala 938:13]
  assign io_status_sd = &io_status_fs | &io_status_xs | &io_status_vs; // @[CSR.scala 939:58]
  assign io_status_zero2 = 23'h0; // @[CSR.scala 938:13]
  assign io_status_mpv = 1'h0; // @[CSR.scala 947:17]
  assign io_status_gva = reg_mstatus_gva; // @[CSR.scala 948:17]
  assign io_status_mbe = 1'h0; // @[CSR.scala 938:13]
  assign io_status_sbe = 1'h0; // @[CSR.scala 938:13]
  assign io_status_sxl = 2'h2; // @[CSR.scala 943:17]
  assign io_status_uxl = 2'h2; // @[CSR.scala 942:17]
  assign io_status_sd_rv32 = 1'h0; // @[CSR.scala 946:35]
  assign io_status_zero1 = 8'h0; // @[CSR.scala 938:13]
  assign io_status_tsr = reg_mstatus_tsr; // @[CSR.scala 938:13]
  assign io_status_tw = reg_mstatus_tw; // @[CSR.scala 938:13]
  assign io_status_tvm = reg_mstatus_tvm; // @[CSR.scala 938:13]
  assign io_status_mxr = reg_mstatus_mxr; // @[CSR.scala 938:13]
  assign io_status_sum = reg_mstatus_sum; // @[CSR.scala 938:13]
  assign io_status_mprv = reg_mstatus_mprv; // @[CSR.scala 938:13]
  assign io_status_xs = 2'h0; // @[CSR.scala 938:13]
  assign io_status_fs = reg_mstatus_fs; // @[CSR.scala 938:13]
  assign io_status_mpp = reg_mstatus_mpp; // @[CSR.scala 938:13]
  assign io_status_vs = 2'h0; // @[CSR.scala 938:13]
  assign io_status_spp = reg_mstatus_spp; // @[CSR.scala 938:13]
  assign io_status_mpie = reg_mstatus_mpie; // @[CSR.scala 938:13]
  assign io_status_ube = 1'h0; // @[CSR.scala 938:13]
  assign io_status_spie = reg_mstatus_spie; // @[CSR.scala 938:13]
  assign io_status_upie = 1'h0; // @[CSR.scala 938:13]
  assign io_status_mie = reg_mstatus_mie; // @[CSR.scala 938:13]
  assign io_status_hie = 1'h0; // @[CSR.scala 938:13]
  assign io_status_sie = reg_mstatus_sie; // @[CSR.scala 938:13]
  assign io_status_uie = 1'h0; // @[CSR.scala 938:13]
  assign io_ptbr_mode = reg_satp_mode; // @[CSR.scala 933:11]
  assign io_ptbr_ppn = reg_satp_ppn; // @[CSR.scala 933:11]
  assign io_evec = _GEN_268[39:0];
  assign io_time = {large_1,small_1}; // @[Cat.scala 31:58]
  assign io_fcsr_rm = reg_frm; // @[CSR.scala 1136:14]
  assign io_interrupt = (anyInterrupt & ~io_singleStep | reg_singleStepped) & ~(reg_debug | io_status_cease); // @[CSR.scala 584:73]
  assign io_interrupt_cause = 64'h8000000000000000 + _GEN_659; // @[CSR.scala 583:67]
  assign io_bp_0_control_action = reg_bp_0_control_action; // @[CSR.scala 586:9]
  assign io_bp_0_control_tmatch = reg_bp_0_control_tmatch; // @[CSR.scala 586:9]
  assign io_bp_0_control_m = reg_bp_0_control_m; // @[CSR.scala 586:9]
  assign io_bp_0_control_s = reg_bp_0_control_s; // @[CSR.scala 586:9]
  assign io_bp_0_control_u = reg_bp_0_control_u; // @[CSR.scala 586:9]
  assign io_bp_0_control_x = reg_bp_0_control_x; // @[CSR.scala 586:9]
  assign io_bp_0_control_w = reg_bp_0_control_w; // @[CSR.scala 586:9]
  assign io_bp_0_control_r = reg_bp_0_control_r; // @[CSR.scala 586:9]
  assign io_bp_0_address = reg_bp_0_address; // @[CSR.scala 586:9]
  assign io_pmp_0_cfg_l = reg_pmp_0_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_0_cfg_a = reg_pmp_0_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_0_cfg_x = reg_pmp_0_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_0_cfg_w = reg_pmp_0_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_0_cfg_r = reg_pmp_0_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_0_addr = reg_pmp_0_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_0_mask = _pmp_mask_T_4[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_pmp_1_cfg_l = reg_pmp_1_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_1_cfg_a = reg_pmp_1_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_1_cfg_x = reg_pmp_1_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_1_cfg_w = reg_pmp_1_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_1_cfg_r = reg_pmp_1_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_1_addr = reg_pmp_1_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_1_mask = _pmp_mask_T_9[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_pmp_2_cfg_l = reg_pmp_2_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_2_cfg_a = reg_pmp_2_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_2_cfg_x = reg_pmp_2_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_2_cfg_w = reg_pmp_2_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_2_cfg_r = reg_pmp_2_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_2_addr = reg_pmp_2_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_2_mask = _pmp_mask_T_14[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_pmp_3_cfg_l = reg_pmp_3_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_3_cfg_a = reg_pmp_3_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_3_cfg_x = reg_pmp_3_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_3_cfg_w = reg_pmp_3_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_3_cfg_r = reg_pmp_3_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_3_addr = reg_pmp_3_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_3_mask = _pmp_mask_T_19[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_pmp_4_cfg_l = reg_pmp_4_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_4_cfg_a = reg_pmp_4_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_4_cfg_x = reg_pmp_4_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_4_cfg_w = reg_pmp_4_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_4_cfg_r = reg_pmp_4_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_4_addr = reg_pmp_4_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_4_mask = _pmp_mask_T_24[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_pmp_5_cfg_l = reg_pmp_5_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_5_cfg_a = reg_pmp_5_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_5_cfg_x = reg_pmp_5_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_5_cfg_w = reg_pmp_5_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_5_cfg_r = reg_pmp_5_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_5_addr = reg_pmp_5_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_5_mask = _pmp_mask_T_29[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_pmp_6_cfg_l = reg_pmp_6_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_6_cfg_a = reg_pmp_6_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_6_cfg_x = reg_pmp_6_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_6_cfg_w = reg_pmp_6_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_6_cfg_r = reg_pmp_6_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_6_addr = reg_pmp_6_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_6_mask = _pmp_mask_T_34[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_pmp_7_cfg_l = reg_pmp_7_cfg_l; // @[PMP.scala 24:19 25:13]
  assign io_pmp_7_cfg_a = reg_pmp_7_cfg_a; // @[PMP.scala 24:19 25:13]
  assign io_pmp_7_cfg_x = reg_pmp_7_cfg_x; // @[PMP.scala 24:19 25:13]
  assign io_pmp_7_cfg_w = reg_pmp_7_cfg_w; // @[PMP.scala 24:19 25:13]
  assign io_pmp_7_cfg_r = reg_pmp_7_cfg_r; // @[PMP.scala 24:19 25:13]
  assign io_pmp_7_addr = reg_pmp_7_addr; // @[PMP.scala 24:19 26:14]
  assign io_pmp_7_mask = _pmp_mask_T_39[31:0]; // @[PMP.scala 24:19 27:14]
  assign io_inhibit_cycle = reg_mcountinhibit[0]; // @[CSR.scala 549:40]
  assign io_trace_0_valid = io_retire > 1'h0 | io_trace_0_exception; // @[CSR.scala 1522:30]
  assign io_trace_0_iaddr = io_pc; // @[CSR.scala 1524:13]
  assign io_trace_0_insn = io_inst_0; // @[CSR.scala 1523:12]
  assign io_trace_0_exception = insn_call | insn_break | io_exception; // @[CSR.scala 956:43]
  assign io_customCSRs_0_value = reg_custom_0; // @[CSR.scala 1101:14]
  always @(posedge clock) begin
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_prv <= 2'h3; // @[CSR.scala 370:24]
    end else if (new_prv == 2'h2) begin // @[CSR.scala 1547:29]
      reg_mstatus_prv <= 2'h0;
    end else if (insn_ret) begin // @[CSR.scala 1048:19]
      if (~io_rw_addr[9]) begin // @[CSR.scala 1050:52]
        reg_mstatus_prv <= {{1'd0}, reg_mstatus_spp};
      end else begin
        reg_mstatus_prv <= _GEN_238;
      end
    end else if (exception) begin // @[CSR.scala 970:20]
      reg_mstatus_prv <= _GEN_152;
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_gva <= 1'h0; // @[CSR.scala 370:24]
    end else if (exception) begin // @[CSR.scala 970:20]
      if (!(trapToDebug)) begin // @[CSR.scala 971:24]
        if (!(delegate)) begin // @[CSR.scala 1000:35]
          reg_mstatus_gva <= io_gva; // @[CSR.scala 1016:23]
        end
      end
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_tsr <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_tsr <= new_mstatus_tsr; // @[CSR.scala 1168:27]
      end
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_tw <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_tw <= new_mstatus_tw; // @[CSR.scala 1167:26]
      end
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_tvm <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_tvm <= new_mstatus_tvm; // @[CSR.scala 1173:27]
      end
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_mxr <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_113) begin // @[CSR.scala 1264:41]
        reg_mstatus_mxr <= new_mstatus_mxr; // @[CSR.scala 1272:27]
      end else if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_mxr <= new_mstatus_mxr; // @[CSR.scala 1171:27]
      end
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_sum <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_113) begin // @[CSR.scala 1264:41]
        reg_mstatus_sum <= new_mstatus_sum; // @[CSR.scala 1273:27]
      end else if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_sum <= new_mstatus_sum; // @[CSR.scala 1172:27]
      end
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_mprv <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_mprv <= new_mstatus_mprv; // @[CSR.scala 1161:26]
      end else begin
        reg_mstatus_mprv <= _GEN_280;
      end
    end else begin
      reg_mstatus_mprv <= _GEN_280;
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_fs <= 2'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_113) begin // @[CSR.scala 1264:41]
        reg_mstatus_fs <= _reg_mstatus_fs_T_2; // @[CSR.scala 1269:24]
      end else if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_fs <= _reg_mstatus_fs_T_2; // @[CSR.scala 1181:55]
      end
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_mpp <= 2'h3; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_5) begin // @[CSR.scala 1155:39]
        if (new_mstatus_mpp == 2'h2) begin // @[CSR.scala 1547:29]
          reg_mstatus_mpp <= 2'h0;
        end else begin
          reg_mstatus_mpp <= new_mstatus_mpp;
        end
      end else begin
        reg_mstatus_mpp <= _GEN_277;
      end
    end else begin
      reg_mstatus_mpp <= _GEN_277;
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_spp <= 1'h0; // @[CSR.scala 370:24]
    end else begin
      reg_mstatus_spp <= _GEN_485[0];
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_mpie <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_mpie <= new_mstatus_mpie; // @[CSR.scala 1158:24]
      end else begin
        reg_mstatus_mpie <= _GEN_276;
      end
    end else begin
      reg_mstatus_mpie <= _GEN_276;
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_spie <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_113) begin // @[CSR.scala 1264:41]
        reg_mstatus_spie <= new_mstatus_spie; // @[CSR.scala 1267:26]
      end else if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_spie <= new_mstatus_spie; // @[CSR.scala 1165:28]
      end else begin
        reg_mstatus_spie <= _GEN_265;
      end
    end else begin
      reg_mstatus_spie <= _GEN_265;
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_mie <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_mie <= new_mstatus_mie; // @[CSR.scala 1157:23]
      end else begin
        reg_mstatus_mie <= _GEN_275;
      end
    end else begin
      reg_mstatus_mie <= _GEN_275;
    end
    if (reset) begin // @[CSR.scala 370:24]
      reg_mstatus_sie <= 1'h0; // @[CSR.scala 370:24]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_113) begin // @[CSR.scala 1264:41]
        reg_mstatus_sie <= new_mstatus_sie; // @[CSR.scala 1266:25]
      end else if (decoded_5) begin // @[CSR.scala 1155:39]
        reg_mstatus_sie <= new_mstatus_sie; // @[CSR.scala 1166:27]
      end else begin
        reg_mstatus_sie <= _GEN_264;
      end
    end else begin
      reg_mstatus_sie <= _GEN_264;
    end
    if (reset) begin // @[CSR.scala 378:21]
      reg_dcsr_prv <= 2'h3; // @[CSR.scala 378:21]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_14) begin // @[CSR.scala 1248:38]
        if (new_dcsr_prv == 2'h2) begin // @[CSR.scala 1547:29]
          reg_dcsr_prv <= 2'h0;
        end else begin
          reg_dcsr_prv <= new_dcsr_prv;
        end
      end else begin
        reg_dcsr_prv <= _GEN_187;
      end
    end else begin
      reg_dcsr_prv <= _GEN_187;
    end
    if (_io_interrupt_T) begin // @[CSR.scala 964:25]
      reg_singleStepped <= 1'h0; // @[CSR.scala 964:45]
    end else begin
      reg_singleStepped <= _GEN_50;
    end
    if (reset) begin // @[CSR.scala 378:21]
      reg_dcsr_ebreakm <= 1'h0; // @[CSR.scala 378:21]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_14) begin // @[CSR.scala 1248:38]
        reg_dcsr_ebreakm <= new_dcsr_ebreakm; // @[CSR.scala 1251:26]
      end
    end
    if (reset) begin // @[CSR.scala 378:21]
      reg_dcsr_ebreaks <= 1'h0; // @[CSR.scala 378:21]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_14) begin // @[CSR.scala 1248:38]
        reg_dcsr_ebreaks <= new_dcsr_ebreaks; // @[CSR.scala 1252:47]
      end
    end
    if (reset) begin // @[CSR.scala 378:21]
      reg_dcsr_ebreaku <= 1'h0; // @[CSR.scala 378:21]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_14) begin // @[CSR.scala 1248:38]
        reg_dcsr_ebreaku <= new_dcsr_ebreaku; // @[CSR.scala 1253:41]
      end
    end
    if (reset) begin // @[CSR.scala 450:22]
      reg_debug <= 1'h0; // @[CSR.scala 450:22]
    end else if (insn_ret) begin // @[CSR.scala 1048:19]
      if (~io_rw_addr[9]) begin // @[CSR.scala 1050:52]
        reg_debug <= _GEN_184;
      end else if (io_rw_addr[10] & io_rw_addr[7]) begin // @[CSR.scala 1067:70]
        reg_debug <= 1'h0; // @[CSR.scala 1070:17]
      end else begin
        reg_debug <= _GEN_184;
      end
    end else begin
      reg_debug <= _GEN_184;
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_123) begin // @[CSR.scala 1296:42]
        reg_mideleg <= wdata; // @[CSR.scala 1296:56]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_124) begin // @[CSR.scala 1297:42]
        reg_medeleg <= wdata; // @[CSR.scala 1297:56]
      end
    end
    if (reset) begin // @[CSR.scala 378:21]
      reg_dcsr_cause <= 3'h0; // @[CSR.scala 378:21]
    end else if (exception) begin // @[CSR.scala 970:20]
      if (trapToDebug) begin // @[CSR.scala 971:24]
        if (~reg_debug) begin // @[CSR.scala 972:25]
          reg_dcsr_cause <= _reg_dcsr_cause_T_2; // @[CSR.scala 976:24]
        end
      end
    end
    if (reset) begin // @[CSR.scala 378:21]
      reg_dcsr_step <= 1'h0; // @[CSR.scala 378:21]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_14) begin // @[CSR.scala 1248:38]
        reg_dcsr_step <= new_dcsr_step; // @[CSR.scala 1250:23]
      end
    end
    reg_dpc <= _GEN_518[39:0];
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_16) begin // @[CSR.scala 1258:43]
        reg_dscratch0 <= wdata; // @[CSR.scala 1258:59]
      end
    end
    if (reset) begin // @[CSR.scala 1500:18]
      reg_bp_0_control_dmode <= 1'h0; // @[CSR.scala 1502:17]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_dmode <= dMode; // @[CSR.scala 1399:30]
        end
      end
    end
    if (reset) begin // @[CSR.scala 1500:18]
      reg_bp_0_control_action <= 1'h0; // @[CSR.scala 1501:18]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_action <= _GEN_352;
        end
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_tmatch <= wdata[8:7]; // @[CSR.scala 1391:24]
        end
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_m <= wdata[6]; // @[CSR.scala 1391:24]
        end
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_s <= wdata[4]; // @[CSR.scala 1391:24]
        end
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_u <= wdata[3]; // @[CSR.scala 1391:24]
        end
      end
    end
    if (reset) begin // @[CSR.scala 1500:18]
      reg_bp_0_control_x <= 1'h0; // @[CSR.scala 1506:13]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_x <= wdata[2]; // @[CSR.scala 1391:24]
        end
      end
    end
    if (reset) begin // @[CSR.scala 1500:18]
      reg_bp_0_control_w <= 1'h0; // @[CSR.scala 1505:13]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_w <= wdata[1]; // @[CSR.scala 1391:24]
        end
      end
    end
    if (reset) begin // @[CSR.scala 1500:18]
      reg_bp_0_control_r <= 1'h0; // @[CSR.scala 1504:13]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (~reg_bp_0_control_dmode | reg_debug) begin // @[CSR.scala 1378:70]
        if (decoded_1) begin // @[CSR.scala 1390:44]
          reg_bp_0_control_r <= wdata[0]; // @[CSR.scala 1391:24]
        end
      end
    end
    reg_bp_0_address <= _GEN_532[38:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_0_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_0_cfg_l <= newCfg_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_0_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_0_cfg_a <= newCfg_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_0_cfg_x <= newCfg_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_0_cfg_w <= newCfg_w & newCfg_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_0_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_0_cfg_r <= newCfg_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_0_addr <= _GEN_570[29:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_1_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_1_cfg_l <= newCfg_1_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_1_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_1_cfg_a <= newCfg_1_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_1_cfg_x <= newCfg_1_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_1_cfg_w <= newCfg_1_w & newCfg_1_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_1_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_1_cfg_r <= newCfg_1_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_1_addr <= _GEN_577[29:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_2_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_2_cfg_l <= newCfg_2_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_2_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_2_cfg_a <= newCfg_2_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_2_cfg_x <= newCfg_2_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_2_cfg_w <= newCfg_2_w & newCfg_2_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_2_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_2_cfg_r <= newCfg_2_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_2_addr <= _GEN_584[29:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_3_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_3_cfg_l <= newCfg_3_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_3_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_3_cfg_a <= newCfg_3_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_3_cfg_x <= newCfg_3_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_3_cfg_w <= newCfg_3_w & newCfg_3_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_3_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_3_cfg_r <= newCfg_3_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_3_addr <= _GEN_591[29:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_4_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_4_cfg_l <= newCfg_4_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_4_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_4_cfg_a <= newCfg_4_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_4_cfg_x <= newCfg_4_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_4_cfg_w <= newCfg_4_w & newCfg_4_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_4_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_4_cfg_r <= newCfg_4_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_4_addr <= _GEN_598[29:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_5_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_5_cfg_l <= newCfg_5_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_5_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_5_cfg_a <= newCfg_5_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_5_cfg_x <= newCfg_5_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_5_cfg_w <= newCfg_5_w & newCfg_5_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_5_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_5_cfg_r <= newCfg_5_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_5_addr <= _GEN_605[29:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_6_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_6_cfg_l <= newCfg_6_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_6_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_6_cfg_a <= newCfg_6_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_6_cfg_x <= newCfg_6_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_6_cfg_w <= newCfg_6_w & newCfg_6_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_6_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_6_cfg_r <= newCfg_6_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_6_addr <= _GEN_612[29:0];
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_7_cfg_l <= 1'h0; // @[PMP.scala 38:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_7_cfg_l <= newCfg_7_l; // @[CSR.scala 1412:17]
      end
    end
    if (reset) begin // @[CSR.scala 1517:18]
      reg_pmp_7_cfg_a <= 2'h0; // @[PMP.scala 37:11]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_7_cfg_a <= newCfg_7_a; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_7_cfg_x <= newCfg_7_x; // @[CSR.scala 1412:17]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_7_cfg_w <= newCfg_7_w & newCfg_7_r; // @[CSR.scala 1414:19]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_125 & ~reg_pmp_7_cfg_l) begin // @[CSR.scala 1410:76]
        reg_pmp_7_cfg_r <= newCfg_7_r; // @[CSR.scala 1412:17]
      end
    end
    reg_pmp_7_addr <= _GEN_619[29:0];
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_115) begin // @[CSR.scala 1290:42]
        reg_mie <= _reg_mie_T_4; // @[CSR.scala 1290:52]
      end else if (decoded_8) begin // @[CSR.scala 1208:40]
        reg_mie <= _reg_mie_T; // @[CSR.scala 1208:50]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_7) begin // @[CSR.scala 1193:35]
        reg_mip_seip <= new_mip_seip; // @[CSR.scala 1202:22]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_7) begin // @[CSR.scala 1193:35]
        reg_mip_stip <= new_mip_stip; // @[CSR.scala 1201:22]
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_114) begin // @[CSR.scala 1276:37]
        reg_mip_ssip <= new_sip_ssip; // @[CSR.scala 1278:22]
      end else if (decoded_7) begin // @[CSR.scala 1193:35]
        reg_mip_ssip <= new_mip_ssip; // @[CSR.scala 1200:22]
      end
    end
    reg_mepc <= _GEN_500[39:0];
    if (reset) begin // @[CSR.scala 474:27]
      reg_mcause <= 64'h0; // @[CSR.scala 474:27]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_12) begin // @[CSR.scala 1213:40]
        reg_mcause <= _reg_mcause_T; // @[CSR.scala 1213:53]
      end else begin
        reg_mcause <= _GEN_214;
      end
    end else begin
      reg_mcause <= _GEN_214;
    end
    reg_mtval <= _GEN_504[39:0];
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_9) begin // @[CSR.scala 1210:40]
        reg_mscratch <= wdata; // @[CSR.scala 1210:55]
      end
    end
    if (reset) begin // @[CSR.scala 480:27]
      reg_mtvec <= 32'h0; // @[CSR.scala 480:27]
    end else begin
      reg_mtvec <= _GEN_502[31:0];
    end
    reg_mcounteren <= _GEN_530[31:0];
    reg_scounteren <= _GEN_529[31:0];
    reg_sepc <= _GEN_523[39:0];
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_117) begin // @[CSR.scala 1294:42]
        reg_scause <= _reg_scause_T; // @[CSR.scala 1294:55]
      end else begin
        reg_scause <= _GEN_205;
      end
    end else begin
      reg_scause <= _GEN_205;
    end
    reg_stval <= _GEN_526[39:0];
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_116) begin // @[CSR.scala 1291:42]
        reg_sscratch <= wdata; // @[CSR.scala 1291:57]
      end
    end
    reg_stvec <= _GEN_524[38:0];
    if (reset) begin // @[CSR.scala 1463:22]
      reg_satp_mode <= 4'h0; // @[CSR.scala 1464:20]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_119) begin // @[CSR.scala 1280:38]
        if (_T_1860) begin // @[CSR.scala 1283:67]
          reg_satp_mode <= _reg_satp_mode_T; // @[CSR.scala 1284:27]
        end
      end
    end
    if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_119) begin // @[CSR.scala 1280:38]
        if (_T_1860) begin // @[CSR.scala 1283:67]
          reg_satp_ppn <= {{24'd0}, new_satp_ppn[19:0]}; // @[CSR.scala 1285:26]
        end
      end
    end
    reg_fflags <= _GEN_511[4:0];
    reg_frm <= _GEN_512[2:0];
    if (reset) begin // @[CSR.scala 548:34]
      reg_mcountinhibit <= 3'h0; // @[CSR.scala 548:34]
    end else begin
      reg_mcountinhibit <= _GEN_505[2:0];
    end
    if (reset) begin // @[Counters.scala 45:37]
      small_ <= 6'h0; // @[Counters.scala 45:37]
    end else begin
      small_ <= _GEN_508[5:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      large_ <= 58'h0; // @[Counters.scala 50:27]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_22) begin // @[CSR.scala 1561:31]
        large_ <= wdata[63:6]; // @[Counters.scala 66:23]
      end else begin
        large_ <= _GEN_1;
      end
    end else begin
      large_ <= _GEN_1;
    end
    if (reset) begin // @[CSR.scala 606:21]
      reg_misa <= 64'h800000000094112d; // @[CSR.scala 606:21]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_4) begin // @[CSR.scala 1184:36]
        if (~io_pc[1] | wdata[2]) begin // @[CSR.scala 1188:64]
          reg_misa <= _reg_misa_T_8; // @[CSR.scala 1190:20]
        end
      end
    end
    if (reset) begin // @[CSR.scala 751:43]
      reg_custom_0 <= 64'h208; // @[CSR.scala 751:43]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_143) begin // @[CSR.scala 1425:35]
        reg_custom_0 <= _reg_custom_0_T_3; // @[CSR.scala 1426:13]
      end
    end
    if (reset) begin // @[Reg.scala 28:20]
      io_status_cease_r <= 1'h0; // @[Reg.scala 28:20]
    end else begin
      io_status_cease_r <= _GEN_281;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_269 <= 3'h1) & ~reset) begin
          $fatal; // @[CSR.scala 957:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_269 <= 3'h1)) begin
          $fwrite(32'h80000002,
            "Assertion failed: these conditions must be mutually exclusive\n    at CSR.scala:957 assert(PopCount(insn_ret :: insn_call :: insn_break :: io.exception :: Nil) <= 1, \"these conditions must be mutually exclusive\")\n"
            ); // @[CSR.scala 957:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~reg_singleStepped | ~io_retire) & _T_273) begin
          $fatal; // @[CSR.scala 966:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_273 & ~(~reg_singleStepped | ~io_retire)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at CSR.scala:966 assert(!reg_singleStepped || io.retire === UInt(0))\n"); // @[CSR.scala 966:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge io_ungated_clock) begin
    if (reset) begin // @[CSR.scala 539:50]
      reg_wfi <= 1'h0; // @[CSR.scala 539:50]
    end else if (|pending_interrupts | io_interrupts_debug | exception) begin // @[CSR.scala 960:69]
      reg_wfi <= 1'h0; // @[CSR.scala 960:79]
    end else begin
      reg_wfi <= _GEN_48;
    end
    if (reset) begin // @[Counters.scala 45:37]
      small_1 <= 6'h0; // @[Counters.scala 45:37]
    end else begin
      small_1 <= _GEN_506[5:0];
    end
    if (reset) begin // @[Counters.scala 50:27]
      large_1 <= 58'h0; // @[Counters.scala 50:27]
    end else if (csr_wen) begin // @[CSR.scala 1151:18]
      if (decoded_21) begin // @[CSR.scala 1561:31]
        large_1 <= wdata[63:6]; // @[Counters.scala 66:23]
      end else begin
        large_1 <= _GEN_3;
      end
    end else begin
      large_1 <= _GEN_3;
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
  reg_mstatus_prv = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  reg_mstatus_gva = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  reg_mstatus_tsr = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  reg_mstatus_tw = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  reg_mstatus_tvm = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  reg_mstatus_mxr = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  reg_mstatus_sum = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  reg_mstatus_mprv = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  reg_mstatus_fs = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  reg_mstatus_mpp = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  reg_mstatus_spp = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  reg_mstatus_mpie = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  reg_mstatus_spie = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  reg_mstatus_mie = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  reg_mstatus_sie = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  reg_dcsr_prv = _RAND_15[1:0];
  _RAND_16 = {1{`RANDOM}};
  reg_singleStepped = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  reg_dcsr_ebreakm = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  reg_dcsr_ebreaks = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  reg_dcsr_ebreaku = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  reg_debug = _RAND_20[0:0];
  _RAND_21 = {2{`RANDOM}};
  reg_mideleg = _RAND_21[63:0];
  _RAND_22 = {2{`RANDOM}};
  reg_medeleg = _RAND_22[63:0];
  _RAND_23 = {1{`RANDOM}};
  reg_dcsr_cause = _RAND_23[2:0];
  _RAND_24 = {1{`RANDOM}};
  reg_dcsr_step = _RAND_24[0:0];
  _RAND_25 = {2{`RANDOM}};
  reg_dpc = _RAND_25[39:0];
  _RAND_26 = {2{`RANDOM}};
  reg_dscratch0 = _RAND_26[63:0];
  _RAND_27 = {1{`RANDOM}};
  reg_bp_0_control_dmode = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  reg_bp_0_control_action = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  reg_bp_0_control_tmatch = _RAND_29[1:0];
  _RAND_30 = {1{`RANDOM}};
  reg_bp_0_control_m = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  reg_bp_0_control_s = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  reg_bp_0_control_u = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  reg_bp_0_control_x = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  reg_bp_0_control_w = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  reg_bp_0_control_r = _RAND_35[0:0];
  _RAND_36 = {2{`RANDOM}};
  reg_bp_0_address = _RAND_36[38:0];
  _RAND_37 = {1{`RANDOM}};
  reg_pmp_0_cfg_l = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  reg_pmp_0_cfg_a = _RAND_38[1:0];
  _RAND_39 = {1{`RANDOM}};
  reg_pmp_0_cfg_x = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  reg_pmp_0_cfg_w = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  reg_pmp_0_cfg_r = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  reg_pmp_0_addr = _RAND_42[29:0];
  _RAND_43 = {1{`RANDOM}};
  reg_pmp_1_cfg_l = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  reg_pmp_1_cfg_a = _RAND_44[1:0];
  _RAND_45 = {1{`RANDOM}};
  reg_pmp_1_cfg_x = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  reg_pmp_1_cfg_w = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  reg_pmp_1_cfg_r = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  reg_pmp_1_addr = _RAND_48[29:0];
  _RAND_49 = {1{`RANDOM}};
  reg_pmp_2_cfg_l = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  reg_pmp_2_cfg_a = _RAND_50[1:0];
  _RAND_51 = {1{`RANDOM}};
  reg_pmp_2_cfg_x = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  reg_pmp_2_cfg_w = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  reg_pmp_2_cfg_r = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  reg_pmp_2_addr = _RAND_54[29:0];
  _RAND_55 = {1{`RANDOM}};
  reg_pmp_3_cfg_l = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  reg_pmp_3_cfg_a = _RAND_56[1:0];
  _RAND_57 = {1{`RANDOM}};
  reg_pmp_3_cfg_x = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  reg_pmp_3_cfg_w = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  reg_pmp_3_cfg_r = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  reg_pmp_3_addr = _RAND_60[29:0];
  _RAND_61 = {1{`RANDOM}};
  reg_pmp_4_cfg_l = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  reg_pmp_4_cfg_a = _RAND_62[1:0];
  _RAND_63 = {1{`RANDOM}};
  reg_pmp_4_cfg_x = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  reg_pmp_4_cfg_w = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  reg_pmp_4_cfg_r = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  reg_pmp_4_addr = _RAND_66[29:0];
  _RAND_67 = {1{`RANDOM}};
  reg_pmp_5_cfg_l = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  reg_pmp_5_cfg_a = _RAND_68[1:0];
  _RAND_69 = {1{`RANDOM}};
  reg_pmp_5_cfg_x = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  reg_pmp_5_cfg_w = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  reg_pmp_5_cfg_r = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  reg_pmp_5_addr = _RAND_72[29:0];
  _RAND_73 = {1{`RANDOM}};
  reg_pmp_6_cfg_l = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  reg_pmp_6_cfg_a = _RAND_74[1:0];
  _RAND_75 = {1{`RANDOM}};
  reg_pmp_6_cfg_x = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  reg_pmp_6_cfg_w = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  reg_pmp_6_cfg_r = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  reg_pmp_6_addr = _RAND_78[29:0];
  _RAND_79 = {1{`RANDOM}};
  reg_pmp_7_cfg_l = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  reg_pmp_7_cfg_a = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  reg_pmp_7_cfg_x = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  reg_pmp_7_cfg_w = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  reg_pmp_7_cfg_r = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  reg_pmp_7_addr = _RAND_84[29:0];
  _RAND_85 = {2{`RANDOM}};
  reg_mie = _RAND_85[63:0];
  _RAND_86 = {1{`RANDOM}};
  reg_mip_seip = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  reg_mip_stip = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  reg_mip_ssip = _RAND_88[0:0];
  _RAND_89 = {2{`RANDOM}};
  reg_mepc = _RAND_89[39:0];
  _RAND_90 = {2{`RANDOM}};
  reg_mcause = _RAND_90[63:0];
  _RAND_91 = {2{`RANDOM}};
  reg_mtval = _RAND_91[39:0];
  _RAND_92 = {2{`RANDOM}};
  reg_mscratch = _RAND_92[63:0];
  _RAND_93 = {1{`RANDOM}};
  reg_mtvec = _RAND_93[31:0];
  _RAND_94 = {1{`RANDOM}};
  reg_mcounteren = _RAND_94[31:0];
  _RAND_95 = {1{`RANDOM}};
  reg_scounteren = _RAND_95[31:0];
  _RAND_96 = {2{`RANDOM}};
  reg_sepc = _RAND_96[39:0];
  _RAND_97 = {2{`RANDOM}};
  reg_scause = _RAND_97[63:0];
  _RAND_98 = {2{`RANDOM}};
  reg_stval = _RAND_98[39:0];
  _RAND_99 = {2{`RANDOM}};
  reg_sscratch = _RAND_99[63:0];
  _RAND_100 = {2{`RANDOM}};
  reg_stvec = _RAND_100[38:0];
  _RAND_101 = {1{`RANDOM}};
  reg_satp_mode = _RAND_101[3:0];
  _RAND_102 = {2{`RANDOM}};
  reg_satp_ppn = _RAND_102[43:0];
  _RAND_103 = {1{`RANDOM}};
  reg_wfi = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  reg_fflags = _RAND_104[4:0];
  _RAND_105 = {1{`RANDOM}};
  reg_frm = _RAND_105[2:0];
  _RAND_106 = {1{`RANDOM}};
  reg_mcountinhibit = _RAND_106[2:0];
  _RAND_107 = {1{`RANDOM}};
  small_ = _RAND_107[5:0];
  _RAND_108 = {2{`RANDOM}};
  large_ = _RAND_108[57:0];
  _RAND_109 = {1{`RANDOM}};
  small_1 = _RAND_109[5:0];
  _RAND_110 = {2{`RANDOM}};
  large_1 = _RAND_110[57:0];
  _RAND_111 = {2{`RANDOM}};
  reg_misa = _RAND_111[63:0];
  _RAND_112 = {2{`RANDOM}};
  reg_custom_0 = _RAND_112[63:0];
  _RAND_113 = {1{`RANDOM}};
  io_status_cease_r = _RAND_113[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
