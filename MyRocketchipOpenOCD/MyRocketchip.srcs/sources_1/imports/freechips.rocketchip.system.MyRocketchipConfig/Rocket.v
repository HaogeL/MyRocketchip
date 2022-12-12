module Rocket(
  input         clock,
  input         reset,
  input         io_hartid,
  input         io_interrupts_debug,
  input         io_interrupts_mtip,
  input         io_interrupts_msip,
  input         io_interrupts_meip,
  input         io_interrupts_seip,
  output        io_imem_might_request,
  output        io_imem_req_valid,
  output [39:0] io_imem_req_bits_pc,
  output        io_imem_req_bits_speculative,
  output        io_imem_sfence_valid,
  output        io_imem_sfence_bits_rs1,
  output        io_imem_sfence_bits_rs2,
  output [38:0] io_imem_sfence_bits_addr,
  output        io_imem_resp_ready,
  input         io_imem_resp_valid,
  input         io_imem_resp_bits_btb_taken,
  input         io_imem_resp_bits_btb_bridx,
  input  [4:0]  io_imem_resp_bits_btb_entry,
  input  [7:0]  io_imem_resp_bits_btb_bht_history,
  input  [39:0] io_imem_resp_bits_pc,
  input  [31:0] io_imem_resp_bits_data,
  input         io_imem_resp_bits_xcpt_pf_inst,
  input         io_imem_resp_bits_xcpt_ae_inst,
  input         io_imem_resp_bits_replay,
  output        io_imem_btb_update_valid,
  output [4:0]  io_imem_btb_update_bits_prediction_entry,
  output [38:0] io_imem_btb_update_bits_pc,
  output        io_imem_btb_update_bits_isValid,
  output [38:0] io_imem_btb_update_bits_br_pc,
  output [1:0]  io_imem_btb_update_bits_cfiType,
  output        io_imem_bht_update_valid,
  output [7:0]  io_imem_bht_update_bits_prediction_history,
  output [38:0] io_imem_bht_update_bits_pc,
  output        io_imem_bht_update_bits_branch,
  output        io_imem_bht_update_bits_taken,
  output        io_imem_bht_update_bits_mispredict,
  output        io_imem_flush_icache,
  output        io_imem_progress,
  input         io_dmem_req_ready,
  output        io_dmem_req_valid,
  output [39:0] io_dmem_req_bits_addr,
  output [6:0]  io_dmem_req_bits_tag,
  output [4:0]  io_dmem_req_bits_cmd,
  output [1:0]  io_dmem_req_bits_size,
  output        io_dmem_req_bits_signed,
  output [1:0]  io_dmem_req_bits_dprv,
  output        io_dmem_req_bits_dv,
  output        io_dmem_s1_kill,
  output [63:0] io_dmem_s1_data_data,
  input         io_dmem_s2_nack,
  input         io_dmem_resp_valid,
  input  [6:0]  io_dmem_resp_bits_tag,
  input  [1:0]  io_dmem_resp_bits_size,
  input  [63:0] io_dmem_resp_bits_data,
  input         io_dmem_resp_bits_replay,
  input         io_dmem_resp_bits_has_data,
  input  [63:0] io_dmem_resp_bits_data_word_bypass,
  input         io_dmem_replay_next,
  input         io_dmem_s2_xcpt_ma_ld,
  input         io_dmem_s2_xcpt_ma_st,
  input         io_dmem_s2_xcpt_pf_ld,
  input         io_dmem_s2_xcpt_pf_st,
  input         io_dmem_s2_xcpt_ae_ld,
  input         io_dmem_s2_xcpt_ae_st,
  input         io_dmem_ordered,
  input         io_dmem_perf_release,
  input         io_dmem_perf_grant,
  output [3:0]  io_ptw_ptbr_mode,
  output [43:0] io_ptw_ptbr_ppn,
  output        io_ptw_sfence_valid,
  output        io_ptw_sfence_bits_rs1,
  output        io_ptw_status_debug,
  output [1:0]  io_ptw_status_prv,
  output        io_ptw_status_mxr,
  output        io_ptw_status_sum,
  output        io_ptw_pmp_0_cfg_l,
  output [1:0]  io_ptw_pmp_0_cfg_a,
  output        io_ptw_pmp_0_cfg_x,
  output        io_ptw_pmp_0_cfg_w,
  output        io_ptw_pmp_0_cfg_r,
  output [29:0] io_ptw_pmp_0_addr,
  output [31:0] io_ptw_pmp_0_mask,
  output        io_ptw_pmp_1_cfg_l,
  output [1:0]  io_ptw_pmp_1_cfg_a,
  output        io_ptw_pmp_1_cfg_x,
  output        io_ptw_pmp_1_cfg_w,
  output        io_ptw_pmp_1_cfg_r,
  output [29:0] io_ptw_pmp_1_addr,
  output [31:0] io_ptw_pmp_1_mask,
  output        io_ptw_pmp_2_cfg_l,
  output [1:0]  io_ptw_pmp_2_cfg_a,
  output        io_ptw_pmp_2_cfg_x,
  output        io_ptw_pmp_2_cfg_w,
  output        io_ptw_pmp_2_cfg_r,
  output [29:0] io_ptw_pmp_2_addr,
  output [31:0] io_ptw_pmp_2_mask,
  output        io_ptw_pmp_3_cfg_l,
  output [1:0]  io_ptw_pmp_3_cfg_a,
  output        io_ptw_pmp_3_cfg_x,
  output        io_ptw_pmp_3_cfg_w,
  output        io_ptw_pmp_3_cfg_r,
  output [29:0] io_ptw_pmp_3_addr,
  output [31:0] io_ptw_pmp_3_mask,
  output        io_ptw_pmp_4_cfg_l,
  output [1:0]  io_ptw_pmp_4_cfg_a,
  output        io_ptw_pmp_4_cfg_x,
  output        io_ptw_pmp_4_cfg_w,
  output        io_ptw_pmp_4_cfg_r,
  output [29:0] io_ptw_pmp_4_addr,
  output [31:0] io_ptw_pmp_4_mask,
  output        io_ptw_pmp_5_cfg_l,
  output [1:0]  io_ptw_pmp_5_cfg_a,
  output        io_ptw_pmp_5_cfg_x,
  output        io_ptw_pmp_5_cfg_w,
  output        io_ptw_pmp_5_cfg_r,
  output [29:0] io_ptw_pmp_5_addr,
  output [31:0] io_ptw_pmp_5_mask,
  output        io_ptw_pmp_6_cfg_l,
  output [1:0]  io_ptw_pmp_6_cfg_a,
  output        io_ptw_pmp_6_cfg_x,
  output        io_ptw_pmp_6_cfg_w,
  output        io_ptw_pmp_6_cfg_r,
  output [29:0] io_ptw_pmp_6_addr,
  output [31:0] io_ptw_pmp_6_mask,
  output        io_ptw_pmp_7_cfg_l,
  output [1:0]  io_ptw_pmp_7_cfg_a,
  output        io_ptw_pmp_7_cfg_x,
  output        io_ptw_pmp_7_cfg_w,
  output        io_ptw_pmp_7_cfg_r,
  output [29:0] io_ptw_pmp_7_addr,
  output [31:0] io_ptw_pmp_7_mask,
  output [63:0] io_ptw_customCSRs_csrs_0_value,
  output [31:0] io_fpu_inst,
  output [63:0] io_fpu_fromint_data,
  output [2:0]  io_fpu_fcsr_rm,
  input         io_fpu_fcsr_flags_valid,
  input  [4:0]  io_fpu_fcsr_flags_bits,
  input  [63:0] io_fpu_store_data,
  input  [63:0] io_fpu_toint_data,
  output        io_fpu_dmem_resp_val,
  output [2:0]  io_fpu_dmem_resp_type,
  output [4:0]  io_fpu_dmem_resp_tag,
  output [63:0] io_fpu_dmem_resp_data,
  output        io_fpu_valid,
  input         io_fpu_fcsr_rdy,
  input         io_fpu_nack_mem,
  input         io_fpu_illegal_rm,
  output        io_fpu_killx,
  output        io_fpu_killm,
  input         io_fpu_dec_wen,
  input         io_fpu_dec_ren1,
  input         io_fpu_dec_ren2,
  input         io_fpu_dec_ren3,
  input         io_fpu_sboard_set,
  input         io_fpu_sboard_clr,
  input  [4:0]  io_fpu_sboard_clra,
  output        io_rocc_cmd_valid,
  output        io_wfi
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
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
  reg [63:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [63:0] _RAND_64;
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
  reg [63:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [63:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [63:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [63:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [63:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [63:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [63:0] _RAND_106;
  reg [63:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [63:0] _RAND_114;
  reg [63:0] _RAND_115;
  reg [63:0] _RAND_116;
  reg [63:0] _RAND_117;
`endif // RANDOMIZE_REG_INIT
  wire  ibuf_clock; // @[RocketCore.scala 264:20]
  wire  ibuf_reset; // @[RocketCore.scala 264:20]
  wire  ibuf_io_imem_ready; // @[RocketCore.scala 264:20]
  wire  ibuf_io_imem_valid; // @[RocketCore.scala 264:20]
  wire  ibuf_io_imem_bits_btb_taken; // @[RocketCore.scala 264:20]
  wire  ibuf_io_imem_bits_btb_bridx; // @[RocketCore.scala 264:20]
  wire [4:0] ibuf_io_imem_bits_btb_entry; // @[RocketCore.scala 264:20]
  wire [7:0] ibuf_io_imem_bits_btb_bht_history; // @[RocketCore.scala 264:20]
  wire [39:0] ibuf_io_imem_bits_pc; // @[RocketCore.scala 264:20]
  wire [31:0] ibuf_io_imem_bits_data; // @[RocketCore.scala 264:20]
  wire  ibuf_io_imem_bits_xcpt_pf_inst; // @[RocketCore.scala 264:20]
  wire  ibuf_io_imem_bits_xcpt_ae_inst; // @[RocketCore.scala 264:20]
  wire  ibuf_io_imem_bits_replay; // @[RocketCore.scala 264:20]
  wire  ibuf_io_kill; // @[RocketCore.scala 264:20]
  wire [39:0] ibuf_io_pc; // @[RocketCore.scala 264:20]
  wire [4:0] ibuf_io_btb_resp_entry; // @[RocketCore.scala 264:20]
  wire [7:0] ibuf_io_btb_resp_bht_history; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_ready; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_valid; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_bits_xcpt0_pf_inst; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_bits_xcpt0_ae_inst; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_bits_xcpt1_pf_inst; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_bits_xcpt1_gf_inst; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_bits_xcpt1_ae_inst; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_bits_replay; // @[RocketCore.scala 264:20]
  wire  ibuf_io_inst_0_bits_rvc; // @[RocketCore.scala 264:20]
  wire [31:0] ibuf_io_inst_0_bits_inst_bits; // @[RocketCore.scala 264:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rd; // @[RocketCore.scala 264:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 264:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 264:20]
  wire [4:0] ibuf_io_inst_0_bits_inst_rs3; // @[RocketCore.scala 264:20]
  wire [31:0] ibuf_io_inst_0_bits_raw; // @[RocketCore.scala 264:20]
  reg [63:0] rf [0:30]; // @[RocketCore.scala 1064:15]
  wire  rf_id_rs_MPORT_en; // @[RocketCore.scala 1064:15]
  wire [4:0] rf_id_rs_MPORT_addr; // @[RocketCore.scala 1064:15]
  wire [63:0] rf_id_rs_MPORT_data; // @[RocketCore.scala 1064:15]
  wire  rf_id_rs_MPORT_1_en; // @[RocketCore.scala 1064:15]
  wire [4:0] rf_id_rs_MPORT_1_addr; // @[RocketCore.scala 1064:15]
  wire [63:0] rf_id_rs_MPORT_1_data; // @[RocketCore.scala 1064:15]
  wire [63:0] rf_MPORT_data; // @[RocketCore.scala 1064:15]
  wire [4:0] rf_MPORT_addr; // @[RocketCore.scala 1064:15]
  wire  rf_MPORT_mask; // @[RocketCore.scala 1064:15]
  wire  rf_MPORT_en; // @[RocketCore.scala 1064:15]
  wire  csr_clock; // @[RocketCore.scala 293:19]
  wire  csr_reset; // @[RocketCore.scala 293:19]
  wire  csr_io_ungated_clock; // @[RocketCore.scala 293:19]
  wire  csr_io_interrupts_debug; // @[RocketCore.scala 293:19]
  wire  csr_io_interrupts_mtip; // @[RocketCore.scala 293:19]
  wire  csr_io_interrupts_msip; // @[RocketCore.scala 293:19]
  wire  csr_io_interrupts_meip; // @[RocketCore.scala 293:19]
  wire  csr_io_interrupts_seip; // @[RocketCore.scala 293:19]
  wire  csr_io_hartid; // @[RocketCore.scala 293:19]
  wire [11:0] csr_io_rw_addr; // @[RocketCore.scala 293:19]
  wire [2:0] csr_io_rw_cmd; // @[RocketCore.scala 293:19]
  wire [63:0] csr_io_rw_rdata; // @[RocketCore.scala 293:19]
  wire [63:0] csr_io_rw_wdata; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_decode_0_inst; // @[RocketCore.scala 293:19]
  wire  csr_io_decode_0_fp_illegal; // @[RocketCore.scala 293:19]
  wire  csr_io_decode_0_fp_csr; // @[RocketCore.scala 293:19]
  wire  csr_io_decode_0_rocc_illegal; // @[RocketCore.scala 293:19]
  wire  csr_io_decode_0_read_illegal; // @[RocketCore.scala 293:19]
  wire  csr_io_decode_0_write_illegal; // @[RocketCore.scala 293:19]
  wire  csr_io_decode_0_write_flush; // @[RocketCore.scala 293:19]
  wire  csr_io_decode_0_system_illegal; // @[RocketCore.scala 293:19]
  wire  csr_io_csr_stall; // @[RocketCore.scala 293:19]
  wire  csr_io_eret; // @[RocketCore.scala 293:19]
  wire  csr_io_singleStep; // @[RocketCore.scala 293:19]
  wire  csr_io_status_debug; // @[RocketCore.scala 293:19]
  wire  csr_io_status_cease; // @[RocketCore.scala 293:19]
  wire  csr_io_status_wfi; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_status_isa; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_dprv; // @[RocketCore.scala 293:19]
  wire  csr_io_status_dv; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_prv; // @[RocketCore.scala 293:19]
  wire  csr_io_status_v; // @[RocketCore.scala 293:19]
  wire  csr_io_status_sd; // @[RocketCore.scala 293:19]
  wire [22:0] csr_io_status_zero2; // @[RocketCore.scala 293:19]
  wire  csr_io_status_mpv; // @[RocketCore.scala 293:19]
  wire  csr_io_status_gva; // @[RocketCore.scala 293:19]
  wire  csr_io_status_mbe; // @[RocketCore.scala 293:19]
  wire  csr_io_status_sbe; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_sxl; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_uxl; // @[RocketCore.scala 293:19]
  wire  csr_io_status_sd_rv32; // @[RocketCore.scala 293:19]
  wire [7:0] csr_io_status_zero1; // @[RocketCore.scala 293:19]
  wire  csr_io_status_tsr; // @[RocketCore.scala 293:19]
  wire  csr_io_status_tw; // @[RocketCore.scala 293:19]
  wire  csr_io_status_tvm; // @[RocketCore.scala 293:19]
  wire  csr_io_status_mxr; // @[RocketCore.scala 293:19]
  wire  csr_io_status_sum; // @[RocketCore.scala 293:19]
  wire  csr_io_status_mprv; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_xs; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_fs; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_mpp; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_status_vs; // @[RocketCore.scala 293:19]
  wire  csr_io_status_spp; // @[RocketCore.scala 293:19]
  wire  csr_io_status_mpie; // @[RocketCore.scala 293:19]
  wire  csr_io_status_ube; // @[RocketCore.scala 293:19]
  wire  csr_io_status_spie; // @[RocketCore.scala 293:19]
  wire  csr_io_status_upie; // @[RocketCore.scala 293:19]
  wire  csr_io_status_mie; // @[RocketCore.scala 293:19]
  wire  csr_io_status_hie; // @[RocketCore.scala 293:19]
  wire  csr_io_status_sie; // @[RocketCore.scala 293:19]
  wire  csr_io_status_uie; // @[RocketCore.scala 293:19]
  wire [3:0] csr_io_ptbr_mode; // @[RocketCore.scala 293:19]
  wire [43:0] csr_io_ptbr_ppn; // @[RocketCore.scala 293:19]
  wire [39:0] csr_io_evec; // @[RocketCore.scala 293:19]
  wire  csr_io_exception; // @[RocketCore.scala 293:19]
  wire  csr_io_retire; // @[RocketCore.scala 293:19]
  wire [63:0] csr_io_cause; // @[RocketCore.scala 293:19]
  wire [39:0] csr_io_pc; // @[RocketCore.scala 293:19]
  wire [39:0] csr_io_tval; // @[RocketCore.scala 293:19]
  wire  csr_io_gva; // @[RocketCore.scala 293:19]
  wire [63:0] csr_io_time; // @[RocketCore.scala 293:19]
  wire [2:0] csr_io_fcsr_rm; // @[RocketCore.scala 293:19]
  wire  csr_io_fcsr_flags_valid; // @[RocketCore.scala 293:19]
  wire [4:0] csr_io_fcsr_flags_bits; // @[RocketCore.scala 293:19]
  wire  csr_io_interrupt; // @[RocketCore.scala 293:19]
  wire [63:0] csr_io_interrupt_cause; // @[RocketCore.scala 293:19]
  wire  csr_io_bp_0_control_action; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_bp_0_control_tmatch; // @[RocketCore.scala 293:19]
  wire  csr_io_bp_0_control_m; // @[RocketCore.scala 293:19]
  wire  csr_io_bp_0_control_s; // @[RocketCore.scala 293:19]
  wire  csr_io_bp_0_control_u; // @[RocketCore.scala 293:19]
  wire  csr_io_bp_0_control_x; // @[RocketCore.scala 293:19]
  wire  csr_io_bp_0_control_w; // @[RocketCore.scala 293:19]
  wire  csr_io_bp_0_control_r; // @[RocketCore.scala 293:19]
  wire [38:0] csr_io_bp_0_address; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_0_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_0_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_0_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_0_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_0_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_0_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_0_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_1_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_1_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_1_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_1_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_1_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_1_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_1_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_2_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_2_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_2_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_2_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_2_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_2_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_2_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_3_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_3_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_3_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_3_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_3_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_3_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_3_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_4_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_4_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_4_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_4_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_4_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_4_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_4_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_5_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_5_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_5_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_5_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_5_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_5_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_5_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_6_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_6_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_6_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_6_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_6_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_6_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_6_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_7_cfg_l; // @[RocketCore.scala 293:19]
  wire [1:0] csr_io_pmp_7_cfg_a; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_7_cfg_x; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_7_cfg_w; // @[RocketCore.scala 293:19]
  wire  csr_io_pmp_7_cfg_r; // @[RocketCore.scala 293:19]
  wire [29:0] csr_io_pmp_7_addr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_pmp_7_mask; // @[RocketCore.scala 293:19]
  wire  csr_io_inhibit_cycle; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_inst_0; // @[RocketCore.scala 293:19]
  wire  csr_io_trace_0_valid; // @[RocketCore.scala 293:19]
  wire [39:0] csr_io_trace_0_iaddr; // @[RocketCore.scala 293:19]
  wire [31:0] csr_io_trace_0_insn; // @[RocketCore.scala 293:19]
  wire  csr_io_trace_0_exception; // @[RocketCore.scala 293:19]
  wire [63:0] csr_io_customCSRs_0_value; // @[RocketCore.scala 293:19]
  wire  bpu_io_status_debug; // @[RocketCore.scala 336:19]
  wire [1:0] bpu_io_status_prv; // @[RocketCore.scala 336:19]
  wire  bpu_io_bp_0_control_action; // @[RocketCore.scala 336:19]
  wire [1:0] bpu_io_bp_0_control_tmatch; // @[RocketCore.scala 336:19]
  wire  bpu_io_bp_0_control_m; // @[RocketCore.scala 336:19]
  wire  bpu_io_bp_0_control_s; // @[RocketCore.scala 336:19]
  wire  bpu_io_bp_0_control_u; // @[RocketCore.scala 336:19]
  wire  bpu_io_bp_0_control_x; // @[RocketCore.scala 336:19]
  wire  bpu_io_bp_0_control_w; // @[RocketCore.scala 336:19]
  wire  bpu_io_bp_0_control_r; // @[RocketCore.scala 336:19]
  wire [38:0] bpu_io_bp_0_address; // @[RocketCore.scala 336:19]
  wire [38:0] bpu_io_pc; // @[RocketCore.scala 336:19]
  wire [38:0] bpu_io_ea; // @[RocketCore.scala 336:19]
  wire  bpu_io_xcpt_if; // @[RocketCore.scala 336:19]
  wire  bpu_io_xcpt_ld; // @[RocketCore.scala 336:19]
  wire  bpu_io_xcpt_st; // @[RocketCore.scala 336:19]
  wire  bpu_io_debug_if; // @[RocketCore.scala 336:19]
  wire  bpu_io_debug_ld; // @[RocketCore.scala 336:19]
  wire  bpu_io_debug_st; // @[RocketCore.scala 336:19]
  wire  alu_io_dw; // @[RocketCore.scala 401:19]
  wire [3:0] alu_io_fn; // @[RocketCore.scala 401:19]
  wire [63:0] alu_io_in2; // @[RocketCore.scala 401:19]
  wire [63:0] alu_io_in1; // @[RocketCore.scala 401:19]
  wire [63:0] alu_io_out; // @[RocketCore.scala 401:19]
  wire [63:0] alu_io_adder_out; // @[RocketCore.scala 401:19]
  wire  alu_io_cmp_out; // @[RocketCore.scala 401:19]
  wire  div_clock; // @[RocketCore.scala 425:19]
  wire  div_reset; // @[RocketCore.scala 425:19]
  wire  div_io_req_ready; // @[RocketCore.scala 425:19]
  wire  div_io_req_valid; // @[RocketCore.scala 425:19]
  wire [3:0] div_io_req_bits_fn; // @[RocketCore.scala 425:19]
  wire  div_io_req_bits_dw; // @[RocketCore.scala 425:19]
  wire [63:0] div_io_req_bits_in1; // @[RocketCore.scala 425:19]
  wire [63:0] div_io_req_bits_in2; // @[RocketCore.scala 425:19]
  wire [4:0] div_io_req_bits_tag; // @[RocketCore.scala 425:19]
  wire  div_io_kill; // @[RocketCore.scala 425:19]
  wire  div_io_resp_ready; // @[RocketCore.scala 425:19]
  wire  div_io_resp_valid; // @[RocketCore.scala 425:19]
  wire [63:0] div_io_resp_bits_data; // @[RocketCore.scala 425:19]
  wire [4:0] div_io_resp_bits_tag; // @[RocketCore.scala 425:19]
  wire  PlusArgTimeout_clock; // @[PlusArg.scala 89:11]
  wire  PlusArgTimeout_reset; // @[PlusArg.scala 89:11]
  wire [31:0] PlusArgTimeout_io_count; // @[PlusArg.scala 89:11]
  reg  id_reg_pause; // @[RocketCore.scala 117:25]
  reg  imem_might_request_reg; // @[RocketCore.scala 118:35]
  reg  ex_ctrl_fp; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_rocc; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_branch; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_jal; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_jalr; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_rxs2; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_rxs1; // @[RocketCore.scala 195:20]
  reg [1:0] ex_ctrl_sel_alu2; // @[RocketCore.scala 195:20]
  reg [1:0] ex_ctrl_sel_alu1; // @[RocketCore.scala 195:20]
  reg [2:0] ex_ctrl_sel_imm; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_alu_dw; // @[RocketCore.scala 195:20]
  reg [3:0] ex_ctrl_alu_fn; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_mem; // @[RocketCore.scala 195:20]
  reg [4:0] ex_ctrl_mem_cmd; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_rfs1; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_rfs2; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_wfd; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_mul; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_div; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_wxd; // @[RocketCore.scala 195:20]
  reg [2:0] ex_ctrl_csr; // @[RocketCore.scala 195:20]
  reg  ex_ctrl_fence_i; // @[RocketCore.scala 195:20]
  reg  mem_ctrl_fp; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_rocc; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_branch; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_jal; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_jalr; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_rxs2; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_rxs1; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_mem; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_rfs1; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_rfs2; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_wfd; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_mul; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_div; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_wxd; // @[RocketCore.scala 196:21]
  reg [2:0] mem_ctrl_csr; // @[RocketCore.scala 196:21]
  reg  mem_ctrl_fence_i; // @[RocketCore.scala 196:21]
  reg  wb_ctrl_rocc; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_rxs2; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_rxs1; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_mem; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_rfs1; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_rfs2; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_wfd; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_div; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_wxd; // @[RocketCore.scala 197:20]
  reg [2:0] wb_ctrl_csr; // @[RocketCore.scala 197:20]
  reg  wb_ctrl_fence_i; // @[RocketCore.scala 197:20]
  reg  ex_reg_xcpt_interrupt; // @[RocketCore.scala 199:35]
  reg  ex_reg_valid; // @[RocketCore.scala 200:35]
  reg  ex_reg_rvc; // @[RocketCore.scala 201:35]
  reg [4:0] ex_reg_btb_resp_entry; // @[RocketCore.scala 202:35]
  reg [7:0] ex_reg_btb_resp_bht_history; // @[RocketCore.scala 202:35]
  reg  ex_reg_xcpt; // @[RocketCore.scala 203:35]
  reg  ex_reg_flush_pipe; // @[RocketCore.scala 204:35]
  reg  ex_reg_load_use; // @[RocketCore.scala 205:35]
  reg [63:0] ex_reg_cause; // @[RocketCore.scala 206:35]
  reg  ex_reg_replay; // @[RocketCore.scala 207:26]
  reg [39:0] ex_reg_pc; // @[RocketCore.scala 208:22]
  reg [1:0] ex_reg_mem_size; // @[RocketCore.scala 209:28]
  reg [31:0] ex_reg_inst; // @[RocketCore.scala 211:24]
  reg [31:0] ex_reg_raw_inst; // @[RocketCore.scala 212:28]
  reg  mem_reg_xcpt_interrupt; // @[RocketCore.scala 217:36]
  reg  mem_reg_valid; // @[RocketCore.scala 218:36]
  reg  mem_reg_rvc; // @[RocketCore.scala 219:36]
  reg [4:0] mem_reg_btb_resp_entry; // @[RocketCore.scala 220:36]
  reg [7:0] mem_reg_btb_resp_bht_history; // @[RocketCore.scala 220:36]
  reg  mem_reg_xcpt; // @[RocketCore.scala 221:36]
  reg  mem_reg_replay; // @[RocketCore.scala 222:36]
  reg  mem_reg_flush_pipe; // @[RocketCore.scala 223:36]
  reg [63:0] mem_reg_cause; // @[RocketCore.scala 224:36]
  reg  mem_reg_slow_bypass; // @[RocketCore.scala 225:36]
  reg  mem_reg_load; // @[RocketCore.scala 226:36]
  reg  mem_reg_store; // @[RocketCore.scala 227:36]
  reg  mem_reg_sfence; // @[RocketCore.scala 228:27]
  reg [39:0] mem_reg_pc; // @[RocketCore.scala 229:23]
  reg [31:0] mem_reg_inst; // @[RocketCore.scala 230:25]
  reg [1:0] mem_reg_mem_size; // @[RocketCore.scala 231:29]
  reg  mem_reg_hls_or_dv; // @[RocketCore.scala 232:30]
  reg [31:0] mem_reg_raw_inst; // @[RocketCore.scala 233:29]
  reg [63:0] mem_reg_wdata; // @[RocketCore.scala 236:26]
  reg [63:0] mem_reg_rs2; // @[RocketCore.scala 237:24]
  reg  mem_br_taken; // @[RocketCore.scala 238:25]
  reg  wb_reg_valid; // @[RocketCore.scala 242:35]
  reg  wb_reg_xcpt; // @[RocketCore.scala 243:35]
  reg  wb_reg_replay; // @[RocketCore.scala 244:35]
  reg  wb_reg_flush_pipe; // @[RocketCore.scala 245:35]
  reg [63:0] wb_reg_cause; // @[RocketCore.scala 246:35]
  reg  wb_reg_sfence; // @[RocketCore.scala 247:26]
  reg [39:0] wb_reg_pc; // @[RocketCore.scala 248:22]
  reg [1:0] wb_reg_mem_size; // @[RocketCore.scala 249:28]
  reg  wb_reg_hls_or_dv; // @[RocketCore.scala 250:29]
  reg [31:0] wb_reg_inst; // @[RocketCore.scala 253:24]
  reg [31:0] wb_reg_raw_inst; // @[RocketCore.scala 254:28]
  reg [63:0] wb_reg_wdata; // @[RocketCore.scala 255:25]
  wire  replay_wb_common = io_dmem_s2_nack | wb_reg_replay; // @[RocketCore.scala 666:42]
  wire  replay_wb_rocc = wb_reg_valid & wb_ctrl_rocc; // @[RocketCore.scala 667:37]
  wire  replay_wb = replay_wb_common | replay_wb_rocc; // @[RocketCore.scala 668:36]
  wire  _T_96 = wb_reg_valid & wb_ctrl_mem; // @[RocketCore.scala 639:19]
  wire  _T_97 = wb_reg_valid & wb_ctrl_mem & io_dmem_s2_xcpt_pf_st; // @[RocketCore.scala 639:34]
  wire  _T_99 = _T_96 & io_dmem_s2_xcpt_pf_ld; // @[RocketCore.scala 640:34]
  wire  _T_105 = _T_96 & io_dmem_s2_xcpt_ae_st; // @[RocketCore.scala 643:34]
  wire  _T_107 = _T_96 & io_dmem_s2_xcpt_ae_ld; // @[RocketCore.scala 644:34]
  wire  _T_109 = _T_96 & io_dmem_s2_xcpt_ma_st; // @[RocketCore.scala 645:34]
  wire  _T_111 = _T_96 & io_dmem_s2_xcpt_ma_ld; // @[RocketCore.scala 646:34]
  wire  wb_xcpt = wb_reg_xcpt | _T_97 | _T_99 | _T_105 | _T_107 | _T_109 | _T_111; // @[RocketCore.scala 1024:26]
  wire  take_pc_wb = replay_wb | wb_xcpt | csr_io_eret | wb_reg_flush_pipe; // @[RocketCore.scala 669:53]
  wire  _take_pc_mem_T = ~mem_reg_xcpt; // @[RocketCore.scala 543:35]
  wire  ex_pc_valid = ex_reg_valid | ex_reg_replay | ex_reg_xcpt_interrupt; // @[RocketCore.scala 510:51]
  wire [63:0] _mem_npc_a_T = mem_reg_wdata; // @[RocketCore.scala 1038:16]
  wire [24:0] a = _mem_npc_a_T[63:39]; // @[RocketCore.scala 1038:23]
  wire  msb = $signed(a) == 25'sh0 | $signed(a) == -25'sh1 ? mem_reg_wdata[39] : ~mem_reg_wdata[38]; // @[RocketCore.scala 1039:18]
  wire [39:0] _mem_npc_T_3 = {msb,mem_reg_wdata[38:0]}; // @[RocketCore.scala 533:106]
  wire  _mem_br_target_T_1 = mem_ctrl_branch & mem_br_taken; // @[RocketCore.scala 530:25]
  wire  mem_br_target_sign = mem_reg_inst[31]; // @[RocketCore.scala 1086:53]
  wire  mem_br_target_hi_hi_hi = mem_reg_inst[31]; // @[Cat.scala 31:58]
  wire [10:0] mem_br_target_hi_hi_lo = {11{mem_br_target_sign}}; // @[Cat.scala 31:58]
  wire [7:0] mem_br_target_hi_lo_hi = {8{mem_br_target_sign}}; // @[Cat.scala 31:58]
  wire  mem_br_target_hi_lo_lo = mem_reg_inst[7]; // @[Cat.scala 31:58]
  wire [5:0] mem_br_target_b10_5 = mem_reg_inst[30:25]; // @[RocketCore.scala 1092:66]
  wire [3:0] mem_br_target_b4_1 = mem_reg_inst[11:8]; // @[RocketCore.scala 1094:57]
  wire [31:0] _mem_br_target_T_3 = {mem_br_target_hi_hi_hi,mem_br_target_hi_hi_lo,mem_br_target_hi_lo_hi,
    mem_br_target_hi_lo_lo,mem_br_target_b10_5,mem_br_target_b4_1,1'h0}; // @[RocketCore.scala 1100:53]
  wire [7:0] mem_br_target_hi_lo_hi_1 = mem_reg_inst[19:12]; // @[Cat.scala 31:58]
  wire  mem_br_target_hi_lo_lo_1 = mem_reg_inst[20]; // @[Cat.scala 31:58]
  wire [31:0] _mem_br_target_T_5 = {mem_br_target_hi_hi_hi,mem_br_target_hi_hi_lo,mem_br_target_hi_lo_hi_1,
    mem_br_target_hi_lo_lo_1,mem_br_target_b10_5,mem_reg_inst[24:21],1'h0}; // @[RocketCore.scala 1100:53]
  wire [3:0] _mem_br_target_T_6 = mem_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); // @[RocketCore.scala 532:8]
  wire [31:0] _mem_br_target_T_7 = mem_ctrl_jal ? $signed(_mem_br_target_T_5) : $signed({{28{_mem_br_target_T_6[3]}},
    _mem_br_target_T_6}); // @[RocketCore.scala 531:8]
  wire [31:0] _mem_br_target_T_8 = mem_ctrl_branch & mem_br_taken ? $signed(_mem_br_target_T_3) : $signed(
    _mem_br_target_T_7); // @[RocketCore.scala 530:8]
  wire [39:0] _GEN_255 = {{8{_mem_br_target_T_8[31]}},_mem_br_target_T_8}; // @[RocketCore.scala 529:41]
  wire [39:0] mem_br_target = $signed(mem_reg_pc) + $signed(_GEN_255); // @[RocketCore.scala 529:41]
  wire [39:0] _mem_npc_T_4 = mem_ctrl_jalr | mem_reg_sfence ? $signed(_mem_npc_T_3) : $signed(mem_br_target); // @[RocketCore.scala 533:21]
  wire [39:0] mem_npc = $signed(_mem_npc_T_4) & -40'sh2; // @[RocketCore.scala 533:141]
  wire  _mem_wrong_npc_T_3 = ibuf_io_inst_0_valid | ibuf_io_imem_valid ? mem_npc != ibuf_io_pc : 1'h1; // @[RocketCore.scala 536:8]
  wire  mem_wrong_npc = ex_pc_valid ? mem_npc != ex_reg_pc : _mem_wrong_npc_T_3; // @[RocketCore.scala 535:8]
  wire  take_pc_mem = mem_reg_valid & ~mem_reg_xcpt & (mem_wrong_npc | mem_reg_sfence); // @[RocketCore.scala 543:49]
  wire  take_pc_mem_wb = take_pc_wb | take_pc_mem; // @[RocketCore.scala 260:35]
  wire [31:0] id_ctrl_decoder_decoded_plaInput = ibuf_io_inst_0_bits_inst_bits; // @[decoder.scala 38:16 pla.scala 77:22]
  wire [31:0] id_ctrl_decoder_decoded_invInputs = ~id_ctrl_decoder_decoded_plaInput; // @[pla.scala 78:21]
  wire  id_ctrl_decoder_decoded_andMatrixInput_0 = id_ctrl_decoder_decoded_plaInput[0]; // @[pla.scala 90:45]
  wire  id_ctrl_decoder_decoded_andMatrixInput_1 = id_ctrl_decoder_decoded_plaInput[1]; // @[pla.scala 90:45]
  wire  id_ctrl_decoder_decoded_andMatrixInput_2 = id_ctrl_decoder_decoded_invInputs[2]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_3 = id_ctrl_decoder_decoded_invInputs[3]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_4 = id_ctrl_decoder_decoded_invInputs[5]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_5 = id_ctrl_decoder_decoded_invInputs[6]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_6 = id_ctrl_decoder_decoded_invInputs[12]; // @[pla.scala 91:29]
  wire [6:0] _id_ctrl_decoder_decoded_T = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_6}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_1 = &_id_ctrl_decoder_decoded_T; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_4_1 = id_ctrl_decoder_decoded_invInputs[4]; // @[pla.scala 91:29]
  wire [7:0] _id_ctrl_decoder_decoded_T_2 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_6}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_3 = &_id_ctrl_decoder_decoded_T_2; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_7_1 = id_ctrl_decoder_decoded_invInputs[13]; // @[pla.scala 91:29]
  wire [7:0] _id_ctrl_decoder_decoded_T_4 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_1}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_5 = &_id_ctrl_decoder_decoded_T_4; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_6_3 = id_ctrl_decoder_decoded_invInputs[14]; // @[pla.scala 91:29]
  wire [6:0] _id_ctrl_decoder_decoded_T_6 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_7 = &_id_ctrl_decoder_decoded_T_6; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_8 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_9 = &_id_ctrl_decoder_decoded_T_8; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_2_5 = id_ctrl_decoder_decoded_plaInput[2]; // @[pla.scala 90:45]
  wire  id_ctrl_decoder_decoded_andMatrixInput_3_5 = id_ctrl_decoder_decoded_plaInput[3]; // @[pla.scala 90:45]
  wire [8:0] _id_ctrl_decoder_decoded_T_10 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_11 = &_id_ctrl_decoder_decoded_T_10; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_3_6 = id_ctrl_decoder_decoded_plaInput[4]; // @[pla.scala 90:45]
  wire [8:0] _id_ctrl_decoder_decoded_T_12 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_4,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_13 = &_id_ctrl_decoder_decoded_T_12; // @[pla.scala 98:74]
  wire [5:0] _id_ctrl_decoder_decoded_T_14 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_15 = &_id_ctrl_decoder_decoded_T_14; // @[pla.scala 98:74]
  wire [6:0] _id_ctrl_decoder_decoded_T_16 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_17 = &_id_ctrl_decoder_decoded_T_16; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_5_9 = id_ctrl_decoder_decoded_plaInput[5]; // @[pla.scala 90:45]
  wire [7:0] _id_ctrl_decoder_decoded_T_18 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_19 = &_id_ctrl_decoder_decoded_T_18; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_20 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_21 = &_id_ctrl_decoder_decoded_T_20; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_9 = id_ctrl_decoder_decoded_invInputs[25]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_10 = id_ctrl_decoder_decoded_invInputs[26]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_11 = id_ctrl_decoder_decoded_invInputs[27]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_12 = id_ctrl_decoder_decoded_invInputs[28]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_13 = id_ctrl_decoder_decoded_invInputs[29]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_14 = id_ctrl_decoder_decoded_invInputs[31]; // @[pla.scala 91:29]
  wire [6:0] id_ctrl_decoder_decoded_lo_11 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_22 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_11}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_23 = &_id_ctrl_decoder_decoded_T_22; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_12 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_9,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_24 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_lo_12}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_25 = &_id_ctrl_decoder_decoded_T_24; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_11_2 = id_ctrl_decoder_decoded_invInputs[30]; // @[pla.scala 91:29]
  wire [5:0] id_ctrl_decoder_decoded_lo_13 = {id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _id_ctrl_decoder_decoded_T_26 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_27 = &_id_ctrl_decoder_decoded_T_26; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_14 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_28 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_14}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_29 = &_id_ctrl_decoder_decoded_T_28; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_15 = {id_ctrl_decoder_decoded_andMatrixInput_9,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_30 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_31 = &_id_ctrl_decoder_decoded_T_30; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_4_16 = id_ctrl_decoder_decoded_plaInput[6]; // @[pla.scala 90:45]
  wire [4:0] _id_ctrl_decoder_decoded_T_32 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_33 = &_id_ctrl_decoder_decoded_T_32; // @[pla.scala 98:74]
  wire [5:0] _id_ctrl_decoder_decoded_T_34 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_35 = &_id_ctrl_decoder_decoded_T_34; // @[pla.scala 98:74]
  wire [4:0] id_ctrl_decoder_decoded_lo_18 = {id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [10:0] _id_ctrl_decoder_decoded_T_36 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_lo_18}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_37 = &_id_ctrl_decoder_decoded_T_36; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_38 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_1}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_39 = &_id_ctrl_decoder_decoded_T_38; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_40 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_41 = &_id_ctrl_decoder_decoded_T_40; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_42 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_3,
    id_ctrl_decoder_decoded_andMatrixInput_4_1,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_43 = &_id_ctrl_decoder_decoded_T_42; // @[pla.scala 98:74]
  wire [9:0] _id_ctrl_decoder_decoded_T_44 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_45 = &_id_ctrl_decoder_decoded_T_44; // @[pla.scala 98:74]
  wire [6:0] _id_ctrl_decoder_decoded_T_46 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_47 = &_id_ctrl_decoder_decoded_T_46; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_4_24 = id_ctrl_decoder_decoded_invInputs[7]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_5_23 = id_ctrl_decoder_decoded_invInputs[8]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_6_21 = id_ctrl_decoder_decoded_invInputs[9]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_7_17 = id_ctrl_decoder_decoded_invInputs[10]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_8_11 = id_ctrl_decoder_decoded_invInputs[11]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_12_5 = id_ctrl_decoder_decoded_invInputs[15]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_13_4 = id_ctrl_decoder_decoded_invInputs[16]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_14_4 = id_ctrl_decoder_decoded_invInputs[17]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_15_1 = id_ctrl_decoder_decoded_invInputs[18]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_16 = id_ctrl_decoder_decoded_invInputs[19]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_17 = id_ctrl_decoder_decoded_invInputs[21]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_18 = id_ctrl_decoder_decoded_invInputs[22]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_19 = id_ctrl_decoder_decoded_invInputs[23]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_20 = id_ctrl_decoder_decoded_invInputs[24]; // @[pla.scala 91:29]
  wire [13:0] id_ctrl_decoder_decoded_lo_24 = {id_ctrl_decoder_decoded_andMatrixInput_14_4,
    id_ctrl_decoder_decoded_andMatrixInput_15_1,id_ctrl_decoder_decoded_andMatrixInput_16,
    id_ctrl_decoder_decoded_andMatrixInput_17,id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire [6:0] id_ctrl_decoder_decoded_hi_lo_21 = {id_ctrl_decoder_decoded_andMatrixInput_7_17,
    id_ctrl_decoder_decoded_andMatrixInput_8_11,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_12_5,id_ctrl_decoder_decoded_andMatrixInput_13_4}; // @[Cat.scala 31:58]
  wire [27:0] _id_ctrl_decoder_decoded_T_48 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_4_24,
    id_ctrl_decoder_decoded_andMatrixInput_5_23,id_ctrl_decoder_decoded_andMatrixInput_6_21,
    id_ctrl_decoder_decoded_hi_lo_21,id_ctrl_decoder_decoded_lo_24}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_49 = &_id_ctrl_decoder_decoded_T_48; // @[pla.scala 98:74]
  wire [14:0] id_ctrl_decoder_decoded_lo_25 = {id_ctrl_decoder_decoded_andMatrixInput_13_4,
    id_ctrl_decoder_decoded_andMatrixInput_14_4,id_ctrl_decoder_decoded_andMatrixInput_15_1,
    id_ctrl_decoder_decoded_andMatrixInput_16,id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire [7:0] id_ctrl_decoder_decoded_hi_lo_22 = {id_ctrl_decoder_decoded_andMatrixInput_5_23,
    id_ctrl_decoder_decoded_andMatrixInput_6_21,id_ctrl_decoder_decoded_andMatrixInput_7_17,
    id_ctrl_decoder_decoded_andMatrixInput_8_11,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_12_5}; // @[Cat.scala 31:58]
  wire [30:0] _id_ctrl_decoder_decoded_T_50 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_hi_lo_22,id_ctrl_decoder_decoded_lo_25}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_51 = &_id_ctrl_decoder_decoded_T_50; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_7_19 = id_ctrl_decoder_decoded_plaInput[12]; // @[pla.scala 90:45]
  wire [9:0] _id_ctrl_decoder_decoded_T_52 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_53 = &_id_ctrl_decoder_decoded_T_52; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_27 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _id_ctrl_decoder_decoded_T_54 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_27}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_55 = &_id_ctrl_decoder_decoded_T_54; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_56 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_27}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_57 = &_id_ctrl_decoder_decoded_T_56; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_58 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_59 = &_id_ctrl_decoder_decoded_T_58; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_30 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_60 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_61 = &_id_ctrl_decoder_decoded_T_60; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_62 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_63 = &_id_ctrl_decoder_decoded_T_62; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_64 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_andMatrixInput_7_1}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_65 = &_id_ctrl_decoder_decoded_T_64; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_66 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_67 = &_id_ctrl_decoder_decoded_T_66; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_68 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_19}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_69 = &_id_ctrl_decoder_decoded_T_68; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_5_34 = id_ctrl_decoder_decoded_plaInput[13]; // @[pla.scala 90:45]
  wire [6:0] _id_ctrl_decoder_decoded_T_70 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_3,
    id_ctrl_decoder_decoded_andMatrixInput_4_1,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_71 = &_id_ctrl_decoder_decoded_T_70; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_72 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_3,
    id_ctrl_decoder_decoded_andMatrixInput_4_1,id_ctrl_decoder_decoded_andMatrixInput_4,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_73 = &_id_ctrl_decoder_decoded_T_72; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_74 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_75 = &_id_ctrl_decoder_decoded_T_74; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_76 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_77 = &_id_ctrl_decoder_decoded_T_76; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_78 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_79 = &_id_ctrl_decoder_decoded_T_78; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_80 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_81 = &_id_ctrl_decoder_decoded_T_80; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_82 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_3,
    id_ctrl_decoder_decoded_andMatrixInput_4_1,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_83 = &_id_ctrl_decoder_decoded_T_82; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_84 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_85 = &_id_ctrl_decoder_decoded_T_84; // @[pla.scala 98:74]
  wire [4:0] id_ctrl_decoder_decoded_lo_43 = {id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12}; // @[Cat.scala 31:58]
  wire [10:0] _id_ctrl_decoder_decoded_T_86 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_lo_43}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_87 = &_id_ctrl_decoder_decoded_T_86; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_88 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_89 = &_id_ctrl_decoder_decoded_T_88; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_45 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_90 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_lo_45}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_91 = &_id_ctrl_decoder_decoded_T_90; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_92 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_5_34}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_93 = &_id_ctrl_decoder_decoded_T_92; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_94 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_95 = &_id_ctrl_decoder_decoded_T_94; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_96 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_97 = &_id_ctrl_decoder_decoded_T_96; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_98 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_andMatrixInput_5_34}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_99 = &_id_ctrl_decoder_decoded_T_98; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_50 = {id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_100 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_50}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_101 = &_id_ctrl_decoder_decoded_T_100; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_8_30 = id_ctrl_decoder_decoded_plaInput[14]; // @[pla.scala 90:45]
  wire [8:0] _id_ctrl_decoder_decoded_T_102 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_103 = &_id_ctrl_decoder_decoded_T_102; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_52 = {id_ctrl_decoder_decoded_andMatrixInput_8_30,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _id_ctrl_decoder_decoded_T_104 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_lo_52}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_105 = &_id_ctrl_decoder_decoded_T_104; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_106 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_107 = &_id_ctrl_decoder_decoded_T_106; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_54 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_8_30,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_108 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_54}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_109 = &_id_ctrl_decoder_decoded_T_108; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_110 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_52}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_111 = &_id_ctrl_decoder_decoded_T_110; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_56 = {id_ctrl_decoder_decoded_andMatrixInput_8_30,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_112 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_56}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_113 = &_id_ctrl_decoder_decoded_T_112; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_57 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_8_30,id_ctrl_decoder_decoded_andMatrixInput_9,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_114 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_115 = &_id_ctrl_decoder_decoded_T_114; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_58 = {id_ctrl_decoder_decoded_andMatrixInput_8_30,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_116 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_58}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_117 = &_id_ctrl_decoder_decoded_T_116; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_118 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_56}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_119 = &_id_ctrl_decoder_decoded_T_118; // @[pla.scala 98:74]
  wire [15:0] _id_ctrl_decoder_decoded_T_120 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_57}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_121 = &_id_ctrl_decoder_decoded_T_120; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_122 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_52}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_123 = &_id_ctrl_decoder_decoded_T_122; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_124 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_125 = &_id_ctrl_decoder_decoded_T_124; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_126 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_127 = &_id_ctrl_decoder_decoded_T_126; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_128 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_129 = &_id_ctrl_decoder_decoded_T_128; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_130 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_131 = &_id_ctrl_decoder_decoded_T_130; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_132 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_lo_52}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_133 = &_id_ctrl_decoder_decoded_T_132; // @[pla.scala 98:74]
  wire [7:0] _id_ctrl_decoder_decoded_T_134 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_135 = &_id_ctrl_decoder_decoded_T_134; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_136 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_137 = &_id_ctrl_decoder_decoded_T_136; // @[pla.scala 98:74]
  wire [8:0] _id_ctrl_decoder_decoded_T_138 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_139 = &_id_ctrl_decoder_decoded_T_138; // @[pla.scala 98:74]
  wire [9:0] _id_ctrl_decoder_decoded_T_140 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_8_30}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_141 = &_id_ctrl_decoder_decoded_T_140; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_7_63 = id_ctrl_decoder_decoded_plaInput[25]; // @[pla.scala 90:45]
  wire [6:0] id_ctrl_decoder_decoded_lo_71 = {id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _id_ctrl_decoder_decoded_T_142 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_143 = &_id_ctrl_decoder_decoded_T_142; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_144 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_145 = &_id_ctrl_decoder_decoded_T_144; // @[pla.scala 98:74]
  wire [6:0] _id_ctrl_decoder_decoded_T_146 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_147 = &_id_ctrl_decoder_decoded_T_146; // @[pla.scala 98:74]
  wire [5:0] id_ctrl_decoder_decoded_lo_74 = {id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [11:0] _id_ctrl_decoder_decoded_T_148 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_lo_74}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_149 = &_id_ctrl_decoder_decoded_T_148; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_150 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_151 = &_id_ctrl_decoder_decoded_T_150; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_152 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_153 = &_id_ctrl_decoder_decoded_T_152; // @[pla.scala 98:74]
  wire [13:0] _id_ctrl_decoder_decoded_T_154 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_8_30,id_ctrl_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_155 = &_id_ctrl_decoder_decoded_T_154; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_156 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_8_30,id_ctrl_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_157 = &_id_ctrl_decoder_decoded_T_156; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_158 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_8_30,id_ctrl_decoder_decoded_lo_71}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_159 = &_id_ctrl_decoder_decoded_T_158; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_9_37 = id_ctrl_decoder_decoded_plaInput[27]; // @[pla.scala 90:45]
  wire [5:0] id_ctrl_decoder_decoded_lo_80 = {id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_9_37,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [12:0] _id_ctrl_decoder_decoded_T_160 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_lo_80}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_161 = &_id_ctrl_decoder_decoded_T_160; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_7_72 = id_ctrl_decoder_decoded_invInputs[20]; // @[pla.scala 91:29]
  wire  id_ctrl_decoder_decoded_andMatrixInput_13_30 = id_ctrl_decoder_decoded_plaInput[28]; // @[pla.scala 90:45]
  wire [7:0] id_ctrl_decoder_decoded_lo_81 = {id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_13_30,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [16:0] _id_ctrl_decoder_decoded_T_162 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_72,id_ctrl_decoder_decoded_andMatrixInput_17,id_ctrl_decoder_decoded_lo_81}
    ; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_163 = &_id_ctrl_decoder_decoded_T_162; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_hi_82 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_7_72}; // @[Cat.scala 31:58]
  wire [18:0] _id_ctrl_decoder_decoded_T_164 = {id_ctrl_decoder_decoded_hi_82,id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_13_30,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_165 = &_id_ctrl_decoder_decoded_T_164; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_18_3 = id_ctrl_decoder_decoded_plaInput[21]; // @[pla.scala 90:45]
  wire [6:0] id_ctrl_decoder_decoded_lo_lo_74 = {id_ctrl_decoder_decoded_andMatrixInput_20,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_13_30,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] id_ctrl_decoder_decoded_lo_83 = {id_ctrl_decoder_decoded_andMatrixInput_14_4,
    id_ctrl_decoder_decoded_andMatrixInput_15_1,id_ctrl_decoder_decoded_andMatrixInput_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_72,id_ctrl_decoder_decoded_andMatrixInput_18_3,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_lo_lo_74
    }; // @[Cat.scala 31:58]
  wire [27:0] _id_ctrl_decoder_decoded_T_166 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_4_24,
    id_ctrl_decoder_decoded_andMatrixInput_5_23,id_ctrl_decoder_decoded_andMatrixInput_6_21,
    id_ctrl_decoder_decoded_hi_lo_21,id_ctrl_decoder_decoded_lo_83}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_167 = &_id_ctrl_decoder_decoded_T_166; // @[pla.scala 98:74]
  wire [14:0] id_ctrl_decoder_decoded_lo_84 = {id_ctrl_decoder_decoded_andMatrixInput_13_4,
    id_ctrl_decoder_decoded_andMatrixInput_14_4,id_ctrl_decoder_decoded_andMatrixInput_15_1,
    id_ctrl_decoder_decoded_andMatrixInput_16,id_ctrl_decoder_decoded_andMatrixInput_7_72,
    id_ctrl_decoder_decoded_andMatrixInput_18_3,id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_lo_lo_74}; // @[Cat.scala 31:58]
  wire [30:0] _id_ctrl_decoder_decoded_T_168 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_hi_lo_22,id_ctrl_decoder_decoded_lo_84}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_169 = &_id_ctrl_decoder_decoded_T_168; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_17_5 = id_ctrl_decoder_decoded_plaInput[20]; // @[pla.scala 90:45]
  wire  id_ctrl_decoder_decoded_andMatrixInput_19_4 = id_ctrl_decoder_decoded_plaInput[22]; // @[pla.scala 90:45]
  wire [13:0] id_ctrl_decoder_decoded_lo_85 = {id_ctrl_decoder_decoded_andMatrixInput_14_4,
    id_ctrl_decoder_decoded_andMatrixInput_15_1,id_ctrl_decoder_decoded_andMatrixInput_16,
    id_ctrl_decoder_decoded_andMatrixInput_17_5,id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_19_4,id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_lo_lo_74}; // @[Cat.scala 31:58]
  wire [27:0] _id_ctrl_decoder_decoded_T_170 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_andMatrixInput_4_24,
    id_ctrl_decoder_decoded_andMatrixInput_5_23,id_ctrl_decoder_decoded_andMatrixInput_6_21,
    id_ctrl_decoder_decoded_hi_lo_21,id_ctrl_decoder_decoded_lo_85}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_171 = &_id_ctrl_decoder_decoded_T_170; // @[pla.scala 98:74]
  wire [14:0] id_ctrl_decoder_decoded_lo_86 = {id_ctrl_decoder_decoded_andMatrixInput_13_4,
    id_ctrl_decoder_decoded_andMatrixInput_14_4,id_ctrl_decoder_decoded_andMatrixInput_15_1,
    id_ctrl_decoder_decoded_andMatrixInput_16,id_ctrl_decoder_decoded_andMatrixInput_17_5,
    id_ctrl_decoder_decoded_andMatrixInput_17,id_ctrl_decoder_decoded_andMatrixInput_19_4,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_lo_lo_74}; // @[Cat.scala 31:58]
  wire [30:0] _id_ctrl_decoder_decoded_T_172 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_hi_lo_22,id_ctrl_decoder_decoded_lo_86}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_173 = &_id_ctrl_decoder_decoded_T_172; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_87 = {id_ctrl_decoder_decoded_andMatrixInput_6_21,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_13_30,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [16:0] _id_ctrl_decoder_decoded_T_174 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_andMatrixInput_5_23,
    id_ctrl_decoder_decoded_lo_87}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_175 = &_id_ctrl_decoder_decoded_T_174; // @[pla.scala 98:74]
  wire [8:0] id_ctrl_decoder_decoded_lo_88 = {id_ctrl_decoder_decoded_andMatrixInput_6_21,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_13_30,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [17:0] _id_ctrl_decoder_decoded_T_176 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_andMatrixInput_5_23,
    id_ctrl_decoder_decoded_lo_88}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_177 = &_id_ctrl_decoder_decoded_T_176; // @[pla.scala 98:74]
  wire [4:0] id_ctrl_decoder_decoded_lo_lo_80 = {id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_13_30,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_lo_89 = {id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_13_30,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_11_2,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_hi_89 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_andMatrixInput_5_23,
    id_ctrl_decoder_decoded_andMatrixInput_6_21}; // @[Cat.scala 31:58]
  wire [19:0] _id_ctrl_decoder_decoded_T_178 = {id_ctrl_decoder_decoded_hi_89,id_ctrl_decoder_decoded_lo_89}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_179 = &_id_ctrl_decoder_decoded_T_178; // @[pla.scala 98:74]
  wire [10:0] id_ctrl_decoder_decoded_lo_90 = {id_ctrl_decoder_decoded_andMatrixInput_8_11,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_lo_lo_80}; // @[Cat.scala 31:58]
  wire [4:0] id_ctrl_decoder_decoded_hi_lo_87 = {id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_andMatrixInput_5_23,
    id_ctrl_decoder_decoded_andMatrixInput_6_21,id_ctrl_decoder_decoded_andMatrixInput_7_17}; // @[Cat.scala 31:58]
  wire [21:0] _id_ctrl_decoder_decoded_T_180 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_hi_lo_87,id_ctrl_decoder_decoded_lo_90}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_181 = &_id_ctrl_decoder_decoded_T_180; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_91 = {id_ctrl_decoder_decoded_andMatrixInput_5_34,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_9_37,
    id_ctrl_decoder_decoded_andMatrixInput_13_30,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _id_ctrl_decoder_decoded_T_182 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_lo_91}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_183 = &_id_ctrl_decoder_decoded_T_182; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_12_43 = id_ctrl_decoder_decoded_plaInput[29]; // @[pla.scala 90:45]
  wire [6:0] id_ctrl_decoder_decoded_lo_92 = {id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_11_2}; // @[Cat.scala 31:58]
  wire [13:0] _id_ctrl_decoder_decoded_T_184 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_lo_92}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_185 = &_id_ctrl_decoder_decoded_T_184; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_93 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_11_2}; // @[Cat.scala 31:58]
  wire [13:0] _id_ctrl_decoder_decoded_T_186 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_lo_93}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_187 = &_id_ctrl_decoder_decoded_T_186; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_94 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_12_43,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] _id_ctrl_decoder_decoded_T_188 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,id_ctrl_decoder_decoded_lo_94}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_189 = &_id_ctrl_decoder_decoded_T_188; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_95 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_12_43,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_190 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_lo_95}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_191 = &_id_ctrl_decoder_decoded_T_190; // @[pla.scala 98:74]
  wire [5:0] id_ctrl_decoder_decoded_lo_96 = {id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_12_43}; // @[Cat.scala 31:58]
  wire [11:0] _id_ctrl_decoder_decoded_T_192 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_lo_96}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_193 = &_id_ctrl_decoder_decoded_T_192; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_97 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_11_2}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_194 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_lo_97}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_195 = &_id_ctrl_decoder_decoded_T_194; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_196 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_97}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_197 = &_id_ctrl_decoder_decoded_T_196; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_99 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_12_43,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_198 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_99}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_199 = &_id_ctrl_decoder_decoded_T_198; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_14_40 = id_ctrl_decoder_decoded_plaInput[30]; // @[pla.scala 90:45]
  wire [7:0] id_ctrl_decoder_decoded_lo_100 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_200 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_6,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_100}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_201 = &_id_ctrl_decoder_decoded_T_200; // @[pla.scala 98:74]
  wire [5:0] id_ctrl_decoder_decoded_lo_101 = {id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_14_40}; // @[Cat.scala 31:58]
  wire [11:0] _id_ctrl_decoder_decoded_T_202 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_lo_101}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_203 = &_id_ctrl_decoder_decoded_T_202; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_102 = {id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_8_30,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_204 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_7_19,id_ctrl_decoder_decoded_lo_102}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_205 = &_id_ctrl_decoder_decoded_T_204; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_103 = {id_ctrl_decoder_decoded_andMatrixInput_8_30,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_206 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_103}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_207 = &_id_ctrl_decoder_decoded_T_206; // @[pla.scala 98:74]
  wire [15:0] _id_ctrl_decoder_decoded_T_208 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3_6,id_ctrl_decoder_decoded_andMatrixInput_5_9,
    id_ctrl_decoder_decoded_andMatrixInput_5,id_ctrl_decoder_decoded_andMatrixInput_7_19,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_103}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_209 = &_id_ctrl_decoder_decoded_T_208; // @[pla.scala 98:74]
  wire [8:0] id_ctrl_decoder_decoded_lo_105 = {id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20,
    id_ctrl_decoder_decoded_andMatrixInput_9,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40}; // @[Cat.scala 31:58]
  wire [17:0] _id_ctrl_decoder_decoded_T_210 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_17_5,id_ctrl_decoder_decoded_andMatrixInput_17,id_ctrl_decoder_decoded_lo_105
    }; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_211 = &_id_ctrl_decoder_decoded_T_210; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_hi_106 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_17_5,id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18}; // @[Cat.scala 31:58]
  wire [18:0] _id_ctrl_decoder_decoded_T_212 = {id_ctrl_decoder_decoded_hi_106,id_ctrl_decoder_decoded_andMatrixInput_19
    ,id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_9,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_14_40,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_213 = &_id_ctrl_decoder_decoded_T_212; // @[pla.scala 98:74]
  wire [8:0] id_ctrl_decoder_decoded_lo_107 = {id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40}; // @[Cat.scala 31:58]
  wire [17:0] _id_ctrl_decoder_decoded_T_214 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_72,id_ctrl_decoder_decoded_andMatrixInput_17,id_ctrl_decoder_decoded_lo_107
    }; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_215 = &_id_ctrl_decoder_decoded_T_214; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_hi_108 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_72,id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18}; // @[Cat.scala 31:58]
  wire [18:0] _id_ctrl_decoder_decoded_T_216 = {id_ctrl_decoder_decoded_hi_108,id_ctrl_decoder_decoded_andMatrixInput_19
    ,id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_14_40,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_217 = &_id_ctrl_decoder_decoded_T_216; // @[pla.scala 98:74]
  wire [8:0] id_ctrl_decoder_decoded_lo_109 = {id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_9_37,
    id_ctrl_decoder_decoded_andMatrixInput_13_30,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_14_40,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [17:0] _id_ctrl_decoder_decoded_T_218 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_72,id_ctrl_decoder_decoded_andMatrixInput_17,id_ctrl_decoder_decoded_lo_109
    }; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_219 = &_id_ctrl_decoder_decoded_T_218; // @[pla.scala 98:74]
  wire [18:0] _id_ctrl_decoder_decoded_T_220 = {id_ctrl_decoder_decoded_hi_108,id_ctrl_decoder_decoded_andMatrixInput_19
    ,id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_9_37,
    id_ctrl_decoder_decoded_andMatrixInput_13_30,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_14_40,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_221 = &_id_ctrl_decoder_decoded_T_220; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_20_7 = id_ctrl_decoder_decoded_plaInput[24]; // @[pla.scala 90:45]
  wire [6:0] id_ctrl_decoder_decoded_lo_lo_102 = {id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_9_37,
    id_ctrl_decoder_decoded_andMatrixInput_13_30,id_ctrl_decoder_decoded_andMatrixInput_12_43,
    id_ctrl_decoder_decoded_andMatrixInput_14_40,id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [13:0] id_ctrl_decoder_decoded_lo_111 = {id_ctrl_decoder_decoded_andMatrixInput_15_1,
    id_ctrl_decoder_decoded_andMatrixInput_16,id_ctrl_decoder_decoded_andMatrixInput_7_72,
    id_ctrl_decoder_decoded_andMatrixInput_18_3,id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20_7,
    id_ctrl_decoder_decoded_lo_lo_102}; // @[Cat.scala 31:58]
  wire [6:0] id_ctrl_decoder_decoded_hi_lo_108 = {id_ctrl_decoder_decoded_andMatrixInput_8_11,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_12_5,
    id_ctrl_decoder_decoded_andMatrixInput_13_4,id_ctrl_decoder_decoded_andMatrixInput_14_4}; // @[Cat.scala 31:58]
  wire [27:0] _id_ctrl_decoder_decoded_T_222 = {id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_andMatrixInput_5_23,
    id_ctrl_decoder_decoded_andMatrixInput_6_21,id_ctrl_decoder_decoded_andMatrixInput_7_17,
    id_ctrl_decoder_decoded_hi_lo_108,id_ctrl_decoder_decoded_lo_111}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_223 = &_id_ctrl_decoder_decoded_T_222; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_lo_103 = {id_ctrl_decoder_decoded_andMatrixInput_20_7,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_9_37,id_ctrl_decoder_decoded_andMatrixInput_13_30,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_14}; // @[Cat.scala 31:58]
  wire [15:0] id_ctrl_decoder_decoded_lo_112 = {id_ctrl_decoder_decoded_andMatrixInput_13_4,
    id_ctrl_decoder_decoded_andMatrixInput_14_4,id_ctrl_decoder_decoded_andMatrixInput_15_1,
    id_ctrl_decoder_decoded_andMatrixInput_16,id_ctrl_decoder_decoded_andMatrixInput_7_72,
    id_ctrl_decoder_decoded_andMatrixInput_18_3,id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_lo_lo_103}; // @[Cat.scala 31:58]
  wire [31:0] _id_ctrl_decoder_decoded_T_224 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_4_24,id_ctrl_decoder_decoded_hi_lo_22,id_ctrl_decoder_decoded_lo_112}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_225 = &_id_ctrl_decoder_decoded_T_224; // @[pla.scala 98:74]
  wire  id_ctrl_decoder_decoded_andMatrixInput_11_65 = id_ctrl_decoder_decoded_plaInput[31]; // @[pla.scala 90:45]
  wire [5:0] id_ctrl_decoder_decoded_lo_113 = {id_ctrl_decoder_decoded_andMatrixInput_5,
    id_ctrl_decoder_decoded_andMatrixInput_5_34,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [11:0] _id_ctrl_decoder_decoded_T_226 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2_5,
    id_ctrl_decoder_decoded_andMatrixInput_3_5,id_ctrl_decoder_decoded_andMatrixInput_4_1,
    id_ctrl_decoder_decoded_andMatrixInput_5_9,id_ctrl_decoder_decoded_lo_113}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_227 = &_id_ctrl_decoder_decoded_T_226; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_114 = {id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12,id_ctrl_decoder_decoded_andMatrixInput_12_43,
    id_ctrl_decoder_decoded_andMatrixInput_11_2,id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_228 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_lo_114}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_229 = &_id_ctrl_decoder_decoded_T_228; // @[pla.scala 98:74]
  wire [14:0] _id_ctrl_decoder_decoded_T_230 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_lo_114}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_231 = &_id_ctrl_decoder_decoded_T_230; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_116 = {id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_232 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_72,id_ctrl_decoder_decoded_lo_116}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_233 = &_id_ctrl_decoder_decoded_T_232; // @[pla.scala 98:74]
  wire [6:0] id_ctrl_decoder_decoded_lo_117 = {id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_13,
    id_ctrl_decoder_decoded_andMatrixInput_14_40,id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_T_234 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_lo_117}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_235 = &_id_ctrl_decoder_decoded_T_234; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_118 = {id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_236 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_lo_118}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_237 = &_id_ctrl_decoder_decoded_T_236; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_119 = {id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_238 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_lo_119}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_239 = &_id_ctrl_decoder_decoded_T_238; // @[pla.scala 98:74]
  wire [7:0] id_ctrl_decoder_decoded_lo_120 = {id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_13_30,
    id_ctrl_decoder_decoded_andMatrixInput_13,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [15:0] _id_ctrl_decoder_decoded_T_240 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_lo_120}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_241 = &_id_ctrl_decoder_decoded_T_240; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_lo_121 = {id_ctrl_decoder_decoded_andMatrixInput_7_72,
    id_ctrl_decoder_decoded_andMatrixInput_17,id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_hi_121 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3}; // @[Cat.scala 31:58]
  wire [19:0] _id_ctrl_decoder_decoded_T_242 = {id_ctrl_decoder_decoded_hi_121,id_ctrl_decoder_decoded_lo_121}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_243 = &_id_ctrl_decoder_decoded_T_242; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_lo_122 = {id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_hi_122 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_7_72}; // @[Cat.scala 31:58]
  wire [19:0] _id_ctrl_decoder_decoded_T_244 = {id_ctrl_decoder_decoded_hi_122,id_ctrl_decoder_decoded_lo_122}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_245 = &_id_ctrl_decoder_decoded_T_244; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_lo_123 = {id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_7_63,
    id_ctrl_decoder_decoded_andMatrixInput_10,id_ctrl_decoder_decoded_andMatrixInput_11,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [4:0] id_ctrl_decoder_decoded_hi_lo_120 = {id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_6,id_ctrl_decoder_decoded_andMatrixInput_7_1,
    id_ctrl_decoder_decoded_andMatrixInput_6_3,id_ctrl_decoder_decoded_andMatrixInput_7_72}; // @[Cat.scala 31:58]
  wire [20:0] _id_ctrl_decoder_decoded_T_246 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_hi_lo_120,id_ctrl_decoder_decoded_lo_123}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_247 = &_id_ctrl_decoder_decoded_T_246; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_lo_124 = {id_ctrl_decoder_decoded_andMatrixInput_18,
    id_ctrl_decoder_decoded_andMatrixInput_19,id_ctrl_decoder_decoded_andMatrixInput_20,
    id_ctrl_decoder_decoded_andMatrixInput_7_63,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_12,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [4:0] id_ctrl_decoder_decoded_hi_lo_121 = {id_ctrl_decoder_decoded_andMatrixInput_4_16,
    id_ctrl_decoder_decoded_andMatrixInput_7_1,id_ctrl_decoder_decoded_andMatrixInput_6_3,
    id_ctrl_decoder_decoded_andMatrixInput_7_72,id_ctrl_decoder_decoded_andMatrixInput_17}; // @[Cat.scala 31:58]
  wire [20:0] _id_ctrl_decoder_decoded_T_248 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_hi_lo_121,id_ctrl_decoder_decoded_lo_124}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_249 = &_id_ctrl_decoder_decoded_T_248; // @[pla.scala 98:74]
  wire [9:0] id_ctrl_decoder_decoded_lo_125 = {id_ctrl_decoder_decoded_andMatrixInput_17,
    id_ctrl_decoder_decoded_andMatrixInput_18,id_ctrl_decoder_decoded_andMatrixInput_19,
    id_ctrl_decoder_decoded_andMatrixInput_20,id_ctrl_decoder_decoded_andMatrixInput_10,
    id_ctrl_decoder_decoded_andMatrixInput_11,id_ctrl_decoder_decoded_andMatrixInput_13_30,
    id_ctrl_decoder_decoded_andMatrixInput_12_43,id_ctrl_decoder_decoded_andMatrixInput_14_40,
    id_ctrl_decoder_decoded_andMatrixInput_11_65}; // @[Cat.scala 31:58]
  wire [20:0] _id_ctrl_decoder_decoded_T_250 = {id_ctrl_decoder_decoded_andMatrixInput_0,
    id_ctrl_decoder_decoded_andMatrixInput_1,id_ctrl_decoder_decoded_andMatrixInput_2,
    id_ctrl_decoder_decoded_andMatrixInput_3,id_ctrl_decoder_decoded_andMatrixInput_3_6,
    id_ctrl_decoder_decoded_andMatrixInput_4,id_ctrl_decoder_decoded_hi_lo_120,id_ctrl_decoder_decoded_lo_125}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_T_251 = &_id_ctrl_decoder_decoded_T_250; // @[pla.scala 98:74]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo = {_id_ctrl_decoder_decoded_T_213,_id_ctrl_decoder_decoded_T_215
    ,_id_ctrl_decoder_decoded_T_221,_id_ctrl_decoder_decoded_T_239,_id_ctrl_decoder_decoded_T_247,
    _id_ctrl_decoder_decoded_T_249}; // @[Cat.scala 31:58]
  wire [11:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T = {_id_ctrl_decoder_decoded_T_97,_id_ctrl_decoder_decoded_T_147
    ,_id_ctrl_decoder_decoded_T_149,_id_ctrl_decoder_decoded_T_195,_id_ctrl_decoder_decoded_T_197,
    _id_ctrl_decoder_decoded_T_199,id_ctrl_decoder_decoded_orMatrixOutputs_lo}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_1 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire [2:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_2 = {_id_ctrl_decoder_decoded_T_87,
    _id_ctrl_decoder_decoded_T_161,_id_ctrl_decoder_decoded_T_163}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_3 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_2; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_4 = |_id_ctrl_decoder_decoded_T_11; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_5 = |_id_ctrl_decoder_decoded_T_53; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_6 = |_id_ctrl_decoder_decoded_T_69; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_7 = |_id_ctrl_decoder_decoded_T_93; // @[pla.scala 114:39]
  wire [6:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_8 = {_id_ctrl_decoder_decoded_T_49,_id_ctrl_decoder_decoded_T_69
    ,_id_ctrl_decoder_decoded_T_93,_id_ctrl_decoder_decoded_T_167,_id_ctrl_decoder_decoded_T_171,
    _id_ctrl_decoder_decoded_T_175,_id_ctrl_decoder_decoded_T_223}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_9 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_8; // @[pla.scala 114:39]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_1 = {_id_ctrl_decoder_decoded_T_161,
    _id_ctrl_decoder_decoded_T_163,_id_ctrl_decoder_decoded_T_229,_id_ctrl_decoder_decoded_T_231,
    _id_ctrl_decoder_decoded_T_237,_id_ctrl_decoder_decoded_T_245}; // @[Cat.scala 31:58]
  wire [12:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_2 = {_id_ctrl_decoder_decoded_T_79,
    _id_ctrl_decoder_decoded_T_87,_id_ctrl_decoder_decoded_T_93,_id_ctrl_decoder_decoded_T_109,
    _id_ctrl_decoder_decoded_T_113,_id_ctrl_decoder_decoded_T_119,_id_ctrl_decoder_decoded_T_155,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_1}; // @[Cat.scala 31:58]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_2 = {_id_ctrl_decoder_decoded_T_29,
    _id_ctrl_decoder_decoded_T_45,_id_ctrl_decoder_decoded_T_47,_id_ctrl_decoder_decoded_T_55,
    _id_ctrl_decoder_decoded_T_59,_id_ctrl_decoder_decoded_T_69}; // @[Cat.scala 31:58]
  wire [25:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_10 = {_id_ctrl_decoder_decoded_T_1,_id_ctrl_decoder_decoded_T_5
    ,_id_ctrl_decoder_decoded_T_9,_id_ctrl_decoder_decoded_T_13,_id_ctrl_decoder_decoded_T_15,
    _id_ctrl_decoder_decoded_T_23,_id_ctrl_decoder_decoded_T_27,id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_2,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_2}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_11 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_10; // @[pla.scala 114:39]
  wire [2:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_12 = {_id_ctrl_decoder_decoded_T_143,
    _id_ctrl_decoder_decoded_T_145,_id_ctrl_decoder_decoded_T_155}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_13 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_12; // @[pla.scala 114:39]
  wire [9:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_14 = {_id_ctrl_decoder_decoded_T_33,
    _id_ctrl_decoder_decoded_T_37,_id_ctrl_decoder_decoded_T_77,_id_ctrl_decoder_decoded_T_189,
    _id_ctrl_decoder_decoded_T_191,_id_ctrl_decoder_decoded_T_213,_id_ctrl_decoder_decoded_T_217,
    _id_ctrl_decoder_decoded_T_219,_id_ctrl_decoder_decoded_T_241,_id_ctrl_decoder_decoded_T_251}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_15 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_14; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_16 = |_id_ctrl_decoder_decoded_T_33; // @[pla.scala 114:39]
  wire [6:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_17 = {_id_ctrl_decoder_decoded_T_33,
    _id_ctrl_decoder_decoded_T_37,_id_ctrl_decoder_decoded_T_85,_id_ctrl_decoder_decoded_T_185,
    _id_ctrl_decoder_decoded_T_187,_id_ctrl_decoder_decoded_T_189,_id_ctrl_decoder_decoded_T_219}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_18 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_17; // @[pla.scala 114:39]
  wire [9:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_19 = {_id_ctrl_decoder_decoded_T_33,
    _id_ctrl_decoder_decoded_T_37,_id_ctrl_decoder_decoded_T_185,_id_ctrl_decoder_decoded_T_187,
    _id_ctrl_decoder_decoded_T_189,_id_ctrl_decoder_decoded_T_211,_id_ctrl_decoder_decoded_T_215,
    _id_ctrl_decoder_decoded_T_219,_id_ctrl_decoder_decoded_T_237,_id_ctrl_decoder_decoded_T_245}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_20 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_19; // @[pla.scala 114:39]
  wire [3:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_21 = {_id_ctrl_decoder_decoded_T_19,
    _id_ctrl_decoder_decoded_T_83,_id_ctrl_decoder_decoded_T_183,_id_ctrl_decoder_decoded_T_193}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_22 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_21; // @[pla.scala 114:39]
  wire [2:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_23 = {_id_ctrl_decoder_decoded_T_163,
    _id_ctrl_decoder_decoded_T_183,_id_ctrl_decoder_decoded_T_203}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_24 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_23; // @[pla.scala 114:39]
  wire [3:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_25 = {_id_ctrl_decoder_decoded_T_161,
    _id_ctrl_decoder_decoded_T_163,_id_ctrl_decoder_decoded_T_175,_id_ctrl_decoder_decoded_T_227}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_26 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_25; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_27 = |_id_ctrl_decoder_decoded_T_87; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_28 = |_id_ctrl_decoder_decoded_T_175; // @[pla.scala 114:39]
  wire [7:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_29 = {_id_ctrl_decoder_decoded_T_3,_id_ctrl_decoder_decoded_T_5,
    _id_ctrl_decoder_decoded_T_7,_id_ctrl_decoder_decoded_T_71,_id_ctrl_decoder_decoded_T_87,
    _id_ctrl_decoder_decoded_T_161,_id_ctrl_decoder_decoded_T_165,_id_ctrl_decoder_decoded_T_181}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_30 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_29; // @[pla.scala 114:39]
  wire [4:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_9 = {_id_ctrl_decoder_decoded_T_123,
    _id_ctrl_decoder_decoded_T_127,_id_ctrl_decoder_decoded_T_141,_id_ctrl_decoder_decoded_T_151,
    _id_ctrl_decoder_decoded_T_157}; // @[Cat.scala 31:58]
  wire [10:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_31 = {_id_ctrl_decoder_decoded_T_55,
    _id_ctrl_decoder_decoded_T_59,_id_ctrl_decoder_decoded_T_65,_id_ctrl_decoder_decoded_T_109,
    _id_ctrl_decoder_decoded_T_113,_id_ctrl_decoder_decoded_T_119,id_ctrl_decoder_decoded_orMatrixOutputs_lo_9}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_32 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_31; // @[pla.scala 114:39]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_10 = {_id_ctrl_decoder_decoded_T_153,
    _id_ctrl_decoder_decoded_T_159,_id_ctrl_decoder_decoded_T_201,_id_ctrl_decoder_decoded_T_205,
    _id_ctrl_decoder_decoded_T_207,_id_ctrl_decoder_decoded_T_209}; // @[Cat.scala 31:58]
  wire [11:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_33 = {_id_ctrl_decoder_decoded_T_41,
    _id_ctrl_decoder_decoded_T_99,_id_ctrl_decoder_decoded_T_101,_id_ctrl_decoder_decoded_T_131,
    _id_ctrl_decoder_decoded_T_133,_id_ctrl_decoder_decoded_T_137,id_ctrl_decoder_decoded_orMatrixOutputs_lo_10}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_34 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_33; // @[pla.scala 114:39]
  wire [7:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_35 = {_id_ctrl_decoder_decoded_T_79,
    _id_ctrl_decoder_decoded_T_89,_id_ctrl_decoder_decoded_T_103,_id_ctrl_decoder_decoded_T_105,
    _id_ctrl_decoder_decoded_T_107,_id_ctrl_decoder_decoded_T_111,_id_ctrl_decoder_decoded_T_117,
    _id_ctrl_decoder_decoded_T_155}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_36 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_35; // @[pla.scala 114:39]
  wire [6:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_37 = {_id_ctrl_decoder_decoded_T_81,
    _id_ctrl_decoder_decoded_T_91,_id_ctrl_decoder_decoded_T_107,_id_ctrl_decoder_decoded_T_201,
    _id_ctrl_decoder_decoded_T_205,_id_ctrl_decoder_decoded_T_207,_id_ctrl_decoder_decoded_T_209}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_38 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_37; // @[pla.scala 114:39]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_16 = {_id_ctrl_decoder_decoded_T_1,_id_ctrl_decoder_decoded_T_5,
    _id_ctrl_decoder_decoded_T_7,_id_ctrl_decoder_decoded_T_15,_id_ctrl_decoder_decoded_T_25,
    _id_ctrl_decoder_decoded_T_27,_id_ctrl_decoder_decoded_T_45,_id_ctrl_decoder_decoded_T_47,
    _id_ctrl_decoder_decoded_T_55,_id_ctrl_decoder_decoded_T_69}; // @[Cat.scala 31:58]
  wire [18:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_39 = {id_ctrl_decoder_decoded_orMatrixOutputs_hi_16,
    _id_ctrl_decoder_decoded_T_71,_id_ctrl_decoder_decoded_T_79,_id_ctrl_decoder_decoded_T_87,
    _id_ctrl_decoder_decoded_T_93,_id_ctrl_decoder_decoded_T_109,_id_ctrl_decoder_decoded_T_121,
    _id_ctrl_decoder_decoded_T_161,_id_ctrl_decoder_decoded_T_163,_id_ctrl_decoder_decoded_T_175}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_40 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_39; // @[pla.scala 114:39]
  wire [3:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_41 = {_id_ctrl_decoder_decoded_T_39,
    _id_ctrl_decoder_decoded_T_47,_id_ctrl_decoder_decoded_T_125,_id_ctrl_decoder_decoded_T_135}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_42 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_41; // @[pla.scala 114:39]
  wire [1:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_43 = {_id_ctrl_decoder_decoded_T_15,
    _id_ctrl_decoder_decoded_T_47}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_44 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_43; // @[pla.scala 114:39]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_15 = {_id_ctrl_decoder_decoded_T_73,
    _id_ctrl_decoder_decoded_T_79,_id_ctrl_decoder_decoded_T_109,_id_ctrl_decoder_decoded_T_115,
    _id_ctrl_decoder_decoded_T_129,_id_ctrl_decoder_decoded_T_139}; // @[Cat.scala 31:58]
  wire [11:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_45 = {_id_ctrl_decoder_decoded_T_1,_id_ctrl_decoder_decoded_T_5
    ,_id_ctrl_decoder_decoded_T_13,_id_ctrl_decoder_decoded_T_45,_id_ctrl_decoder_decoded_T_57,
    _id_ctrl_decoder_decoded_T_61,id_ctrl_decoder_decoded_orMatrixOutputs_lo_15}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_46 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_45; // @[pla.scala 114:39]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_10 = {_id_ctrl_decoder_decoded_T_155,
    _id_ctrl_decoder_decoded_T_161,_id_ctrl_decoder_decoded_T_163,_id_ctrl_decoder_decoded_T_177,
    _id_ctrl_decoder_decoded_T_241,_id_ctrl_decoder_decoded_T_251}; // @[Cat.scala 31:58]
  wire [11:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_16 = {_id_ctrl_decoder_decoded_T_87,
    _id_ctrl_decoder_decoded_T_95,_id_ctrl_decoder_decoded_T_107,_id_ctrl_decoder_decoded_T_109,
    _id_ctrl_decoder_decoded_T_113,_id_ctrl_decoder_decoded_T_119,id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_10}; // @[Cat.scala 31:58]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_13 = {_id_ctrl_decoder_decoded_T_43,
    _id_ctrl_decoder_decoded_T_55,_id_ctrl_decoder_decoded_T_59,_id_ctrl_decoder_decoded_T_67,
    _id_ctrl_decoder_decoded_T_71,_id_ctrl_decoder_decoded_T_79}; // @[Cat.scala 31:58]
  wire [24:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_47 = {_id_ctrl_decoder_decoded_T_1,_id_ctrl_decoder_decoded_T_5
    ,_id_ctrl_decoder_decoded_T_7,_id_ctrl_decoder_decoded_T_13,_id_ctrl_decoder_decoded_T_23,
    _id_ctrl_decoder_decoded_T_27,_id_ctrl_decoder_decoded_T_29,id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_13,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_16}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_48 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_47; // @[pla.scala 114:39]
  wire [1:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_49 = {_id_ctrl_decoder_decoded_T_17,
    _id_ctrl_decoder_decoded_T_47}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_50 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_49; // @[pla.scala 114:39]
  wire [6:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_17 = {_id_ctrl_decoder_decoded_T_61,
    _id_ctrl_decoder_decoded_T_71,_id_ctrl_decoder_decoded_T_79,_id_ctrl_decoder_decoded_T_109,
    _id_ctrl_decoder_decoded_T_115,_id_ctrl_decoder_decoded_T_129,_id_ctrl_decoder_decoded_T_139}; // @[Cat.scala 31:58]
  wire [14:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_51 = {_id_ctrl_decoder_decoded_T_1,_id_ctrl_decoder_decoded_T_5
    ,_id_ctrl_decoder_decoded_T_7,_id_ctrl_decoder_decoded_T_13,_id_ctrl_decoder_decoded_T_15,
    _id_ctrl_decoder_decoded_T_45,_id_ctrl_decoder_decoded_T_47,_id_ctrl_decoder_decoded_T_57,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_17}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_52 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_51; // @[pla.scala 114:39]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_18 = {_id_ctrl_decoder_decoded_T_55,
    _id_ctrl_decoder_decoded_T_59,_id_ctrl_decoder_decoded_T_71,_id_ctrl_decoder_decoded_T_79,
    _id_ctrl_decoder_decoded_T_109,_id_ctrl_decoder_decoded_T_113,_id_ctrl_decoder_decoded_T_119,
    _id_ctrl_decoder_decoded_T_125,_id_ctrl_decoder_decoded_T_135,_id_ctrl_decoder_decoded_T_155}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_21 = {_id_ctrl_decoder_decoded_T_1,_id_ctrl_decoder_decoded_T_5,
    _id_ctrl_decoder_decoded_T_7,_id_ctrl_decoder_decoded_T_13,_id_ctrl_decoder_decoded_T_15,
    _id_ctrl_decoder_decoded_T_23,_id_ctrl_decoder_decoded_T_27,_id_ctrl_decoder_decoded_T_29,
    _id_ctrl_decoder_decoded_T_39,_id_ctrl_decoder_decoded_T_43}; // @[Cat.scala 31:58]
  wire [19:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_53 = {id_ctrl_decoder_decoded_orMatrixOutputs_hi_21,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_18}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_54 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_53; // @[pla.scala 114:39]
  wire [5:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_20 = {_id_ctrl_decoder_decoded_T_107,
    _id_ctrl_decoder_decoded_T_119,_id_ctrl_decoder_decoded_T_155,_id_ctrl_decoder_decoded_T_161,
    _id_ctrl_decoder_decoded_T_163,_id_ctrl_decoder_decoded_T_179}; // @[Cat.scala 31:58]
  wire [12:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_57 = {_id_ctrl_decoder_decoded_T_19,
    _id_ctrl_decoder_decoded_T_21,_id_ctrl_decoder_decoded_T_23,_id_ctrl_decoder_decoded_T_27,
    _id_ctrl_decoder_decoded_T_29,_id_ctrl_decoder_decoded_T_31,_id_ctrl_decoder_decoded_T_87,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_20}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_58 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_57; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_59 = |_id_ctrl_decoder_decoded_T_45; // @[pla.scala 114:39]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_60 = |_id_ctrl_decoder_decoded_T_47; // @[pla.scala 114:39]
  wire [1:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_61 = {_id_ctrl_decoder_decoded_T_39,
    _id_ctrl_decoder_decoded_T_107}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_62 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_61; // @[pla.scala 114:39]
  wire [4:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_21 = {_id_ctrl_decoder_decoded_T_211,
    _id_ctrl_decoder_decoded_T_215,_id_ctrl_decoder_decoded_T_219,_id_ctrl_decoder_decoded_T_233,
    _id_ctrl_decoder_decoded_T_235}; // @[Cat.scala 31:58]
  wire [10:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_63 = {_id_ctrl_decoder_decoded_T_33,
    _id_ctrl_decoder_decoded_T_37,_id_ctrl_decoder_decoded_T_75,_id_ctrl_decoder_decoded_T_185,
    _id_ctrl_decoder_decoded_T_187,_id_ctrl_decoder_decoded_T_189,id_ctrl_decoder_decoded_orMatrixOutputs_lo_21}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_64 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_63; // @[pla.scala 114:39]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_16 = {_id_ctrl_decoder_decoded_T_185,
    _id_ctrl_decoder_decoded_T_187,_id_ctrl_decoder_decoded_T_189,_id_ctrl_decoder_decoded_T_211,
    _id_ctrl_decoder_decoded_T_215,_id_ctrl_decoder_decoded_T_219,_id_ctrl_decoder_decoded_T_225,
    _id_ctrl_decoder_decoded_T_235,_id_ctrl_decoder_decoded_T_243,_id_ctrl_decoder_decoded_T_245}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_hi_19 = {_id_ctrl_decoder_decoded_T_107,
    _id_ctrl_decoder_decoded_T_109,_id_ctrl_decoder_decoded_T_113,_id_ctrl_decoder_decoded_T_119,
    _id_ctrl_decoder_decoded_T_155,_id_ctrl_decoder_decoded_T_161,_id_ctrl_decoder_decoded_T_165,
    _id_ctrl_decoder_decoded_T_169,_id_ctrl_decoder_decoded_T_173,_id_ctrl_decoder_decoded_T_181}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_19 = {_id_ctrl_decoder_decoded_T_43,
    _id_ctrl_decoder_decoded_T_47,_id_ctrl_decoder_decoded_T_51,_id_ctrl_decoder_decoded_T_55,
    _id_ctrl_decoder_decoded_T_59,_id_ctrl_decoder_decoded_T_63,_id_ctrl_decoder_decoded_T_71,
    _id_ctrl_decoder_decoded_T_79,_id_ctrl_decoder_decoded_T_87,_id_ctrl_decoder_decoded_T_93}; // @[Cat.scala 31:58]
  wire [4:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_hi_lo_7 = {_id_ctrl_decoder_decoded_T_23,
    _id_ctrl_decoder_decoded_T_27,_id_ctrl_decoder_decoded_T_29,_id_ctrl_decoder_decoded_T_35,
    _id_ctrl_decoder_decoded_T_37}; // @[Cat.scala 31:58]
  wire [40:0] _id_ctrl_decoder_decoded_orMatrixOutputs_T_65 = {_id_ctrl_decoder_decoded_T_1,_id_ctrl_decoder_decoded_T_5
    ,_id_ctrl_decoder_decoded_T_7,_id_ctrl_decoder_decoded_T_11,_id_ctrl_decoder_decoded_T_13,
    _id_ctrl_decoder_decoded_T_15,id_ctrl_decoder_decoded_orMatrixOutputs_hi_hi_lo_7,
    id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_19,id_ctrl_decoder_decoded_orMatrixOutputs_lo_hi_19,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_16}; // @[Cat.scala 31:58]
  wire  _id_ctrl_decoder_decoded_orMatrixOutputs_T_66 = |_id_ctrl_decoder_decoded_orMatrixOutputs_T_65; // @[pla.scala 114:39]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_17 = {1'h0,_id_ctrl_decoder_decoded_orMatrixOutputs_T_13,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_11,_id_ctrl_decoder_decoded_orMatrixOutputs_T_9,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_7,_id_ctrl_decoder_decoded_orMatrixOutputs_T_6,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_5,_id_ctrl_decoder_decoded_orMatrixOutputs_T_4,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_3,_id_ctrl_decoder_decoded_orMatrixOutputs_T_1}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_lo_hi_20 = {_id_ctrl_decoder_decoded_orMatrixOutputs_T_30,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_28,_id_ctrl_decoder_decoded_orMatrixOutputs_T_27,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_26,_id_ctrl_decoder_decoded_orMatrixOutputs_T_24,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_22,_id_ctrl_decoder_decoded_orMatrixOutputs_T_20,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_18,_id_ctrl_decoder_decoded_orMatrixOutputs_T_16,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_15}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_20 = {_id_ctrl_decoder_decoded_orMatrixOutputs_T_50,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_48,_id_ctrl_decoder_decoded_orMatrixOutputs_T_46,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_44,_id_ctrl_decoder_decoded_orMatrixOutputs_T_42,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_40,_id_ctrl_decoder_decoded_orMatrixOutputs_T_38,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_36,_id_ctrl_decoder_decoded_orMatrixOutputs_T_34,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_32}; // @[Cat.scala 31:58]
  wire [4:0] id_ctrl_decoder_decoded_orMatrixOutputs_hi_hi_lo_8 = {_id_ctrl_decoder_decoded_orMatrixOutputs_T_58,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_48,1'h0,_id_ctrl_decoder_decoded_orMatrixOutputs_T_54,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_52}; // @[Cat.scala 31:58]
  wire [40:0] id_ctrl_decoder_decoded_orMatrixOutputs = {_id_ctrl_decoder_decoded_orMatrixOutputs_T_66,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_64,1'h0,_id_ctrl_decoder_decoded_orMatrixOutputs_T_62,
    _id_ctrl_decoder_decoded_orMatrixOutputs_T_60,_id_ctrl_decoder_decoded_orMatrixOutputs_T_59,
    id_ctrl_decoder_decoded_orMatrixOutputs_hi_hi_lo_8,id_ctrl_decoder_decoded_orMatrixOutputs_hi_lo_20,
    id_ctrl_decoder_decoded_orMatrixOutputs_lo_hi_20,id_ctrl_decoder_decoded_orMatrixOutputs_lo_lo_17}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_invMatrixOutputs_lo_lo = {id_ctrl_decoder_decoded_orMatrixOutputs[9],
    id_ctrl_decoder_decoded_orMatrixOutputs[8],id_ctrl_decoder_decoded_orMatrixOutputs[7],
    id_ctrl_decoder_decoded_orMatrixOutputs[6],id_ctrl_decoder_decoded_orMatrixOutputs[5],
    id_ctrl_decoder_decoded_orMatrixOutputs[4],id_ctrl_decoder_decoded_orMatrixOutputs[3],
    id_ctrl_decoder_decoded_orMatrixOutputs[2],id_ctrl_decoder_decoded_orMatrixOutputs[1],
    id_ctrl_decoder_decoded_orMatrixOutputs[0]}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_invMatrixOutputs_lo_hi = {id_ctrl_decoder_decoded_orMatrixOutputs[19],
    id_ctrl_decoder_decoded_orMatrixOutputs[18],id_ctrl_decoder_decoded_orMatrixOutputs[17],
    id_ctrl_decoder_decoded_orMatrixOutputs[16],id_ctrl_decoder_decoded_orMatrixOutputs[15],
    id_ctrl_decoder_decoded_orMatrixOutputs[14],id_ctrl_decoder_decoded_orMatrixOutputs[13],
    id_ctrl_decoder_decoded_orMatrixOutputs[12],id_ctrl_decoder_decoded_orMatrixOutputs[11],
    id_ctrl_decoder_decoded_orMatrixOutputs[10]}; // @[Cat.scala 31:58]
  wire [9:0] id_ctrl_decoder_decoded_invMatrixOutputs_hi_lo = {id_ctrl_decoder_decoded_orMatrixOutputs[29],
    id_ctrl_decoder_decoded_orMatrixOutputs[28],id_ctrl_decoder_decoded_orMatrixOutputs[27],
    id_ctrl_decoder_decoded_orMatrixOutputs[26],id_ctrl_decoder_decoded_orMatrixOutputs[25],
    id_ctrl_decoder_decoded_orMatrixOutputs[24],id_ctrl_decoder_decoded_orMatrixOutputs[23],
    id_ctrl_decoder_decoded_orMatrixOutputs[22],id_ctrl_decoder_decoded_orMatrixOutputs[21],
    id_ctrl_decoder_decoded_orMatrixOutputs[20]}; // @[Cat.scala 31:58]
  wire [4:0] id_ctrl_decoder_decoded_invMatrixOutputs_hi_hi_lo = {id_ctrl_decoder_decoded_orMatrixOutputs[34],
    id_ctrl_decoder_decoded_orMatrixOutputs[33],id_ctrl_decoder_decoded_orMatrixOutputs[32],
    id_ctrl_decoder_decoded_orMatrixOutputs[31],id_ctrl_decoder_decoded_orMatrixOutputs[30]}; // @[Cat.scala 31:58]
  wire [40:0] id_ctrl_decoder_decoded_invMatrixOutputs = {id_ctrl_decoder_decoded_orMatrixOutputs[40],
    id_ctrl_decoder_decoded_orMatrixOutputs[39],id_ctrl_decoder_decoded_orMatrixOutputs[38],
    id_ctrl_decoder_decoded_orMatrixOutputs[37],id_ctrl_decoder_decoded_orMatrixOutputs[36],
    id_ctrl_decoder_decoded_orMatrixOutputs[35],id_ctrl_decoder_decoded_invMatrixOutputs_hi_hi_lo,
    id_ctrl_decoder_decoded_invMatrixOutputs_hi_lo,id_ctrl_decoder_decoded_invMatrixOutputs_lo_hi,
    id_ctrl_decoder_decoded_invMatrixOutputs_lo_lo}; // @[Cat.scala 31:58]
  wire  id_ctrl_decoder_0 = id_ctrl_decoder_decoded_invMatrixOutputs[40]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_1 = id_ctrl_decoder_decoded_invMatrixOutputs[39]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_2 = id_ctrl_decoder_decoded_invMatrixOutputs[38]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_3 = id_ctrl_decoder_decoded_invMatrixOutputs[37]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_4 = id_ctrl_decoder_decoded_invMatrixOutputs[36]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_5 = id_ctrl_decoder_decoded_invMatrixOutputs[35]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_6 = id_ctrl_decoder_decoded_invMatrixOutputs[34]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_7 = id_ctrl_decoder_decoded_invMatrixOutputs[33]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_8 = id_ctrl_decoder_decoded_invMatrixOutputs[32]; // @[Decode.scala 50:77]
  wire [1:0] id_ctrl_decoder_9 = id_ctrl_decoder_decoded_invMatrixOutputs[31:30]; // @[Decode.scala 50:77]
  wire [1:0] id_ctrl_decoder_10 = id_ctrl_decoder_decoded_invMatrixOutputs[29:28]; // @[Decode.scala 50:77]
  wire [2:0] id_ctrl_decoder_11 = id_ctrl_decoder_decoded_invMatrixOutputs[27:25]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_12 = id_ctrl_decoder_decoded_invMatrixOutputs[24]; // @[Decode.scala 50:77]
  wire [3:0] id_ctrl_decoder_13 = id_ctrl_decoder_decoded_invMatrixOutputs[23:20]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_14 = id_ctrl_decoder_decoded_invMatrixOutputs[19]; // @[Decode.scala 50:77]
  wire [4:0] id_ctrl_decoder_15 = id_ctrl_decoder_decoded_invMatrixOutputs[18:14]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_16 = id_ctrl_decoder_decoded_invMatrixOutputs[13]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_17 = id_ctrl_decoder_decoded_invMatrixOutputs[12]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_19 = id_ctrl_decoder_decoded_invMatrixOutputs[10]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_20 = id_ctrl_decoder_decoded_invMatrixOutputs[9]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_21 = id_ctrl_decoder_decoded_invMatrixOutputs[8]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_22 = id_ctrl_decoder_decoded_invMatrixOutputs[7]; // @[Decode.scala 50:77]
  wire [2:0] id_ctrl_decoder_23 = id_ctrl_decoder_decoded_invMatrixOutputs[6:4]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_24 = id_ctrl_decoder_decoded_invMatrixOutputs[3]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_25 = id_ctrl_decoder_decoded_invMatrixOutputs[2]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_26 = id_ctrl_decoder_decoded_invMatrixOutputs[1]; // @[Decode.scala 50:77]
  wire  id_ctrl_decoder_27 = id_ctrl_decoder_decoded_invMatrixOutputs[0]; // @[Decode.scala 50:77]
  wire [4:0] id_raddr3 = ibuf_io_inst_0_bits_inst_rs3; // @[RocketCore.scala 278:72]
  wire [4:0] id_raddr2 = ibuf_io_inst_0_bits_inst_rs2; // @[RocketCore.scala 278:72]
  wire [4:0] id_raddr1 = ibuf_io_inst_0_bits_inst_rs1; // @[RocketCore.scala 278:72]
  wire [4:0] id_waddr = ibuf_io_inst_0_bits_inst_rd; // @[RocketCore.scala 278:72]
  reg  id_reg_fence; // @[RocketCore.scala 285:25]
  wire [63:0] _id_rs_T_4 = rf_id_rs_MPORT_data; // @[RocketCore.scala 1071:25]
  wire [63:0] _id_rs_T_9 = rf_id_rs_MPORT_1_data; // @[RocketCore.scala 1071:25]
  wire  _id_csr_en_T = id_ctrl_decoder_23 == 3'h6; // @[package.scala 15:47]
  wire  _id_csr_en_T_1 = id_ctrl_decoder_23 == 3'h7; // @[package.scala 15:47]
  wire  _id_csr_en_T_2 = id_ctrl_decoder_23 == 3'h5; // @[package.scala 15:47]
  wire  _id_csr_en_T_3 = _id_csr_en_T | _id_csr_en_T_1; // @[package.scala 72:59]
  wire  id_csr_en = _id_csr_en_T | _id_csr_en_T_1 | _id_csr_en_T_2; // @[package.scala 72:59]
  wire  id_system_insn = id_ctrl_decoder_23 == 3'h4; // @[RocketCore.scala 295:36]
  wire  id_csr_ren = _id_csr_en_T_3 & ibuf_io_inst_0_bits_inst_rs1 == 5'h0; // @[RocketCore.scala 296:54]
  wire  _id_csr_flush_T = ~id_csr_ren; // @[RocketCore.scala 298:54]
  wire  id_csr_flush = id_system_insn | id_csr_en & ~id_csr_ren & csr_io_decode_0_write_flush; // @[RocketCore.scala 298:37]
  wire  _id_illegal_insn_T_4 = (id_ctrl_decoder_20 | id_ctrl_decoder_21) & ~csr_io_status_isa[12]; // @[RocketCore.scala 307:34]
  wire  _id_illegal_insn_T_5 = ~id_ctrl_decoder_0 | _id_illegal_insn_T_4; // @[RocketCore.scala 306:40]
  wire  _id_illegal_insn_T_8 = id_ctrl_decoder_26 & ~csr_io_status_isa[0]; // @[RocketCore.scala 308:17]
  wire  _id_illegal_insn_T_9 = _id_illegal_insn_T_5 | _id_illegal_insn_T_8; // @[RocketCore.scala 307:65]
  wire  _id_illegal_insn_T_11 = id_ctrl_decoder_1 & (csr_io_decode_0_fp_illegal | io_fpu_illegal_rm); // @[RocketCore.scala 309:16]
  wire  _id_illegal_insn_T_12 = _id_illegal_insn_T_9 | _id_illegal_insn_T_11; // @[RocketCore.scala 308:48]
  wire  _id_illegal_insn_T_15 = id_ctrl_decoder_27 & ~csr_io_status_isa[3]; // @[RocketCore.scala 310:16]
  wire  _id_illegal_insn_T_16 = _id_illegal_insn_T_12 | _id_illegal_insn_T_15; // @[RocketCore.scala 309:70]
  wire  _id_illegal_insn_T_18 = ~csr_io_status_isa[2]; // @[RocketCore.scala 311:33]
  wire  _id_illegal_insn_T_19 = ibuf_io_inst_0_bits_rvc & ~csr_io_status_isa[2]; // @[RocketCore.scala 311:30]
  wire  _id_illegal_insn_T_20 = _id_illegal_insn_T_16 | _id_illegal_insn_T_19; // @[RocketCore.scala 310:47]
  wire  _id_illegal_insn_T_33 = id_ctrl_decoder_2 & csr_io_decode_0_rocc_illegal; // @[RocketCore.scala 315:18]
  wire  _id_illegal_insn_T_34 = _id_illegal_insn_T_20 | _id_illegal_insn_T_33; // @[RocketCore.scala 314:54]
  wire  _id_illegal_insn_T_38 = _id_illegal_insn_T_34 | id_ctrl_decoder_8; // @[RocketCore.scala 315:51]
  wire  _id_illegal_insn_T_42 = id_csr_en & (csr_io_decode_0_read_illegal | _id_csr_flush_T &
    csr_io_decode_0_write_illegal); // @[RocketCore.scala 317:15]
  wire  _id_illegal_insn_T_43 = _id_illegal_insn_T_38 | _id_illegal_insn_T_42; // @[RocketCore.scala 316:81]
  wire  _id_illegal_insn_T_46 = ~ibuf_io_inst_0_bits_rvc & (id_system_insn & csr_io_decode_0_system_illegal); // @[RocketCore.scala 318:31]
  wire  id_illegal_insn = _id_illegal_insn_T_43 | _id_illegal_insn_T_46; // @[RocketCore.scala 317:99]
  wire  id_amo_aq = ibuf_io_inst_0_bits_inst_bits[26]; // @[RocketCore.scala 323:29]
  wire  id_amo_rl = ibuf_io_inst_0_bits_inst_bits[25]; // @[RocketCore.scala 324:29]
  wire [3:0] id_fence_succ = ibuf_io_inst_0_bits_inst_bits[23:20]; // @[RocketCore.scala 326:33]
  wire  id_fence_next = id_ctrl_decoder_25 | id_ctrl_decoder_26 & id_amo_aq; // @[RocketCore.scala 327:37]
  wire  id_mem_busy = ~io_dmem_ordered | io_dmem_req_valid; // @[RocketCore.scala 328:38]
  wire  _GEN_0 = ~id_mem_busy ? 1'h0 : id_reg_fence; // @[RocketCore.scala 329:23 285:25 329:38]
  wire  id_do_fence_x9 = id_mem_busy & (id_ctrl_decoder_26 & id_amo_rl | id_ctrl_decoder_24 | id_reg_fence & (
    id_ctrl_decoder_14 | id_ctrl_decoder_2)); // @[RocketCore.scala 334:17]
  wire  id_xcpt = csr_io_interrupt | bpu_io_debug_if | bpu_io_xcpt_if | ibuf_io_inst_0_bits_xcpt0_pf_inst |
    ibuf_io_inst_0_bits_xcpt0_ae_inst | ibuf_io_inst_0_bits_xcpt1_pf_inst | ibuf_io_inst_0_bits_xcpt1_gf_inst |
    ibuf_io_inst_0_bits_xcpt1_ae_inst | id_illegal_insn; // @[RocketCore.scala 1024:26]
  wire [4:0] _T_11 = ibuf_io_inst_0_bits_xcpt1_ae_inst ? 5'h1 : 5'h2; // @[Mux.scala 47:70]
  wire [4:0] _T_12 = ibuf_io_inst_0_bits_xcpt1_gf_inst ? 5'h14 : _T_11; // @[Mux.scala 47:70]
  wire [4:0] _T_13 = ibuf_io_inst_0_bits_xcpt1_pf_inst ? 5'hc : _T_12; // @[Mux.scala 47:70]
  wire [4:0] _T_14 = ibuf_io_inst_0_bits_xcpt0_ae_inst ? 5'h1 : _T_13; // @[Mux.scala 47:70]
  wire [4:0] _T_16 = ibuf_io_inst_0_bits_xcpt0_pf_inst ? 5'hc : _T_14; // @[Mux.scala 47:70]
  wire [4:0] _T_17 = bpu_io_xcpt_if ? 5'h3 : _T_16; // @[Mux.scala 47:70]
  wire [4:0] _T_18 = bpu_io_debug_if ? 5'he : _T_17; // @[Mux.scala 47:70]
  wire [4:0] ex_waddr = ex_reg_inst[11:7]; // @[RocketCore.scala 375:29]
  wire [4:0] mem_waddr = mem_reg_inst[11:7]; // @[RocketCore.scala 376:31]
  wire [4:0] wb_waddr = wb_reg_inst[11:7]; // @[RocketCore.scala 377:29]
  wire  _T_29 = ex_reg_valid & ex_ctrl_wxd; // @[RocketCore.scala 380:19]
  wire  _T_30 = mem_reg_valid & mem_ctrl_wxd; // @[RocketCore.scala 381:20]
  wire  _T_32 = mem_reg_valid & mem_ctrl_wxd & ~mem_ctrl_mem; // @[RocketCore.scala 381:36]
  wire  id_bypass_src_0_0 = 5'h0 == id_raddr1; // @[RocketCore.scala 383:82]
  wire  id_bypass_src_0_1 = _T_29 & ex_waddr == id_raddr1; // @[RocketCore.scala 383:74]
  wire  id_bypass_src_0_2 = _T_32 & mem_waddr == id_raddr1; // @[RocketCore.scala 383:74]
  wire  id_bypass_src_0_3 = _T_30 & mem_waddr == id_raddr1; // @[RocketCore.scala 383:74]
  wire  id_bypass_src_1_0 = 5'h0 == id_raddr2; // @[RocketCore.scala 383:82]
  wire  id_bypass_src_1_1 = _T_29 & ex_waddr == id_raddr2; // @[RocketCore.scala 383:74]
  wire  id_bypass_src_1_2 = _T_32 & mem_waddr == id_raddr2; // @[RocketCore.scala 383:74]
  wire  id_bypass_src_1_3 = _T_30 & mem_waddr == id_raddr2; // @[RocketCore.scala 383:74]
  reg  ex_reg_rs_bypass_0; // @[RocketCore.scala 387:29]
  reg  ex_reg_rs_bypass_1; // @[RocketCore.scala 387:29]
  reg [1:0] ex_reg_rs_lsb_0; // @[RocketCore.scala 388:26]
  reg [1:0] ex_reg_rs_lsb_1; // @[RocketCore.scala 388:26]
  reg [61:0] ex_reg_rs_msb_0; // @[RocketCore.scala 389:26]
  reg [61:0] ex_reg_rs_msb_1; // @[RocketCore.scala 389:26]
  wire [63:0] _ex_rs_T_1 = ex_reg_rs_lsb_0 == 2'h1 ? mem_reg_wdata : 64'h0; // @[package.scala 32:76]
  wire [63:0] _ex_rs_T_3 = ex_reg_rs_lsb_0 == 2'h2 ? wb_reg_wdata : _ex_rs_T_1; // @[package.scala 32:76]
  wire [63:0] _ex_rs_T_5 = ex_reg_rs_lsb_0 == 2'h3 ? io_dmem_resp_bits_data_word_bypass : _ex_rs_T_3; // @[package.scala 32:76]
  wire [63:0] _ex_rs_T_6 = {ex_reg_rs_msb_0,ex_reg_rs_lsb_0}; // @[Cat.scala 31:58]
  wire [63:0] _ex_rs_T_8 = ex_reg_rs_lsb_1 == 2'h1 ? mem_reg_wdata : 64'h0; // @[package.scala 32:76]
  wire [63:0] _ex_rs_T_10 = ex_reg_rs_lsb_1 == 2'h2 ? wb_reg_wdata : _ex_rs_T_8; // @[package.scala 32:76]
  wire [63:0] _ex_rs_T_12 = ex_reg_rs_lsb_1 == 2'h3 ? io_dmem_resp_bits_data_word_bypass : _ex_rs_T_10; // @[package.scala 32:76]
  wire [63:0] _ex_rs_T_13 = {ex_reg_rs_msb_1,ex_reg_rs_lsb_1}; // @[Cat.scala 31:58]
  wire [63:0] ex_rs_1 = ex_reg_rs_bypass_1 ? _ex_rs_T_12 : _ex_rs_T_13; // @[RocketCore.scala 391:14]
  wire  _ex_imm_sign_T = ex_ctrl_sel_imm == 3'h5; // @[RocketCore.scala 1086:24]
  wire  _ex_imm_sign_T_2 = ex_reg_inst[31]; // @[RocketCore.scala 1086:53]
  wire  ex_imm_sign = ex_ctrl_sel_imm == 3'h5 ? $signed(1'sh0) : $signed(_ex_imm_sign_T_2); // @[RocketCore.scala 1086:19]
  wire  _ex_imm_b30_20_T = ex_ctrl_sel_imm == 3'h2; // @[RocketCore.scala 1087:26]
  wire [10:0] _ex_imm_b30_20_T_2 = ex_reg_inst[30:20]; // @[RocketCore.scala 1087:49]
  wire [7:0] _ex_imm_b19_12_T_4 = ex_reg_inst[19:12]; // @[RocketCore.scala 1088:73]
  wire  _ex_imm_b11_T_2 = _ex_imm_b30_20_T | _ex_imm_sign_T; // @[RocketCore.scala 1089:33]
  wire  _ex_imm_b11_T_5 = ex_reg_inst[20]; // @[RocketCore.scala 1090:44]
  wire  _ex_imm_b11_T_6 = ex_ctrl_sel_imm == 3'h1; // @[RocketCore.scala 1091:23]
  wire  _ex_imm_b11_T_8 = ex_reg_inst[7]; // @[RocketCore.scala 1091:43]
  wire  _ex_imm_b11_T_9 = ex_ctrl_sel_imm == 3'h1 ? $signed(_ex_imm_b11_T_8) : $signed(ex_imm_sign); // @[RocketCore.scala 1091:18]
  wire  _ex_imm_b11_T_10 = ex_ctrl_sel_imm == 3'h3 ? $signed(_ex_imm_b11_T_5) : $signed(_ex_imm_b11_T_9); // @[RocketCore.scala 1090:18]
  wire [5:0] ex_imm_b10_5 = _ex_imm_b11_T_2 ? 6'h0 : ex_reg_inst[30:25]; // @[RocketCore.scala 1092:20]
  wire  _ex_imm_b4_1_T_1 = ex_ctrl_sel_imm == 3'h0; // @[RocketCore.scala 1094:24]
  wire [3:0] _ex_imm_b4_1_T_8 = _ex_imm_sign_T ? ex_reg_inst[19:16] : ex_reg_inst[24:21]; // @[RocketCore.scala 1095:19]
  wire [3:0] _ex_imm_b4_1_T_9 = ex_ctrl_sel_imm == 3'h0 | _ex_imm_b11_T_6 ? ex_reg_inst[11:8] : _ex_imm_b4_1_T_8; // @[RocketCore.scala 1094:19]
  wire [3:0] ex_imm_b4_1 = _ex_imm_b30_20_T ? 4'h0 : _ex_imm_b4_1_T_9; // @[RocketCore.scala 1093:19]
  wire  _ex_imm_b0_T_6 = _ex_imm_sign_T & ex_reg_inst[15]; // @[RocketCore.scala 1098:17]
  wire  _ex_imm_b0_T_7 = ex_ctrl_sel_imm == 3'h4 ? ex_reg_inst[20] : _ex_imm_b0_T_6; // @[RocketCore.scala 1097:17]
  wire  ex_imm_b0 = _ex_imm_b4_1_T_1 ? ex_reg_inst[7] : _ex_imm_b0_T_7; // @[RocketCore.scala 1096:17]
  wire  ex_imm_hi_lo_lo = _ex_imm_b30_20_T | _ex_imm_sign_T ? $signed(1'sh0) : $signed(_ex_imm_b11_T_10); // @[Cat.scala 31:58]
  wire [7:0] ex_imm_hi_lo_hi = ex_ctrl_sel_imm != 3'h2 & ex_ctrl_sel_imm != 3'h3 ? $signed({8{ex_imm_sign}}) : $signed(
    _ex_imm_b19_12_T_4); // @[Cat.scala 31:58]
  wire [10:0] ex_imm_hi_hi_lo = ex_ctrl_sel_imm == 3'h2 ? $signed(_ex_imm_b30_20_T_2) : $signed({11{ex_imm_sign}}); // @[Cat.scala 31:58]
  wire  ex_imm_hi_hi_hi = ex_ctrl_sel_imm == 3'h5 ? $signed(1'sh0) : $signed(_ex_imm_sign_T_2); // @[Cat.scala 31:58]
  wire [31:0] ex_imm = {ex_imm_hi_hi_hi,ex_imm_hi_hi_lo,ex_imm_hi_lo_hi,ex_imm_hi_lo_lo,ex_imm_b10_5,ex_imm_b4_1,
    ex_imm_b0}; // @[RocketCore.scala 1100:53]
  wire [63:0] _ex_op1_T = ex_reg_rs_bypass_0 ? _ex_rs_T_5 : _ex_rs_T_6; // @[RocketCore.scala 394:24]
  wire [39:0] _ex_op1_T_1 = ex_reg_pc; // @[RocketCore.scala 395:24]
  wire [63:0] _ex_op1_T_3 = 2'h1 == ex_ctrl_sel_alu1 ? $signed(_ex_op1_T) : $signed(64'sh0); // @[Mux.scala 81:58]
  wire [63:0] _ex_op2_T = ex_reg_rs_bypass_1 ? _ex_rs_T_12 : _ex_rs_T_13; // @[RocketCore.scala 397:24]
  wire [3:0] _ex_op2_T_1 = ex_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); // @[RocketCore.scala 399:19]
  wire [63:0] _ex_op2_T_3 = 2'h2 == ex_ctrl_sel_alu2 ? $signed(_ex_op2_T) : $signed(64'sh0); // @[Mux.scala 81:58]
  wire [63:0] _ex_op2_T_5 = 2'h3 == ex_ctrl_sel_alu2 ? $signed({{32{ex_imm[31]}},ex_imm}) : $signed(_ex_op2_T_3); // @[Mux.scala 81:58]
  wire  _T_144 = id_raddr1 != 5'h0; // @[RocketCore.scala 759:55]
  wire  _T_145 = id_ctrl_decoder_7 & id_raddr1 != 5'h0; // @[RocketCore.scala 759:42]
  wire  _data_hazard_ex_T = id_raddr1 == ex_waddr; // @[RocketCore.scala 779:70]
  wire  _T_146 = id_raddr2 != 5'h0; // @[RocketCore.scala 760:55]
  wire  _T_147 = id_ctrl_decoder_6 & id_raddr2 != 5'h0; // @[RocketCore.scala 760:42]
  wire  _data_hazard_ex_T_2 = id_raddr2 == ex_waddr; // @[RocketCore.scala 779:70]
  wire  _T_149 = id_ctrl_decoder_22 & id_waddr != 5'h0; // @[RocketCore.scala 761:42]
  wire  _data_hazard_ex_T_4 = id_waddr == ex_waddr; // @[RocketCore.scala 779:70]
  wire  _data_hazard_ex_T_7 = _T_145 & _data_hazard_ex_T | _T_147 & _data_hazard_ex_T_2 | _T_149 & _data_hazard_ex_T_4; // @[RocketCore.scala 1033:50]
  wire  data_hazard_ex = ex_ctrl_wxd & _data_hazard_ex_T_7; // @[RocketCore.scala 779:36]
  wire  ex_cannot_bypass = ex_ctrl_csr != 3'h0 | ex_ctrl_jalr | ex_ctrl_mem | ex_ctrl_mul | ex_ctrl_div | ex_ctrl_fp |
    ex_ctrl_rocc; // @[RocketCore.scala 778:123]
  wire  _fp_data_hazard_ex_T_5 = id_raddr3 == ex_waddr; // @[RocketCore.scala 780:90]
  wire  _fp_data_hazard_ex_T_11 = io_fpu_dec_ren1 & _data_hazard_ex_T | io_fpu_dec_ren2 & _data_hazard_ex_T_2 |
    io_fpu_dec_ren3 & _fp_data_hazard_ex_T_5 | io_fpu_dec_wen & _data_hazard_ex_T_4; // @[RocketCore.scala 1033:50]
  wire  fp_data_hazard_ex = id_ctrl_decoder_1 & ex_ctrl_wfd & _fp_data_hazard_ex_T_11; // @[RocketCore.scala 780:53]
  wire  id_ex_hazard = ex_reg_valid & (data_hazard_ex & ex_cannot_bypass | fp_data_hazard_ex); // @[RocketCore.scala 781:35]
  wire  _data_hazard_mem_T = id_raddr1 == mem_waddr; // @[RocketCore.scala 788:72]
  wire  _data_hazard_mem_T_2 = id_raddr2 == mem_waddr; // @[RocketCore.scala 788:72]
  wire  _data_hazard_mem_T_4 = id_waddr == mem_waddr; // @[RocketCore.scala 788:72]
  wire  _data_hazard_mem_T_7 = _T_145 & _data_hazard_mem_T | _T_147 & _data_hazard_mem_T_2 | _T_149 &
    _data_hazard_mem_T_4; // @[RocketCore.scala 1033:50]
  wire  data_hazard_mem = mem_ctrl_wxd & _data_hazard_mem_T_7; // @[RocketCore.scala 788:38]
  wire  mem_cannot_bypass = mem_ctrl_csr != 3'h0 | mem_ctrl_mem & mem_reg_slow_bypass | mem_ctrl_mul | mem_ctrl_div |
    mem_ctrl_fp | mem_ctrl_rocc; // @[RocketCore.scala 787:131]
  wire  _fp_data_hazard_mem_T_5 = id_raddr3 == mem_waddr; // @[RocketCore.scala 789:92]
  wire  _fp_data_hazard_mem_T_11 = io_fpu_dec_ren1 & _data_hazard_mem_T | io_fpu_dec_ren2 & _data_hazard_mem_T_2 |
    io_fpu_dec_ren3 & _fp_data_hazard_mem_T_5 | io_fpu_dec_wen & _data_hazard_mem_T_4; // @[RocketCore.scala 1033:50]
  wire  fp_data_hazard_mem = id_ctrl_decoder_1 & mem_ctrl_wfd & _fp_data_hazard_mem_T_11; // @[RocketCore.scala 789:55]
  wire  id_mem_hazard = mem_reg_valid & (data_hazard_mem & mem_cannot_bypass | fp_data_hazard_mem); // @[RocketCore.scala 790:37]
  wire  _data_hazard_wb_T = id_raddr1 == wb_waddr; // @[RocketCore.scala 794:70]
  wire  _data_hazard_wb_T_2 = id_raddr2 == wb_waddr; // @[RocketCore.scala 794:70]
  wire  _data_hazard_wb_T_4 = id_waddr == wb_waddr; // @[RocketCore.scala 794:70]
  wire  _data_hazard_wb_T_7 = _T_145 & _data_hazard_wb_T | _T_147 & _data_hazard_wb_T_2 | _T_149 & _data_hazard_wb_T_4; // @[RocketCore.scala 1033:50]
  wire  data_hazard_wb = wb_ctrl_wxd & _data_hazard_wb_T_7; // @[RocketCore.scala 794:36]
  wire  wb_dcache_miss = wb_ctrl_mem & ~io_dmem_resp_valid; // @[RocketCore.scala 511:36]
  wire  wb_set_sboard = wb_ctrl_div | wb_dcache_miss | wb_ctrl_rocc; // @[RocketCore.scala 665:53]
  wire  _fp_data_hazard_wb_T_5 = id_raddr3 == wb_waddr; // @[RocketCore.scala 795:90]
  wire  _fp_data_hazard_wb_T_11 = io_fpu_dec_ren1 & _data_hazard_wb_T | io_fpu_dec_ren2 & _data_hazard_wb_T_2 |
    io_fpu_dec_ren3 & _fp_data_hazard_wb_T_5 | io_fpu_dec_wen & _data_hazard_wb_T_4; // @[RocketCore.scala 1033:50]
  wire  fp_data_hazard_wb = id_ctrl_decoder_1 & wb_ctrl_wfd & _fp_data_hazard_wb_T_11; // @[RocketCore.scala 795:53]
  wire  id_wb_hazard = wb_reg_valid & (data_hazard_wb & wb_set_sboard | fp_data_hazard_wb); // @[RocketCore.scala 796:35]
  reg [31:0] _r; // @[RocketCore.scala 1050:25]
  wire [31:0] r = {_r[31:1], 1'h0}; // @[RocketCore.scala 1051:40]
  wire [31:0] _id_sboard_hazard_T = r >> id_raddr1; // @[RocketCore.scala 1047:35]
  wire  dmem_resp_valid = io_dmem_resp_valid & io_dmem_resp_bits_has_data; // @[RocketCore.scala 675:44]
  wire  dmem_resp_replay = dmem_resp_valid & io_dmem_resp_bits_replay; // @[RocketCore.scala 676:42]
  wire  dmem_resp_xpu = ~io_dmem_resp_bits_tag[0]; // @[RocketCore.scala 672:23]
  wire  ll_wen_x2 = div_io_resp_ready & div_io_resp_valid; // @[Decoupled.scala 50:35]
  wire  ll_wen = dmem_resp_replay & dmem_resp_xpu | ll_wen_x2; // @[RocketCore.scala 691:44 696:12]
  wire [4:0] dmem_resp_waddr = io_dmem_resp_bits_tag[5:1]; // @[RocketCore.scala 674:46]
  wire [4:0] ll_waddr = dmem_resp_replay & dmem_resp_xpu ? dmem_resp_waddr : div_io_resp_bits_tag; // @[RocketCore.scala 691:44 695:14]
  wire  _id_sboard_hazard_T_3 = ll_wen & ll_waddr == id_raddr1; // @[RocketCore.scala 771:58]
  wire  _id_sboard_hazard_T_5 = _id_sboard_hazard_T[0] & ~_id_sboard_hazard_T_3; // @[RocketCore.scala 774:77]
  wire [31:0] _id_sboard_hazard_T_7 = r >> id_raddr2; // @[RocketCore.scala 1047:35]
  wire  _id_sboard_hazard_T_10 = ll_wen & ll_waddr == id_raddr2; // @[RocketCore.scala 771:58]
  wire  _id_sboard_hazard_T_12 = _id_sboard_hazard_T_7[0] & ~_id_sboard_hazard_T_10; // @[RocketCore.scala 774:77]
  wire [31:0] _id_sboard_hazard_T_14 = r >> id_waddr; // @[RocketCore.scala 1047:35]
  wire  _id_sboard_hazard_T_17 = ll_wen & ll_waddr == id_waddr; // @[RocketCore.scala 771:58]
  wire  _id_sboard_hazard_T_19 = _id_sboard_hazard_T_14[0] & ~_id_sboard_hazard_T_17; // @[RocketCore.scala 774:77]
  wire  id_sboard_hazard = _T_145 & _id_sboard_hazard_T_5 | _T_147 & _id_sboard_hazard_T_12 | _T_149 &
    _id_sboard_hazard_T_19; // @[RocketCore.scala 1033:50]
  wire  _ctrl_stalld_T_5 = csr_io_singleStep & (ex_reg_valid | mem_reg_valid | wb_reg_valid); // @[RocketCore.scala 818:23]
  wire  _ctrl_stalld_T_6 = id_ex_hazard | id_mem_hazard | id_wb_hazard | id_sboard_hazard | _ctrl_stalld_T_5; // @[RocketCore.scala 817:71]
  wire  _ctrl_stalld_T_9 = id_csr_en & csr_io_decode_0_fp_csr & ~io_fpu_fcsr_rdy; // @[RocketCore.scala 819:42]
  wire  _ctrl_stalld_T_10 = _ctrl_stalld_T_6 | _ctrl_stalld_T_9; // @[RocketCore.scala 818:74]
  reg [31:0] id_stall_fpu__r; // @[RocketCore.scala 1050:25]
  wire [31:0] _id_stall_fpu_T_18 = id_stall_fpu__r >> id_raddr1; // @[RocketCore.scala 1047:35]
  wire [31:0] _id_stall_fpu_T_21 = id_stall_fpu__r >> id_raddr2; // @[RocketCore.scala 1047:35]
  wire [31:0] _id_stall_fpu_T_24 = id_stall_fpu__r >> id_raddr3; // @[RocketCore.scala 1047:35]
  wire [31:0] _id_stall_fpu_T_27 = id_stall_fpu__r >> id_waddr; // @[RocketCore.scala 1047:35]
  wire  id_stall_fpu = io_fpu_dec_ren1 & _id_stall_fpu_T_18[0] | io_fpu_dec_ren2 & _id_stall_fpu_T_21[0] |
    io_fpu_dec_ren3 & _id_stall_fpu_T_24[0] | io_fpu_dec_wen & _id_stall_fpu_T_27[0]; // @[RocketCore.scala 1033:50]
  wire  _ctrl_stalld_T_11 = id_ctrl_decoder_1 & id_stall_fpu; // @[RocketCore.scala 820:16]
  wire  _ctrl_stalld_T_12 = _ctrl_stalld_T_10 | _ctrl_stalld_T_11; // @[RocketCore.scala 819:62]
  reg  blocked; // @[RocketCore.scala 809:22]
  wire  _dcache_blocked_T = ~io_dmem_perf_grant; // @[RocketCore.scala 811:16]
  wire  dcache_blocked = blocked & ~io_dmem_perf_grant; // @[RocketCore.scala 811:13]
  wire  _ctrl_stalld_T_13 = id_ctrl_decoder_14 & dcache_blocked; // @[RocketCore.scala 821:17]
  wire  _ctrl_stalld_T_14 = _ctrl_stalld_T_12 | _ctrl_stalld_T_13; // @[RocketCore.scala 820:32]
  reg  rocc_blocked; // @[RocketCore.scala 813:25]
  wire  _ctrl_stalld_T_15 = id_ctrl_decoder_2 & rocc_blocked; // @[RocketCore.scala 822:18]
  wire  _ctrl_stalld_T_16 = _ctrl_stalld_T_14 | _ctrl_stalld_T_15; // @[RocketCore.scala 821:35]
  wire  wb_wxd = wb_reg_valid & wb_ctrl_wxd; // @[RocketCore.scala 664:29]
  wire  _ctrl_stalld_T_17 = ~wb_wxd; // @[RocketCore.scala 823:65]
  wire  _ctrl_stalld_T_22 = id_ctrl_decoder_21 & (~(div_io_req_ready | div_io_resp_valid & ~wb_wxd) | div_io_req_valid); // @[RocketCore.scala 823:17]
  wire  _ctrl_stalld_T_23 = _ctrl_stalld_T_16 | _ctrl_stalld_T_22; // @[RocketCore.scala 822:34]
  wire  _ctrl_stalld_T_26 = _ctrl_stalld_T_23 | id_do_fence_x9; // @[RocketCore.scala 824:15]
  wire  _ctrl_stalld_T_27 = _ctrl_stalld_T_26 | csr_io_csr_stall; // @[RocketCore.scala 825:17]
  wire  ctrl_stalld = _ctrl_stalld_T_27 | id_reg_pause; // @[RocketCore.scala 826:22]
  wire  ctrl_killd = ~ibuf_io_inst_0_valid | ibuf_io_inst_0_bits_replay | take_pc_mem_wb | ctrl_stalld |
    csr_io_interrupt; // @[RocketCore.scala 829:104]
  wire  _ex_reg_valid_T = ~ctrl_killd; // @[RocketCore.scala 439:19]
  wire  _ex_reg_replay_T = ~take_pc_mem_wb; // @[RocketCore.scala 440:20]
  wire  _ex_reg_replay_T_1 = ~take_pc_mem_wb & ibuf_io_inst_0_valid; // @[RocketCore.scala 440:29]
  wire  _GEN_1 = id_ctrl_decoder_25 & id_fence_succ == 4'h0 | id_reg_pause; // @[RocketCore.scala 117:25 450:{49,64}]
  wire  _GEN_2 = id_fence_next | _GEN_0; // @[RocketCore.scala 451:{26,41}]
  wire [2:0] _T_37 = {ibuf_io_inst_0_bits_xcpt1_pf_inst,ibuf_io_inst_0_bits_xcpt1_gf_inst,
    ibuf_io_inst_0_bits_xcpt1_ae_inst}; // @[RocketCore.scala 457:22]
  wire  _GEN_5 = |_T_37 | ibuf_io_inst_0_bits_rvc; // @[RocketCore.scala 446:16 457:34 460:20]
  wire [2:0] _T_39 = {ibuf_io_inst_0_bits_xcpt0_pf_inst,1'h0,ibuf_io_inst_0_bits_xcpt0_ae_inst}; // @[RocketCore.scala 462:40]
  wire  _GEN_9 = id_xcpt | id_ctrl_decoder_12; // @[RocketCore.scala 445:13 452:20 454:22]
  wire  _T_42 = id_ctrl_decoder_15 == 5'h14; // @[package.scala 15:47]
  wire  _T_43 = id_ctrl_decoder_15 == 5'h15; // @[package.scala 15:47]
  wire  _T_44 = id_ctrl_decoder_15 == 5'h16; // @[package.scala 15:47]
  wire  _T_45 = id_ctrl_decoder_15 == 5'h5; // @[package.scala 15:47]
  wire  _T_48 = _T_42 | _T_43 | _T_44 | _T_45; // @[package.scala 72:59]
  wire [1:0] _ex_reg_mem_size_T_6 = {_T_146,_T_144}; // @[Cat.scala 31:58]
  wire  do_bypass = id_bypass_src_0_0 | id_bypass_src_0_1 | id_bypass_src_0_2 | id_bypass_src_0_3; // @[RocketCore.scala 484:48]
  wire [1:0] _bypass_src_T = id_bypass_src_0_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [1:0] _bypass_src_T_1 = id_bypass_src_0_1 ? 2'h1 : _bypass_src_T; // @[Mux.scala 47:70]
  wire  _wb_valid_T_2 = ~wb_xcpt; // @[RocketCore.scala 699:48]
  wire  wb_valid = wb_reg_valid & ~replay_wb & ~wb_xcpt; // @[RocketCore.scala 699:45]
  wire  wb_wen = wb_valid & wb_ctrl_wxd; // @[RocketCore.scala 700:25]
  wire  rf_wen = wb_wen | ll_wen; // @[RocketCore.scala 701:23]
  wire [4:0] rf_waddr = ll_wen ? ll_waddr : wb_waddr; // @[RocketCore.scala 702:21]
  wire  _T_139 = rf_waddr != 5'h0; // @[RocketCore.scala 1076:16]
  wire  _rf_wdata_T = dmem_resp_valid & dmem_resp_xpu; // @[RocketCore.scala 703:38]
  wire [63:0] ll_wdata = div_io_resp_bits_data;
  wire [63:0] _rf_wdata_T_4 = wb_ctrl_csr != 3'h0 ? csr_io_rw_rdata : wb_reg_wdata; // @[RocketCore.scala 705:21]
  wire [63:0] _rf_wdata_T_5 = ll_wen ? ll_wdata : _rf_wdata_T_4; // @[RocketCore.scala 704:21]
  wire [63:0] rf_wdata = dmem_resp_valid & dmem_resp_xpu ? io_dmem_resp_bits_data : _rf_wdata_T_5; // @[RocketCore.scala 703:21]
  wire [63:0] _GEN_233 = rf_waddr == id_raddr1 ? rf_wdata : _id_rs_T_4; // @[RocketCore.scala 1071:19 1079:{31,39}]
  wire [63:0] _GEN_240 = rf_waddr != 5'h0 ? _GEN_233 : _id_rs_T_4; // @[RocketCore.scala 1071:19 1076:29]
  wire [63:0] id_rs_0 = rf_wen ? _GEN_240 : _id_rs_T_4; // @[RocketCore.scala 708:17 1071:19]
  wire  do_bypass_1 = id_bypass_src_1_0 | id_bypass_src_1_1 | id_bypass_src_1_2 | id_bypass_src_1_3; // @[RocketCore.scala 484:48]
  wire [1:0] _bypass_src_T_2 = id_bypass_src_1_2 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire [63:0] _GEN_234 = rf_waddr == id_raddr2 ? rf_wdata : _id_rs_T_9; // @[RocketCore.scala 1071:19 1079:{31,39}]
  wire [63:0] _GEN_241 = rf_waddr != 5'h0 ? _GEN_234 : _id_rs_T_9; // @[RocketCore.scala 1071:19 1076:29]
  wire [63:0] id_rs_1 = rf_wen ? _GEN_241 : _id_rs_T_9; // @[RocketCore.scala 708:17 1071:19]
  wire [31:0] inst = ibuf_io_inst_0_bits_rvc ? {{16'd0}, ibuf_io_inst_0_bits_raw[15:0]} : ibuf_io_inst_0_bits_raw; // @[RocketCore.scala 494:21]
  wire  id_load_use = mem_reg_valid & data_hazard_mem & mem_ctrl_mem; // @[RocketCore.scala 791:51]
  wire  _replay_ex_structural_T = ~io_dmem_req_ready; // @[RocketCore.scala 512:45]
  wire  _replay_ex_structural_T_3 = ex_ctrl_div & ~div_io_req_ready; // @[RocketCore.scala 513:42]
  wire  replay_ex_structural = ex_ctrl_mem & ~io_dmem_req_ready | _replay_ex_structural_T_3; // @[RocketCore.scala 512:64]
  wire  replay_ex_load_use = wb_dcache_miss & ex_reg_load_use; // @[RocketCore.scala 514:43]
  wire  replay_ex = ex_reg_replay | ex_reg_valid & (replay_ex_structural | replay_ex_load_use); // @[RocketCore.scala 515:33]
  wire  ctrl_killx = take_pc_mem_wb | replay_ex | ~ex_reg_valid; // @[RocketCore.scala 516:48]
  wire  _ex_slow_bypass_T = ex_ctrl_mem_cmd == 5'h7; // @[RocketCore.scala 518:40]
  wire  ex_slow_bypass = ex_ctrl_mem_cmd == 5'h7 | ex_reg_mem_size < 2'h2; // @[RocketCore.scala 518:50]
  wire  ex_sfence = ex_ctrl_mem & (ex_ctrl_mem_cmd == 5'h14 | ex_ctrl_mem_cmd == 5'h15 | ex_ctrl_mem_cmd == 5'h16); // @[RocketCore.scala 519:48]
  wire  ex_xcpt = ex_reg_xcpt_interrupt | ex_reg_xcpt; // @[RocketCore.scala 522:28]
  wire  mem_pc_valid = mem_reg_valid | mem_reg_replay | mem_reg_xcpt_interrupt; // @[RocketCore.scala 528:54]
  wire  mem_npc_misaligned = _id_illegal_insn_T_18 & mem_npc[1] & ~mem_reg_sfence; // @[RocketCore.scala 537:70]
  wire [63:0] mem_int_wdata = _take_pc_mem_T & (mem_ctrl_jalr ^ mem_npc_misaligned) ? $signed({{24{mem_br_target[39]}},
    mem_br_target}) : $signed(mem_reg_wdata); // @[RocketCore.scala 538:119]
  wire  mem_cfi = mem_ctrl_branch | mem_ctrl_jalr | mem_ctrl_jal; // @[RocketCore.scala 539:50]
  wire  mem_cfi_taken = _mem_br_target_T_1 | mem_ctrl_jalr | mem_ctrl_jal; // @[RocketCore.scala 540:74]
  wire  _mem_reg_valid_T = ~ctrl_killx; // @[RocketCore.scala 545:20]
  wire  _mem_reg_load_T = ex_ctrl_mem_cmd == 5'h0; // @[package.scala 15:47]
  wire  _mem_reg_load_T_1 = ex_ctrl_mem_cmd == 5'h10; // @[package.scala 15:47]
  wire  _mem_reg_load_T_2 = ex_ctrl_mem_cmd == 5'h6; // @[package.scala 15:47]
  wire  _mem_reg_load_T_6 = _mem_reg_load_T | _mem_reg_load_T_1 | _mem_reg_load_T_2 | _ex_slow_bypass_T; // @[package.scala 72:59]
  wire  _mem_reg_load_T_7 = ex_ctrl_mem_cmd == 5'h4; // @[package.scala 15:47]
  wire  _mem_reg_load_T_8 = ex_ctrl_mem_cmd == 5'h9; // @[package.scala 15:47]
  wire  _mem_reg_load_T_9 = ex_ctrl_mem_cmd == 5'ha; // @[package.scala 15:47]
  wire  _mem_reg_load_T_10 = ex_ctrl_mem_cmd == 5'hb; // @[package.scala 15:47]
  wire  _mem_reg_load_T_13 = _mem_reg_load_T_7 | _mem_reg_load_T_8 | _mem_reg_load_T_9 | _mem_reg_load_T_10; // @[package.scala 72:59]
  wire  _mem_reg_load_T_14 = ex_ctrl_mem_cmd == 5'h8; // @[package.scala 15:47]
  wire  _mem_reg_load_T_15 = ex_ctrl_mem_cmd == 5'hc; // @[package.scala 15:47]
  wire  _mem_reg_load_T_16 = ex_ctrl_mem_cmd == 5'hd; // @[package.scala 15:47]
  wire  _mem_reg_load_T_17 = ex_ctrl_mem_cmd == 5'he; // @[package.scala 15:47]
  wire  _mem_reg_load_T_18 = ex_ctrl_mem_cmd == 5'hf; // @[package.scala 15:47]
  wire  _mem_reg_load_T_22 = _mem_reg_load_T_14 | _mem_reg_load_T_15 | _mem_reg_load_T_16 | _mem_reg_load_T_17 |
    _mem_reg_load_T_18; // @[package.scala 72:59]
  wire  _mem_reg_load_T_23 = _mem_reg_load_T_13 | _mem_reg_load_T_22; // @[Consts.scala 83:44]
  wire  _mem_reg_load_T_24 = _mem_reg_load_T_6 | _mem_reg_load_T_23; // @[Consts.scala 85:68]
  wire  _mem_reg_store_T_22 = ex_ctrl_mem_cmd == 5'h1 | ex_ctrl_mem_cmd == 5'h11 | _ex_slow_bypass_T |
    _mem_reg_load_T_23; // @[Consts.scala 86:76]
  wire [63:0] _mem_reg_wdata_T = alu_io_out; // @[RocketCore.scala 573:25]
  wire [1:0] size = ex_ctrl_rocc ? 2'h3 : ex_reg_mem_size; // @[RocketCore.scala 577:21]
  wire [63:0] _mem_reg_rs2_T_4 = {ex_rs_1[7:0],ex_rs_1[7:0],ex_rs_1[7:0],ex_rs_1[7:0],ex_rs_1[7:0],ex_rs_1[7:0],ex_rs_1[
    7:0],ex_rs_1[7:0]}; // @[Cat.scala 31:58]
  wire [63:0] _mem_reg_rs2_T_8 = {ex_rs_1[15:0],ex_rs_1[15:0],ex_rs_1[15:0],ex_rs_1[15:0]}; // @[Cat.scala 31:58]
  wire [63:0] _mem_reg_rs2_T_11 = {ex_rs_1[31:0],ex_rs_1[31:0]}; // @[Cat.scala 31:58]
  wire [63:0] _mem_reg_rs2_T_12 = size == 2'h2 ? _mem_reg_rs2_T_11 : ex_rs_1; // @[AMOALU.scala 27:13]
  wire [63:0] _mem_reg_rs2_T_13 = size == 2'h1 ? _mem_reg_rs2_T_8 : _mem_reg_rs2_T_12; // @[AMOALU.scala 27:13]
  wire  _GEN_79 = ex_ctrl_jalr & csr_io_status_debug | ex_ctrl_fence_i; // @[RocketCore.scala 555:14 580:48 582:24]
  wire  _GEN_80 = ex_ctrl_jalr & csr_io_status_debug | ex_reg_flush_pipe; // @[RocketCore.scala 563:24 580:48 583:26]
  wire  mem_breakpoint = mem_reg_load & bpu_io_xcpt_ld | mem_reg_store & bpu_io_xcpt_st; // @[RocketCore.scala 587:57]
  wire  mem_debug_breakpoint = mem_reg_load & bpu_io_debug_ld | mem_reg_store & bpu_io_debug_st; // @[RocketCore.scala 588:64]
  wire  mem_ldst_xcpt = mem_debug_breakpoint | mem_breakpoint; // @[RocketCore.scala 1024:26]
  wire [3:0] mem_ldst_cause = mem_debug_breakpoint ? 4'he : 4'h3; // @[Mux.scala 47:70]
  wire  _T_74 = mem_reg_xcpt_interrupt | mem_reg_xcpt; // @[RocketCore.scala 594:29]
  wire  _T_75 = mem_reg_valid & mem_npc_misaligned; // @[RocketCore.scala 595:20]
  wire  _T_76 = mem_reg_valid & mem_ldst_xcpt; // @[RocketCore.scala 596:20]
  wire  mem_xcpt = _T_74 | _T_75 | _T_76; // @[RocketCore.scala 1024:26]
  wire [3:0] _T_78 = _T_75 ? 4'h0 : mem_ldst_cause; // @[Mux.scala 47:70]
  wire  dcache_kill_mem = _T_30 & io_dmem_replay_next; // @[RocketCore.scala 605:55]
  wire  fpu_kill_mem = mem_reg_valid & mem_ctrl_fp & io_fpu_nack_mem; // @[RocketCore.scala 606:51]
  wire  replay_mem = dcache_kill_mem | mem_reg_replay | fpu_kill_mem; // @[RocketCore.scala 607:55]
  wire  killm_common = dcache_kill_mem | take_pc_wb | mem_reg_xcpt | ~mem_reg_valid; // @[RocketCore.scala 608:68]
  reg  div_io_kill_REG; // @[RocketCore.scala 609:37]
  wire  ctrl_killm = killm_common | mem_xcpt | fpu_kill_mem; // @[RocketCore.scala 610:45]
  wire  _wb_reg_valid_T = ~ctrl_killm; // @[RocketCore.scala 613:19]
  wire  _wb_reg_replay_T = ~take_pc_wb; // @[RocketCore.scala 614:34]
  wire [2:0] _T_119 = _T_109 ? 3'h6 : 3'h4; // @[Mux.scala 47:70]
  wire [2:0] _T_120 = _T_107 ? 3'h5 : _T_119; // @[Mux.scala 47:70]
  wire [2:0] _T_121 = _T_105 ? 3'h7 : _T_120; // @[Mux.scala 47:70]
  wire [4:0] _T_122 = {{2'd0}, _T_121}; // @[Mux.scala 47:70]
  wire [4:0] _T_124 = _T_99 ? 5'hd : _T_122; // @[Mux.scala 47:70]
  wire [4:0] _T_125 = _T_97 ? 5'hf : _T_124; // @[Mux.scala 47:70]
  wire [15:0] _csr_io_inst_0_T_3 = &wb_reg_raw_inst[1:0] ? wb_reg_inst[31:16] : 16'h0; // @[RocketCore.scala 716:50]
  wire  tval_dmem_addr = ~wb_reg_xcpt; // @[RocketCore.scala 725:24]
  wire  _tval_any_addr_T = wb_reg_cause == 64'h3; // @[package.scala 15:47]
  wire  _tval_any_addr_T_1 = wb_reg_cause == 64'h1; // @[package.scala 15:47]
  wire  _tval_any_addr_T_2 = wb_reg_cause == 64'hc; // @[package.scala 15:47]
  wire  _tval_any_addr_T_3 = wb_reg_cause == 64'h14; // @[package.scala 15:47]
  wire  _tval_any_addr_T_6 = _tval_any_addr_T | _tval_any_addr_T_1 | _tval_any_addr_T_2 | _tval_any_addr_T_3; // @[package.scala 72:59]
  wire  tval_any_addr = tval_dmem_addr | _tval_any_addr_T_6; // @[RocketCore.scala 726:38]
  wire  tval_inst = wb_reg_cause == 64'h2; // @[RocketCore.scala 728:32]
  wire  tval_valid = wb_xcpt & (tval_any_addr | tval_inst); // @[RocketCore.scala 729:28]
  wire [63:0] _csr_io_tval_a_T = wb_reg_wdata; // @[RocketCore.scala 1038:16]
  wire [24:0] a_1 = _csr_io_tval_a_T[63:39]; // @[RocketCore.scala 1038:23]
  wire  msb_1 = $signed(a_1) == 25'sh0 | $signed(a_1) == -25'sh1 ? wb_reg_wdata[39] : ~wb_reg_wdata[38]; // @[RocketCore.scala 1039:18]
  wire [39:0] _csr_io_tval_T_1 = {msb_1,wb_reg_wdata[38:0]}; // @[Cat.scala 31:58]
  wire  htval_valid_imem = wb_reg_xcpt & _tval_any_addr_T_3; // @[RocketCore.scala 733:40]
  wire  _csr_io_htval_T_3 = ~reset; // @[RocketCore.scala 735:11]
  wire [2:0] _csr_io_rw_cmd_T = wb_reg_valid ? 3'h0 : 3'h4; // @[CSR.scala 168:15]
  wire [2:0] _csr_io_rw_cmd_T_1 = ~_csr_io_rw_cmd_T; // @[CSR.scala 168:11]
  wire [31:0] _T_150 = 32'h1 << ll_waddr; // @[RocketCore.scala 1054:62]
  wire [31:0] _T_151 = ll_wen ? _T_150 : 32'h0; // @[RocketCore.scala 1054:49]
  wire [31:0] _T_152 = ~_T_151; // @[RocketCore.scala 1046:64]
  wire [31:0] _T_153 = r & _T_152; // @[RocketCore.scala 1046:62]
  wire  _T_155 = wb_set_sboard & wb_wen; // @[RocketCore.scala 775:28]
  wire [31:0] _T_156 = 32'h1 << wb_waddr; // @[RocketCore.scala 1054:62]
  wire [31:0] _T_157 = _T_155 ? _T_156 : 32'h0; // @[RocketCore.scala 1054:49]
  wire [31:0] _T_158 = _T_153 | _T_157; // @[RocketCore.scala 1045:60]
  wire  _T_159 = ll_wen | _T_155; // @[RocketCore.scala 1057:17]
  wire  _id_stall_fpu_T_2 = (wb_dcache_miss & wb_ctrl_wfd | io_fpu_sboard_set) & wb_valid; // @[RocketCore.scala 800:72]
  wire [31:0] _id_stall_fpu_T_4 = _id_stall_fpu_T_2 ? _T_156 : 32'h0; // @[RocketCore.scala 1054:49]
  wire [31:0] _id_stall_fpu_T_5 = id_stall_fpu__r | _id_stall_fpu_T_4; // @[RocketCore.scala 1045:60]
  wire  _id_stall_fpu_T_7 = dmem_resp_replay & io_dmem_resp_bits_tag[0]; // @[RocketCore.scala 801:38]
  wire [31:0] _id_stall_fpu_T_8 = 32'h1 << dmem_resp_waddr; // @[RocketCore.scala 1054:62]
  wire [31:0] _id_stall_fpu_T_9 = _id_stall_fpu_T_7 ? _id_stall_fpu_T_8 : 32'h0; // @[RocketCore.scala 1054:49]
  wire [31:0] _id_stall_fpu_T_10 = ~_id_stall_fpu_T_9; // @[RocketCore.scala 1046:64]
  wire [31:0] _id_stall_fpu_T_11 = _id_stall_fpu_T_5 & _id_stall_fpu_T_10; // @[RocketCore.scala 1046:62]
  wire  _id_stall_fpu_T_12 = _id_stall_fpu_T_2 | _id_stall_fpu_T_7; // @[RocketCore.scala 1057:17]
  wire [31:0] _id_stall_fpu_T_13 = 32'h1 << io_fpu_sboard_clra; // @[RocketCore.scala 1054:62]
  wire [31:0] _id_stall_fpu_T_14 = io_fpu_sboard_clr ? _id_stall_fpu_T_13 : 32'h0; // @[RocketCore.scala 1054:49]
  wire [31:0] _id_stall_fpu_T_15 = ~_id_stall_fpu_T_14; // @[RocketCore.scala 1046:64]
  wire [31:0] _id_stall_fpu_T_16 = _id_stall_fpu_T_11 & _id_stall_fpu_T_15; // @[RocketCore.scala 1046:62]
  wire  _id_stall_fpu_T_17 = _id_stall_fpu_T_2 | _id_stall_fpu_T_7 | io_fpu_sboard_clr; // @[RocketCore.scala 1057:17]
  wire [39:0] _io_imem_req_bits_pc_T_1 = replay_wb ? wb_reg_pc : mem_npc; // @[RocketCore.scala 835:8]
  wire  _io_imem_progress_T = ~replay_wb_common; // @[RocketCore.scala 842:47]
  reg  io_imem_progress_REG; // @[RocketCore.scala 842:30]
  wire  _io_imem_btb_update_bits_cfiType_T = mem_ctrl_jal | mem_ctrl_jalr; // @[RocketCore.scala 857:23]
  wire [4:0] _io_imem_btb_update_bits_cfiType_T_5 = mem_reg_inst[19:15] & 5'h1b; // @[RocketCore.scala 858:62]
  wire [1:0] _io_imem_btb_update_bits_cfiType_T_10 = mem_ctrl_jalr & 5'h1 == _io_imem_btb_update_bits_cfiType_T_5 ? 2'h3
     : {{1'd0}, _io_imem_btb_update_bits_cfiType_T}; // @[RocketCore.scala 858:8]
  wire [1:0] _io_imem_btb_update_bits_br_pc_T = mem_reg_rvc ? 2'h0 : 2'h2; // @[RocketCore.scala 862:74]
  wire [39:0] _GEN_257 = {{38'd0}, _io_imem_btb_update_bits_br_pc_T}; // @[RocketCore.scala 862:69]
  wire [39:0] _io_imem_btb_update_bits_br_pc_T_2 = mem_reg_pc + _GEN_257; // @[RocketCore.scala 862:69]
  wire [38:0] _io_imem_btb_update_bits_pc_T = ~io_imem_btb_update_bits_br_pc; // @[RocketCore.scala 863:35]
  wire [38:0] _io_imem_btb_update_bits_pc_T_1 = _io_imem_btb_update_bits_pc_T | 39'h3; // @[RocketCore.scala 863:66]
  wire [5:0] ex_dcache_tag = {ex_waddr,ex_ctrl_fp}; // @[Cat.scala 31:58]
  wire [24:0] a_2 = _ex_op1_T[63:39]; // @[RocketCore.scala 1038:23]
  wire  msb_2 = $signed(a_2) == 25'sh0 | $signed(a_2) == -25'sh1 ? alu_io_adder_out[39] : ~alu_io_adder_out[38]; // @[RocketCore.scala 1039:18]
  wire  unpause = csr_io_time[4:0] == 5'h0 | csr_io_inhibit_cycle | io_dmem_perf_release | take_pc_mem_wb; // @[RocketCore.scala 910:116]
  wire  coreMonitorBundle_valid = csr_io_trace_0_valid & ~csr_io_trace_0_exception; // @[RocketCore.scala 938:52]
  wire [39:0] _coreMonitorBundle_pc_T = csr_io_trace_0_iaddr; // @[RocketCore.scala 939:48]
  wire [23:0] _coreMonitorBundle_pc_T_3 = _coreMonitorBundle_pc_T[39] ? 24'hffffff : 24'h0; // @[Bitwise.scala 74:12]
  wire [63:0] coreMonitorBundle_pc = {_coreMonitorBundle_pc_T_3,_coreMonitorBundle_pc_T}; // @[Cat.scala 31:58]
  wire  coreMonitorBundle_wrenx = wb_wen & ~wb_set_sboard; // @[RocketCore.scala 940:37]
  reg [63:0] coreMonitorBundle_rd0val_x23; // @[RocketCore.scala 945:43]
  reg [63:0] coreMonitorBundle_rd0val_REG; // @[RocketCore.scala 945:34]
  reg [63:0] coreMonitorBundle_rd1val_x29; // @[RocketCore.scala 947:43]
  reg [63:0] coreMonitorBundle_rd1val_REG; // @[RocketCore.scala 947:34]
  wire [4:0] _T_161 = wb_ctrl_wxd | wb_ctrl_wfd ? wb_waddr : 5'h0; // @[RocketCore.scala 983:13]
  wire [63:0] _T_162 = coreMonitorBundle_wrenx ? rf_wdata : 64'h0; // @[RocketCore.scala 984:13]
  wire  _T_163 = wb_ctrl_rxs1 | wb_ctrl_rfs1; // @[RocketCore.scala 986:27]
  wire [4:0] _T_164 = wb_ctrl_rxs1 | wb_ctrl_rfs1 ? wb_reg_inst[19:15] : 5'h0; // @[RocketCore.scala 986:13]
  wire [63:0] _T_166 = _T_163 ? coreMonitorBundle_rd0val_REG : 64'h0; // @[RocketCore.scala 987:13]
  wire  _T_167 = wb_ctrl_rxs2 | wb_ctrl_rfs2; // @[RocketCore.scala 988:27]
  wire [4:0] _T_168 = wb_ctrl_rxs2 | wb_ctrl_rfs2 ? wb_reg_inst[24:20] : 5'h0; // @[RocketCore.scala 988:13]
  wire [63:0] _T_170 = _T_167 ? coreMonitorBundle_rd1val_REG : 64'h0; // @[RocketCore.scala 989:13]
  wire [31:0] coreMonitorBundle_inst = csr_io_trace_0_insn; // @[RocketCore.scala 932:31 948:26]
  IBuf ibuf ( // @[RocketCore.scala 264:20]
    .clock(ibuf_clock),
    .reset(ibuf_reset),
    .io_imem_ready(ibuf_io_imem_ready),
    .io_imem_valid(ibuf_io_imem_valid),
    .io_imem_bits_btb_taken(ibuf_io_imem_bits_btb_taken),
    .io_imem_bits_btb_bridx(ibuf_io_imem_bits_btb_bridx),
    .io_imem_bits_btb_entry(ibuf_io_imem_bits_btb_entry),
    .io_imem_bits_btb_bht_history(ibuf_io_imem_bits_btb_bht_history),
    .io_imem_bits_pc(ibuf_io_imem_bits_pc),
    .io_imem_bits_data(ibuf_io_imem_bits_data),
    .io_imem_bits_xcpt_pf_inst(ibuf_io_imem_bits_xcpt_pf_inst),
    .io_imem_bits_xcpt_ae_inst(ibuf_io_imem_bits_xcpt_ae_inst),
    .io_imem_bits_replay(ibuf_io_imem_bits_replay),
    .io_kill(ibuf_io_kill),
    .io_pc(ibuf_io_pc),
    .io_btb_resp_entry(ibuf_io_btb_resp_entry),
    .io_btb_resp_bht_history(ibuf_io_btb_resp_bht_history),
    .io_inst_0_ready(ibuf_io_inst_0_ready),
    .io_inst_0_valid(ibuf_io_inst_0_valid),
    .io_inst_0_bits_xcpt0_pf_inst(ibuf_io_inst_0_bits_xcpt0_pf_inst),
    .io_inst_0_bits_xcpt0_ae_inst(ibuf_io_inst_0_bits_xcpt0_ae_inst),
    .io_inst_0_bits_xcpt1_pf_inst(ibuf_io_inst_0_bits_xcpt1_pf_inst),
    .io_inst_0_bits_xcpt1_gf_inst(ibuf_io_inst_0_bits_xcpt1_gf_inst),
    .io_inst_0_bits_xcpt1_ae_inst(ibuf_io_inst_0_bits_xcpt1_ae_inst),
    .io_inst_0_bits_replay(ibuf_io_inst_0_bits_replay),
    .io_inst_0_bits_rvc(ibuf_io_inst_0_bits_rvc),
    .io_inst_0_bits_inst_bits(ibuf_io_inst_0_bits_inst_bits),
    .io_inst_0_bits_inst_rd(ibuf_io_inst_0_bits_inst_rd),
    .io_inst_0_bits_inst_rs1(ibuf_io_inst_0_bits_inst_rs1),
    .io_inst_0_bits_inst_rs2(ibuf_io_inst_0_bits_inst_rs2),
    .io_inst_0_bits_inst_rs3(ibuf_io_inst_0_bits_inst_rs3),
    .io_inst_0_bits_raw(ibuf_io_inst_0_bits_raw)
  );
  CSRFile csr ( // @[RocketCore.scala 293:19]
    .clock(csr_clock),
    .reset(csr_reset),
    .io_ungated_clock(csr_io_ungated_clock),
    .io_interrupts_debug(csr_io_interrupts_debug),
    .io_interrupts_mtip(csr_io_interrupts_mtip),
    .io_interrupts_msip(csr_io_interrupts_msip),
    .io_interrupts_meip(csr_io_interrupts_meip),
    .io_interrupts_seip(csr_io_interrupts_seip),
    .io_hartid(csr_io_hartid),
    .io_rw_addr(csr_io_rw_addr),
    .io_rw_cmd(csr_io_rw_cmd),
    .io_rw_rdata(csr_io_rw_rdata),
    .io_rw_wdata(csr_io_rw_wdata),
    .io_decode_0_inst(csr_io_decode_0_inst),
    .io_decode_0_fp_illegal(csr_io_decode_0_fp_illegal),
    .io_decode_0_fp_csr(csr_io_decode_0_fp_csr),
    .io_decode_0_rocc_illegal(csr_io_decode_0_rocc_illegal),
    .io_decode_0_read_illegal(csr_io_decode_0_read_illegal),
    .io_decode_0_write_illegal(csr_io_decode_0_write_illegal),
    .io_decode_0_write_flush(csr_io_decode_0_write_flush),
    .io_decode_0_system_illegal(csr_io_decode_0_system_illegal),
    .io_csr_stall(csr_io_csr_stall),
    .io_eret(csr_io_eret),
    .io_singleStep(csr_io_singleStep),
    .io_status_debug(csr_io_status_debug),
    .io_status_cease(csr_io_status_cease),
    .io_status_wfi(csr_io_status_wfi),
    .io_status_isa(csr_io_status_isa),
    .io_status_dprv(csr_io_status_dprv),
    .io_status_dv(csr_io_status_dv),
    .io_status_prv(csr_io_status_prv),
    .io_status_v(csr_io_status_v),
    .io_status_sd(csr_io_status_sd),
    .io_status_zero2(csr_io_status_zero2),
    .io_status_mpv(csr_io_status_mpv),
    .io_status_gva(csr_io_status_gva),
    .io_status_mbe(csr_io_status_mbe),
    .io_status_sbe(csr_io_status_sbe),
    .io_status_sxl(csr_io_status_sxl),
    .io_status_uxl(csr_io_status_uxl),
    .io_status_sd_rv32(csr_io_status_sd_rv32),
    .io_status_zero1(csr_io_status_zero1),
    .io_status_tsr(csr_io_status_tsr),
    .io_status_tw(csr_io_status_tw),
    .io_status_tvm(csr_io_status_tvm),
    .io_status_mxr(csr_io_status_mxr),
    .io_status_sum(csr_io_status_sum),
    .io_status_mprv(csr_io_status_mprv),
    .io_status_xs(csr_io_status_xs),
    .io_status_fs(csr_io_status_fs),
    .io_status_mpp(csr_io_status_mpp),
    .io_status_vs(csr_io_status_vs),
    .io_status_spp(csr_io_status_spp),
    .io_status_mpie(csr_io_status_mpie),
    .io_status_ube(csr_io_status_ube),
    .io_status_spie(csr_io_status_spie),
    .io_status_upie(csr_io_status_upie),
    .io_status_mie(csr_io_status_mie),
    .io_status_hie(csr_io_status_hie),
    .io_status_sie(csr_io_status_sie),
    .io_status_uie(csr_io_status_uie),
    .io_ptbr_mode(csr_io_ptbr_mode),
    .io_ptbr_ppn(csr_io_ptbr_ppn),
    .io_evec(csr_io_evec),
    .io_exception(csr_io_exception),
    .io_retire(csr_io_retire),
    .io_cause(csr_io_cause),
    .io_pc(csr_io_pc),
    .io_tval(csr_io_tval),
    .io_gva(csr_io_gva),
    .io_time(csr_io_time),
    .io_fcsr_rm(csr_io_fcsr_rm),
    .io_fcsr_flags_valid(csr_io_fcsr_flags_valid),
    .io_fcsr_flags_bits(csr_io_fcsr_flags_bits),
    .io_interrupt(csr_io_interrupt),
    .io_interrupt_cause(csr_io_interrupt_cause),
    .io_bp_0_control_action(csr_io_bp_0_control_action),
    .io_bp_0_control_tmatch(csr_io_bp_0_control_tmatch),
    .io_bp_0_control_m(csr_io_bp_0_control_m),
    .io_bp_0_control_s(csr_io_bp_0_control_s),
    .io_bp_0_control_u(csr_io_bp_0_control_u),
    .io_bp_0_control_x(csr_io_bp_0_control_x),
    .io_bp_0_control_w(csr_io_bp_0_control_w),
    .io_bp_0_control_r(csr_io_bp_0_control_r),
    .io_bp_0_address(csr_io_bp_0_address),
    .io_pmp_0_cfg_l(csr_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_a(csr_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(csr_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(csr_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(csr_io_pmp_0_cfg_r),
    .io_pmp_0_addr(csr_io_pmp_0_addr),
    .io_pmp_0_mask(csr_io_pmp_0_mask),
    .io_pmp_1_cfg_l(csr_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_a(csr_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(csr_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(csr_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(csr_io_pmp_1_cfg_r),
    .io_pmp_1_addr(csr_io_pmp_1_addr),
    .io_pmp_1_mask(csr_io_pmp_1_mask),
    .io_pmp_2_cfg_l(csr_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_a(csr_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(csr_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(csr_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(csr_io_pmp_2_cfg_r),
    .io_pmp_2_addr(csr_io_pmp_2_addr),
    .io_pmp_2_mask(csr_io_pmp_2_mask),
    .io_pmp_3_cfg_l(csr_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_a(csr_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(csr_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(csr_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(csr_io_pmp_3_cfg_r),
    .io_pmp_3_addr(csr_io_pmp_3_addr),
    .io_pmp_3_mask(csr_io_pmp_3_mask),
    .io_pmp_4_cfg_l(csr_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_a(csr_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(csr_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(csr_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(csr_io_pmp_4_cfg_r),
    .io_pmp_4_addr(csr_io_pmp_4_addr),
    .io_pmp_4_mask(csr_io_pmp_4_mask),
    .io_pmp_5_cfg_l(csr_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_a(csr_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(csr_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(csr_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(csr_io_pmp_5_cfg_r),
    .io_pmp_5_addr(csr_io_pmp_5_addr),
    .io_pmp_5_mask(csr_io_pmp_5_mask),
    .io_pmp_6_cfg_l(csr_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_a(csr_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(csr_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(csr_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(csr_io_pmp_6_cfg_r),
    .io_pmp_6_addr(csr_io_pmp_6_addr),
    .io_pmp_6_mask(csr_io_pmp_6_mask),
    .io_pmp_7_cfg_l(csr_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_a(csr_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(csr_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(csr_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(csr_io_pmp_7_cfg_r),
    .io_pmp_7_addr(csr_io_pmp_7_addr),
    .io_pmp_7_mask(csr_io_pmp_7_mask),
    .io_inhibit_cycle(csr_io_inhibit_cycle),
    .io_inst_0(csr_io_inst_0),
    .io_trace_0_valid(csr_io_trace_0_valid),
    .io_trace_0_iaddr(csr_io_trace_0_iaddr),
    .io_trace_0_insn(csr_io_trace_0_insn),
    .io_trace_0_exception(csr_io_trace_0_exception),
    .io_customCSRs_0_value(csr_io_customCSRs_0_value)
  );
  BreakpointUnit bpu ( // @[RocketCore.scala 336:19]
    .io_status_debug(bpu_io_status_debug),
    .io_status_prv(bpu_io_status_prv),
    .io_bp_0_control_action(bpu_io_bp_0_control_action),
    .io_bp_0_control_tmatch(bpu_io_bp_0_control_tmatch),
    .io_bp_0_control_m(bpu_io_bp_0_control_m),
    .io_bp_0_control_s(bpu_io_bp_0_control_s),
    .io_bp_0_control_u(bpu_io_bp_0_control_u),
    .io_bp_0_control_x(bpu_io_bp_0_control_x),
    .io_bp_0_control_w(bpu_io_bp_0_control_w),
    .io_bp_0_control_r(bpu_io_bp_0_control_r),
    .io_bp_0_address(bpu_io_bp_0_address),
    .io_pc(bpu_io_pc),
    .io_ea(bpu_io_ea),
    .io_xcpt_if(bpu_io_xcpt_if),
    .io_xcpt_ld(bpu_io_xcpt_ld),
    .io_xcpt_st(bpu_io_xcpt_st),
    .io_debug_if(bpu_io_debug_if),
    .io_debug_ld(bpu_io_debug_ld),
    .io_debug_st(bpu_io_debug_st)
  );
  ALU alu ( // @[RocketCore.scala 401:19]
    .io_dw(alu_io_dw),
    .io_fn(alu_io_fn),
    .io_in2(alu_io_in2),
    .io_in1(alu_io_in1),
    .io_out(alu_io_out),
    .io_adder_out(alu_io_adder_out),
    .io_cmp_out(alu_io_cmp_out)
  );
  MulDiv div ( // @[RocketCore.scala 425:19]
    .clock(div_clock),
    .reset(div_reset),
    .io_req_ready(div_io_req_ready),
    .io_req_valid(div_io_req_valid),
    .io_req_bits_fn(div_io_req_bits_fn),
    .io_req_bits_dw(div_io_req_bits_dw),
    .io_req_bits_in1(div_io_req_bits_in1),
    .io_req_bits_in2(div_io_req_bits_in2),
    .io_req_bits_tag(div_io_req_bits_tag),
    .io_kill(div_io_kill),
    .io_resp_ready(div_io_resp_ready),
    .io_resp_valid(div_io_resp_valid),
    .io_resp_bits_data(div_io_resp_bits_data),
    .io_resp_bits_tag(div_io_resp_bits_tag)
  );
  PlusArgTimeout PlusArgTimeout ( // @[PlusArg.scala 89:11]
    .clock(PlusArgTimeout_clock),
    .reset(PlusArgTimeout_reset),
    .io_count(PlusArgTimeout_io_count)
  );
  assign rf_id_rs_MPORT_en = 1'h1;
  assign rf_id_rs_MPORT_addr = ~id_raddr1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign rf_id_rs_MPORT_data = rf[rf_id_rs_MPORT_addr]; // @[RocketCore.scala 1064:15]
  `else
  assign rf_id_rs_MPORT_data = rf_id_rs_MPORT_addr >= 5'h1f ? _RAND_1[63:0] : rf[rf_id_rs_MPORT_addr]; // @[RocketCore.scala 1064:15]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign rf_id_rs_MPORT_1_en = 1'h1;
  assign rf_id_rs_MPORT_1_addr = ~id_raddr2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign rf_id_rs_MPORT_1_data = rf[rf_id_rs_MPORT_1_addr]; // @[RocketCore.scala 1064:15]
  `else
  assign rf_id_rs_MPORT_1_data = rf_id_rs_MPORT_1_addr >= 5'h1f ? _RAND_2[63:0] : rf[rf_id_rs_MPORT_1_addr]; // @[RocketCore.scala 1064:15]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign rf_MPORT_data = _rf_wdata_T ? io_dmem_resp_bits_data : _rf_wdata_T_5;
  assign rf_MPORT_addr = ~rf_waddr;
  assign rf_MPORT_mask = 1'h1;
  assign rf_MPORT_en = rf_wen & _T_139;
  assign io_imem_might_request = imem_might_request_reg; // @[RocketCore.scala 838:25]
  assign io_imem_req_valid = take_pc_wb | take_pc_mem; // @[RocketCore.scala 260:35]
  assign io_imem_req_bits_pc = wb_xcpt | csr_io_eret ? csr_io_evec : _io_imem_req_bits_pc_T_1; // @[RocketCore.scala 834:8]
  assign io_imem_req_bits_speculative = ~take_pc_wb; // @[RocketCore.scala 832:35]
  assign io_imem_sfence_valid = wb_reg_valid & wb_reg_sfence; // @[RocketCore.scala 843:40]
  assign io_imem_sfence_bits_rs1 = wb_reg_mem_size[0]; // @[RocketCore.scala 844:45]
  assign io_imem_sfence_bits_rs2 = wb_reg_mem_size[1]; // @[RocketCore.scala 845:45]
  assign io_imem_sfence_bits_addr = wb_reg_wdata[38:0]; // @[RocketCore.scala 846:28]
  assign io_imem_resp_ready = ibuf_io_imem_ready; // @[RocketCore.scala 268:16]
  assign io_imem_btb_update_valid = mem_reg_valid & _wb_reg_replay_T & mem_wrong_npc & (~mem_cfi | mem_cfi_taken); // @[RocketCore.scala 854:77]
  assign io_imem_btb_update_bits_prediction_entry = mem_reg_btb_resp_entry; // @[RocketCore.scala 864:38]
  assign io_imem_btb_update_bits_pc = ~_io_imem_btb_update_bits_pc_T_1; // @[RocketCore.scala 863:33]
  assign io_imem_btb_update_bits_isValid = mem_ctrl_branch | mem_ctrl_jalr | mem_ctrl_jal; // @[RocketCore.scala 539:50]
  assign io_imem_btb_update_bits_br_pc = _io_imem_btb_update_bits_br_pc_T_2[38:0]; // @[RocketCore.scala 862:33]
  assign io_imem_btb_update_bits_cfiType = (mem_ctrl_jal | mem_ctrl_jalr) & mem_waddr[0] ? 2'h2 :
    _io_imem_btb_update_bits_cfiType_T_10; // @[RocketCore.scala 857:8]
  assign io_imem_bht_update_valid = mem_reg_valid & _wb_reg_replay_T; // @[RocketCore.scala 866:45]
  assign io_imem_bht_update_bits_prediction_history = mem_reg_btb_resp_bht_history; // @[RocketCore.scala 871:38]
  assign io_imem_bht_update_bits_pc = io_imem_btb_update_bits_pc; // @[RocketCore.scala 867:30]
  assign io_imem_bht_update_bits_branch = mem_ctrl_branch; // @[RocketCore.scala 870:34]
  assign io_imem_bht_update_bits_taken = mem_br_taken; // @[RocketCore.scala 868:33]
  assign io_imem_bht_update_bits_mispredict = ex_pc_valid ? mem_npc != ex_reg_pc : _mem_wrong_npc_T_3; // @[RocketCore.scala 535:8]
  assign io_imem_flush_icache = wb_reg_valid & wb_ctrl_fence_i & ~io_dmem_s2_nack; // @[RocketCore.scala 837:59]
  assign io_imem_progress = io_imem_progress_REG; // @[RocketCore.scala 842:20]
  assign io_dmem_req_valid = ex_reg_valid & ex_ctrl_mem; // @[RocketCore.scala 884:41]
  assign io_dmem_req_bits_addr = {msb_2,alu_io_adder_out[38:0]}; // @[Cat.scala 31:58]
  assign io_dmem_req_bits_tag = {{1'd0}, ex_dcache_tag}; // @[RocketCore.scala 887:25]
  assign io_dmem_req_bits_cmd = ex_ctrl_mem_cmd; // @[RocketCore.scala 888:25]
  assign io_dmem_req_bits_size = ex_reg_mem_size; // @[RocketCore.scala 889:25]
  assign io_dmem_req_bits_signed = ~ex_reg_inst[14]; // @[RocketCore.scala 890:30]
  assign io_dmem_req_bits_dprv = csr_io_status_dprv; // @[RocketCore.scala 894:31]
  assign io_dmem_req_bits_dv = 1'h0; // @[RocketCore.scala 895:37]
  assign io_dmem_s1_kill = killm_common | mem_ldst_xcpt | fpu_kill_mem; // @[RocketCore.scala 897:52]
  assign io_dmem_s1_data_data = mem_ctrl_fp ? io_fpu_store_data : mem_reg_rs2; // @[RocketCore.scala 896:63]
  assign io_ptw_ptbr_mode = csr_io_ptbr_mode; // @[RocketCore.scala 742:15]
  assign io_ptw_ptbr_ppn = csr_io_ptbr_ppn; // @[RocketCore.scala 742:15]
  assign io_ptw_sfence_valid = io_imem_sfence_valid; // @[RocketCore.scala 850:17]
  assign io_ptw_sfence_bits_rs1 = io_imem_sfence_bits_rs1; // @[RocketCore.scala 850:17]
  assign io_ptw_status_debug = csr_io_status_debug; // @[RocketCore.scala 746:17]
  assign io_ptw_status_prv = csr_io_status_prv; // @[RocketCore.scala 746:17]
  assign io_ptw_status_mxr = csr_io_status_mxr; // @[RocketCore.scala 746:17]
  assign io_ptw_status_sum = csr_io_status_sum; // @[RocketCore.scala 746:17]
  assign io_ptw_pmp_0_cfg_l = csr_io_pmp_0_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_0_cfg_a = csr_io_pmp_0_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_0_cfg_x = csr_io_pmp_0_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_0_cfg_w = csr_io_pmp_0_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_0_cfg_r = csr_io_pmp_0_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_0_addr = csr_io_pmp_0_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_0_mask = csr_io_pmp_0_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_1_cfg_l = csr_io_pmp_1_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_1_cfg_a = csr_io_pmp_1_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_1_cfg_x = csr_io_pmp_1_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_1_cfg_w = csr_io_pmp_1_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_1_cfg_r = csr_io_pmp_1_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_1_addr = csr_io_pmp_1_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_1_mask = csr_io_pmp_1_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_2_cfg_l = csr_io_pmp_2_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_2_cfg_a = csr_io_pmp_2_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_2_cfg_x = csr_io_pmp_2_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_2_cfg_w = csr_io_pmp_2_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_2_cfg_r = csr_io_pmp_2_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_2_addr = csr_io_pmp_2_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_2_mask = csr_io_pmp_2_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_3_cfg_l = csr_io_pmp_3_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_3_cfg_a = csr_io_pmp_3_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_3_cfg_x = csr_io_pmp_3_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_3_cfg_w = csr_io_pmp_3_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_3_cfg_r = csr_io_pmp_3_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_3_addr = csr_io_pmp_3_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_3_mask = csr_io_pmp_3_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_4_cfg_l = csr_io_pmp_4_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_4_cfg_a = csr_io_pmp_4_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_4_cfg_x = csr_io_pmp_4_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_4_cfg_w = csr_io_pmp_4_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_4_cfg_r = csr_io_pmp_4_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_4_addr = csr_io_pmp_4_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_4_mask = csr_io_pmp_4_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_5_cfg_l = csr_io_pmp_5_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_5_cfg_a = csr_io_pmp_5_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_5_cfg_x = csr_io_pmp_5_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_5_cfg_w = csr_io_pmp_5_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_5_cfg_r = csr_io_pmp_5_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_5_addr = csr_io_pmp_5_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_5_mask = csr_io_pmp_5_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_6_cfg_l = csr_io_pmp_6_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_6_cfg_a = csr_io_pmp_6_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_6_cfg_x = csr_io_pmp_6_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_6_cfg_w = csr_io_pmp_6_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_6_cfg_r = csr_io_pmp_6_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_6_addr = csr_io_pmp_6_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_6_mask = csr_io_pmp_6_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_7_cfg_l = csr_io_pmp_7_cfg_l; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_7_cfg_a = csr_io_pmp_7_cfg_a; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_7_cfg_x = csr_io_pmp_7_cfg_x; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_7_cfg_w = csr_io_pmp_7_cfg_w; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_7_cfg_r = csr_io_pmp_7_cfg_r; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_7_addr = csr_io_pmp_7_addr; // @[RocketCore.scala 749:14]
  assign io_ptw_pmp_7_mask = csr_io_pmp_7_mask; // @[RocketCore.scala 749:14]
  assign io_ptw_customCSRs_csrs_0_value = csr_io_customCSRs_0_value; // @[RocketCore.scala 745:79]
  assign io_fpu_inst = ibuf_io_inst_0_bits_inst_bits; // @[RocketCore.scala 876:15]
  assign io_fpu_fromint_data = ex_reg_rs_bypass_0 ? _ex_rs_T_5 : _ex_rs_T_6; // @[RocketCore.scala 391:14]
  assign io_fpu_fcsr_rm = csr_io_fcsr_rm; // @[RocketCore.scala 719:18]
  assign io_fpu_dmem_resp_val = dmem_resp_valid & io_dmem_resp_bits_tag[0]; // @[RocketCore.scala 878:43]
  assign io_fpu_dmem_resp_type = {{1'd0}, io_dmem_resp_bits_size}; // @[RocketCore.scala 880:25]
  assign io_fpu_dmem_resp_tag = io_dmem_resp_bits_tag[5:1]; // @[RocketCore.scala 674:46]
  assign io_fpu_dmem_resp_data = io_dmem_resp_bits_data_word_bypass; // @[RocketCore.scala 879:25]
  assign io_fpu_valid = _ex_reg_valid_T & id_ctrl_decoder_1; // @[RocketCore.scala 873:31]
  assign io_fpu_killx = take_pc_mem_wb | replay_ex | ~ex_reg_valid; // @[RocketCore.scala 516:48]
  assign io_fpu_killm = dcache_kill_mem | take_pc_wb | mem_reg_xcpt | ~mem_reg_valid; // @[RocketCore.scala 608:68]
  assign io_rocc_cmd_valid = replay_wb_rocc & _io_imem_progress_T; // @[RocketCore.scala 902:53]
  assign io_wfi = csr_io_status_wfi; // @[RocketCore.scala 913:10]
  assign ibuf_clock = clock;
  assign ibuf_reset = reset;
  assign ibuf_io_imem_valid = io_imem_resp_valid; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_btb_taken = io_imem_resp_bits_btb_taken; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_btb_bridx = io_imem_resp_bits_btb_bridx; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_btb_entry = io_imem_resp_bits_btb_entry; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_btb_bht_history = io_imem_resp_bits_btb_bht_history; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_pc = io_imem_resp_bits_pc; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_data = io_imem_resp_bits_data; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_xcpt_pf_inst = io_imem_resp_bits_xcpt_pf_inst; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_xcpt_ae_inst = io_imem_resp_bits_xcpt_ae_inst; // @[RocketCore.scala 268:16]
  assign ibuf_io_imem_bits_replay = io_imem_resp_bits_replay; // @[RocketCore.scala 268:16]
  assign ibuf_io_kill = take_pc_wb | take_pc_mem; // @[RocketCore.scala 260:35]
  assign ibuf_io_inst_0_ready = ~ctrl_stalld; // @[RocketCore.scala 852:28]
  assign csr_clock = clock;
  assign csr_reset = reset;
  assign csr_io_ungated_clock = clock; // @[RocketCore.scala 711:24]
  assign csr_io_interrupts_debug = io_interrupts_debug; // @[RocketCore.scala 717:21]
  assign csr_io_interrupts_mtip = io_interrupts_mtip; // @[RocketCore.scala 717:21]
  assign csr_io_interrupts_msip = io_interrupts_msip; // @[RocketCore.scala 717:21]
  assign csr_io_interrupts_meip = io_interrupts_meip; // @[RocketCore.scala 717:21]
  assign csr_io_interrupts_seip = io_interrupts_seip; // @[RocketCore.scala 717:21]
  assign csr_io_hartid = io_hartid; // @[RocketCore.scala 718:17]
  assign csr_io_rw_addr = wb_reg_inst[31:20]; // @[RocketCore.scala 750:32]
  assign csr_io_rw_cmd = wb_ctrl_csr & _csr_io_rw_cmd_T_1; // @[CSR.scala 168:9]
  assign csr_io_rw_wdata = wb_reg_wdata; // @[RocketCore.scala 752:19]
  assign csr_io_decode_0_inst = ibuf_io_inst_0_bits_inst_bits; // @[RocketCore.scala 712:25]
  assign csr_io_exception = wb_reg_xcpt | _T_97 | _T_99 | _T_105 | _T_107 | _T_109 | _T_111; // @[RocketCore.scala 1024:26]
  assign csr_io_retire = wb_reg_valid & ~replay_wb & ~wb_xcpt; // @[RocketCore.scala 699:45]
  assign csr_io_cause = wb_reg_xcpt ? wb_reg_cause : {{59'd0}, _T_125}; // @[Mux.scala 47:70]
  assign csr_io_pc = wb_reg_pc; // @[RocketCore.scala 724:13]
  assign csr_io_tval = tval_valid ? _csr_io_tval_T_1 : 40'h0; // @[RocketCore.scala 731:21]
  assign csr_io_gva = wb_xcpt & (tval_dmem_addr & wb_reg_hls_or_dv); // @[RocketCore.scala 730:25]
  assign csr_io_fcsr_flags_valid = io_fpu_fcsr_flags_valid; // @[RocketCore.scala 720:21]
  assign csr_io_fcsr_flags_bits = io_fpu_fcsr_flags_bits; // @[RocketCore.scala 720:21]
  assign csr_io_inst_0 = {_csr_io_inst_0_T_3,wb_reg_raw_inst[15:0]}; // @[Cat.scala 31:58]
  assign bpu_io_status_debug = csr_io_status_debug; // @[RocketCore.scala 337:17]
  assign bpu_io_status_prv = csr_io_status_prv; // @[RocketCore.scala 337:17]
  assign bpu_io_bp_0_control_action = csr_io_bp_0_control_action; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_control_tmatch = csr_io_bp_0_control_tmatch; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_control_m = csr_io_bp_0_control_m; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_control_s = csr_io_bp_0_control_s; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_control_u = csr_io_bp_0_control_u; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_control_x = csr_io_bp_0_control_x; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_control_w = csr_io_bp_0_control_w; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_control_r = csr_io_bp_0_control_r; // @[RocketCore.scala 338:13]
  assign bpu_io_bp_0_address = csr_io_bp_0_address; // @[RocketCore.scala 338:13]
  assign bpu_io_pc = ibuf_io_pc[38:0]; // @[RocketCore.scala 339:13]
  assign bpu_io_ea = mem_reg_wdata[38:0]; // @[RocketCore.scala 340:13]
  assign alu_io_dw = ex_ctrl_alu_dw; // @[RocketCore.scala 402:13]
  assign alu_io_fn = ex_ctrl_alu_fn; // @[RocketCore.scala 403:13]
  assign alu_io_in2 = 2'h1 == ex_ctrl_sel_alu2 ? $signed({{60{_ex_op2_T_1[3]}},_ex_op2_T_1}) : $signed(_ex_op2_T_5); // @[RocketCore.scala 404:24]
  assign alu_io_in1 = 2'h2 == ex_ctrl_sel_alu1 ? $signed({{24{_ex_op1_T_1[39]}},_ex_op1_T_1}) : $signed(_ex_op1_T_3); // @[RocketCore.scala 405:24]
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_req_valid = ex_reg_valid & ex_ctrl_div; // @[RocketCore.scala 426:36]
  assign div_io_req_bits_fn = ex_ctrl_alu_fn; // @[RocketCore.scala 428:22]
  assign div_io_req_bits_dw = ex_ctrl_alu_dw; // @[RocketCore.scala 427:22]
  assign div_io_req_bits_in1 = ex_reg_rs_bypass_0 ? _ex_rs_T_5 : _ex_rs_T_6; // @[RocketCore.scala 391:14]
  assign div_io_req_bits_in2 = ex_reg_rs_bypass_1 ? _ex_rs_T_12 : _ex_rs_T_13; // @[RocketCore.scala 391:14]
  assign div_io_req_bits_tag = ex_reg_inst[11:7]; // @[RocketCore.scala 375:29]
  assign div_io_kill = killm_common & div_io_kill_REG; // @[RocketCore.scala 609:31]
  assign div_io_resp_ready = dmem_resp_replay & dmem_resp_xpu ? 1'h0 : _ctrl_stalld_T_17; // @[RocketCore.scala 678:21 691:44 692:23]
  assign PlusArgTimeout_clock = clock;
  assign PlusArgTimeout_reset = reset;
  assign PlusArgTimeout_io_count = csr_io_time[31:0]; // @[PlusArg.scala 89:82]
  always @(posedge clock) begin
    if (rf_MPORT_en & rf_MPORT_mask) begin
      rf[rf_MPORT_addr] <= rf_MPORT_data; // @[RocketCore.scala 1064:15]
    end
    if (unpause) begin // @[RocketCore.scala 911:18]
      id_reg_pause <= 1'h0; // @[RocketCore.scala 911:33]
    end else if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      id_reg_pause <= _GEN_1;
    end
    imem_might_request_reg <= ex_pc_valid | mem_pc_valid | io_ptw_customCSRs_csrs_0_value[1]; // @[RocketCore.scala 839:59]
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_fp <= id_ctrl_decoder_1; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_rocc <= id_ctrl_decoder_2; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_branch <= id_ctrl_decoder_3; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_jal <= id_ctrl_decoder_4; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_jalr <= id_ctrl_decoder_5; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_rxs2 <= id_ctrl_decoder_6; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_rxs1 <= id_ctrl_decoder_7; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_xcpt) begin // @[RocketCore.scala 452:20]
        if (bpu_io_xcpt_if | |_T_39) begin // @[RocketCore.scala 462:52]
          ex_ctrl_sel_alu2 <= 2'h0; // @[RocketCore.scala 464:26]
        end else if (|_T_37) begin // @[RocketCore.scala 457:34]
          ex_ctrl_sel_alu2 <= 2'h1; // @[RocketCore.scala 459:26]
        end else begin
          ex_ctrl_sel_alu2 <= 2'h0; // @[RocketCore.scala 456:24]
        end
      end else begin
        ex_ctrl_sel_alu2 <= id_ctrl_decoder_9; // @[RocketCore.scala 445:13]
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_xcpt) begin // @[RocketCore.scala 452:20]
        if (bpu_io_xcpt_if | |_T_39) begin // @[RocketCore.scala 462:52]
          ex_ctrl_sel_alu1 <= 2'h2; // @[RocketCore.scala 463:26]
        end else if (|_T_37) begin // @[RocketCore.scala 457:34]
          ex_ctrl_sel_alu1 <= 2'h2; // @[RocketCore.scala 458:26]
        end else begin
          ex_ctrl_sel_alu1 <= 2'h1; // @[RocketCore.scala 455:24]
        end
      end else begin
        ex_ctrl_sel_alu1 <= id_ctrl_decoder_10; // @[RocketCore.scala 445:13]
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_sel_imm <= id_ctrl_decoder_11; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_alu_dw <= _GEN_9;
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_xcpt) begin // @[RocketCore.scala 452:20]
        ex_ctrl_alu_fn <= 4'h0; // @[RocketCore.scala 453:22]
      end else begin
        ex_ctrl_alu_fn <= id_ctrl_decoder_13; // @[RocketCore.scala 445:13]
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_mem <= id_ctrl_decoder_14; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_mem_cmd <= id_ctrl_decoder_15;
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_rfs1 <= id_ctrl_decoder_16; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_rfs2 <= id_ctrl_decoder_17; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_wfd <= id_ctrl_decoder_19; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_mul <= id_ctrl_decoder_20; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_div <= id_ctrl_decoder_21; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_wxd <= id_ctrl_decoder_22; // @[RocketCore.scala 445:13]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_system_insn & id_ctrl_decoder_14) begin // @[RocketCore.scala 297:19]
        ex_ctrl_csr <= 3'h0;
      end else if (id_csr_ren) begin // @[RocketCore.scala 297:61]
        ex_ctrl_csr <= 3'h2;
      end else begin
        ex_ctrl_csr <= id_ctrl_decoder_23;
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_ctrl_fence_i <= id_ctrl_decoder_24; // @[RocketCore.scala 445:13]
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_fp <= ex_ctrl_fp; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_rocc <= ex_ctrl_rocc; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_branch <= ex_ctrl_branch; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_jal <= ex_ctrl_jal; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_jalr <= ex_ctrl_jalr; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_rxs2 <= ex_ctrl_rxs2; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_rxs1 <= ex_ctrl_rxs1; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_mem <= ex_ctrl_mem; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_rfs1 <= ex_ctrl_rfs1; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_rfs2 <= ex_ctrl_rfs2; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_wfd <= ex_ctrl_wfd; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_mul <= ex_ctrl_mul; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_div <= ex_ctrl_div; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_wxd <= ex_ctrl_wxd; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_csr <= ex_ctrl_csr; // @[RocketCore.scala 555:14]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_ctrl_fence_i <= _GEN_79;
      end
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_rocc <= mem_ctrl_rocc; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_rxs2 <= mem_ctrl_rxs2; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_rxs1 <= mem_ctrl_rxs1; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_mem <= mem_ctrl_mem; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_rfs1 <= mem_ctrl_rfs1; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_rfs2 <= mem_ctrl_rfs2; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_wfd <= mem_ctrl_wfd; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_div <= mem_ctrl_div; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_wxd <= mem_ctrl_wxd; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_csr <= mem_ctrl_csr; // @[RocketCore.scala 618:13]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_ctrl_fence_i <= mem_ctrl_fence_i; // @[RocketCore.scala 618:13]
    end
    ex_reg_xcpt_interrupt <= _ex_reg_replay_T_1 & csr_io_interrupt; // @[RocketCore.scala 442:62]
    ex_reg_valid <= ~ctrl_killd; // @[RocketCore.scala 439:19]
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_xcpt) begin // @[RocketCore.scala 452:20]
        ex_reg_rvc <= _GEN_5;
      end else begin
        ex_reg_rvc <= ibuf_io_inst_0_bits_rvc; // @[RocketCore.scala 446:16]
      end
    end
    if (_ex_reg_valid_T | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[RocketCore.scala 500:73]
      ex_reg_btb_resp_entry <= ibuf_io_btb_resp_entry; // @[RocketCore.scala 505:21]
    end
    if (_ex_reg_valid_T | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[RocketCore.scala 500:73]
      ex_reg_btb_resp_bht_history <= ibuf_io_btb_resp_bht_history; // @[RocketCore.scala 505:21]
    end
    ex_reg_xcpt <= _ex_reg_valid_T & id_xcpt; // @[RocketCore.scala 441:30]
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_reg_flush_pipe <= id_ctrl_decoder_24 | id_csr_flush; // @[RocketCore.scala 467:23]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_reg_load_use <= id_load_use; // @[RocketCore.scala 468:21]
    end
    if (_ex_reg_valid_T | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[RocketCore.scala 500:73]
      if (csr_io_interrupt) begin // @[Mux.scala 47:70]
        ex_reg_cause <= csr_io_interrupt_cause;
      end else begin
        ex_reg_cause <= {{59'd0}, _T_18};
      end
    end
    ex_reg_replay <= ~take_pc_mem_wb & ibuf_io_inst_0_valid & ibuf_io_inst_0_bits_replay; // @[RocketCore.scala 440:54]
    if (_ex_reg_valid_T | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[RocketCore.scala 500:73]
      ex_reg_pc <= ibuf_io_pc; // @[RocketCore.scala 504:15]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (_T_48) begin // @[RocketCore.scala 471:81]
        ex_reg_mem_size <= _ex_reg_mem_size_T_6; // @[RocketCore.scala 472:23]
      end else begin
        ex_reg_mem_size <= ibuf_io_inst_0_bits_inst_bits[13:12]; // @[RocketCore.scala 470:21]
      end
    end
    if (_ex_reg_valid_T | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[RocketCore.scala 500:73]
      ex_reg_inst <= ibuf_io_inst_0_bits_inst_bits; // @[RocketCore.scala 502:17]
    end
    if (_ex_reg_valid_T | csr_io_interrupt | ibuf_io_inst_0_bits_replay) begin // @[RocketCore.scala 500:73]
      ex_reg_raw_inst <= ibuf_io_inst_0_bits_raw; // @[RocketCore.scala 503:21]
    end
    mem_reg_xcpt_interrupt <= _ex_reg_replay_T & ex_reg_xcpt_interrupt; // @[RocketCore.scala 548:45]
    mem_reg_valid <= ~ctrl_killx; // @[RocketCore.scala 545:20]
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_rvc <= ex_reg_rvc; // @[RocketCore.scala 558:17]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_btb_resp_entry <= ex_reg_btb_resp_entry; // @[RocketCore.scala 562:22]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_btb_resp_bht_history <= ex_reg_btb_resp_bht_history; // @[RocketCore.scala 562:22]
      end
    end
    mem_reg_xcpt <= _mem_reg_valid_T & ex_xcpt; // @[RocketCore.scala 547:31]
    mem_reg_replay <= _ex_reg_replay_T & replay_ex; // @[RocketCore.scala 546:37]
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_flush_pipe <= _GEN_80;
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_cause <= ex_reg_cause; // @[RocketCore.scala 567:19]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_slow_bypass <= ex_slow_bypass; // @[RocketCore.scala 564:25]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_load <= ex_ctrl_mem & _mem_reg_load_T_24; // @[RocketCore.scala 559:18]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_store <= ex_ctrl_mem & _mem_reg_store_T_22; // @[RocketCore.scala 560:19]
      end
    end
    if (mem_reg_valid & mem_reg_flush_pipe) begin // @[RocketCore.scala 552:46]
      mem_reg_sfence <= 1'h0; // @[RocketCore.scala 553:20]
    end else if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
      mem_reg_sfence <= ex_sfence; // @[RocketCore.scala 561:20]
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_pc <= ex_reg_pc; // @[RocketCore.scala 572:16]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_inst <= ex_reg_inst; // @[RocketCore.scala 568:18]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_mem_size <= ex_reg_mem_size; // @[RocketCore.scala 570:22]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_hls_or_dv <= io_dmem_req_bits_dv; // @[RocketCore.scala 571:23]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_raw_inst <= ex_reg_raw_inst; // @[RocketCore.scala 569:22]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_reg_wdata <= _mem_reg_wdata_T; // @[RocketCore.scala 573:19]
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        if (ex_ctrl_rxs2 & (ex_ctrl_mem | ex_ctrl_rocc | ex_sfence)) begin // @[RocketCore.scala 576:71]
          if (size == 2'h0) begin // @[AMOALU.scala 27:13]
            mem_reg_rs2 <= _mem_reg_rs2_T_4;
          end else begin
            mem_reg_rs2 <= _mem_reg_rs2_T_13;
          end
        end
      end
    end
    if (!(mem_reg_valid & mem_reg_flush_pipe)) begin // @[RocketCore.scala 552:46]
      if (ex_pc_valid) begin // @[RocketCore.scala 554:28]
        mem_br_taken <= alu_io_cmp_out; // @[RocketCore.scala 574:18]
      end
    end
    wb_reg_valid <= ~ctrl_killm; // @[RocketCore.scala 613:19]
    wb_reg_xcpt <= mem_xcpt & _wb_reg_replay_T; // @[RocketCore.scala 615:27]
    wb_reg_replay <= replay_mem & ~take_pc_wb; // @[RocketCore.scala 614:31]
    wb_reg_flush_pipe <= _wb_reg_valid_T & mem_reg_flush_pipe; // @[RocketCore.scala 616:36]
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      if (_T_74) begin // @[Mux.scala 47:70]
        wb_reg_cause <= mem_reg_cause;
      end else begin
        wb_reg_cause <= {{60'd0}, _T_78};
      end
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_reg_sfence <= mem_reg_sfence; // @[RocketCore.scala 619:19]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_reg_pc <= mem_reg_pc; // @[RocketCore.scala 632:15]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_reg_mem_size <= mem_reg_mem_size; // @[RocketCore.scala 628:21]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_reg_hls_or_dv <= mem_reg_hls_or_dv; // @[RocketCore.scala 629:22]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_reg_inst <= mem_reg_inst; // @[RocketCore.scala 626:17]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      wb_reg_raw_inst <= mem_reg_raw_inst; // @[RocketCore.scala 627:21]
    end
    if (mem_pc_valid) begin // @[RocketCore.scala 617:23]
      if (_take_pc_mem_T & mem_ctrl_fp & mem_ctrl_wxd) begin // @[RocketCore.scala 621:10]
        wb_reg_wdata <= io_fpu_toint_data;
      end else begin
        wb_reg_wdata <= mem_int_wdata;
      end
    end
    if (reset) begin // @[RocketCore.scala 285:25]
      id_reg_fence <= 1'h0; // @[RocketCore.scala 285:25]
    end else if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      id_reg_fence <= _GEN_2;
    end else if (~id_mem_busy) begin // @[RocketCore.scala 329:23]
      id_reg_fence <= 1'h0; // @[RocketCore.scala 329:38]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_illegal_insn) begin // @[RocketCore.scala 493:47]
        ex_reg_rs_bypass_0 <= 1'h0; // @[RocketCore.scala 495:27]
      end else begin
        ex_reg_rs_bypass_0 <= do_bypass; // @[RocketCore.scala 486:27]
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      ex_reg_rs_bypass_1 <= do_bypass_1; // @[RocketCore.scala 486:27]
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_illegal_insn) begin // @[RocketCore.scala 493:47]
        ex_reg_rs_lsb_0 <= inst[1:0]; // @[RocketCore.scala 496:24]
      end else if (id_ctrl_decoder_7 & ~do_bypass) begin // @[RocketCore.scala 488:38]
        ex_reg_rs_lsb_0 <= id_rs_0[1:0]; // @[RocketCore.scala 489:26]
      end else if (id_bypass_src_0_0) begin // @[Mux.scala 47:70]
        ex_reg_rs_lsb_0 <= 2'h0;
      end else begin
        ex_reg_rs_lsb_0 <= _bypass_src_T_1;
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_ctrl_decoder_6 & ~do_bypass_1) begin // @[RocketCore.scala 488:38]
        ex_reg_rs_lsb_1 <= id_rs_1[1:0]; // @[RocketCore.scala 489:26]
      end else if (id_bypass_src_1_0) begin // @[Mux.scala 47:70]
        ex_reg_rs_lsb_1 <= 2'h0;
      end else if (id_bypass_src_1_1) begin // @[Mux.scala 47:70]
        ex_reg_rs_lsb_1 <= 2'h1;
      end else begin
        ex_reg_rs_lsb_1 <= _bypass_src_T_2;
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_illegal_insn) begin // @[RocketCore.scala 493:47]
        ex_reg_rs_msb_0 <= {{32'd0}, inst[31:2]}; // @[RocketCore.scala 497:24]
      end else if (id_ctrl_decoder_7 & ~do_bypass) begin // @[RocketCore.scala 488:38]
        ex_reg_rs_msb_0 <= id_rs_0[63:2]; // @[RocketCore.scala 490:26]
      end
    end
    if (_ex_reg_valid_T) begin // @[RocketCore.scala 444:22]
      if (id_ctrl_decoder_6 & ~do_bypass_1) begin // @[RocketCore.scala 488:38]
        ex_reg_rs_msb_1 <= id_rs_1[63:2]; // @[RocketCore.scala 490:26]
      end
    end
    if (reset) begin // @[RocketCore.scala 1050:25]
      _r <= 32'h0; // @[RocketCore.scala 1050:25]
    end else if (_T_159) begin // @[RocketCore.scala 1058:18]
      _r <= _T_158; // @[RocketCore.scala 1058:23]
    end else if (ll_wen) begin // @[RocketCore.scala 1058:18]
      _r <= _T_153; // @[RocketCore.scala 1058:23]
    end
    if (reset) begin // @[RocketCore.scala 1050:25]
      id_stall_fpu__r <= 32'h0; // @[RocketCore.scala 1050:25]
    end else if (_id_stall_fpu_T_17) begin // @[RocketCore.scala 1058:18]
      id_stall_fpu__r <= _id_stall_fpu_T_16; // @[RocketCore.scala 1058:23]
    end else if (_id_stall_fpu_T_12) begin // @[RocketCore.scala 1058:18]
      id_stall_fpu__r <= _id_stall_fpu_T_11; // @[RocketCore.scala 1058:23]
    end else if (_id_stall_fpu_T_2) begin // @[RocketCore.scala 1058:18]
      id_stall_fpu__r <= _id_stall_fpu_T_5; // @[RocketCore.scala 1058:23]
    end
    blocked <= _replay_ex_structural_T & _dcache_blocked_T & (blocked | io_dmem_req_valid | io_dmem_s2_nack); // @[RocketCore.scala 810:83]
    rocc_blocked <= _wb_valid_T_2 & (io_rocc_cmd_valid | rocc_blocked); // @[RocketCore.scala 814:50]
    div_io_kill_REG <= div_io_req_ready & div_io_req_valid; // @[Decoupled.scala 50:35]
    io_imem_progress_REG <= wb_reg_valid & ~replay_wb_common; // @[RocketCore.scala 842:44]
    if (ex_reg_rs_bypass_0) begin // @[RocketCore.scala 391:14]
      if (ex_reg_rs_lsb_0 == 2'h3) begin // @[package.scala 32:76]
        coreMonitorBundle_rd0val_x23 <= io_dmem_resp_bits_data_word_bypass;
      end else if (ex_reg_rs_lsb_0 == 2'h2) begin // @[package.scala 32:76]
        coreMonitorBundle_rd0val_x23 <= wb_reg_wdata;
      end else if (ex_reg_rs_lsb_0 == 2'h1) begin // @[package.scala 32:76]
        coreMonitorBundle_rd0val_x23 <= mem_reg_wdata;
      end else begin
        coreMonitorBundle_rd0val_x23 <= 64'h0;
      end
    end else begin
      coreMonitorBundle_rd0val_x23 <= _ex_rs_T_6;
    end
    coreMonitorBundle_rd0val_REG <= coreMonitorBundle_rd0val_x23; // @[RocketCore.scala 945:34]
    if (ex_reg_rs_bypass_1) begin // @[RocketCore.scala 391:14]
      if (ex_reg_rs_lsb_1 == 2'h3) begin // @[package.scala 32:76]
        coreMonitorBundle_rd1val_x29 <= io_dmem_resp_bits_data_word_bypass;
      end else if (ex_reg_rs_lsb_1 == 2'h2) begin // @[package.scala 32:76]
        coreMonitorBundle_rd1val_x29 <= wb_reg_wdata;
      end else if (ex_reg_rs_lsb_1 == 2'h1) begin // @[package.scala 32:76]
        coreMonitorBundle_rd1val_x29 <= mem_reg_wdata;
      end else begin
        coreMonitorBundle_rd1val_x29 <= 64'h0;
      end
    end else begin
      coreMonitorBundle_rd1val_x29 <= _ex_rs_T_13;
    end
    coreMonitorBundle_rd1val_REG <= coreMonitorBundle_rd1val_x29; // @[RocketCore.scala 947:34]
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~htval_valid_imem) & ~reset) begin
          $fatal; // @[RocketCore.scala 735:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~htval_valid_imem)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at RocketCore.scala:735 assert(!htval_valid_imem || io.imem.gpa.valid)\n"); // @[RocketCore.scala 735:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (csr_io_trace_0_valid & _csr_io_htval_T_3) begin
          $fwrite(32'h80000002,"C%d: %d [%d] pc=[%x] W[r%d=%x][%d] R[r%d=%x] R[r%d=%x] inst=[%x] DASM(%x)\n",io_hartid,
            csr_io_time[31:0],coreMonitorBundle_valid,coreMonitorBundle_pc,_T_161,_T_162,coreMonitorBundle_wrenx,_T_164,
            _T_166,_T_168,_T_170,coreMonitorBundle_inst,coreMonitorBundle_inst); // @[RocketCore.scala 980:13]
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
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {2{`RANDOM}};
  _RAND_2 = {2{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 31; initvar = initvar+1)
    rf[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  id_reg_pause = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  imem_might_request_reg = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ex_ctrl_fp = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  ex_ctrl_rocc = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  ex_ctrl_branch = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  ex_ctrl_jal = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  ex_ctrl_jalr = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  ex_ctrl_rxs2 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  ex_ctrl_rxs1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  ex_ctrl_sel_alu2 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  ex_ctrl_sel_alu1 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  ex_ctrl_sel_imm = _RAND_14[2:0];
  _RAND_15 = {1{`RANDOM}};
  ex_ctrl_alu_dw = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  ex_ctrl_alu_fn = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  ex_ctrl_mem = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  ex_ctrl_mem_cmd = _RAND_18[4:0];
  _RAND_19 = {1{`RANDOM}};
  ex_ctrl_rfs1 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  ex_ctrl_rfs2 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  ex_ctrl_wfd = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ex_ctrl_mul = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  ex_ctrl_div = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  ex_ctrl_wxd = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  ex_ctrl_csr = _RAND_25[2:0];
  _RAND_26 = {1{`RANDOM}};
  ex_ctrl_fence_i = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  mem_ctrl_fp = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  mem_ctrl_rocc = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  mem_ctrl_branch = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  mem_ctrl_jal = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  mem_ctrl_jalr = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  mem_ctrl_rxs2 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  mem_ctrl_rxs1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  mem_ctrl_mem = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  mem_ctrl_rfs1 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  mem_ctrl_rfs2 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  mem_ctrl_wfd = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  mem_ctrl_mul = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  mem_ctrl_div = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  mem_ctrl_wxd = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  mem_ctrl_csr = _RAND_41[2:0];
  _RAND_42 = {1{`RANDOM}};
  mem_ctrl_fence_i = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  wb_ctrl_rocc = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  wb_ctrl_rxs2 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  wb_ctrl_rxs1 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  wb_ctrl_mem = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  wb_ctrl_rfs1 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  wb_ctrl_rfs2 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  wb_ctrl_wfd = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  wb_ctrl_div = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  wb_ctrl_wxd = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  wb_ctrl_csr = _RAND_52[2:0];
  _RAND_53 = {1{`RANDOM}};
  wb_ctrl_fence_i = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  ex_reg_xcpt_interrupt = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  ex_reg_valid = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  ex_reg_rvc = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  ex_reg_btb_resp_entry = _RAND_57[4:0];
  _RAND_58 = {1{`RANDOM}};
  ex_reg_btb_resp_bht_history = _RAND_58[7:0];
  _RAND_59 = {1{`RANDOM}};
  ex_reg_xcpt = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  ex_reg_flush_pipe = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  ex_reg_load_use = _RAND_61[0:0];
  _RAND_62 = {2{`RANDOM}};
  ex_reg_cause = _RAND_62[63:0];
  _RAND_63 = {1{`RANDOM}};
  ex_reg_replay = _RAND_63[0:0];
  _RAND_64 = {2{`RANDOM}};
  ex_reg_pc = _RAND_64[39:0];
  _RAND_65 = {1{`RANDOM}};
  ex_reg_mem_size = _RAND_65[1:0];
  _RAND_66 = {1{`RANDOM}};
  ex_reg_inst = _RAND_66[31:0];
  _RAND_67 = {1{`RANDOM}};
  ex_reg_raw_inst = _RAND_67[31:0];
  _RAND_68 = {1{`RANDOM}};
  mem_reg_xcpt_interrupt = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  mem_reg_valid = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  mem_reg_rvc = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  mem_reg_btb_resp_entry = _RAND_71[4:0];
  _RAND_72 = {1{`RANDOM}};
  mem_reg_btb_resp_bht_history = _RAND_72[7:0];
  _RAND_73 = {1{`RANDOM}};
  mem_reg_xcpt = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  mem_reg_replay = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  mem_reg_flush_pipe = _RAND_75[0:0];
  _RAND_76 = {2{`RANDOM}};
  mem_reg_cause = _RAND_76[63:0];
  _RAND_77 = {1{`RANDOM}};
  mem_reg_slow_bypass = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  mem_reg_load = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  mem_reg_store = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  mem_reg_sfence = _RAND_80[0:0];
  _RAND_81 = {2{`RANDOM}};
  mem_reg_pc = _RAND_81[39:0];
  _RAND_82 = {1{`RANDOM}};
  mem_reg_inst = _RAND_82[31:0];
  _RAND_83 = {1{`RANDOM}};
  mem_reg_mem_size = _RAND_83[1:0];
  _RAND_84 = {1{`RANDOM}};
  mem_reg_hls_or_dv = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  mem_reg_raw_inst = _RAND_85[31:0];
  _RAND_86 = {2{`RANDOM}};
  mem_reg_wdata = _RAND_86[63:0];
  _RAND_87 = {2{`RANDOM}};
  mem_reg_rs2 = _RAND_87[63:0];
  _RAND_88 = {1{`RANDOM}};
  mem_br_taken = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  wb_reg_valid = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  wb_reg_xcpt = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  wb_reg_replay = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  wb_reg_flush_pipe = _RAND_92[0:0];
  _RAND_93 = {2{`RANDOM}};
  wb_reg_cause = _RAND_93[63:0];
  _RAND_94 = {1{`RANDOM}};
  wb_reg_sfence = _RAND_94[0:0];
  _RAND_95 = {2{`RANDOM}};
  wb_reg_pc = _RAND_95[39:0];
  _RAND_96 = {1{`RANDOM}};
  wb_reg_mem_size = _RAND_96[1:0];
  _RAND_97 = {1{`RANDOM}};
  wb_reg_hls_or_dv = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  wb_reg_inst = _RAND_98[31:0];
  _RAND_99 = {1{`RANDOM}};
  wb_reg_raw_inst = _RAND_99[31:0];
  _RAND_100 = {2{`RANDOM}};
  wb_reg_wdata = _RAND_100[63:0];
  _RAND_101 = {1{`RANDOM}};
  id_reg_fence = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  ex_reg_rs_bypass_0 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  ex_reg_rs_bypass_1 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  ex_reg_rs_lsb_0 = _RAND_104[1:0];
  _RAND_105 = {1{`RANDOM}};
  ex_reg_rs_lsb_1 = _RAND_105[1:0];
  _RAND_106 = {2{`RANDOM}};
  ex_reg_rs_msb_0 = _RAND_106[61:0];
  _RAND_107 = {2{`RANDOM}};
  ex_reg_rs_msb_1 = _RAND_107[61:0];
  _RAND_108 = {1{`RANDOM}};
  _r = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  id_stall_fpu__r = _RAND_109[31:0];
  _RAND_110 = {1{`RANDOM}};
  blocked = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  rocc_blocked = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  div_io_kill_REG = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  io_imem_progress_REG = _RAND_113[0:0];
  _RAND_114 = {2{`RANDOM}};
  coreMonitorBundle_rd0val_x23 = _RAND_114[63:0];
  _RAND_115 = {2{`RANDOM}};
  coreMonitorBundle_rd0val_REG = _RAND_115[63:0];
  _RAND_116 = {2{`RANDOM}};
  coreMonitorBundle_rd1val_x29 = _RAND_116[63:0];
  _RAND_117 = {2{`RANDOM}};
  coreMonitorBundle_rd1val_REG = _RAND_117[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
