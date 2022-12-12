module DCache(
  input         clock,
  input         reset,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output        auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [1:0]  auto_out_b_bits_param,
  input  [3:0]  auto_out_b_bits_size,
  input         auto_out_b_bits_source,
  input  [31:0] auto_out_b_bits_address,
  input         auto_out_c_ready,
  output        auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
  output [2:0]  auto_out_c_bits_param,
  output [3:0]  auto_out_c_bits_size,
  output        auto_out_c_bits_source,
  output [31:0] auto_out_c_bits_address,
  output [63:0] auto_out_c_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input         auto_out_d_bits_source,
  input  [1:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_e_ready,
  output        auto_out_e_valid,
  output [1:0]  auto_out_e_bits_sink,
  output        io_cpu_req_ready,
  input         io_cpu_req_valid,
  input  [39:0] io_cpu_req_bits_addr,
  input  [6:0]  io_cpu_req_bits_tag,
  input  [4:0]  io_cpu_req_bits_cmd,
  input  [1:0]  io_cpu_req_bits_size,
  input         io_cpu_req_bits_signed,
  input  [1:0]  io_cpu_req_bits_dprv,
  input         io_cpu_req_bits_phys,
  input         io_cpu_s1_kill,
  input  [63:0] io_cpu_s1_data_data,
  input  [7:0]  io_cpu_s1_data_mask,
  output        io_cpu_s2_nack,
  output        io_cpu_resp_valid,
  output [39:0] io_cpu_resp_bits_addr,
  output [6:0]  io_cpu_resp_bits_tag,
  output [4:0]  io_cpu_resp_bits_cmd,
  output [1:0]  io_cpu_resp_bits_size,
  output        io_cpu_resp_bits_signed,
  output [1:0]  io_cpu_resp_bits_dprv,
  output        io_cpu_resp_bits_dv,
  output [63:0] io_cpu_resp_bits_data,
  output [7:0]  io_cpu_resp_bits_mask,
  output        io_cpu_resp_bits_replay,
  output        io_cpu_resp_bits_has_data,
  output [63:0] io_cpu_resp_bits_data_word_bypass,
  output [63:0] io_cpu_resp_bits_data_raw,
  output [63:0] io_cpu_resp_bits_store_data,
  output        io_cpu_replay_next,
  output        io_cpu_s2_xcpt_ma_ld,
  output        io_cpu_s2_xcpt_ma_st,
  output        io_cpu_s2_xcpt_pf_ld,
  output        io_cpu_s2_xcpt_pf_st,
  output        io_cpu_s2_xcpt_gf_ld,
  output        io_cpu_s2_xcpt_gf_st,
  output        io_cpu_s2_xcpt_ae_ld,
  output        io_cpu_s2_xcpt_ae_st,
  output        io_cpu_ordered,
  output        io_cpu_perf_release,
  output        io_cpu_perf_grant,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
  output [26:0] io_ptw_req_bits_bits_addr,
  output        io_ptw_req_bits_bits_need_gpa,
  input         io_ptw_resp_valid,
  input         io_ptw_resp_bits_ae_ptw,
  input         io_ptw_resp_bits_ae_final,
  input         io_ptw_resp_bits_pf,
  input  [43:0] io_ptw_resp_bits_pte_ppn,
  input         io_ptw_resp_bits_pte_d,
  input         io_ptw_resp_bits_pte_a,
  input         io_ptw_resp_bits_pte_g,
  input         io_ptw_resp_bits_pte_u,
  input         io_ptw_resp_bits_pte_x,
  input         io_ptw_resp_bits_pte_w,
  input         io_ptw_resp_bits_pte_r,
  input         io_ptw_resp_bits_pte_v,
  input  [1:0]  io_ptw_resp_bits_level,
  input         io_ptw_resp_bits_homogeneous,
  input  [3:0]  io_ptw_ptbr_mode,
  input         io_ptw_status_debug,
  input         io_ptw_status_mxr,
  input         io_ptw_status_sum,
  input         io_ptw_pmp_0_cfg_l,
  input  [1:0]  io_ptw_pmp_0_cfg_a,
  input         io_ptw_pmp_0_cfg_x,
  input         io_ptw_pmp_0_cfg_w,
  input         io_ptw_pmp_0_cfg_r,
  input  [29:0] io_ptw_pmp_0_addr,
  input  [31:0] io_ptw_pmp_0_mask,
  input         io_ptw_pmp_1_cfg_l,
  input  [1:0]  io_ptw_pmp_1_cfg_a,
  input         io_ptw_pmp_1_cfg_x,
  input         io_ptw_pmp_1_cfg_w,
  input         io_ptw_pmp_1_cfg_r,
  input  [29:0] io_ptw_pmp_1_addr,
  input  [31:0] io_ptw_pmp_1_mask,
  input         io_ptw_pmp_2_cfg_l,
  input  [1:0]  io_ptw_pmp_2_cfg_a,
  input         io_ptw_pmp_2_cfg_x,
  input         io_ptw_pmp_2_cfg_w,
  input         io_ptw_pmp_2_cfg_r,
  input  [29:0] io_ptw_pmp_2_addr,
  input  [31:0] io_ptw_pmp_2_mask,
  input         io_ptw_pmp_3_cfg_l,
  input  [1:0]  io_ptw_pmp_3_cfg_a,
  input         io_ptw_pmp_3_cfg_x,
  input         io_ptw_pmp_3_cfg_w,
  input         io_ptw_pmp_3_cfg_r,
  input  [29:0] io_ptw_pmp_3_addr,
  input  [31:0] io_ptw_pmp_3_mask,
  input         io_ptw_pmp_4_cfg_l,
  input  [1:0]  io_ptw_pmp_4_cfg_a,
  input         io_ptw_pmp_4_cfg_x,
  input         io_ptw_pmp_4_cfg_w,
  input         io_ptw_pmp_4_cfg_r,
  input  [29:0] io_ptw_pmp_4_addr,
  input  [31:0] io_ptw_pmp_4_mask,
  input         io_ptw_pmp_5_cfg_l,
  input  [1:0]  io_ptw_pmp_5_cfg_a,
  input         io_ptw_pmp_5_cfg_x,
  input         io_ptw_pmp_5_cfg_w,
  input         io_ptw_pmp_5_cfg_r,
  input  [29:0] io_ptw_pmp_5_addr,
  input  [31:0] io_ptw_pmp_5_mask,
  input         io_ptw_pmp_6_cfg_l,
  input  [1:0]  io_ptw_pmp_6_cfg_a,
  input         io_ptw_pmp_6_cfg_x,
  input         io_ptw_pmp_6_cfg_w,
  input         io_ptw_pmp_6_cfg_r,
  input  [29:0] io_ptw_pmp_6_addr,
  input  [31:0] io_ptw_pmp_6_mask,
  input         io_ptw_pmp_7_cfg_l,
  input  [1:0]  io_ptw_pmp_7_cfg_a,
  input         io_ptw_pmp_7_cfg_x,
  input         io_ptw_pmp_7_cfg_w,
  input         io_ptw_pmp_7_cfg_r,
  input  [29:0] io_ptw_pmp_7_addr,
  input  [31:0] io_ptw_pmp_7_mask
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [63:0] _RAND_20;
  reg [63:0] _RAND_21;
  reg [63:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [63:0] _RAND_28;
  reg [63:0] _RAND_29;
  reg [63:0] _RAND_30;
  reg [63:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [63:0] _RAND_37;
  reg [63:0] _RAND_38;
  reg [63:0] _RAND_39;
  reg [63:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [63:0] _RAND_46;
  reg [63:0] _RAND_47;
  reg [63:0] _RAND_48;
  reg [63:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [63:0] _RAND_55;
  reg [63:0] _RAND_56;
  reg [63:0] _RAND_57;
  reg [63:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [63:0] _RAND_64;
  reg [63:0] _RAND_65;
  reg [63:0] _RAND_66;
  reg [63:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [63:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [63:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [63:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [63:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [63:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [63:0] _RAND_121;
  reg [63:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [63:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [63:0] _RAND_133;
  reg [31:0] _RAND_134;
  reg [31:0] _RAND_135;
  reg [31:0] _RAND_136;
  reg [31:0] _RAND_137;
  reg [31:0] _RAND_138;
  reg [31:0] _RAND_139;
  reg [31:0] _RAND_140;
  reg [31:0] _RAND_141;
  reg [31:0] _RAND_142;
  reg [63:0] _RAND_143;
  reg [31:0] _RAND_144;
  reg [31:0] _RAND_145;
  reg [31:0] _RAND_146;
  reg [31:0] _RAND_147;
  reg [31:0] _RAND_148;
  reg [31:0] _RAND_149;
  reg [31:0] _RAND_150;
  reg [63:0] _RAND_151;
  reg [31:0] _RAND_152;
  reg [31:0] _RAND_153;
  reg [31:0] _RAND_154;
  reg [31:0] _RAND_155;
  reg [31:0] _RAND_156;
  reg [31:0] _RAND_157;
  reg [31:0] _RAND_158;
  reg [31:0] _RAND_159;
  reg [31:0] _RAND_160;
  reg [31:0] _RAND_161;
  reg [31:0] _RAND_162;
  reg [63:0] _RAND_163;
  reg [63:0] _RAND_164;
  reg [31:0] _RAND_165;
  reg [31:0] _RAND_166;
  reg [31:0] _RAND_167;
  reg [31:0] _RAND_168;
  reg [31:0] _RAND_169;
  reg [31:0] _RAND_170;
  reg [63:0] _RAND_171;
  reg [63:0] _RAND_172;
  reg [31:0] _RAND_173;
  reg [63:0] _RAND_174;
  reg [31:0] _RAND_175;
  reg [31:0] _RAND_176;
  reg [31:0] _RAND_177;
  reg [31:0] _RAND_178;
  reg [31:0] _RAND_179;
  reg [31:0] _RAND_180;
  reg [31:0] _RAND_181;
  reg [31:0] _RAND_182;
  reg [31:0] _RAND_183;
  reg [31:0] _RAND_184;
  reg [31:0] _RAND_185;
  reg [31:0] _RAND_186;
  reg [31:0] _RAND_187;
  reg [31:0] _RAND_188;
  reg [31:0] _RAND_189;
  reg [31:0] _RAND_190;
  reg [31:0] _RAND_191;
`endif // RANDOMIZE_REG_INIT
  wire  tlb_clock;
  wire  tlb_reset;
  wire  tlb_io_req_ready;
  wire  tlb_io_req_valid;
  wire [39:0] tlb_io_req_bits_vaddr;
  wire  tlb_io_req_bits_passthrough;
  wire [1:0] tlb_io_req_bits_size;
  wire [4:0] tlb_io_req_bits_cmd;
  wire [1:0] tlb_io_req_bits_prv;
  wire  tlb_io_resp_miss;
  wire [31:0] tlb_io_resp_paddr;
  wire  tlb_io_resp_pf_ld;
  wire  tlb_io_resp_pf_st;
  wire  tlb_io_resp_ae_ld;
  wire  tlb_io_resp_ae_st;
  wire  tlb_io_resp_ma_ld;
  wire  tlb_io_resp_ma_st;
  wire  tlb_io_resp_cacheable;
  wire  tlb_io_sfence_valid;
  wire  tlb_io_sfence_bits_rs1;
  wire  tlb_io_sfence_bits_rs2;
  wire [38:0] tlb_io_sfence_bits_addr;
  wire  tlb_io_ptw_req_ready;
  wire  tlb_io_ptw_req_valid;
  wire [26:0] tlb_io_ptw_req_bits_bits_addr;
  wire  tlb_io_ptw_req_bits_bits_need_gpa;
  wire  tlb_io_ptw_resp_valid;
  wire  tlb_io_ptw_resp_bits_ae_ptw;
  wire  tlb_io_ptw_resp_bits_ae_final;
  wire  tlb_io_ptw_resp_bits_pf;
  wire [43:0] tlb_io_ptw_resp_bits_pte_ppn;
  wire  tlb_io_ptw_resp_bits_pte_d;
  wire  tlb_io_ptw_resp_bits_pte_a;
  wire  tlb_io_ptw_resp_bits_pte_g;
  wire  tlb_io_ptw_resp_bits_pte_u;
  wire  tlb_io_ptw_resp_bits_pte_x;
  wire  tlb_io_ptw_resp_bits_pte_w;
  wire  tlb_io_ptw_resp_bits_pte_r;
  wire  tlb_io_ptw_resp_bits_pte_v;
  wire [1:0] tlb_io_ptw_resp_bits_level;
  wire  tlb_io_ptw_resp_bits_homogeneous;
  wire [3:0] tlb_io_ptw_ptbr_mode;
  wire  tlb_io_ptw_status_debug;
  wire  tlb_io_ptw_status_mxr;
  wire  tlb_io_ptw_status_sum;
  wire  tlb_io_ptw_pmp_0_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a;
  wire  tlb_io_ptw_pmp_0_cfg_x;
  wire  tlb_io_ptw_pmp_0_cfg_w;
  wire  tlb_io_ptw_pmp_0_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_0_addr;
  wire [31:0] tlb_io_ptw_pmp_0_mask;
  wire  tlb_io_ptw_pmp_1_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a;
  wire  tlb_io_ptw_pmp_1_cfg_x;
  wire  tlb_io_ptw_pmp_1_cfg_w;
  wire  tlb_io_ptw_pmp_1_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_1_addr;
  wire [31:0] tlb_io_ptw_pmp_1_mask;
  wire  tlb_io_ptw_pmp_2_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a;
  wire  tlb_io_ptw_pmp_2_cfg_x;
  wire  tlb_io_ptw_pmp_2_cfg_w;
  wire  tlb_io_ptw_pmp_2_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_2_addr;
  wire [31:0] tlb_io_ptw_pmp_2_mask;
  wire  tlb_io_ptw_pmp_3_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a;
  wire  tlb_io_ptw_pmp_3_cfg_x;
  wire  tlb_io_ptw_pmp_3_cfg_w;
  wire  tlb_io_ptw_pmp_3_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_3_addr;
  wire [31:0] tlb_io_ptw_pmp_3_mask;
  wire  tlb_io_ptw_pmp_4_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a;
  wire  tlb_io_ptw_pmp_4_cfg_x;
  wire  tlb_io_ptw_pmp_4_cfg_w;
  wire  tlb_io_ptw_pmp_4_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_4_addr;
  wire [31:0] tlb_io_ptw_pmp_4_mask;
  wire  tlb_io_ptw_pmp_5_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a;
  wire  tlb_io_ptw_pmp_5_cfg_x;
  wire  tlb_io_ptw_pmp_5_cfg_w;
  wire  tlb_io_ptw_pmp_5_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_5_addr;
  wire [31:0] tlb_io_ptw_pmp_5_mask;
  wire  tlb_io_ptw_pmp_6_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a;
  wire  tlb_io_ptw_pmp_6_cfg_x;
  wire  tlb_io_ptw_pmp_6_cfg_w;
  wire  tlb_io_ptw_pmp_6_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_6_addr;
  wire [31:0] tlb_io_ptw_pmp_6_mask;
  wire  tlb_io_ptw_pmp_7_cfg_l;
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a;
  wire  tlb_io_ptw_pmp_7_cfg_x;
  wire  tlb_io_ptw_pmp_7_cfg_w;
  wire  tlb_io_ptw_pmp_7_cfg_r;
  wire [29:0] tlb_io_ptw_pmp_7_addr;
  wire [31:0] tlb_io_ptw_pmp_7_mask;
  wire [19:0] tlb_mpu_ppn_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_u; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_pf; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_gf; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_sw; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_sx; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_sr; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_pw; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_px; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_pr; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_pal; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_paa; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_eff; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_mpu_ppn_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_u; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_pf; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_gf; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_sw; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_sx; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_sr; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_pw; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_px; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_pr; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_pal; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_paa; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_eff; // @[package.scala 258:25]
  wire  tlb_mpu_ppn_barrier_io_y_c; // @[package.scala 258:25]
  wire [1:0] tlb_pmp_io_prv; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_0_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_0_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_0_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_0_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_0_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_0_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_0_mask; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_1_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_1_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_1_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_1_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_1_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_1_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_1_mask; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_2_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_2_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_2_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_2_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_2_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_2_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_2_mask; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_3_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_3_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_3_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_3_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_3_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_3_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_3_mask; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_4_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_4_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_4_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_4_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_4_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_4_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_4_mask; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_5_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_5_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_5_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_5_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_5_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_5_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_5_mask; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_6_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_6_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_6_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_6_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_6_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_6_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_6_mask; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_7_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_pmp_7_cfg_a; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_7_cfg_x; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_7_cfg_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_pmp_7_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] tlb_pmp_io_pmp_7_addr; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_pmp_7_mask; // @[TLB.scala 234:19]
  wire [31:0] tlb_pmp_io_addr; // @[TLB.scala 234:19]
  wire [1:0] tlb_pmp_io_size; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_r; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_w; // @[TLB.scala 234:19]
  wire  tlb_pmp_io_x; // @[TLB.scala 234:19]
  wire [19:0] tlb_entries_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_1_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_1_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_1_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_2_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_2_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_2_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_3_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_3_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_3_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_4_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_4_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_4_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_5_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_5_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_5_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_6_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_6_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_6_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_7_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_7_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_7_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_8_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_8_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_8_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_9_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_9_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_9_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_10_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_10_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_10_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_11_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_11_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_11_io_y_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_12_io_x_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_x_c; // @[package.scala 258:25]
  wire [19:0] tlb_entries_barrier_12_io_y_ppn; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_u; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_ae_ptw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_ae_final; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_pf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_gf; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_sw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_sx; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_sr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_pw; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_px; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_pr; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_ppp; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_pal; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_paa; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_eff; // @[package.scala 258:25]
  wire  tlb_entries_barrier_12_io_y_c; // @[package.scala 258:25]
  wire [26:0] tlb_vpn = tlb_io_req_bits_vaddr[38:12]; // @[TLB.scala 188:30]
  reg [26:0] tlb_sectored_entries_0_0_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_0_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_0_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_0_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_0_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_0_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_0_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_0_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_0_valid_3; // @[TLB.scala 190:29]
  reg [26:0] tlb_sectored_entries_0_1_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_1_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_1_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_1_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_1_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_1_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_1_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_1_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_1_valid_3; // @[TLB.scala 190:29]
  reg [26:0] tlb_sectored_entries_0_2_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_2_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_2_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_2_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_2_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_2_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_2_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_2_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_2_valid_3; // @[TLB.scala 190:29]
  reg [26:0] tlb_sectored_entries_0_3_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_3_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_3_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_3_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_3_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_3_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_3_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_3_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_3_valid_3; // @[TLB.scala 190:29]
  reg [26:0] tlb_sectored_entries_0_4_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_4_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_4_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_4_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_4_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_4_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_4_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_4_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_4_valid_3; // @[TLB.scala 190:29]
  reg [26:0] tlb_sectored_entries_0_5_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_5_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_5_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_5_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_5_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_5_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_5_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_5_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_5_valid_3; // @[TLB.scala 190:29]
  reg [26:0] tlb_sectored_entries_0_6_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_6_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_6_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_6_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_6_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_6_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_6_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_6_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_6_valid_3; // @[TLB.scala 190:29]
  reg [26:0] tlb_sectored_entries_0_7_tag_vpn; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_7_data_0; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_7_data_1; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_7_data_2; // @[TLB.scala 190:29]
  reg [40:0] tlb_sectored_entries_0_7_data_3; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_7_valid_0; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_7_valid_1; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_7_valid_2; // @[TLB.scala 190:29]
  reg  tlb_sectored_entries_0_7_valid_3; // @[TLB.scala 190:29]
  reg [1:0] tlb_superpage_entries_0_level; // @[TLB.scala 191:30]
  reg [26:0] tlb_superpage_entries_0_tag_vpn; // @[TLB.scala 191:30]
  reg [40:0] tlb_superpage_entries_0_data_0; // @[TLB.scala 191:30]
  reg  tlb_superpage_entries_0_valid_0; // @[TLB.scala 191:30]
  reg [1:0] tlb_superpage_entries_1_level; // @[TLB.scala 191:30]
  reg [26:0] tlb_superpage_entries_1_tag_vpn; // @[TLB.scala 191:30]
  reg [40:0] tlb_superpage_entries_1_data_0; // @[TLB.scala 191:30]
  reg  tlb_superpage_entries_1_valid_0; // @[TLB.scala 191:30]
  reg [1:0] tlb_superpage_entries_2_level; // @[TLB.scala 191:30]
  reg [26:0] tlb_superpage_entries_2_tag_vpn; // @[TLB.scala 191:30]
  reg [40:0] tlb_superpage_entries_2_data_0; // @[TLB.scala 191:30]
  reg  tlb_superpage_entries_2_valid_0; // @[TLB.scala 191:30]
  reg [1:0] tlb_superpage_entries_3_level; // @[TLB.scala 191:30]
  reg [26:0] tlb_superpage_entries_3_tag_vpn; // @[TLB.scala 191:30]
  reg [40:0] tlb_superpage_entries_3_data_0; // @[TLB.scala 191:30]
  reg  tlb_superpage_entries_3_valid_0; // @[TLB.scala 191:30]
  reg [1:0] tlb_special_entry_level; // @[TLB.scala 192:56]
  reg [26:0] tlb_special_entry_tag_vpn; // @[TLB.scala 192:56]
  reg [40:0] tlb_special_entry_data_0; // @[TLB.scala 192:56]
  reg  tlb_special_entry_valid_0; // @[TLB.scala 192:56]
  reg [1:0] tlb_state; // @[TLB.scala 198:18]
  reg [26:0] tlb_r_refill_tag; // @[TLB.scala 199:25]
  reg [1:0] tlb_r_superpage_repl_addr; // @[TLB.scala 200:34]
  reg [2:0] tlb_r_sectored_repl_addr; // @[TLB.scala 201:33]
  reg  tlb_r_sectored_hit_valid; // @[TLB.scala 202:27]
  reg [2:0] tlb_r_sectored_hit_bits; // @[TLB.scala 202:27]
  reg  tlb_r_need_gpa; // @[TLB.scala 206:23]
  wire  tlb_priv_s = tlb_io_req_bits_prv[0]; // @[TLB.scala 214:20]
  wire  tlb_priv_uses_vm = tlb_io_req_bits_prv <= 2'h1; // @[TLB.scala 215:27]
  wire  tlb__stage1_en_T = tlb_io_ptw_ptbr_mode[3]; // @[TLB.scala 217:45]
  wire  tlb__vm_enabled_T_1 = tlb__stage1_en_T & tlb_priv_uses_vm; // @[TLB.scala 220:45]
  wire  tlb__vm_enabled_T_2 = ~tlb_io_req_bits_passthrough; // @[TLB.scala 220:64]
  wire  tlb_vm_enabled = tlb__vm_enabled_T_1 & tlb__vm_enabled_T_2; // @[TLB.scala 220:61]
  wire [19:0] tlb_refill_ppn = tlb_io_ptw_resp_bits_pte_ppn[19:0]; // @[TLB.scala 227:44]
  wire  tlb__invalidate_refill_T = tlb_state == 2'h1; // @[package.scala 15:47]
  wire  tlb__invalidate_refill_T_1 = tlb_state == 2'h3; // @[package.scala 15:47]
  wire  tlb__invalidate_refill_T_2 = tlb__invalidate_refill_T | tlb__invalidate_refill_T_1; // @[package.scala 72:59]
  wire  tlb_invalidate_refill = tlb__invalidate_refill_T_2 | tlb_io_sfence_valid; // @[TLB.scala 229:88]
  wire  tlb__mpu_ppn_T_20 = tlb_special_entry_data_0[19]; // @[TLB.scala 102:77]
  wire [1:0] tlb_mpu_ppn_res = tlb_mpu_ppn_barrier_io_y_ppn[19:18]; // @[TLB.scala 123:26]
  wire  tlb__mpu_ppn_ignore_T = tlb_special_entry_level < 2'h1; // @[TLB.scala 125:28]
  wire [26:0] tlb__mpu_ppn_T_23 = tlb__mpu_ppn_ignore_T ? tlb_vpn : 27'h0; // @[TLB.scala 126:28]
  wire [26:0] _GEN_383 = {{7'd0}, tlb_mpu_ppn_barrier_io_y_ppn}; // @[TLB.scala 126:47]
  wire [26:0] tlb__mpu_ppn_T_24 = tlb__mpu_ppn_T_23 | _GEN_383; // @[TLB.scala 126:47]
  wire [8:0] tlb__mpu_ppn_T_25 = tlb__mpu_ppn_T_24[17:9]; // @[TLB.scala 126:58]
  wire  tlb__mpu_ppn_ignore_T_1 = tlb_special_entry_level < 2'h2; // @[TLB.scala 125:28]
  wire [26:0] tlb__mpu_ppn_T_27 = tlb__mpu_ppn_ignore_T_1 ? tlb_vpn : 27'h0; // @[TLB.scala 126:28]
  wire [26:0] tlb__mpu_ppn_T_28 = tlb__mpu_ppn_T_27 | _GEN_383; // @[TLB.scala 126:47]
  wire [8:0] tlb__mpu_ppn_T_29 = tlb__mpu_ppn_T_28[8:0]; // @[TLB.scala 126:58]
  wire [19:0] tlb__mpu_ppn_T_30 = {tlb_mpu_ppn_res,tlb__mpu_ppn_T_25,tlb__mpu_ppn_T_29}; // @[Cat.scala 31:58]
  wire [27:0] tlb__mpu_ppn_T_31 = tlb_io_req_bits_vaddr[39:12]; // @[TLB.scala 231:144]
  wire [27:0] tlb__mpu_ppn_T_32 = tlb_vm_enabled ? {{8'd0}, tlb__mpu_ppn_T_30} : tlb__mpu_ppn_T_31; // @[TLB.scala 231:20]
  wire [27:0] tlb_mpu_ppn = tlb_io_ptw_resp_valid ? {{8'd0}, tlb_refill_ppn} : tlb__mpu_ppn_T_32; // @[TLB.scala 230:20]
  wire [11:0] tlb__mpu_physaddr_T = tlb_io_req_bits_vaddr[11:0]; // @[TLB.scala 232:52]
  wire [39:0] tlb_mpu_physaddr = {tlb_mpu_ppn,tlb__mpu_physaddr_T}; // @[Cat.scala 31:58]
  wire  tlb__mpu_priv_T = tlb_io_ptw_resp_valid | tlb_io_req_bits_passthrough; // @[TLB.scala 233:56]
  wire [2:0] tlb__mpu_priv_T_2 = {tlb_io_ptw_status_debug,tlb_io_req_bits_prv}; // @[Cat.scala 31:58]
  wire [2:0] tlb_mpu_priv = tlb__mpu_priv_T ? 3'h1 : tlb__mpu_priv_T_2; // @[TLB.scala 233:27]
  wire [39:0] tlb__legal_address_T = tlb_mpu_physaddr ^ 40'h3000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__legal_address_T_1 = {1'b0,$signed(tlb__legal_address_T)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__legal_address_T_3 = $signed(tlb__legal_address_T_1) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  tlb__legal_address_T_4 = $signed(tlb__legal_address_T_3) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] tlb__legal_address_T_5 = tlb_mpu_physaddr ^ 40'hc000000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__legal_address_T_6 = {1'b0,$signed(tlb__legal_address_T_5)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__legal_address_T_8 = $signed(tlb__legal_address_T_6) & -41'sh4000000; // @[Parameters.scala 137:52]
  wire  tlb__legal_address_T_9 = $signed(tlb__legal_address_T_8) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] tlb__legal_address_T_10 = tlb_mpu_physaddr ^ 40'h2000000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__legal_address_T_11 = {1'b0,$signed(tlb__legal_address_T_10)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__legal_address_T_13 = $signed(tlb__legal_address_T_11) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  tlb__legal_address_T_14 = $signed(tlb__legal_address_T_13) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] tlb__legal_address_T_16 = {1'b0,$signed(tlb_mpu_physaddr)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__legal_address_T_18 = $signed(tlb__legal_address_T_16) & -41'sh1000; // @[Parameters.scala 137:52]
  wire  tlb__legal_address_T_19 = $signed(tlb__legal_address_T_18) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] tlb__legal_address_T_20 = tlb_mpu_physaddr ^ 40'h10000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__legal_address_T_21 = {1'b0,$signed(tlb__legal_address_T_20)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__legal_address_T_23 = $signed(tlb__legal_address_T_21) & -41'sh10000; // @[Parameters.scala 137:52]
  wire  tlb__legal_address_T_24 = $signed(tlb__legal_address_T_23) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] tlb__legal_address_T_25 = tlb_mpu_physaddr ^ 40'h80000000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__legal_address_T_26 = {1'b0,$signed(tlb__legal_address_T_25)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__legal_address_T_28 = $signed(tlb__legal_address_T_26) & -41'sh40000000; // @[Parameters.scala 137:52]
  wire  tlb__legal_address_T_29 = $signed(tlb__legal_address_T_28) == 41'sh0; // @[Parameters.scala 137:67]
  wire [39:0] tlb__legal_address_T_30 = tlb_mpu_physaddr ^ 40'h60000000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__legal_address_T_31 = {1'b0,$signed(tlb__legal_address_T_30)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__legal_address_T_33 = $signed(tlb__legal_address_T_31) & -41'sh20000000; // @[Parameters.scala 137:52]
  wire  tlb__legal_address_T_34 = $signed(tlb__legal_address_T_33) == 41'sh0; // @[Parameters.scala 137:67]
  wire  tlb__legal_address_T_35 = tlb__legal_address_T_4 | tlb__legal_address_T_9; // @[TLB.scala 239:67]
  wire  tlb__legal_address_T_36 = tlb__legal_address_T_35 | tlb__legal_address_T_14; // @[TLB.scala 239:67]
  wire  tlb__legal_address_T_37 = tlb__legal_address_T_36 | tlb__legal_address_T_19; // @[TLB.scala 239:67]
  wire  tlb__legal_address_T_38 = tlb__legal_address_T_37 | tlb__legal_address_T_24; // @[TLB.scala 239:67]
  wire  tlb__legal_address_T_39 = tlb__legal_address_T_38 | tlb__legal_address_T_29; // @[TLB.scala 239:67]
  wire  tlb_legal_address = tlb__legal_address_T_39 | tlb__legal_address_T_34; // @[TLB.scala 239:67]
  wire [40:0] tlb__cacheable_T_8 = $signed(tlb__legal_address_T_26) & 41'sh80000000; // @[Parameters.scala 137:52]
  wire  tlb__cacheable_T_9 = $signed(tlb__cacheable_T_8) == 41'sh0; // @[Parameters.scala 137:67]
  wire  tlb__cacheable_T_13 = tlb_legal_address & tlb__cacheable_T_9; // @[TLB.scala 241:19]
  wire [39:0] tlb__homogeneous_T_54 = tlb_mpu_physaddr ^ 40'h8000000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__homogeneous_T_55 = {1'b0,$signed(tlb__homogeneous_T_54)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__homogeneous_T_57 = $signed(tlb__homogeneous_T_55) & 41'shc8000000; // @[Parameters.scala 137:52]
  wire  tlb__homogeneous_T_58 = $signed(tlb__homogeneous_T_57) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] tlb__homogeneous_T_71 = $signed(tlb__legal_address_T_16) & 41'shc8010000; // @[Parameters.scala 137:52]
  wire  tlb__homogeneous_T_72 = $signed(tlb__homogeneous_T_71) == 41'sh0; // @[Parameters.scala 137:67]
  wire  tlb__homogeneous_T_79 = tlb__homogeneous_T_72 | tlb__homogeneous_T_58; // @[TLBPermissions.scala 83:66]
  wire  tlb__deny_access_to_debug_T = tlb_mpu_priv <= 3'h3; // @[TLB.scala 244:39]
  wire  tlb_deny_access_to_debug = tlb__deny_access_to_debug_T & tlb__legal_address_T_19; // @[TLB.scala 244:48]
  wire  tlb__prot_r_T_6 = ~tlb_deny_access_to_debug; // @[TLB.scala 245:44]
  wire  tlb__prot_r_T_7 = tlb_legal_address & tlb__prot_r_T_6; // @[TLB.scala 245:41]
  wire  tlb_prot_r = tlb__prot_r_T_7 & tlb_pmp_io_r; // @[TLB.scala 245:66]
  wire [39:0] tlb__prot_w_T_10 = tlb_mpu_physaddr ^ 40'h40000000; // @[Parameters.scala 137:31]
  wire [40:0] tlb__prot_w_T_11 = {1'b0,$signed(tlb__prot_w_T_10)}; // @[Parameters.scala 137:49]
  wire [40:0] tlb__prot_w_T_13 = $signed(tlb__prot_w_T_11) & 41'shc0000000; // @[Parameters.scala 137:52]
  wire  tlb__prot_w_T_14 = $signed(tlb__prot_w_T_13) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] tlb__prot_w_T_18 = $signed(tlb__legal_address_T_26) & 41'shc0000000; // @[Parameters.scala 137:52]
  wire  tlb__prot_w_T_19 = $signed(tlb__prot_w_T_18) == 41'sh0; // @[Parameters.scala 137:67]
  wire  tlb__prot_w_T_21 = tlb__homogeneous_T_79 | tlb__prot_w_T_14; // @[Parameters.scala 615:89]
  wire  tlb__prot_w_T_22 = tlb__prot_w_T_21 | tlb__prot_w_T_19; // @[Parameters.scala 615:89]
  wire  tlb__prot_w_T_31 = tlb_legal_address & tlb__prot_w_T_22; // @[TLB.scala 241:19]
  wire  tlb__prot_w_T_33 = tlb__prot_w_T_31 & tlb__prot_r_T_6; // @[TLB.scala 246:45]
  wire  tlb_prot_w = tlb__prot_w_T_33 & tlb_pmp_io_w; // @[TLB.scala 246:70]
  wire  tlb_prot_al = tlb_legal_address & tlb__homogeneous_T_79; // @[TLB.scala 241:19]
  wire [40:0] tlb__prot_x_T_3 = $signed(tlb__legal_address_T_16) & 41'shca000000; // @[Parameters.scala 137:52]
  wire  tlb__prot_x_T_4 = $signed(tlb__prot_x_T_3) == 41'sh0; // @[Parameters.scala 137:67]
  wire  tlb__prot_x_T_15 = tlb__prot_x_T_4 | tlb__prot_w_T_14; // @[Parameters.scala 615:89]
  wire  tlb__prot_x_T_16 = tlb__prot_x_T_15 | tlb__prot_w_T_19; // @[Parameters.scala 615:89]
  wire  tlb__prot_x_T_31 = tlb_legal_address & tlb__prot_x_T_16; // @[TLB.scala 241:19]
  wire  tlb__prot_x_T_33 = tlb__prot_x_T_31 & tlb__prot_r_T_6; // @[TLB.scala 250:40]
  wire  tlb_prot_x = tlb__prot_x_T_33 & tlb_pmp_io_x; // @[TLB.scala 250:65]
  wire [40:0] tlb__prot_eff_T_20 = $signed(tlb__legal_address_T_16) & 41'shca012000; // @[Parameters.scala 137:52]
  wire  tlb__prot_eff_T_21 = $signed(tlb__prot_eff_T_20) == 41'sh0; // @[Parameters.scala 137:67]
  wire [40:0] tlb__prot_eff_T_25 = $signed(tlb__legal_address_T_11) & 41'shca010000; // @[Parameters.scala 137:52]
  wire  tlb__prot_eff_T_26 = $signed(tlb__prot_eff_T_25) == 41'sh0; // @[Parameters.scala 137:67]
  wire  tlb__prot_eff_T_37 = tlb__prot_eff_T_21 | tlb__prot_eff_T_26; // @[Parameters.scala 615:89]
  wire  tlb__prot_eff_T_38 = tlb__prot_eff_T_37 | tlb__homogeneous_T_58; // @[Parameters.scala 615:89]
  wire  tlb__prot_eff_T_39 = tlb__prot_eff_T_38 | tlb__prot_w_T_14; // @[Parameters.scala 615:89]
  wire  tlb_prot_eff = tlb_legal_address & tlb__prot_eff_T_39; // @[TLB.scala 241:19]
  wire  tlb__sector_hits_T = tlb_sectored_entries_0_0_valid_0 | tlb_sectored_entries_0_0_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_1 = tlb__sector_hits_T | tlb_sectored_entries_0_0_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_2 = tlb__sector_hits_T_1 | tlb_sectored_entries_0_0_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_3 = tlb_sectored_entries_0_0_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_4 = tlb__sector_hits_T_3[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_5 = tlb__sector_hits_T_4 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_0 = tlb__sector_hits_T_2 & tlb__sector_hits_T_5; // @[TLB.scala 103:55]
  wire  tlb__sector_hits_T_8 = tlb_sectored_entries_0_1_valid_0 | tlb_sectored_entries_0_1_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_9 = tlb__sector_hits_T_8 | tlb_sectored_entries_0_1_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_10 = tlb__sector_hits_T_9 | tlb_sectored_entries_0_1_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_11 = tlb_sectored_entries_0_1_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_12 = tlb__sector_hits_T_11[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_13 = tlb__sector_hits_T_12 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_1 = tlb__sector_hits_T_10 & tlb__sector_hits_T_13; // @[TLB.scala 103:55]
  wire  tlb__sector_hits_T_16 = tlb_sectored_entries_0_2_valid_0 | tlb_sectored_entries_0_2_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_17 = tlb__sector_hits_T_16 | tlb_sectored_entries_0_2_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_18 = tlb__sector_hits_T_17 | tlb_sectored_entries_0_2_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_19 = tlb_sectored_entries_0_2_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_20 = tlb__sector_hits_T_19[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_21 = tlb__sector_hits_T_20 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_2 = tlb__sector_hits_T_18 & tlb__sector_hits_T_21; // @[TLB.scala 103:55]
  wire  tlb__sector_hits_T_24 = tlb_sectored_entries_0_3_valid_0 | tlb_sectored_entries_0_3_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_25 = tlb__sector_hits_T_24 | tlb_sectored_entries_0_3_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_26 = tlb__sector_hits_T_25 | tlb_sectored_entries_0_3_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_27 = tlb_sectored_entries_0_3_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_28 = tlb__sector_hits_T_27[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_29 = tlb__sector_hits_T_28 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_3 = tlb__sector_hits_T_26 & tlb__sector_hits_T_29; // @[TLB.scala 103:55]
  wire  tlb__sector_hits_T_32 = tlb_sectored_entries_0_4_valid_0 | tlb_sectored_entries_0_4_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_33 = tlb__sector_hits_T_32 | tlb_sectored_entries_0_4_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_34 = tlb__sector_hits_T_33 | tlb_sectored_entries_0_4_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_35 = tlb_sectored_entries_0_4_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_36 = tlb__sector_hits_T_35[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_37 = tlb__sector_hits_T_36 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_4 = tlb__sector_hits_T_34 & tlb__sector_hits_T_37; // @[TLB.scala 103:55]
  wire  tlb__sector_hits_T_40 = tlb_sectored_entries_0_5_valid_0 | tlb_sectored_entries_0_5_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_41 = tlb__sector_hits_T_40 | tlb_sectored_entries_0_5_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_42 = tlb__sector_hits_T_41 | tlb_sectored_entries_0_5_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_43 = tlb_sectored_entries_0_5_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_44 = tlb__sector_hits_T_43[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_45 = tlb__sector_hits_T_44 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_5 = tlb__sector_hits_T_42 & tlb__sector_hits_T_45; // @[TLB.scala 103:55]
  wire  tlb__sector_hits_T_48 = tlb_sectored_entries_0_6_valid_0 | tlb_sectored_entries_0_6_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_49 = tlb__sector_hits_T_48 | tlb_sectored_entries_0_6_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_50 = tlb__sector_hits_T_49 | tlb_sectored_entries_0_6_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_51 = tlb_sectored_entries_0_6_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_52 = tlb__sector_hits_T_51[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_53 = tlb__sector_hits_T_52 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_6 = tlb__sector_hits_T_50 & tlb__sector_hits_T_53; // @[TLB.scala 103:55]
  wire  tlb__sector_hits_T_56 = tlb_sectored_entries_0_7_valid_0 | tlb_sectored_entries_0_7_valid_1; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_57 = tlb__sector_hits_T_56 | tlb_sectored_entries_0_7_valid_2; // @[package.scala 72:59]
  wire  tlb__sector_hits_T_58 = tlb__sector_hits_T_57 | tlb_sectored_entries_0_7_valid_3; // @[package.scala 72:59]
  wire [26:0] tlb__sector_hits_T_59 = tlb_sectored_entries_0_7_tag_vpn ^ tlb_vpn; // @[TLB.scala 104:61]
  wire [24:0] tlb__sector_hits_T_60 = tlb__sector_hits_T_59[26:2]; // @[TLB.scala 104:68]
  wire  tlb__sector_hits_T_61 = tlb__sector_hits_T_60 == 25'h0; // @[TLB.scala 104:86]
  wire  tlb_sector_hits_7 = tlb__sector_hits_T_58 & tlb__sector_hits_T_61; // @[TLB.scala 103:55]
  wire [26:0] tlb__superpage_hits_T = tlb_superpage_entries_0_tag_vpn ^ tlb_vpn; // @[TLB.scala 112:52]
  wire [8:0] tlb__superpage_hits_T_1 = tlb__superpage_hits_T[26:18]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_2 = tlb__superpage_hits_T_1 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_4 = tlb_superpage_entries_0_valid_0 & tlb__superpage_hits_T_2; // @[TLB.scala 112:29]
  wire  tlb__superpage_hits_ignore_T_1 = tlb_superpage_entries_0_level < 2'h1; // @[TLB.scala 111:28]
  wire [8:0] tlb__superpage_hits_T_6 = tlb__superpage_hits_T[17:9]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_7 = tlb__superpage_hits_T_6 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_8 = tlb__superpage_hits_ignore_T_1 | tlb__superpage_hits_T_7; // @[TLB.scala 112:40]
  wire  tlb__superpage_hits_T_9 = tlb__superpage_hits_T_4 & tlb__superpage_hits_T_8; // @[TLB.scala 112:29]
  wire [26:0] tlb__superpage_hits_T_14 = tlb_superpage_entries_1_tag_vpn ^ tlb_vpn; // @[TLB.scala 112:52]
  wire [8:0] tlb__superpage_hits_T_15 = tlb__superpage_hits_T_14[26:18]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_16 = tlb__superpage_hits_T_15 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_18 = tlb_superpage_entries_1_valid_0 & tlb__superpage_hits_T_16; // @[TLB.scala 112:29]
  wire  tlb__superpage_hits_ignore_T_4 = tlb_superpage_entries_1_level < 2'h1; // @[TLB.scala 111:28]
  wire [8:0] tlb__superpage_hits_T_20 = tlb__superpage_hits_T_14[17:9]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_21 = tlb__superpage_hits_T_20 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_22 = tlb__superpage_hits_ignore_T_4 | tlb__superpage_hits_T_21; // @[TLB.scala 112:40]
  wire  tlb__superpage_hits_T_23 = tlb__superpage_hits_T_18 & tlb__superpage_hits_T_22; // @[TLB.scala 112:29]
  wire [26:0] tlb__superpage_hits_T_28 = tlb_superpage_entries_2_tag_vpn ^ tlb_vpn; // @[TLB.scala 112:52]
  wire [8:0] tlb__superpage_hits_T_29 = tlb__superpage_hits_T_28[26:18]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_30 = tlb__superpage_hits_T_29 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_32 = tlb_superpage_entries_2_valid_0 & tlb__superpage_hits_T_30; // @[TLB.scala 112:29]
  wire  tlb__superpage_hits_ignore_T_7 = tlb_superpage_entries_2_level < 2'h1; // @[TLB.scala 111:28]
  wire [8:0] tlb__superpage_hits_T_34 = tlb__superpage_hits_T_28[17:9]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_35 = tlb__superpage_hits_T_34 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_36 = tlb__superpage_hits_ignore_T_7 | tlb__superpage_hits_T_35; // @[TLB.scala 112:40]
  wire  tlb__superpage_hits_T_37 = tlb__superpage_hits_T_32 & tlb__superpage_hits_T_36; // @[TLB.scala 112:29]
  wire [26:0] tlb__superpage_hits_T_42 = tlb_superpage_entries_3_tag_vpn ^ tlb_vpn; // @[TLB.scala 112:52]
  wire [8:0] tlb__superpage_hits_T_43 = tlb__superpage_hits_T_42[26:18]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_44 = tlb__superpage_hits_T_43 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_46 = tlb_superpage_entries_3_valid_0 & tlb__superpage_hits_T_44; // @[TLB.scala 112:29]
  wire  tlb__superpage_hits_ignore_T_10 = tlb_superpage_entries_3_level < 2'h1; // @[TLB.scala 111:28]
  wire [8:0] tlb__superpage_hits_T_48 = tlb__superpage_hits_T_42[17:9]; // @[TLB.scala 112:58]
  wire  tlb__superpage_hits_T_49 = tlb__superpage_hits_T_48 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__superpage_hits_T_50 = tlb__superpage_hits_ignore_T_10 | tlb__superpage_hits_T_49; // @[TLB.scala 112:40]
  wire  tlb__superpage_hits_T_51 = tlb__superpage_hits_T_46 & tlb__superpage_hits_T_50; // @[TLB.scala 112:29]
  wire [1:0] tlb_hitsVec_idx = tlb_vpn[1:0]; // @[package.scala 154:13]
  wire  tlb__GEN_1 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_0_valid_1 : tlb_sectored_entries_0_0_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_2 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_0_valid_2 : tlb__GEN_1; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_3 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_0_valid_3 : tlb__GEN_2; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_5 = tlb__GEN_3 & tlb__sector_hits_T_5; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_0 = tlb_vm_enabled & tlb__hitsVec_T_5; // @[TLB.scala 255:44]
  wire  tlb__GEN_5 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_1_valid_1 : tlb_sectored_entries_0_1_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_6 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_1_valid_2 : tlb__GEN_5; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_7 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_1_valid_3 : tlb__GEN_6; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_11 = tlb__GEN_7 & tlb__sector_hits_T_13; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_1 = tlb_vm_enabled & tlb__hitsVec_T_11; // @[TLB.scala 255:44]
  wire  tlb__GEN_9 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_2_valid_1 : tlb_sectored_entries_0_2_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_10 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_2_valid_2 : tlb__GEN_9; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_11 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_2_valid_3 : tlb__GEN_10; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_17 = tlb__GEN_11 & tlb__sector_hits_T_21; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_2 = tlb_vm_enabled & tlb__hitsVec_T_17; // @[TLB.scala 255:44]
  wire  tlb__GEN_13 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_3_valid_1 : tlb_sectored_entries_0_3_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_14 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_3_valid_2 : tlb__GEN_13; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_15 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_3_valid_3 : tlb__GEN_14; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_23 = tlb__GEN_15 & tlb__sector_hits_T_29; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_3 = tlb_vm_enabled & tlb__hitsVec_T_23; // @[TLB.scala 255:44]
  wire  tlb__GEN_17 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_4_valid_1 : tlb_sectored_entries_0_4_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_18 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_4_valid_2 : tlb__GEN_17; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_19 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_4_valid_3 : tlb__GEN_18; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_29 = tlb__GEN_19 & tlb__sector_hits_T_37; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_4 = tlb_vm_enabled & tlb__hitsVec_T_29; // @[TLB.scala 255:44]
  wire  tlb__GEN_21 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_5_valid_1 : tlb_sectored_entries_0_5_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_22 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_5_valid_2 : tlb__GEN_21; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_23 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_5_valid_3 : tlb__GEN_22; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_35 = tlb__GEN_23 & tlb__sector_hits_T_45; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_5 = tlb_vm_enabled & tlb__hitsVec_T_35; // @[TLB.scala 255:44]
  wire  tlb__GEN_25 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_6_valid_1 : tlb_sectored_entries_0_6_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_26 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_6_valid_2 : tlb__GEN_25; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_27 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_6_valid_3 : tlb__GEN_26; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_41 = tlb__GEN_27 & tlb__sector_hits_T_53; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_6 = tlb_vm_enabled & tlb__hitsVec_T_41; // @[TLB.scala 255:44]
  wire  tlb__GEN_29 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_7_valid_1 : tlb_sectored_entries_0_7_valid_0; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_30 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_7_valid_2 : tlb__GEN_29; // @[TLB.scala 117:{18,18}]
  wire  tlb__GEN_31 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_7_valid_3 : tlb__GEN_30; // @[TLB.scala 117:{18,18}]
  wire  tlb__hitsVec_T_47 = tlb__GEN_31 & tlb__sector_hits_T_61; // @[TLB.scala 117:18]
  wire  tlb_hitsVec_7 = tlb_vm_enabled & tlb__hitsVec_T_47; // @[TLB.scala 255:44]
  wire  tlb_hitsVec_8 = tlb_vm_enabled & tlb__superpage_hits_T_9; // @[TLB.scala 255:44]
  wire  tlb_hitsVec_9 = tlb_vm_enabled & tlb__superpage_hits_T_23; // @[TLB.scala 255:44]
  wire  tlb_hitsVec_10 = tlb_vm_enabled & tlb__superpage_hits_T_37; // @[TLB.scala 255:44]
  wire  tlb_hitsVec_11 = tlb_vm_enabled & tlb__superpage_hits_T_51; // @[TLB.scala 255:44]
  wire [26:0] tlb__hitsVec_T_108 = tlb_special_entry_tag_vpn ^ tlb_vpn; // @[TLB.scala 112:52]
  wire [8:0] tlb__hitsVec_T_109 = tlb__hitsVec_T_108[26:18]; // @[TLB.scala 112:58]
  wire  tlb__hitsVec_T_110 = tlb__hitsVec_T_109 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__hitsVec_T_112 = tlb_special_entry_valid_0 & tlb__hitsVec_T_110; // @[TLB.scala 112:29]
  wire [8:0] tlb__hitsVec_T_114 = tlb__hitsVec_T_108[17:9]; // @[TLB.scala 112:58]
  wire  tlb__hitsVec_T_115 = tlb__hitsVec_T_114 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__hitsVec_T_116 = tlb__mpu_ppn_ignore_T | tlb__hitsVec_T_115; // @[TLB.scala 112:40]
  wire  tlb__hitsVec_T_117 = tlb__hitsVec_T_112 & tlb__hitsVec_T_116; // @[TLB.scala 112:29]
  wire [8:0] tlb__hitsVec_T_119 = tlb__hitsVec_T_108[8:0]; // @[TLB.scala 112:58]
  wire  tlb__hitsVec_T_120 = tlb__hitsVec_T_119 == 9'h0; // @[TLB.scala 112:79]
  wire  tlb__hitsVec_T_121 = tlb__mpu_ppn_ignore_T_1 | tlb__hitsVec_T_120; // @[TLB.scala 112:40]
  wire  tlb__hitsVec_T_122 = tlb__hitsVec_T_117 & tlb__hitsVec_T_121; // @[TLB.scala 112:29]
  wire  tlb_hitsVec_12 = tlb_vm_enabled & tlb__hitsVec_T_122; // @[TLB.scala 255:44]
  wire [5:0] tlb_real_hits_lo = {tlb_hitsVec_5,tlb_hitsVec_4,tlb_hitsVec_3,tlb_hitsVec_2,tlb_hitsVec_1,tlb_hitsVec_0}; // @[Cat.scala 31:58]
  wire [12:0] tlb_real_hits = {tlb_hitsVec_12,tlb_hitsVec_11,tlb_hitsVec_10,tlb_hitsVec_9,tlb_hitsVec_8,tlb_hitsVec_7,
    tlb_hitsVec_6,tlb_real_hits_lo}; // @[Cat.scala 31:58]
  wire  tlb__hits_T = ~tlb_vm_enabled; // @[TLB.scala 257:18]
  wire [13:0] tlb_hits = {tlb__hits_T,tlb_hitsVec_12,tlb_hitsVec_11,tlb_hitsVec_10,tlb_hitsVec_9,tlb_hitsVec_8,
    tlb_hitsVec_7,tlb_hitsVec_6,tlb_real_hits_lo}; // @[Cat.scala 31:58]
  wire  tlb__newEntry_g_T = tlb_io_ptw_resp_bits_pte_g & tlb_io_ptw_resp_bits_pte_v; // @[TLB.scala 267:25]
  wire  tlb__newEntry_sr_T = ~tlb_io_ptw_resp_bits_pte_w; // @[PTW.scala 92:47]
  wire  tlb__newEntry_sr_T_1 = tlb_io_ptw_resp_bits_pte_x & tlb__newEntry_sr_T; // @[PTW.scala 92:44]
  wire  tlb__newEntry_sr_T_2 = tlb_io_ptw_resp_bits_pte_r | tlb__newEntry_sr_T_1; // @[PTW.scala 92:38]
  wire  tlb__newEntry_sr_T_3 = tlb_io_ptw_resp_bits_pte_v & tlb__newEntry_sr_T_2; // @[PTW.scala 92:32]
  wire  tlb__newEntry_sr_T_4 = tlb__newEntry_sr_T_3 & tlb_io_ptw_resp_bits_pte_a; // @[PTW.scala 92:52]
  wire  tlb__newEntry_sr_T_5 = tlb__newEntry_sr_T_4 & tlb_io_ptw_resp_bits_pte_r; // @[PTW.scala 96:35]
  wire  tlb__newEntry_sw_T_5 = tlb__newEntry_sr_T_4 & tlb_io_ptw_resp_bits_pte_w; // @[PTW.scala 97:35]
  wire  tlb__newEntry_sw_T_6 = tlb__newEntry_sw_T_5 & tlb_io_ptw_resp_bits_pte_d; // @[PTW.scala 97:40]
  wire  tlb__newEntry_sx_T_5 = tlb__newEntry_sr_T_4 & tlb_io_ptw_resp_bits_pte_x; // @[PTW.scala 98:35]
  wire  tlb__T = ~tlb_io_ptw_resp_bits_homogeneous; // @[TLB.scala 287:37]
  wire [10:0] tlb_special_entry_data_0_lo = {2'h3,tlb_prot_w,tlb_prot_x,tlb_prot_r,tlb__prot_w_T_31,tlb_prot_al,
    tlb_prot_al,tlb_prot_eff,tlb__cacheable_T_13,1'h0}; // @[TLB.scala 141:24]
  wire [4:0] tlb_special_entry_data_0_hi_lo = {1'h0,tlb__newEntry_sw_T_6,tlb__newEntry_sx_T_5,tlb__newEntry_sr_T_5,1'h1}
    ; // @[TLB.scala 141:24]
  wire [40:0] tlb__special_entry_data_0_T = {tlb_refill_ppn,tlb_io_ptw_resp_bits_pte_u,tlb__newEntry_g_T,
    tlb_io_ptw_resp_bits_ae_ptw,tlb_io_ptw_resp_bits_ae_final,tlb_io_ptw_resp_bits_pf,tlb_special_entry_data_0_hi_lo,
    tlb_special_entry_data_0_lo}; // @[TLB.scala 141:24]
  wire  tlb__T_2 = tlb_io_ptw_resp_bits_level < 2'h2; // @[TLB.scala 289:40]
  wire  tlb__T_3 = tlb_r_superpage_repl_addr == 2'h0; // @[TLB.scala 291:82]
  wire  tlb__superpage_entries_0_level_T = tlb_io_ptw_resp_bits_level[0]; // @[package.scala 154:13]
  wire  tlb__GEN_32 = tlb_invalidate_refill ? 1'h0 : 1'h1; // @[TLB.scala 140:16 293:34 144:46]
  wire  tlb__GEN_36 = tlb__T_3 ? tlb__GEN_32 : tlb_superpage_entries_0_valid_0; // @[TLB.scala 191:30 291:89]
  wire  tlb__T_4 = tlb_r_superpage_repl_addr == 2'h1; // @[TLB.scala 291:82]
  wire  tlb__GEN_41 = tlb__T_4 ? tlb__GEN_32 : tlb_superpage_entries_1_valid_0; // @[TLB.scala 191:30 291:89]
  wire  tlb__T_5 = tlb_r_superpage_repl_addr == 2'h2; // @[TLB.scala 291:82]
  wire  tlb__GEN_46 = tlb__T_5 ? tlb__GEN_32 : tlb_superpage_entries_2_valid_0; // @[TLB.scala 191:30 291:89]
  wire  tlb__T_6 = tlb_r_superpage_repl_addr == 2'h3; // @[TLB.scala 291:82]
  wire  tlb__GEN_51 = tlb__T_6 ? tlb__GEN_32 : tlb_superpage_entries_3_valid_0; // @[TLB.scala 191:30 291:89]
  wire [2:0] tlb_waddr_1 = tlb_r_sectored_hit_valid ? tlb_r_sectored_hit_bits : tlb_r_sectored_repl_addr; // @[TLB.scala 297:22]
  wire  tlb__T_7 = tlb_waddr_1 == 3'h0; // @[TLB.scala 298:75]
  wire  tlb__T_8 = ~tlb_r_sectored_hit_valid; // @[TLB.scala 299:15]
  wire  tlb__GEN_53 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_0_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_54 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_0_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_55 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_0_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_56 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_0_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire [1:0] tlb_idx = tlb_r_refill_tag[1:0]; // @[package.scala 154:13]
  wire  tlb__GEN_57 = 2'h0 == tlb_idx | tlb__GEN_53; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_58 = 2'h1 == tlb_idx | tlb__GEN_54; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_59 = 2'h2 == tlb_idx | tlb__GEN_55; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_60 = 2'h3 == tlb_idx | tlb__GEN_56; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_61 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_0_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_62 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_0_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_63 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_0_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_64 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_0_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_65 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_57; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_66 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_58; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_67 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_59; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_68 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_60; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_69 = tlb__T_7 ? tlb__GEN_65 : tlb_sectored_entries_0_0_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_70 = tlb__T_7 ? tlb__GEN_66 : tlb_sectored_entries_0_0_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_71 = tlb__T_7 ? tlb__GEN_67 : tlb_sectored_entries_0_0_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_72 = tlb__T_7 ? tlb__GEN_68 : tlb_sectored_entries_0_0_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__T_9 = tlb_waddr_1 == 3'h1; // @[TLB.scala 298:75]
  wire  tlb__GEN_80 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_1_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_81 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_1_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_82 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_1_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_83 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_1_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_84 = 2'h0 == tlb_idx | tlb__GEN_80; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_85 = 2'h1 == tlb_idx | tlb__GEN_81; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_86 = 2'h2 == tlb_idx | tlb__GEN_82; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_87 = 2'h3 == tlb_idx | tlb__GEN_83; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_88 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_1_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_89 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_1_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_90 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_1_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_91 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_1_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_92 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_84; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_93 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_85; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_94 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_86; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_95 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_87; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_96 = tlb__T_9 ? tlb__GEN_92 : tlb_sectored_entries_0_1_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_97 = tlb__T_9 ? tlb__GEN_93 : tlb_sectored_entries_0_1_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_98 = tlb__T_9 ? tlb__GEN_94 : tlb_sectored_entries_0_1_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_99 = tlb__T_9 ? tlb__GEN_95 : tlb_sectored_entries_0_1_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__T_11 = tlb_waddr_1 == 3'h2; // @[TLB.scala 298:75]
  wire  tlb__GEN_107 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_2_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_108 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_2_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_109 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_2_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_110 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_2_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_111 = 2'h0 == tlb_idx | tlb__GEN_107; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_112 = 2'h1 == tlb_idx | tlb__GEN_108; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_113 = 2'h2 == tlb_idx | tlb__GEN_109; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_114 = 2'h3 == tlb_idx | tlb__GEN_110; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_115 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_2_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_116 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_2_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_117 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_2_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_118 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_2_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_119 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_111; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_120 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_112; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_121 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_113; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_122 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_114; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_123 = tlb__T_11 ? tlb__GEN_119 : tlb_sectored_entries_0_2_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_124 = tlb__T_11 ? tlb__GEN_120 : tlb_sectored_entries_0_2_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_125 = tlb__T_11 ? tlb__GEN_121 : tlb_sectored_entries_0_2_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_126 = tlb__T_11 ? tlb__GEN_122 : tlb_sectored_entries_0_2_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__T_13 = tlb_waddr_1 == 3'h3; // @[TLB.scala 298:75]
  wire  tlb__GEN_134 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_3_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_135 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_3_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_136 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_3_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_137 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_3_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_138 = 2'h0 == tlb_idx | tlb__GEN_134; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_139 = 2'h1 == tlb_idx | tlb__GEN_135; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_140 = 2'h2 == tlb_idx | tlb__GEN_136; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_141 = 2'h3 == tlb_idx | tlb__GEN_137; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_142 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_3_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_143 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_3_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_144 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_3_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_145 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_3_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_146 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_138; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_147 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_139; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_148 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_140; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_149 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_141; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_150 = tlb__T_13 ? tlb__GEN_146 : tlb_sectored_entries_0_3_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_151 = tlb__T_13 ? tlb__GEN_147 : tlb_sectored_entries_0_3_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_152 = tlb__T_13 ? tlb__GEN_148 : tlb_sectored_entries_0_3_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_153 = tlb__T_13 ? tlb__GEN_149 : tlb_sectored_entries_0_3_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__T_15 = tlb_waddr_1 == 3'h4; // @[TLB.scala 298:75]
  wire  tlb__GEN_161 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_4_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_162 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_4_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_163 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_4_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_164 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_4_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_165 = 2'h0 == tlb_idx | tlb__GEN_161; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_166 = 2'h1 == tlb_idx | tlb__GEN_162; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_167 = 2'h2 == tlb_idx | tlb__GEN_163; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_168 = 2'h3 == tlb_idx | tlb__GEN_164; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_169 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_4_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_170 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_4_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_171 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_4_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_172 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_4_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_173 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_165; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_174 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_166; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_175 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_167; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_176 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_168; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_177 = tlb__T_15 ? tlb__GEN_173 : tlb_sectored_entries_0_4_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_178 = tlb__T_15 ? tlb__GEN_174 : tlb_sectored_entries_0_4_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_179 = tlb__T_15 ? tlb__GEN_175 : tlb_sectored_entries_0_4_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_180 = tlb__T_15 ? tlb__GEN_176 : tlb_sectored_entries_0_4_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__T_17 = tlb_waddr_1 == 3'h5; // @[TLB.scala 298:75]
  wire  tlb__GEN_188 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_5_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_189 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_5_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_190 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_5_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_191 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_5_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_192 = 2'h0 == tlb_idx | tlb__GEN_188; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_193 = 2'h1 == tlb_idx | tlb__GEN_189; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_194 = 2'h2 == tlb_idx | tlb__GEN_190; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_195 = 2'h3 == tlb_idx | tlb__GEN_191; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_196 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_5_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_197 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_5_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_198 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_5_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_199 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_5_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_200 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_192; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_201 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_193; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_202 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_194; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_203 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_195; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_204 = tlb__T_17 ? tlb__GEN_200 : tlb_sectored_entries_0_5_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_205 = tlb__T_17 ? tlb__GEN_201 : tlb_sectored_entries_0_5_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_206 = tlb__T_17 ? tlb__GEN_202 : tlb_sectored_entries_0_5_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_207 = tlb__T_17 ? tlb__GEN_203 : tlb_sectored_entries_0_5_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__T_19 = tlb_waddr_1 == 3'h6; // @[TLB.scala 298:75]
  wire  tlb__GEN_215 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_6_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_216 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_6_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_217 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_6_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_218 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_6_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_219 = 2'h0 == tlb_idx | tlb__GEN_215; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_220 = 2'h1 == tlb_idx | tlb__GEN_216; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_221 = 2'h2 == tlb_idx | tlb__GEN_217; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_222 = 2'h3 == tlb_idx | tlb__GEN_218; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_223 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_6_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_224 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_6_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_225 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_6_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_226 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_6_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_227 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_219; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_228 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_220; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_229 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_221; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_230 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_222; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_231 = tlb__T_19 ? tlb__GEN_227 : tlb_sectored_entries_0_6_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_232 = tlb__T_19 ? tlb__GEN_228 : tlb_sectored_entries_0_6_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_233 = tlb__T_19 ? tlb__GEN_229 : tlb_sectored_entries_0_6_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_234 = tlb__T_19 ? tlb__GEN_230 : tlb_sectored_entries_0_6_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__T_21 = tlb_waddr_1 == 3'h7; // @[TLB.scala 298:75]
  wire  tlb__GEN_242 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_7_valid_0; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_243 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_7_valid_1; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_244 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_7_valid_2; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_245 = tlb__T_8 ? 1'h0 : tlb_sectored_entries_0_7_valid_3; // @[TLB.scala 299:38 144:46 190:29]
  wire  tlb__GEN_246 = 2'h0 == tlb_idx | tlb__GEN_242; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_247 = 2'h1 == tlb_idx | tlb__GEN_243; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_248 = 2'h2 == tlb_idx | tlb__GEN_244; // @[TLB.scala 140:{16,16}]
  wire  tlb__GEN_249 = 2'h3 == tlb_idx | tlb__GEN_245; // @[TLB.scala 140:{16,16}]
  wire [40:0] tlb__GEN_250 = 2'h0 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_7_data_0; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_251 = 2'h1 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_7_data_1; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_252 = 2'h2 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_7_data_2; // @[TLB.scala 141:{15,15} 190:29]
  wire [40:0] tlb__GEN_253 = 2'h3 == tlb_idx ? tlb__special_entry_data_0_T : tlb_sectored_entries_0_7_data_3; // @[TLB.scala 141:{15,15} 190:29]
  wire  tlb__GEN_254 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_246; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_255 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_247; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_256 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_248; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_257 = tlb_invalidate_refill ? 1'h0 : tlb__GEN_249; // @[TLB.scala 301:34 144:46]
  wire  tlb__GEN_258 = tlb__T_21 ? tlb__GEN_254 : tlb_sectored_entries_0_7_valid_0; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_259 = tlb__T_21 ? tlb__GEN_255 : tlb_sectored_entries_0_7_valid_1; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_260 = tlb__T_21 ? tlb__GEN_256 : tlb_sectored_entries_0_7_valid_2; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_261 = tlb__T_21 ? tlb__GEN_257 : tlb_sectored_entries_0_7_valid_3; // @[TLB.scala 190:29 298:82]
  wire  tlb__GEN_272 = tlb__T_2 ? tlb__GEN_36 : tlb_superpage_entries_0_valid_0; // @[TLB.scala 191:30 289:54]
  wire  tlb__GEN_277 = tlb__T_2 ? tlb__GEN_41 : tlb_superpage_entries_1_valid_0; // @[TLB.scala 191:30 289:54]
  wire  tlb__GEN_282 = tlb__T_2 ? tlb__GEN_46 : tlb_superpage_entries_2_valid_0; // @[TLB.scala 191:30 289:54]
  wire  tlb__GEN_287 = tlb__T_2 ? tlb__GEN_51 : tlb_superpage_entries_3_valid_0; // @[TLB.scala 191:30 289:54]
  wire  tlb__GEN_289 = tlb__T_2 ? tlb_sectored_entries_0_0_valid_0 : tlb__GEN_69; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_290 = tlb__T_2 ? tlb_sectored_entries_0_0_valid_1 : tlb__GEN_70; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_291 = tlb__T_2 ? tlb_sectored_entries_0_0_valid_2 : tlb__GEN_71; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_292 = tlb__T_2 ? tlb_sectored_entries_0_0_valid_3 : tlb__GEN_72; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_300 = tlb__T_2 ? tlb_sectored_entries_0_1_valid_0 : tlb__GEN_96; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_301 = tlb__T_2 ? tlb_sectored_entries_0_1_valid_1 : tlb__GEN_97; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_302 = tlb__T_2 ? tlb_sectored_entries_0_1_valid_2 : tlb__GEN_98; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_303 = tlb__T_2 ? tlb_sectored_entries_0_1_valid_3 : tlb__GEN_99; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_311 = tlb__T_2 ? tlb_sectored_entries_0_2_valid_0 : tlb__GEN_123; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_312 = tlb__T_2 ? tlb_sectored_entries_0_2_valid_1 : tlb__GEN_124; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_313 = tlb__T_2 ? tlb_sectored_entries_0_2_valid_2 : tlb__GEN_125; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_314 = tlb__T_2 ? tlb_sectored_entries_0_2_valid_3 : tlb__GEN_126; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_322 = tlb__T_2 ? tlb_sectored_entries_0_3_valid_0 : tlb__GEN_150; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_323 = tlb__T_2 ? tlb_sectored_entries_0_3_valid_1 : tlb__GEN_151; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_324 = tlb__T_2 ? tlb_sectored_entries_0_3_valid_2 : tlb__GEN_152; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_325 = tlb__T_2 ? tlb_sectored_entries_0_3_valid_3 : tlb__GEN_153; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_333 = tlb__T_2 ? tlb_sectored_entries_0_4_valid_0 : tlb__GEN_177; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_334 = tlb__T_2 ? tlb_sectored_entries_0_4_valid_1 : tlb__GEN_178; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_335 = tlb__T_2 ? tlb_sectored_entries_0_4_valid_2 : tlb__GEN_179; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_336 = tlb__T_2 ? tlb_sectored_entries_0_4_valid_3 : tlb__GEN_180; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_344 = tlb__T_2 ? tlb_sectored_entries_0_5_valid_0 : tlb__GEN_204; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_345 = tlb__T_2 ? tlb_sectored_entries_0_5_valid_1 : tlb__GEN_205; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_346 = tlb__T_2 ? tlb_sectored_entries_0_5_valid_2 : tlb__GEN_206; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_347 = tlb__T_2 ? tlb_sectored_entries_0_5_valid_3 : tlb__GEN_207; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_355 = tlb__T_2 ? tlb_sectored_entries_0_6_valid_0 : tlb__GEN_231; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_356 = tlb__T_2 ? tlb_sectored_entries_0_6_valid_1 : tlb__GEN_232; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_357 = tlb__T_2 ? tlb_sectored_entries_0_6_valid_2 : tlb__GEN_233; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_358 = tlb__T_2 ? tlb_sectored_entries_0_6_valid_3 : tlb__GEN_234; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_366 = tlb__T_2 ? tlb_sectored_entries_0_7_valid_0 : tlb__GEN_258; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_367 = tlb__T_2 ? tlb_sectored_entries_0_7_valid_1 : tlb__GEN_259; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_368 = tlb__T_2 ? tlb_sectored_entries_0_7_valid_2 : tlb__GEN_260; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_369 = tlb__T_2 ? tlb_sectored_entries_0_7_valid_3 : tlb__GEN_261; // @[TLB.scala 190:29 289:54]
  wire  tlb__GEN_380 = tlb__T | tlb_special_entry_valid_0; // @[TLB.scala 140:16 192:56 287:68]
  wire  tlb__GEN_385 = tlb__T ? tlb_superpage_entries_0_valid_0 : tlb__GEN_272; // @[TLB.scala 191:30 287:68]
  wire  tlb__GEN_390 = tlb__T ? tlb_superpage_entries_1_valid_0 : tlb__GEN_277; // @[TLB.scala 191:30 287:68]
  wire  tlb__GEN_395 = tlb__T ? tlb_superpage_entries_2_valid_0 : tlb__GEN_282; // @[TLB.scala 191:30 287:68]
  wire  tlb__GEN_400 = tlb__T ? tlb_superpage_entries_3_valid_0 : tlb__GEN_287; // @[TLB.scala 191:30 287:68]
  wire  tlb__GEN_402 = tlb__T ? tlb_sectored_entries_0_0_valid_0 : tlb__GEN_289; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_403 = tlb__T ? tlb_sectored_entries_0_0_valid_1 : tlb__GEN_290; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_404 = tlb__T ? tlb_sectored_entries_0_0_valid_2 : tlb__GEN_291; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_405 = tlb__T ? tlb_sectored_entries_0_0_valid_3 : tlb__GEN_292; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_413 = tlb__T ? tlb_sectored_entries_0_1_valid_0 : tlb__GEN_300; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_414 = tlb__T ? tlb_sectored_entries_0_1_valid_1 : tlb__GEN_301; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_415 = tlb__T ? tlb_sectored_entries_0_1_valid_2 : tlb__GEN_302; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_416 = tlb__T ? tlb_sectored_entries_0_1_valid_3 : tlb__GEN_303; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_424 = tlb__T ? tlb_sectored_entries_0_2_valid_0 : tlb__GEN_311; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_425 = tlb__T ? tlb_sectored_entries_0_2_valid_1 : tlb__GEN_312; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_426 = tlb__T ? tlb_sectored_entries_0_2_valid_2 : tlb__GEN_313; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_427 = tlb__T ? tlb_sectored_entries_0_2_valid_3 : tlb__GEN_314; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_435 = tlb__T ? tlb_sectored_entries_0_3_valid_0 : tlb__GEN_322; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_436 = tlb__T ? tlb_sectored_entries_0_3_valid_1 : tlb__GEN_323; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_437 = tlb__T ? tlb_sectored_entries_0_3_valid_2 : tlb__GEN_324; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_438 = tlb__T ? tlb_sectored_entries_0_3_valid_3 : tlb__GEN_325; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_446 = tlb__T ? tlb_sectored_entries_0_4_valid_0 : tlb__GEN_333; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_447 = tlb__T ? tlb_sectored_entries_0_4_valid_1 : tlb__GEN_334; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_448 = tlb__T ? tlb_sectored_entries_0_4_valid_2 : tlb__GEN_335; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_449 = tlb__T ? tlb_sectored_entries_0_4_valid_3 : tlb__GEN_336; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_457 = tlb__T ? tlb_sectored_entries_0_5_valid_0 : tlb__GEN_344; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_458 = tlb__T ? tlb_sectored_entries_0_5_valid_1 : tlb__GEN_345; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_459 = tlb__T ? tlb_sectored_entries_0_5_valid_2 : tlb__GEN_346; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_460 = tlb__T ? tlb_sectored_entries_0_5_valid_3 : tlb__GEN_347; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_468 = tlb__T ? tlb_sectored_entries_0_6_valid_0 : tlb__GEN_355; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_469 = tlb__T ? tlb_sectored_entries_0_6_valid_1 : tlb__GEN_356; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_470 = tlb__T ? tlb_sectored_entries_0_6_valid_2 : tlb__GEN_357; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_471 = tlb__T ? tlb_sectored_entries_0_6_valid_3 : tlb__GEN_358; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_479 = tlb__T ? tlb_sectored_entries_0_7_valid_0 : tlb__GEN_366; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_480 = tlb__T ? tlb_sectored_entries_0_7_valid_1 : tlb__GEN_367; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_481 = tlb__T ? tlb_sectored_entries_0_7_valid_2 : tlb__GEN_368; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_482 = tlb__T ? tlb_sectored_entries_0_7_valid_3 : tlb__GEN_369; // @[TLB.scala 190:29 287:68]
  wire  tlb__GEN_493 = tlb_io_ptw_resp_valid ? tlb__GEN_380 : tlb_special_entry_valid_0; // @[TLB.scala 260:20 192:56]
  wire  tlb__GEN_498 = tlb_io_ptw_resp_valid ? tlb__GEN_385 : tlb_superpage_entries_0_valid_0; // @[TLB.scala 260:20 191:30]
  wire  tlb__GEN_503 = tlb_io_ptw_resp_valid ? tlb__GEN_390 : tlb_superpage_entries_1_valid_0; // @[TLB.scala 260:20 191:30]
  wire  tlb__GEN_508 = tlb_io_ptw_resp_valid ? tlb__GEN_395 : tlb_superpage_entries_2_valid_0; // @[TLB.scala 260:20 191:30]
  wire  tlb__GEN_513 = tlb_io_ptw_resp_valid ? tlb__GEN_400 : tlb_superpage_entries_3_valid_0; // @[TLB.scala 260:20 191:30]
  wire  tlb__GEN_515 = tlb_io_ptw_resp_valid ? tlb__GEN_402 : tlb_sectored_entries_0_0_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_516 = tlb_io_ptw_resp_valid ? tlb__GEN_403 : tlb_sectored_entries_0_0_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_517 = tlb_io_ptw_resp_valid ? tlb__GEN_404 : tlb_sectored_entries_0_0_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_518 = tlb_io_ptw_resp_valid ? tlb__GEN_405 : tlb_sectored_entries_0_0_valid_3; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_526 = tlb_io_ptw_resp_valid ? tlb__GEN_413 : tlb_sectored_entries_0_1_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_527 = tlb_io_ptw_resp_valid ? tlb__GEN_414 : tlb_sectored_entries_0_1_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_528 = tlb_io_ptw_resp_valid ? tlb__GEN_415 : tlb_sectored_entries_0_1_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_529 = tlb_io_ptw_resp_valid ? tlb__GEN_416 : tlb_sectored_entries_0_1_valid_3; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_537 = tlb_io_ptw_resp_valid ? tlb__GEN_424 : tlb_sectored_entries_0_2_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_538 = tlb_io_ptw_resp_valid ? tlb__GEN_425 : tlb_sectored_entries_0_2_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_539 = tlb_io_ptw_resp_valid ? tlb__GEN_426 : tlb_sectored_entries_0_2_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_540 = tlb_io_ptw_resp_valid ? tlb__GEN_427 : tlb_sectored_entries_0_2_valid_3; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_548 = tlb_io_ptw_resp_valid ? tlb__GEN_435 : tlb_sectored_entries_0_3_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_549 = tlb_io_ptw_resp_valid ? tlb__GEN_436 : tlb_sectored_entries_0_3_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_550 = tlb_io_ptw_resp_valid ? tlb__GEN_437 : tlb_sectored_entries_0_3_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_551 = tlb_io_ptw_resp_valid ? tlb__GEN_438 : tlb_sectored_entries_0_3_valid_3; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_559 = tlb_io_ptw_resp_valid ? tlb__GEN_446 : tlb_sectored_entries_0_4_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_560 = tlb_io_ptw_resp_valid ? tlb__GEN_447 : tlb_sectored_entries_0_4_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_561 = tlb_io_ptw_resp_valid ? tlb__GEN_448 : tlb_sectored_entries_0_4_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_562 = tlb_io_ptw_resp_valid ? tlb__GEN_449 : tlb_sectored_entries_0_4_valid_3; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_570 = tlb_io_ptw_resp_valid ? tlb__GEN_457 : tlb_sectored_entries_0_5_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_571 = tlb_io_ptw_resp_valid ? tlb__GEN_458 : tlb_sectored_entries_0_5_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_572 = tlb_io_ptw_resp_valid ? tlb__GEN_459 : tlb_sectored_entries_0_5_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_573 = tlb_io_ptw_resp_valid ? tlb__GEN_460 : tlb_sectored_entries_0_5_valid_3; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_581 = tlb_io_ptw_resp_valid ? tlb__GEN_468 : tlb_sectored_entries_0_6_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_582 = tlb_io_ptw_resp_valid ? tlb__GEN_469 : tlb_sectored_entries_0_6_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_583 = tlb_io_ptw_resp_valid ? tlb__GEN_470 : tlb_sectored_entries_0_6_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_584 = tlb_io_ptw_resp_valid ? tlb__GEN_471 : tlb_sectored_entries_0_6_valid_3; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_592 = tlb_io_ptw_resp_valid ? tlb__GEN_479 : tlb_sectored_entries_0_7_valid_0; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_593 = tlb_io_ptw_resp_valid ? tlb__GEN_480 : tlb_sectored_entries_0_7_valid_1; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_594 = tlb_io_ptw_resp_valid ? tlb__GEN_481 : tlb_sectored_entries_0_7_valid_2; // @[TLB.scala 260:20 190:29]
  wire  tlb__GEN_595 = tlb_io_ptw_resp_valid ? tlb__GEN_482 : tlb_sectored_entries_0_7_valid_3; // @[TLB.scala 260:20 190:29]
  wire [40:0] tlb__GEN_607 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_0_data_1 : tlb_sectored_entries_0_0_data_0
    ; // @[]
  wire [40:0] tlb__GEN_608 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_0_data_2 : tlb__GEN_607; // @[]
  wire [40:0] tlb__GEN_609 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_0_data_3 : tlb__GEN_608; // @[]
  wire [40:0] tlb__GEN_611 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_1_data_1 : tlb_sectored_entries_0_1_data_0
    ; // @[]
  wire [40:0] tlb__GEN_612 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_1_data_2 : tlb__GEN_611; // @[]
  wire [40:0] tlb__GEN_613 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_1_data_3 : tlb__GEN_612; // @[]
  wire [40:0] tlb__GEN_615 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_2_data_1 : tlb_sectored_entries_0_2_data_0
    ; // @[]
  wire [40:0] tlb__GEN_616 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_2_data_2 : tlb__GEN_615; // @[]
  wire [40:0] tlb__GEN_617 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_2_data_3 : tlb__GEN_616; // @[]
  wire [40:0] tlb__GEN_619 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_3_data_1 : tlb_sectored_entries_0_3_data_0
    ; // @[]
  wire [40:0] tlb__GEN_620 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_3_data_2 : tlb__GEN_619; // @[]
  wire [40:0] tlb__GEN_621 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_3_data_3 : tlb__GEN_620; // @[]
  wire [40:0] tlb__GEN_623 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_4_data_1 : tlb_sectored_entries_0_4_data_0
    ; // @[]
  wire [40:0] tlb__GEN_624 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_4_data_2 : tlb__GEN_623; // @[]
  wire [40:0] tlb__GEN_625 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_4_data_3 : tlb__GEN_624; // @[]
  wire [40:0] tlb__GEN_627 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_5_data_1 : tlb_sectored_entries_0_5_data_0
    ; // @[]
  wire [40:0] tlb__GEN_628 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_5_data_2 : tlb__GEN_627; // @[]
  wire [40:0] tlb__GEN_629 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_5_data_3 : tlb__GEN_628; // @[]
  wire [40:0] tlb__GEN_631 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_6_data_1 : tlb_sectored_entries_0_6_data_0
    ; // @[]
  wire [40:0] tlb__GEN_632 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_6_data_2 : tlb__GEN_631; // @[]
  wire [40:0] tlb__GEN_633 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_6_data_3 : tlb__GEN_632; // @[]
  wire [40:0] tlb__GEN_635 = 2'h1 == tlb_hitsVec_idx ? tlb_sectored_entries_0_7_data_1 : tlb_sectored_entries_0_7_data_0
    ; // @[]
  wire [40:0] tlb__GEN_636 = 2'h2 == tlb_hitsVec_idx ? tlb_sectored_entries_0_7_data_2 : tlb__GEN_635; // @[]
  wire [40:0] tlb__GEN_637 = 2'h3 == tlb_hitsVec_idx ? tlb_sectored_entries_0_7_data_3 : tlb__GEN_636; // @[]
  wire  tlb__entries_T_203 = tlb_superpage_entries_0_data_0[19]; // @[TLB.scala 102:77]
  wire  tlb__entries_T_225 = tlb_superpage_entries_1_data_0[19]; // @[TLB.scala 102:77]
  wire  tlb__entries_T_247 = tlb_superpage_entries_2_data_0[19]; // @[TLB.scala 102:77]
  wire  tlb__entries_T_269 = tlb_superpage_entries_3_data_0[19]; // @[TLB.scala 102:77]
  wire [1:0] tlb_ppn_res = tlb_entries_barrier_8_io_y_ppn[19:18]; // @[TLB.scala 123:26]
  wire [26:0] tlb__ppn_T_1 = tlb__superpage_hits_ignore_T_1 ? tlb_vpn : 27'h0; // @[TLB.scala 126:28]
  wire [26:0] _GEN_417 = {{7'd0}, tlb_entries_barrier_8_io_y_ppn}; // @[TLB.scala 126:47]
  wire [26:0] tlb__ppn_T_2 = tlb__ppn_T_1 | _GEN_417; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_3 = tlb__ppn_T_2[17:9]; // @[TLB.scala 126:58]
  wire [26:0] tlb__ppn_T_6 = tlb_vpn | _GEN_417; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_7 = tlb__ppn_T_6[8:0]; // @[TLB.scala 126:58]
  wire [19:0] tlb__ppn_T_8 = {tlb_ppn_res,tlb__ppn_T_3,tlb__ppn_T_7}; // @[Cat.scala 31:58]
  wire [1:0] tlb_ppn_res_1 = tlb_entries_barrier_9_io_y_ppn[19:18]; // @[TLB.scala 123:26]
  wire [26:0] tlb__ppn_T_9 = tlb__superpage_hits_ignore_T_4 ? tlb_vpn : 27'h0; // @[TLB.scala 126:28]
  wire [26:0] _GEN_419 = {{7'd0}, tlb_entries_barrier_9_io_y_ppn}; // @[TLB.scala 126:47]
  wire [26:0] tlb__ppn_T_10 = tlb__ppn_T_9 | _GEN_419; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_11 = tlb__ppn_T_10[17:9]; // @[TLB.scala 126:58]
  wire [26:0] tlb__ppn_T_14 = tlb_vpn | _GEN_419; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_15 = tlb__ppn_T_14[8:0]; // @[TLB.scala 126:58]
  wire [19:0] tlb__ppn_T_16 = {tlb_ppn_res_1,tlb__ppn_T_11,tlb__ppn_T_15}; // @[Cat.scala 31:58]
  wire [1:0] tlb_ppn_res_2 = tlb_entries_barrier_10_io_y_ppn[19:18]; // @[TLB.scala 123:26]
  wire [26:0] tlb__ppn_T_17 = tlb__superpage_hits_ignore_T_7 ? tlb_vpn : 27'h0; // @[TLB.scala 126:28]
  wire [26:0] _GEN_421 = {{7'd0}, tlb_entries_barrier_10_io_y_ppn}; // @[TLB.scala 126:47]
  wire [26:0] tlb__ppn_T_18 = tlb__ppn_T_17 | _GEN_421; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_19 = tlb__ppn_T_18[17:9]; // @[TLB.scala 126:58]
  wire [26:0] tlb__ppn_T_22 = tlb_vpn | _GEN_421; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_23 = tlb__ppn_T_22[8:0]; // @[TLB.scala 126:58]
  wire [19:0] tlb__ppn_T_24 = {tlb_ppn_res_2,tlb__ppn_T_19,tlb__ppn_T_23}; // @[Cat.scala 31:58]
  wire [1:0] tlb_ppn_res_3 = tlb_entries_barrier_11_io_y_ppn[19:18]; // @[TLB.scala 123:26]
  wire [26:0] tlb__ppn_T_25 = tlb__superpage_hits_ignore_T_10 ? tlb_vpn : 27'h0; // @[TLB.scala 126:28]
  wire [26:0] _GEN_423 = {{7'd0}, tlb_entries_barrier_11_io_y_ppn}; // @[TLB.scala 126:47]
  wire [26:0] tlb__ppn_T_26 = tlb__ppn_T_25 | _GEN_423; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_27 = tlb__ppn_T_26[17:9]; // @[TLB.scala 126:58]
  wire [26:0] tlb__ppn_T_30 = tlb_vpn | _GEN_423; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_31 = tlb__ppn_T_30[8:0]; // @[TLB.scala 126:58]
  wire [19:0] tlb__ppn_T_32 = {tlb_ppn_res_3,tlb__ppn_T_27,tlb__ppn_T_31}; // @[Cat.scala 31:58]
  wire [1:0] tlb_ppn_res_4 = tlb_entries_barrier_12_io_y_ppn[19:18]; // @[TLB.scala 123:26]
  wire [26:0] _GEN_425 = {{7'd0}, tlb_entries_barrier_12_io_y_ppn}; // @[TLB.scala 126:47]
  wire [26:0] tlb__ppn_T_34 = tlb__mpu_ppn_T_23 | _GEN_425; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_35 = tlb__ppn_T_34[17:9]; // @[TLB.scala 126:58]
  wire [26:0] tlb__ppn_T_38 = tlb__mpu_ppn_T_27 | _GEN_425; // @[TLB.scala 126:47]
  wire [8:0] tlb__ppn_T_39 = tlb__ppn_T_38[8:0]; // @[TLB.scala 126:58]
  wire [19:0] tlb__ppn_T_40 = {tlb_ppn_res_4,tlb__ppn_T_35,tlb__ppn_T_39}; // @[Cat.scala 31:58]
  wire [19:0] tlb__ppn_T_41 = tlb_vpn[19:0]; // @[TLB.scala 312:125]
  wire [19:0] tlb__ppn_T_42 = tlb_hitsVec_0 ? tlb_entries_barrier_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_43 = tlb_hitsVec_1 ? tlb_entries_barrier_1_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_44 = tlb_hitsVec_2 ? tlb_entries_barrier_2_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_45 = tlb_hitsVec_3 ? tlb_entries_barrier_3_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_46 = tlb_hitsVec_4 ? tlb_entries_barrier_4_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_47 = tlb_hitsVec_5 ? tlb_entries_barrier_5_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_48 = tlb_hitsVec_6 ? tlb_entries_barrier_6_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_49 = tlb_hitsVec_7 ? tlb_entries_barrier_7_io_y_ppn : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_50 = tlb_hitsVec_8 ? tlb__ppn_T_8 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_51 = tlb_hitsVec_9 ? tlb__ppn_T_16 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_52 = tlb_hitsVec_10 ? tlb__ppn_T_24 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_53 = tlb_hitsVec_11 ? tlb__ppn_T_32 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_54 = tlb_hitsVec_12 ? tlb__ppn_T_40 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_55 = tlb__hits_T ? tlb__ppn_T_41 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_56 = tlb__ppn_T_42 | tlb__ppn_T_43; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_57 = tlb__ppn_T_56 | tlb__ppn_T_44; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_58 = tlb__ppn_T_57 | tlb__ppn_T_45; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_59 = tlb__ppn_T_58 | tlb__ppn_T_46; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_60 = tlb__ppn_T_59 | tlb__ppn_T_47; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_61 = tlb__ppn_T_60 | tlb__ppn_T_48; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_62 = tlb__ppn_T_61 | tlb__ppn_T_49; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_63 = tlb__ppn_T_62 | tlb__ppn_T_50; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_64 = tlb__ppn_T_63 | tlb__ppn_T_51; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_65 = tlb__ppn_T_64 | tlb__ppn_T_52; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_66 = tlb__ppn_T_65 | tlb__ppn_T_53; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_67 = tlb__ppn_T_66 | tlb__ppn_T_54; // @[Mux.scala 27:73]
  wire [19:0] tlb__ppn_T_68 = tlb__ppn_T_67 | tlb__ppn_T_55; // @[Mux.scala 27:73]
  wire [5:0] tlb_ptw_ae_array_lo = {tlb_entries_barrier_5_io_y_ae_ptw,tlb_entries_barrier_4_io_y_ae_ptw,
    tlb_entries_barrier_3_io_y_ae_ptw,tlb_entries_barrier_2_io_y_ae_ptw,tlb_entries_barrier_1_io_y_ae_ptw,
    tlb_entries_barrier_io_y_ae_ptw}; // @[Cat.scala 31:58]
  wire [13:0] tlb_ptw_ae_array = {1'h0,tlb_entries_barrier_12_io_y_ae_ptw,tlb_entries_barrier_11_io_y_ae_ptw,
    tlb_entries_barrier_10_io_y_ae_ptw,tlb_entries_barrier_9_io_y_ae_ptw,tlb_entries_barrier_8_io_y_ae_ptw,
    tlb_entries_barrier_7_io_y_ae_ptw,tlb_entries_barrier_6_io_y_ae_ptw,tlb_ptw_ae_array_lo}; // @[Cat.scala 31:58]
  wire [5:0] tlb_final_ae_array_lo = {tlb_entries_barrier_5_io_y_ae_final,tlb_entries_barrier_4_io_y_ae_final,
    tlb_entries_barrier_3_io_y_ae_final,tlb_entries_barrier_2_io_y_ae_final,tlb_entries_barrier_1_io_y_ae_final,
    tlb_entries_barrier_io_y_ae_final}; // @[Cat.scala 31:58]
  wire [13:0] tlb_final_ae_array = {1'h0,tlb_entries_barrier_12_io_y_ae_final,tlb_entries_barrier_11_io_y_ae_final,
    tlb_entries_barrier_10_io_y_ae_final,tlb_entries_barrier_9_io_y_ae_final,tlb_entries_barrier_8_io_y_ae_final,
    tlb_entries_barrier_7_io_y_ae_final,tlb_entries_barrier_6_io_y_ae_final,tlb_final_ae_array_lo}; // @[Cat.scala 31:58]
  wire [5:0] tlb_ptw_pf_array_lo = {tlb_entries_barrier_5_io_y_pf,tlb_entries_barrier_4_io_y_pf,
    tlb_entries_barrier_3_io_y_pf,tlb_entries_barrier_2_io_y_pf,tlb_entries_barrier_1_io_y_pf,
    tlb_entries_barrier_io_y_pf}; // @[Cat.scala 31:58]
  wire [13:0] tlb_ptw_pf_array = {1'h0,tlb_entries_barrier_12_io_y_pf,tlb_entries_barrier_11_io_y_pf,
    tlb_entries_barrier_10_io_y_pf,tlb_entries_barrier_9_io_y_pf,tlb_entries_barrier_8_io_y_pf,
    tlb_entries_barrier_7_io_y_pf,tlb_entries_barrier_6_io_y_pf,tlb_ptw_pf_array_lo}; // @[Cat.scala 31:58]
  wire [5:0] tlb_ptw_gf_array_lo = {tlb_entries_barrier_5_io_y_gf,tlb_entries_barrier_4_io_y_gf,
    tlb_entries_barrier_3_io_y_gf,tlb_entries_barrier_2_io_y_gf,tlb_entries_barrier_1_io_y_gf,
    tlb_entries_barrier_io_y_gf}; // @[Cat.scala 31:58]
  wire [13:0] tlb_ptw_gf_array = {1'h0,tlb_entries_barrier_12_io_y_gf,tlb_entries_barrier_11_io_y_gf,
    tlb_entries_barrier_10_io_y_gf,tlb_entries_barrier_9_io_y_gf,tlb_entries_barrier_8_io_y_gf,
    tlb_entries_barrier_7_io_y_gf,tlb_entries_barrier_6_io_y_gf,tlb_ptw_gf_array_lo}; // @[Cat.scala 31:58]
  wire  tlb__priv_rw_ok_T = ~tlb_priv_s; // @[TLB.scala 320:24]
  wire  tlb__priv_rw_ok_T_1 = tlb__priv_rw_ok_T | tlb_io_ptw_status_sum; // @[TLB.scala 320:32]
  wire [5:0] tlb_priv_rw_ok_lo = {tlb_entries_barrier_5_io_y_u,tlb_entries_barrier_4_io_y_u,tlb_entries_barrier_3_io_y_u
    ,tlb_entries_barrier_2_io_y_u,tlb_entries_barrier_1_io_y_u,tlb_entries_barrier_io_y_u}; // @[Cat.scala 31:58]
  wire [12:0] tlb__priv_rw_ok_T_2 = {tlb_entries_barrier_12_io_y_u,tlb_entries_barrier_11_io_y_u,
    tlb_entries_barrier_10_io_y_u,tlb_entries_barrier_9_io_y_u,tlb_entries_barrier_8_io_y_u,tlb_entries_barrier_7_io_y_u
    ,tlb_entries_barrier_6_io_y_u,tlb_priv_rw_ok_lo}; // @[Cat.scala 31:58]
  wire [12:0] tlb__priv_rw_ok_T_3 = tlb__priv_rw_ok_T_1 ? tlb__priv_rw_ok_T_2 : 13'h0; // @[TLB.scala 320:23]
  wire [12:0] tlb__priv_rw_ok_T_5 = ~tlb__priv_rw_ok_T_2; // @[TLB.scala 320:84]
  wire [12:0] tlb__priv_rw_ok_T_6 = tlb_priv_s ? tlb__priv_rw_ok_T_5 : 13'h0; // @[TLB.scala 320:75]
  wire [12:0] tlb_priv_rw_ok = tlb__priv_rw_ok_T_3 | tlb__priv_rw_ok_T_6; // @[TLB.scala 320:70]
  wire [5:0] tlb_r_array_lo = {tlb_entries_barrier_5_io_y_sr,tlb_entries_barrier_4_io_y_sr,tlb_entries_barrier_3_io_y_sr
    ,tlb_entries_barrier_2_io_y_sr,tlb_entries_barrier_1_io_y_sr,tlb_entries_barrier_io_y_sr}; // @[Cat.scala 31:58]
  wire [12:0] tlb__r_array_T = {tlb_entries_barrier_12_io_y_sr,tlb_entries_barrier_11_io_y_sr,
    tlb_entries_barrier_10_io_y_sr,tlb_entries_barrier_9_io_y_sr,tlb_entries_barrier_8_io_y_sr,
    tlb_entries_barrier_7_io_y_sr,tlb_entries_barrier_6_io_y_sr,tlb_r_array_lo}; // @[Cat.scala 31:58]
  wire [5:0] tlb_r_array_lo_1 = {tlb_entries_barrier_5_io_y_sx,tlb_entries_barrier_4_io_y_sx,
    tlb_entries_barrier_3_io_y_sx,tlb_entries_barrier_2_io_y_sx,tlb_entries_barrier_1_io_y_sx,
    tlb_entries_barrier_io_y_sx}; // @[Cat.scala 31:58]
  wire [12:0] tlb__r_array_T_1 = {tlb_entries_barrier_12_io_y_sx,tlb_entries_barrier_11_io_y_sx,
    tlb_entries_barrier_10_io_y_sx,tlb_entries_barrier_9_io_y_sx,tlb_entries_barrier_8_io_y_sx,
    tlb_entries_barrier_7_io_y_sx,tlb_entries_barrier_6_io_y_sx,tlb_r_array_lo_1}; // @[Cat.scala 31:58]
  wire [12:0] tlb__r_array_T_2 = tlb_io_ptw_status_mxr ? tlb__r_array_T_1 : 13'h0; // @[TLB.scala 324:74]
  wire [12:0] tlb__r_array_T_3 = tlb__r_array_T | tlb__r_array_T_2; // @[TLB.scala 324:69]
  wire [12:0] tlb__r_array_T_4 = tlb_priv_rw_ok & tlb__r_array_T_3; // @[TLB.scala 324:41]
  wire [13:0] tlb_r_array = {1'h1,tlb__r_array_T_4}; // @[Cat.scala 31:58]
  wire [5:0] tlb_w_array_lo = {tlb_entries_barrier_5_io_y_sw,tlb_entries_barrier_4_io_y_sw,tlb_entries_barrier_3_io_y_sw
    ,tlb_entries_barrier_2_io_y_sw,tlb_entries_barrier_1_io_y_sw,tlb_entries_barrier_io_y_sw}; // @[Cat.scala 31:58]
  wire [12:0] tlb__w_array_T = {tlb_entries_barrier_12_io_y_sw,tlb_entries_barrier_11_io_y_sw,
    tlb_entries_barrier_10_io_y_sw,tlb_entries_barrier_9_io_y_sw,tlb_entries_barrier_8_io_y_sw,
    tlb_entries_barrier_7_io_y_sw,tlb_entries_barrier_6_io_y_sw,tlb_w_array_lo}; // @[Cat.scala 31:58]
  wire [12:0] tlb__w_array_T_1 = tlb_priv_rw_ok & tlb__w_array_T; // @[TLB.scala 325:41]
  wire [13:0] tlb_w_array = {1'h1,tlb__w_array_T_1}; // @[Cat.scala 31:58]
  wire [1:0] tlb__pr_array_T_1 = tlb_prot_r ? 2'h3 : 2'h0; // @[Bitwise.scala 74:12]
  wire [5:0] tlb_pr_array_lo = {tlb_entries_barrier_5_io_y_pr,tlb_entries_barrier_4_io_y_pr,
    tlb_entries_barrier_3_io_y_pr,tlb_entries_barrier_2_io_y_pr,tlb_entries_barrier_1_io_y_pr,
    tlb_entries_barrier_io_y_pr}; // @[Cat.scala 31:58]
  wire [13:0] tlb__pr_array_T_3 = {tlb__pr_array_T_1,tlb_entries_barrier_11_io_y_pr,tlb_entries_barrier_10_io_y_pr,
    tlb_entries_barrier_9_io_y_pr,tlb_entries_barrier_8_io_y_pr,tlb_entries_barrier_7_io_y_pr,
    tlb_entries_barrier_6_io_y_pr,tlb_pr_array_lo}; // @[Cat.scala 31:58]
  wire [13:0] tlb__pr_array_T_4 = tlb_ptw_ae_array | tlb_final_ae_array; // @[TLB.scala 331:104]
  wire [13:0] tlb__pr_array_T_5 = ~tlb__pr_array_T_4; // @[TLB.scala 331:89]
  wire [13:0] tlb_pr_array = tlb__pr_array_T_3 & tlb__pr_array_T_5; // @[TLB.scala 331:87]
  wire [1:0] tlb__pw_array_T_1 = tlb_prot_w ? 2'h3 : 2'h0; // @[Bitwise.scala 74:12]
  wire [5:0] tlb_pw_array_lo = {tlb_entries_barrier_5_io_y_pw,tlb_entries_barrier_4_io_y_pw,
    tlb_entries_barrier_3_io_y_pw,tlb_entries_barrier_2_io_y_pw,tlb_entries_barrier_1_io_y_pw,
    tlb_entries_barrier_io_y_pw}; // @[Cat.scala 31:58]
  wire [13:0] tlb__pw_array_T_3 = {tlb__pw_array_T_1,tlb_entries_barrier_11_io_y_pw,tlb_entries_barrier_10_io_y_pw,
    tlb_entries_barrier_9_io_y_pw,tlb_entries_barrier_8_io_y_pw,tlb_entries_barrier_7_io_y_pw,
    tlb_entries_barrier_6_io_y_pw,tlb_pw_array_lo}; // @[Cat.scala 31:58]
  wire [13:0] tlb_pw_array = tlb__pw_array_T_3 & tlb__pr_array_T_5; // @[TLB.scala 332:87]
  wire [1:0] tlb__eff_array_T_1 = tlb_prot_eff ? 2'h3 : 2'h0; // @[Bitwise.scala 74:12]
  wire [5:0] tlb_eff_array_lo = {tlb_entries_barrier_5_io_y_eff,tlb_entries_barrier_4_io_y_eff,
    tlb_entries_barrier_3_io_y_eff,tlb_entries_barrier_2_io_y_eff,tlb_entries_barrier_1_io_y_eff,
    tlb_entries_barrier_io_y_eff}; // @[Cat.scala 31:58]
  wire [13:0] tlb_eff_array = {tlb__eff_array_T_1,tlb_entries_barrier_11_io_y_eff,tlb_entries_barrier_10_io_y_eff,
    tlb_entries_barrier_9_io_y_eff,tlb_entries_barrier_8_io_y_eff,tlb_entries_barrier_7_io_y_eff,
    tlb_entries_barrier_6_io_y_eff,tlb_eff_array_lo}; // @[Cat.scala 31:58]
  wire [1:0] tlb__c_array_T_1 = tlb__cacheable_T_13 ? 2'h3 : 2'h0; // @[Bitwise.scala 74:12]
  wire [5:0] tlb_c_array_lo = {tlb_entries_barrier_5_io_y_c,tlb_entries_barrier_4_io_y_c,tlb_entries_barrier_3_io_y_c,
    tlb_entries_barrier_2_io_y_c,tlb_entries_barrier_1_io_y_c,tlb_entries_barrier_io_y_c}; // @[Cat.scala 31:58]
  wire [13:0] tlb_c_array = {tlb__c_array_T_1,tlb_entries_barrier_11_io_y_c,tlb_entries_barrier_10_io_y_c,
    tlb_entries_barrier_9_io_y_c,tlb_entries_barrier_8_io_y_c,tlb_entries_barrier_7_io_y_c,tlb_entries_barrier_6_io_y_c,
    tlb_c_array_lo}; // @[Cat.scala 31:58]
  wire [1:0] tlb__ppp_array_T_1 = tlb__prot_w_T_31 ? 2'h3 : 2'h0; // @[Bitwise.scala 74:12]
  wire [5:0] tlb_ppp_array_lo = {tlb_entries_barrier_5_io_y_ppp,tlb_entries_barrier_4_io_y_ppp,
    tlb_entries_barrier_3_io_y_ppp,tlb_entries_barrier_2_io_y_ppp,tlb_entries_barrier_1_io_y_ppp,
    tlb_entries_barrier_io_y_ppp}; // @[Cat.scala 31:58]
  wire [13:0] tlb_ppp_array = {tlb__ppp_array_T_1,tlb_entries_barrier_11_io_y_ppp,tlb_entries_barrier_10_io_y_ppp,
    tlb_entries_barrier_9_io_y_ppp,tlb_entries_barrier_8_io_y_ppp,tlb_entries_barrier_7_io_y_ppp,
    tlb_entries_barrier_6_io_y_ppp,tlb_ppp_array_lo}; // @[Cat.scala 31:58]
  wire [1:0] tlb__paa_array_T_1 = tlb_prot_al ? 2'h3 : 2'h0; // @[Bitwise.scala 74:12]
  wire [5:0] tlb_paa_array_lo = {tlb_entries_barrier_5_io_y_paa,tlb_entries_barrier_4_io_y_paa,
    tlb_entries_barrier_3_io_y_paa,tlb_entries_barrier_2_io_y_paa,tlb_entries_barrier_1_io_y_paa,
    tlb_entries_barrier_io_y_paa}; // @[Cat.scala 31:58]
  wire [13:0] tlb_paa_array = {tlb__paa_array_T_1,tlb_entries_barrier_11_io_y_paa,tlb_entries_barrier_10_io_y_paa,
    tlb_entries_barrier_9_io_y_paa,tlb_entries_barrier_8_io_y_paa,tlb_entries_barrier_7_io_y_paa,
    tlb_entries_barrier_6_io_y_paa,tlb_paa_array_lo}; // @[Cat.scala 31:58]
  wire [5:0] tlb_pal_array_lo = {tlb_entries_barrier_5_io_y_pal,tlb_entries_barrier_4_io_y_pal,
    tlb_entries_barrier_3_io_y_pal,tlb_entries_barrier_2_io_y_pal,tlb_entries_barrier_1_io_y_pal,
    tlb_entries_barrier_io_y_pal}; // @[Cat.scala 31:58]
  wire [13:0] tlb_pal_array = {tlb__paa_array_T_1,tlb_entries_barrier_11_io_y_pal,tlb_entries_barrier_10_io_y_pal,
    tlb_entries_barrier_9_io_y_pal,tlb_entries_barrier_8_io_y_pal,tlb_entries_barrier_7_io_y_pal,
    tlb_entries_barrier_6_io_y_pal,tlb_pal_array_lo}; // @[Cat.scala 31:58]
  wire [13:0] tlb_ppp_array_if_cached = tlb_ppp_array | tlb_c_array; // @[TLB.scala 339:39]
  wire [13:0] tlb_paa_array_if_cached = tlb_paa_array | tlb_c_array; // @[TLB.scala 340:39]
  wire [13:0] tlb_pal_array_if_cached = tlb_pal_array | tlb_c_array; // @[TLB.scala 341:39]
  wire [3:0] tlb__misaligned_T = 4'h1 << tlb_io_req_bits_size; // @[OneHot.scala 57:35]
  wire [3:0] tlb__misaligned_T_2 = tlb__misaligned_T - 4'h1; // @[TLB.scala 344:69]
  wire [39:0] _GEN_427 = {{36'd0}, tlb__misaligned_T_2}; // @[TLB.scala 344:39]
  wire [39:0] tlb__misaligned_T_3 = tlb_io_req_bits_vaddr & _GEN_427; // @[TLB.scala 344:39]
  wire  tlb_misaligned = |tlb__misaligned_T_3; // @[TLB.scala 344:75]
  wire  tlb__bad_va_T = tlb_vm_enabled & tlb__stage1_en_T; // @[TLB.scala 362:21]
  wire [39:0] tlb_bad_va_maskedVAddr = tlb_io_req_bits_vaddr & 40'hc000000000; // @[TLB.scala 353:43]
  wire  tlb__bad_va_T_2 = tlb_bad_va_maskedVAddr == 40'h0; // @[TLB.scala 354:49]
  wire  tlb__bad_va_T_3 = tlb_bad_va_maskedVAddr == 40'hc000000000; // @[TLB.scala 354:80]
  wire  tlb__bad_va_T_5 = tlb__bad_va_T_2 | tlb__bad_va_T_3; // @[TLB.scala 354:55]
  wire  tlb__bad_va_T_6 = ~tlb__bad_va_T_5; // @[TLB.scala 354:35]
  wire  tlb_bad_va = tlb__bad_va_T & tlb__bad_va_T_6; // @[TLB.scala 362:34]
  wire  tlb__cmd_lrsc_T = tlb_io_req_bits_cmd == 5'h6; // @[package.scala 15:47]
  wire  tlb__cmd_lrsc_T_1 = tlb_io_req_bits_cmd == 5'h7; // @[package.scala 15:47]
  wire  tlb__cmd_lrsc_T_2 = tlb__cmd_lrsc_T | tlb__cmd_lrsc_T_1; // @[package.scala 72:59]
  wire  tlb__cmd_amo_logical_T = tlb_io_req_bits_cmd == 5'h4; // @[package.scala 15:47]
  wire  tlb__cmd_amo_logical_T_1 = tlb_io_req_bits_cmd == 5'h9; // @[package.scala 15:47]
  wire  tlb__cmd_amo_logical_T_2 = tlb_io_req_bits_cmd == 5'ha; // @[package.scala 15:47]
  wire  tlb__cmd_amo_logical_T_3 = tlb_io_req_bits_cmd == 5'hb; // @[package.scala 15:47]
  wire  tlb__cmd_amo_logical_T_4 = tlb__cmd_amo_logical_T | tlb__cmd_amo_logical_T_1; // @[package.scala 72:59]
  wire  tlb__cmd_amo_logical_T_5 = tlb__cmd_amo_logical_T_4 | tlb__cmd_amo_logical_T_2; // @[package.scala 72:59]
  wire  tlb__cmd_amo_logical_T_6 = tlb__cmd_amo_logical_T_5 | tlb__cmd_amo_logical_T_3; // @[package.scala 72:59]
  wire  tlb__cmd_amo_arithmetic_T = tlb_io_req_bits_cmd == 5'h8; // @[package.scala 15:47]
  wire  tlb__cmd_amo_arithmetic_T_1 = tlb_io_req_bits_cmd == 5'hc; // @[package.scala 15:47]
  wire  tlb__cmd_amo_arithmetic_T_2 = tlb_io_req_bits_cmd == 5'hd; // @[package.scala 15:47]
  wire  tlb__cmd_amo_arithmetic_T_3 = tlb_io_req_bits_cmd == 5'he; // @[package.scala 15:47]
  wire  tlb__cmd_amo_arithmetic_T_4 = tlb_io_req_bits_cmd == 5'hf; // @[package.scala 15:47]
  wire  tlb__cmd_amo_arithmetic_T_5 = tlb__cmd_amo_arithmetic_T | tlb__cmd_amo_arithmetic_T_1; // @[package.scala 72:59]
  wire  tlb__cmd_amo_arithmetic_T_6 = tlb__cmd_amo_arithmetic_T_5 | tlb__cmd_amo_arithmetic_T_2; // @[package.scala 72:59]
  wire  tlb__cmd_amo_arithmetic_T_7 = tlb__cmd_amo_arithmetic_T_6 | tlb__cmd_amo_arithmetic_T_3; // @[package.scala 72:59]
  wire  tlb__cmd_amo_arithmetic_T_8 = tlb__cmd_amo_arithmetic_T_7 | tlb__cmd_amo_arithmetic_T_4; // @[package.scala 72:59]
  wire  tlb_cmd_put_partial = tlb_io_req_bits_cmd == 5'h11; // @[TLB.scala 367:41]
  wire  tlb__cmd_read_T = tlb_io_req_bits_cmd == 5'h0; // @[package.scala 15:47]
  wire  tlb__cmd_read_T_1 = tlb_io_req_bits_cmd == 5'h10; // @[package.scala 15:47]
  wire  tlb__cmd_read_T_4 = tlb__cmd_read_T | tlb__cmd_read_T_1; // @[package.scala 72:59]
  wire  tlb__cmd_read_T_5 = tlb__cmd_read_T_4 | tlb__cmd_lrsc_T; // @[package.scala 72:59]
  wire  tlb__cmd_read_T_6 = tlb__cmd_read_T_5 | tlb__cmd_lrsc_T_1; // @[package.scala 72:59]
  wire  tlb__cmd_read_T_23 = tlb__cmd_amo_logical_T_6 | tlb__cmd_amo_arithmetic_T_8; // @[Consts.scala 83:44]
  wire  tlb_cmd_read = tlb__cmd_read_T_6 | tlb__cmd_read_T_23; // @[Consts.scala 85:68]
  wire  tlb__cmd_write_T = tlb_io_req_bits_cmd == 5'h1; // @[Consts.scala 86:32]
  wire  tlb__cmd_write_T_2 = tlb__cmd_write_T | tlb_cmd_put_partial; // @[Consts.scala 86:42]
  wire  tlb__cmd_write_T_4 = tlb__cmd_write_T_2 | tlb__cmd_lrsc_T_1; // @[Consts.scala 86:59]
  wire  tlb_cmd_write = tlb__cmd_write_T_4 | tlb__cmd_read_T_23; // @[Consts.scala 86:76]
  wire  tlb__cmd_write_perms_T = tlb_io_req_bits_cmd == 5'h5; // @[package.scala 15:47]
  wire  tlb__cmd_write_perms_T_1 = tlb_io_req_bits_cmd == 5'h17; // @[package.scala 15:47]
  wire  tlb__cmd_write_perms_T_2 = tlb__cmd_write_perms_T | tlb__cmd_write_perms_T_1; // @[package.scala 72:59]
  wire  tlb_cmd_write_perms = tlb_cmd_write | tlb__cmd_write_perms_T_2; // @[TLB.scala 371:35]
  wire [13:0] tlb__ae_array_T = tlb_misaligned ? tlb_eff_array : 14'h0; // @[TLB.scala 376:8]
  wire [13:0] tlb__ae_array_T_1 = ~tlb_c_array; // @[TLB.scala 377:19]
  wire [13:0] tlb__ae_array_T_2 = tlb__cmd_lrsc_T_2 ? tlb__ae_array_T_1 : 14'h0; // @[TLB.scala 377:8]
  wire [13:0] tlb_ae_array = tlb__ae_array_T | tlb__ae_array_T_2; // @[TLB.scala 376:37]
  wire [13:0] tlb__ae_ld_array_T = ~tlb_pr_array; // @[TLB.scala 378:46]
  wire [13:0] tlb__ae_ld_array_T_1 = tlb_ae_array | tlb__ae_ld_array_T; // @[TLB.scala 378:44]
  wire [13:0] tlb_ae_ld_array = tlb_cmd_read ? tlb__ae_ld_array_T_1 : 14'h0; // @[TLB.scala 378:24]
  wire [13:0] tlb__ae_st_array_T = ~tlb_pw_array; // @[TLB.scala 380:37]
  wire [13:0] tlb__ae_st_array_T_1 = tlb_ae_array | tlb__ae_st_array_T; // @[TLB.scala 380:35]
  wire [13:0] tlb__ae_st_array_T_2 = tlb_cmd_write_perms ? tlb__ae_st_array_T_1 : 14'h0; // @[TLB.scala 380:8]
  wire [13:0] tlb__ae_st_array_T_3 = ~tlb_ppp_array_if_cached; // @[TLB.scala 381:26]
  wire [13:0] tlb__ae_st_array_T_4 = tlb_cmd_put_partial ? tlb__ae_st_array_T_3 : 14'h0; // @[TLB.scala 381:8]
  wire [13:0] tlb__ae_st_array_T_5 = tlb__ae_st_array_T_2 | tlb__ae_st_array_T_4; // @[TLB.scala 380:53]
  wire [13:0] tlb__ae_st_array_T_6 = ~tlb_pal_array_if_cached; // @[TLB.scala 382:26]
  wire [13:0] tlb__ae_st_array_T_7 = tlb__cmd_amo_logical_T_6 ? tlb__ae_st_array_T_6 : 14'h0; // @[TLB.scala 382:8]
  wire [13:0] tlb__ae_st_array_T_8 = tlb__ae_st_array_T_5 | tlb__ae_st_array_T_7; // @[TLB.scala 381:53]
  wire [13:0] tlb__ae_st_array_T_9 = ~tlb_paa_array_if_cached; // @[TLB.scala 383:29]
  wire [13:0] tlb__ae_st_array_T_10 = tlb__cmd_amo_arithmetic_T_8 ? tlb__ae_st_array_T_9 : 14'h0; // @[TLB.scala 383:8]
  wire [13:0] tlb_ae_st_array = tlb__ae_st_array_T_8 | tlb__ae_st_array_T_10; // @[TLB.scala 382:53]
  wire [13:0] tlb__pf_ld_array_T_1 = ~tlb_r_array; // @[TLB.scala 389:37]
  wire [13:0] tlb__pf_ld_array_T_2 = ~tlb_ptw_ae_array; // @[TLB.scala 389:73]
  wire [13:0] tlb__pf_ld_array_T_3 = tlb__pf_ld_array_T_1 & tlb__pf_ld_array_T_2; // @[TLB.scala 389:71]
  wire [13:0] tlb__pf_ld_array_T_4 = tlb__pf_ld_array_T_3 | tlb_ptw_pf_array; // @[TLB.scala 389:88]
  wire [13:0] tlb__pf_ld_array_T_5 = ~tlb_ptw_gf_array; // @[TLB.scala 389:106]
  wire [13:0] tlb__pf_ld_array_T_6 = tlb__pf_ld_array_T_4 & tlb__pf_ld_array_T_5; // @[TLB.scala 389:104]
  wire [13:0] tlb_pf_ld_array = tlb_cmd_read ? tlb__pf_ld_array_T_6 : 14'h0; // @[TLB.scala 389:24]
  wire [13:0] tlb__pf_st_array_T = ~tlb_w_array; // @[TLB.scala 390:44]
  wire [13:0] tlb__pf_st_array_T_2 = tlb__pf_st_array_T & tlb__pf_ld_array_T_2; // @[TLB.scala 390:53]
  wire [13:0] tlb__pf_st_array_T_3 = tlb__pf_st_array_T_2 | tlb_ptw_pf_array; // @[TLB.scala 390:70]
  wire [13:0] tlb__pf_st_array_T_5 = tlb__pf_st_array_T_3 & tlb__pf_ld_array_T_5; // @[TLB.scala 390:86]
  wire [13:0] tlb_pf_st_array = tlb_cmd_write_perms ? tlb__pf_st_array_T_5 : 14'h0; // @[TLB.scala 390:24]
  wire  tlb_tlb_hit_if_not_gpa_miss = |tlb_real_hits; // @[TLB.scala 402:43]
  wire  tlb__tlb_miss_T_2 = ~tlb_bad_va; // @[TLB.scala 405:56]
  wire  tlb__tlb_miss_T_3 = tlb_vm_enabled & tlb__tlb_miss_T_2; // @[TLB.scala 405:53]
  wire  tlb__tlb_miss_T_4 = ~tlb_tlb_hit_if_not_gpa_miss; // @[TLB.scala 405:67]
  wire  tlb_tlb_miss = tlb__tlb_miss_T_3 & tlb__tlb_miss_T_4; // @[TLB.scala 405:64]
  reg [6:0] tlb_state_vec_0; // @[Replacement.scala 305:17]
  reg [2:0] tlb_state_reg_1; // @[Replacement.scala 168:70]
  wire  tlb__T_23 = tlb_io_req_valid & tlb_vm_enabled; // @[TLB.scala 409:22]
  wire  tlb__T_24 = tlb_sector_hits_0 | tlb_sector_hits_1; // @[package.scala 72:59]
  wire  tlb__T_25 = tlb__T_24 | tlb_sector_hits_2; // @[package.scala 72:59]
  wire  tlb__T_26 = tlb__T_25 | tlb_sector_hits_3; // @[package.scala 72:59]
  wire  tlb__T_27 = tlb__T_26 | tlb_sector_hits_4; // @[package.scala 72:59]
  wire  tlb__T_28 = tlb__T_27 | tlb_sector_hits_5; // @[package.scala 72:59]
  wire  tlb__T_29 = tlb__T_28 | tlb_sector_hits_6; // @[package.scala 72:59]
  wire  tlb__T_30 = tlb__T_29 | tlb_sector_hits_7; // @[package.scala 72:59]
  wire [7:0] tlb__T_31 = {tlb_sector_hits_7,tlb_sector_hits_6,tlb_sector_hits_5,tlb_sector_hits_4,tlb_sector_hits_3,
    tlb_sector_hits_2,tlb_sector_hits_1,tlb_sector_hits_0}; // @[Cat.scala 31:58]
  wire [3:0] tlb_hi_1 = tlb__T_31[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] tlb_lo_1 = tlb__T_31[3:0]; // @[OneHot.scala 31:18]
  wire  tlb__T_32 = |tlb_hi_1; // @[OneHot.scala 32:14]
  wire [3:0] tlb__T_33 = tlb_hi_1 | tlb_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] tlb_hi_2 = tlb__T_33[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] tlb_lo_2 = tlb__T_33[1:0]; // @[OneHot.scala 31:18]
  wire  tlb__T_34 = |tlb_hi_2; // @[OneHot.scala 32:14]
  wire [1:0] tlb__T_35 = tlb_hi_2 | tlb_lo_2; // @[OneHot.scala 32:28]
  wire  tlb__T_36 = tlb__T_35[1]; // @[CircuitMath.scala 30:8]
  wire [2:0] tlb__T_38 = {tlb__T_32,tlb__T_34,tlb__T_36}; // @[Cat.scala 31:58]
  wire  tlb__state_vec_0_set_left_older_T = tlb__T_38[2]; // @[Replacement.scala 196:43]
  wire  tlb_state_vec_0_set_left_older = ~tlb__state_vec_0_set_left_older_T; // @[Replacement.scala 196:33]
  wire [2:0] tlb_state_vec_0_left_subtree_state = tlb_state_vec_0[5:3]; // @[package.scala 154:13]
  wire [2:0] tlb_state_vec_0_right_subtree_state = tlb_state_vec_0[2:0]; // @[Replacement.scala 198:38]
  wire [1:0] tlb__state_vec_0_T = tlb__T_38[1:0]; // @[package.scala 154:13]
  wire  tlb__state_vec_0_set_left_older_T_1 = tlb__state_vec_0_T[1]; // @[Replacement.scala 196:43]
  wire  tlb_state_vec_0_set_left_older_1 = ~tlb__state_vec_0_set_left_older_T_1; // @[Replacement.scala 196:33]
  wire  tlb_state_vec_0_left_subtree_state_1 = tlb_state_vec_0_left_subtree_state[1]; // @[package.scala 154:13]
  wire  tlb_state_vec_0_right_subtree_state_1 = tlb_state_vec_0_left_subtree_state[0]; // @[Replacement.scala 198:38]
  wire  tlb__state_vec_0_T_1 = tlb__state_vec_0_T[0]; // @[package.scala 154:13]
  wire  tlb__state_vec_0_T_3 = ~tlb__state_vec_0_T_1; // @[Replacement.scala 218:7]
  wire  tlb__state_vec_0_T_4 = tlb_state_vec_0_set_left_older_1 ? tlb_state_vec_0_left_subtree_state_1 :
    tlb__state_vec_0_T_3; // @[Replacement.scala 203:16]
  wire  tlb__state_vec_0_T_8 = tlb_state_vec_0_set_left_older_1 ? tlb__state_vec_0_T_3 :
    tlb_state_vec_0_right_subtree_state_1; // @[Replacement.scala 206:16]
  wire [2:0] tlb__state_vec_0_T_9 = {tlb_state_vec_0_set_left_older_1,tlb__state_vec_0_T_4,tlb__state_vec_0_T_8}; // @[Cat.scala 31:58]
  wire [2:0] tlb__state_vec_0_T_10 = tlb_state_vec_0_set_left_older ? tlb_state_vec_0_left_subtree_state :
    tlb__state_vec_0_T_9; // @[Replacement.scala 203:16]
  wire  tlb_state_vec_0_left_subtree_state_2 = tlb_state_vec_0_right_subtree_state[1]; // @[package.scala 154:13]
  wire  tlb_state_vec_0_right_subtree_state_2 = tlb_state_vec_0_right_subtree_state[0]; // @[Replacement.scala 198:38]
  wire  tlb__state_vec_0_T_15 = tlb_state_vec_0_set_left_older_1 ? tlb_state_vec_0_left_subtree_state_2 :
    tlb__state_vec_0_T_3; // @[Replacement.scala 203:16]
  wire  tlb__state_vec_0_T_19 = tlb_state_vec_0_set_left_older_1 ? tlb__state_vec_0_T_3 :
    tlb_state_vec_0_right_subtree_state_2; // @[Replacement.scala 206:16]
  wire [2:0] tlb__state_vec_0_T_20 = {tlb_state_vec_0_set_left_older_1,tlb__state_vec_0_T_15,tlb__state_vec_0_T_19}; // @[Cat.scala 31:58]
  wire [2:0] tlb__state_vec_0_T_21 = tlb_state_vec_0_set_left_older ? tlb__state_vec_0_T_20 :
    tlb_state_vec_0_right_subtree_state; // @[Replacement.scala 206:16]
  wire [6:0] tlb__state_vec_0_T_22 = {tlb_state_vec_0_set_left_older,tlb__state_vec_0_T_10,tlb__state_vec_0_T_21}; // @[Cat.scala 31:58]
  wire  tlb__T_39 = tlb__superpage_hits_T_9 | tlb__superpage_hits_T_23; // @[package.scala 72:59]
  wire  tlb__T_40 = tlb__T_39 | tlb__superpage_hits_T_37; // @[package.scala 72:59]
  wire  tlb__T_41 = tlb__T_40 | tlb__superpage_hits_T_51; // @[package.scala 72:59]
  wire [3:0] tlb__T_42 = {tlb__superpage_hits_T_51,tlb__superpage_hits_T_37,tlb__superpage_hits_T_23,
    tlb__superpage_hits_T_9}; // @[Cat.scala 31:58]
  wire [1:0] tlb_hi_4 = tlb__T_42[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] tlb_lo_4 = tlb__T_42[1:0]; // @[OneHot.scala 31:18]
  wire  tlb__T_43 = |tlb_hi_4; // @[OneHot.scala 32:14]
  wire [1:0] tlb__T_44 = tlb_hi_4 | tlb_lo_4; // @[OneHot.scala 32:28]
  wire  tlb__T_45 = tlb__T_44[1]; // @[CircuitMath.scala 30:8]
  wire [1:0] tlb__T_46 = {tlb__T_43,tlb__T_45}; // @[Cat.scala 31:58]
  wire  tlb__state_reg_set_left_older_T = tlb__T_46[1]; // @[Replacement.scala 196:43]
  wire  tlb_state_reg_set_left_older = ~tlb__state_reg_set_left_older_T; // @[Replacement.scala 196:33]
  wire  tlb_state_reg_left_subtree_state = tlb_state_reg_1[1]; // @[package.scala 154:13]
  wire  tlb_state_reg_right_subtree_state = tlb_state_reg_1[0]; // @[Replacement.scala 198:38]
  wire  tlb__state_reg_T = tlb__T_46[0]; // @[package.scala 154:13]
  wire  tlb__state_reg_T_2 = ~tlb__state_reg_T; // @[Replacement.scala 218:7]
  wire  tlb__state_reg_T_3 = tlb_state_reg_set_left_older ? tlb_state_reg_left_subtree_state : tlb__state_reg_T_2; // @[Replacement.scala 203:16]
  wire  tlb__state_reg_T_7 = tlb_state_reg_set_left_older ? tlb__state_reg_T_2 : tlb_state_reg_right_subtree_state; // @[Replacement.scala 206:16]
  wire [2:0] tlb__state_reg_T_8 = {tlb_state_reg_set_left_older,tlb__state_reg_T_3,tlb__state_reg_T_7}; // @[Cat.scala 31:58]
  wire [5:0] tlb__multipleHits_T = tlb_real_hits[5:0]; // @[Misc.scala 180:37]
  wire [2:0] tlb__multipleHits_T_1 = tlb__multipleHits_T[2:0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_2 = tlb__multipleHits_T_1[0]; // @[Misc.scala 180:37]
  wire [1:0] tlb__multipleHits_T_3 = tlb__multipleHits_T_1[2:1]; // @[Misc.scala 181:39]
  wire  tlb__multipleHits_T_4 = tlb__multipleHits_T_3[0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_5 = tlb__multipleHits_T_3[1]; // @[Misc.scala 181:39]
  wire  tlb_multipleHits_rightOne_1 = tlb__multipleHits_T_4 | tlb__multipleHits_T_5; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_7 = tlb__multipleHits_T_4 & tlb__multipleHits_T_5; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_leftOne_2 = tlb__multipleHits_T_2 | tlb_multipleHits_rightOne_1; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_9 = tlb__multipleHits_T_2 & tlb_multipleHits_rightOne_1; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_leftTwo = tlb__multipleHits_T_7 | tlb__multipleHits_T_9; // @[Misc.scala 182:49]
  wire [2:0] tlb__multipleHits_T_10 = tlb__multipleHits_T[5:3]; // @[Misc.scala 181:39]
  wire  tlb__multipleHits_T_11 = tlb__multipleHits_T_10[0]; // @[Misc.scala 180:37]
  wire [1:0] tlb__multipleHits_T_12 = tlb__multipleHits_T_10[2:1]; // @[Misc.scala 181:39]
  wire  tlb__multipleHits_T_13 = tlb__multipleHits_T_12[0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_14 = tlb__multipleHits_T_12[1]; // @[Misc.scala 181:39]
  wire  tlb_multipleHits_rightOne_3 = tlb__multipleHits_T_13 | tlb__multipleHits_T_14; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_16 = tlb__multipleHits_T_13 & tlb__multipleHits_T_14; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_rightOne_4 = tlb__multipleHits_T_11 | tlb_multipleHits_rightOne_3; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_18 = tlb__multipleHits_T_11 & tlb_multipleHits_rightOne_3; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_rightTwo_2 = tlb__multipleHits_T_16 | tlb__multipleHits_T_18; // @[Misc.scala 182:49]
  wire  tlb_multipleHits_leftOne_5 = tlb_multipleHits_leftOne_2 | tlb_multipleHits_rightOne_4; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_19 = tlb_multipleHits_leftTwo | tlb_multipleHits_rightTwo_2; // @[Misc.scala 182:37]
  wire  tlb__multipleHits_T_20 = tlb_multipleHits_leftOne_2 & tlb_multipleHits_rightOne_4; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_leftTwo_1 = tlb__multipleHits_T_19 | tlb__multipleHits_T_20; // @[Misc.scala 182:49]
  wire [6:0] tlb__multipleHits_T_21 = tlb_real_hits[12:6]; // @[Misc.scala 181:39]
  wire [2:0] tlb__multipleHits_T_22 = tlb__multipleHits_T_21[2:0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_23 = tlb__multipleHits_T_22[0]; // @[Misc.scala 180:37]
  wire [1:0] tlb__multipleHits_T_24 = tlb__multipleHits_T_22[2:1]; // @[Misc.scala 181:39]
  wire  tlb__multipleHits_T_25 = tlb__multipleHits_T_24[0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_26 = tlb__multipleHits_T_24[1]; // @[Misc.scala 181:39]
  wire  tlb_multipleHits_rightOne_6 = tlb__multipleHits_T_25 | tlb__multipleHits_T_26; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_28 = tlb__multipleHits_T_25 & tlb__multipleHits_T_26; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_leftOne_8 = tlb__multipleHits_T_23 | tlb_multipleHits_rightOne_6; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_30 = tlb__multipleHits_T_23 & tlb_multipleHits_rightOne_6; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_leftTwo_2 = tlb__multipleHits_T_28 | tlb__multipleHits_T_30; // @[Misc.scala 182:49]
  wire [3:0] tlb__multipleHits_T_31 = tlb__multipleHits_T_21[6:3]; // @[Misc.scala 181:39]
  wire [1:0] tlb__multipleHits_T_32 = tlb__multipleHits_T_31[1:0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_33 = tlb__multipleHits_T_32[0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_34 = tlb__multipleHits_T_32[1]; // @[Misc.scala 181:39]
  wire  tlb_multipleHits_leftOne_10 = tlb__multipleHits_T_33 | tlb__multipleHits_T_34; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_36 = tlb__multipleHits_T_33 & tlb__multipleHits_T_34; // @[Misc.scala 182:61]
  wire [1:0] tlb__multipleHits_T_37 = tlb__multipleHits_T_31[3:2]; // @[Misc.scala 181:39]
  wire  tlb__multipleHits_T_38 = tlb__multipleHits_T_37[0]; // @[Misc.scala 180:37]
  wire  tlb__multipleHits_T_39 = tlb__multipleHits_T_37[1]; // @[Misc.scala 181:39]
  wire  tlb_multipleHits_rightOne_9 = tlb__multipleHits_T_38 | tlb__multipleHits_T_39; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_41 = tlb__multipleHits_T_38 & tlb__multipleHits_T_39; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_rightOne_10 = tlb_multipleHits_leftOne_10 | tlb_multipleHits_rightOne_9; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_42 = tlb__multipleHits_T_36 | tlb__multipleHits_T_41; // @[Misc.scala 182:37]
  wire  tlb__multipleHits_T_43 = tlb_multipleHits_leftOne_10 & tlb_multipleHits_rightOne_9; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_rightTwo_5 = tlb__multipleHits_T_42 | tlb__multipleHits_T_43; // @[Misc.scala 182:49]
  wire  tlb_multipleHits_rightOne_11 = tlb_multipleHits_leftOne_8 | tlb_multipleHits_rightOne_10; // @[Misc.scala 182:16]
  wire  tlb__multipleHits_T_44 = tlb_multipleHits_leftTwo_2 | tlb_multipleHits_rightTwo_5; // @[Misc.scala 182:37]
  wire  tlb__multipleHits_T_45 = tlb_multipleHits_leftOne_8 & tlb_multipleHits_rightOne_10; // @[Misc.scala 182:61]
  wire  tlb_multipleHits_rightTwo_6 = tlb__multipleHits_T_44 | tlb__multipleHits_T_45; // @[Misc.scala 182:49]
  wire  tlb__multipleHits_T_47 = tlb_multipleHits_leftTwo_1 | tlb_multipleHits_rightTwo_6; // @[Misc.scala 182:37]
  wire  tlb__multipleHits_T_48 = tlb_multipleHits_leftOne_5 & tlb_multipleHits_rightOne_11; // @[Misc.scala 182:61]
  wire  tlb_multipleHits = tlb__multipleHits_T_47 | tlb__multipleHits_T_48; // @[Misc.scala 182:49]
  wire  tlb__io_resp_pf_ld_T = tlb_bad_va & tlb_cmd_read; // @[TLB.scala 422:28]
  wire [13:0] tlb__io_resp_pf_ld_T_1 = tlb_pf_ld_array & tlb_hits; // @[TLB.scala 422:57]
  wire  tlb__io_resp_pf_ld_T_2 = |tlb__io_resp_pf_ld_T_1; // @[TLB.scala 422:65]
  wire  tlb__io_resp_pf_st_T = tlb_bad_va & tlb_cmd_write_perms; // @[TLB.scala 423:28]
  wire [13:0] tlb__io_resp_pf_st_T_1 = tlb_pf_st_array & tlb_hits; // @[TLB.scala 423:64]
  wire  tlb__io_resp_pf_st_T_2 = |tlb__io_resp_pf_st_T_1; // @[TLB.scala 423:72]
  wire [13:0] tlb__io_resp_ae_ld_T = tlb_ae_ld_array & tlb_hits; // @[TLB.scala 428:33]
  wire [13:0] tlb__io_resp_ae_st_T = tlb_ae_st_array & tlb_hits; // @[TLB.scala 429:33]
  wire [13:0] tlb__io_resp_cacheable_T = tlb_c_array & tlb_hits; // @[TLB.scala 434:33]
  wire  tlb__io_resp_miss_T_1 = tlb_io_ptw_resp_valid | tlb_tlb_miss; // @[TLB.scala 437:52]
  wire  tlb__T_49 = tlb_io_req_ready & tlb_io_req_valid; // @[Decoupled.scala 50:35]
  wire  tlb__T_50 = tlb__T_49 & tlb_tlb_miss; // @[TLB.scala 460:25]
  wire  tlb_r_superpage_repl_addr_left_subtree_older = tlb_state_reg_1[2]; // @[Replacement.scala 243:38]
  wire  tlb__r_superpage_repl_addr_T_2 = tlb_r_superpage_repl_addr_left_subtree_older ? tlb_state_reg_left_subtree_state
     : tlb_state_reg_right_subtree_state; // @[Replacement.scala 250:16]
  wire [1:0] tlb__r_superpage_repl_addr_T_3 = {tlb_r_superpage_repl_addr_left_subtree_older,
    tlb__r_superpage_repl_addr_T_2}; // @[Cat.scala 31:58]
  wire [3:0] tlb_r_superpage_repl_addr_valids = {tlb_superpage_entries_3_valid_0,tlb_superpage_entries_2_valid_0,
    tlb_superpage_entries_1_valid_0,tlb_superpage_entries_0_valid_0}; // @[Cat.scala 31:58]
  wire  tlb__r_superpage_repl_addr_T_4 = &tlb_r_superpage_repl_addr_valids; // @[TLB.scala 518:16]
  wire [3:0] tlb__r_superpage_repl_addr_T_5 = ~tlb_r_superpage_repl_addr_valids; // @[TLB.scala 518:43]
  wire  tlb__r_superpage_repl_addr_T_6 = tlb__r_superpage_repl_addr_T_5[0]; // @[OneHot.scala 47:45]
  wire  tlb__r_superpage_repl_addr_T_7 = tlb__r_superpage_repl_addr_T_5[1]; // @[OneHot.scala 47:45]
  wire  tlb__r_superpage_repl_addr_T_8 = tlb__r_superpage_repl_addr_T_5[2]; // @[OneHot.scala 47:45]
  wire [1:0] tlb__r_superpage_repl_addr_T_10 = tlb__r_superpage_repl_addr_T_8 ? 2'h2 : 2'h3; // @[Mux.scala 47:70]
  wire  tlb_r_sectored_repl_addr_left_subtree_older = tlb_state_vec_0[6]; // @[Replacement.scala 243:38]
  wire  tlb_r_sectored_repl_addr_left_subtree_older_1 = tlb_state_vec_0_left_subtree_state[2]; // @[Replacement.scala 243:38]
  wire  tlb__r_sectored_repl_addr_T_2 = tlb_r_sectored_repl_addr_left_subtree_older_1 ?
    tlb_state_vec_0_left_subtree_state_1 : tlb_state_vec_0_right_subtree_state_1; // @[Replacement.scala 250:16]
  wire [1:0] tlb__r_sectored_repl_addr_T_3 = {tlb_r_sectored_repl_addr_left_subtree_older_1,
    tlb__r_sectored_repl_addr_T_2}; // @[Cat.scala 31:58]
  wire  tlb_r_sectored_repl_addr_left_subtree_older_2 = tlb_state_vec_0_right_subtree_state[2]; // @[Replacement.scala 243:38]
  wire  tlb__r_sectored_repl_addr_T_6 = tlb_r_sectored_repl_addr_left_subtree_older_2 ?
    tlb_state_vec_0_left_subtree_state_2 : tlb_state_vec_0_right_subtree_state_2; // @[Replacement.scala 250:16]
  wire [1:0] tlb__r_sectored_repl_addr_T_7 = {tlb_r_sectored_repl_addr_left_subtree_older_2,
    tlb__r_sectored_repl_addr_T_6}; // @[Cat.scala 31:58]
  wire [1:0] tlb__r_sectored_repl_addr_T_8 = tlb_r_sectored_repl_addr_left_subtree_older ? tlb__r_sectored_repl_addr_T_3
     : tlb__r_sectored_repl_addr_T_7; // @[Replacement.scala 250:16]
  wire [2:0] tlb__r_sectored_repl_addr_T_9 = {tlb_r_sectored_repl_addr_left_subtree_older,tlb__r_sectored_repl_addr_T_8}
    ; // @[Cat.scala 31:58]
  wire [7:0] tlb_r_sectored_repl_addr_valids = {tlb__sector_hits_T_58,tlb__sector_hits_T_50,tlb__sector_hits_T_42,
    tlb__sector_hits_T_34,tlb__sector_hits_T_26,tlb__sector_hits_T_18,tlb__sector_hits_T_10,tlb__sector_hits_T_2}; // @[Cat.scala 31:58]
  wire  tlb__r_sectored_repl_addr_T_10 = &tlb_r_sectored_repl_addr_valids; // @[TLB.scala 518:16]
  wire [7:0] tlb__r_sectored_repl_addr_T_11 = ~tlb_r_sectored_repl_addr_valids; // @[TLB.scala 518:43]
  wire  tlb__r_sectored_repl_addr_T_12 = tlb__r_sectored_repl_addr_T_11[0]; // @[OneHot.scala 47:45]
  wire  tlb__r_sectored_repl_addr_T_13 = tlb__r_sectored_repl_addr_T_11[1]; // @[OneHot.scala 47:45]
  wire  tlb__r_sectored_repl_addr_T_14 = tlb__r_sectored_repl_addr_T_11[2]; // @[OneHot.scala 47:45]
  wire  tlb__r_sectored_repl_addr_T_15 = tlb__r_sectored_repl_addr_T_11[3]; // @[OneHot.scala 47:45]
  wire  tlb__r_sectored_repl_addr_T_16 = tlb__r_sectored_repl_addr_T_11[4]; // @[OneHot.scala 47:45]
  wire  tlb__r_sectored_repl_addr_T_17 = tlb__r_sectored_repl_addr_T_11[5]; // @[OneHot.scala 47:45]
  wire  tlb__r_sectored_repl_addr_T_18 = tlb__r_sectored_repl_addr_T_11[6]; // @[OneHot.scala 47:45]
  wire [2:0] tlb__r_sectored_repl_addr_T_20 = tlb__r_sectored_repl_addr_T_18 ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] tlb__r_sectored_repl_addr_T_21 = tlb__r_sectored_repl_addr_T_17 ? 3'h5 : tlb__r_sectored_repl_addr_T_20; // @[Mux.scala 47:70]
  wire [2:0] tlb__r_sectored_repl_addr_T_22 = tlb__r_sectored_repl_addr_T_16 ? 3'h4 : tlb__r_sectored_repl_addr_T_21; // @[Mux.scala 47:70]
  wire [2:0] tlb__r_sectored_repl_addr_T_23 = tlb__r_sectored_repl_addr_T_15 ? 3'h3 : tlb__r_sectored_repl_addr_T_22; // @[Mux.scala 47:70]
  wire [2:0] tlb__r_sectored_repl_addr_T_24 = tlb__r_sectored_repl_addr_T_14 ? 3'h2 : tlb__r_sectored_repl_addr_T_23; // @[Mux.scala 47:70]
  wire [1:0] tlb__GEN_644 = tlb__T_50 ? 2'h1 : tlb_state; // @[TLB.scala 460:38 461:13 198:18]
  wire [1:0] tlb__GEN_655 = tlb_io_sfence_valid ? 2'h0 : tlb__GEN_644; // @[TLB.scala 474:{21,29}]
  wire [1:0] tlb__state_T = tlb_io_sfence_valid ? 2'h3 : 2'h2; // @[TLB.scala 475:45]
  wire [1:0] tlb__GEN_656 = tlb_io_ptw_req_ready ? tlb__state_T : tlb__GEN_655; // @[TLB.scala 475:{31,39}]
  wire  tlb__T_52 = tlb_state == 2'h2; // @[TLB.scala 478:17]
  wire  tlb__T_53 = tlb__T_52 & tlb_io_sfence_valid; // @[TLB.scala 478:28]
  wire  tlb__T_54 = ~tlb_io_sfence_bits_rs1; // @[TLB.scala 486:14]
  wire [26:0] tlb__T_55 = tlb_io_sfence_bits_addr[38:12]; // @[TLB.scala 486:58]
  wire  tlb__T_56 = tlb__T_55 == tlb_vpn; // @[TLB.scala 486:72]
  wire  tlb__T_57 = tlb__T_54 | tlb__T_56; // @[TLB.scala 486:34]
  wire  tlb__T_59 = ~tlb_reset; // @[TLB.scala 486:13]
  wire  tlb__T_60 = ~tlb__T_57; // @[TLB.scala 486:13]
  wire  tlb__T_68 = tlb_sectored_entries_0_0_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_87 = tlb_sectored_entries_0_0_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_90 = tlb_sectored_entries_0_0_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_109 = tlb_sectored_entries_0_0_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_112 = tlb_sectored_entries_0_0_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_131 = tlb_sectored_entries_0_0_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_134 = tlb_sectored_entries_0_0_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_153 = tlb_sectored_entries_0_0_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__T_158 = 2'h0 == tlb_hitsVec_idx; // @[TLB.scala 155:40]
  wire  tlb__GEN_661 = tlb__T_158 ? 1'h0 : tlb__GEN_515; // @[TLB.scala 155:{60,64}]
  wire  tlb__T_162 = 2'h1 == tlb_hitsVec_idx; // @[TLB.scala 155:40]
  wire  tlb__GEN_662 = tlb__T_162 ? 1'h0 : tlb__GEN_516; // @[TLB.scala 155:{60,64}]
  wire  tlb__T_166 = 2'h2 == tlb_hitsVec_idx; // @[TLB.scala 155:40]
  wire  tlb__GEN_663 = tlb__T_166 ? 1'h0 : tlb__GEN_517; // @[TLB.scala 155:{60,64}]
  wire  tlb__T_170 = 2'h3 == tlb_hitsVec_idx; // @[TLB.scala 155:40]
  wire  tlb__GEN_664 = tlb__T_170 ? 1'h0 : tlb__GEN_518; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_665 = tlb__sector_hits_T_5 ? tlb__GEN_661 : tlb__GEN_515; // @[TLB.scala 153:43]
  wire  tlb__GEN_666 = tlb__sector_hits_T_5 ? tlb__GEN_662 : tlb__GEN_516; // @[TLB.scala 153:43]
  wire  tlb__GEN_667 = tlb__sector_hits_T_5 ? tlb__GEN_663 : tlb__GEN_517; // @[TLB.scala 153:43]
  wire  tlb__GEN_668 = tlb__sector_hits_T_5 ? tlb__GEN_664 : tlb__GEN_518; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_173 = tlb__sector_hits_T_3[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_174 = tlb__T_173 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_669 = tlb__T_68 ? 1'h0 : tlb__GEN_665; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_670 = tlb__T_90 ? 1'h0 : tlb__GEN_666; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_671 = tlb__T_112 ? 1'h0 : tlb__GEN_667; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_672 = tlb__T_134 ? 1'h0 : tlb__GEN_668; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_362 = ~tlb__T_87; // @[TLB.scala 168:34]
  wire  tlb__GEN_677 = tlb__T_362 ? 1'h0 : tlb__GEN_515; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_365 = ~tlb__T_109; // @[TLB.scala 168:34]
  wire  tlb__GEN_678 = tlb__T_365 ? 1'h0 : tlb__GEN_516; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_368 = ~tlb__T_131; // @[TLB.scala 168:34]
  wire  tlb__GEN_679 = tlb__T_368 ? 1'h0 : tlb__GEN_517; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_371 = ~tlb__T_153; // @[TLB.scala 168:34]
  wire  tlb__GEN_680 = tlb__T_371 ? 1'h0 : tlb__GEN_518; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_685 = tlb_io_sfence_bits_rs2 & tlb__GEN_677; // @[TLB.scala 491:47]
  wire  tlb__GEN_686 = tlb_io_sfence_bits_rs2 & tlb__GEN_678; // @[TLB.scala 491:47]
  wire  tlb__GEN_687 = tlb_io_sfence_bits_rs2 & tlb__GEN_679; // @[TLB.scala 491:47]
  wire  tlb__GEN_688 = tlb_io_sfence_bits_rs2 & tlb__GEN_680; // @[TLB.scala 491:47]
  wire  tlb__T_473 = tlb_sectored_entries_0_1_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_492 = tlb_sectored_entries_0_1_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_495 = tlb_sectored_entries_0_1_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_514 = tlb_sectored_entries_0_1_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_517 = tlb_sectored_entries_0_1_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_536 = tlb_sectored_entries_0_1_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_539 = tlb_sectored_entries_0_1_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_558 = tlb_sectored_entries_0_1_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__GEN_693 = tlb__T_158 ? 1'h0 : tlb__GEN_526; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_694 = tlb__T_162 ? 1'h0 : tlb__GEN_527; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_695 = tlb__T_166 ? 1'h0 : tlb__GEN_528; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_696 = tlb__T_170 ? 1'h0 : tlb__GEN_529; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_697 = tlb__sector_hits_T_13 ? tlb__GEN_693 : tlb__GEN_526; // @[TLB.scala 153:43]
  wire  tlb__GEN_698 = tlb__sector_hits_T_13 ? tlb__GEN_694 : tlb__GEN_527; // @[TLB.scala 153:43]
  wire  tlb__GEN_699 = tlb__sector_hits_T_13 ? tlb__GEN_695 : tlb__GEN_528; // @[TLB.scala 153:43]
  wire  tlb__GEN_700 = tlb__sector_hits_T_13 ? tlb__GEN_696 : tlb__GEN_529; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_578 = tlb__sector_hits_T_11[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_579 = tlb__T_578 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_701 = tlb__T_473 ? 1'h0 : tlb__GEN_697; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_702 = tlb__T_495 ? 1'h0 : tlb__GEN_698; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_703 = tlb__T_517 ? 1'h0 : tlb__GEN_699; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_704 = tlb__T_539 ? 1'h0 : tlb__GEN_700; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_767 = ~tlb__T_492; // @[TLB.scala 168:34]
  wire  tlb__GEN_709 = tlb__T_767 ? 1'h0 : tlb__GEN_526; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_770 = ~tlb__T_514; // @[TLB.scala 168:34]
  wire  tlb__GEN_710 = tlb__T_770 ? 1'h0 : tlb__GEN_527; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_773 = ~tlb__T_536; // @[TLB.scala 168:34]
  wire  tlb__GEN_711 = tlb__T_773 ? 1'h0 : tlb__GEN_528; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_776 = ~tlb__T_558; // @[TLB.scala 168:34]
  wire  tlb__GEN_712 = tlb__T_776 ? 1'h0 : tlb__GEN_529; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_717 = tlb_io_sfence_bits_rs2 & tlb__GEN_709; // @[TLB.scala 491:47]
  wire  tlb__GEN_718 = tlb_io_sfence_bits_rs2 & tlb__GEN_710; // @[TLB.scala 491:47]
  wire  tlb__GEN_719 = tlb_io_sfence_bits_rs2 & tlb__GEN_711; // @[TLB.scala 491:47]
  wire  tlb__GEN_720 = tlb_io_sfence_bits_rs2 & tlb__GEN_712; // @[TLB.scala 491:47]
  wire  tlb__T_878 = tlb_sectored_entries_0_2_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_897 = tlb_sectored_entries_0_2_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_900 = tlb_sectored_entries_0_2_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_919 = tlb_sectored_entries_0_2_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_922 = tlb_sectored_entries_0_2_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_941 = tlb_sectored_entries_0_2_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_944 = tlb_sectored_entries_0_2_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_963 = tlb_sectored_entries_0_2_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__GEN_725 = tlb__T_158 ? 1'h0 : tlb__GEN_537; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_726 = tlb__T_162 ? 1'h0 : tlb__GEN_538; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_727 = tlb__T_166 ? 1'h0 : tlb__GEN_539; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_728 = tlb__T_170 ? 1'h0 : tlb__GEN_540; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_729 = tlb__sector_hits_T_21 ? tlb__GEN_725 : tlb__GEN_537; // @[TLB.scala 153:43]
  wire  tlb__GEN_730 = tlb__sector_hits_T_21 ? tlb__GEN_726 : tlb__GEN_538; // @[TLB.scala 153:43]
  wire  tlb__GEN_731 = tlb__sector_hits_T_21 ? tlb__GEN_727 : tlb__GEN_539; // @[TLB.scala 153:43]
  wire  tlb__GEN_732 = tlb__sector_hits_T_21 ? tlb__GEN_728 : tlb__GEN_540; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_983 = tlb__sector_hits_T_19[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_984 = tlb__T_983 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_733 = tlb__T_878 ? 1'h0 : tlb__GEN_729; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_734 = tlb__T_900 ? 1'h0 : tlb__GEN_730; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_735 = tlb__T_922 ? 1'h0 : tlb__GEN_731; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_736 = tlb__T_944 ? 1'h0 : tlb__GEN_732; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_1172 = ~tlb__T_897; // @[TLB.scala 168:34]
  wire  tlb__GEN_741 = tlb__T_1172 ? 1'h0 : tlb__GEN_537; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1175 = ~tlb__T_919; // @[TLB.scala 168:34]
  wire  tlb__GEN_742 = tlb__T_1175 ? 1'h0 : tlb__GEN_538; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1178 = ~tlb__T_941; // @[TLB.scala 168:34]
  wire  tlb__GEN_743 = tlb__T_1178 ? 1'h0 : tlb__GEN_539; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1181 = ~tlb__T_963; // @[TLB.scala 168:34]
  wire  tlb__GEN_744 = tlb__T_1181 ? 1'h0 : tlb__GEN_540; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_749 = tlb_io_sfence_bits_rs2 & tlb__GEN_741; // @[TLB.scala 491:47]
  wire  tlb__GEN_750 = tlb_io_sfence_bits_rs2 & tlb__GEN_742; // @[TLB.scala 491:47]
  wire  tlb__GEN_751 = tlb_io_sfence_bits_rs2 & tlb__GEN_743; // @[TLB.scala 491:47]
  wire  tlb__GEN_752 = tlb_io_sfence_bits_rs2 & tlb__GEN_744; // @[TLB.scala 491:47]
  wire  tlb__T_1283 = tlb_sectored_entries_0_3_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1302 = tlb_sectored_entries_0_3_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_1305 = tlb_sectored_entries_0_3_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1324 = tlb_sectored_entries_0_3_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_1327 = tlb_sectored_entries_0_3_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1346 = tlb_sectored_entries_0_3_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_1349 = tlb_sectored_entries_0_3_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1368 = tlb_sectored_entries_0_3_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__GEN_757 = tlb__T_158 ? 1'h0 : tlb__GEN_548; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_758 = tlb__T_162 ? 1'h0 : tlb__GEN_549; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_759 = tlb__T_166 ? 1'h0 : tlb__GEN_550; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_760 = tlb__T_170 ? 1'h0 : tlb__GEN_551; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_761 = tlb__sector_hits_T_29 ? tlb__GEN_757 : tlb__GEN_548; // @[TLB.scala 153:43]
  wire  tlb__GEN_762 = tlb__sector_hits_T_29 ? tlb__GEN_758 : tlb__GEN_549; // @[TLB.scala 153:43]
  wire  tlb__GEN_763 = tlb__sector_hits_T_29 ? tlb__GEN_759 : tlb__GEN_550; // @[TLB.scala 153:43]
  wire  tlb__GEN_764 = tlb__sector_hits_T_29 ? tlb__GEN_760 : tlb__GEN_551; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_1388 = tlb__sector_hits_T_27[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_1389 = tlb__T_1388 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_765 = tlb__T_1283 ? 1'h0 : tlb__GEN_761; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_766 = tlb__T_1305 ? 1'h0 : tlb__GEN_762; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_767 = tlb__T_1327 ? 1'h0 : tlb__GEN_763; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_768 = tlb__T_1349 ? 1'h0 : tlb__GEN_764; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_1577 = ~tlb__T_1302; // @[TLB.scala 168:34]
  wire  tlb__GEN_773 = tlb__T_1577 ? 1'h0 : tlb__GEN_548; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1580 = ~tlb__T_1324; // @[TLB.scala 168:34]
  wire  tlb__GEN_774 = tlb__T_1580 ? 1'h0 : tlb__GEN_549; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1583 = ~tlb__T_1346; // @[TLB.scala 168:34]
  wire  tlb__GEN_775 = tlb__T_1583 ? 1'h0 : tlb__GEN_550; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1586 = ~tlb__T_1368; // @[TLB.scala 168:34]
  wire  tlb__GEN_776 = tlb__T_1586 ? 1'h0 : tlb__GEN_551; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_781 = tlb_io_sfence_bits_rs2 & tlb__GEN_773; // @[TLB.scala 491:47]
  wire  tlb__GEN_782 = tlb_io_sfence_bits_rs2 & tlb__GEN_774; // @[TLB.scala 491:47]
  wire  tlb__GEN_783 = tlb_io_sfence_bits_rs2 & tlb__GEN_775; // @[TLB.scala 491:47]
  wire  tlb__GEN_784 = tlb_io_sfence_bits_rs2 & tlb__GEN_776; // @[TLB.scala 491:47]
  wire  tlb__T_1688 = tlb_sectored_entries_0_4_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1707 = tlb_sectored_entries_0_4_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_1710 = tlb_sectored_entries_0_4_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1729 = tlb_sectored_entries_0_4_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_1732 = tlb_sectored_entries_0_4_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1751 = tlb_sectored_entries_0_4_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_1754 = tlb_sectored_entries_0_4_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_1773 = tlb_sectored_entries_0_4_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__GEN_789 = tlb__T_158 ? 1'h0 : tlb__GEN_559; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_790 = tlb__T_162 ? 1'h0 : tlb__GEN_560; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_791 = tlb__T_166 ? 1'h0 : tlb__GEN_561; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_792 = tlb__T_170 ? 1'h0 : tlb__GEN_562; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_793 = tlb__sector_hits_T_37 ? tlb__GEN_789 : tlb__GEN_559; // @[TLB.scala 153:43]
  wire  tlb__GEN_794 = tlb__sector_hits_T_37 ? tlb__GEN_790 : tlb__GEN_560; // @[TLB.scala 153:43]
  wire  tlb__GEN_795 = tlb__sector_hits_T_37 ? tlb__GEN_791 : tlb__GEN_561; // @[TLB.scala 153:43]
  wire  tlb__GEN_796 = tlb__sector_hits_T_37 ? tlb__GEN_792 : tlb__GEN_562; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_1793 = tlb__sector_hits_T_35[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_1794 = tlb__T_1793 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_797 = tlb__T_1688 ? 1'h0 : tlb__GEN_793; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_798 = tlb__T_1710 ? 1'h0 : tlb__GEN_794; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_799 = tlb__T_1732 ? 1'h0 : tlb__GEN_795; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_800 = tlb__T_1754 ? 1'h0 : tlb__GEN_796; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_1982 = ~tlb__T_1707; // @[TLB.scala 168:34]
  wire  tlb__GEN_805 = tlb__T_1982 ? 1'h0 : tlb__GEN_559; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1985 = ~tlb__T_1729; // @[TLB.scala 168:34]
  wire  tlb__GEN_806 = tlb__T_1985 ? 1'h0 : tlb__GEN_560; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1988 = ~tlb__T_1751; // @[TLB.scala 168:34]
  wire  tlb__GEN_807 = tlb__T_1988 ? 1'h0 : tlb__GEN_561; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_1991 = ~tlb__T_1773; // @[TLB.scala 168:34]
  wire  tlb__GEN_808 = tlb__T_1991 ? 1'h0 : tlb__GEN_562; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_813 = tlb_io_sfence_bits_rs2 & tlb__GEN_805; // @[TLB.scala 491:47]
  wire  tlb__GEN_814 = tlb_io_sfence_bits_rs2 & tlb__GEN_806; // @[TLB.scala 491:47]
  wire  tlb__GEN_815 = tlb_io_sfence_bits_rs2 & tlb__GEN_807; // @[TLB.scala 491:47]
  wire  tlb__GEN_816 = tlb_io_sfence_bits_rs2 & tlb__GEN_808; // @[TLB.scala 491:47]
  wire  tlb__T_2093 = tlb_sectored_entries_0_5_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2112 = tlb_sectored_entries_0_5_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2115 = tlb_sectored_entries_0_5_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2134 = tlb_sectored_entries_0_5_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2137 = tlb_sectored_entries_0_5_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2156 = tlb_sectored_entries_0_5_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2159 = tlb_sectored_entries_0_5_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2178 = tlb_sectored_entries_0_5_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__GEN_821 = tlb__T_158 ? 1'h0 : tlb__GEN_570; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_822 = tlb__T_162 ? 1'h0 : tlb__GEN_571; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_823 = tlb__T_166 ? 1'h0 : tlb__GEN_572; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_824 = tlb__T_170 ? 1'h0 : tlb__GEN_573; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_825 = tlb__sector_hits_T_45 ? tlb__GEN_821 : tlb__GEN_570; // @[TLB.scala 153:43]
  wire  tlb__GEN_826 = tlb__sector_hits_T_45 ? tlb__GEN_822 : tlb__GEN_571; // @[TLB.scala 153:43]
  wire  tlb__GEN_827 = tlb__sector_hits_T_45 ? tlb__GEN_823 : tlb__GEN_572; // @[TLB.scala 153:43]
  wire  tlb__GEN_828 = tlb__sector_hits_T_45 ? tlb__GEN_824 : tlb__GEN_573; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_2198 = tlb__sector_hits_T_43[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_2199 = tlb__T_2198 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_829 = tlb__T_2093 ? 1'h0 : tlb__GEN_825; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_830 = tlb__T_2115 ? 1'h0 : tlb__GEN_826; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_831 = tlb__T_2137 ? 1'h0 : tlb__GEN_827; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_832 = tlb__T_2159 ? 1'h0 : tlb__GEN_828; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_2387 = ~tlb__T_2112; // @[TLB.scala 168:34]
  wire  tlb__GEN_837 = tlb__T_2387 ? 1'h0 : tlb__GEN_570; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_2390 = ~tlb__T_2134; // @[TLB.scala 168:34]
  wire  tlb__GEN_838 = tlb__T_2390 ? 1'h0 : tlb__GEN_571; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_2393 = ~tlb__T_2156; // @[TLB.scala 168:34]
  wire  tlb__GEN_839 = tlb__T_2393 ? 1'h0 : tlb__GEN_572; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_2396 = ~tlb__T_2178; // @[TLB.scala 168:34]
  wire  tlb__GEN_840 = tlb__T_2396 ? 1'h0 : tlb__GEN_573; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_845 = tlb_io_sfence_bits_rs2 & tlb__GEN_837; // @[TLB.scala 491:47]
  wire  tlb__GEN_846 = tlb_io_sfence_bits_rs2 & tlb__GEN_838; // @[TLB.scala 491:47]
  wire  tlb__GEN_847 = tlb_io_sfence_bits_rs2 & tlb__GEN_839; // @[TLB.scala 491:47]
  wire  tlb__GEN_848 = tlb_io_sfence_bits_rs2 & tlb__GEN_840; // @[TLB.scala 491:47]
  wire  tlb__T_2498 = tlb_sectored_entries_0_6_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2517 = tlb_sectored_entries_0_6_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2520 = tlb_sectored_entries_0_6_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2539 = tlb_sectored_entries_0_6_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2542 = tlb_sectored_entries_0_6_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2561 = tlb_sectored_entries_0_6_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2564 = tlb_sectored_entries_0_6_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2583 = tlb_sectored_entries_0_6_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__GEN_853 = tlb__T_158 ? 1'h0 : tlb__GEN_581; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_854 = tlb__T_162 ? 1'h0 : tlb__GEN_582; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_855 = tlb__T_166 ? 1'h0 : tlb__GEN_583; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_856 = tlb__T_170 ? 1'h0 : tlb__GEN_584; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_857 = tlb__sector_hits_T_53 ? tlb__GEN_853 : tlb__GEN_581; // @[TLB.scala 153:43]
  wire  tlb__GEN_858 = tlb__sector_hits_T_53 ? tlb__GEN_854 : tlb__GEN_582; // @[TLB.scala 153:43]
  wire  tlb__GEN_859 = tlb__sector_hits_T_53 ? tlb__GEN_855 : tlb__GEN_583; // @[TLB.scala 153:43]
  wire  tlb__GEN_860 = tlb__sector_hits_T_53 ? tlb__GEN_856 : tlb__GEN_584; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_2603 = tlb__sector_hits_T_51[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_2604 = tlb__T_2603 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_861 = tlb__T_2498 ? 1'h0 : tlb__GEN_857; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_862 = tlb__T_2520 ? 1'h0 : tlb__GEN_858; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_863 = tlb__T_2542 ? 1'h0 : tlb__GEN_859; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_864 = tlb__T_2564 ? 1'h0 : tlb__GEN_860; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_2792 = ~tlb__T_2517; // @[TLB.scala 168:34]
  wire  tlb__GEN_869 = tlb__T_2792 ? 1'h0 : tlb__GEN_581; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_2795 = ~tlb__T_2539; // @[TLB.scala 168:34]
  wire  tlb__GEN_870 = tlb__T_2795 ? 1'h0 : tlb__GEN_582; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_2798 = ~tlb__T_2561; // @[TLB.scala 168:34]
  wire  tlb__GEN_871 = tlb__T_2798 ? 1'h0 : tlb__GEN_583; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_2801 = ~tlb__T_2583; // @[TLB.scala 168:34]
  wire  tlb__GEN_872 = tlb__T_2801 ? 1'h0 : tlb__GEN_584; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_877 = tlb_io_sfence_bits_rs2 & tlb__GEN_869; // @[TLB.scala 491:47]
  wire  tlb__GEN_878 = tlb_io_sfence_bits_rs2 & tlb__GEN_870; // @[TLB.scala 491:47]
  wire  tlb__GEN_879 = tlb_io_sfence_bits_rs2 & tlb__GEN_871; // @[TLB.scala 491:47]
  wire  tlb__GEN_880 = tlb_io_sfence_bits_rs2 & tlb__GEN_872; // @[TLB.scala 491:47]
  wire  tlb__T_2903 = tlb_sectored_entries_0_7_data_0[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2922 = tlb_sectored_entries_0_7_data_0[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2925 = tlb_sectored_entries_0_7_data_1[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2944 = tlb_sectored_entries_0_7_data_1[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2947 = tlb_sectored_entries_0_7_data_2[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2966 = tlb_sectored_entries_0_7_data_2[19]; // @[TLB.scala 99:39]
  wire  tlb__T_2969 = tlb_sectored_entries_0_7_data_3[0]; // @[TLB.scala 99:39]
  wire  tlb__T_2988 = tlb_sectored_entries_0_7_data_3[19]; // @[TLB.scala 99:39]
  wire  tlb__GEN_885 = tlb__T_158 ? 1'h0 : tlb__GEN_592; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_886 = tlb__T_162 ? 1'h0 : tlb__GEN_593; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_887 = tlb__T_166 ? 1'h0 : tlb__GEN_594; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_888 = tlb__T_170 ? 1'h0 : tlb__GEN_595; // @[TLB.scala 155:{60,64}]
  wire  tlb__GEN_889 = tlb__sector_hits_T_61 ? tlb__GEN_885 : tlb__GEN_592; // @[TLB.scala 153:43]
  wire  tlb__GEN_890 = tlb__sector_hits_T_61 ? tlb__GEN_886 : tlb__GEN_593; // @[TLB.scala 153:43]
  wire  tlb__GEN_891 = tlb__sector_hits_T_61 ? tlb__GEN_887 : tlb__GEN_594; // @[TLB.scala 153:43]
  wire  tlb__GEN_892 = tlb__sector_hits_T_61 ? tlb__GEN_888 : tlb__GEN_595; // @[TLB.scala 153:43]
  wire [8:0] tlb__T_3008 = tlb__sector_hits_T_59[26:18]; // @[TLB.scala 160:30]
  wire  tlb__T_3009 = tlb__T_3008 == 9'h0; // @[TLB.scala 160:65]
  wire  tlb__GEN_893 = tlb__T_2903 ? 1'h0 : tlb__GEN_889; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_894 = tlb__T_2925 ? 1'h0 : tlb__GEN_890; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_895 = tlb__T_2947 ? 1'h0 : tlb__GEN_891; // @[TLB.scala 162:{62,66}]
  wire  tlb__GEN_896 = tlb__T_2969 ? 1'h0 : tlb__GEN_892; // @[TLB.scala 162:{62,66}]
  wire  tlb__T_3197 = ~tlb__T_2922; // @[TLB.scala 168:34]
  wire  tlb__GEN_901 = tlb__T_3197 ? 1'h0 : tlb__GEN_592; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_3200 = ~tlb__T_2944; // @[TLB.scala 168:34]
  wire  tlb__GEN_902 = tlb__T_3200 ? 1'h0 : tlb__GEN_593; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_3203 = ~tlb__T_2966; // @[TLB.scala 168:34]
  wire  tlb__GEN_903 = tlb__T_3203 ? 1'h0 : tlb__GEN_594; // @[TLB.scala 168:{40,44}]
  wire  tlb__T_3206 = ~tlb__T_2988; // @[TLB.scala 168:34]
  wire  tlb__GEN_904 = tlb__T_3206 ? 1'h0 : tlb__GEN_595; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_909 = tlb_io_sfence_bits_rs2 & tlb__GEN_901; // @[TLB.scala 491:47]
  wire  tlb__GEN_910 = tlb_io_sfence_bits_rs2 & tlb__GEN_902; // @[TLB.scala 491:47]
  wire  tlb__GEN_911 = tlb_io_sfence_bits_rs2 & tlb__GEN_903; // @[TLB.scala 491:47]
  wire  tlb__GEN_912 = tlb_io_sfence_bits_rs2 & tlb__GEN_904; // @[TLB.scala 491:47]
  wire  tlb__T_3343 = ~tlb__entries_T_203; // @[TLB.scala 168:34]
  wire  tlb__GEN_918 = tlb__T_3343 ? 1'h0 : tlb__GEN_498; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_920 = tlb_io_sfence_bits_rs2 & tlb__GEN_918; // @[TLB.scala 491:47]
  wire  tlb__T_3411 = ~tlb__entries_T_225; // @[TLB.scala 168:34]
  wire  tlb__GEN_923 = tlb__T_3411 ? 1'h0 : tlb__GEN_503; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_925 = tlb_io_sfence_bits_rs2 & tlb__GEN_923; // @[TLB.scala 491:47]
  wire  tlb__T_3479 = ~tlb__entries_T_247; // @[TLB.scala 168:34]
  wire  tlb__GEN_928 = tlb__T_3479 ? 1'h0 : tlb__GEN_508; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_930 = tlb_io_sfence_bits_rs2 & tlb__GEN_928; // @[TLB.scala 491:47]
  wire  tlb__T_3547 = ~tlb__entries_T_269; // @[TLB.scala 168:34]
  wire  tlb__GEN_933 = tlb__T_3547 ? 1'h0 : tlb__GEN_513; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_935 = tlb_io_sfence_bits_rs2 & tlb__GEN_933; // @[TLB.scala 491:47]
  wire  tlb__T_3615 = ~tlb__mpu_ppn_T_20; // @[TLB.scala 168:34]
  wire  tlb__GEN_938 = tlb__T_3615 ? 1'h0 : tlb__GEN_493; // @[TLB.scala 168:{40,44}]
  wire  tlb__GEN_940 = tlb_io_sfence_bits_rs2 & tlb__GEN_938; // @[TLB.scala 491:47]
  wire  tlb__T_4495 = tlb_multipleHits | tlb_reset; // @[TLB.scala 499:24]
  wire [1:0] pma_checker_io_req_bits_size;
  wire [19:0] pma_checker_mpu_ppn_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_mpu_ppn_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_mpu_ppn_barrier_io_y_c; // @[package.scala 258:25]
  wire [1:0] pma_checker_pmp_io_prv; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_0_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_0_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_0_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_0_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_0_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_0_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_0_mask; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_1_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_1_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_1_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_1_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_1_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_1_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_1_mask; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_2_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_2_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_2_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_2_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_2_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_2_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_2_mask; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_3_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_3_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_3_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_3_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_3_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_3_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_3_mask; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_4_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_4_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_4_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_4_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_4_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_4_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_4_mask; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_5_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_5_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_5_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_5_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_5_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_5_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_5_mask; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_6_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_6_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_6_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_6_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_6_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_6_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_6_mask; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_7_cfg_l; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_pmp_7_cfg_a; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_7_cfg_x; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_7_cfg_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_pmp_7_cfg_r; // @[TLB.scala 234:19]
  wire [29:0] pma_checker_pmp_io_pmp_7_addr; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_pmp_7_mask; // @[TLB.scala 234:19]
  wire [31:0] pma_checker_pmp_io_addr; // @[TLB.scala 234:19]
  wire [1:0] pma_checker_pmp_io_size; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_r; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_w; // @[TLB.scala 234:19]
  wire  pma_checker_pmp_io_x; // @[TLB.scala 234:19]
  wire [19:0] pma_checker_entries_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_1_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_1_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_1_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_2_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_2_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_2_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_3_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_3_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_3_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_4_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_4_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_4_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_5_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_5_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_5_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_6_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_6_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_6_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_7_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_7_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_7_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_8_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_8_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_8_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_9_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_9_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_9_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_10_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_10_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_10_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_11_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_11_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_11_io_y_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_12_io_x_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_x_c; // @[package.scala 258:25]
  wire [19:0] pma_checker_entries_barrier_12_io_y_ppn; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_u; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_ae_ptw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_ae_final; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_pf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_gf; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_sw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_sx; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_sr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_pw; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_px; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_pr; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_ppp; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_pal; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_paa; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_eff; // @[package.scala 258:25]
  wire  pma_checker_entries_barrier_12_io_y_c; // @[package.scala 258:25]
  wire  lfsr_prng_clock; // @[PRNG.scala 91:22]
  wire  lfsr_prng_reset; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_increment; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_0; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_1; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_2; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_3; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_4; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_5; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_6; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_7; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_8; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_9; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_10; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_11; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_12; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_13; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_14; // @[PRNG.scala 91:22]
  wire  lfsr_prng_io_out_15; // @[PRNG.scala 91:22]
  wire  metaArb_io_in_0_valid;
  wire [39:0] metaArb_io_in_0_bits_addr;
  wire [5:0] metaArb_io_in_0_bits_idx;
  wire  metaArb_io_in_2_valid;
  wire [39:0] metaArb_io_in_2_bits_addr;
  wire [5:0] metaArb_io_in_2_bits_idx;
  wire [3:0] metaArb_io_in_2_bits_way_en;
  wire [21:0] metaArb_io_in_2_bits_data;
  wire  metaArb_io_in_3_valid;
  wire [39:0] metaArb_io_in_3_bits_addr;
  wire [5:0] metaArb_io_in_3_bits_idx;
  wire [3:0] metaArb_io_in_3_bits_way_en;
  wire [21:0] metaArb_io_in_3_bits_data;
  wire  metaArb_io_in_4_ready;
  wire  metaArb_io_in_4_valid;
  wire [39:0] metaArb_io_in_4_bits_addr;
  wire [5:0] metaArb_io_in_4_bits_idx;
  wire [3:0] metaArb_io_in_4_bits_way_en;
  wire [21:0] metaArb_io_in_4_bits_data;
  wire [39:0] metaArb_io_in_5_bits_addr;
  wire [5:0] metaArb_io_in_5_bits_idx;
  wire  metaArb_io_in_6_ready;
  wire  metaArb_io_in_6_valid;
  wire [39:0] metaArb_io_in_6_bits_addr;
  wire [5:0] metaArb_io_in_6_bits_idx;
  wire [3:0] metaArb_io_in_6_bits_way_en;
  wire [21:0] metaArb_io_in_6_bits_data;
  wire  metaArb_io_in_7_ready;
  wire  metaArb_io_in_7_valid;
  wire [39:0] metaArb_io_in_7_bits_addr;
  wire [5:0] metaArb_io_in_7_bits_idx;
  wire [3:0] metaArb_io_in_7_bits_way_en;
  wire [21:0] metaArb_io_in_7_bits_data;
  wire  metaArb_io_out_valid;
  wire  metaArb_io_out_bits_write;
  wire [39:0] metaArb_io_out_bits_addr;
  wire [5:0] metaArb_io_out_bits_idx;
  wire [3:0] metaArb_io_out_bits_way_en;
  wire [21:0] metaArb_io_out_bits_data;
  wire [39:0] metaArb__GEN_2 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_addr : metaArb_io_in_7_bits_addr; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [5:0] metaArb__GEN_3 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_idx : metaArb_io_in_7_bits_idx; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [3:0] metaArb__GEN_4 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_way_en : metaArb_io_in_7_bits_way_en; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [21:0] metaArb__GEN_5 = metaArb_io_in_6_valid ? metaArb_io_in_6_bits_data : metaArb_io_in_7_bits_data; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [39:0] metaArb__GEN_14 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_addr : metaArb__GEN_2; // @[Arbiter.scala 141:26 143:19]
  wire [5:0] metaArb__GEN_15 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_idx : metaArb__GEN_3; // @[Arbiter.scala 141:26 143:19]
  wire [3:0] metaArb__GEN_16 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_way_en : metaArb__GEN_4; // @[Arbiter.scala 141:26 143:19]
  wire [21:0] metaArb__GEN_17 = metaArb_io_in_4_valid ? metaArb_io_in_4_bits_data : metaArb__GEN_5; // @[Arbiter.scala 141:26 143:19]
  wire  metaArb__GEN_19 = metaArb_io_in_3_valid | metaArb_io_in_4_valid; // @[Arbiter.scala 141:26 143:19]
  wire [39:0] metaArb__GEN_20 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_addr : metaArb__GEN_14; // @[Arbiter.scala 141:26 143:19]
  wire [5:0] metaArb__GEN_21 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_idx : metaArb__GEN_15; // @[Arbiter.scala 141:26 143:19]
  wire [3:0] metaArb__GEN_22 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_way_en : metaArb__GEN_16; // @[Arbiter.scala 141:26 143:19]
  wire [21:0] metaArb__GEN_23 = metaArb_io_in_3_valid ? metaArb_io_in_3_bits_data : metaArb__GEN_17; // @[Arbiter.scala 141:26 143:19]
  wire  metaArb__GEN_25 = metaArb_io_in_2_valid | metaArb__GEN_19; // @[Arbiter.scala 141:26 143:19]
  wire [39:0] metaArb__GEN_26 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_addr : metaArb__GEN_20; // @[Arbiter.scala 141:26 143:19]
  wire [5:0] metaArb__GEN_27 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_idx : metaArb__GEN_21; // @[Arbiter.scala 141:26 143:19]
  wire [3:0] metaArb__GEN_28 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_way_en : metaArb__GEN_22; // @[Arbiter.scala 141:26 143:19]
  wire [21:0] metaArb__GEN_29 = metaArb_io_in_2_valid ? metaArb_io_in_2_bits_data : metaArb__GEN_23; // @[Arbiter.scala 141:26 143:19]
  wire  metaArb__grant_T_1 = metaArb_io_in_0_valid | metaArb_io_in_2_valid; // @[Arbiter.scala 46:68]
  wire  metaArb__grant_T_2 = metaArb__grant_T_1 | metaArb_io_in_3_valid; // @[Arbiter.scala 46:68]
  wire  metaArb__grant_T_3 = metaArb__grant_T_2 | metaArb_io_in_4_valid; // @[Arbiter.scala 46:68]
  wire  metaArb__grant_T_5 = metaArb__grant_T_3 | metaArb_io_in_6_valid; // @[Arbiter.scala 46:68]
  wire  metaArb_grant_7 = ~metaArb__grant_T_5; // @[Arbiter.scala 46:78]
  wire  metaArb__io_out_valid_T = ~metaArb_grant_7; // @[Arbiter.scala 150:19]
  wire [5:0] tag_array_RW0_addr; // @[DescribedSRAM.scala 17:26]
  wire  tag_array_RW0_en; // @[DescribedSRAM.scala 17:26]
  wire  tag_array_RW0_clk; // @[DescribedSRAM.scala 17:26]
  wire  tag_array_RW0_wmode; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_wdata_0; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_wdata_1; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_wdata_2; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_wdata_3; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_rdata_0; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_rdata_1; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_rdata_2; // @[DescribedSRAM.scala 17:26]
  wire [21:0] tag_array_RW0_rdata_3; // @[DescribedSRAM.scala 17:26]
  wire  tag_array_RW0_wmask_0; // @[DescribedSRAM.scala 17:26]
  wire  tag_array_RW0_wmask_1; // @[DescribedSRAM.scala 17:26]
  wire  tag_array_RW0_wmask_2; // @[DescribedSRAM.scala 17:26]
  wire  tag_array_RW0_wmask_3; // @[DescribedSRAM.scala 17:26]
  wire  data_clock; // @[DCache.scala 130:20]
  wire  data_io_req_valid; // @[DCache.scala 130:20]
  wire [11:0] data_io_req_bits_addr; // @[DCache.scala 130:20]
  wire  data_io_req_bits_write; // @[DCache.scala 130:20]
  wire [63:0] data_io_req_bits_wdata; // @[DCache.scala 130:20]
  wire [7:0] data_io_req_bits_eccMask; // @[DCache.scala 130:20]
  wire [3:0] data_io_req_bits_way_en; // @[DCache.scala 130:20]
  wire [63:0] data_io_resp_0; // @[DCache.scala 130:20]
  wire [63:0] data_io_resp_1; // @[DCache.scala 130:20]
  wire [63:0] data_io_resp_2; // @[DCache.scala 130:20]
  wire [63:0] data_io_resp_3; // @[DCache.scala 130:20]
  wire  dataArb_io_in_0_valid;
  wire [11:0] dataArb_io_in_0_bits_addr;
  wire  dataArb_io_in_0_bits_write;
  wire [63:0] dataArb_io_in_0_bits_wdata;
  wire [7:0] dataArb_io_in_0_bits_eccMask;
  wire [3:0] dataArb_io_in_0_bits_way_en;
  wire  dataArb_io_in_1_ready;
  wire  dataArb_io_in_1_valid;
  wire [11:0] dataArb_io_in_1_bits_addr;
  wire  dataArb_io_in_1_bits_write;
  wire [63:0] dataArb_io_in_1_bits_wdata;
  wire [3:0] dataArb_io_in_1_bits_way_en;
  wire  dataArb_io_in_2_ready;
  wire  dataArb_io_in_2_valid;
  wire [11:0] dataArb_io_in_2_bits_addr;
  wire [63:0] dataArb_io_in_2_bits_wdata;
  wire  dataArb_io_in_3_ready;
  wire  dataArb_io_in_3_valid;
  wire [11:0] dataArb_io_in_3_bits_addr;
  wire [63:0] dataArb_io_in_3_bits_wdata;
  wire  dataArb_io_out_valid;
  wire [11:0] dataArb_io_out_bits_addr;
  wire  dataArb_io_out_bits_write;
  wire [63:0] dataArb_io_out_bits_wdata;
  wire [7:0] dataArb_io_out_bits_eccMask;
  wire [3:0] dataArb_io_out_bits_way_en;
  wire [11:0] dataArb__GEN_1 = dataArb_io_in_2_valid ? dataArb_io_in_2_bits_addr : dataArb_io_in_3_bits_addr; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [63:0] dataArb__GEN_3 = dataArb_io_in_2_valid ? dataArb_io_in_2_bits_wdata : dataArb_io_in_3_bits_wdata; // @[Arbiter.scala 139:15 141:26 143:19]
  wire [11:0] dataArb__GEN_8 = dataArb_io_in_1_valid ? dataArb_io_in_1_bits_addr : dataArb__GEN_1; // @[Arbiter.scala 141:26 143:19]
  wire  dataArb__GEN_9 = dataArb_io_in_1_valid & dataArb_io_in_1_bits_write; // @[Arbiter.scala 141:26 143:19]
  wire [63:0] dataArb__GEN_10 = dataArb_io_in_1_valid ? dataArb_io_in_1_bits_wdata : dataArb__GEN_3; // @[Arbiter.scala 141:26 143:19]
  wire [3:0] dataArb__GEN_13 = dataArb_io_in_1_valid ? dataArb_io_in_1_bits_way_en : 4'hf; // @[Arbiter.scala 141:26 143:19]
  wire  dataArb__grant_T = dataArb_io_in_0_valid | dataArb_io_in_1_valid; // @[Arbiter.scala 46:68]
  wire  dataArb__grant_T_1 = dataArb__grant_T | dataArb_io_in_2_valid; // @[Arbiter.scala 46:68]
  wire  dataArb_grant_3 = ~dataArb__grant_T_1; // @[Arbiter.scala 46:78]
  wire  dataArb__io_out_valid_T = ~dataArb_grant_3; // @[Arbiter.scala 150:19]
  wire [7:0] amoalu_io_mask; // @[DCache.scala 954:26]
  wire [4:0] amoalu_io_cmd; // @[DCache.scala 954:26]
  wire [63:0] amoalu_io_lhs; // @[DCache.scala 954:26]
  wire [63:0] amoalu_io_rhs; // @[DCache.scala 954:26]
  wire [63:0] amoalu_io_out; // @[DCache.scala 954:26]
  wire [7:0] lfsr_lo = {lfsr_prng_io_out_7,lfsr_prng_io_out_6,lfsr_prng_io_out_5,lfsr_prng_io_out_4,lfsr_prng_io_out_3,
    lfsr_prng_io_out_2,lfsr_prng_io_out_1,lfsr_prng_io_out_0}; // @[PRNG.scala 95:17]
  wire [15:0] lfsr = {lfsr_prng_io_out_15,lfsr_prng_io_out_14,lfsr_prng_io_out_13,lfsr_prng_io_out_12,
    lfsr_prng_io_out_11,lfsr_prng_io_out_10,lfsr_prng_io_out_9,lfsr_prng_io_out_8,lfsr_lo}; // @[PRNG.scala 95:17]
  wire  s1_valid_x12 = io_cpu_req_ready & io_cpu_req_valid; // @[Decoupled.scala 50:35]
  reg  s1_valid; // @[DCache.scala 160:21]
  reg [2:0] blockProbeAfterGrantCount; // @[DCache.scala 641:38]
  wire  _block_probe_for_core_progress_T = blockProbeAfterGrantCount > 3'h0; // @[DCache.scala 739:65]
  reg [6:0] lrscCount; // @[DCache.scala 445:22]
  wire  lrscValid = lrscCount > 7'h3; // @[DCache.scala 446:29]
  wire  block_probe_for_core_progress = blockProbeAfterGrantCount > 3'h0 | lrscValid; // @[DCache.scala 739:69]
  reg  s1_probe; // @[DCache.scala 161:21]
  reg  s2_probe; // @[DCache.scala 306:21]
  reg [3:0] release_state; // @[DCache.scala 206:26]
  wire  releaseInFlight = s1_probe | s2_probe | release_state != 4'h0; // @[DCache.scala 307:46]
  reg  release_ack_wait; // @[DCache.scala 204:29]
  reg [31:0] release_ack_addr; // @[DCache.scala 205:29]
  wire [31:0] _block_probe_for_pending_release_ack_T = auto_out_b_bits_address ^ release_ack_addr; // @[DCache.scala 740:88]
  wire  block_probe_for_pending_release_ack = release_ack_wait & _block_probe_for_pending_release_ack_T[20:6] == 15'h0; // @[DCache.scala 740:62]
  reg  grantInProgress; // @[DCache.scala 640:28]
  wire  block_probe_for_ordering = releaseInFlight | block_probe_for_pending_release_ack | grantInProgress; // @[DCache.scala 741:89]
  reg  s2_valid; // @[DCache.scala 304:21]
  wire  tl_out__b_ready = metaArb_io_in_6_ready & ~(block_probe_for_core_progress | block_probe_for_ordering | s1_valid
     | s2_valid); // @[DCache.scala 743:44]
  wire  s1_probe_x16 = tl_out__b_ready & auto_out_b_valid; // @[Decoupled.scala 50:35]
  reg [1:0] probe_bits_param; // @[Reg.scala 16:16]
  reg [3:0] probe_bits_size; // @[Reg.scala 16:16]
  reg  probe_bits_source; // @[Reg.scala 16:16]
  reg [31:0] probe_bits_address; // @[Reg.scala 16:16]
  wire  s1_valid_masked = s1_valid & ~io_cpu_s1_kill; // @[DCache.scala 164:34]
  reg [1:0] s2_probe_state_state; // @[Reg.scala 16:16]
  wire [3:0] _T_142 = {probe_bits_param,s2_probe_state_state}; // @[Cat.scala 31:58]
  wire  _T_199 = 4'h3 == _T_142; // @[Misc.scala 55:20]
  wire  _T_195 = 4'h2 == _T_142; // @[Misc.scala 55:20]
  wire  _T_191 = 4'h1 == _T_142; // @[Misc.scala 55:20]
  wire  _T_187 = 4'h0 == _T_142; // @[Misc.scala 55:20]
  wire  _T_183 = 4'h7 == _T_142; // @[Misc.scala 55:20]
  wire  _T_179 = 4'h6 == _T_142; // @[Misc.scala 55:20]
  wire  _T_175 = 4'h5 == _T_142; // @[Misc.scala 55:20]
  wire  _T_171 = 4'h4 == _T_142; // @[Misc.scala 55:20]
  wire  _T_167 = 4'hb == _T_142; // @[Misc.scala 55:20]
  wire  _T_163 = 4'ha == _T_142; // @[Misc.scala 55:20]
  wire  _T_159 = 4'h9 == _T_142; // @[Misc.scala 55:20]
  wire  _T_155 = 4'h8 == _T_142; // @[Misc.scala 55:20]
  wire  _T_172 = _T_171 ? 1'h0 : _T_167; // @[Misc.scala 37:9]
  wire  _T_176 = _T_175 ? 1'h0 : _T_172; // @[Misc.scala 37:9]
  wire  _T_180 = _T_179 ? 1'h0 : _T_176; // @[Misc.scala 37:9]
  wire  _T_188 = _T_187 ? 1'h0 : _T_183 | _T_180; // @[Misc.scala 37:9]
  wire  _T_192 = _T_191 ? 1'h0 : _T_188; // @[Misc.scala 37:9]
  wire  _T_196 = _T_195 ? 1'h0 : _T_192; // @[Misc.scala 37:9]
  wire  s2_prb_ack_data = _T_199 | _T_196; // @[Misc.scala 37:9]
  wire  _T_328 = s2_probe_state_state > 2'h0; // @[Metadata.scala 49:45]
  reg [8:0] counter_1; // @[Edges.scala 228:27]
  wire  _T_333 = release_state == 4'h1; // @[package.scala 15:47]
  wire  _T_334 = release_state == 4'h6; // @[package.scala 15:47]
  wire  _T_335 = release_state == 4'h9; // @[package.scala 15:47]
  wire  _T_337 = _T_333 | _T_334 | _T_335; // @[package.scala 72:59]
  wire [2:0] _GEN_350 = _T_335 ? 3'h6 : 3'h7; // @[DCache.scala 837:52 838:23 843:23]
  wire  _T_332 = release_state == 4'h2; // @[DCache.scala 832:25]
  wire [2:0] _GEN_342 = release_state == 4'h2 ? 3'h5 : 3'h4; // @[DCache.scala 832:48 833:21]
  wire [2:0] tl_out__c_bits_opcode = _T_337 ? _GEN_350 : _GEN_342; // @[DCache.scala 836:102]
  wire  beats1_opdata_1 = tl_out__c_bits_opcode[0]; // @[Edges.scala 101:36]
  wire [3:0] tl_out__c_bits_size = _T_337 ? 4'h6 : probe_bits_size; // @[DCache.scala 836:102]
  wire [26:0] _beats1_decode_T_5 = 27'hfff << tl_out__c_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_7 = ~_beats1_decode_T_5[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode_1 = _beats1_decode_T_7[11:3]; // @[Edges.scala 219:59]
  wire [8:0] beats1_1 = beats1_opdata_1 ? beats1_decode_1 : 9'h0; // @[Edges.scala 220:14]
  wire  c_last = counter_1 == 9'h1 | beats1_1 == 9'h0; // @[Edges.scala 231:37]
  reg  s2_release_data_valid; // @[DCache.scala 775:34]
  wire  c_first = counter_1 == 9'h0; // @[Edges.scala 230:25]
  wire  _GEN_291 = s2_prb_ack_data ? s2_release_data_valid & ~(c_first & release_ack_wait) : 1'h1; // @[DCache.scala 783:18 801:36]
  wire  _GEN_312 = s2_probe ? _GEN_291 : s2_release_data_valid & ~(c_first & release_ack_wait); // @[DCache.scala 783:18 797:21]
  wire  _GEN_329 = release_state == 4'h5 | _GEN_312; // @[DCache.scala 823:47 824:22]
  wire  tl_out__c_valid = release_state == 4'h3 | _GEN_329; // @[DCache.scala 827:48 828:22]
  wire  _T_322 = auto_out_c_ready & tl_out__c_valid; // @[Decoupled.scala 50:35]
  wire  releaseDone = c_last & _T_322; // @[Edges.scala 232:22]
  wire  _GEN_289 = _T_328 | ~releaseDone; // @[DCache.scala 803:45 809:19]
  wire  probeNack = s2_prb_ack_data | _GEN_289; // @[DCache.scala 801:36]
  reg [4:0] s1_req_cmd; // @[Reg.scala 16:16]
  wire  _s1_read_T = s1_req_cmd == 5'h0; // @[package.scala 15:47]
  wire  _s1_read_T_1 = s1_req_cmd == 5'h10; // @[package.scala 15:47]
  wire  _s1_read_T_2 = s1_req_cmd == 5'h6; // @[package.scala 15:47]
  wire  _s1_read_T_3 = s1_req_cmd == 5'h7; // @[package.scala 15:47]
  wire  _s1_read_T_6 = _s1_read_T | _s1_read_T_1 | _s1_read_T_2 | _s1_read_T_3; // @[package.scala 72:59]
  wire  _s1_read_T_7 = s1_req_cmd == 5'h4; // @[package.scala 15:47]
  wire  _s1_read_T_8 = s1_req_cmd == 5'h9; // @[package.scala 15:47]
  wire  _s1_read_T_9 = s1_req_cmd == 5'ha; // @[package.scala 15:47]
  wire  _s1_read_T_10 = s1_req_cmd == 5'hb; // @[package.scala 15:47]
  wire  _s1_read_T_13 = _s1_read_T_7 | _s1_read_T_8 | _s1_read_T_9 | _s1_read_T_10; // @[package.scala 72:59]
  wire  _s1_read_T_14 = s1_req_cmd == 5'h8; // @[package.scala 15:47]
  wire  _s1_read_T_15 = s1_req_cmd == 5'hc; // @[package.scala 15:47]
  wire  _s1_read_T_16 = s1_req_cmd == 5'hd; // @[package.scala 15:47]
  wire  _s1_read_T_17 = s1_req_cmd == 5'he; // @[package.scala 15:47]
  wire  _s1_read_T_18 = s1_req_cmd == 5'hf; // @[package.scala 15:47]
  wire  _s1_read_T_22 = _s1_read_T_14 | _s1_read_T_15 | _s1_read_T_16 | _s1_read_T_17 | _s1_read_T_18; // @[package.scala 72:59]
  wire  _s1_read_T_23 = _s1_read_T_13 | _s1_read_T_22; // @[Consts.scala 83:44]
  wire  s1_read = _s1_read_T_6 | _s1_read_T_23; // @[Consts.scala 85:68]
  reg [4:0] s2_req_cmd; // @[DCache.scala 312:19]
  wire  _s2_write_T_1 = s2_req_cmd == 5'h11; // @[Consts.scala 86:49]
  wire  _s2_write_T_3 = s2_req_cmd == 5'h7; // @[Consts.scala 86:66]
  wire  _s2_write_T_5 = s2_req_cmd == 5'h4; // @[package.scala 15:47]
  wire  _s2_write_T_6 = s2_req_cmd == 5'h9; // @[package.scala 15:47]
  wire  _s2_write_T_7 = s2_req_cmd == 5'ha; // @[package.scala 15:47]
  wire  _s2_write_T_8 = s2_req_cmd == 5'hb; // @[package.scala 15:47]
  wire  _s2_write_T_11 = _s2_write_T_5 | _s2_write_T_6 | _s2_write_T_7 | _s2_write_T_8; // @[package.scala 72:59]
  wire  _s2_write_T_12 = s2_req_cmd == 5'h8; // @[package.scala 15:47]
  wire  _s2_write_T_13 = s2_req_cmd == 5'hc; // @[package.scala 15:47]
  wire  _s2_write_T_14 = s2_req_cmd == 5'hd; // @[package.scala 15:47]
  wire  _s2_write_T_15 = s2_req_cmd == 5'he; // @[package.scala 15:47]
  wire  _s2_write_T_16 = s2_req_cmd == 5'hf; // @[package.scala 15:47]
  wire  _s2_write_T_20 = _s2_write_T_12 | _s2_write_T_13 | _s2_write_T_14 | _s2_write_T_15 | _s2_write_T_16; // @[package.scala 72:59]
  wire  _s2_write_T_21 = _s2_write_T_11 | _s2_write_T_20; // @[Consts.scala 83:44]
  wire  s2_write = s2_req_cmd == 5'h1 | s2_req_cmd == 5'h11 | s2_req_cmd == 5'h7 | _s2_write_T_21; // @[Consts.scala 86:76]
  reg  pstore1_held; // @[DCache.scala 477:29]
  wire  pstore1_valid_likely = s2_valid & s2_write | pstore1_held; // @[DCache.scala 478:51]
  reg [39:0] pstore1_addr; // @[Reg.scala 16:16]
  reg [39:0] s1_req_addr; // @[Reg.scala 16:16]
  wire [39:0] s1_vaddr = {s1_req_addr[39:12],s1_req_addr[11:0]}; // @[Cat.scala 31:58]
  wire  _s1_write_T_1 = s1_req_cmd == 5'h11; // @[Consts.scala 86:49]
  wire  s1_write = s1_req_cmd == 5'h1 | s1_req_cmd == 5'h11 | _s1_read_T_3 | _s1_read_T_23; // @[Consts.scala 86:76]
  reg [7:0] pstore1_mask; // @[Reg.scala 16:16]
  wire  _s1_hazard_T_18 = |pstore1_mask[7]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_17 = |pstore1_mask[6]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_16 = |pstore1_mask[5]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_15 = |pstore1_mask[4]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_14 = |pstore1_mask[3]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_13 = |pstore1_mask[2]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_12 = |pstore1_mask[1]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_11 = |pstore1_mask[0]; // @[DCache.scala 1153:66]
  wire [7:0] _s1_hazard_T_19 = {_s1_hazard_T_18,_s1_hazard_T_17,_s1_hazard_T_16,_s1_hazard_T_15,_s1_hazard_T_14,
    _s1_hazard_T_13,_s1_hazard_T_12,_s1_hazard_T_11}; // @[Cat.scala 31:58]
  wire [7:0] _s1_hazard_T_28 = {_s1_hazard_T_19[7],_s1_hazard_T_19[6],_s1_hazard_T_19[5],_s1_hazard_T_19[4],
    _s1_hazard_T_19[3],_s1_hazard_T_19[2],_s1_hazard_T_19[1],_s1_hazard_T_19[0]}; // @[Cat.scala 31:58]
  reg [1:0] s1_req_size; // @[Reg.scala 16:16]
  wire  s1_mask_xwr_upper = s1_req_addr[0] | s1_req_size >= 2'h1; // @[AMOALU.scala 18:42]
  wire  s1_mask_xwr_lower = s1_req_addr[0] ? 1'h0 : 1'h1; // @[AMOALU.scala 19:22]
  wire [1:0] _s1_mask_xwr_T = {s1_mask_xwr_upper,s1_mask_xwr_lower}; // @[Cat.scala 31:58]
  wire [1:0] _s1_mask_xwr_upper_T_5 = s1_req_addr[1] ? _s1_mask_xwr_T : 2'h0; // @[AMOALU.scala 18:22]
  wire [1:0] _s1_mask_xwr_upper_T_7 = s1_req_size >= 2'h2 ? 2'h3 : 2'h0; // @[AMOALU.scala 18:47]
  wire [1:0] s1_mask_xwr_upper_1 = _s1_mask_xwr_upper_T_5 | _s1_mask_xwr_upper_T_7; // @[AMOALU.scala 18:42]
  wire [1:0] s1_mask_xwr_lower_1 = s1_req_addr[1] ? 2'h0 : _s1_mask_xwr_T; // @[AMOALU.scala 19:22]
  wire [3:0] _s1_mask_xwr_T_1 = {s1_mask_xwr_upper_1,s1_mask_xwr_lower_1}; // @[Cat.scala 31:58]
  wire [3:0] _s1_mask_xwr_upper_T_9 = s1_req_addr[2] ? _s1_mask_xwr_T_1 : 4'h0; // @[AMOALU.scala 18:22]
  wire [3:0] _s1_mask_xwr_upper_T_11 = s1_req_size >= 2'h3 ? 4'hf : 4'h0; // @[AMOALU.scala 18:47]
  wire [3:0] s1_mask_xwr_upper_2 = _s1_mask_xwr_upper_T_9 | _s1_mask_xwr_upper_T_11; // @[AMOALU.scala 18:42]
  wire [3:0] s1_mask_xwr_lower_2 = s1_req_addr[2] ? 4'h0 : _s1_mask_xwr_T_1; // @[AMOALU.scala 19:22]
  wire [7:0] s1_mask_xwr = {s1_mask_xwr_upper_2,s1_mask_xwr_lower_2}; // @[Cat.scala 31:58]
  wire  _s1_hazard_T_44 = |s1_mask_xwr[7]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_43 = |s1_mask_xwr[6]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_42 = |s1_mask_xwr[5]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_41 = |s1_mask_xwr[4]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_40 = |s1_mask_xwr[3]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_39 = |s1_mask_xwr[2]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_38 = |s1_mask_xwr[1]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_37 = |s1_mask_xwr[0]; // @[DCache.scala 1153:66]
  wire [7:0] _s1_hazard_T_45 = {_s1_hazard_T_44,_s1_hazard_T_43,_s1_hazard_T_42,_s1_hazard_T_41,_s1_hazard_T_40,
    _s1_hazard_T_39,_s1_hazard_T_38,_s1_hazard_T_37}; // @[Cat.scala 31:58]
  wire [7:0] _s1_hazard_T_54 = {_s1_hazard_T_45[7],_s1_hazard_T_45[6],_s1_hazard_T_45[5],_s1_hazard_T_45[4],
    _s1_hazard_T_45[3],_s1_hazard_T_45[2],_s1_hazard_T_45[1],_s1_hazard_T_45[0]}; // @[Cat.scala 31:58]
  wire [7:0] _s1_hazard_T_55 = _s1_hazard_T_28 & _s1_hazard_T_54; // @[DCache.scala 535:38]
  wire [7:0] _s1_hazard_T_57 = pstore1_mask & s1_mask_xwr; // @[DCache.scala 535:77]
  wire  _s1_hazard_T_59 = s1_write ? |_s1_hazard_T_55 : |_s1_hazard_T_57; // @[DCache.scala 535:8]
  wire  _s1_hazard_T_60 = pstore1_addr[11:3] == s1_vaddr[11:3] & _s1_hazard_T_59; // @[DCache.scala 534:65]
  reg  pstore2_valid; // @[DCache.scala 474:30]
  reg [39:0] pstore2_addr; // @[Reg.scala 16:16]
  reg [7:0] mask; // @[DCache.scala 504:19]
  wire  _s1_hazard_T_80 = |mask[7]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_79 = |mask[6]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_78 = |mask[5]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_77 = |mask[4]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_76 = |mask[3]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_75 = |mask[2]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_74 = |mask[1]; // @[DCache.scala 1153:66]
  wire  _s1_hazard_T_73 = |mask[0]; // @[DCache.scala 1153:66]
  wire [7:0] _s1_hazard_T_81 = {_s1_hazard_T_80,_s1_hazard_T_79,_s1_hazard_T_78,_s1_hazard_T_77,_s1_hazard_T_76,
    _s1_hazard_T_75,_s1_hazard_T_74,_s1_hazard_T_73}; // @[Cat.scala 31:58]
  wire [7:0] _s1_hazard_T_90 = {_s1_hazard_T_81[7],_s1_hazard_T_81[6],_s1_hazard_T_81[5],_s1_hazard_T_81[4],
    _s1_hazard_T_81[3],_s1_hazard_T_81[2],_s1_hazard_T_81[1],_s1_hazard_T_81[0]}; // @[Cat.scala 31:58]
  wire [7:0] _s1_hazard_T_117 = _s1_hazard_T_90 & _s1_hazard_T_54; // @[DCache.scala 535:38]
  wire [7:0] _s1_hazard_T_119 = mask & s1_mask_xwr; // @[DCache.scala 535:77]
  wire  _s1_hazard_T_121 = s1_write ? |_s1_hazard_T_117 : |_s1_hazard_T_119; // @[DCache.scala 535:8]
  wire  _s1_hazard_T_122 = pstore2_addr[11:3] == s1_vaddr[11:3] & _s1_hazard_T_121; // @[DCache.scala 534:65]
  wire  _s1_hazard_T_123 = pstore2_valid & _s1_hazard_T_122; // @[DCache.scala 538:21]
  wire  s1_hazard = pstore1_valid_likely & _s1_hazard_T_60 | _s1_hazard_T_123; // @[DCache.scala 537:69]
  wire  s1_raw_hazard = s1_read & s1_hazard; // @[DCache.scala 539:31]
  wire [7:0] _s2_valid_no_xcpt_T = {io_cpu_s2_xcpt_ma_ld,io_cpu_s2_xcpt_ma_st,io_cpu_s2_xcpt_pf_ld,io_cpu_s2_xcpt_pf_st,
    io_cpu_s2_xcpt_gf_ld,io_cpu_s2_xcpt_gf_st,io_cpu_s2_xcpt_ae_ld,io_cpu_s2_xcpt_ae_st}; // @[DCache.scala 305:54]
  wire  s2_valid_no_xcpt = s2_valid & ~(|_s2_valid_no_xcpt_T); // @[DCache.scala 305:35]
  reg  s2_not_nacked_in_s1; // @[DCache.scala 308:36]
  wire  s2_valid_masked = s2_valid_no_xcpt & s2_not_nacked_in_s1; // @[DCache.scala 310:42]
  wire  _c_cat_T_48 = s2_req_cmd == 5'h6; // @[Consts.scala 87:71]
  wire  _c_cat_T_49 = s2_write | s2_req_cmd == 5'h3 | s2_req_cmd == 5'h6; // @[Consts.scala 87:64]
  reg [1:0] s2_hit_state_state; // @[Reg.scala 16:16]
  wire [3:0] _T_75 = {s2_write,_c_cat_T_49,s2_hit_state_state}; // @[Cat.scala 31:58]
  wire  _T_133 = 4'h3 == _T_75; // @[Misc.scala 48:20]
  wire  _T_130 = 4'h2 == _T_75; // @[Misc.scala 48:20]
  wire  _T_127 = 4'h1 == _T_75; // @[Misc.scala 48:20]
  wire  _T_124 = 4'h7 == _T_75; // @[Misc.scala 48:20]
  wire  _T_121 = 4'h6 == _T_75; // @[Misc.scala 48:20]
  wire  _T_118 = 4'hf == _T_75; // @[Misc.scala 48:20]
  wire  _T_115 = 4'he == _T_75; // @[Misc.scala 48:20]
  wire  _T_112 = 4'h0 == _T_75; // @[Misc.scala 48:20]
  wire  _T_109 = 4'h5 == _T_75; // @[Misc.scala 48:20]
  wire  _T_106 = 4'h4 == _T_75; // @[Misc.scala 48:20]
  wire  _T_103 = 4'hd == _T_75; // @[Misc.scala 48:20]
  wire  _T_100 = 4'hc == _T_75; // @[Misc.scala 48:20]
  wire  s2_hit = _T_133 | (_T_130 | (_T_127 | (_T_124 | (_T_121 | (_T_118 | _T_115))))); // @[Misc.scala 34:9]
  wire  s2_valid_hit_maybe_flush_pre_data_ecc_and_waw = s2_valid_masked & s2_hit; // @[DCache.scala 370:89]
  wire  _s2_read_T = s2_req_cmd == 5'h0; // @[package.scala 15:47]
  wire  _s2_read_T_1 = s2_req_cmd == 5'h10; // @[package.scala 15:47]
  wire  _s2_read_T_6 = _s2_read_T | _s2_read_T_1 | _c_cat_T_48 | _s2_write_T_3; // @[package.scala 72:59]
  wire  s2_read = _s2_read_T_6 | _s2_write_T_21; // @[Consts.scala 85:68]
  wire  s2_readwrite = s2_read | s2_write; // @[DCache.scala 327:30]
  wire  s2_valid_hit_pre_data_ecc_and_waw = s2_valid_hit_maybe_flush_pre_data_ecc_and_waw & s2_readwrite; // @[DCache.scala 391:89]
  wire [1:0] _T_102 = _T_100 ? 2'h1 : 2'h0; // @[Misc.scala 34:36]
  wire [1:0] _T_105 = _T_103 ? 2'h2 : _T_102; // @[Misc.scala 34:36]
  wire [1:0] _T_108 = _T_106 ? 2'h1 : _T_105; // @[Misc.scala 34:36]
  wire [1:0] _T_111 = _T_109 ? 2'h2 : _T_108; // @[Misc.scala 34:36]
  wire [1:0] _T_114 = _T_112 ? 2'h0 : _T_111; // @[Misc.scala 34:36]
  wire [1:0] _T_117 = _T_115 ? 2'h3 : _T_114; // @[Misc.scala 34:36]
  wire [1:0] _T_120 = _T_118 ? 2'h3 : _T_117; // @[Misc.scala 34:36]
  wire [1:0] _T_123 = _T_121 ? 2'h2 : _T_120; // @[Misc.scala 34:36]
  wire [1:0] _T_126 = _T_124 ? 2'h3 : _T_123; // @[Misc.scala 34:36]
  wire [1:0] _T_129 = _T_127 ? 2'h1 : _T_126; // @[Misc.scala 34:36]
  wire [1:0] _T_132 = _T_130 ? 2'h2 : _T_129; // @[Misc.scala 34:36]
  wire [1:0] s2_grow_param = _T_133 ? 2'h3 : _T_132; // @[Misc.scala 34:36]
  wire  _s2_update_meta_T = s2_hit_state_state == s2_grow_param; // @[Metadata.scala 45:46]
  wire  s2_update_meta = ~_s2_update_meta_T; // @[Metadata.scala 46:40]
  wire  s1_readwrite = s1_read | s1_write; // @[DCache.scala 190:30]
  wire  s1_flush_line = s1_req_cmd == 5'h5 & s1_req_size[0]; // @[DCache.scala 192:50]
  wire  s1_cmd_uses_tlb = s1_readwrite | s1_flush_line | s1_req_cmd == 5'h17; // @[DCache.scala 248:55]
  wire  _T_14 = s1_valid & s1_cmd_uses_tlb & tlb_io_resp_miss; // @[DCache.scala 254:58]
  wire  _GEN_141 = io_cpu_s2_nack | s2_valid_hit_pre_data_ecc_and_waw & s2_update_meta | _T_14; // @[DCache.scala 419:{82,92}]
  wire  _GEN_165 = s1_valid & s1_raw_hazard | _GEN_141; // @[DCache.scala 544:{36,46}]
  wire  _GEN_310 = probeNack | _GEN_165; // @[DCache.scala 812:{24,34}]
  wire  s1_nack = s2_probe ? _GEN_310 : _GEN_165; // @[DCache.scala 797:21]
  wire  _s1_valid_not_nacked_T = ~s1_nack; // @[DCache.scala 165:41]
  wire  s1_valid_not_nacked = s1_valid & ~s1_nack; // @[DCache.scala 165:38]
  wire  s0_clk_en = metaArb_io_out_valid & ~metaArb_io_out_bits_write; // @[DCache.scala 168:40]
  wire [39:0] s0_req_addr = {metaArb_io_out_bits_addr[39:6],io_cpu_req_bits_addr[5:0]}; // @[Cat.scala 31:58]
  wire  _T = ~metaArb_io_in_7_ready; // @[DCache.scala 173:9]
  wire  s0_req_phys = ~metaArb_io_in_7_ready | io_cpu_req_bits_phys; // @[DCache.scala 173:{34,48}]
  reg [6:0] s1_req_tag; // @[Reg.scala 16:16]
  reg  s1_req_signed; // @[Reg.scala 16:16]
  reg [1:0] s1_req_dprv; // @[Reg.scala 16:16]
  reg [39:0] s1_tlb_req_vaddr; // @[Reg.scala 16:16]
  reg  s1_tlb_req_passthrough; // @[Reg.scala 16:16]
  reg [1:0] s1_tlb_req_size; // @[Reg.scala 16:16]
  reg [4:0] s1_tlb_req_cmd; // @[Reg.scala 16:16]
  reg [1:0] s1_tlb_req_prv; // @[Reg.scala 16:16]
  wire  s1_sfence = s1_req_cmd == 5'h14 | s1_req_cmd == 5'h15 | s1_req_cmd == 5'h16; // @[DCache.scala 191:71]
  reg  cached_grant_wait; // @[DCache.scala 201:30]
  reg  resetting; // @[DCache.scala 202:26]
  reg [7:0] flushCounter; // @[DCache.scala 203:25]
  reg [3:0] refill_way; // @[DCache.scala 207:23]
  wire  inWriteback = _T_333 | _T_332; // @[package.scala 72:59]
  wire  _io_cpu_req_ready_T_1 = ~cached_grant_wait; // @[DCache.scala 211:54]
  reg  uncachedInFlight_0; // @[DCache.scala 214:33]
  reg [39:0] uncachedReqs_0_addr; // @[DCache.scala 215:25]
  reg [6:0] uncachedReqs_0_tag; // @[DCache.scala 215:25]
  reg [1:0] uncachedReqs_0_size; // @[DCache.scala 215:25]
  reg  uncachedReqs_0_signed; // @[DCache.scala 215:25]
  wire  _s0_read_T = io_cpu_req_bits_cmd == 5'h0; // @[package.scala 15:47]
  wire  _s0_read_T_1 = io_cpu_req_bits_cmd == 5'h10; // @[package.scala 15:47]
  wire  _s0_read_T_2 = io_cpu_req_bits_cmd == 5'h6; // @[package.scala 15:47]
  wire  _s0_read_T_3 = io_cpu_req_bits_cmd == 5'h7; // @[package.scala 15:47]
  wire  _s0_read_T_6 = _s0_read_T | _s0_read_T_1 | _s0_read_T_2 | _s0_read_T_3; // @[package.scala 72:59]
  wire  _s0_read_T_7 = io_cpu_req_bits_cmd == 5'h4; // @[package.scala 15:47]
  wire  _s0_read_T_8 = io_cpu_req_bits_cmd == 5'h9; // @[package.scala 15:47]
  wire  _s0_read_T_9 = io_cpu_req_bits_cmd == 5'ha; // @[package.scala 15:47]
  wire  _s0_read_T_10 = io_cpu_req_bits_cmd == 5'hb; // @[package.scala 15:47]
  wire  _s0_read_T_13 = _s0_read_T_7 | _s0_read_T_8 | _s0_read_T_9 | _s0_read_T_10; // @[package.scala 72:59]
  wire  _s0_read_T_14 = io_cpu_req_bits_cmd == 5'h8; // @[package.scala 15:47]
  wire  _s0_read_T_15 = io_cpu_req_bits_cmd == 5'hc; // @[package.scala 15:47]
  wire  _s0_read_T_16 = io_cpu_req_bits_cmd == 5'hd; // @[package.scala 15:47]
  wire  _s0_read_T_17 = io_cpu_req_bits_cmd == 5'he; // @[package.scala 15:47]
  wire  _s0_read_T_18 = io_cpu_req_bits_cmd == 5'hf; // @[package.scala 15:47]
  wire  _s0_read_T_22 = _s0_read_T_14 | _s0_read_T_15 | _s0_read_T_16 | _s0_read_T_17 | _s0_read_T_18; // @[package.scala 72:59]
  wire  _s0_read_T_23 = _s0_read_T_13 | _s0_read_T_22; // @[Consts.scala 83:44]
  wire  s0_read = _s0_read_T_6 | _s0_read_T_23; // @[Consts.scala 85:68]
  wire  _dataArb_io_in_3_valid_res_T = io_cpu_req_bits_cmd == 5'h1; // @[package.scala 15:47]
  wire  _dataArb_io_in_3_valid_res_T_1 = io_cpu_req_bits_cmd == 5'h3; // @[package.scala 15:47]
  wire  _dataArb_io_in_3_valid_res_T_2 = _dataArb_io_in_3_valid_res_T | _dataArb_io_in_3_valid_res_T_1; // @[package.scala 72:59]
  wire  res = ~_dataArb_io_in_3_valid_res_T_2; // @[DCache.scala 1157:15]
  wire  _dataArb_io_in_3_valid_T_26 = io_cpu_req_bits_cmd == 5'h11; // @[Consts.scala 86:49]
  wire  _dataArb_io_in_3_valid_T_47 = _dataArb_io_in_3_valid_res_T | io_cpu_req_bits_cmd == 5'h11 | _s0_read_T_3 |
    _s0_read_T_23; // @[Consts.scala 86:76]
  wire  _dataArb_io_in_3_valid_T_51 = _dataArb_io_in_3_valid_T_47 & _dataArb_io_in_3_valid_T_26; // @[DCache.scala 1163:23]
  wire  _dataArb_io_in_3_valid_T_52 = s0_read | _dataArb_io_in_3_valid_T_51; // @[DCache.scala 1162:21]
  wire  _dataArb_io_in_3_valid_T_56 = ~reset; // @[DCache.scala 1158:11]
  wire  _dataArb_io_in_3_valid_T_58 = io_cpu_req_valid & res; // @[DCache.scala 220:46]
  wire [39:0] _dataArb_io_in_3_bits_addr_T_2 = {io_cpu_req_bits_addr[39:12],io_cpu_req_bits_addr[11:0]}; // @[Cat.scala 31:58]
  wire  _GEN_33 = ~dataArb_io_in_3_ready & s0_read ? 1'h0 : release_state == 4'h0 & ~cached_grant_wait &
    _s1_valid_not_nacked_T; // @[DCache.scala 211:20 236:{45,64}]
  wire  _s1_did_read_T_54 = dataArb_io_in_3_ready & (io_cpu_req_valid & _dataArb_io_in_3_valid_T_52); // @[DCache.scala 237:54]
  reg  s1_did_read; // @[Reg.scala 16:16]
  wire  _GEN_36 = _T ? 1'h0 : _GEN_33; // @[DCache.scala 245:{34,53}]
  wire  _GEN_37 = ~tlb_io_req_ready & ~tlb_io_ptw_resp_valid & ~io_cpu_req_bits_phys ? 1'h0 : _GEN_36; // @[DCache.scala 253:{79,98}]
  wire [31:0] s1_paddr = {tlb_io_resp_paddr[31:12],s1_req_addr[11:0]}; // @[Cat.scala 31:58]
  wire  _T_19 = metaArb_io_out_valid & metaArb_io_out_bits_write; // @[DCache.scala 283:27]
  wire [21:0] _WIRE_2 = tag_array_RW0_rdata_0;
  wire [19:0] s1_meta_uncorrected_0_tag = _WIRE_2[19:0]; // @[DCache.scala 288:80]
  wire [1:0] s1_meta_uncorrected_0_coh_state = _WIRE_2[21:20]; // @[DCache.scala 288:80]
  wire [21:0] _WIRE_3 = tag_array_RW0_rdata_1;
  wire [19:0] s1_meta_uncorrected_1_tag = _WIRE_3[19:0]; // @[DCache.scala 288:80]
  wire [1:0] s1_meta_uncorrected_1_coh_state = _WIRE_3[21:20]; // @[DCache.scala 288:80]
  wire [21:0] _WIRE_4 = tag_array_RW0_rdata_2;
  wire [19:0] s1_meta_uncorrected_2_tag = _WIRE_4[19:0]; // @[DCache.scala 288:80]
  wire [1:0] s1_meta_uncorrected_2_coh_state = _WIRE_4[21:20]; // @[DCache.scala 288:80]
  wire [21:0] _WIRE_5 = tag_array_RW0_rdata_3;
  wire [19:0] s1_meta_uncorrected_3_tag = _WIRE_5[19:0]; // @[DCache.scala 288:80]
  wire [1:0] s1_meta_uncorrected_3_coh_state = _WIRE_5[21:20]; // @[DCache.scala 288:80]
  wire [19:0] s1_tag = s1_paddr[31:12]; // @[DCache.scala 289:29]
  wire  _T_32 = s1_meta_uncorrected_0_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_33 = s1_meta_uncorrected_0_tag == s1_tag; // @[DCache.scala 290:83]
  wire  _T_34 = _T_32 & s1_meta_uncorrected_0_tag == s1_tag; // @[DCache.scala 290:74]
  wire  _T_35 = s1_meta_uncorrected_1_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_36 = s1_meta_uncorrected_1_tag == s1_tag; // @[DCache.scala 290:83]
  wire  _T_37 = _T_35 & s1_meta_uncorrected_1_tag == s1_tag; // @[DCache.scala 290:74]
  wire  _T_38 = s1_meta_uncorrected_2_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_39 = s1_meta_uncorrected_2_tag == s1_tag; // @[DCache.scala 290:83]
  wire  _T_40 = _T_38 & s1_meta_uncorrected_2_tag == s1_tag; // @[DCache.scala 290:74]
  wire  _T_41 = s1_meta_uncorrected_3_coh_state > 2'h0; // @[Metadata.scala 49:45]
  wire  _T_42 = s1_meta_uncorrected_3_tag == s1_tag; // @[DCache.scala 290:83]
  wire  _T_43 = _T_41 & s1_meta_uncorrected_3_tag == s1_tag; // @[DCache.scala 290:74]
  wire [3:0] s1_meta_hit_way = {_T_43,_T_40,_T_37,_T_34}; // @[Cat.scala 31:58]
  wire [1:0] _T_47 = _T_33 ? s1_meta_uncorrected_0_coh_state : 2'h0; // @[DCache.scala 292:41]
  wire [1:0] _T_51 = _T_36 ? s1_meta_uncorrected_1_coh_state : 2'h0; // @[DCache.scala 292:41]
  wire [1:0] _T_55 = _T_39 ? s1_meta_uncorrected_2_coh_state : 2'h0; // @[DCache.scala 292:41]
  wire [1:0] _T_59 = _T_42 ? s1_meta_uncorrected_3_coh_state : 2'h0; // @[DCache.scala 292:41]
  wire [1:0] _T_60 = _T_47 | _T_51; // @[DCache.scala 293:19]
  wire [1:0] _T_61 = _T_60 | _T_55; // @[DCache.scala 293:19]
  wire [1:0] s1_meta_hit_state_state = _T_61 | _T_59; // @[DCache.scala 293:19]
  wire  s2_hit_valid = s2_hit_state_state > 2'h0; // @[Metadata.scala 49:45]
  reg [3:0] s2_hit_way; // @[Reg.scala 16:16]
  reg [1:0] s2_victim_way_r; // @[Reg.scala 16:16]
  wire [3:0] s2_victim_way = 4'h1 << s2_victim_way_r; // @[OneHot.scala 57:35]
  wire [3:0] s2_victim_or_hit_way = s2_hit_valid ? s2_hit_way : s2_victim_way; // @[DCache.scala 405:33]
  reg [3:0] s2_probe_way; // @[Reg.scala 16:16]
  wire [3:0] releaseWay = _T_337 ? s2_victim_or_hit_way : s2_probe_way; // @[DCache.scala 836:102 786:14 850:18]
  wire [3:0] s1_data_way_x42 = inWriteback ? releaseWay : s1_meta_hit_way; // @[DCache.scala 296:61]
  wire [31:0] tl_d_data_encoded_lo = {auto_out_d_bits_data[31:24],auto_out_d_bits_data[23:16],auto_out_d_bits_data[15:8]
    ,auto_out_d_bits_data[7:0]}; // @[Cat.scala 31:58]
  wire [31:0] tl_d_data_encoded_hi = {auto_out_d_bits_data[63:56],auto_out_d_bits_data[55:48],auto_out_d_bits_data[47:40
    ],auto_out_d_bits_data[39:32]}; // @[Cat.scala 31:58]
  wire [63:0] _tl_d_data_encoded_T_8 = {auto_out_d_bits_data[63:56],auto_out_d_bits_data[55:48],auto_out_d_bits_data[47:
    40],auto_out_d_bits_data[39:32],auto_out_d_bits_data[31:24],auto_out_d_bits_data[23:16],auto_out_d_bits_data[15:8],
    auto_out_d_bits_data[7:0]}; // @[Cat.scala 31:58]
  wire [7:0] _T_67 = ~io_cpu_s1_data_mask; // @[DCache.scala 302:71]
  wire [7:0] _T_68 = s1_mask_xwr | _T_67; // @[DCache.scala 302:69]
  wire  s2_valid_x44 = s1_valid_masked & ~s1_sfence; // @[DCache.scala 304:43]
  reg [39:0] s2_req_addr; // @[DCache.scala 312:19]
  reg [6:0] s2_req_tag; // @[DCache.scala 312:19]
  reg [1:0] s2_req_size; // @[DCache.scala 312:19]
  reg  s2_req_signed; // @[DCache.scala 312:19]
  reg [1:0] s2_req_dprv; // @[DCache.scala 312:19]
  wire  _s2_cmd_flush_all_T = s2_req_cmd == 5'h5; // @[DCache.scala 313:37]
  wire  s2_cmd_flush_line = _s2_cmd_flush_all_T & s2_req_size[0]; // @[DCache.scala 314:54]
  reg  s2_tlb_xcpt_pf_ld; // @[DCache.scala 315:24]
  reg  s2_tlb_xcpt_pf_st; // @[DCache.scala 315:24]
  reg  s2_tlb_xcpt_ae_ld; // @[DCache.scala 315:24]
  reg  s2_tlb_xcpt_ae_st; // @[DCache.scala 315:24]
  reg  s2_tlb_xcpt_ma_ld; // @[DCache.scala 315:24]
  reg  s2_tlb_xcpt_ma_st; // @[DCache.scala 315:24]
  reg  s2_pma_cacheable; // @[DCache.scala 316:19]
  reg [39:0] s2_uncached_resp_addr; // @[DCache.scala 317:34]
  wire [39:0] _GEN_63 = s1_valid_not_nacked ? {{8'd0}, s1_paddr} : s2_req_addr; // @[DCache.scala 318:48 320:17 312:19]
  wire [6:0] _GEN_64 = s1_valid_not_nacked ? s1_req_tag : s2_req_tag; // @[DCache.scala 318:48 319:12 312:19]
  wire [4:0] _GEN_65 = s1_valid_not_nacked ? s1_req_cmd : s2_req_cmd; // @[DCache.scala 318:48 319:12 312:19]
  wire [1:0] _GEN_66 = s1_valid_not_nacked ? s1_req_size : s2_req_size; // @[DCache.scala 318:48 319:12 312:19]
  wire  _GEN_67 = s1_valid_not_nacked ? s1_req_signed : s2_req_signed; // @[DCache.scala 318:48 319:12 312:19]
  reg [39:0] s2_vaddr_r; // @[Reg.scala 16:16]
  wire [39:0] s2_vaddr = {s2_vaddr_r[39:12],s2_req_addr[11:0]}; // @[Cat.scala 31:58]
  wire  s1_meta_clk_en = s1_valid_not_nacked | s1_probe; // @[DCache.scala 330:62]
  reg [21:0] s2_meta_corrected_r; // @[Reg.scala 16:16]
  wire [19:0] s2_meta_corrected_0_tag = s2_meta_corrected_r[19:0]; // @[DCache.scala 334:99]
  wire [1:0] s2_meta_corrected_0_coh_state = s2_meta_corrected_r[21:20]; // @[DCache.scala 334:99]
  reg [21:0] s2_meta_corrected_r_1; // @[Reg.scala 16:16]
  wire [19:0] s2_meta_corrected_1_tag = s2_meta_corrected_r_1[19:0]; // @[DCache.scala 334:99]
  wire [1:0] s2_meta_corrected_1_coh_state = s2_meta_corrected_r_1[21:20]; // @[DCache.scala 334:99]
  reg [21:0] s2_meta_corrected_r_2; // @[Reg.scala 16:16]
  wire [19:0] s2_meta_corrected_2_tag = s2_meta_corrected_r_2[19:0]; // @[DCache.scala 334:99]
  wire [1:0] s2_meta_corrected_2_coh_state = s2_meta_corrected_r_2[21:20]; // @[DCache.scala 334:99]
  reg [21:0] s2_meta_corrected_r_3; // @[Reg.scala 16:16]
  wire [19:0] s2_meta_corrected_3_tag = s2_meta_corrected_r_3[19:0]; // @[DCache.scala 334:99]
  wire [1:0] s2_meta_corrected_3_coh_state = s2_meta_corrected_r_3[21:20]; // @[DCache.scala 334:99]
  wire  en = s1_valid | inWriteback | io_cpu_replay_next; // @[DCache.scala 339:38]
  wire  word_en = inWriteback | s1_did_read; // @[DCache.scala 340:22]
  wire [63:0] s1_all_data_ways_0 = data_io_resp_0; // @[DCache.scala 298:{29,29}]
  wire [63:0] s1_all_data_ways_1 = data_io_resp_1; // @[DCache.scala 298:{29,29}]
  wire [63:0] s1_all_data_ways_2 = data_io_resp_2; // @[DCache.scala 298:{29,29}]
  wire [63:0] s1_all_data_ways_3 = data_io_resp_3; // @[DCache.scala 298:{29,29}]
  wire  s1_word_en = ~io_cpu_replay_next ? word_en : 1'h1; // @[DCache.scala 350:27]
  wire  grantIsUncachedData = auto_out_d_bits_opcode == 3'h1; // @[package.scala 15:47]
  reg  blockUncachedGrant; // @[DCache.scala 723:33]
  wire  grantIsRefill = auto_out_d_bits_opcode == 3'h5; // @[DCache.scala 639:29]
  wire  _T_316 = ~dataArb_io_in_1_ready; // @[DCache.scala 695:26]
  wire  _grantIsCached_T = auto_out_d_bits_opcode == 3'h4; // @[package.scala 15:47]
  wire  grantIsCached = _grantIsCached_T | grantIsRefill; // @[package.scala 72:59]
  reg [8:0] counter; // @[Edges.scala 228:27]
  wire  d_first = counter == 9'h0; // @[Edges.scala 230:25]
  wire  canAcceptCachedGrant = ~_T_337; // @[DCache.scala 643:30]
  wire  _bundleOut_0_d_ready_T_3 = grantIsCached ? (~d_first | auto_out_e_ready) & canAcceptCachedGrant : 1'h1; // @[DCache.scala 644:24]
  wire  _GEN_260 = grantIsRefill & ~dataArb_io_in_1_ready ? 1'h0 : _bundleOut_0_d_ready_T_3; // @[DCache.scala 644:18 695:51 697:20]
  wire  tl_out__d_ready = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? 1'h0 : _GEN_260; // @[DCache.scala 725:68 726:22]
  wire  _T_296 = tl_out__d_ready & auto_out_d_valid; // @[Decoupled.scala 50:35]
  wire  _T_292 = auto_out_d_bits_opcode == 3'h0; // @[package.scala 15:47]
  wire  _T_293 = auto_out_d_bits_opcode == 3'h2; // @[package.scala 15:47]
  wire  grantIsUncached = grantIsUncachedData | _T_292 | _T_293; // @[package.scala 72:59]
  wire [4:0] _GEN_216 = grantIsUncachedData ? 5'h10 : {{1'd0}, s1_data_way_x42}; // @[DCache.scala 664:34 667:25]
  wire [4:0] _GEN_225 = grantIsUncached ? _GEN_216 : {{1'd0}, s1_data_way_x42}; // @[DCache.scala 657:35]
  wire [4:0] _GEN_238 = grantIsCached ? {{1'd0}, s1_data_way_x42} : _GEN_225; // @[DCache.scala 648:26]
  wire [4:0] s1_data_way = _T_296 ? _GEN_238 : {{1'd0}, s1_data_way_x42}; // @[DCache.scala 647:26]
  wire [4:0] _s2_data_T_1 = s1_word_en ? s1_data_way : 5'h0; // @[DCache.scala 352:28]
  wire [63:0] _s2_data_T_7 = _s2_data_T_1[0] ? s1_all_data_ways_0 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_8 = _s2_data_T_1[1] ? s1_all_data_ways_1 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_9 = _s2_data_T_1[2] ? s1_all_data_ways_2 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_10 = _s2_data_T_1[3] ? s1_all_data_ways_3 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_11 = _s2_data_T_1[4] ? _tl_d_data_encoded_T_8 : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_12 = _s2_data_T_7 | _s2_data_T_8; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_13 = _s2_data_T_12 | _s2_data_T_9; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_14 = _s2_data_T_13 | _s2_data_T_10; // @[Mux.scala 27:73]
  wire [63:0] _s2_data_T_15 = _s2_data_T_14 | _s2_data_T_11; // @[Mux.scala 27:73]
  reg [63:0] s2_data; // @[Reg.scala 16:16]
  wire [31:0] s2_data_corrected_lo = {s2_data[31:24],s2_data[23:16],s2_data[15:8],s2_data[7:0]}; // @[Cat.scala 31:58]
  wire [31:0] s2_data_corrected_hi = {s2_data[63:56],s2_data[55:48],s2_data[47:40],s2_data[39:32]}; // @[Cat.scala 31:58]
  wire [63:0] s2_data_corrected = {s2_data[63:56],s2_data[55:48],s2_data[47:40],s2_data[39:32],s2_data[31:24],s2_data[23
    :16],s2_data[15:8],s2_data[7:0]}; // @[Cat.scala 31:58]
  wire  s2_valid_flush_line = s2_valid_hit_maybe_flush_pre_data_ecc_and_waw & s2_cmd_flush_line; // @[DCache.scala 392:75]
  wire  s2_valid_miss = s2_valid_masked & s2_readwrite & ~s2_hit; // @[DCache.scala 396:73]
  wire  s2_uncached = ~s2_pma_cacheable; // @[DCache.scala 397:21]
  wire  _s2_valid_cached_miss_T = ~s2_uncached; // @[DCache.scala 398:47]
  wire  _s2_valid_cached_miss_T_2 = |uncachedInFlight_0; // @[DCache.scala 398:88]
  wire  s2_valid_cached_miss = s2_valid_miss & ~s2_uncached & ~(|uncachedInFlight_0); // @[DCache.scala 398:60]
  wire  s2_want_victimize = s2_valid_cached_miss | s2_valid_flush_line; // @[DCache.scala 400:79]
  wire  s2_valid_uncached_pending = s2_valid_miss & s2_uncached & ~(&uncachedInFlight_0); // @[DCache.scala 403:64]
  wire [1:0] s1_victim_way = lfsr[1:0]; // @[package.scala 154:13]
  wire [19:0] _s2_victim_tag_T_6 = s2_victim_way[0] ? s2_meta_corrected_0_tag : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s2_victim_tag_T_7 = s2_victim_way[1] ? s2_meta_corrected_1_tag : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s2_victim_tag_T_8 = s2_victim_way[2] ? s2_meta_corrected_2_tag : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s2_victim_tag_T_9 = s2_victim_way[3] ? s2_meta_corrected_3_tag : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _s2_victim_tag_T_10 = _s2_victim_tag_T_6 | _s2_victim_tag_T_7; // @[Mux.scala 27:73]
  wire [19:0] _s2_victim_tag_T_11 = _s2_victim_tag_T_10 | _s2_victim_tag_T_8; // @[Mux.scala 27:73]
  wire [19:0] _s2_victim_tag_T_12 = _s2_victim_tag_T_11 | _s2_victim_tag_T_9; // @[Mux.scala 27:73]
  wire [1:0] _s2_victim_tag_T_13 = s2_victim_way[0] ? s2_meta_corrected_0_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s2_victim_tag_T_14 = s2_victim_way[1] ? s2_meta_corrected_1_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s2_victim_tag_T_15 = s2_victim_way[2] ? s2_meta_corrected_2_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s2_victim_tag_T_16 = s2_victim_way[3] ? s2_meta_corrected_3_coh_state : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _s2_victim_tag_T_17 = _s2_victim_tag_T_13 | _s2_victim_tag_T_14; // @[Mux.scala 27:73]
  wire [1:0] _s2_victim_tag_T_18 = _s2_victim_tag_T_17 | _s2_victim_tag_T_15; // @[Mux.scala 27:73]
  wire [1:0] _s2_victim_tag_T_19 = _s2_victim_tag_T_18 | _s2_victim_tag_T_16; // @[Mux.scala 27:73]
  wire [19:0] s2_victim_tag = s2_valid_flush_line ? s2_req_addr[31:12] : _s2_victim_tag_T_12; // @[DCache.scala 406:26]
  wire [1:0] s2_victim_state_state = s2_hit_valid ? s2_hit_state_state : _s2_victim_tag_T_19; // @[DCache.scala 407:28]
  wire [2:0] _T_157 = _T_155 ? 3'h5 : 3'h0; // @[Misc.scala 37:36]
  wire [2:0] _T_161 = _T_159 ? 3'h2 : _T_157; // @[Misc.scala 37:36]
  wire [2:0] _T_165 = _T_163 ? 3'h1 : _T_161; // @[Misc.scala 37:36]
  wire [2:0] _T_169 = _T_167 ? 3'h1 : _T_165; // @[Misc.scala 37:36]
  wire [2:0] _T_173 = _T_171 ? 3'h5 : _T_169; // @[Misc.scala 37:36]
  wire [2:0] _T_177 = _T_175 ? 3'h4 : _T_173; // @[Misc.scala 37:36]
  wire [1:0] _T_178 = _T_175 ? 2'h1 : 2'h0; // @[Misc.scala 37:63]
  wire [2:0] _T_181 = _T_179 ? 3'h0 : _T_177; // @[Misc.scala 37:36]
  wire [1:0] _T_182 = _T_179 ? 2'h1 : _T_178; // @[Misc.scala 37:63]
  wire [2:0] _T_185 = _T_183 ? 3'h0 : _T_181; // @[Misc.scala 37:36]
  wire [1:0] _T_186 = _T_183 ? 2'h1 : _T_182; // @[Misc.scala 37:63]
  wire [2:0] _T_189 = _T_187 ? 3'h5 : _T_185; // @[Misc.scala 37:36]
  wire [1:0] _T_190 = _T_187 ? 2'h0 : _T_186; // @[Misc.scala 37:63]
  wire [2:0] _T_193 = _T_191 ? 3'h4 : _T_189; // @[Misc.scala 37:36]
  wire [1:0] _T_194 = _T_191 ? 2'h1 : _T_190; // @[Misc.scala 37:63]
  wire [2:0] _T_197 = _T_195 ? 3'h3 : _T_193; // @[Misc.scala 37:36]
  wire [1:0] _T_198 = _T_195 ? 2'h2 : _T_194; // @[Misc.scala 37:63]
  wire [2:0] s2_report_param = _T_199 ? 3'h3 : _T_197; // @[Misc.scala 37:36]
  wire [1:0] probeNewCoh_state = _T_199 ? 2'h2 : _T_198; // @[Misc.scala 37:63]
  wire [3:0] _T_207 = {2'h2,s2_victim_state_state}; // @[Cat.scala 31:58]
  wire  _T_220 = 4'h8 == _T_207; // @[Misc.scala 55:20]
  wire [2:0] _T_222 = _T_220 ? 3'h5 : 3'h0; // @[Misc.scala 37:36]
  wire  _T_224 = 4'h9 == _T_207; // @[Misc.scala 55:20]
  wire [2:0] _T_226 = _T_224 ? 3'h2 : _T_222; // @[Misc.scala 37:36]
  wire  _T_228 = 4'ha == _T_207; // @[Misc.scala 55:20]
  wire [2:0] _T_230 = _T_228 ? 3'h1 : _T_226; // @[Misc.scala 37:36]
  wire  _T_232 = 4'hb == _T_207; // @[Misc.scala 55:20]
  wire [2:0] _T_234 = _T_232 ? 3'h1 : _T_230; // @[Misc.scala 37:36]
  wire  _T_236 = 4'h4 == _T_207; // @[Misc.scala 55:20]
  wire  _T_237 = _T_236 ? 1'h0 : _T_232; // @[Misc.scala 37:9]
  wire [2:0] _T_238 = _T_236 ? 3'h5 : _T_234; // @[Misc.scala 37:36]
  wire  _T_240 = 4'h5 == _T_207; // @[Misc.scala 55:20]
  wire  _T_241 = _T_240 ? 1'h0 : _T_237; // @[Misc.scala 37:9]
  wire [2:0] _T_242 = _T_240 ? 3'h4 : _T_238; // @[Misc.scala 37:36]
  wire [1:0] _T_243 = _T_240 ? 2'h1 : 2'h0; // @[Misc.scala 37:63]
  wire  _T_244 = 4'h6 == _T_207; // @[Misc.scala 55:20]
  wire  _T_245 = _T_244 ? 1'h0 : _T_241; // @[Misc.scala 37:9]
  wire [2:0] _T_246 = _T_244 ? 3'h0 : _T_242; // @[Misc.scala 37:36]
  wire [1:0] _T_247 = _T_244 ? 2'h1 : _T_243; // @[Misc.scala 37:63]
  wire  _T_248 = 4'h7 == _T_207; // @[Misc.scala 55:20]
  wire [2:0] _T_250 = _T_248 ? 3'h0 : _T_246; // @[Misc.scala 37:36]
  wire [1:0] _T_251 = _T_248 ? 2'h1 : _T_247; // @[Misc.scala 37:63]
  wire  _T_252 = 4'h0 == _T_207; // @[Misc.scala 55:20]
  wire  _T_253 = _T_252 ? 1'h0 : _T_248 | _T_245; // @[Misc.scala 37:9]
  wire [2:0] _T_254 = _T_252 ? 3'h5 : _T_250; // @[Misc.scala 37:36]
  wire [1:0] _T_255 = _T_252 ? 2'h0 : _T_251; // @[Misc.scala 37:63]
  wire  _T_256 = 4'h1 == _T_207; // @[Misc.scala 55:20]
  wire  _T_257 = _T_256 ? 1'h0 : _T_253; // @[Misc.scala 37:9]
  wire [2:0] _T_258 = _T_256 ? 3'h4 : _T_254; // @[Misc.scala 37:36]
  wire [1:0] _T_259 = _T_256 ? 2'h1 : _T_255; // @[Misc.scala 37:63]
  wire  _T_260 = 4'h2 == _T_207; // @[Misc.scala 55:20]
  wire  _T_261 = _T_260 ? 1'h0 : _T_257; // @[Misc.scala 37:9]
  wire [2:0] _T_262 = _T_260 ? 3'h3 : _T_258; // @[Misc.scala 37:36]
  wire [1:0] _T_263 = _T_260 ? 2'h2 : _T_259; // @[Misc.scala 37:63]
  wire  _T_264 = 4'h3 == _T_207; // @[Misc.scala 55:20]
  wire  s2_victim_dirty = _T_264 | _T_261; // @[Misc.scala 37:9]
  wire [2:0] s2_shrink_param = _T_264 ? 3'h3 : _T_262; // @[Misc.scala 37:36]
  wire [1:0] voluntaryNewCoh_state = _T_264 ? 2'h2 : _T_263; // @[Misc.scala 37:63]
  wire  s2_dont_nack_uncached = s2_valid_uncached_pending & auto_out_a_ready; // @[DCache.scala 413:57]
  wire  _s2_dont_nack_misc_T_10 = s2_req_cmd == 5'h17; // @[DCache.scala 417:17]
  wire  s2_dont_nack_misc = s2_valid_masked & _s2_dont_nack_misc_T_10; // @[DCache.scala 414:61]
  wire  _io_cpu_s2_nack_T_4 = ~s2_valid_hit_pre_data_ecc_and_waw; // @[DCache.scala 418:89]
  wire [19:0] metaArb_io_in_2_bits_data_meta_tag = s2_req_addr[31:12]; // @[HellaCache.scala 290:20 291:14]
  wire  _lrscBackingOff_T = lrscCount > 7'h0; // @[DCache.scala 447:34]
  wire  lrscBackingOff = lrscCount > 7'h0 & ~lrscValid; // @[DCache.scala 447:38]
  reg [33:0] lrscAddr; // @[DCache.scala 448:21]
  wire  lrscAddrMatch = lrscAddr == s2_req_addr[39:6]; // @[DCache.scala 449:32]
  wire  s2_sc_fail = _s2_write_T_3 & ~(lrscValid & lrscAddrMatch); // @[DCache.scala 450:26]
  wire [6:0] _lrscCount_T = s2_hit ? 7'h4f : 7'h0; // @[DCache.scala 452:21]
  wire [6:0] _GEN_143 = s2_valid_hit_pre_data_ecc_and_waw & _c_cat_T_48 & _io_cpu_req_ready_T_1 | s2_valid_cached_miss
     ? _lrscCount_T : lrscCount; // @[DCache.scala 451:99 452:15 445:22]
  wire [6:0] _lrscCount_T_2 = lrscCount - 7'h1; // @[DCache.scala 455:49]
  wire  _pstore1_cmd_T = s1_valid_not_nacked & s1_write; // @[DCache.scala 465:63]
  reg [4:0] pstore1_cmd; // @[Reg.scala 16:16]
  reg [63:0] pstore1_data; // @[Reg.scala 16:16]
  reg [3:0] pstore1_way; // @[Reg.scala 16:16]
  wire  _pstore1_rmw_T_51 = s1_write & _s1_write_T_1; // @[DCache.scala 1163:23]
  wire  _pstore1_rmw_T_52 = s1_read | _pstore1_rmw_T_51; // @[DCache.scala 1162:21]
  reg  pstore1_rmw_r; // @[Reg.scala 16:16]
  wire  _pstore1_merge_T = s2_valid_hit_pre_data_ecc_and_waw & s2_write; // @[DCache.scala 463:46]
  wire  _pstore1_merge_T_2 = s2_valid_hit_pre_data_ecc_and_waw & s2_write & ~s2_sc_fail; // @[DCache.scala 463:58]
  wire  pstore_drain_opportunistic = ~_dataArb_io_in_3_valid_T_58; // @[DCache.scala 475:36]
  reg  pstore_drain_on_miss_REG; // @[DCache.scala 476:56]
  wire  pstore_drain_on_miss = releaseInFlight | pstore_drain_on_miss_REG; // @[DCache.scala 476:46]
  wire  pstore1_valid = _pstore1_merge_T_2 | pstore1_held; // @[DCache.scala 480:38]
  wire  pstore_drain_structural = pstore1_valid_likely & pstore2_valid & (s1_valid & s1_write | pstore1_rmw_r); // @[DCache.scala 482:71]
  wire  _T_279 = _pstore1_merge_T | pstore1_held; // @[DCache.scala 479:96]
  wire  _pstore_drain_T_10 = (_T_279 & ~pstore1_rmw_r | pstore2_valid) & (pstore_drain_opportunistic |
    pstore_drain_on_miss); // @[DCache.scala 491:76]
  wire  pstore_drain = pstore_drain_structural | _pstore_drain_T_10; // @[DCache.scala 490:48]
  wire  _pstore1_held_T_9 = ~pstore_drain; // @[DCache.scala 494:91]
  wire  advance_pstore1 = pstore1_valid & pstore2_valid == pstore_drain; // @[DCache.scala 495:61]
  reg [3:0] pstore2_way; // @[Reg.scala 16:16]
  wire [63:0] pstore1_storegen_data = amoalu_io_out;
  reg [7:0] pstore2_storegen_data_r; // @[Reg.scala 16:16]
  reg [7:0] pstore2_storegen_data_r_1; // @[Reg.scala 16:16]
  reg [7:0] pstore2_storegen_data_r_2; // @[Reg.scala 16:16]
  reg [7:0] pstore2_storegen_data_r_3; // @[Reg.scala 16:16]
  reg [7:0] pstore2_storegen_data_r_4; // @[Reg.scala 16:16]
  reg [7:0] pstore2_storegen_data_r_5; // @[Reg.scala 16:16]
  reg [7:0] pstore2_storegen_data_r_6; // @[Reg.scala 16:16]
  reg [7:0] pstore2_storegen_data_r_7; // @[Reg.scala 16:16]
  wire [63:0] pstore2_storegen_data = {pstore2_storegen_data_r_7,pstore2_storegen_data_r_6,pstore2_storegen_data_r_5,
    pstore2_storegen_data_r_4,pstore2_storegen_data_r_3,pstore2_storegen_data_r_2,pstore2_storegen_data_r_1,
    pstore2_storegen_data_r}; // @[Cat.scala 31:58]
  wire [7:0] _pstore2_storegen_mask_mask_T = ~pstore1_mask; // @[DCache.scala 507:37]
  wire [7:0] _pstore2_storegen_mask_mask_T_2 = ~_pstore2_storegen_mask_mask_T; // @[DCache.scala 507:15]
  wire [39:0] _dataArb_io_in_0_bits_addr_T = pstore2_valid ? pstore2_addr : pstore1_addr; // @[DCache.scala 522:36]
  wire [63:0] _dataArb_io_in_0_bits_wdata_T = pstore2_valid ? pstore2_storegen_data : pstore1_data; // @[DCache.scala 524:63]
  wire [31:0] dataArb_io_in_0_bits_wdata_lo = {_dataArb_io_in_0_bits_wdata_T[31:24],_dataArb_io_in_0_bits_wdata_T[23:16]
    ,_dataArb_io_in_0_bits_wdata_T[15:8],_dataArb_io_in_0_bits_wdata_T[7:0]}; // @[Cat.scala 31:58]
  wire [31:0] dataArb_io_in_0_bits_wdata_hi = {_dataArb_io_in_0_bits_wdata_T[63:56],_dataArb_io_in_0_bits_wdata_T[55:48]
    ,_dataArb_io_in_0_bits_wdata_T[47:40],_dataArb_io_in_0_bits_wdata_T[39:32]}; // @[Cat.scala 31:58]
  wire [7:0] _dataArb_io_in_0_bits_eccMask_T = pstore2_valid ? mask : pstore1_mask; // @[DCache.scala 530:47]
  wire  _dataArb_io_in_0_bits_eccMask_T_9 = |_dataArb_io_in_0_bits_eccMask_T[0]; // @[DCache.scala 1153:66]
  wire  _dataArb_io_in_0_bits_eccMask_T_10 = |_dataArb_io_in_0_bits_eccMask_T[1]; // @[DCache.scala 1153:66]
  wire  _dataArb_io_in_0_bits_eccMask_T_11 = |_dataArb_io_in_0_bits_eccMask_T[2]; // @[DCache.scala 1153:66]
  wire  _dataArb_io_in_0_bits_eccMask_T_12 = |_dataArb_io_in_0_bits_eccMask_T[3]; // @[DCache.scala 1153:66]
  wire  _dataArb_io_in_0_bits_eccMask_T_13 = |_dataArb_io_in_0_bits_eccMask_T[4]; // @[DCache.scala 1153:66]
  wire  _dataArb_io_in_0_bits_eccMask_T_14 = |_dataArb_io_in_0_bits_eccMask_T[5]; // @[DCache.scala 1153:66]
  wire  _dataArb_io_in_0_bits_eccMask_T_15 = |_dataArb_io_in_0_bits_eccMask_T[6]; // @[DCache.scala 1153:66]
  wire  _dataArb_io_in_0_bits_eccMask_T_16 = |_dataArb_io_in_0_bits_eccMask_T[7]; // @[DCache.scala 1153:66]
  wire [3:0] dataArb_io_in_0_bits_eccMask_lo = {_dataArb_io_in_0_bits_eccMask_T_12,_dataArb_io_in_0_bits_eccMask_T_11,
    _dataArb_io_in_0_bits_eccMask_T_10,_dataArb_io_in_0_bits_eccMask_T_9}; // @[Cat.scala 31:58]
  wire [3:0] dataArb_io_in_0_bits_eccMask_hi = {_dataArb_io_in_0_bits_eccMask_T_16,_dataArb_io_in_0_bits_eccMask_T_15,
    _dataArb_io_in_0_bits_eccMask_T_14,_dataArb_io_in_0_bits_eccMask_T_13}; // @[Cat.scala 31:58]
  wire  _a_source_T = ~uncachedInFlight_0; // @[DCache.scala 550:34]
  wire [1:0] _a_source_T_1 = {_a_source_T, 1'h0}; // @[DCache.scala 550:59]
  wire  a_source = _a_source_T_1[0] ? 1'h0 : 1'h1; // @[Mux.scala 47:70]
  wire [39:0] acquire_address = {s2_req_addr[39:6], 6'h0}; // @[DCache.scala 551:49]
  wire [22:0] a_mask = {{15'd0}, pstore1_mask}; // @[DCache.scala 555:29]
  wire [2:0] _get_a_mask_sizeOH_T = {{1'd0}, s2_req_size}; // @[Misc.scala 201:34]
  wire [1:0] get_a_mask_sizeOH_shiftAmount = _get_a_mask_sizeOH_T[1:0]; // @[OneHot.scala 63:49]
  wire [3:0] _get_a_mask_sizeOH_T_1 = 4'h1 << get_a_mask_sizeOH_shiftAmount; // @[OneHot.scala 64:12]
  wire [2:0] get_a_mask_sizeOH = _get_a_mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _get_a_mask_T = s2_req_size >= 2'h3; // @[Misc.scala 205:21]
  wire  get_a_mask_size = get_a_mask_sizeOH[2]; // @[Misc.scala 208:26]
  wire  get_a_mask_bit = s2_req_addr[2]; // @[Misc.scala 209:26]
  wire  get_a_mask_nbit = ~get_a_mask_bit; // @[Misc.scala 210:20]
  wire  get_a_mask_acc = _get_a_mask_T | get_a_mask_size & get_a_mask_nbit; // @[Misc.scala 214:29]
  wire  get_a_mask_acc_1 = _get_a_mask_T | get_a_mask_size & get_a_mask_bit; // @[Misc.scala 214:29]
  wire  get_a_mask_size_1 = get_a_mask_sizeOH[1]; // @[Misc.scala 208:26]
  wire  get_a_mask_bit_1 = s2_req_addr[1]; // @[Misc.scala 209:26]
  wire  get_a_mask_nbit_1 = ~get_a_mask_bit_1; // @[Misc.scala 210:20]
  wire  get_a_mask_eq_2 = get_a_mask_nbit & get_a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_2 = get_a_mask_acc | get_a_mask_size_1 & get_a_mask_eq_2; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_3 = get_a_mask_nbit & get_a_mask_bit_1; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_3 = get_a_mask_acc | get_a_mask_size_1 & get_a_mask_eq_3; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_4 = get_a_mask_bit & get_a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_4 = get_a_mask_acc_1 | get_a_mask_size_1 & get_a_mask_eq_4; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_5 = get_a_mask_bit & get_a_mask_bit_1; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_5 = get_a_mask_acc_1 | get_a_mask_size_1 & get_a_mask_eq_5; // @[Misc.scala 214:29]
  wire  get_a_mask_size_2 = get_a_mask_sizeOH[0]; // @[Misc.scala 208:26]
  wire  get_a_mask_bit_2 = s2_req_addr[0]; // @[Misc.scala 209:26]
  wire  get_a_mask_nbit_2 = ~get_a_mask_bit_2; // @[Misc.scala 210:20]
  wire  get_a_mask_eq_6 = get_a_mask_eq_2 & get_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_6 = get_a_mask_acc_2 | get_a_mask_size_2 & get_a_mask_eq_6; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_7 = get_a_mask_eq_2 & get_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_7 = get_a_mask_acc_2 | get_a_mask_size_2 & get_a_mask_eq_7; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_8 = get_a_mask_eq_3 & get_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_8 = get_a_mask_acc_3 | get_a_mask_size_2 & get_a_mask_eq_8; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_9 = get_a_mask_eq_3 & get_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_9 = get_a_mask_acc_3 | get_a_mask_size_2 & get_a_mask_eq_9; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_10 = get_a_mask_eq_4 & get_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_10 = get_a_mask_acc_4 | get_a_mask_size_2 & get_a_mask_eq_10; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_11 = get_a_mask_eq_4 & get_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_11 = get_a_mask_acc_4 | get_a_mask_size_2 & get_a_mask_eq_11; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_12 = get_a_mask_eq_5 & get_a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_12 = get_a_mask_acc_5 | get_a_mask_size_2 & get_a_mask_eq_12; // @[Misc.scala 214:29]
  wire  get_a_mask_eq_13 = get_a_mask_eq_5 & get_a_mask_bit_2; // @[Misc.scala 213:27]
  wire  get_a_mask_acc_13 = get_a_mask_acc_5 | get_a_mask_size_2 & get_a_mask_eq_13; // @[Misc.scala 214:29]
  wire [7:0] get_mask = {get_a_mask_acc_13,get_a_mask_acc_12,get_a_mask_acc_11,get_a_mask_acc_10,get_a_mask_acc_9,
    get_a_mask_acc_8,get_a_mask_acc_7,get_a_mask_acc_6}; // @[Cat.scala 31:58]
  wire [2:0] _atomics_T_1_opcode = 5'h4 == s2_req_cmd ? 3'h3 : 3'h0; // @[Mux.scala 81:58]
  wire [3:0] atomics_a_size = {{2'd0}, s2_req_size}; // @[Edges.scala 513:17 516:15]
  wire [3:0] _atomics_T_1_size = 5'h4 == s2_req_cmd ? atomics_a_size : 4'h0; // @[Mux.scala 81:58]
  wire [31:0] atomics_a_address = s2_req_addr[31:0]; // @[Edges.scala 513:17 518:15]
  wire [31:0] _atomics_T_1_address = 5'h4 == s2_req_cmd ? atomics_a_address : 32'h0; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_1_mask = 5'h4 == s2_req_cmd ? get_mask : 8'h0; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_1_data = 5'h4 == s2_req_cmd ? pstore1_data : 64'h0; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_3_opcode = 5'h9 == s2_req_cmd ? 3'h3 : _atomics_T_1_opcode; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_3_param = 5'h9 == s2_req_cmd ? 3'h0 : _atomics_T_1_opcode; // @[Mux.scala 81:58]
  wire [3:0] _atomics_T_3_size = 5'h9 == s2_req_cmd ? atomics_a_size : _atomics_T_1_size; // @[Mux.scala 81:58]
  wire  _atomics_T_3_source = 5'h9 == s2_req_cmd ? a_source : 5'h4 == s2_req_cmd & a_source; // @[Mux.scala 81:58]
  wire [31:0] _atomics_T_3_address = 5'h9 == s2_req_cmd ? atomics_a_address : _atomics_T_1_address; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_3_mask = 5'h9 == s2_req_cmd ? get_mask : _atomics_T_1_mask; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_3_data = 5'h9 == s2_req_cmd ? pstore1_data : _atomics_T_1_data; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_5_opcode = 5'ha == s2_req_cmd ? 3'h3 : _atomics_T_3_opcode; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_5_param = 5'ha == s2_req_cmd ? 3'h1 : _atomics_T_3_param; // @[Mux.scala 81:58]
  wire [3:0] _atomics_T_5_size = 5'ha == s2_req_cmd ? atomics_a_size : _atomics_T_3_size; // @[Mux.scala 81:58]
  wire  _atomics_T_5_source = 5'ha == s2_req_cmd ? a_source : _atomics_T_3_source; // @[Mux.scala 81:58]
  wire [31:0] _atomics_T_5_address = 5'ha == s2_req_cmd ? atomics_a_address : _atomics_T_3_address; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_5_mask = 5'ha == s2_req_cmd ? get_mask : _atomics_T_3_mask; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_5_data = 5'ha == s2_req_cmd ? pstore1_data : _atomics_T_3_data; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_7_opcode = 5'hb == s2_req_cmd ? 3'h3 : _atomics_T_5_opcode; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_7_param = 5'hb == s2_req_cmd ? 3'h2 : _atomics_T_5_param; // @[Mux.scala 81:58]
  wire [3:0] _atomics_T_7_size = 5'hb == s2_req_cmd ? atomics_a_size : _atomics_T_5_size; // @[Mux.scala 81:58]
  wire  _atomics_T_7_source = 5'hb == s2_req_cmd ? a_source : _atomics_T_5_source; // @[Mux.scala 81:58]
  wire [31:0] _atomics_T_7_address = 5'hb == s2_req_cmd ? atomics_a_address : _atomics_T_5_address; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_7_mask = 5'hb == s2_req_cmd ? get_mask : _atomics_T_5_mask; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_7_data = 5'hb == s2_req_cmd ? pstore1_data : _atomics_T_5_data; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_9_opcode = 5'h8 == s2_req_cmd ? 3'h2 : _atomics_T_7_opcode; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_9_param = 5'h8 == s2_req_cmd ? 3'h4 : _atomics_T_7_param; // @[Mux.scala 81:58]
  wire [3:0] _atomics_T_9_size = 5'h8 == s2_req_cmd ? atomics_a_size : _atomics_T_7_size; // @[Mux.scala 81:58]
  wire  _atomics_T_9_source = 5'h8 == s2_req_cmd ? a_source : _atomics_T_7_source; // @[Mux.scala 81:58]
  wire [31:0] _atomics_T_9_address = 5'h8 == s2_req_cmd ? atomics_a_address : _atomics_T_7_address; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_9_mask = 5'h8 == s2_req_cmd ? get_mask : _atomics_T_7_mask; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_9_data = 5'h8 == s2_req_cmd ? pstore1_data : _atomics_T_7_data; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_11_opcode = 5'hc == s2_req_cmd ? 3'h2 : _atomics_T_9_opcode; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_11_param = 5'hc == s2_req_cmd ? 3'h0 : _atomics_T_9_param; // @[Mux.scala 81:58]
  wire [3:0] _atomics_T_11_size = 5'hc == s2_req_cmd ? atomics_a_size : _atomics_T_9_size; // @[Mux.scala 81:58]
  wire  _atomics_T_11_source = 5'hc == s2_req_cmd ? a_source : _atomics_T_9_source; // @[Mux.scala 81:58]
  wire [31:0] _atomics_T_11_address = 5'hc == s2_req_cmd ? atomics_a_address : _atomics_T_9_address; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_11_mask = 5'hc == s2_req_cmd ? get_mask : _atomics_T_9_mask; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_11_data = 5'hc == s2_req_cmd ? pstore1_data : _atomics_T_9_data; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_13_opcode = 5'hd == s2_req_cmd ? 3'h2 : _atomics_T_11_opcode; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_13_param = 5'hd == s2_req_cmd ? 3'h1 : _atomics_T_11_param; // @[Mux.scala 81:58]
  wire [3:0] _atomics_T_13_size = 5'hd == s2_req_cmd ? atomics_a_size : _atomics_T_11_size; // @[Mux.scala 81:58]
  wire  _atomics_T_13_source = 5'hd == s2_req_cmd ? a_source : _atomics_T_11_source; // @[Mux.scala 81:58]
  wire [31:0] _atomics_T_13_address = 5'hd == s2_req_cmd ? atomics_a_address : _atomics_T_11_address; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_13_mask = 5'hd == s2_req_cmd ? get_mask : _atomics_T_11_mask; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_13_data = 5'hd == s2_req_cmd ? pstore1_data : _atomics_T_11_data; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_15_opcode = 5'he == s2_req_cmd ? 3'h2 : _atomics_T_13_opcode; // @[Mux.scala 81:58]
  wire [2:0] _atomics_T_15_param = 5'he == s2_req_cmd ? 3'h2 : _atomics_T_13_param; // @[Mux.scala 81:58]
  wire [3:0] _atomics_T_15_size = 5'he == s2_req_cmd ? atomics_a_size : _atomics_T_13_size; // @[Mux.scala 81:58]
  wire  _atomics_T_15_source = 5'he == s2_req_cmd ? a_source : _atomics_T_13_source; // @[Mux.scala 81:58]
  wire [31:0] _atomics_T_15_address = 5'he == s2_req_cmd ? atomics_a_address : _atomics_T_13_address; // @[Mux.scala 81:58]
  wire [7:0] _atomics_T_15_mask = 5'he == s2_req_cmd ? get_mask : _atomics_T_13_mask; // @[Mux.scala 81:58]
  wire [63:0] _atomics_T_15_data = 5'he == s2_req_cmd ? pstore1_data : _atomics_T_13_data; // @[Mux.scala 81:58]
  wire [2:0] atomics_opcode = 5'hf == s2_req_cmd ? 3'h2 : _atomics_T_15_opcode; // @[Mux.scala 81:58]
  wire [2:0] atomics_param = 5'hf == s2_req_cmd ? 3'h3 : _atomics_T_15_param; // @[Mux.scala 81:58]
  wire [3:0] atomics_size = 5'hf == s2_req_cmd ? atomics_a_size : _atomics_T_15_size; // @[Mux.scala 81:58]
  wire  atomics_source = 5'hf == s2_req_cmd ? a_source : _atomics_T_15_source; // @[Mux.scala 81:58]
  wire [31:0] atomics_address = 5'hf == s2_req_cmd ? atomics_a_address : _atomics_T_15_address; // @[Mux.scala 81:58]
  wire [7:0] atomics_mask = 5'hf == s2_req_cmd ? get_mask : _atomics_T_15_mask; // @[Mux.scala 81:58]
  wire [63:0] atomics_data = 5'hf == s2_req_cmd ? pstore1_data : _atomics_T_15_data; // @[Mux.scala 81:58]
  wire [39:0] _GEN_432 = {{8'd0}, release_ack_addr}; // @[DCache.scala 579:43]
  wire [39:0] _tl_out_a_valid_T_1 = s2_req_addr ^ _GEN_432; // @[DCache.scala 579:43]
  wire  _tl_out_a_valid_T_5 = ~(release_ack_wait & _tl_out_a_valid_T_1[20:6] == 15'h0); // @[DCache.scala 579:8]
  wire  _tl_out_a_valid_T_6 = s2_valid_cached_miss & _tl_out_a_valid_T_5; // @[DCache.scala 578:29]
  wire  _tl_out_a_valid_T_7 = ~release_ack_wait; // @[DCache.scala 580:45]
  wire  _tl_out_a_valid_T_10 = ~s2_victim_dirty; // @[DCache.scala 580:89]
  wire  _tl_out_a_valid_T_12 = _tl_out_a_valid_T_6 & _tl_out_a_valid_T_10; // @[DCache.scala 579:125]
  wire  tl_out_a_valid = s2_valid_uncached_pending | _tl_out_a_valid_T_12; // @[DCache.scala 577:32]
  wire [2:0] _tl_out_a_bits_T_6_opcode = ~s2_read ? 3'h0 : atomics_opcode; // @[DCache.scala 584:8]
  wire [2:0] _tl_out_a_bits_T_6_param = ~s2_read ? 3'h0 : atomics_param; // @[DCache.scala 584:8]
  wire [3:0] _tl_out_a_bits_T_6_size = ~s2_read ? atomics_a_size : atomics_size; // @[DCache.scala 584:8]
  wire  _tl_out_a_bits_T_6_source = ~s2_read ? a_source : atomics_source; // @[DCache.scala 584:8]
  wire [31:0] _tl_out_a_bits_T_6_address = ~s2_read ? atomics_a_address : atomics_address; // @[DCache.scala 584:8]
  wire [7:0] _tl_out_a_bits_T_6_mask = ~s2_read ? get_mask : atomics_mask; // @[DCache.scala 584:8]
  wire [63:0] _tl_out_a_bits_T_6_data = ~s2_read ? pstore1_data : atomics_data; // @[DCache.scala 584:8]
  wire [2:0] _tl_out_a_bits_T_7_opcode = _s2_write_T_1 ? 3'h1 : _tl_out_a_bits_T_6_opcode; // @[DCache.scala 583:8]
  wire [2:0] _tl_out_a_bits_T_7_param = _s2_write_T_1 ? 3'h0 : _tl_out_a_bits_T_6_param; // @[DCache.scala 583:8]
  wire [3:0] _tl_out_a_bits_T_7_size = _s2_write_T_1 ? atomics_a_size : _tl_out_a_bits_T_6_size; // @[DCache.scala 583:8]
  wire  _tl_out_a_bits_T_7_source = _s2_write_T_1 ? a_source : _tl_out_a_bits_T_6_source; // @[DCache.scala 583:8]
  wire [31:0] _tl_out_a_bits_T_7_address = _s2_write_T_1 ? atomics_a_address : _tl_out_a_bits_T_6_address; // @[DCache.scala 583:8]
  wire [7:0] putpartial_mask = a_mask[7:0]; // @[Edges.scala 483:17 489:15]
  wire [7:0] _tl_out_a_bits_T_7_mask = _s2_write_T_1 ? putpartial_mask : _tl_out_a_bits_T_6_mask; // @[DCache.scala 583:8]
  wire [63:0] _tl_out_a_bits_T_7_data = _s2_write_T_1 ? pstore1_data : _tl_out_a_bits_T_6_data; // @[DCache.scala 583:8]
  wire [2:0] _tl_out_a_bits_T_8_opcode = ~s2_write ? 3'h4 : _tl_out_a_bits_T_7_opcode; // @[DCache.scala 582:8]
  wire [2:0] _tl_out_a_bits_T_8_param = ~s2_write ? 3'h0 : _tl_out_a_bits_T_7_param; // @[DCache.scala 582:8]
  wire [3:0] _tl_out_a_bits_T_8_size = ~s2_write ? atomics_a_size : _tl_out_a_bits_T_7_size; // @[DCache.scala 582:8]
  wire  _tl_out_a_bits_T_8_source = ~s2_write ? a_source : _tl_out_a_bits_T_7_source; // @[DCache.scala 582:8]
  wire [31:0] _tl_out_a_bits_T_8_address = ~s2_write ? atomics_a_address : _tl_out_a_bits_T_7_address; // @[DCache.scala 582:8]
  wire [7:0] _tl_out_a_bits_T_8_mask = ~s2_write ? get_mask : _tl_out_a_bits_T_7_mask; // @[DCache.scala 582:8]
  wire [63:0] _tl_out_a_bits_T_8_data = ~s2_write ? 64'h0 : _tl_out_a_bits_T_7_data; // @[DCache.scala 582:8]
  wire [2:0] tl_out_a_bits_a_param = {{1'd0}, s2_grow_param}; // @[Edges.scala 345:17 347:15]
  wire [31:0] tl_out_a_bits_a_address = acquire_address[31:0]; // @[Edges.scala 345:17 350:15]
  wire [1:0] _a_sel_T = 2'h1 << a_source; // @[OneHot.scala 64:12]
  wire  a_sel = _a_sel_T[1]; // @[DCache.scala 603:66]
  wire  _T_288 = auto_out_a_ready & tl_out_a_valid; // @[Decoupled.scala 50:35]
  wire  _GEN_166 = a_sel | uncachedInFlight_0; // @[DCache.scala 607:18 608:13 214:33]
  wire  _GEN_179 = s2_uncached ? _GEN_166 : uncachedInFlight_0; // @[DCache.scala 605:24 214:33]
  wire  _GEN_192 = s2_uncached ? cached_grant_wait : 1'h1; // @[DCache.scala 605:24 201:30 614:25]
  wire  _GEN_194 = _T_288 ? _GEN_179 : uncachedInFlight_0; // @[DCache.scala 604:26 214:33]
  wire  _GEN_207 = _T_288 ? _GEN_192 : cached_grant_wait; // @[DCache.scala 604:26 201:30]
  wire [26:0] _beats1_decode_T_1 = 27'hfff << auto_out_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] beats1_decode = _beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  beats1_opdata = auto_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [8:0] beats1 = beats1_opdata ? beats1_decode : 9'h0; // @[Edges.scala 220:14]
  wire [8:0] counter1 = counter - 9'h1; // @[Edges.scala 229:28]
  wire  d_last = counter == 9'h1 | beats1 == 9'h0; // @[Edges.scala 231:37]
  wire  d_done = d_last & _T_296; // @[Edges.scala 232:22]
  wire [8:0] _count_T = ~counter1; // @[Edges.scala 233:27]
  wire [8:0] count = beats1 & _count_T; // @[Edges.scala 233:25]
  wire [11:0] d_address_inc = {count, 3'h0}; // @[Edges.scala 268:29]
  wire  _tl_d_data_encoded_T_12 = ~grantIsUncached; // @[DCache.scala 636:129]
  wire  grantIsVoluntary = auto_out_d_bits_opcode == 3'h6; // @[DCache.scala 638:32]
  wire [2:0] _blockProbeAfterGrantCount_T_1 = blockProbeAfterGrantCount - 3'h1; // @[DCache.scala 642:97]
  wire [2:0] _GEN_210 = _block_probe_for_core_progress_T ? _blockProbeAfterGrantCount_T_1 : blockProbeAfterGrantCount; // @[DCache.scala 641:38 642:{40,68}]
  wire [1:0] _uncachedRespIdxOH_T = 2'h1 << auto_out_d_bits_source; // @[OneHot.scala 64:12]
  wire  uncachedRespIdxOH = _uncachedRespIdxOH_T[1]; // @[DCache.scala 645:90]
  wire  _T_301 = uncachedRespIdxOH & d_last; // @[DCache.scala 659:17]
  wire  _GEN_215 = uncachedRespIdxOH & d_last ? 1'h0 : _GEN_194; // @[DCache.scala 659:28 661:13]
  wire [31:0] dontCareBits = {s1_paddr[31:3], 3'h0}; // @[DCache.scala 674:55]
  wire [31:0] _GEN_433 = {{29'd0}, uncachedReqs_0_addr[2:0]}; // @[DCache.scala 675:26]
  wire [31:0] _s2_req_addr_T_1 = dontCareBits | _GEN_433; // @[DCache.scala 675:26]
  wire  _GEN_223 = grantIsVoluntary ? 1'h0 : release_ack_wait; // @[DCache.scala 680:36 682:24 204:29]
  wire  _GEN_232 = grantIsUncached ? release_ack_wait : _GEN_223; // @[DCache.scala 204:29 657:35]
  wire  _GEN_236 = grantIsCached & d_last; // @[DCache.scala 648:26 Replacement.scala 38:11]
  wire  _GEN_245 = grantIsCached ? release_ack_wait : _GEN_232; // @[DCache.scala 648:26 204:29]
  wire  _GEN_258 = _T_296 ? _GEN_245 : release_ack_wait; // @[DCache.scala 647:26 204:29]
  wire  tl_out__e_valid = grantIsRefill & ~dataArb_io_in_1_ready ? 1'h0 : auto_out_d_valid & d_first & grantIsCached &
    canAcceptCachedGrant; // @[DCache.scala 687:18 695:51 696:20]
  wire  _T_308 = auto_out_e_ready & tl_out__e_valid; // @[Decoupled.scala 50:35]
  wire [39:0] _dataArb_io_in_1_bits_addr_T_1 = {s2_vaddr[39:6], 6'h0}; // @[DCache.scala 701:57]
  wire [39:0] _GEN_434 = {{28'd0}, d_address_inc}; // @[DCache.scala 701:67]
  wire [39:0] _dataArb_io_in_1_bits_addr_T_2 = _dataArb_io_in_1_bits_addr_T_1 | _GEN_434; // @[DCache.scala 701:67]
  wire [3:0] _metaArb_io_in_3_bits_data_T_1 = {s2_write,_c_cat_T_49,auto_out_d_bits_param}; // @[Cat.scala 31:58]
  wire [1:0] _metaArb_io_in_3_bits_data_T_11 = 4'h1 == _metaArb_io_in_3_bits_data_T_1 ? 2'h1 : 2'h0; // @[Mux.scala 81:58]
  wire [1:0] _metaArb_io_in_3_bits_data_T_13 = 4'h0 == _metaArb_io_in_3_bits_data_T_1 ? 2'h2 :
    _metaArb_io_in_3_bits_data_T_11; // @[Mux.scala 81:58]
  wire [1:0] _metaArb_io_in_3_bits_data_T_15 = 4'h4 == _metaArb_io_in_3_bits_data_T_1 ? 2'h2 :
    _metaArb_io_in_3_bits_data_T_13; // @[Mux.scala 81:58]
  wire [1:0] metaArb_io_in_3_bits_data_meta_state = 4'hc == _metaArb_io_in_3_bits_data_T_1 ? 2'h3 :
    _metaArb_io_in_3_bits_data_T_15; // @[Mux.scala 81:58]
  wire  _GEN_261 = auto_out_d_valid ? 1'h0 : _GEN_37; // @[DCache.scala 728:29 729:26]
  wire  _GEN_262 = auto_out_d_valid | auto_out_d_valid & grantIsRefill & canAcceptCachedGrant; // @[DCache.scala 694:26 728:29 730:32]
  wire  _GEN_263 = auto_out_d_valid ? 1'h0 : 1'h1; // @[DCache.scala 728:29 700:33 731:37]
  wire [39:0] _metaArb_io_in_6_bits_addr_T_1 = {io_cpu_req_bits_addr[39:32],auto_out_b_bits_address}; // @[Cat.scala 31:58]
  wire [8:0] counter1_1 = counter_1 - 9'h1; // @[Edges.scala 229:28]
  wire [8:0] _count_T_1 = ~counter1_1; // @[Edges.scala 233:27]
  wire [8:0] c_count = beats1_1 & _count_T_1; // @[Edges.scala 233:25]
  reg  s1_release_data_valid; // @[DCache.scala 774:34]
  wire  releaseRejected = s2_release_data_valid & ~_T_322; // @[DCache.scala 776:44]
  wire [9:0] _releaseDataBeat_T = {1'h0,c_count}; // @[Cat.scala 31:58]
  wire [1:0] _releaseDataBeat_T_1 = {1'h0,s2_release_data_valid}; // @[Cat.scala 31:58]
  wire [1:0] _GEN_435 = {{1'd0}, s1_release_data_valid}; // @[DCache.scala 777:101]
  wire [1:0] _releaseDataBeat_T_3 = _GEN_435 + _releaseDataBeat_T_1; // @[DCache.scala 777:101]
  wire [1:0] _releaseDataBeat_T_4 = releaseRejected ? 2'h0 : _releaseDataBeat_T_3; // @[DCache.scala 777:52]
  wire [9:0] _GEN_436 = {{8'd0}, _releaseDataBeat_T_4}; // @[DCache.scala 777:47]
  wire [9:0] releaseDataBeat = _releaseDataBeat_T + _GEN_436; // @[DCache.scala 777:47]
  wire  discard_line = s2_valid_flush_line & s2_req_size[1]; // @[DCache.scala 791:46]
  wire [3:0] _release_state_T_13 = s2_victim_dirty & ~discard_line ? 4'h1 : 4'h6; // @[DCache.scala 792:27]
  wire [25:0] _probe_bits_T_2 = {s2_victim_tag,s2_req_addr[11:6]}; // @[Cat.scala 31:58]
  wire [31:0] res_2_address = {_probe_bits_T_2, 6'h0}; // @[DCache.scala 795:96]
  wire [3:0] _GEN_271 = s2_want_victimize ? _release_state_T_13 : release_state; // @[DCache.scala 789:25 792:21 206:26]
  wire [3:0] _release_state_T_14 = releaseDone ? 4'h7 : 4'h3; // @[DCache.scala 806:29]
  wire [3:0] _release_state_T_15 = releaseDone ? 4'h0 : 4'h5; // @[DCache.scala 810:29]
  wire [2:0] _GEN_282 = _T_328 ? s2_report_param : 3'h5; // @[DCache.scala 784:17 803:45 805:23]
  wire [3:0] _GEN_288 = _T_328 ? _release_state_T_14 : _release_state_T_15; // @[DCache.scala 803:45 806:23 810:23]
  wire [3:0] _GEN_290 = s2_prb_ack_data ? 4'h2 : _GEN_288; // @[DCache.scala 801:36 802:23]
  wire [2:0] _GEN_293 = s2_prb_ack_data ? 3'h5 : _GEN_282; // @[DCache.scala 784:17 801:36]
  wire [3:0] _GEN_311 = s2_probe ? _GEN_290 : _GEN_271; // @[DCache.scala 797:21]
  wire [2:0] _GEN_314 = s2_probe ? _GEN_293 : 3'h5; // @[DCache.scala 784:17 797:21]
  wire [39:0] _metaArb_io_in_6_bits_addr_T_3 = {io_cpu_req_bits_addr[39:32],probe_bits_address}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_321 = metaArb_io_in_6_ready ? 4'h0 : _GEN_311; // @[DCache.scala 818:37 819:23]
  wire  _GEN_322 = metaArb_io_in_6_ready | s1_probe_x16; // @[DCache.scala 818:37 820:18 161:21]
  wire [3:0] _GEN_326 = release_state == 4'h4 ? _GEN_321 : _GEN_311; // @[DCache.scala 814:44]
  wire [3:0] _GEN_328 = releaseDone ? 4'h0 : _GEN_326; // @[DCache.scala 825:{26,42}]
  wire [3:0] _GEN_330 = release_state == 4'h5 ? _GEN_328 : _GEN_326; // @[DCache.scala 823:47]
  wire [3:0] _GEN_331 = releaseDone ? 4'h7 : _GEN_330; // @[DCache.scala 830:{26,42}]
  wire [2:0] _GEN_334 = release_state == 4'h3 ? s2_report_param : _GEN_314; // @[DCache.scala 827:48 829:21]
  wire [3:0] _GEN_340 = release_state == 4'h3 ? _GEN_331 : _GEN_330; // @[DCache.scala 827:48]
  wire [3:0] _GEN_341 = releaseDone ? 4'h7 : _GEN_340; // @[DCache.scala 834:{26,42}]
  wire [2:0] _GEN_343 = release_state == 4'h2 ? s2_report_param : _GEN_334; // @[DCache.scala 832:48 833:21]
  wire [3:0] _GEN_349 = release_state == 4'h2 ? _GEN_341 : _GEN_340; // @[DCache.scala 832:48]
  wire  _GEN_358 = _T_322 & c_first | _GEN_258; // @[DCache.scala 852:41 853:26]
  wire [1:0] newCoh_state = _T_337 ? voluntaryNewCoh_state : probeNewCoh_state; // @[DCache.scala 836:102 849:14]
  wire [11:0] _dataArb_io_in_2_bits_addr_T_1 = {probe_bits_address[11:6], 6'h0}; // @[DCache.scala 876:55]
  wire [5:0] _dataArb_io_in_2_bits_addr_T_3 = {releaseDataBeat[2:0], 3'h0}; // @[DCache.scala 876:117]
  wire [11:0] _GEN_439 = {{6'd0}, _dataArb_io_in_2_bits_addr_T_3}; // @[DCache.scala 876:72]
  wire  _metaArb_io_in_4_valid_T_1 = release_state == 4'h7; // @[package.scala 15:47]
  wire [19:0] metaArb_io_in_4_bits_data_meta_tag = probe_bits_address[31:12]; // @[DCache.scala 886:78]
  wire  _T_341 = metaArb_io_in_4_ready & metaArb_io_in_4_valid; // @[Decoupled.scala 50:35]
  reg  io_cpu_s2_xcpt_REG; // @[DCache.scala 905:32]
  reg  doUncachedResp; // @[DCache.scala 920:27]
  wire [31:0] io_cpu_resp_bits_data_shifted = get_a_mask_bit ? s2_data_corrected[63:32] : s2_data_corrected[31:0]; // @[AMOALU.scala 40:24]
  wire  _io_cpu_resp_bits_data_T_3 = s2_req_signed & io_cpu_resp_bits_data_shifted[31]; // @[AMOALU.scala 43:72]
  wire [31:0] _io_cpu_resp_bits_data_T_5 = _io_cpu_resp_bits_data_T_3 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _io_cpu_resp_bits_data_T_7 = s2_req_size == 2'h2 ? _io_cpu_resp_bits_data_T_5 : s2_data_corrected[63:32]; // @[AMOALU.scala 43:20]
  wire [63:0] _io_cpu_resp_bits_data_T_8 = {_io_cpu_resp_bits_data_T_7,io_cpu_resp_bits_data_shifted}; // @[Cat.scala 31:58]
  wire [15:0] io_cpu_resp_bits_data_shifted_1 = get_a_mask_bit_1 ? _io_cpu_resp_bits_data_T_8[31:16] :
    _io_cpu_resp_bits_data_T_8[15:0]; // @[AMOALU.scala 40:24]
  wire  _io_cpu_resp_bits_data_T_12 = s2_req_signed & io_cpu_resp_bits_data_shifted_1[15]; // @[AMOALU.scala 43:72]
  wire [47:0] _io_cpu_resp_bits_data_T_14 = _io_cpu_resp_bits_data_T_12 ? 48'hffffffffffff : 48'h0; // @[Bitwise.scala 74:12]
  wire [47:0] _io_cpu_resp_bits_data_T_16 = s2_req_size == 2'h1 ? _io_cpu_resp_bits_data_T_14 :
    _io_cpu_resp_bits_data_T_8[63:16]; // @[AMOALU.scala 43:20]
  wire [63:0] _io_cpu_resp_bits_data_T_17 = {_io_cpu_resp_bits_data_T_16,io_cpu_resp_bits_data_shifted_1}; // @[Cat.scala 31:58]
  wire [7:0] io_cpu_resp_bits_data_shifted_2 = get_a_mask_bit_2 ? _io_cpu_resp_bits_data_T_17[15:8] :
    _io_cpu_resp_bits_data_T_17[7:0]; // @[AMOALU.scala 40:24]
  wire [7:0] io_cpu_resp_bits_data_zeroed_2 = _s2_write_T_3 ? 8'h0 : io_cpu_resp_bits_data_shifted_2; // @[AMOALU.scala 42:23]
  wire  _io_cpu_resp_bits_data_T_21 = s2_req_signed & io_cpu_resp_bits_data_zeroed_2[7]; // @[AMOALU.scala 43:72]
  wire [55:0] _io_cpu_resp_bits_data_T_23 = _io_cpu_resp_bits_data_T_21 ? 56'hffffffffffffff : 56'h0; // @[Bitwise.scala 74:12]
  wire [55:0] _io_cpu_resp_bits_data_T_25 = s2_req_size == 2'h0 | _s2_write_T_3 ? _io_cpu_resp_bits_data_T_23 :
    _io_cpu_resp_bits_data_T_17[63:8]; // @[AMOALU.scala 43:20]
  wire [63:0] _io_cpu_resp_bits_data_T_26 = {_io_cpu_resp_bits_data_T_25,io_cpu_resp_bits_data_zeroed_2}; // @[Cat.scala 31:58]
  wire [63:0] _GEN_440 = {{63'd0}, s2_sc_fail}; // @[DCache.scala 946:41]
  reg  REG; // @[DCache.scala 980:18]
  wire  _GEN_376 = REG | resetting; // @[DCache.scala 202:26 980:{27,39}]
  wire [8:0] flushCounterNext = flushCounter + 8'h1; // @[DCache.scala 981:39]
  wire  flushDone = flushCounterNext[8:6] == 3'h4; // @[DCache.scala 982:57]
  wire [11:0] _metaArb_io_in_5_bits_addr_T_1 = {metaArb_io_in_5_bits_idx, 6'h0}; // @[DCache.scala 990:98]
  wire [8:0] _GEN_378 = resetting ? flushCounterNext : {{1'd0}, flushCounter}; // @[DCache.scala 1023:20 1024:18 203:25]
  reg [8:0] io_cpu_perf_release_counter; // @[Edges.scala 228:27]
  wire [8:0] io_cpu_perf_release_counter1 = io_cpu_perf_release_counter - 9'h1; // @[Edges.scala 229:28]
  wire  io_cpu_perf_release_first = io_cpu_perf_release_counter == 9'h0; // @[Edges.scala 230:25]
  wire  io_cpu_perf_release_last = io_cpu_perf_release_counter == 9'h1 | beats1_1 == 9'h0; // @[Edges.scala 231:37]
  wire  _T_357 = ~grantIsCached; // @[DCache.scala 1105:35]
  wire  _GEN_453 = _T_296 & _T_357; // @[DCache.scala 660:17]
  OptimizationBarrier tlb_mpu_ppn_barrier ( // @[package.scala 258:25]
    .io_x_ppn(tlb_mpu_ppn_barrier_io_x_ppn),
    .io_x_u(tlb_mpu_ppn_barrier_io_x_u),
    .io_x_ae_ptw(tlb_mpu_ppn_barrier_io_x_ae_ptw),
    .io_x_ae_final(tlb_mpu_ppn_barrier_io_x_ae_final),
    .io_x_pf(tlb_mpu_ppn_barrier_io_x_pf),
    .io_x_gf(tlb_mpu_ppn_barrier_io_x_gf),
    .io_x_sw(tlb_mpu_ppn_barrier_io_x_sw),
    .io_x_sx(tlb_mpu_ppn_barrier_io_x_sx),
    .io_x_sr(tlb_mpu_ppn_barrier_io_x_sr),
    .io_x_pw(tlb_mpu_ppn_barrier_io_x_pw),
    .io_x_px(tlb_mpu_ppn_barrier_io_x_px),
    .io_x_pr(tlb_mpu_ppn_barrier_io_x_pr),
    .io_x_ppp(tlb_mpu_ppn_barrier_io_x_ppp),
    .io_x_pal(tlb_mpu_ppn_barrier_io_x_pal),
    .io_x_paa(tlb_mpu_ppn_barrier_io_x_paa),
    .io_x_eff(tlb_mpu_ppn_barrier_io_x_eff),
    .io_x_c(tlb_mpu_ppn_barrier_io_x_c),
    .io_y_ppn(tlb_mpu_ppn_barrier_io_y_ppn),
    .io_y_u(tlb_mpu_ppn_barrier_io_y_u),
    .io_y_ae_ptw(tlb_mpu_ppn_barrier_io_y_ae_ptw),
    .io_y_ae_final(tlb_mpu_ppn_barrier_io_y_ae_final),
    .io_y_pf(tlb_mpu_ppn_barrier_io_y_pf),
    .io_y_gf(tlb_mpu_ppn_barrier_io_y_gf),
    .io_y_sw(tlb_mpu_ppn_barrier_io_y_sw),
    .io_y_sx(tlb_mpu_ppn_barrier_io_y_sx),
    .io_y_sr(tlb_mpu_ppn_barrier_io_y_sr),
    .io_y_pw(tlb_mpu_ppn_barrier_io_y_pw),
    .io_y_px(tlb_mpu_ppn_barrier_io_y_px),
    .io_y_pr(tlb_mpu_ppn_barrier_io_y_pr),
    .io_y_ppp(tlb_mpu_ppn_barrier_io_y_ppp),
    .io_y_pal(tlb_mpu_ppn_barrier_io_y_pal),
    .io_y_paa(tlb_mpu_ppn_barrier_io_y_paa),
    .io_y_eff(tlb_mpu_ppn_barrier_io_y_eff),
    .io_y_c(tlb_mpu_ppn_barrier_io_y_c)
  );
  PMPChecker tlb_pmp ( // @[TLB.scala 234:19]
    .io_prv(tlb_pmp_io_prv),
    .io_pmp_0_cfg_l(tlb_pmp_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_a(tlb_pmp_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(tlb_pmp_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(tlb_pmp_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(tlb_pmp_io_pmp_0_cfg_r),
    .io_pmp_0_addr(tlb_pmp_io_pmp_0_addr),
    .io_pmp_0_mask(tlb_pmp_io_pmp_0_mask),
    .io_pmp_1_cfg_l(tlb_pmp_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_a(tlb_pmp_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(tlb_pmp_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(tlb_pmp_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(tlb_pmp_io_pmp_1_cfg_r),
    .io_pmp_1_addr(tlb_pmp_io_pmp_1_addr),
    .io_pmp_1_mask(tlb_pmp_io_pmp_1_mask),
    .io_pmp_2_cfg_l(tlb_pmp_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_a(tlb_pmp_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(tlb_pmp_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(tlb_pmp_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(tlb_pmp_io_pmp_2_cfg_r),
    .io_pmp_2_addr(tlb_pmp_io_pmp_2_addr),
    .io_pmp_2_mask(tlb_pmp_io_pmp_2_mask),
    .io_pmp_3_cfg_l(tlb_pmp_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_a(tlb_pmp_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(tlb_pmp_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(tlb_pmp_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(tlb_pmp_io_pmp_3_cfg_r),
    .io_pmp_3_addr(tlb_pmp_io_pmp_3_addr),
    .io_pmp_3_mask(tlb_pmp_io_pmp_3_mask),
    .io_pmp_4_cfg_l(tlb_pmp_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_a(tlb_pmp_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(tlb_pmp_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(tlb_pmp_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(tlb_pmp_io_pmp_4_cfg_r),
    .io_pmp_4_addr(tlb_pmp_io_pmp_4_addr),
    .io_pmp_4_mask(tlb_pmp_io_pmp_4_mask),
    .io_pmp_5_cfg_l(tlb_pmp_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_a(tlb_pmp_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(tlb_pmp_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(tlb_pmp_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(tlb_pmp_io_pmp_5_cfg_r),
    .io_pmp_5_addr(tlb_pmp_io_pmp_5_addr),
    .io_pmp_5_mask(tlb_pmp_io_pmp_5_mask),
    .io_pmp_6_cfg_l(tlb_pmp_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_a(tlb_pmp_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(tlb_pmp_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(tlb_pmp_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(tlb_pmp_io_pmp_6_cfg_r),
    .io_pmp_6_addr(tlb_pmp_io_pmp_6_addr),
    .io_pmp_6_mask(tlb_pmp_io_pmp_6_mask),
    .io_pmp_7_cfg_l(tlb_pmp_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_a(tlb_pmp_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(tlb_pmp_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(tlb_pmp_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(tlb_pmp_io_pmp_7_cfg_r),
    .io_pmp_7_addr(tlb_pmp_io_pmp_7_addr),
    .io_pmp_7_mask(tlb_pmp_io_pmp_7_mask),
    .io_addr(tlb_pmp_io_addr),
    .io_size(tlb_pmp_io_size),
    .io_r(tlb_pmp_io_r),
    .io_w(tlb_pmp_io_w),
    .io_x(tlb_pmp_io_x)
  );
  OptimizationBarrier tlb_entries_barrier ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_io_x_ppn),
    .io_x_u(tlb_entries_barrier_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_io_x_pf),
    .io_x_gf(tlb_entries_barrier_io_x_gf),
    .io_x_sw(tlb_entries_barrier_io_x_sw),
    .io_x_sx(tlb_entries_barrier_io_x_sx),
    .io_x_sr(tlb_entries_barrier_io_x_sr),
    .io_x_pw(tlb_entries_barrier_io_x_pw),
    .io_x_px(tlb_entries_barrier_io_x_px),
    .io_x_pr(tlb_entries_barrier_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_io_x_pal),
    .io_x_paa(tlb_entries_barrier_io_x_paa),
    .io_x_eff(tlb_entries_barrier_io_x_eff),
    .io_x_c(tlb_entries_barrier_io_x_c),
    .io_y_ppn(tlb_entries_barrier_io_y_ppn),
    .io_y_u(tlb_entries_barrier_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_io_y_pf),
    .io_y_gf(tlb_entries_barrier_io_y_gf),
    .io_y_sw(tlb_entries_barrier_io_y_sw),
    .io_y_sx(tlb_entries_barrier_io_y_sx),
    .io_y_sr(tlb_entries_barrier_io_y_sr),
    .io_y_pw(tlb_entries_barrier_io_y_pw),
    .io_y_px(tlb_entries_barrier_io_y_px),
    .io_y_pr(tlb_entries_barrier_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_io_y_pal),
    .io_y_paa(tlb_entries_barrier_io_y_paa),
    .io_y_eff(tlb_entries_barrier_io_y_eff),
    .io_y_c(tlb_entries_barrier_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_1 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_1_io_x_ppn),
    .io_x_u(tlb_entries_barrier_1_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_1_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_1_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_1_io_x_pf),
    .io_x_gf(tlb_entries_barrier_1_io_x_gf),
    .io_x_sw(tlb_entries_barrier_1_io_x_sw),
    .io_x_sx(tlb_entries_barrier_1_io_x_sx),
    .io_x_sr(tlb_entries_barrier_1_io_x_sr),
    .io_x_pw(tlb_entries_barrier_1_io_x_pw),
    .io_x_px(tlb_entries_barrier_1_io_x_px),
    .io_x_pr(tlb_entries_barrier_1_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_1_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_1_io_x_pal),
    .io_x_paa(tlb_entries_barrier_1_io_x_paa),
    .io_x_eff(tlb_entries_barrier_1_io_x_eff),
    .io_x_c(tlb_entries_barrier_1_io_x_c),
    .io_y_ppn(tlb_entries_barrier_1_io_y_ppn),
    .io_y_u(tlb_entries_barrier_1_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_1_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_1_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_1_io_y_pf),
    .io_y_gf(tlb_entries_barrier_1_io_y_gf),
    .io_y_sw(tlb_entries_barrier_1_io_y_sw),
    .io_y_sx(tlb_entries_barrier_1_io_y_sx),
    .io_y_sr(tlb_entries_barrier_1_io_y_sr),
    .io_y_pw(tlb_entries_barrier_1_io_y_pw),
    .io_y_px(tlb_entries_barrier_1_io_y_px),
    .io_y_pr(tlb_entries_barrier_1_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_1_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_1_io_y_pal),
    .io_y_paa(tlb_entries_barrier_1_io_y_paa),
    .io_y_eff(tlb_entries_barrier_1_io_y_eff),
    .io_y_c(tlb_entries_barrier_1_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_2 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_2_io_x_ppn),
    .io_x_u(tlb_entries_barrier_2_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_2_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_2_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_2_io_x_pf),
    .io_x_gf(tlb_entries_barrier_2_io_x_gf),
    .io_x_sw(tlb_entries_barrier_2_io_x_sw),
    .io_x_sx(tlb_entries_barrier_2_io_x_sx),
    .io_x_sr(tlb_entries_barrier_2_io_x_sr),
    .io_x_pw(tlb_entries_barrier_2_io_x_pw),
    .io_x_px(tlb_entries_barrier_2_io_x_px),
    .io_x_pr(tlb_entries_barrier_2_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_2_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_2_io_x_pal),
    .io_x_paa(tlb_entries_barrier_2_io_x_paa),
    .io_x_eff(tlb_entries_barrier_2_io_x_eff),
    .io_x_c(tlb_entries_barrier_2_io_x_c),
    .io_y_ppn(tlb_entries_barrier_2_io_y_ppn),
    .io_y_u(tlb_entries_barrier_2_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_2_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_2_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_2_io_y_pf),
    .io_y_gf(tlb_entries_barrier_2_io_y_gf),
    .io_y_sw(tlb_entries_barrier_2_io_y_sw),
    .io_y_sx(tlb_entries_barrier_2_io_y_sx),
    .io_y_sr(tlb_entries_barrier_2_io_y_sr),
    .io_y_pw(tlb_entries_barrier_2_io_y_pw),
    .io_y_px(tlb_entries_barrier_2_io_y_px),
    .io_y_pr(tlb_entries_barrier_2_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_2_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_2_io_y_pal),
    .io_y_paa(tlb_entries_barrier_2_io_y_paa),
    .io_y_eff(tlb_entries_barrier_2_io_y_eff),
    .io_y_c(tlb_entries_barrier_2_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_3 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_3_io_x_ppn),
    .io_x_u(tlb_entries_barrier_3_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_3_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_3_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_3_io_x_pf),
    .io_x_gf(tlb_entries_barrier_3_io_x_gf),
    .io_x_sw(tlb_entries_barrier_3_io_x_sw),
    .io_x_sx(tlb_entries_barrier_3_io_x_sx),
    .io_x_sr(tlb_entries_barrier_3_io_x_sr),
    .io_x_pw(tlb_entries_barrier_3_io_x_pw),
    .io_x_px(tlb_entries_barrier_3_io_x_px),
    .io_x_pr(tlb_entries_barrier_3_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_3_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_3_io_x_pal),
    .io_x_paa(tlb_entries_barrier_3_io_x_paa),
    .io_x_eff(tlb_entries_barrier_3_io_x_eff),
    .io_x_c(tlb_entries_barrier_3_io_x_c),
    .io_y_ppn(tlb_entries_barrier_3_io_y_ppn),
    .io_y_u(tlb_entries_barrier_3_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_3_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_3_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_3_io_y_pf),
    .io_y_gf(tlb_entries_barrier_3_io_y_gf),
    .io_y_sw(tlb_entries_barrier_3_io_y_sw),
    .io_y_sx(tlb_entries_barrier_3_io_y_sx),
    .io_y_sr(tlb_entries_barrier_3_io_y_sr),
    .io_y_pw(tlb_entries_barrier_3_io_y_pw),
    .io_y_px(tlb_entries_barrier_3_io_y_px),
    .io_y_pr(tlb_entries_barrier_3_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_3_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_3_io_y_pal),
    .io_y_paa(tlb_entries_barrier_3_io_y_paa),
    .io_y_eff(tlb_entries_barrier_3_io_y_eff),
    .io_y_c(tlb_entries_barrier_3_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_4 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_4_io_x_ppn),
    .io_x_u(tlb_entries_barrier_4_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_4_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_4_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_4_io_x_pf),
    .io_x_gf(tlb_entries_barrier_4_io_x_gf),
    .io_x_sw(tlb_entries_barrier_4_io_x_sw),
    .io_x_sx(tlb_entries_barrier_4_io_x_sx),
    .io_x_sr(tlb_entries_barrier_4_io_x_sr),
    .io_x_pw(tlb_entries_barrier_4_io_x_pw),
    .io_x_px(tlb_entries_barrier_4_io_x_px),
    .io_x_pr(tlb_entries_barrier_4_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_4_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_4_io_x_pal),
    .io_x_paa(tlb_entries_barrier_4_io_x_paa),
    .io_x_eff(tlb_entries_barrier_4_io_x_eff),
    .io_x_c(tlb_entries_barrier_4_io_x_c),
    .io_y_ppn(tlb_entries_barrier_4_io_y_ppn),
    .io_y_u(tlb_entries_barrier_4_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_4_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_4_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_4_io_y_pf),
    .io_y_gf(tlb_entries_barrier_4_io_y_gf),
    .io_y_sw(tlb_entries_barrier_4_io_y_sw),
    .io_y_sx(tlb_entries_barrier_4_io_y_sx),
    .io_y_sr(tlb_entries_barrier_4_io_y_sr),
    .io_y_pw(tlb_entries_barrier_4_io_y_pw),
    .io_y_px(tlb_entries_barrier_4_io_y_px),
    .io_y_pr(tlb_entries_barrier_4_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_4_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_4_io_y_pal),
    .io_y_paa(tlb_entries_barrier_4_io_y_paa),
    .io_y_eff(tlb_entries_barrier_4_io_y_eff),
    .io_y_c(tlb_entries_barrier_4_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_5 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_5_io_x_ppn),
    .io_x_u(tlb_entries_barrier_5_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_5_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_5_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_5_io_x_pf),
    .io_x_gf(tlb_entries_barrier_5_io_x_gf),
    .io_x_sw(tlb_entries_barrier_5_io_x_sw),
    .io_x_sx(tlb_entries_barrier_5_io_x_sx),
    .io_x_sr(tlb_entries_barrier_5_io_x_sr),
    .io_x_pw(tlb_entries_barrier_5_io_x_pw),
    .io_x_px(tlb_entries_barrier_5_io_x_px),
    .io_x_pr(tlb_entries_barrier_5_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_5_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_5_io_x_pal),
    .io_x_paa(tlb_entries_barrier_5_io_x_paa),
    .io_x_eff(tlb_entries_barrier_5_io_x_eff),
    .io_x_c(tlb_entries_barrier_5_io_x_c),
    .io_y_ppn(tlb_entries_barrier_5_io_y_ppn),
    .io_y_u(tlb_entries_barrier_5_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_5_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_5_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_5_io_y_pf),
    .io_y_gf(tlb_entries_barrier_5_io_y_gf),
    .io_y_sw(tlb_entries_barrier_5_io_y_sw),
    .io_y_sx(tlb_entries_barrier_5_io_y_sx),
    .io_y_sr(tlb_entries_barrier_5_io_y_sr),
    .io_y_pw(tlb_entries_barrier_5_io_y_pw),
    .io_y_px(tlb_entries_barrier_5_io_y_px),
    .io_y_pr(tlb_entries_barrier_5_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_5_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_5_io_y_pal),
    .io_y_paa(tlb_entries_barrier_5_io_y_paa),
    .io_y_eff(tlb_entries_barrier_5_io_y_eff),
    .io_y_c(tlb_entries_barrier_5_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_6 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_6_io_x_ppn),
    .io_x_u(tlb_entries_barrier_6_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_6_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_6_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_6_io_x_pf),
    .io_x_gf(tlb_entries_barrier_6_io_x_gf),
    .io_x_sw(tlb_entries_barrier_6_io_x_sw),
    .io_x_sx(tlb_entries_barrier_6_io_x_sx),
    .io_x_sr(tlb_entries_barrier_6_io_x_sr),
    .io_x_pw(tlb_entries_barrier_6_io_x_pw),
    .io_x_px(tlb_entries_barrier_6_io_x_px),
    .io_x_pr(tlb_entries_barrier_6_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_6_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_6_io_x_pal),
    .io_x_paa(tlb_entries_barrier_6_io_x_paa),
    .io_x_eff(tlb_entries_barrier_6_io_x_eff),
    .io_x_c(tlb_entries_barrier_6_io_x_c),
    .io_y_ppn(tlb_entries_barrier_6_io_y_ppn),
    .io_y_u(tlb_entries_barrier_6_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_6_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_6_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_6_io_y_pf),
    .io_y_gf(tlb_entries_barrier_6_io_y_gf),
    .io_y_sw(tlb_entries_barrier_6_io_y_sw),
    .io_y_sx(tlb_entries_barrier_6_io_y_sx),
    .io_y_sr(tlb_entries_barrier_6_io_y_sr),
    .io_y_pw(tlb_entries_barrier_6_io_y_pw),
    .io_y_px(tlb_entries_barrier_6_io_y_px),
    .io_y_pr(tlb_entries_barrier_6_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_6_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_6_io_y_pal),
    .io_y_paa(tlb_entries_barrier_6_io_y_paa),
    .io_y_eff(tlb_entries_barrier_6_io_y_eff),
    .io_y_c(tlb_entries_barrier_6_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_7 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_7_io_x_ppn),
    .io_x_u(tlb_entries_barrier_7_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_7_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_7_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_7_io_x_pf),
    .io_x_gf(tlb_entries_barrier_7_io_x_gf),
    .io_x_sw(tlb_entries_barrier_7_io_x_sw),
    .io_x_sx(tlb_entries_barrier_7_io_x_sx),
    .io_x_sr(tlb_entries_barrier_7_io_x_sr),
    .io_x_pw(tlb_entries_barrier_7_io_x_pw),
    .io_x_px(tlb_entries_barrier_7_io_x_px),
    .io_x_pr(tlb_entries_barrier_7_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_7_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_7_io_x_pal),
    .io_x_paa(tlb_entries_barrier_7_io_x_paa),
    .io_x_eff(tlb_entries_barrier_7_io_x_eff),
    .io_x_c(tlb_entries_barrier_7_io_x_c),
    .io_y_ppn(tlb_entries_barrier_7_io_y_ppn),
    .io_y_u(tlb_entries_barrier_7_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_7_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_7_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_7_io_y_pf),
    .io_y_gf(tlb_entries_barrier_7_io_y_gf),
    .io_y_sw(tlb_entries_barrier_7_io_y_sw),
    .io_y_sx(tlb_entries_barrier_7_io_y_sx),
    .io_y_sr(tlb_entries_barrier_7_io_y_sr),
    .io_y_pw(tlb_entries_barrier_7_io_y_pw),
    .io_y_px(tlb_entries_barrier_7_io_y_px),
    .io_y_pr(tlb_entries_barrier_7_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_7_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_7_io_y_pal),
    .io_y_paa(tlb_entries_barrier_7_io_y_paa),
    .io_y_eff(tlb_entries_barrier_7_io_y_eff),
    .io_y_c(tlb_entries_barrier_7_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_8 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_8_io_x_ppn),
    .io_x_u(tlb_entries_barrier_8_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_8_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_8_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_8_io_x_pf),
    .io_x_gf(tlb_entries_barrier_8_io_x_gf),
    .io_x_sw(tlb_entries_barrier_8_io_x_sw),
    .io_x_sx(tlb_entries_barrier_8_io_x_sx),
    .io_x_sr(tlb_entries_barrier_8_io_x_sr),
    .io_x_pw(tlb_entries_barrier_8_io_x_pw),
    .io_x_px(tlb_entries_barrier_8_io_x_px),
    .io_x_pr(tlb_entries_barrier_8_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_8_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_8_io_x_pal),
    .io_x_paa(tlb_entries_barrier_8_io_x_paa),
    .io_x_eff(tlb_entries_barrier_8_io_x_eff),
    .io_x_c(tlb_entries_barrier_8_io_x_c),
    .io_y_ppn(tlb_entries_barrier_8_io_y_ppn),
    .io_y_u(tlb_entries_barrier_8_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_8_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_8_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_8_io_y_pf),
    .io_y_gf(tlb_entries_barrier_8_io_y_gf),
    .io_y_sw(tlb_entries_barrier_8_io_y_sw),
    .io_y_sx(tlb_entries_barrier_8_io_y_sx),
    .io_y_sr(tlb_entries_barrier_8_io_y_sr),
    .io_y_pw(tlb_entries_barrier_8_io_y_pw),
    .io_y_px(tlb_entries_barrier_8_io_y_px),
    .io_y_pr(tlb_entries_barrier_8_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_8_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_8_io_y_pal),
    .io_y_paa(tlb_entries_barrier_8_io_y_paa),
    .io_y_eff(tlb_entries_barrier_8_io_y_eff),
    .io_y_c(tlb_entries_barrier_8_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_9 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_9_io_x_ppn),
    .io_x_u(tlb_entries_barrier_9_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_9_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_9_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_9_io_x_pf),
    .io_x_gf(tlb_entries_barrier_9_io_x_gf),
    .io_x_sw(tlb_entries_barrier_9_io_x_sw),
    .io_x_sx(tlb_entries_barrier_9_io_x_sx),
    .io_x_sr(tlb_entries_barrier_9_io_x_sr),
    .io_x_pw(tlb_entries_barrier_9_io_x_pw),
    .io_x_px(tlb_entries_barrier_9_io_x_px),
    .io_x_pr(tlb_entries_barrier_9_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_9_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_9_io_x_pal),
    .io_x_paa(tlb_entries_barrier_9_io_x_paa),
    .io_x_eff(tlb_entries_barrier_9_io_x_eff),
    .io_x_c(tlb_entries_barrier_9_io_x_c),
    .io_y_ppn(tlb_entries_barrier_9_io_y_ppn),
    .io_y_u(tlb_entries_barrier_9_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_9_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_9_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_9_io_y_pf),
    .io_y_gf(tlb_entries_barrier_9_io_y_gf),
    .io_y_sw(tlb_entries_barrier_9_io_y_sw),
    .io_y_sx(tlb_entries_barrier_9_io_y_sx),
    .io_y_sr(tlb_entries_barrier_9_io_y_sr),
    .io_y_pw(tlb_entries_barrier_9_io_y_pw),
    .io_y_px(tlb_entries_barrier_9_io_y_px),
    .io_y_pr(tlb_entries_barrier_9_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_9_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_9_io_y_pal),
    .io_y_paa(tlb_entries_barrier_9_io_y_paa),
    .io_y_eff(tlb_entries_barrier_9_io_y_eff),
    .io_y_c(tlb_entries_barrier_9_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_10 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_10_io_x_ppn),
    .io_x_u(tlb_entries_barrier_10_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_10_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_10_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_10_io_x_pf),
    .io_x_gf(tlb_entries_barrier_10_io_x_gf),
    .io_x_sw(tlb_entries_barrier_10_io_x_sw),
    .io_x_sx(tlb_entries_barrier_10_io_x_sx),
    .io_x_sr(tlb_entries_barrier_10_io_x_sr),
    .io_x_pw(tlb_entries_barrier_10_io_x_pw),
    .io_x_px(tlb_entries_barrier_10_io_x_px),
    .io_x_pr(tlb_entries_barrier_10_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_10_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_10_io_x_pal),
    .io_x_paa(tlb_entries_barrier_10_io_x_paa),
    .io_x_eff(tlb_entries_barrier_10_io_x_eff),
    .io_x_c(tlb_entries_barrier_10_io_x_c),
    .io_y_ppn(tlb_entries_barrier_10_io_y_ppn),
    .io_y_u(tlb_entries_barrier_10_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_10_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_10_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_10_io_y_pf),
    .io_y_gf(tlb_entries_barrier_10_io_y_gf),
    .io_y_sw(tlb_entries_barrier_10_io_y_sw),
    .io_y_sx(tlb_entries_barrier_10_io_y_sx),
    .io_y_sr(tlb_entries_barrier_10_io_y_sr),
    .io_y_pw(tlb_entries_barrier_10_io_y_pw),
    .io_y_px(tlb_entries_barrier_10_io_y_px),
    .io_y_pr(tlb_entries_barrier_10_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_10_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_10_io_y_pal),
    .io_y_paa(tlb_entries_barrier_10_io_y_paa),
    .io_y_eff(tlb_entries_barrier_10_io_y_eff),
    .io_y_c(tlb_entries_barrier_10_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_11 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_11_io_x_ppn),
    .io_x_u(tlb_entries_barrier_11_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_11_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_11_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_11_io_x_pf),
    .io_x_gf(tlb_entries_barrier_11_io_x_gf),
    .io_x_sw(tlb_entries_barrier_11_io_x_sw),
    .io_x_sx(tlb_entries_barrier_11_io_x_sx),
    .io_x_sr(tlb_entries_barrier_11_io_x_sr),
    .io_x_pw(tlb_entries_barrier_11_io_x_pw),
    .io_x_px(tlb_entries_barrier_11_io_x_px),
    .io_x_pr(tlb_entries_barrier_11_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_11_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_11_io_x_pal),
    .io_x_paa(tlb_entries_barrier_11_io_x_paa),
    .io_x_eff(tlb_entries_barrier_11_io_x_eff),
    .io_x_c(tlb_entries_barrier_11_io_x_c),
    .io_y_ppn(tlb_entries_barrier_11_io_y_ppn),
    .io_y_u(tlb_entries_barrier_11_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_11_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_11_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_11_io_y_pf),
    .io_y_gf(tlb_entries_barrier_11_io_y_gf),
    .io_y_sw(tlb_entries_barrier_11_io_y_sw),
    .io_y_sx(tlb_entries_barrier_11_io_y_sx),
    .io_y_sr(tlb_entries_barrier_11_io_y_sr),
    .io_y_pw(tlb_entries_barrier_11_io_y_pw),
    .io_y_px(tlb_entries_barrier_11_io_y_px),
    .io_y_pr(tlb_entries_barrier_11_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_11_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_11_io_y_pal),
    .io_y_paa(tlb_entries_barrier_11_io_y_paa),
    .io_y_eff(tlb_entries_barrier_11_io_y_eff),
    .io_y_c(tlb_entries_barrier_11_io_y_c)
  );
  OptimizationBarrier tlb_entries_barrier_12 ( // @[package.scala 258:25]
    .io_x_ppn(tlb_entries_barrier_12_io_x_ppn),
    .io_x_u(tlb_entries_barrier_12_io_x_u),
    .io_x_ae_ptw(tlb_entries_barrier_12_io_x_ae_ptw),
    .io_x_ae_final(tlb_entries_barrier_12_io_x_ae_final),
    .io_x_pf(tlb_entries_barrier_12_io_x_pf),
    .io_x_gf(tlb_entries_barrier_12_io_x_gf),
    .io_x_sw(tlb_entries_barrier_12_io_x_sw),
    .io_x_sx(tlb_entries_barrier_12_io_x_sx),
    .io_x_sr(tlb_entries_barrier_12_io_x_sr),
    .io_x_pw(tlb_entries_barrier_12_io_x_pw),
    .io_x_px(tlb_entries_barrier_12_io_x_px),
    .io_x_pr(tlb_entries_barrier_12_io_x_pr),
    .io_x_ppp(tlb_entries_barrier_12_io_x_ppp),
    .io_x_pal(tlb_entries_barrier_12_io_x_pal),
    .io_x_paa(tlb_entries_barrier_12_io_x_paa),
    .io_x_eff(tlb_entries_barrier_12_io_x_eff),
    .io_x_c(tlb_entries_barrier_12_io_x_c),
    .io_y_ppn(tlb_entries_barrier_12_io_y_ppn),
    .io_y_u(tlb_entries_barrier_12_io_y_u),
    .io_y_ae_ptw(tlb_entries_barrier_12_io_y_ae_ptw),
    .io_y_ae_final(tlb_entries_barrier_12_io_y_ae_final),
    .io_y_pf(tlb_entries_barrier_12_io_y_pf),
    .io_y_gf(tlb_entries_barrier_12_io_y_gf),
    .io_y_sw(tlb_entries_barrier_12_io_y_sw),
    .io_y_sx(tlb_entries_barrier_12_io_y_sx),
    .io_y_sr(tlb_entries_barrier_12_io_y_sr),
    .io_y_pw(tlb_entries_barrier_12_io_y_pw),
    .io_y_px(tlb_entries_barrier_12_io_y_px),
    .io_y_pr(tlb_entries_barrier_12_io_y_pr),
    .io_y_ppp(tlb_entries_barrier_12_io_y_ppp),
    .io_y_pal(tlb_entries_barrier_12_io_y_pal),
    .io_y_paa(tlb_entries_barrier_12_io_y_paa),
    .io_y_eff(tlb_entries_barrier_12_io_y_eff),
    .io_y_c(tlb_entries_barrier_12_io_y_c)
  );
  OptimizationBarrier pma_checker_mpu_ppn_barrier ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_mpu_ppn_barrier_io_x_ppn),
    .io_x_u(pma_checker_mpu_ppn_barrier_io_x_u),
    .io_x_ae_ptw(pma_checker_mpu_ppn_barrier_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_mpu_ppn_barrier_io_x_ae_final),
    .io_x_pf(pma_checker_mpu_ppn_barrier_io_x_pf),
    .io_x_gf(pma_checker_mpu_ppn_barrier_io_x_gf),
    .io_x_sw(pma_checker_mpu_ppn_barrier_io_x_sw),
    .io_x_sx(pma_checker_mpu_ppn_barrier_io_x_sx),
    .io_x_sr(pma_checker_mpu_ppn_barrier_io_x_sr),
    .io_x_pw(pma_checker_mpu_ppn_barrier_io_x_pw),
    .io_x_px(pma_checker_mpu_ppn_barrier_io_x_px),
    .io_x_pr(pma_checker_mpu_ppn_barrier_io_x_pr),
    .io_x_ppp(pma_checker_mpu_ppn_barrier_io_x_ppp),
    .io_x_pal(pma_checker_mpu_ppn_barrier_io_x_pal),
    .io_x_paa(pma_checker_mpu_ppn_barrier_io_x_paa),
    .io_x_eff(pma_checker_mpu_ppn_barrier_io_x_eff),
    .io_x_c(pma_checker_mpu_ppn_barrier_io_x_c),
    .io_y_ppn(pma_checker_mpu_ppn_barrier_io_y_ppn),
    .io_y_u(pma_checker_mpu_ppn_barrier_io_y_u),
    .io_y_ae_ptw(pma_checker_mpu_ppn_barrier_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_mpu_ppn_barrier_io_y_ae_final),
    .io_y_pf(pma_checker_mpu_ppn_barrier_io_y_pf),
    .io_y_gf(pma_checker_mpu_ppn_barrier_io_y_gf),
    .io_y_sw(pma_checker_mpu_ppn_barrier_io_y_sw),
    .io_y_sx(pma_checker_mpu_ppn_barrier_io_y_sx),
    .io_y_sr(pma_checker_mpu_ppn_barrier_io_y_sr),
    .io_y_pw(pma_checker_mpu_ppn_barrier_io_y_pw),
    .io_y_px(pma_checker_mpu_ppn_barrier_io_y_px),
    .io_y_pr(pma_checker_mpu_ppn_barrier_io_y_pr),
    .io_y_ppp(pma_checker_mpu_ppn_barrier_io_y_ppp),
    .io_y_pal(pma_checker_mpu_ppn_barrier_io_y_pal),
    .io_y_paa(pma_checker_mpu_ppn_barrier_io_y_paa),
    .io_y_eff(pma_checker_mpu_ppn_barrier_io_y_eff),
    .io_y_c(pma_checker_mpu_ppn_barrier_io_y_c)
  );
  PMPChecker pma_checker_pmp ( // @[TLB.scala 234:19]
    .io_prv(pma_checker_pmp_io_prv),
    .io_pmp_0_cfg_l(pma_checker_pmp_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_a(pma_checker_pmp_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(pma_checker_pmp_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(pma_checker_pmp_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(pma_checker_pmp_io_pmp_0_cfg_r),
    .io_pmp_0_addr(pma_checker_pmp_io_pmp_0_addr),
    .io_pmp_0_mask(pma_checker_pmp_io_pmp_0_mask),
    .io_pmp_1_cfg_l(pma_checker_pmp_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_a(pma_checker_pmp_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(pma_checker_pmp_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(pma_checker_pmp_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(pma_checker_pmp_io_pmp_1_cfg_r),
    .io_pmp_1_addr(pma_checker_pmp_io_pmp_1_addr),
    .io_pmp_1_mask(pma_checker_pmp_io_pmp_1_mask),
    .io_pmp_2_cfg_l(pma_checker_pmp_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_a(pma_checker_pmp_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(pma_checker_pmp_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(pma_checker_pmp_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(pma_checker_pmp_io_pmp_2_cfg_r),
    .io_pmp_2_addr(pma_checker_pmp_io_pmp_2_addr),
    .io_pmp_2_mask(pma_checker_pmp_io_pmp_2_mask),
    .io_pmp_3_cfg_l(pma_checker_pmp_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_a(pma_checker_pmp_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(pma_checker_pmp_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(pma_checker_pmp_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(pma_checker_pmp_io_pmp_3_cfg_r),
    .io_pmp_3_addr(pma_checker_pmp_io_pmp_3_addr),
    .io_pmp_3_mask(pma_checker_pmp_io_pmp_3_mask),
    .io_pmp_4_cfg_l(pma_checker_pmp_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_a(pma_checker_pmp_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(pma_checker_pmp_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(pma_checker_pmp_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(pma_checker_pmp_io_pmp_4_cfg_r),
    .io_pmp_4_addr(pma_checker_pmp_io_pmp_4_addr),
    .io_pmp_4_mask(pma_checker_pmp_io_pmp_4_mask),
    .io_pmp_5_cfg_l(pma_checker_pmp_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_a(pma_checker_pmp_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(pma_checker_pmp_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(pma_checker_pmp_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(pma_checker_pmp_io_pmp_5_cfg_r),
    .io_pmp_5_addr(pma_checker_pmp_io_pmp_5_addr),
    .io_pmp_5_mask(pma_checker_pmp_io_pmp_5_mask),
    .io_pmp_6_cfg_l(pma_checker_pmp_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_a(pma_checker_pmp_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(pma_checker_pmp_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(pma_checker_pmp_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(pma_checker_pmp_io_pmp_6_cfg_r),
    .io_pmp_6_addr(pma_checker_pmp_io_pmp_6_addr),
    .io_pmp_6_mask(pma_checker_pmp_io_pmp_6_mask),
    .io_pmp_7_cfg_l(pma_checker_pmp_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_a(pma_checker_pmp_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(pma_checker_pmp_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(pma_checker_pmp_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(pma_checker_pmp_io_pmp_7_cfg_r),
    .io_pmp_7_addr(pma_checker_pmp_io_pmp_7_addr),
    .io_pmp_7_mask(pma_checker_pmp_io_pmp_7_mask),
    .io_addr(pma_checker_pmp_io_addr),
    .io_size(pma_checker_pmp_io_size),
    .io_r(pma_checker_pmp_io_r),
    .io_w(pma_checker_pmp_io_w),
    .io_x(pma_checker_pmp_io_x)
  );
  OptimizationBarrier pma_checker_entries_barrier ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_1 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_1_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_1_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_1_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_1_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_1_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_1_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_1_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_1_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_1_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_1_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_1_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_1_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_1_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_1_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_1_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_1_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_1_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_1_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_1_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_1_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_1_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_1_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_1_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_1_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_1_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_1_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_1_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_1_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_1_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_1_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_1_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_1_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_1_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_1_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_2 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_2_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_2_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_2_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_2_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_2_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_2_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_2_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_2_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_2_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_2_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_2_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_2_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_2_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_2_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_2_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_2_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_2_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_2_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_2_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_2_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_2_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_2_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_2_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_2_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_2_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_2_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_2_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_2_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_2_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_2_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_2_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_2_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_2_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_2_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_3 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_3_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_3_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_3_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_3_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_3_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_3_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_3_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_3_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_3_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_3_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_3_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_3_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_3_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_3_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_3_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_3_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_3_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_3_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_3_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_3_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_3_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_3_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_3_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_3_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_3_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_3_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_3_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_3_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_3_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_3_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_3_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_3_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_3_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_3_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_4 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_4_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_4_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_4_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_4_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_4_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_4_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_4_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_4_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_4_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_4_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_4_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_4_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_4_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_4_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_4_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_4_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_4_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_4_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_4_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_4_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_4_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_4_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_4_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_4_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_4_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_4_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_4_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_4_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_4_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_4_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_4_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_4_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_4_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_4_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_5 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_5_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_5_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_5_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_5_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_5_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_5_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_5_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_5_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_5_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_5_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_5_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_5_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_5_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_5_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_5_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_5_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_5_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_5_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_5_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_5_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_5_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_5_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_5_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_5_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_5_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_5_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_5_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_5_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_5_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_5_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_5_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_5_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_5_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_5_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_6 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_6_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_6_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_6_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_6_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_6_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_6_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_6_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_6_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_6_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_6_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_6_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_6_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_6_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_6_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_6_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_6_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_6_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_6_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_6_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_6_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_6_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_6_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_6_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_6_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_6_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_6_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_6_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_6_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_6_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_6_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_6_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_6_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_6_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_6_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_7 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_7_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_7_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_7_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_7_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_7_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_7_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_7_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_7_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_7_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_7_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_7_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_7_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_7_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_7_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_7_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_7_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_7_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_7_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_7_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_7_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_7_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_7_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_7_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_7_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_7_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_7_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_7_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_7_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_7_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_7_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_7_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_7_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_7_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_7_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_8 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_8_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_8_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_8_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_8_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_8_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_8_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_8_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_8_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_8_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_8_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_8_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_8_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_8_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_8_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_8_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_8_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_8_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_8_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_8_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_8_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_8_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_8_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_8_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_8_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_8_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_8_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_8_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_8_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_8_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_8_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_8_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_8_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_8_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_8_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_9 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_9_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_9_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_9_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_9_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_9_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_9_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_9_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_9_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_9_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_9_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_9_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_9_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_9_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_9_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_9_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_9_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_9_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_9_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_9_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_9_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_9_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_9_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_9_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_9_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_9_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_9_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_9_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_9_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_9_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_9_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_9_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_9_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_9_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_9_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_10 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_10_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_10_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_10_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_10_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_10_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_10_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_10_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_10_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_10_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_10_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_10_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_10_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_10_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_10_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_10_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_10_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_10_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_10_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_10_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_10_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_10_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_10_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_10_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_10_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_10_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_10_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_10_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_10_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_10_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_10_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_10_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_10_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_10_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_10_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_11 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_11_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_11_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_11_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_11_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_11_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_11_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_11_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_11_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_11_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_11_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_11_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_11_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_11_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_11_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_11_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_11_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_11_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_11_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_11_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_11_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_11_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_11_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_11_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_11_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_11_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_11_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_11_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_11_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_11_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_11_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_11_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_11_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_11_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_11_io_y_c)
  );
  OptimizationBarrier pma_checker_entries_barrier_12 ( // @[package.scala 258:25]
    .io_x_ppn(pma_checker_entries_barrier_12_io_x_ppn),
    .io_x_u(pma_checker_entries_barrier_12_io_x_u),
    .io_x_ae_ptw(pma_checker_entries_barrier_12_io_x_ae_ptw),
    .io_x_ae_final(pma_checker_entries_barrier_12_io_x_ae_final),
    .io_x_pf(pma_checker_entries_barrier_12_io_x_pf),
    .io_x_gf(pma_checker_entries_barrier_12_io_x_gf),
    .io_x_sw(pma_checker_entries_barrier_12_io_x_sw),
    .io_x_sx(pma_checker_entries_barrier_12_io_x_sx),
    .io_x_sr(pma_checker_entries_barrier_12_io_x_sr),
    .io_x_pw(pma_checker_entries_barrier_12_io_x_pw),
    .io_x_px(pma_checker_entries_barrier_12_io_x_px),
    .io_x_pr(pma_checker_entries_barrier_12_io_x_pr),
    .io_x_ppp(pma_checker_entries_barrier_12_io_x_ppp),
    .io_x_pal(pma_checker_entries_barrier_12_io_x_pal),
    .io_x_paa(pma_checker_entries_barrier_12_io_x_paa),
    .io_x_eff(pma_checker_entries_barrier_12_io_x_eff),
    .io_x_c(pma_checker_entries_barrier_12_io_x_c),
    .io_y_ppn(pma_checker_entries_barrier_12_io_y_ppn),
    .io_y_u(pma_checker_entries_barrier_12_io_y_u),
    .io_y_ae_ptw(pma_checker_entries_barrier_12_io_y_ae_ptw),
    .io_y_ae_final(pma_checker_entries_barrier_12_io_y_ae_final),
    .io_y_pf(pma_checker_entries_barrier_12_io_y_pf),
    .io_y_gf(pma_checker_entries_barrier_12_io_y_gf),
    .io_y_sw(pma_checker_entries_barrier_12_io_y_sw),
    .io_y_sx(pma_checker_entries_barrier_12_io_y_sx),
    .io_y_sr(pma_checker_entries_barrier_12_io_y_sr),
    .io_y_pw(pma_checker_entries_barrier_12_io_y_pw),
    .io_y_px(pma_checker_entries_barrier_12_io_y_px),
    .io_y_pr(pma_checker_entries_barrier_12_io_y_pr),
    .io_y_ppp(pma_checker_entries_barrier_12_io_y_ppp),
    .io_y_pal(pma_checker_entries_barrier_12_io_y_pal),
    .io_y_paa(pma_checker_entries_barrier_12_io_y_paa),
    .io_y_eff(pma_checker_entries_barrier_12_io_y_eff),
    .io_y_c(pma_checker_entries_barrier_12_io_y_c)
  );
  MaxPeriodFibonacciLFSR lfsr_prng ( // @[PRNG.scala 91:22]
    .clock(lfsr_prng_clock),
    .reset(lfsr_prng_reset),
    .io_increment(lfsr_prng_io_increment),
    .io_out_0(lfsr_prng_io_out_0),
    .io_out_1(lfsr_prng_io_out_1),
    .io_out_2(lfsr_prng_io_out_2),
    .io_out_3(lfsr_prng_io_out_3),
    .io_out_4(lfsr_prng_io_out_4),
    .io_out_5(lfsr_prng_io_out_5),
    .io_out_6(lfsr_prng_io_out_6),
    .io_out_7(lfsr_prng_io_out_7),
    .io_out_8(lfsr_prng_io_out_8),
    .io_out_9(lfsr_prng_io_out_9),
    .io_out_10(lfsr_prng_io_out_10),
    .io_out_11(lfsr_prng_io_out_11),
    .io_out_12(lfsr_prng_io_out_12),
    .io_out_13(lfsr_prng_io_out_13),
    .io_out_14(lfsr_prng_io_out_14),
    .io_out_15(lfsr_prng_io_out_15)
  );
  tag_array tag_array ( // @[DescribedSRAM.scala 17:26]
    .RW0_addr(tag_array_RW0_addr),
    .RW0_en(tag_array_RW0_en),
    .RW0_clk(tag_array_RW0_clk),
    .RW0_wmode(tag_array_RW0_wmode),
    .RW0_wdata_0(tag_array_RW0_wdata_0),
    .RW0_wdata_1(tag_array_RW0_wdata_1),
    .RW0_wdata_2(tag_array_RW0_wdata_2),
    .RW0_wdata_3(tag_array_RW0_wdata_3),
    .RW0_rdata_0(tag_array_RW0_rdata_0),
    .RW0_rdata_1(tag_array_RW0_rdata_1),
    .RW0_rdata_2(tag_array_RW0_rdata_2),
    .RW0_rdata_3(tag_array_RW0_rdata_3),
    .RW0_wmask_0(tag_array_RW0_wmask_0),
    .RW0_wmask_1(tag_array_RW0_wmask_1),
    .RW0_wmask_2(tag_array_RW0_wmask_2),
    .RW0_wmask_3(tag_array_RW0_wmask_3)
  );
  DCacheDataArray data ( // @[DCache.scala 130:20]
    .clock(data_clock),
    .io_req_valid(data_io_req_valid),
    .io_req_bits_addr(data_io_req_bits_addr),
    .io_req_bits_write(data_io_req_bits_write),
    .io_req_bits_wdata(data_io_req_bits_wdata),
    .io_req_bits_eccMask(data_io_req_bits_eccMask),
    .io_req_bits_way_en(data_io_req_bits_way_en),
    .io_resp_0(data_io_resp_0),
    .io_resp_1(data_io_resp_1),
    .io_resp_2(data_io_resp_2),
    .io_resp_3(data_io_resp_3)
  );
  AMOALU amoalu ( // @[DCache.scala 954:26]
    .io_mask(amoalu_io_mask),
    .io_cmd(amoalu_io_cmd),
    .io_lhs(amoalu_io_lhs),
    .io_rhs(amoalu_io_rhs),
    .io_out(amoalu_io_out)
  );
  assign tlb_io_req_ready = tlb_state == 2'h0; // @[TLB.scala 421:25]
  assign tlb_io_resp_miss = tlb__io_resp_miss_T_1 | tlb_multipleHits; // @[TLB.scala 437:64]
  assign tlb_io_resp_paddr = {tlb__ppn_T_68,tlb__mpu_physaddr_T}; // @[Cat.scala 31:58]
  assign tlb_io_resp_pf_ld = tlb__io_resp_pf_ld_T | tlb__io_resp_pf_ld_T_2; // @[TLB.scala 422:41]
  assign tlb_io_resp_pf_st = tlb__io_resp_pf_st_T | tlb__io_resp_pf_st_T_2; // @[TLB.scala 423:48]
  assign tlb_io_resp_ae_ld = |tlb__io_resp_ae_ld_T; // @[TLB.scala 428:41]
  assign tlb_io_resp_ae_st = |tlb__io_resp_ae_st_T; // @[TLB.scala 429:41]
  assign tlb_io_resp_ma_ld = tlb_misaligned & tlb_cmd_read; // @[TLB.scala 431:31]
  assign tlb_io_resp_ma_st = tlb_misaligned & tlb_cmd_write; // @[TLB.scala 432:31]
  assign tlb_io_resp_cacheable = |tlb__io_resp_cacheable_T; // @[TLB.scala 434:41]
  assign tlb_io_ptw_req_valid = tlb_state == 2'h1; // @[TLB.scala 446:29]
  assign tlb_io_ptw_req_bits_bits_addr = tlb_r_refill_tag; // @[TLB.scala 448:29]
  assign tlb_io_ptw_req_bits_bits_need_gpa = tlb_r_need_gpa; // @[TLB.scala 451:33]
  assign tlb_mpu_ppn_barrier_io_x_ppn = tlb_special_entry_data_0[40:21]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_u = tlb_special_entry_data_0[20]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_ae_ptw = tlb_special_entry_data_0[18]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_ae_final = tlb_special_entry_data_0[17]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_pf = tlb_special_entry_data_0[16]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_gf = tlb_special_entry_data_0[15]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_sw = tlb_special_entry_data_0[14]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_sx = tlb_special_entry_data_0[13]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_sr = tlb_special_entry_data_0[12]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_pw = tlb_special_entry_data_0[8]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_px = tlb_special_entry_data_0[7]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_pr = tlb_special_entry_data_0[6]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_ppp = tlb_special_entry_data_0[5]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_pal = tlb_special_entry_data_0[4]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_paa = tlb_special_entry_data_0[3]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_eff = tlb_special_entry_data_0[2]; // @[TLB.scala 102:77]
  assign tlb_mpu_ppn_barrier_io_x_c = tlb_special_entry_data_0[1]; // @[TLB.scala 102:77]
  assign tlb_pmp_io_prv = tlb_mpu_priv[1:0]; // @[TLB.scala 238:14]
  assign tlb_pmp_io_pmp_0_cfg_l = tlb_io_ptw_pmp_0_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_0_cfg_a = tlb_io_ptw_pmp_0_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_0_cfg_x = tlb_io_ptw_pmp_0_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_0_cfg_w = tlb_io_ptw_pmp_0_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_0_cfg_r = tlb_io_ptw_pmp_0_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_0_addr = tlb_io_ptw_pmp_0_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_0_mask = tlb_io_ptw_pmp_0_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_1_cfg_l = tlb_io_ptw_pmp_1_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_1_cfg_a = tlb_io_ptw_pmp_1_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_1_cfg_x = tlb_io_ptw_pmp_1_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_1_cfg_w = tlb_io_ptw_pmp_1_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_1_cfg_r = tlb_io_ptw_pmp_1_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_1_addr = tlb_io_ptw_pmp_1_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_1_mask = tlb_io_ptw_pmp_1_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_2_cfg_l = tlb_io_ptw_pmp_2_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_2_cfg_a = tlb_io_ptw_pmp_2_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_2_cfg_x = tlb_io_ptw_pmp_2_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_2_cfg_w = tlb_io_ptw_pmp_2_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_2_cfg_r = tlb_io_ptw_pmp_2_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_2_addr = tlb_io_ptw_pmp_2_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_2_mask = tlb_io_ptw_pmp_2_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_3_cfg_l = tlb_io_ptw_pmp_3_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_3_cfg_a = tlb_io_ptw_pmp_3_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_3_cfg_x = tlb_io_ptw_pmp_3_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_3_cfg_w = tlb_io_ptw_pmp_3_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_3_cfg_r = tlb_io_ptw_pmp_3_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_3_addr = tlb_io_ptw_pmp_3_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_3_mask = tlb_io_ptw_pmp_3_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_4_cfg_l = tlb_io_ptw_pmp_4_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_4_cfg_a = tlb_io_ptw_pmp_4_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_4_cfg_x = tlb_io_ptw_pmp_4_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_4_cfg_w = tlb_io_ptw_pmp_4_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_4_cfg_r = tlb_io_ptw_pmp_4_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_4_addr = tlb_io_ptw_pmp_4_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_4_mask = tlb_io_ptw_pmp_4_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_5_cfg_l = tlb_io_ptw_pmp_5_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_5_cfg_a = tlb_io_ptw_pmp_5_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_5_cfg_x = tlb_io_ptw_pmp_5_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_5_cfg_w = tlb_io_ptw_pmp_5_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_5_cfg_r = tlb_io_ptw_pmp_5_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_5_addr = tlb_io_ptw_pmp_5_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_5_mask = tlb_io_ptw_pmp_5_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_6_cfg_l = tlb_io_ptw_pmp_6_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_6_cfg_a = tlb_io_ptw_pmp_6_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_6_cfg_x = tlb_io_ptw_pmp_6_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_6_cfg_w = tlb_io_ptw_pmp_6_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_6_cfg_r = tlb_io_ptw_pmp_6_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_6_addr = tlb_io_ptw_pmp_6_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_6_mask = tlb_io_ptw_pmp_6_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_7_cfg_l = tlb_io_ptw_pmp_7_cfg_l; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_7_cfg_a = tlb_io_ptw_pmp_7_cfg_a; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_7_cfg_x = tlb_io_ptw_pmp_7_cfg_x; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_7_cfg_w = tlb_io_ptw_pmp_7_cfg_w; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_7_cfg_r = tlb_io_ptw_pmp_7_cfg_r; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_7_addr = tlb_io_ptw_pmp_7_addr; // @[TLB.scala 237:14]
  assign tlb_pmp_io_pmp_7_mask = tlb_io_ptw_pmp_7_mask; // @[TLB.scala 237:14]
  assign tlb_pmp_io_addr = tlb_mpu_physaddr[31:0]; // @[TLB.scala 235:15]
  assign tlb_pmp_io_size = tlb_io_req_bits_size; // @[TLB.scala 236:15]
  assign tlb_entries_barrier_io_x_ppn = tlb__GEN_609[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_u = tlb__GEN_609[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_ae_ptw = tlb__GEN_609[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_ae_final = tlb__GEN_609[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_pf = tlb__GEN_609[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_gf = tlb__GEN_609[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_sw = tlb__GEN_609[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_sx = tlb__GEN_609[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_sr = tlb__GEN_609[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_pw = tlb__GEN_609[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_px = tlb__GEN_609[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_pr = tlb__GEN_609[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_ppp = tlb__GEN_609[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_pal = tlb__GEN_609[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_paa = tlb__GEN_609[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_eff = tlb__GEN_609[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_io_x_c = tlb__GEN_609[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_ppn = tlb__GEN_613[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_u = tlb__GEN_613[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_ae_ptw = tlb__GEN_613[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_ae_final = tlb__GEN_613[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_pf = tlb__GEN_613[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_gf = tlb__GEN_613[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_sw = tlb__GEN_613[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_sx = tlb__GEN_613[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_sr = tlb__GEN_613[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_pw = tlb__GEN_613[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_px = tlb__GEN_613[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_pr = tlb__GEN_613[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_ppp = tlb__GEN_613[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_pal = tlb__GEN_613[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_paa = tlb__GEN_613[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_eff = tlb__GEN_613[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_1_io_x_c = tlb__GEN_613[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_ppn = tlb__GEN_617[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_u = tlb__GEN_617[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_ae_ptw = tlb__GEN_617[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_ae_final = tlb__GEN_617[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_pf = tlb__GEN_617[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_gf = tlb__GEN_617[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_sw = tlb__GEN_617[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_sx = tlb__GEN_617[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_sr = tlb__GEN_617[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_pw = tlb__GEN_617[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_px = tlb__GEN_617[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_pr = tlb__GEN_617[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_ppp = tlb__GEN_617[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_pal = tlb__GEN_617[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_paa = tlb__GEN_617[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_eff = tlb__GEN_617[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_2_io_x_c = tlb__GEN_617[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_ppn = tlb__GEN_621[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_u = tlb__GEN_621[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_ae_ptw = tlb__GEN_621[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_ae_final = tlb__GEN_621[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_pf = tlb__GEN_621[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_gf = tlb__GEN_621[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_sw = tlb__GEN_621[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_sx = tlb__GEN_621[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_sr = tlb__GEN_621[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_pw = tlb__GEN_621[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_px = tlb__GEN_621[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_pr = tlb__GEN_621[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_ppp = tlb__GEN_621[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_pal = tlb__GEN_621[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_paa = tlb__GEN_621[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_eff = tlb__GEN_621[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_3_io_x_c = tlb__GEN_621[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_ppn = tlb__GEN_625[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_u = tlb__GEN_625[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_ae_ptw = tlb__GEN_625[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_ae_final = tlb__GEN_625[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_pf = tlb__GEN_625[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_gf = tlb__GEN_625[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_sw = tlb__GEN_625[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_sx = tlb__GEN_625[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_sr = tlb__GEN_625[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_pw = tlb__GEN_625[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_px = tlb__GEN_625[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_pr = tlb__GEN_625[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_ppp = tlb__GEN_625[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_pal = tlb__GEN_625[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_paa = tlb__GEN_625[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_eff = tlb__GEN_625[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_4_io_x_c = tlb__GEN_625[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_ppn = tlb__GEN_629[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_u = tlb__GEN_629[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_ae_ptw = tlb__GEN_629[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_ae_final = tlb__GEN_629[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_pf = tlb__GEN_629[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_gf = tlb__GEN_629[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_sw = tlb__GEN_629[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_sx = tlb__GEN_629[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_sr = tlb__GEN_629[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_pw = tlb__GEN_629[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_px = tlb__GEN_629[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_pr = tlb__GEN_629[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_ppp = tlb__GEN_629[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_pal = tlb__GEN_629[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_paa = tlb__GEN_629[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_eff = tlb__GEN_629[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_5_io_x_c = tlb__GEN_629[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_ppn = tlb__GEN_633[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_u = tlb__GEN_633[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_ae_ptw = tlb__GEN_633[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_ae_final = tlb__GEN_633[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_pf = tlb__GEN_633[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_gf = tlb__GEN_633[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_sw = tlb__GEN_633[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_sx = tlb__GEN_633[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_sr = tlb__GEN_633[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_pw = tlb__GEN_633[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_px = tlb__GEN_633[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_pr = tlb__GEN_633[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_ppp = tlb__GEN_633[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_pal = tlb__GEN_633[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_paa = tlb__GEN_633[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_eff = tlb__GEN_633[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_6_io_x_c = tlb__GEN_633[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_ppn = tlb__GEN_637[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_u = tlb__GEN_637[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_ae_ptw = tlb__GEN_637[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_ae_final = tlb__GEN_637[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_pf = tlb__GEN_637[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_gf = tlb__GEN_637[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_sw = tlb__GEN_637[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_sx = tlb__GEN_637[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_sr = tlb__GEN_637[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_pw = tlb__GEN_637[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_px = tlb__GEN_637[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_pr = tlb__GEN_637[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_ppp = tlb__GEN_637[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_pal = tlb__GEN_637[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_paa = tlb__GEN_637[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_eff = tlb__GEN_637[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_7_io_x_c = tlb__GEN_637[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_ppn = tlb_superpage_entries_0_data_0[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_u = tlb_superpage_entries_0_data_0[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_ae_ptw = tlb_superpage_entries_0_data_0[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_ae_final = tlb_superpage_entries_0_data_0[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_pf = tlb_superpage_entries_0_data_0[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_gf = tlb_superpage_entries_0_data_0[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_sw = tlb_superpage_entries_0_data_0[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_sx = tlb_superpage_entries_0_data_0[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_sr = tlb_superpage_entries_0_data_0[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_pw = tlb_superpage_entries_0_data_0[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_px = tlb_superpage_entries_0_data_0[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_pr = tlb_superpage_entries_0_data_0[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_ppp = tlb_superpage_entries_0_data_0[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_pal = tlb_superpage_entries_0_data_0[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_paa = tlb_superpage_entries_0_data_0[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_eff = tlb_superpage_entries_0_data_0[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_8_io_x_c = tlb_superpage_entries_0_data_0[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_ppn = tlb_superpage_entries_1_data_0[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_u = tlb_superpage_entries_1_data_0[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_ae_ptw = tlb_superpage_entries_1_data_0[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_ae_final = tlb_superpage_entries_1_data_0[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_pf = tlb_superpage_entries_1_data_0[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_gf = tlb_superpage_entries_1_data_0[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_sw = tlb_superpage_entries_1_data_0[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_sx = tlb_superpage_entries_1_data_0[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_sr = tlb_superpage_entries_1_data_0[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_pw = tlb_superpage_entries_1_data_0[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_px = tlb_superpage_entries_1_data_0[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_pr = tlb_superpage_entries_1_data_0[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_ppp = tlb_superpage_entries_1_data_0[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_pal = tlb_superpage_entries_1_data_0[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_paa = tlb_superpage_entries_1_data_0[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_eff = tlb_superpage_entries_1_data_0[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_9_io_x_c = tlb_superpage_entries_1_data_0[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_ppn = tlb_superpage_entries_2_data_0[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_u = tlb_superpage_entries_2_data_0[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_ae_ptw = tlb_superpage_entries_2_data_0[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_ae_final = tlb_superpage_entries_2_data_0[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_pf = tlb_superpage_entries_2_data_0[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_gf = tlb_superpage_entries_2_data_0[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_sw = tlb_superpage_entries_2_data_0[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_sx = tlb_superpage_entries_2_data_0[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_sr = tlb_superpage_entries_2_data_0[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_pw = tlb_superpage_entries_2_data_0[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_px = tlb_superpage_entries_2_data_0[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_pr = tlb_superpage_entries_2_data_0[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_ppp = tlb_superpage_entries_2_data_0[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_pal = tlb_superpage_entries_2_data_0[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_paa = tlb_superpage_entries_2_data_0[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_eff = tlb_superpage_entries_2_data_0[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_10_io_x_c = tlb_superpage_entries_2_data_0[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_ppn = tlb_superpage_entries_3_data_0[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_u = tlb_superpage_entries_3_data_0[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_ae_ptw = tlb_superpage_entries_3_data_0[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_ae_final = tlb_superpage_entries_3_data_0[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_pf = tlb_superpage_entries_3_data_0[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_gf = tlb_superpage_entries_3_data_0[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_sw = tlb_superpage_entries_3_data_0[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_sx = tlb_superpage_entries_3_data_0[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_sr = tlb_superpage_entries_3_data_0[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_pw = tlb_superpage_entries_3_data_0[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_px = tlb_superpage_entries_3_data_0[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_pr = tlb_superpage_entries_3_data_0[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_ppp = tlb_superpage_entries_3_data_0[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_pal = tlb_superpage_entries_3_data_0[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_paa = tlb_superpage_entries_3_data_0[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_eff = tlb_superpage_entries_3_data_0[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_11_io_x_c = tlb_superpage_entries_3_data_0[1]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_ppn = tlb_special_entry_data_0[40:21]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_u = tlb_special_entry_data_0[20]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_ae_ptw = tlb_special_entry_data_0[18]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_ae_final = tlb_special_entry_data_0[17]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_pf = tlb_special_entry_data_0[16]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_gf = tlb_special_entry_data_0[15]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_sw = tlb_special_entry_data_0[14]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_sx = tlb_special_entry_data_0[13]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_sr = tlb_special_entry_data_0[12]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_pw = tlb_special_entry_data_0[8]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_px = tlb_special_entry_data_0[7]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_pr = tlb_special_entry_data_0[6]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_ppp = tlb_special_entry_data_0[5]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_pal = tlb_special_entry_data_0[4]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_paa = tlb_special_entry_data_0[3]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_eff = tlb_special_entry_data_0[2]; // @[TLB.scala 102:77]
  assign tlb_entries_barrier_12_io_x_c = tlb_special_entry_data_0[1]; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_mpu_ppn_barrier_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_pmp_io_prv = 2'h1; // @[TLB.scala 238:14]
  assign pma_checker_pmp_io_pmp_0_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_0_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_0_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_0_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_0_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_0_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_0_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_1_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_1_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_1_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_1_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_1_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_1_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_1_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_2_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_2_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_2_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_2_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_2_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_2_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_2_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_3_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_3_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_3_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_3_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_3_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_3_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_3_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_4_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_4_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_4_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_4_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_4_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_4_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_4_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_5_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_5_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_5_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_5_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_5_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_5_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_5_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_6_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_6_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_6_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_6_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_6_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_6_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_6_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_7_cfg_l = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_7_cfg_a = 2'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_7_cfg_x = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_7_cfg_w = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_7_cfg_r = 1'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_7_addr = 30'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_pmp_7_mask = 32'h0; // @[TLB.scala 237:14]
  assign pma_checker_pmp_io_addr = 32'h0; // @[TLB.scala 235:15]
  assign pma_checker_pmp_io_size = pma_checker_io_req_bits_size; // @[TLB.scala 236:15]
  assign pma_checker_entries_barrier_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_1_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_2_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_3_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_4_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_5_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_6_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_7_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_8_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_9_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_10_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_11_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_ppn = 20'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_u = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_ae_ptw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_ae_final = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_pf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_gf = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_sw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_sx = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_sr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_pw = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_px = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_pr = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_ppp = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_pal = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_paa = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_eff = 1'h0; // @[TLB.scala 102:77]
  assign pma_checker_entries_barrier_12_io_x_c = 1'h0; // @[TLB.scala 102:77]
  assign metaArb_io_in_4_ready = ~metaArb__grant_T_2; // @[Arbiter.scala 46:78]
  assign metaArb_io_in_6_ready = ~metaArb__grant_T_3; // @[Arbiter.scala 46:78]
  assign metaArb_io_in_7_ready = ~metaArb__grant_T_5; // @[Arbiter.scala 46:78]
  assign metaArb_io_out_valid = metaArb__io_out_valid_T | metaArb_io_in_7_valid; // @[Arbiter.scala 150:31]
  assign metaArb_io_out_bits_write = metaArb_io_in_0_valid | metaArb__GEN_25; // @[Arbiter.scala 141:26 143:19]
  assign metaArb_io_out_bits_addr = metaArb_io_in_0_valid ? metaArb_io_in_0_bits_addr : metaArb__GEN_26; // @[Arbiter.scala 141:26 143:19]
  assign metaArb_io_out_bits_idx = metaArb_io_in_0_valid ? metaArb_io_in_0_bits_idx : metaArb__GEN_27; // @[Arbiter.scala 141:26 143:19]
  assign metaArb_io_out_bits_way_en = metaArb_io_in_0_valid ? 4'hf : metaArb__GEN_28; // @[Arbiter.scala 141:26 143:19]
  assign metaArb_io_out_bits_data = metaArb_io_in_0_valid ? 22'h0 : metaArb__GEN_29; // @[Arbiter.scala 141:26 143:19]
  assign dataArb_io_in_1_ready = ~dataArb_io_in_0_valid; // @[Arbiter.scala 46:78]
  assign dataArb_io_in_2_ready = ~dataArb__grant_T; // @[Arbiter.scala 46:78]
  assign dataArb_io_in_3_ready = ~dataArb__grant_T_1; // @[Arbiter.scala 46:78]
  assign dataArb_io_out_valid = dataArb__io_out_valid_T | dataArb_io_in_3_valid; // @[Arbiter.scala 150:31]
  assign dataArb_io_out_bits_addr = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_addr : dataArb__GEN_8; // @[Arbiter.scala 141:26 143:19]
  assign dataArb_io_out_bits_write = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_write : dataArb__GEN_9; // @[Arbiter.scala 141:26 143:19]
  assign dataArb_io_out_bits_wdata = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_wdata : dataArb__GEN_10; // @[Arbiter.scala 141:26 143:19]
  assign dataArb_io_out_bits_eccMask = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_eccMask : 8'hff; // @[Arbiter.scala 141:26 143:19]
  assign dataArb_io_out_bits_way_en = dataArb_io_in_0_valid ? dataArb_io_in_0_bits_way_en : dataArb__GEN_13; // @[Arbiter.scala 141:26 143:19]
  assign auto_out_a_valid = s2_valid_uncached_pending | _tl_out_a_valid_T_12; // @[DCache.scala 577:32]
  assign auto_out_a_bits_opcode = _s2_valid_cached_miss_T ? 3'h6 : _tl_out_a_bits_T_8_opcode; // @[DCache.scala 581:23]
  assign auto_out_a_bits_param = _s2_valid_cached_miss_T ? tl_out_a_bits_a_param : _tl_out_a_bits_T_8_param; // @[DCache.scala 581:23]
  assign auto_out_a_bits_size = _s2_valid_cached_miss_T ? 4'h6 : _tl_out_a_bits_T_8_size; // @[DCache.scala 581:23]
  assign auto_out_a_bits_source = _s2_valid_cached_miss_T ? 1'h0 : _tl_out_a_bits_T_8_source; // @[DCache.scala 581:23]
  assign auto_out_a_bits_address = _s2_valid_cached_miss_T ? tl_out_a_bits_a_address : _tl_out_a_bits_T_8_address; // @[DCache.scala 581:23]
  assign auto_out_a_bits_mask = _s2_valid_cached_miss_T ? 8'hff : _tl_out_a_bits_T_8_mask; // @[DCache.scala 581:23]
  assign auto_out_a_bits_data = _s2_valid_cached_miss_T ? 64'h0 : _tl_out_a_bits_T_8_data; // @[DCache.scala 581:23]
  assign auto_out_b_ready = metaArb_io_in_6_ready & ~(block_probe_for_core_progress | block_probe_for_ordering |
    s1_valid | s2_valid); // @[DCache.scala 743:44]
  assign auto_out_c_valid = release_state == 4'h3 | _GEN_329; // @[DCache.scala 827:48 828:22]
  assign auto_out_c_bits_opcode = _T_337 ? _GEN_350 : _GEN_342; // @[DCache.scala 836:102]
  assign auto_out_c_bits_param = _T_337 ? s2_shrink_param : _GEN_343; // @[DCache.scala 836:102]
  assign auto_out_c_bits_size = _T_337 ? 4'h6 : probe_bits_size; // @[DCache.scala 836:102]
  assign auto_out_c_bits_source = probe_bits_source; // @[Nodes.scala 1207:84 DCache.scala 857:26]
  assign auto_out_c_bits_address = probe_bits_address; // @[Nodes.scala 1207:84 DCache.scala 858:27]
  assign auto_out_c_bits_data = {s2_data_corrected_hi,s2_data_corrected_lo}; // @[Cat.scala 31:58]
  assign auto_out_d_ready = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? 1'h0 : _GEN_260; // @[DCache.scala 725:68 726:22]
  assign auto_out_e_valid = grantIsRefill & ~dataArb_io_in_1_ready ? 1'h0 : auto_out_d_valid & d_first & grantIsCached
     & canAcceptCachedGrant; // @[DCache.scala 687:18 695:51 696:20]
  assign auto_out_e_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign io_cpu_req_ready = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? _GEN_261 : _GEN_37; // @[DCache.scala 725:68]
  assign io_cpu_s2_nack = s2_valid_no_xcpt & ~s2_dont_nack_uncached & ~s2_dont_nack_misc & ~
    s2_valid_hit_pre_data_ecc_and_waw; // @[DCache.scala 418:86]
  assign io_cpu_resp_valid = s2_valid_hit_pre_data_ecc_and_waw | doUncachedResp; // @[DCache.scala 921:51]
  assign io_cpu_resp_bits_addr = doUncachedResp ? s2_uncached_resp_addr : s2_req_addr; // @[DCache.scala 890:20 923:25 926:27]
  assign io_cpu_resp_bits_tag = s2_req_tag; // @[DCache.scala 890:20]
  assign io_cpu_resp_bits_cmd = s2_req_cmd; // @[DCache.scala 890:20]
  assign io_cpu_resp_bits_size = s2_req_size; // @[DCache.scala 890:20]
  assign io_cpu_resp_bits_signed = s2_req_signed; // @[DCache.scala 890:20]
  assign io_cpu_resp_bits_dprv = s2_req_dprv; // @[DCache.scala 890:20]
  assign io_cpu_resp_bits_dv = 1'h0; // @[DCache.scala 890:20]
  assign io_cpu_resp_bits_data = _io_cpu_resp_bits_data_T_26 | _GEN_440; // @[DCache.scala 946:41]
  assign io_cpu_resp_bits_mask = 8'h0; // @[DCache.scala 890:20]
  assign io_cpu_resp_bits_replay = doUncachedResp; // @[DCache.scala 923:25 892:27 925:29]
  assign io_cpu_resp_bits_has_data = _s2_read_T_6 | _s2_write_T_21; // @[Consts.scala 85:68]
  assign io_cpu_resp_bits_data_word_bypass = {_io_cpu_resp_bits_data_T_7,io_cpu_resp_bits_data_shifted}; // @[Cat.scala 31:58]
  assign io_cpu_resp_bits_data_raw = {s2_data_corrected_hi,s2_data_corrected_lo}; // @[Cat.scala 31:58]
  assign io_cpu_resp_bits_store_data = pstore1_data; // @[DCache.scala 949:31]
  assign io_cpu_replay_next = _T_296 & grantIsUncachedData; // @[DCache.scala 922:41]
  assign io_cpu_s2_xcpt_ma_ld = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ma_ld; // @[DCache.scala 905:24]
  assign io_cpu_s2_xcpt_ma_st = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ma_st; // @[DCache.scala 905:24]
  assign io_cpu_s2_xcpt_pf_ld = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_pf_ld; // @[DCache.scala 905:24]
  assign io_cpu_s2_xcpt_pf_st = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_pf_st; // @[DCache.scala 905:24]
  assign io_cpu_s2_xcpt_gf_ld = 1'h0; // @[DCache.scala 905:24]
  assign io_cpu_s2_xcpt_gf_st = 1'h0; // @[DCache.scala 905:24]
  assign io_cpu_s2_xcpt_ae_ld = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ae_ld; // @[DCache.scala 905:24]
  assign io_cpu_s2_xcpt_ae_st = io_cpu_s2_xcpt_REG & s2_tlb_xcpt_ae_st; // @[DCache.scala 905:24]
  assign io_cpu_ordered = ~(s1_valid | s2_valid | cached_grant_wait | _s2_valid_cached_miss_T_2); // @[DCache.scala 902:21]
  assign io_cpu_perf_release = io_cpu_perf_release_last & _T_322; // @[Edges.scala 232:22]
  assign io_cpu_perf_grant = auto_out_d_valid & d_last; // @[DCache.scala 1050:39]
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; // @[DCache.scala 249:10]
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; // @[DCache.scala 249:10]
  assign io_ptw_req_bits_bits_need_gpa = tlb_io_ptw_req_bits_bits_need_gpa; // @[DCache.scala 249:10]
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_req_valid = s1_valid_masked & s1_cmd_uses_tlb; // @[DCache.scala 251:71]
  assign tlb_io_req_bits_vaddr = s1_tlb_req_vaddr; // @[DCache.scala 252:19]
  assign tlb_io_req_bits_passthrough = s1_tlb_req_passthrough; // @[DCache.scala 252:19]
  assign tlb_io_req_bits_size = s1_tlb_req_size; // @[DCache.scala 252:19]
  assign tlb_io_req_bits_cmd = s1_tlb_req_cmd; // @[DCache.scala 252:19]
  assign tlb_io_req_bits_prv = s1_tlb_req_prv; // @[DCache.scala 252:19]
  assign tlb_io_sfence_valid = s1_valid_masked & s1_sfence; // @[DCache.scala 256:54]
  assign tlb_io_sfence_bits_rs1 = s1_req_size[0]; // @[DCache.scala 257:40]
  assign tlb_io_sfence_bits_rs2 = s1_req_size[1]; // @[DCache.scala 258:40]
  assign tlb_io_sfence_bits_addr = s1_req_addr[38:0]; // @[DCache.scala 260:27]
  assign tlb_io_ptw_req_ready = io_ptw_req_ready; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_ae_ptw = io_ptw_resp_bits_ae_ptw; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_ae_final = io_ptw_resp_bits_ae_final; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pf = io_ptw_resp_bits_pf; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level; // @[DCache.scala 249:10]
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous; // @[DCache.scala 249:10]
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode; // @[DCache.scala 249:10]
  assign tlb_io_ptw_status_debug = io_ptw_status_debug; // @[DCache.scala 249:10]
  assign tlb_io_ptw_status_mxr = io_ptw_status_mxr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_status_sum = io_ptw_status_sum; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr; // @[DCache.scala 249:10]
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask; // @[DCache.scala 249:10]
  assign pma_checker_io_req_bits_size = s1_req_size; // @[DCache.scala 269:27]
  assign lfsr_prng_clock = clock;
  assign lfsr_prng_reset = reset;
  assign lfsr_prng_io_increment = _T_296 & _GEN_236; // @[DCache.scala 647:26 Replacement.scala 38:11]
  assign metaArb_io_in_0_valid = resetting; // @[DCache.scala 1018:26]
  assign metaArb_io_in_0_bits_addr = metaArb_io_in_5_bits_addr; // @[DCache.scala 1019:25]
  assign metaArb_io_in_0_bits_idx = metaArb_io_in_5_bits_idx; // @[DCache.scala 1019:25]
  assign metaArb_io_in_2_valid = s2_valid_hit_pre_data_ecc_and_waw & s2_update_meta; // @[DCache.scala 435:63]
  assign metaArb_io_in_2_bits_addr = {io_cpu_req_bits_addr[39:12],s2_vaddr[11:0]}; // @[Cat.scala 31:58]
  assign metaArb_io_in_2_bits_idx = s2_vaddr[11:6]; // @[DCache.scala 438:40]
  assign metaArb_io_in_2_bits_way_en = s2_hit_valid ? s2_hit_way : s2_victim_way; // @[DCache.scala 405:33]
  assign metaArb_io_in_2_bits_data = {s2_grow_param,metaArb_io_in_2_bits_data_meta_tag}; // @[DCache.scala 440:97]
  assign metaArb_io_in_3_valid = grantIsCached & d_done & ~auto_out_d_bits_denied; // @[DCache.scala 714:53]
  assign metaArb_io_in_3_bits_addr = {io_cpu_req_bits_addr[39:12],s2_vaddr[11:0]}; // @[Cat.scala 31:58]
  assign metaArb_io_in_3_bits_idx = s2_vaddr[11:6]; // @[DCache.scala 717:40]
  assign metaArb_io_in_3_bits_way_en = refill_way; // @[DCache.scala 716:32]
  assign metaArb_io_in_3_bits_data = {metaArb_io_in_3_bits_data_meta_state,metaArb_io_in_2_bits_data_meta_tag}; // @[DCache.scala 719:134]
  assign metaArb_io_in_4_valid = _T_334 | _metaArb_io_in_4_valid_T_1; // @[package.scala 72:59]
  assign metaArb_io_in_4_bits_addr = {io_cpu_req_bits_addr[39:12],probe_bits_address[11:0]}; // @[Cat.scala 31:58]
  assign metaArb_io_in_4_bits_idx = probe_bits_address[11:6]; // @[DCache.scala 1172:47]
  assign metaArb_io_in_4_bits_way_en = _T_337 ? s2_victim_or_hit_way : s2_probe_way; // @[DCache.scala 836:102 786:14 850:18]
  assign metaArb_io_in_4_bits_data = {newCoh_state,metaArb_io_in_4_bits_data_meta_tag}; // @[DCache.scala 886:97]
  assign metaArb_io_in_5_bits_addr = {io_cpu_req_bits_addr[39:12],_metaArb_io_in_5_bits_addr_T_1}; // @[Cat.scala 31:58]
  assign metaArb_io_in_5_bits_idx = flushCounter[5:0]; // @[DCache.scala 989:44]
  assign metaArb_io_in_6_valid = release_state == 4'h4 | auto_out_b_valid & (~block_probe_for_core_progress |
    lrscBackingOff); // @[DCache.scala 742:26 814:44 815:30]
  assign metaArb_io_in_6_bits_addr = release_state == 4'h4 ? _metaArb_io_in_6_bits_addr_T_3 :
    _metaArb_io_in_6_bits_addr_T_1; // @[DCache.scala 746:30 814:44 817:34]
  assign metaArb_io_in_6_bits_idx = release_state == 4'h4 ? probe_bits_address[11:6] : auto_out_b_bits_address[11:6]; // @[DCache.scala 745:29 814:44 816:33]
  assign metaArb_io_in_6_bits_way_en = metaArb_io_in_4_bits_way_en; // @[DCache.scala 747:32]
  assign metaArb_io_in_6_bits_data = metaArb_io_in_4_bits_data; // @[DCache.scala 748:30]
  assign metaArb_io_in_7_valid = io_cpu_req_valid; // @[DCache.scala 239:26]
  assign metaArb_io_in_7_bits_addr = io_cpu_req_bits_addr; // @[DCache.scala 242:30]
  assign metaArb_io_in_7_bits_idx = dataArb_io_in_3_bits_addr[11:6]; // @[DCache.scala 241:58]
  assign metaArb_io_in_7_bits_way_en = metaArb_io_in_4_bits_way_en; // @[DCache.scala 243:32]
  assign metaArb_io_in_7_bits_data = metaArb_io_in_4_bits_data; // @[DCache.scala 244:30]
  assign tag_array_RW0_clk = clock; // @[DCache.scala 283:50]
  assign tag_array_RW0_wdata_0 = metaArb_io_out_bits_data; // @[compatibility.scala 134:{12,12}]
  assign tag_array_RW0_wdata_1 = metaArb_io_out_bits_data; // @[compatibility.scala 134:{12,12}]
  assign tag_array_RW0_wdata_2 = metaArb_io_out_bits_data; // @[compatibility.scala 134:{12,12}]
  assign tag_array_RW0_wdata_3 = metaArb_io_out_bits_data; // @[compatibility.scala 134:{12,12}]
  assign tag_array_RW0_wmask_0 = metaArb_io_out_bits_way_en[0]; // @[DCache.scala 284:74]
  assign tag_array_RW0_wmask_1 = metaArb_io_out_bits_way_en[1]; // @[DCache.scala 284:74]
  assign tag_array_RW0_wmask_2 = metaArb_io_out_bits_way_en[2]; // @[DCache.scala 284:74]
  assign tag_array_RW0_wmask_3 = metaArb_io_out_bits_way_en[3]; // @[DCache.scala 284:74]
  assign data_clock = clock;
  assign data_io_req_valid = dataArb_io_out_valid; // @[DCache.scala 133:15]
  assign data_io_req_bits_addr = dataArb_io_out_bits_addr; // @[DCache.scala 133:15]
  assign data_io_req_bits_write = dataArb_io_out_bits_write; // @[DCache.scala 133:15]
  assign data_io_req_bits_wdata = dataArb_io_out_bits_wdata; // @[DCache.scala 133:15]
  assign data_io_req_bits_eccMask = dataArb_io_out_bits_eccMask; // @[DCache.scala 133:15]
  assign data_io_req_bits_way_en = dataArb_io_out_bits_way_en; // @[DCache.scala 133:15]
  assign dataArb_io_in_0_valid = pstore_drain_structural | _pstore_drain_T_10; // @[DCache.scala 490:48]
  assign dataArb_io_in_0_bits_addr = _dataArb_io_in_0_bits_addr_T[11:0]; // @[DCache.scala 522:30]
  assign dataArb_io_in_0_bits_write = pstore_drain_structural | _pstore_drain_T_10; // @[DCache.scala 490:48]
  assign dataArb_io_in_0_bits_wdata = {dataArb_io_in_0_bits_wdata_hi,dataArb_io_in_0_bits_wdata_lo}; // @[Cat.scala 31:58]
  assign dataArb_io_in_0_bits_eccMask = {dataArb_io_in_0_bits_eccMask_hi,dataArb_io_in_0_bits_eccMask_lo}; // @[Cat.scala 31:58]
  assign dataArb_io_in_0_bits_way_en = pstore2_valid ? pstore2_way : pstore1_way; // @[DCache.scala 523:38]
  assign dataArb_io_in_1_valid = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? _GEN_262 : auto_out_d_valid &
    grantIsRefill & canAcceptCachedGrant; // @[DCache.scala 694:26 725:68]
  assign dataArb_io_in_1_bits_addr = _dataArb_io_in_1_bits_addr_T_2[11:0]; // @[DCache.scala 701:32]
  assign dataArb_io_in_1_bits_write = grantIsUncachedData & (blockUncachedGrant | s1_valid) ? _GEN_263 : 1'h1; // @[DCache.scala 700:33 725:68]
  assign dataArb_io_in_1_bits_wdata = {tl_d_data_encoded_hi,tl_d_data_encoded_lo}; // @[Cat.scala 31:58]
  assign dataArb_io_in_1_bits_way_en = refill_way; // @[DCache.scala 702:34]
  assign dataArb_io_in_2_valid = inWriteback & releaseDataBeat < 10'h8; // @[DCache.scala 873:41]
  assign dataArb_io_in_2_bits_addr = _dataArb_io_in_2_bits_addr_T_1 | _GEN_439; // @[DCache.scala 876:72]
  assign dataArb_io_in_2_bits_wdata = dataArb_io_in_1_bits_wdata; // @[DCache.scala 874:25]
  assign dataArb_io_in_3_valid = io_cpu_req_valid & res; // @[DCache.scala 220:46]
  assign dataArb_io_in_3_bits_addr = _dataArb_io_in_3_bits_addr_T_2[11:0]; // @[DCache.scala 223:30]
  assign dataArb_io_in_3_bits_wdata = dataArb_io_in_1_bits_wdata; // @[DCache.scala 221:25]
  assign amoalu_io_mask = pstore1_mask; // @[DCache.scala 955:38]
  assign amoalu_io_cmd = pstore1_cmd; // @[DCache.scala 956:21]
  assign amoalu_io_lhs = {s2_data_corrected_hi,s2_data_corrected_lo}; // @[Cat.scala 31:58]
  assign amoalu_io_rhs = pstore1_data; // @[DCache.scala 958:37]
  assign tag_array_RW0_en = s0_clk_en | _T_19;
  assign tag_array_RW0_wmode = metaArb_io_out_bits_write;
  assign tag_array_RW0_addr = metaArb_io_out_bits_idx;
  always @(posedge tlb_clock) begin
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_7) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_0_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_7) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_0_data_0 <= tlb__GEN_61;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_7) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_0_data_1 <= tlb__GEN_62;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_7) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_0_data_2 <= tlb__GEN_63;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_7) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_0_data_3 <= tlb__GEN_64;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_0_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_174) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_0_valid_0 <= tlb__GEN_669;
        end else begin
          tlb_sectored_entries_0_0_valid_0 <= tlb__GEN_665;
        end
      end else begin
        tlb_sectored_entries_0_0_valid_0 <= tlb__GEN_685;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_0_valid_0 <= tlb__GEN_289;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_0_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_174) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_0_valid_1 <= tlb__GEN_670;
        end else begin
          tlb_sectored_entries_0_0_valid_1 <= tlb__GEN_666;
        end
      end else begin
        tlb_sectored_entries_0_0_valid_1 <= tlb__GEN_686;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_0_valid_1 <= tlb__GEN_290;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_0_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_174) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_0_valid_2 <= tlb__GEN_671;
        end else begin
          tlb_sectored_entries_0_0_valid_2 <= tlb__GEN_667;
        end
      end else begin
        tlb_sectored_entries_0_0_valid_2 <= tlb__GEN_687;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_0_valid_2 <= tlb__GEN_291;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_0_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_174) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_0_valid_3 <= tlb__GEN_672;
        end else begin
          tlb_sectored_entries_0_0_valid_3 <= tlb__GEN_668;
        end
      end else begin
        tlb_sectored_entries_0_0_valid_3 <= tlb__GEN_688;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_0_valid_3 <= tlb__GEN_292;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_9) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_1_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_9) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_1_data_0 <= tlb__GEN_88;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_9) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_1_data_1 <= tlb__GEN_89;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_9) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_1_data_2 <= tlb__GEN_90;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_9) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_1_data_3 <= tlb__GEN_91;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_1_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_579) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_1_valid_0 <= tlb__GEN_701;
        end else begin
          tlb_sectored_entries_0_1_valid_0 <= tlb__GEN_697;
        end
      end else begin
        tlb_sectored_entries_0_1_valid_0 <= tlb__GEN_717;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_1_valid_0 <= tlb__GEN_300;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_1_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_579) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_1_valid_1 <= tlb__GEN_702;
        end else begin
          tlb_sectored_entries_0_1_valid_1 <= tlb__GEN_698;
        end
      end else begin
        tlb_sectored_entries_0_1_valid_1 <= tlb__GEN_718;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_1_valid_1 <= tlb__GEN_301;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_1_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_579) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_1_valid_2 <= tlb__GEN_703;
        end else begin
          tlb_sectored_entries_0_1_valid_2 <= tlb__GEN_699;
        end
      end else begin
        tlb_sectored_entries_0_1_valid_2 <= tlb__GEN_719;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_1_valid_2 <= tlb__GEN_302;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_1_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_579) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_1_valid_3 <= tlb__GEN_704;
        end else begin
          tlb_sectored_entries_0_1_valid_3 <= tlb__GEN_700;
        end
      end else begin
        tlb_sectored_entries_0_1_valid_3 <= tlb__GEN_720;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_1_valid_3 <= tlb__GEN_303;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_11) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_2_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_11) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_2_data_0 <= tlb__GEN_115;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_11) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_2_data_1 <= tlb__GEN_116;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_11) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_2_data_2 <= tlb__GEN_117;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_11) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_2_data_3 <= tlb__GEN_118;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_2_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_984) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_2_valid_0 <= tlb__GEN_733;
        end else begin
          tlb_sectored_entries_0_2_valid_0 <= tlb__GEN_729;
        end
      end else begin
        tlb_sectored_entries_0_2_valid_0 <= tlb__GEN_749;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_2_valid_0 <= tlb__GEN_311;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_2_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_984) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_2_valid_1 <= tlb__GEN_734;
        end else begin
          tlb_sectored_entries_0_2_valid_1 <= tlb__GEN_730;
        end
      end else begin
        tlb_sectored_entries_0_2_valid_1 <= tlb__GEN_750;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_2_valid_1 <= tlb__GEN_312;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_2_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_984) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_2_valid_2 <= tlb__GEN_735;
        end else begin
          tlb_sectored_entries_0_2_valid_2 <= tlb__GEN_731;
        end
      end else begin
        tlb_sectored_entries_0_2_valid_2 <= tlb__GEN_751;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_2_valid_2 <= tlb__GEN_313;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_2_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_984) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_2_valid_3 <= tlb__GEN_736;
        end else begin
          tlb_sectored_entries_0_2_valid_3 <= tlb__GEN_732;
        end
      end else begin
        tlb_sectored_entries_0_2_valid_3 <= tlb__GEN_752;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_2_valid_3 <= tlb__GEN_314;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_13) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_3_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_13) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_3_data_0 <= tlb__GEN_142;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_13) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_3_data_1 <= tlb__GEN_143;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_13) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_3_data_2 <= tlb__GEN_144;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_13) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_3_data_3 <= tlb__GEN_145;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_3_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1389) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_3_valid_0 <= tlb__GEN_765;
        end else begin
          tlb_sectored_entries_0_3_valid_0 <= tlb__GEN_761;
        end
      end else begin
        tlb_sectored_entries_0_3_valid_0 <= tlb__GEN_781;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_3_valid_0 <= tlb__GEN_322;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_3_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1389) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_3_valid_1 <= tlb__GEN_766;
        end else begin
          tlb_sectored_entries_0_3_valid_1 <= tlb__GEN_762;
        end
      end else begin
        tlb_sectored_entries_0_3_valid_1 <= tlb__GEN_782;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_3_valid_1 <= tlb__GEN_323;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_3_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1389) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_3_valid_2 <= tlb__GEN_767;
        end else begin
          tlb_sectored_entries_0_3_valid_2 <= tlb__GEN_763;
        end
      end else begin
        tlb_sectored_entries_0_3_valid_2 <= tlb__GEN_783;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_3_valid_2 <= tlb__GEN_324;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_3_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1389) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_3_valid_3 <= tlb__GEN_768;
        end else begin
          tlb_sectored_entries_0_3_valid_3 <= tlb__GEN_764;
        end
      end else begin
        tlb_sectored_entries_0_3_valid_3 <= tlb__GEN_784;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_3_valid_3 <= tlb__GEN_325;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_15) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_4_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_15) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_4_data_0 <= tlb__GEN_169;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_15) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_4_data_1 <= tlb__GEN_170;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_15) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_4_data_2 <= tlb__GEN_171;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_15) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_4_data_3 <= tlb__GEN_172;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_4_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1794) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_4_valid_0 <= tlb__GEN_797;
        end else begin
          tlb_sectored_entries_0_4_valid_0 <= tlb__GEN_793;
        end
      end else begin
        tlb_sectored_entries_0_4_valid_0 <= tlb__GEN_813;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_4_valid_0 <= tlb__GEN_333;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_4_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1794) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_4_valid_1 <= tlb__GEN_798;
        end else begin
          tlb_sectored_entries_0_4_valid_1 <= tlb__GEN_794;
        end
      end else begin
        tlb_sectored_entries_0_4_valid_1 <= tlb__GEN_814;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_4_valid_1 <= tlb__GEN_334;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_4_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1794) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_4_valid_2 <= tlb__GEN_799;
        end else begin
          tlb_sectored_entries_0_4_valid_2 <= tlb__GEN_795;
        end
      end else begin
        tlb_sectored_entries_0_4_valid_2 <= tlb__GEN_815;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_4_valid_2 <= tlb__GEN_335;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_4_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_1794) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_4_valid_3 <= tlb__GEN_800;
        end else begin
          tlb_sectored_entries_0_4_valid_3 <= tlb__GEN_796;
        end
      end else begin
        tlb_sectored_entries_0_4_valid_3 <= tlb__GEN_816;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_4_valid_3 <= tlb__GEN_336;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_17) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_5_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_17) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_5_data_0 <= tlb__GEN_196;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_17) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_5_data_1 <= tlb__GEN_197;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_17) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_5_data_2 <= tlb__GEN_198;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_17) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_5_data_3 <= tlb__GEN_199;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_5_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2199) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_5_valid_0 <= tlb__GEN_829;
        end else begin
          tlb_sectored_entries_0_5_valid_0 <= tlb__GEN_825;
        end
      end else begin
        tlb_sectored_entries_0_5_valid_0 <= tlb__GEN_845;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_5_valid_0 <= tlb__GEN_344;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_5_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2199) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_5_valid_1 <= tlb__GEN_830;
        end else begin
          tlb_sectored_entries_0_5_valid_1 <= tlb__GEN_826;
        end
      end else begin
        tlb_sectored_entries_0_5_valid_1 <= tlb__GEN_846;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_5_valid_1 <= tlb__GEN_345;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_5_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2199) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_5_valid_2 <= tlb__GEN_831;
        end else begin
          tlb_sectored_entries_0_5_valid_2 <= tlb__GEN_827;
        end
      end else begin
        tlb_sectored_entries_0_5_valid_2 <= tlb__GEN_847;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_5_valid_2 <= tlb__GEN_346;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_5_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2199) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_5_valid_3 <= tlb__GEN_832;
        end else begin
          tlb_sectored_entries_0_5_valid_3 <= tlb__GEN_828;
        end
      end else begin
        tlb_sectored_entries_0_5_valid_3 <= tlb__GEN_848;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_5_valid_3 <= tlb__GEN_347;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_19) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_6_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_19) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_6_data_0 <= tlb__GEN_223;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_19) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_6_data_1 <= tlb__GEN_224;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_19) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_6_data_2 <= tlb__GEN_225;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_19) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_6_data_3 <= tlb__GEN_226;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_6_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2604) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_6_valid_0 <= tlb__GEN_861;
        end else begin
          tlb_sectored_entries_0_6_valid_0 <= tlb__GEN_857;
        end
      end else begin
        tlb_sectored_entries_0_6_valid_0 <= tlb__GEN_877;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_6_valid_0 <= tlb__GEN_355;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_6_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2604) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_6_valid_1 <= tlb__GEN_862;
        end else begin
          tlb_sectored_entries_0_6_valid_1 <= tlb__GEN_858;
        end
      end else begin
        tlb_sectored_entries_0_6_valid_1 <= tlb__GEN_878;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_6_valid_1 <= tlb__GEN_356;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_6_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2604) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_6_valid_2 <= tlb__GEN_863;
        end else begin
          tlb_sectored_entries_0_6_valid_2 <= tlb__GEN_859;
        end
      end else begin
        tlb_sectored_entries_0_6_valid_2 <= tlb__GEN_879;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_6_valid_2 <= tlb__GEN_357;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_6_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_2604) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_6_valid_3 <= tlb__GEN_864;
        end else begin
          tlb_sectored_entries_0_6_valid_3 <= tlb__GEN_860;
        end
      end else begin
        tlb_sectored_entries_0_6_valid_3 <= tlb__GEN_880;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_6_valid_3 <= tlb__GEN_358;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_21) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_7_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_21) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_7_data_0 <= tlb__GEN_250;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_21) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_7_data_1 <= tlb__GEN_251;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_21) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_7_data_2 <= tlb__GEN_252;
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (!(tlb__T_2)) begin // @[TLB.scala 289:54]
          if (tlb__T_21) begin // @[TLB.scala 298:82]
            tlb_sectored_entries_0_7_data_3 <= tlb__GEN_253;
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_7_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_3009) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_7_valid_0 <= tlb__GEN_893;
        end else begin
          tlb_sectored_entries_0_7_valid_0 <= tlb__GEN_889;
        end
      end else begin
        tlb_sectored_entries_0_7_valid_0 <= tlb__GEN_909;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_7_valid_0 <= tlb__GEN_366;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_7_valid_1 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_3009) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_7_valid_1 <= tlb__GEN_894;
        end else begin
          tlb_sectored_entries_0_7_valid_1 <= tlb__GEN_890;
        end
      end else begin
        tlb_sectored_entries_0_7_valid_1 <= tlb__GEN_910;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_7_valid_1 <= tlb__GEN_367;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_7_valid_2 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_3009) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_7_valid_2 <= tlb__GEN_895;
        end else begin
          tlb_sectored_entries_0_7_valid_2 <= tlb__GEN_891;
        end
      end else begin
        tlb_sectored_entries_0_7_valid_2 <= tlb__GEN_911;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_7_valid_2 <= tlb__GEN_368;
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_sectored_entries_0_7_valid_3 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__T_3009) begin // @[TLB.scala 160:72]
          tlb_sectored_entries_0_7_valid_3 <= tlb__GEN_896;
        end else begin
          tlb_sectored_entries_0_7_valid_3 <= tlb__GEN_892;
        end
      end else begin
        tlb_sectored_entries_0_7_valid_3 <= tlb__GEN_912;
      end
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        tlb_sectored_entries_0_7_valid_3 <= tlb__GEN_369;
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_3) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_0_level <= {{1'd0}, tlb__superpage_entries_0_level_T}; // @[TLB.scala 137:16]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_3) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_0_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_3) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_0_data_0 <= tlb__special_entry_data_0_T; // @[TLB.scala 141:15]
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_superpage_entries_0_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__superpage_hits_T_9) begin // @[TLB.scala 151:32]
          tlb_superpage_entries_0_valid_0 <= 1'h0; // @[TLB.scala 144:46]
        end else begin
          tlb_superpage_entries_0_valid_0 <= tlb__GEN_498;
        end
      end else begin
        tlb_superpage_entries_0_valid_0 <= tlb__GEN_920;
      end
    end else begin
      tlb_superpage_entries_0_valid_0 <= tlb__GEN_498;
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_4) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_1_level <= {{1'd0}, tlb__superpage_entries_0_level_T}; // @[TLB.scala 137:16]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_4) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_1_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_4) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_1_data_0 <= tlb__special_entry_data_0_T; // @[TLB.scala 141:15]
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_superpage_entries_1_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__superpage_hits_T_23) begin // @[TLB.scala 151:32]
          tlb_superpage_entries_1_valid_0 <= 1'h0; // @[TLB.scala 144:46]
        end else begin
          tlb_superpage_entries_1_valid_0 <= tlb__GEN_503;
        end
      end else begin
        tlb_superpage_entries_1_valid_0 <= tlb__GEN_925;
      end
    end else begin
      tlb_superpage_entries_1_valid_0 <= tlb__GEN_503;
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_5) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_2_level <= {{1'd0}, tlb__superpage_entries_0_level_T}; // @[TLB.scala 137:16]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_5) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_2_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_5) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_2_data_0 <= tlb__special_entry_data_0_T; // @[TLB.scala 141:15]
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_superpage_entries_2_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__superpage_hits_T_37) begin // @[TLB.scala 151:32]
          tlb_superpage_entries_2_valid_0 <= 1'h0; // @[TLB.scala 144:46]
        end else begin
          tlb_superpage_entries_2_valid_0 <= tlb__GEN_508;
        end
      end else begin
        tlb_superpage_entries_2_valid_0 <= tlb__GEN_930;
      end
    end else begin
      tlb_superpage_entries_2_valid_0 <= tlb__GEN_508;
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_6) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_3_level <= {{1'd0}, tlb__superpage_entries_0_level_T}; // @[TLB.scala 137:16]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_6) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_3_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
          end
        end
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (!(tlb__T)) begin // @[TLB.scala 287:68]
        if (tlb__T_2) begin // @[TLB.scala 289:54]
          if (tlb__T_6) begin // @[TLB.scala 291:89]
            tlb_superpage_entries_3_data_0 <= tlb__special_entry_data_0_T; // @[TLB.scala 141:15]
          end
        end
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_superpage_entries_3_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__superpage_hits_T_51) begin // @[TLB.scala 151:32]
          tlb_superpage_entries_3_valid_0 <= 1'h0; // @[TLB.scala 144:46]
        end else begin
          tlb_superpage_entries_3_valid_0 <= tlb__GEN_513;
        end
      end else begin
        tlb_superpage_entries_3_valid_0 <= tlb__GEN_935;
      end
    end else begin
      tlb_superpage_entries_3_valid_0 <= tlb__GEN_513;
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (tlb__T) begin // @[TLB.scala 287:68]
        tlb_special_entry_level <= tlb_io_ptw_resp_bits_level; // @[TLB.scala 137:16]
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (tlb__T) begin // @[TLB.scala 287:68]
        tlb_special_entry_tag_vpn <= tlb_r_refill_tag; // @[TLB.scala 135:18]
      end
    end
    if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 260:20]
      if (tlb__T) begin // @[TLB.scala 287:68]
        tlb_special_entry_data_0 <= tlb__special_entry_data_0_T; // @[TLB.scala 141:15]
      end
    end
    if (tlb__T_4495) begin // @[TLB.scala 499:34]
      tlb_special_entry_valid_0 <= 1'h0; // @[TLB.scala 144:46]
    end else if (tlb_io_sfence_valid) begin // @[TLB.scala 485:19]
      if (tlb_io_sfence_bits_rs1) begin // @[TLB.scala 490:42]
        if (tlb__hitsVec_T_122) begin // @[TLB.scala 151:32]
          tlb_special_entry_valid_0 <= 1'h0; // @[TLB.scala 144:46]
        end else begin
          tlb_special_entry_valid_0 <= tlb__GEN_493;
        end
      end else begin
        tlb_special_entry_valid_0 <= tlb__GEN_940;
      end
    end else begin
      tlb_special_entry_valid_0 <= tlb__GEN_493;
    end
    if (tlb_reset) begin // @[TLB.scala 198:18]
      tlb_state <= 2'h0; // @[TLB.scala 198:18]
    end else if (tlb_io_ptw_resp_valid) begin // @[TLB.scala 481:30]
      tlb_state <= 2'h0; // @[TLB.scala 482:13]
    end else if (tlb__T_53) begin // @[TLB.scala 478:39]
      tlb_state <= 2'h3; // @[TLB.scala 479:13]
    end else if (tlb__invalidate_refill_T) begin // @[TLB.scala 473:32]
      tlb_state <= tlb__GEN_656;
    end else begin
      tlb_state <= tlb__GEN_644;
    end
    if (tlb__T_50) begin // @[TLB.scala 460:38]
      tlb_r_refill_tag <= tlb_vpn; // @[TLB.scala 462:20]
    end
    if (tlb__T_50) begin // @[TLB.scala 460:38]
      if (tlb__r_superpage_repl_addr_T_4) begin // @[TLB.scala 518:8]
        tlb_r_superpage_repl_addr <= tlb__r_superpage_repl_addr_T_3;
      end else if (tlb__r_superpage_repl_addr_T_6) begin // @[Mux.scala 47:70]
        tlb_r_superpage_repl_addr <= 2'h0;
      end else if (tlb__r_superpage_repl_addr_T_7) begin // @[Mux.scala 47:70]
        tlb_r_superpage_repl_addr <= 2'h1;
      end else begin
        tlb_r_superpage_repl_addr <= tlb__r_superpage_repl_addr_T_10;
      end
    end
    if (tlb__T_50) begin // @[TLB.scala 460:38]
      if (tlb__r_sectored_repl_addr_T_10) begin // @[TLB.scala 518:8]
        tlb_r_sectored_repl_addr <= tlb__r_sectored_repl_addr_T_9;
      end else if (tlb__r_sectored_repl_addr_T_12) begin // @[Mux.scala 47:70]
        tlb_r_sectored_repl_addr <= 3'h0;
      end else if (tlb__r_sectored_repl_addr_T_13) begin // @[Mux.scala 47:70]
        tlb_r_sectored_repl_addr <= 3'h1;
      end else begin
        tlb_r_sectored_repl_addr <= tlb__r_sectored_repl_addr_T_24;
      end
    end
    if (tlb__T_50) begin // @[TLB.scala 460:38]
      tlb_r_sectored_hit_valid <= tlb__T_30; // @[TLB.scala 468:28]
    end
    if (tlb__T_50) begin // @[TLB.scala 460:38]
      tlb_r_sectored_hit_bits <= tlb__T_38; // @[TLB.scala 469:27]
    end
    if (tlb__T_50) begin // @[TLB.scala 460:38]
      tlb_r_need_gpa <= tlb_tlb_hit_if_not_gpa_miss; // @[TLB.scala 463:18]
    end
    if (tlb_reset) begin // @[Replacement.scala 305:17]
      tlb_state_vec_0 <= 7'h0; // @[Replacement.scala 305:17]
    end else if (tlb__T_23) begin // @[TLB.scala 409:37]
      if (tlb__T_30) begin // @[TLB.scala 410:28]
        tlb_state_vec_0 <= tlb__state_vec_0_T_22; // @[Replacement.scala 308:20]
      end
    end
    if (tlb_reset) begin // @[Replacement.scala 168:70]
      tlb_state_reg_1 <= 3'h0; // @[Replacement.scala 168:70]
    end else if (tlb__T_23) begin // @[TLB.scala 409:37]
      if (tlb__T_41) begin // @[TLB.scala 411:31]
        tlb_state_reg_1 <= tlb__state_reg_T_8; // @[Replacement.scala 172:15]
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (tlb__T_60 & (tlb_io_sfence_valid & tlb__T_59)) begin
          $fatal; // @[TLB.scala 486:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (tlb_io_sfence_valid & tlb__T_59 & tlb__T_60) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at TLB.scala:486 assert(!io.sfence.bits.rs1 || (io.sfence.bits.addr >> pgIdxBits) === vpn)\n"
            ); // @[TLB.scala 486:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock) begin
    if (reset) begin // @[DCache.scala 160:21]
      s1_valid <= 1'h0; // @[DCache.scala 160:21]
    end else begin
      s1_valid <= s1_valid_x12; // @[DCache.scala 160:21]
    end
    if (reset) begin // @[DCache.scala 641:38]
      blockProbeAfterGrantCount <= 3'h0; // @[DCache.scala 641:38]
    end else if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        if (d_last) begin // @[DCache.scala 651:20]
          blockProbeAfterGrantCount <= 3'h7; // @[DCache.scala 654:35]
        end else begin
          blockProbeAfterGrantCount <= _GEN_210;
        end
      end else begin
        blockProbeAfterGrantCount <= _GEN_210;
      end
    end else begin
      blockProbeAfterGrantCount <= _GEN_210;
    end
    if (reset) begin // @[DCache.scala 445:22]
      lrscCount <= 7'h0; // @[DCache.scala 445:22]
    end else if (s1_probe) begin // @[DCache.scala 457:19]
      lrscCount <= 7'h0; // @[DCache.scala 457:31]
    end else if (s2_valid_masked & lrscValid) begin // @[DCache.scala 456:43]
      lrscCount <= 7'h3; // @[DCache.scala 456:55]
    end else if (_lrscBackingOff_T) begin // @[DCache.scala 455:24]
      lrscCount <= _lrscCount_T_2; // @[DCache.scala 455:36]
    end else begin
      lrscCount <= _GEN_143;
    end
    if (reset) begin // @[DCache.scala 161:21]
      s1_probe <= 1'h0; // @[DCache.scala 161:21]
    end else if (release_state == 4'h4) begin // @[DCache.scala 814:44]
      s1_probe <= _GEN_322;
    end else begin
      s1_probe <= s1_probe_x16; // @[DCache.scala 161:21]
    end
    if (reset) begin // @[DCache.scala 306:21]
      s2_probe <= 1'h0; // @[DCache.scala 306:21]
    end else begin
      s2_probe <= s1_probe; // @[DCache.scala 306:21]
    end
    if (reset) begin // @[DCache.scala 206:26]
      release_state <= 4'h0; // @[DCache.scala 206:26]
    end else if (_T_341) begin // @[DCache.scala 887:34]
      release_state <= 4'h0; // @[DCache.scala 887:50]
    end else if (_T_337) begin // @[DCache.scala 836:102]
      if (releaseDone) begin // @[DCache.scala 851:26]
        release_state <= 4'h6; // @[DCache.scala 851:42]
      end else begin
        release_state <= _GEN_349;
      end
    end else begin
      release_state <= _GEN_349;
    end
    if (reset) begin // @[DCache.scala 204:29]
      release_ack_wait <= 1'h0; // @[DCache.scala 204:29]
    end else if (_T_337) begin // @[DCache.scala 836:102]
      release_ack_wait <= _GEN_358;
    end else if (_T_296) begin // @[DCache.scala 647:26]
      if (!(grantIsCached)) begin // @[DCache.scala 648:26]
        release_ack_wait <= _GEN_232;
      end
    end
    if (_T_337) begin // @[DCache.scala 836:102]
      if (_T_322 & c_first) begin // @[DCache.scala 852:41]
        release_ack_addr <= probe_bits_address; // @[DCache.scala 854:26]
      end
    end
    if (reset) begin // @[DCache.scala 640:28]
      grantInProgress <= 1'h0; // @[DCache.scala 640:28]
    end else if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        if (d_last) begin // @[DCache.scala 651:20]
          grantInProgress <= 1'h0; // @[DCache.scala 653:25]
        end else begin
          grantInProgress <= 1'h1; // @[DCache.scala 649:23]
        end
      end
    end
    if (reset) begin // @[DCache.scala 304:21]
      s2_valid <= 1'h0; // @[DCache.scala 304:21]
    end else begin
      s2_valid <= s2_valid_x44; // @[DCache.scala 304:21]
    end
    if (s2_want_victimize) begin // @[DCache.scala 789:25]
      probe_bits_param <= 2'h0; // @[DCache.scala 795:18]
    end else if (s1_probe_x16) begin // @[Reg.scala 17:18]
      probe_bits_param <= auto_out_b_bits_param; // @[Reg.scala 17:22]
    end
    if (s2_want_victimize) begin // @[DCache.scala 789:25]
      probe_bits_size <= 4'h0; // @[DCache.scala 795:18]
    end else if (s1_probe_x16) begin // @[Reg.scala 17:18]
      probe_bits_size <= auto_out_b_bits_size; // @[Reg.scala 17:22]
    end
    if (s2_want_victimize) begin // @[DCache.scala 789:25]
      probe_bits_source <= 1'h0; // @[DCache.scala 795:18]
    end else if (s1_probe_x16) begin // @[Reg.scala 17:18]
      probe_bits_source <= auto_out_b_bits_source; // @[Reg.scala 17:22]
    end
    if (s2_want_victimize) begin // @[DCache.scala 789:25]
      probe_bits_address <= res_2_address; // @[DCache.scala 795:18]
    end else if (s1_probe_x16) begin // @[Reg.scala 17:18]
      probe_bits_address <= auto_out_b_bits_address; // @[Reg.scala 17:22]
    end
    if (s1_probe) begin // @[Reg.scala 17:18]
      s2_probe_state_state <= s1_meta_hit_state_state; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter_1 <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T_322) begin // @[Edges.scala 234:17]
      if (c_first) begin // @[Edges.scala 235:21]
        if (beats1_opdata_1) begin // @[Edges.scala 220:14]
          counter_1 <= beats1_decode_1;
        end else begin
          counter_1 <= 9'h0;
        end
      end else begin
        counter_1 <= counter1_1;
      end
    end
    s2_release_data_valid <= s1_release_data_valid & ~releaseRejected; // @[DCache.scala 775:64]
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_req_cmd <= io_cpu_req_bits_cmd; // @[Reg.scala 17:22]
    end
    if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        s2_req_cmd <= _GEN_65;
      end else if (grantIsUncached) begin // @[DCache.scala 657:35]
        if (grantIsUncachedData) begin // @[DCache.scala 664:34]
          s2_req_cmd <= 5'h0; // @[DCache.scala 668:22]
        end else begin
          s2_req_cmd <= _GEN_65;
        end
      end else begin
        s2_req_cmd <= _GEN_65;
      end
    end else begin
      s2_req_cmd <= _GEN_65;
    end
    if (reset) begin // @[DCache.scala 477:29]
      pstore1_held <= 1'h0; // @[DCache.scala 477:29]
    end else begin
      pstore1_held <= pstore1_valid & pstore2_valid & ~pstore_drain; // @[DCache.scala 494:16]
    end
    if (_pstore1_cmd_T) begin // @[Reg.scala 17:18]
      pstore1_addr <= s1_vaddr; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_req_addr <= s0_req_addr; // @[Reg.scala 17:22]
    end
    if (_pstore1_cmd_T) begin // @[Reg.scala 17:18]
      if (_s1_write_T_1) begin // @[DCache.scala 300:20]
        pstore1_mask <= io_cpu_s1_data_mask;
      end else begin
        pstore1_mask <= s1_mask_xwr;
      end
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_req_size <= io_cpu_req_bits_size; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[DCache.scala 474:30]
      pstore2_valid <= 1'h0; // @[DCache.scala 474:30]
    end else begin
      pstore2_valid <= pstore2_valid & _pstore1_held_T_9 | advance_pstore1; // @[DCache.scala 496:17]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_addr <= pstore1_addr; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[DCache.scala 505:45]
      mask <= _pstore2_storegen_mask_mask_T_2; // @[DCache.scala 507:12]
    end
    s2_not_nacked_in_s1 <= ~s1_nack; // @[DCache.scala 308:37]
    if (s1_valid_not_nacked) begin // @[Reg.scala 17:18]
      s2_hit_state_state <= s1_meta_hit_state_state; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_req_tag <= io_cpu_req_bits_tag; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_req_signed <= io_cpu_req_bits_signed; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_req_dprv <= io_cpu_req_bits_dprv; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_tlb_req_vaddr <= s0_req_addr; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_tlb_req_passthrough <= s0_req_phys; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_tlb_req_size <= io_cpu_req_bits_size; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_tlb_req_cmd <= io_cpu_req_bits_cmd; // @[Reg.scala 17:22]
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_tlb_req_prv <= io_cpu_req_bits_dprv; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[DCache.scala 201:30]
      cached_grant_wait <= 1'h0; // @[DCache.scala 201:30]
    end else if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        if (d_last) begin // @[DCache.scala 651:20]
          cached_grant_wait <= 1'h0; // @[DCache.scala 652:27]
        end else begin
          cached_grant_wait <= _GEN_207;
        end
      end else begin
        cached_grant_wait <= _GEN_207;
      end
    end else begin
      cached_grant_wait <= _GEN_207;
    end
    if (reset) begin // @[DCache.scala 202:26]
      resetting <= 1'h0; // @[DCache.scala 202:26]
    end else if (resetting) begin // @[DCache.scala 1023:20]
      if (flushDone) begin // @[DCache.scala 1025:22]
        resetting <= 1'h0; // @[DCache.scala 1026:17]
      end else begin
        resetting <= _GEN_376;
      end
    end else begin
      resetting <= _GEN_376;
    end
    if (reset) begin // @[DCache.scala 203:25]
      flushCounter <= 8'hc0; // @[DCache.scala 203:25]
    end else begin
      flushCounter <= _GEN_378[7:0];
    end
    if (_T_288) begin // @[DCache.scala 604:26]
      if (!(s2_uncached)) begin // @[DCache.scala 605:24]
        if (s2_hit_valid) begin // @[DCache.scala 405:33]
          refill_way <= s2_hit_way;
        end else begin
          refill_way <= s2_victim_way;
        end
      end
    end
    if (reset) begin // @[DCache.scala 214:33]
      uncachedInFlight_0 <= 1'h0; // @[DCache.scala 214:33]
    end else if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        uncachedInFlight_0 <= _GEN_194;
      end else if (grantIsUncached) begin // @[DCache.scala 657:35]
        uncachedInFlight_0 <= _GEN_215;
      end else begin
        uncachedInFlight_0 <= _GEN_194;
      end
    end else begin
      uncachedInFlight_0 <= _GEN_194;
    end
    if (_T_288) begin // @[DCache.scala 604:26]
      if (s2_uncached) begin // @[DCache.scala 605:24]
        if (a_sel) begin // @[DCache.scala 607:18]
          uncachedReqs_0_addr <= s2_req_addr; // @[DCache.scala 609:13]
        end
      end
    end
    if (_T_288) begin // @[DCache.scala 604:26]
      if (s2_uncached) begin // @[DCache.scala 605:24]
        if (a_sel) begin // @[DCache.scala 607:18]
          uncachedReqs_0_tag <= s2_req_tag; // @[DCache.scala 609:13]
        end
      end
    end
    if (_T_288) begin // @[DCache.scala 604:26]
      if (s2_uncached) begin // @[DCache.scala 605:24]
        if (a_sel) begin // @[DCache.scala 607:18]
          uncachedReqs_0_size <= s2_req_size; // @[DCache.scala 609:13]
        end
      end
    end
    if (_T_288) begin // @[DCache.scala 604:26]
      if (s2_uncached) begin // @[DCache.scala 605:24]
        if (a_sel) begin // @[DCache.scala 607:18]
          uncachedReqs_0_signed <= s2_req_signed; // @[DCache.scala 609:13]
        end
      end
    end
    if (s0_clk_en) begin // @[Reg.scala 17:18]
      s1_did_read <= _s1_did_read_T_54; // @[Reg.scala 17:22]
    end
    if (s1_valid_not_nacked) begin // @[Reg.scala 17:18]
      s2_hit_way <= s1_meta_hit_way; // @[Reg.scala 17:22]
    end
    if (s1_valid_not_nacked) begin // @[Reg.scala 17:18]
      s2_victim_way_r <= s1_victim_way; // @[Reg.scala 17:22]
    end
    if (s1_probe) begin // @[Reg.scala 17:18]
      s2_probe_way <= s1_meta_hit_way; // @[Reg.scala 17:22]
    end
    if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        s2_req_addr <= _GEN_63;
      end else if (grantIsUncached) begin // @[DCache.scala 657:35]
        if (grantIsUncachedData) begin // @[DCache.scala 664:34]
          s2_req_addr <= {{8'd0}, _s2_req_addr_T_1}; // @[DCache.scala 672:23]
        end else begin
          s2_req_addr <= _GEN_63;
        end
      end else begin
        s2_req_addr <= _GEN_63;
      end
    end else begin
      s2_req_addr <= _GEN_63;
    end
    if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        s2_req_tag <= _GEN_64;
      end else if (grantIsUncached) begin // @[DCache.scala 657:35]
        if (grantIsUncachedData) begin // @[DCache.scala 664:34]
          s2_req_tag <= uncachedReqs_0_tag; // @[DCache.scala 671:22]
        end else begin
          s2_req_tag <= _GEN_64;
        end
      end else begin
        s2_req_tag <= _GEN_64;
      end
    end else begin
      s2_req_tag <= _GEN_64;
    end
    if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        s2_req_size <= _GEN_66;
      end else if (grantIsUncached) begin // @[DCache.scala 657:35]
        if (grantIsUncachedData) begin // @[DCache.scala 664:34]
          s2_req_size <= uncachedReqs_0_size; // @[DCache.scala 669:23]
        end else begin
          s2_req_size <= _GEN_66;
        end
      end else begin
        s2_req_size <= _GEN_66;
      end
    end else begin
      s2_req_size <= _GEN_66;
    end
    if (_T_296) begin // @[DCache.scala 647:26]
      if (grantIsCached) begin // @[DCache.scala 648:26]
        s2_req_signed <= _GEN_67;
      end else if (grantIsUncached) begin // @[DCache.scala 657:35]
        if (grantIsUncachedData) begin // @[DCache.scala 664:34]
          s2_req_signed <= uncachedReqs_0_signed; // @[DCache.scala 670:25]
        end else begin
          s2_req_signed <= _GEN_67;
        end
      end else begin
        s2_req_signed <= _GEN_67;
      end
    end else begin
      s2_req_signed <= _GEN_67;
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_req_dprv <= s1_req_dprv; // @[DCache.scala 319:12]
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_tlb_xcpt_pf_ld <= tlb_io_resp_pf_ld; // @[DCache.scala 321:17]
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_tlb_xcpt_pf_st <= tlb_io_resp_pf_st; // @[DCache.scala 321:17]
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_tlb_xcpt_ae_ld <= tlb_io_resp_ae_ld; // @[DCache.scala 321:17]
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_tlb_xcpt_ae_st <= tlb_io_resp_ae_st; // @[DCache.scala 321:17]
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_tlb_xcpt_ma_ld <= tlb_io_resp_ma_ld; // @[DCache.scala 321:17]
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_tlb_xcpt_ma_st <= tlb_io_resp_ma_st; // @[DCache.scala 321:17]
    end
    if (s1_valid_not_nacked) begin // @[DCache.scala 318:48]
      s2_pma_cacheable <= tlb_io_resp_cacheable; // @[DCache.scala 322:12]
    end
    if (_T_296) begin // @[DCache.scala 647:26]
      if (!(grantIsCached)) begin // @[DCache.scala 648:26]
        if (grantIsUncached) begin // @[DCache.scala 657:35]
          if (grantIsUncachedData) begin // @[DCache.scala 664:34]
            s2_uncached_resp_addr <= uncachedReqs_0_addr; // @[DCache.scala 677:33]
          end
        end
      end
    end
    if (s1_valid_not_nacked) begin // @[Reg.scala 17:18]
      s2_vaddr_r <= s1_vaddr; // @[Reg.scala 17:22]
    end
    if (s1_meta_clk_en) begin // @[Reg.scala 17:18]
      s2_meta_corrected_r <= tag_array_RW0_rdata_0; // @[Reg.scala 17:22]
    end
    if (s1_meta_clk_en) begin // @[Reg.scala 17:18]
      s2_meta_corrected_r_1 <= tag_array_RW0_rdata_1; // @[Reg.scala 17:22]
    end
    if (s1_meta_clk_en) begin // @[Reg.scala 17:18]
      s2_meta_corrected_r_2 <= tag_array_RW0_rdata_2; // @[Reg.scala 17:22]
    end
    if (s1_meta_clk_en) begin // @[Reg.scala 17:18]
      s2_meta_corrected_r_3 <= tag_array_RW0_rdata_3; // @[Reg.scala 17:22]
    end
    if (grantIsUncachedData & (blockUncachedGrant | s1_valid)) begin // @[DCache.scala 725:68]
      if (auto_out_d_valid) begin // @[DCache.scala 728:29]
        blockUncachedGrant <= _T_316; // @[DCache.scala 732:28]
      end else begin
        blockUncachedGrant <= dataArb_io_out_valid; // @[DCache.scala 724:24]
      end
    end else begin
      blockUncachedGrant <= dataArb_io_out_valid; // @[DCache.scala 724:24]
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T_296) begin // @[Edges.scala 234:17]
      if (d_first) begin // @[Edges.scala 235:21]
        if (beats1_opdata) begin // @[Edges.scala 220:14]
          counter <= beats1_decode;
        end else begin
          counter <= 9'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (en) begin // @[Reg.scala 17:18]
      s2_data <= _s2_data_T_15; // @[Reg.scala 17:22]
    end
    if (s2_valid_hit_pre_data_ecc_and_waw & _c_cat_T_48 & _io_cpu_req_ready_T_1 | s2_valid_cached_miss) begin // @[DCache.scala 451:99]
      lrscAddr <= s2_req_addr[39:6]; // @[DCache.scala 453:14]
    end
    if (_pstore1_cmd_T) begin // @[Reg.scala 17:18]
      pstore1_cmd <= s1_req_cmd; // @[Reg.scala 17:22]
    end
    if (_pstore1_cmd_T) begin // @[Reg.scala 17:18]
      pstore1_data <= io_cpu_s1_data_data; // @[Reg.scala 17:22]
    end
    if (_pstore1_cmd_T) begin // @[Reg.scala 17:18]
      pstore1_way <= s1_meta_hit_way; // @[Reg.scala 17:22]
    end
    if (_pstore1_cmd_T) begin // @[Reg.scala 17:18]
      pstore1_rmw_r <= _pstore1_rmw_T_52; // @[Reg.scala 17:22]
    end
    pstore_drain_on_miss_REG <= io_cpu_s2_nack; // @[DCache.scala 476:56]
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_way <= pstore1_way; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r <= pstore1_storegen_data[7:0]; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r_1 <= pstore1_storegen_data[15:8]; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r_2 <= pstore1_storegen_data[23:16]; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r_3 <= pstore1_storegen_data[31:24]; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r_4 <= pstore1_storegen_data[39:32]; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r_5 <= pstore1_storegen_data[47:40]; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r_6 <= pstore1_storegen_data[55:48]; // @[Reg.scala 17:22]
    end
    if (advance_pstore1) begin // @[Reg.scala 17:18]
      pstore2_storegen_data_r_7 <= pstore1_storegen_data[63:56]; // @[Reg.scala 17:22]
    end
    s1_release_data_valid <= dataArb_io_in_2_ready & dataArb_io_in_2_valid; // @[Decoupled.scala 50:35]
    io_cpu_s2_xcpt_REG <= tlb_io_req_valid & _s1_valid_not_nacked_T; // @[DCache.scala 904:65]
    doUncachedResp <= io_cpu_replay_next; // @[DCache.scala 920:27]
    REG <= reset; // @[compatibility.scala 290:56]
    if (reset) begin // @[Edges.scala 228:27]
      io_cpu_perf_release_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_T_322) begin // @[Edges.scala 234:17]
      if (io_cpu_perf_release_first) begin // @[Edges.scala 235:21]
        if (beats1_opdata_1) begin // @[Edges.scala 220:14]
          io_cpu_perf_release_counter <= beats1_decode_1;
        end else begin
          io_cpu_perf_release_counter <= 9'h0;
        end
      end else begin
        io_cpu_perf_release_counter <= io_cpu_perf_release_counter1;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_dataArb_io_in_3_valid_T_52 | res) & ~reset) begin
          $fatal; // @[DCache.scala 1158:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~_dataArb_io_in_3_valid_T_52 | res)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:1158 assert(!needsRead(req) || res)\n"); // @[DCache.scala 1158:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(s1_valid_masked & _s1_write_T_1) | &_T_68) & _dataArb_io_in_3_valid_T_56) begin
          $fatal; // @[DCache.scala 302:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_dataArb_io_in_3_valid_T_56 & ~(~(s1_valid_masked & _s1_write_T_1) | &_T_68)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:302 assert(!(s1_valid_masked && s1_req.cmd === M_PWR) || (s1_mask_xwr | ~io.cpu.s1_data.mask).andR)\n"
            ); // @[DCache.scala 302:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_dataArb_io_in_3_valid_T_52 | res) & ~reset) begin
          $fatal; // @[DCache.scala 1158:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~_dataArb_io_in_3_valid_T_52 | res)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:1158 assert(!needsRead(req) || res)\n"); // @[DCache.scala 1158:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(pstore1_rmw_r | _T_279 == pstore1_valid) & _dataArb_io_in_3_valid_T_56) begin
          $fatal; // @[DCache.scala 483:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_dataArb_io_in_3_valid_T_56 & ~(pstore1_rmw_r | _T_279 == pstore1_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:483 assert(pstore1_rmw || pstore1_valid_not_rmw(io.cpu.s2_kill) === pstore1_valid)\n"
            ); // @[DCache.scala 483:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_io_cpu_req_ready_T_1 & (_T_296 & grantIsCached & _dataArb_io_in_3_valid_T_56)) begin
          $fatal; // @[DCache.scala 650:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_296 & grantIsCached & _dataArb_io_in_3_valid_T_56 & _io_cpu_req_ready_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: A GrantData was unexpected by the dcache.\n    at DCache.scala:650 assert(cached_grant_wait, \"A GrantData was unexpected by the dcache.\")\n"
            ); // @[DCache.scala 650:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_a_source_T & (_T_296 & _T_357 & grantIsUncached & _T_301 & _dataArb_io_in_3_valid_T_56)) begin
          $fatal; // @[DCache.scala 660:17]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_296 & _T_357 & grantIsUncached & _T_301 & _dataArb_io_in_3_valid_T_56 & _a_source_T) begin
          $fwrite(32'h80000002,
            "Assertion failed: An AccessAck was unexpected by the dcache.\n    at DCache.scala:660 assert(f, \"An AccessAck was unexpected by the dcache.\") // TODO must handle Ack coming back on same cycle!\n"
            ); // @[DCache.scala 660:17]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_tl_out_a_valid_T_7 & (_GEN_453 & _tl_d_data_encoded_T_12 & grantIsVoluntary & _dataArb_io_in_3_valid_T_56)
          ) begin
          $fatal; // @[DCache.scala 681:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_453 & _tl_d_data_encoded_T_12 & grantIsVoluntary & _dataArb_io_in_3_valid_T_56 & _tl_out_a_valid_T_7
          ) begin
          $fwrite(32'h80000002,
            "Assertion failed: A ReleaseAck was unexpected by the dcache.\n    at DCache.scala:681 assert(release_ack_wait, \"A ReleaseAck was unexpected by the dcache.\") // TODO should handle Ack coming back on same cycle!\n"
            ); // @[DCache.scala 681:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_308 == (_T_296 & d_first & grantIsCached)) & _dataArb_io_in_3_valid_T_56) begin
          $fatal; // @[DCache.scala 689:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_dataArb_io_in_3_valid_T_56 & ~(_T_308 == (_T_296 & d_first & grantIsCached))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:689 assert(tl_out.e.fire() === (tl_out.d.fire() && d_first && grantIsCached))\n"
            ); // @[DCache.scala 689:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(s2_valid_flush_line | io_cpu_s2_nack) & (s2_want_victimize & _dataArb_io_in_3_valid_T_56)) begin
          $fatal; // @[DCache.scala 790:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (s2_want_victimize & _dataArb_io_in_3_valid_T_56 & ~(s2_valid_flush_line | io_cpu_s2_nack)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at DCache.scala:790 assert(s2_valid_flush_line || s2_flush_valid || io.cpu.s2_nack)\n"
            ); // @[DCache.scala 790:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_io_cpu_s2_nack_T_4 & (doUncachedResp & _dataArb_io_in_3_valid_T_56)) begin
          $fatal; // @[DCache.scala 924:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (doUncachedResp & _dataArb_io_in_3_valid_T_56 & ~_io_cpu_s2_nack_T_4) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:924 assert(!s2_valid_hit)\n"); // @[DCache.scala 924:11]
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
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  tlb_sectored_entries_0_0_tag_vpn = _RAND_0[26:0];
  _RAND_1 = {2{`RANDOM}};
  tlb_sectored_entries_0_0_data_0 = _RAND_1[40:0];
  _RAND_2 = {2{`RANDOM}};
  tlb_sectored_entries_0_0_data_1 = _RAND_2[40:0];
  _RAND_3 = {2{`RANDOM}};
  tlb_sectored_entries_0_0_data_2 = _RAND_3[40:0];
  _RAND_4 = {2{`RANDOM}};
  tlb_sectored_entries_0_0_data_3 = _RAND_4[40:0];
  _RAND_5 = {1{`RANDOM}};
  tlb_sectored_entries_0_0_valid_0 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  tlb_sectored_entries_0_0_valid_1 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  tlb_sectored_entries_0_0_valid_2 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  tlb_sectored_entries_0_0_valid_3 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  tlb_sectored_entries_0_1_tag_vpn = _RAND_9[26:0];
  _RAND_10 = {2{`RANDOM}};
  tlb_sectored_entries_0_1_data_0 = _RAND_10[40:0];
  _RAND_11 = {2{`RANDOM}};
  tlb_sectored_entries_0_1_data_1 = _RAND_11[40:0];
  _RAND_12 = {2{`RANDOM}};
  tlb_sectored_entries_0_1_data_2 = _RAND_12[40:0];
  _RAND_13 = {2{`RANDOM}};
  tlb_sectored_entries_0_1_data_3 = _RAND_13[40:0];
  _RAND_14 = {1{`RANDOM}};
  tlb_sectored_entries_0_1_valid_0 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  tlb_sectored_entries_0_1_valid_1 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  tlb_sectored_entries_0_1_valid_2 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  tlb_sectored_entries_0_1_valid_3 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  tlb_sectored_entries_0_2_tag_vpn = _RAND_18[26:0];
  _RAND_19 = {2{`RANDOM}};
  tlb_sectored_entries_0_2_data_0 = _RAND_19[40:0];
  _RAND_20 = {2{`RANDOM}};
  tlb_sectored_entries_0_2_data_1 = _RAND_20[40:0];
  _RAND_21 = {2{`RANDOM}};
  tlb_sectored_entries_0_2_data_2 = _RAND_21[40:0];
  _RAND_22 = {2{`RANDOM}};
  tlb_sectored_entries_0_2_data_3 = _RAND_22[40:0];
  _RAND_23 = {1{`RANDOM}};
  tlb_sectored_entries_0_2_valid_0 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  tlb_sectored_entries_0_2_valid_1 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  tlb_sectored_entries_0_2_valid_2 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  tlb_sectored_entries_0_2_valid_3 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  tlb_sectored_entries_0_3_tag_vpn = _RAND_27[26:0];
  _RAND_28 = {2{`RANDOM}};
  tlb_sectored_entries_0_3_data_0 = _RAND_28[40:0];
  _RAND_29 = {2{`RANDOM}};
  tlb_sectored_entries_0_3_data_1 = _RAND_29[40:0];
  _RAND_30 = {2{`RANDOM}};
  tlb_sectored_entries_0_3_data_2 = _RAND_30[40:0];
  _RAND_31 = {2{`RANDOM}};
  tlb_sectored_entries_0_3_data_3 = _RAND_31[40:0];
  _RAND_32 = {1{`RANDOM}};
  tlb_sectored_entries_0_3_valid_0 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  tlb_sectored_entries_0_3_valid_1 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  tlb_sectored_entries_0_3_valid_2 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  tlb_sectored_entries_0_3_valid_3 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  tlb_sectored_entries_0_4_tag_vpn = _RAND_36[26:0];
  _RAND_37 = {2{`RANDOM}};
  tlb_sectored_entries_0_4_data_0 = _RAND_37[40:0];
  _RAND_38 = {2{`RANDOM}};
  tlb_sectored_entries_0_4_data_1 = _RAND_38[40:0];
  _RAND_39 = {2{`RANDOM}};
  tlb_sectored_entries_0_4_data_2 = _RAND_39[40:0];
  _RAND_40 = {2{`RANDOM}};
  tlb_sectored_entries_0_4_data_3 = _RAND_40[40:0];
  _RAND_41 = {1{`RANDOM}};
  tlb_sectored_entries_0_4_valid_0 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  tlb_sectored_entries_0_4_valid_1 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  tlb_sectored_entries_0_4_valid_2 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  tlb_sectored_entries_0_4_valid_3 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  tlb_sectored_entries_0_5_tag_vpn = _RAND_45[26:0];
  _RAND_46 = {2{`RANDOM}};
  tlb_sectored_entries_0_5_data_0 = _RAND_46[40:0];
  _RAND_47 = {2{`RANDOM}};
  tlb_sectored_entries_0_5_data_1 = _RAND_47[40:0];
  _RAND_48 = {2{`RANDOM}};
  tlb_sectored_entries_0_5_data_2 = _RAND_48[40:0];
  _RAND_49 = {2{`RANDOM}};
  tlb_sectored_entries_0_5_data_3 = _RAND_49[40:0];
  _RAND_50 = {1{`RANDOM}};
  tlb_sectored_entries_0_5_valid_0 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  tlb_sectored_entries_0_5_valid_1 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  tlb_sectored_entries_0_5_valid_2 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  tlb_sectored_entries_0_5_valid_3 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  tlb_sectored_entries_0_6_tag_vpn = _RAND_54[26:0];
  _RAND_55 = {2{`RANDOM}};
  tlb_sectored_entries_0_6_data_0 = _RAND_55[40:0];
  _RAND_56 = {2{`RANDOM}};
  tlb_sectored_entries_0_6_data_1 = _RAND_56[40:0];
  _RAND_57 = {2{`RANDOM}};
  tlb_sectored_entries_0_6_data_2 = _RAND_57[40:0];
  _RAND_58 = {2{`RANDOM}};
  tlb_sectored_entries_0_6_data_3 = _RAND_58[40:0];
  _RAND_59 = {1{`RANDOM}};
  tlb_sectored_entries_0_6_valid_0 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  tlb_sectored_entries_0_6_valid_1 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  tlb_sectored_entries_0_6_valid_2 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  tlb_sectored_entries_0_6_valid_3 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  tlb_sectored_entries_0_7_tag_vpn = _RAND_63[26:0];
  _RAND_64 = {2{`RANDOM}};
  tlb_sectored_entries_0_7_data_0 = _RAND_64[40:0];
  _RAND_65 = {2{`RANDOM}};
  tlb_sectored_entries_0_7_data_1 = _RAND_65[40:0];
  _RAND_66 = {2{`RANDOM}};
  tlb_sectored_entries_0_7_data_2 = _RAND_66[40:0];
  _RAND_67 = {2{`RANDOM}};
  tlb_sectored_entries_0_7_data_3 = _RAND_67[40:0];
  _RAND_68 = {1{`RANDOM}};
  tlb_sectored_entries_0_7_valid_0 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  tlb_sectored_entries_0_7_valid_1 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  tlb_sectored_entries_0_7_valid_2 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  tlb_sectored_entries_0_7_valid_3 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  tlb_superpage_entries_0_level = _RAND_72[1:0];
  _RAND_73 = {1{`RANDOM}};
  tlb_superpage_entries_0_tag_vpn = _RAND_73[26:0];
  _RAND_74 = {2{`RANDOM}};
  tlb_superpage_entries_0_data_0 = _RAND_74[40:0];
  _RAND_75 = {1{`RANDOM}};
  tlb_superpage_entries_0_valid_0 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  tlb_superpage_entries_1_level = _RAND_76[1:0];
  _RAND_77 = {1{`RANDOM}};
  tlb_superpage_entries_1_tag_vpn = _RAND_77[26:0];
  _RAND_78 = {2{`RANDOM}};
  tlb_superpage_entries_1_data_0 = _RAND_78[40:0];
  _RAND_79 = {1{`RANDOM}};
  tlb_superpage_entries_1_valid_0 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  tlb_superpage_entries_2_level = _RAND_80[1:0];
  _RAND_81 = {1{`RANDOM}};
  tlb_superpage_entries_2_tag_vpn = _RAND_81[26:0];
  _RAND_82 = {2{`RANDOM}};
  tlb_superpage_entries_2_data_0 = _RAND_82[40:0];
  _RAND_83 = {1{`RANDOM}};
  tlb_superpage_entries_2_valid_0 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  tlb_superpage_entries_3_level = _RAND_84[1:0];
  _RAND_85 = {1{`RANDOM}};
  tlb_superpage_entries_3_tag_vpn = _RAND_85[26:0];
  _RAND_86 = {2{`RANDOM}};
  tlb_superpage_entries_3_data_0 = _RAND_86[40:0];
  _RAND_87 = {1{`RANDOM}};
  tlb_superpage_entries_3_valid_0 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  tlb_special_entry_level = _RAND_88[1:0];
  _RAND_89 = {1{`RANDOM}};
  tlb_special_entry_tag_vpn = _RAND_89[26:0];
  _RAND_90 = {2{`RANDOM}};
  tlb_special_entry_data_0 = _RAND_90[40:0];
  _RAND_91 = {1{`RANDOM}};
  tlb_special_entry_valid_0 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  tlb_state = _RAND_92[1:0];
  _RAND_93 = {1{`RANDOM}};
  tlb_r_refill_tag = _RAND_93[26:0];
  _RAND_94 = {1{`RANDOM}};
  tlb_r_superpage_repl_addr = _RAND_94[1:0];
  _RAND_95 = {1{`RANDOM}};
  tlb_r_sectored_repl_addr = _RAND_95[2:0];
  _RAND_96 = {1{`RANDOM}};
  tlb_r_sectored_hit_valid = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  tlb_r_sectored_hit_bits = _RAND_97[2:0];
  _RAND_98 = {1{`RANDOM}};
  tlb_r_need_gpa = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  tlb_state_vec_0 = _RAND_99[6:0];
  _RAND_100 = {1{`RANDOM}};
  tlb_state_reg_1 = _RAND_100[2:0];
  _RAND_101 = {1{`RANDOM}};
  s1_valid = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  blockProbeAfterGrantCount = _RAND_102[2:0];
  _RAND_103 = {1{`RANDOM}};
  lrscCount = _RAND_103[6:0];
  _RAND_104 = {1{`RANDOM}};
  s1_probe = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  s2_probe = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  release_state = _RAND_106[3:0];
  _RAND_107 = {1{`RANDOM}};
  release_ack_wait = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  release_ack_addr = _RAND_108[31:0];
  _RAND_109 = {1{`RANDOM}};
  grantInProgress = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  s2_valid = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  probe_bits_param = _RAND_111[1:0];
  _RAND_112 = {1{`RANDOM}};
  probe_bits_size = _RAND_112[3:0];
  _RAND_113 = {1{`RANDOM}};
  probe_bits_source = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  probe_bits_address = _RAND_114[31:0];
  _RAND_115 = {1{`RANDOM}};
  s2_probe_state_state = _RAND_115[1:0];
  _RAND_116 = {1{`RANDOM}};
  counter_1 = _RAND_116[8:0];
  _RAND_117 = {1{`RANDOM}};
  s2_release_data_valid = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  s1_req_cmd = _RAND_118[4:0];
  _RAND_119 = {1{`RANDOM}};
  s2_req_cmd = _RAND_119[4:0];
  _RAND_120 = {1{`RANDOM}};
  pstore1_held = _RAND_120[0:0];
  _RAND_121 = {2{`RANDOM}};
  pstore1_addr = _RAND_121[39:0];
  _RAND_122 = {2{`RANDOM}};
  s1_req_addr = _RAND_122[39:0];
  _RAND_123 = {1{`RANDOM}};
  pstore1_mask = _RAND_123[7:0];
  _RAND_124 = {1{`RANDOM}};
  s1_req_size = _RAND_124[1:0];
  _RAND_125 = {1{`RANDOM}};
  pstore2_valid = _RAND_125[0:0];
  _RAND_126 = {2{`RANDOM}};
  pstore2_addr = _RAND_126[39:0];
  _RAND_127 = {1{`RANDOM}};
  mask = _RAND_127[7:0];
  _RAND_128 = {1{`RANDOM}};
  s2_not_nacked_in_s1 = _RAND_128[0:0];
  _RAND_129 = {1{`RANDOM}};
  s2_hit_state_state = _RAND_129[1:0];
  _RAND_130 = {1{`RANDOM}};
  s1_req_tag = _RAND_130[6:0];
  _RAND_131 = {1{`RANDOM}};
  s1_req_signed = _RAND_131[0:0];
  _RAND_132 = {1{`RANDOM}};
  s1_req_dprv = _RAND_132[1:0];
  _RAND_133 = {2{`RANDOM}};
  s1_tlb_req_vaddr = _RAND_133[39:0];
  _RAND_134 = {1{`RANDOM}};
  s1_tlb_req_passthrough = _RAND_134[0:0];
  _RAND_135 = {1{`RANDOM}};
  s1_tlb_req_size = _RAND_135[1:0];
  _RAND_136 = {1{`RANDOM}};
  s1_tlb_req_cmd = _RAND_136[4:0];
  _RAND_137 = {1{`RANDOM}};
  s1_tlb_req_prv = _RAND_137[1:0];
  _RAND_138 = {1{`RANDOM}};
  cached_grant_wait = _RAND_138[0:0];
  _RAND_139 = {1{`RANDOM}};
  resetting = _RAND_139[0:0];
  _RAND_140 = {1{`RANDOM}};
  flushCounter = _RAND_140[7:0];
  _RAND_141 = {1{`RANDOM}};
  refill_way = _RAND_141[3:0];
  _RAND_142 = {1{`RANDOM}};
  uncachedInFlight_0 = _RAND_142[0:0];
  _RAND_143 = {2{`RANDOM}};
  uncachedReqs_0_addr = _RAND_143[39:0];
  _RAND_144 = {1{`RANDOM}};
  uncachedReqs_0_tag = _RAND_144[6:0];
  _RAND_145 = {1{`RANDOM}};
  uncachedReqs_0_size = _RAND_145[1:0];
  _RAND_146 = {1{`RANDOM}};
  uncachedReqs_0_signed = _RAND_146[0:0];
  _RAND_147 = {1{`RANDOM}};
  s1_did_read = _RAND_147[0:0];
  _RAND_148 = {1{`RANDOM}};
  s2_hit_way = _RAND_148[3:0];
  _RAND_149 = {1{`RANDOM}};
  s2_victim_way_r = _RAND_149[1:0];
  _RAND_150 = {1{`RANDOM}};
  s2_probe_way = _RAND_150[3:0];
  _RAND_151 = {2{`RANDOM}};
  s2_req_addr = _RAND_151[39:0];
  _RAND_152 = {1{`RANDOM}};
  s2_req_tag = _RAND_152[6:0];
  _RAND_153 = {1{`RANDOM}};
  s2_req_size = _RAND_153[1:0];
  _RAND_154 = {1{`RANDOM}};
  s2_req_signed = _RAND_154[0:0];
  _RAND_155 = {1{`RANDOM}};
  s2_req_dprv = _RAND_155[1:0];
  _RAND_156 = {1{`RANDOM}};
  s2_tlb_xcpt_pf_ld = _RAND_156[0:0];
  _RAND_157 = {1{`RANDOM}};
  s2_tlb_xcpt_pf_st = _RAND_157[0:0];
  _RAND_158 = {1{`RANDOM}};
  s2_tlb_xcpt_ae_ld = _RAND_158[0:0];
  _RAND_159 = {1{`RANDOM}};
  s2_tlb_xcpt_ae_st = _RAND_159[0:0];
  _RAND_160 = {1{`RANDOM}};
  s2_tlb_xcpt_ma_ld = _RAND_160[0:0];
  _RAND_161 = {1{`RANDOM}};
  s2_tlb_xcpt_ma_st = _RAND_161[0:0];
  _RAND_162 = {1{`RANDOM}};
  s2_pma_cacheable = _RAND_162[0:0];
  _RAND_163 = {2{`RANDOM}};
  s2_uncached_resp_addr = _RAND_163[39:0];
  _RAND_164 = {2{`RANDOM}};
  s2_vaddr_r = _RAND_164[39:0];
  _RAND_165 = {1{`RANDOM}};
  s2_meta_corrected_r = _RAND_165[21:0];
  _RAND_166 = {1{`RANDOM}};
  s2_meta_corrected_r_1 = _RAND_166[21:0];
  _RAND_167 = {1{`RANDOM}};
  s2_meta_corrected_r_2 = _RAND_167[21:0];
  _RAND_168 = {1{`RANDOM}};
  s2_meta_corrected_r_3 = _RAND_168[21:0];
  _RAND_169 = {1{`RANDOM}};
  blockUncachedGrant = _RAND_169[0:0];
  _RAND_170 = {1{`RANDOM}};
  counter = _RAND_170[8:0];
  _RAND_171 = {2{`RANDOM}};
  s2_data = _RAND_171[63:0];
  _RAND_172 = {2{`RANDOM}};
  lrscAddr = _RAND_172[33:0];
  _RAND_173 = {1{`RANDOM}};
  pstore1_cmd = _RAND_173[4:0];
  _RAND_174 = {2{`RANDOM}};
  pstore1_data = _RAND_174[63:0];
  _RAND_175 = {1{`RANDOM}};
  pstore1_way = _RAND_175[3:0];
  _RAND_176 = {1{`RANDOM}};
  pstore1_rmw_r = _RAND_176[0:0];
  _RAND_177 = {1{`RANDOM}};
  pstore_drain_on_miss_REG = _RAND_177[0:0];
  _RAND_178 = {1{`RANDOM}};
  pstore2_way = _RAND_178[3:0];
  _RAND_179 = {1{`RANDOM}};
  pstore2_storegen_data_r = _RAND_179[7:0];
  _RAND_180 = {1{`RANDOM}};
  pstore2_storegen_data_r_1 = _RAND_180[7:0];
  _RAND_181 = {1{`RANDOM}};
  pstore2_storegen_data_r_2 = _RAND_181[7:0];
  _RAND_182 = {1{`RANDOM}};
  pstore2_storegen_data_r_3 = _RAND_182[7:0];
  _RAND_183 = {1{`RANDOM}};
  pstore2_storegen_data_r_4 = _RAND_183[7:0];
  _RAND_184 = {1{`RANDOM}};
  pstore2_storegen_data_r_5 = _RAND_184[7:0];
  _RAND_185 = {1{`RANDOM}};
  pstore2_storegen_data_r_6 = _RAND_185[7:0];
  _RAND_186 = {1{`RANDOM}};
  pstore2_storegen_data_r_7 = _RAND_186[7:0];
  _RAND_187 = {1{`RANDOM}};
  s1_release_data_valid = _RAND_187[0:0];
  _RAND_188 = {1{`RANDOM}};
  io_cpu_s2_xcpt_REG = _RAND_188[0:0];
  _RAND_189 = {1{`RANDOM}};
  doUncachedResp = _RAND_189[0:0];
  _RAND_190 = {1{`RANDOM}};
  REG = _RAND_190[0:0];
  _RAND_191 = {1{`RANDOM}};
  io_cpu_perf_release_counter = _RAND_191[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
