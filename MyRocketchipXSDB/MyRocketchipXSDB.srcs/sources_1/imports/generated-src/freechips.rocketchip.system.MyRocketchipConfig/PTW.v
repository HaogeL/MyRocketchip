module PTW(
  input         clock,
  input         reset,
  output        io_requestor_0_req_ready,
  input         io_requestor_0_req_valid,
  input  [26:0] io_requestor_0_req_bits_bits_addr,
  input         io_requestor_0_req_bits_bits_need_gpa,
  output        io_requestor_0_resp_valid,
  output        io_requestor_0_resp_bits_ae_ptw,
  output        io_requestor_0_resp_bits_ae_final,
  output        io_requestor_0_resp_bits_pf,
  output [43:0] io_requestor_0_resp_bits_pte_ppn,
  output        io_requestor_0_resp_bits_pte_d,
  output        io_requestor_0_resp_bits_pte_a,
  output        io_requestor_0_resp_bits_pte_g,
  output        io_requestor_0_resp_bits_pte_u,
  output        io_requestor_0_resp_bits_pte_x,
  output        io_requestor_0_resp_bits_pte_w,
  output        io_requestor_0_resp_bits_pte_r,
  output        io_requestor_0_resp_bits_pte_v,
  output [1:0]  io_requestor_0_resp_bits_level,
  output        io_requestor_0_resp_bits_homogeneous,
  output [3:0]  io_requestor_0_ptbr_mode,
  output        io_requestor_0_status_debug,
  output        io_requestor_0_status_mxr,
  output        io_requestor_0_status_sum,
  output        io_requestor_0_pmp_0_cfg_l,
  output [1:0]  io_requestor_0_pmp_0_cfg_a,
  output        io_requestor_0_pmp_0_cfg_x,
  output        io_requestor_0_pmp_0_cfg_w,
  output        io_requestor_0_pmp_0_cfg_r,
  output [29:0] io_requestor_0_pmp_0_addr,
  output [31:0] io_requestor_0_pmp_0_mask,
  output        io_requestor_0_pmp_1_cfg_l,
  output [1:0]  io_requestor_0_pmp_1_cfg_a,
  output        io_requestor_0_pmp_1_cfg_x,
  output        io_requestor_0_pmp_1_cfg_w,
  output        io_requestor_0_pmp_1_cfg_r,
  output [29:0] io_requestor_0_pmp_1_addr,
  output [31:0] io_requestor_0_pmp_1_mask,
  output        io_requestor_0_pmp_2_cfg_l,
  output [1:0]  io_requestor_0_pmp_2_cfg_a,
  output        io_requestor_0_pmp_2_cfg_x,
  output        io_requestor_0_pmp_2_cfg_w,
  output        io_requestor_0_pmp_2_cfg_r,
  output [29:0] io_requestor_0_pmp_2_addr,
  output [31:0] io_requestor_0_pmp_2_mask,
  output        io_requestor_0_pmp_3_cfg_l,
  output [1:0]  io_requestor_0_pmp_3_cfg_a,
  output        io_requestor_0_pmp_3_cfg_x,
  output        io_requestor_0_pmp_3_cfg_w,
  output        io_requestor_0_pmp_3_cfg_r,
  output [29:0] io_requestor_0_pmp_3_addr,
  output [31:0] io_requestor_0_pmp_3_mask,
  output        io_requestor_0_pmp_4_cfg_l,
  output [1:0]  io_requestor_0_pmp_4_cfg_a,
  output        io_requestor_0_pmp_4_cfg_x,
  output        io_requestor_0_pmp_4_cfg_w,
  output        io_requestor_0_pmp_4_cfg_r,
  output [29:0] io_requestor_0_pmp_4_addr,
  output [31:0] io_requestor_0_pmp_4_mask,
  output        io_requestor_0_pmp_5_cfg_l,
  output [1:0]  io_requestor_0_pmp_5_cfg_a,
  output        io_requestor_0_pmp_5_cfg_x,
  output        io_requestor_0_pmp_5_cfg_w,
  output        io_requestor_0_pmp_5_cfg_r,
  output [29:0] io_requestor_0_pmp_5_addr,
  output [31:0] io_requestor_0_pmp_5_mask,
  output        io_requestor_0_pmp_6_cfg_l,
  output [1:0]  io_requestor_0_pmp_6_cfg_a,
  output        io_requestor_0_pmp_6_cfg_x,
  output        io_requestor_0_pmp_6_cfg_w,
  output        io_requestor_0_pmp_6_cfg_r,
  output [29:0] io_requestor_0_pmp_6_addr,
  output [31:0] io_requestor_0_pmp_6_mask,
  output        io_requestor_0_pmp_7_cfg_l,
  output [1:0]  io_requestor_0_pmp_7_cfg_a,
  output        io_requestor_0_pmp_7_cfg_x,
  output        io_requestor_0_pmp_7_cfg_w,
  output        io_requestor_0_pmp_7_cfg_r,
  output [29:0] io_requestor_0_pmp_7_addr,
  output [31:0] io_requestor_0_pmp_7_mask,
  output        io_requestor_1_req_ready,
  input         io_requestor_1_req_valid,
  input         io_requestor_1_req_bits_valid,
  input  [26:0] io_requestor_1_req_bits_bits_addr,
  input         io_requestor_1_req_bits_bits_need_gpa,
  output        io_requestor_1_resp_valid,
  output        io_requestor_1_resp_bits_ae_ptw,
  output        io_requestor_1_resp_bits_ae_final,
  output        io_requestor_1_resp_bits_pf,
  output [43:0] io_requestor_1_resp_bits_pte_ppn,
  output        io_requestor_1_resp_bits_pte_d,
  output        io_requestor_1_resp_bits_pte_a,
  output        io_requestor_1_resp_bits_pte_g,
  output        io_requestor_1_resp_bits_pte_u,
  output        io_requestor_1_resp_bits_pte_x,
  output        io_requestor_1_resp_bits_pte_w,
  output        io_requestor_1_resp_bits_pte_r,
  output        io_requestor_1_resp_bits_pte_v,
  output [1:0]  io_requestor_1_resp_bits_level,
  output        io_requestor_1_resp_bits_homogeneous,
  output [3:0]  io_requestor_1_ptbr_mode,
  output        io_requestor_1_status_debug,
  output [1:0]  io_requestor_1_status_prv,
  output        io_requestor_1_pmp_0_cfg_l,
  output [1:0]  io_requestor_1_pmp_0_cfg_a,
  output        io_requestor_1_pmp_0_cfg_x,
  output        io_requestor_1_pmp_0_cfg_w,
  output        io_requestor_1_pmp_0_cfg_r,
  output [29:0] io_requestor_1_pmp_0_addr,
  output [31:0] io_requestor_1_pmp_0_mask,
  output        io_requestor_1_pmp_1_cfg_l,
  output [1:0]  io_requestor_1_pmp_1_cfg_a,
  output        io_requestor_1_pmp_1_cfg_x,
  output        io_requestor_1_pmp_1_cfg_w,
  output        io_requestor_1_pmp_1_cfg_r,
  output [29:0] io_requestor_1_pmp_1_addr,
  output [31:0] io_requestor_1_pmp_1_mask,
  output        io_requestor_1_pmp_2_cfg_l,
  output [1:0]  io_requestor_1_pmp_2_cfg_a,
  output        io_requestor_1_pmp_2_cfg_x,
  output        io_requestor_1_pmp_2_cfg_w,
  output        io_requestor_1_pmp_2_cfg_r,
  output [29:0] io_requestor_1_pmp_2_addr,
  output [31:0] io_requestor_1_pmp_2_mask,
  output        io_requestor_1_pmp_3_cfg_l,
  output [1:0]  io_requestor_1_pmp_3_cfg_a,
  output        io_requestor_1_pmp_3_cfg_x,
  output        io_requestor_1_pmp_3_cfg_w,
  output        io_requestor_1_pmp_3_cfg_r,
  output [29:0] io_requestor_1_pmp_3_addr,
  output [31:0] io_requestor_1_pmp_3_mask,
  output        io_requestor_1_pmp_4_cfg_l,
  output [1:0]  io_requestor_1_pmp_4_cfg_a,
  output        io_requestor_1_pmp_4_cfg_x,
  output        io_requestor_1_pmp_4_cfg_w,
  output        io_requestor_1_pmp_4_cfg_r,
  output [29:0] io_requestor_1_pmp_4_addr,
  output [31:0] io_requestor_1_pmp_4_mask,
  output        io_requestor_1_pmp_5_cfg_l,
  output [1:0]  io_requestor_1_pmp_5_cfg_a,
  output        io_requestor_1_pmp_5_cfg_x,
  output        io_requestor_1_pmp_5_cfg_w,
  output        io_requestor_1_pmp_5_cfg_r,
  output [29:0] io_requestor_1_pmp_5_addr,
  output [31:0] io_requestor_1_pmp_5_mask,
  output        io_requestor_1_pmp_6_cfg_l,
  output [1:0]  io_requestor_1_pmp_6_cfg_a,
  output        io_requestor_1_pmp_6_cfg_x,
  output        io_requestor_1_pmp_6_cfg_w,
  output        io_requestor_1_pmp_6_cfg_r,
  output [29:0] io_requestor_1_pmp_6_addr,
  output [31:0] io_requestor_1_pmp_6_mask,
  output        io_requestor_1_pmp_7_cfg_l,
  output [1:0]  io_requestor_1_pmp_7_cfg_a,
  output        io_requestor_1_pmp_7_cfg_x,
  output        io_requestor_1_pmp_7_cfg_w,
  output        io_requestor_1_pmp_7_cfg_r,
  output [29:0] io_requestor_1_pmp_7_addr,
  output [31:0] io_requestor_1_pmp_7_mask,
  output [63:0] io_requestor_1_customCSRs_csrs_0_value,
  input         io_mem_req_ready,
  output        io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output        io_mem_s1_kill,
  input         io_mem_s2_nack,
  input         io_mem_resp_valid,
  input  [63:0] io_mem_resp_bits_data,
  input         io_mem_s2_xcpt_ae_ld,
  input  [3:0]  io_dpath_ptbr_mode,
  input  [43:0] io_dpath_ptbr_ppn,
  input         io_dpath_sfence_valid,
  input         io_dpath_sfence_bits_rs1,
  input         io_dpath_status_debug,
  input  [1:0]  io_dpath_status_prv,
  input         io_dpath_status_mxr,
  input         io_dpath_status_sum,
  input         io_dpath_pmp_0_cfg_l,
  input  [1:0]  io_dpath_pmp_0_cfg_a,
  input         io_dpath_pmp_0_cfg_x,
  input         io_dpath_pmp_0_cfg_w,
  input         io_dpath_pmp_0_cfg_r,
  input  [29:0] io_dpath_pmp_0_addr,
  input  [31:0] io_dpath_pmp_0_mask,
  input         io_dpath_pmp_1_cfg_l,
  input  [1:0]  io_dpath_pmp_1_cfg_a,
  input         io_dpath_pmp_1_cfg_x,
  input         io_dpath_pmp_1_cfg_w,
  input         io_dpath_pmp_1_cfg_r,
  input  [29:0] io_dpath_pmp_1_addr,
  input  [31:0] io_dpath_pmp_1_mask,
  input         io_dpath_pmp_2_cfg_l,
  input  [1:0]  io_dpath_pmp_2_cfg_a,
  input         io_dpath_pmp_2_cfg_x,
  input         io_dpath_pmp_2_cfg_w,
  input         io_dpath_pmp_2_cfg_r,
  input  [29:0] io_dpath_pmp_2_addr,
  input  [31:0] io_dpath_pmp_2_mask,
  input         io_dpath_pmp_3_cfg_l,
  input  [1:0]  io_dpath_pmp_3_cfg_a,
  input         io_dpath_pmp_3_cfg_x,
  input         io_dpath_pmp_3_cfg_w,
  input         io_dpath_pmp_3_cfg_r,
  input  [29:0] io_dpath_pmp_3_addr,
  input  [31:0] io_dpath_pmp_3_mask,
  input         io_dpath_pmp_4_cfg_l,
  input  [1:0]  io_dpath_pmp_4_cfg_a,
  input         io_dpath_pmp_4_cfg_x,
  input         io_dpath_pmp_4_cfg_w,
  input         io_dpath_pmp_4_cfg_r,
  input  [29:0] io_dpath_pmp_4_addr,
  input  [31:0] io_dpath_pmp_4_mask,
  input         io_dpath_pmp_5_cfg_l,
  input  [1:0]  io_dpath_pmp_5_cfg_a,
  input         io_dpath_pmp_5_cfg_x,
  input         io_dpath_pmp_5_cfg_w,
  input         io_dpath_pmp_5_cfg_r,
  input  [29:0] io_dpath_pmp_5_addr,
  input  [31:0] io_dpath_pmp_5_mask,
  input         io_dpath_pmp_6_cfg_l,
  input  [1:0]  io_dpath_pmp_6_cfg_a,
  input         io_dpath_pmp_6_cfg_x,
  input         io_dpath_pmp_6_cfg_w,
  input         io_dpath_pmp_6_cfg_r,
  input  [29:0] io_dpath_pmp_6_addr,
  input  [31:0] io_dpath_pmp_6_mask,
  input         io_dpath_pmp_7_cfg_l,
  input  [1:0]  io_dpath_pmp_7_cfg_a,
  input         io_dpath_pmp_7_cfg_x,
  input         io_dpath_pmp_7_cfg_w,
  input         io_dpath_pmp_7_cfg_r,
  input  [29:0] io_dpath_pmp_7_addr,
  input  [31:0] io_dpath_pmp_7_mask,
  output        io_dpath_perf_l2hit,
  output        io_dpath_perf_pte_miss,
  output        io_dpath_perf_pte_hit,
  input  [63:0] io_dpath_customCSRs_csrs_0_value
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
  reg [63:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [63:0] _RAND_22;
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
`endif // RANDOMIZE_REG_INIT
  wire  arb_io_in_0_ready; // @[PTW.scala 129:19]
  wire  arb_io_in_0_valid; // @[PTW.scala 129:19]
  wire [26:0] arb_io_in_0_bits_bits_addr; // @[PTW.scala 129:19]
  wire  arb_io_in_0_bits_bits_need_gpa; // @[PTW.scala 129:19]
  wire  arb_io_in_1_ready; // @[PTW.scala 129:19]
  wire  arb_io_in_1_valid; // @[PTW.scala 129:19]
  wire  arb_io_in_1_bits_valid; // @[PTW.scala 129:19]
  wire [26:0] arb_io_in_1_bits_bits_addr; // @[PTW.scala 129:19]
  wire  arb_io_in_1_bits_bits_need_gpa; // @[PTW.scala 129:19]
  wire  arb_io_out_ready; // @[PTW.scala 129:19]
  wire  arb_io_out_valid; // @[PTW.scala 129:19]
  wire  arb_io_out_bits_valid; // @[PTW.scala 129:19]
  wire [26:0] arb_io_out_bits_bits_addr; // @[PTW.scala 129:19]
  wire  arb_io_out_bits_bits_need_gpa; // @[PTW.scala 129:19]
  wire  arb_io_chosen; // @[PTW.scala 129:19]
  wire [2:0] state_barrier_io_x; // @[package.scala 258:25]
  wire [2:0] state_barrier_io_y; // @[package.scala 258:25]
  wire [43:0] r_pte_barrier_io_x_ppn; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_d; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_a; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_g; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_u; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_x; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_w; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_r; // @[package.scala 258:25]
  wire  r_pte_barrier_io_x_v; // @[package.scala 258:25]
  wire [43:0] r_pte_barrier_io_y_ppn; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_d; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_a; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_g; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_u; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_x; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_w; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_r; // @[package.scala 258:25]
  wire  r_pte_barrier_io_y_v; // @[package.scala 258:25]
  reg [2:0] state; // @[PTW.scala 126:18]
  reg  l2_refill; // @[PTW.scala 267:26]
  reg  resp_valid_0; // @[PTW.scala 133:23]
  reg  resp_valid_1; // @[PTW.scala 133:23]
  wire  _clock_en_T = state != 3'h0; // @[PTW.scala 135:24]
  reg  invalidated; // @[PTW.scala 142:24]
  reg [1:0] count; // @[PTW.scala 143:18]
  reg  resp_ae_ptw; // @[PTW.scala 144:24]
  reg  resp_ae_final; // @[PTW.scala 145:26]
  reg  resp_pf; // @[PTW.scala 146:20]
  reg [26:0] r_req_addr; // @[PTW.scala 153:18]
  reg  r_req_need_gpa; // @[PTW.scala 153:18]
  reg  r_req_dest; // @[PTW.scala 154:23]
  reg [43:0] r_pte_ppn; // @[PTW.scala 155:18]
  reg  r_pte_d; // @[PTW.scala 155:18]
  reg  r_pte_a; // @[PTW.scala 155:18]
  reg  r_pte_g; // @[PTW.scala 155:18]
  reg  r_pte_u; // @[PTW.scala 155:18]
  reg  r_pte_x; // @[PTW.scala 155:18]
  reg  r_pte_w; // @[PTW.scala 155:18]
  reg  r_pte_r; // @[PTW.scala 155:18]
  reg  r_pte_v; // @[PTW.scala 155:18]
  wire [43:0] vpn = {{17'd0}, r_req_addr}; // @[PTW.scala 168:16]
  reg  mem_resp_valid; // @[PTW.scala 170:31]
  reg [63:0] mem_resp_data; // @[PTW.scala 171:30]
  wire  tmp_v = mem_resp_data[0]; // @[PTW.scala 182:33]
  wire  tmp_r = mem_resp_data[1]; // @[PTW.scala 182:33]
  wire  tmp_w = mem_resp_data[2]; // @[PTW.scala 182:33]
  wire  tmp_x = mem_resp_data[3]; // @[PTW.scala 182:33]
  wire  tmp_u = mem_resp_data[4]; // @[PTW.scala 182:33]
  wire  tmp_g = mem_resp_data[5]; // @[PTW.scala 182:33]
  wire  tmp_a = mem_resp_data[6]; // @[PTW.scala 182:33]
  wire  tmp_d = mem_resp_data[7]; // @[PTW.scala 182:33]
  wire [43:0] tmp_ppn = mem_resp_data[53:10]; // @[PTW.scala 182:33]
  wire [9:0] tmp_reserved_for_future = mem_resp_data[63:54]; // @[PTW.scala 182:33]
  wire [26:0] _T_15 = {{7'd0}, tmp_ppn[19:0]}; // @[PTW.scala 184:19]
  wire  _GEN_0 = count <= 2'h0 & tmp_ppn[17:9] != 9'h0 ? 1'h0 : tmp_v; // @[PTW.scala 188:{102,110}]
  wire  _GEN_1 = count <= 2'h1 & tmp_ppn[8:0] != 9'h0 ? 1'h0 : _GEN_0; // @[PTW.scala 188:{102,110}]
  wire  res_v = tmp_r | tmp_w | tmp_x ? _GEN_1 : tmp_v; // @[PTW.scala 185:36]
  wire  invalid_paddr = tmp_ppn[43:20] != 24'h0; // @[PTW.scala 190:91]
  wire  _traverse_T_13 = res_v & ~tmp_r & ~tmp_w & ~tmp_x & ~tmp_d & ~tmp_a & ~tmp_u & tmp_reserved_for_future == 10'h0; // @[PTW.scala 91:69]
  wire  _traverse_T_16 = count < 2'h2; // @[PTW.scala 192:57]
  wire  traverse = _traverse_T_13 & ~invalid_paddr & count < 2'h2; // @[PTW.scala 192:48]
  wire [8:0] vpn_idxs_0 = vpn[26:18]; // @[PTW.scala 196:48]
  wire [8:0] vpn_idxs_1 = vpn[17:9]; // @[PTW.scala 196:48]
  wire [8:0] vpn_idxs_2 = vpn[8:0]; // @[PTW.scala 196:48]
  wire [8:0] _pte_addr_vpn_idx_T_1 = count == 2'h1 ? vpn_idxs_1 : vpn_idxs_0; // @[package.scala 32:76]
  wire  _pte_addr_vpn_idx_T_2 = count == 2'h2; // @[package.scala 32:86]
  wire [8:0] _pte_addr_vpn_idx_T_3 = count == 2'h2 ? vpn_idxs_2 : _pte_addr_vpn_idx_T_1; // @[package.scala 32:76]
  wire [8:0] vpn_idx = count == 2'h3 ? vpn_idxs_2 : _pte_addr_vpn_idx_T_3; // @[package.scala 32:76]
  wire [52:0] _pte_addr_raw_pte_addr_T = {r_pte_ppn, 9'h0}; // @[PTW.scala 200:36]
  wire [52:0] _GEN_251 = {{44'd0}, vpn_idx}; // @[PTW.scala 200:52]
  wire [52:0] _pte_addr_raw_pte_addr_T_1 = _pte_addr_raw_pte_addr_T | _GEN_251; // @[PTW.scala 200:52]
  wire [55:0] raw_pte_addr = {_pte_addr_raw_pte_addr_T_1, 3'h0}; // @[PTW.scala 200:63]
  wire [31:0] pte_addr = raw_pte_addr[31:0]; // @[PTW.scala 202:23]
  reg [6:0] state_reg; // @[Replacement.scala 168:70]
  reg [7:0] valid; // @[PTW.scala 225:24]
  reg [31:0] tags__0; // @[PTW.scala 226:19]
  reg [31:0] tags__1; // @[PTW.scala 226:19]
  reg [31:0] tags__2; // @[PTW.scala 226:19]
  reg [31:0] tags__3; // @[PTW.scala 226:19]
  reg [31:0] tags__4; // @[PTW.scala 226:19]
  reg [31:0] tags__5; // @[PTW.scala 226:19]
  reg [31:0] tags__6; // @[PTW.scala 226:19]
  reg [31:0] tags__7; // @[PTW.scala 226:19]
  reg [19:0] data__0; // @[PTW.scala 227:19]
  reg [19:0] data__1; // @[PTW.scala 227:19]
  reg [19:0] data__2; // @[PTW.scala 227:19]
  reg [19:0] data__3; // @[PTW.scala 227:19]
  reg [19:0] data__4; // @[PTW.scala 227:19]
  reg [19:0] data__5; // @[PTW.scala 227:19]
  reg [19:0] data__6; // @[PTW.scala 227:19]
  reg [19:0] data__7; // @[PTW.scala 227:19]
  wire [32:0] tag = {1'h0,pte_addr}; // @[Cat.scala 31:58]
  wire [32:0] _GEN_252 = {{1'd0}, tags__0}; // @[PTW.scala 238:27]
  wire  _hits_T = _GEN_252 == tag; // @[PTW.scala 238:27]
  wire [32:0] _GEN_253 = {{1'd0}, tags__1}; // @[PTW.scala 238:27]
  wire  _hits_T_1 = _GEN_253 == tag; // @[PTW.scala 238:27]
  wire [32:0] _GEN_254 = {{1'd0}, tags__2}; // @[PTW.scala 238:27]
  wire  _hits_T_2 = _GEN_254 == tag; // @[PTW.scala 238:27]
  wire [32:0] _GEN_255 = {{1'd0}, tags__3}; // @[PTW.scala 238:27]
  wire  _hits_T_3 = _GEN_255 == tag; // @[PTW.scala 238:27]
  wire [32:0] _GEN_256 = {{1'd0}, tags__4}; // @[PTW.scala 238:27]
  wire  _hits_T_4 = _GEN_256 == tag; // @[PTW.scala 238:27]
  wire [32:0] _GEN_257 = {{1'd0}, tags__5}; // @[PTW.scala 238:27]
  wire  _hits_T_5 = _GEN_257 == tag; // @[PTW.scala 238:27]
  wire [32:0] _GEN_258 = {{1'd0}, tags__6}; // @[PTW.scala 238:27]
  wire  _hits_T_6 = _GEN_258 == tag; // @[PTW.scala 238:27]
  wire [32:0] _GEN_259 = {{1'd0}, tags__7}; // @[PTW.scala 238:27]
  wire  _hits_T_7 = _GEN_259 == tag; // @[PTW.scala 238:27]
  wire [7:0] _hits_T_8 = {_hits_T_7,_hits_T_6,_hits_T_5,_hits_T_4,_hits_T_3,_hits_T_2,_hits_T_1,_hits_T}; // @[Cat.scala 31:58]
  wire [7:0] hits = _hits_T_8 & valid; // @[PTW.scala 238:43]
  wire  _hit_T = |hits; // @[PTW.scala 239:20]
  wire  pte_cache_hit = |hits & _traverse_T_16; // @[PTW.scala 239:24]
  wire  r_left_subtree_older = state_reg[6]; // @[Replacement.scala 243:38]
  wire [2:0] r_left_subtree_state = state_reg[5:3]; // @[package.scala 154:13]
  wire [2:0] r_right_subtree_state = state_reg[2:0]; // @[Replacement.scala 245:38]
  wire  r_left_subtree_older_1 = r_left_subtree_state[2]; // @[Replacement.scala 243:38]
  wire  r_left_subtree_state_1 = r_left_subtree_state[1]; // @[package.scala 154:13]
  wire  r_right_subtree_state_1 = r_left_subtree_state[0]; // @[Replacement.scala 245:38]
  wire  _r_T_3 = r_left_subtree_older_1 ? r_left_subtree_state_1 : r_right_subtree_state_1; // @[Replacement.scala 250:16]
  wire [1:0] _r_T_4 = {r_left_subtree_older_1,_r_T_3}; // @[Cat.scala 31:58]
  wire  r_left_subtree_older_2 = r_right_subtree_state[2]; // @[Replacement.scala 243:38]
  wire  r_left_subtree_state_2 = r_right_subtree_state[1]; // @[package.scala 154:13]
  wire  r_right_subtree_state_2 = r_right_subtree_state[0]; // @[Replacement.scala 245:38]
  wire  _r_T_7 = r_left_subtree_older_2 ? r_left_subtree_state_2 : r_right_subtree_state_2; // @[Replacement.scala 250:16]
  wire [1:0] _r_T_8 = {r_left_subtree_older_2,_r_T_7}; // @[Cat.scala 31:58]
  wire [1:0] _r_T_9 = r_left_subtree_older ? _r_T_4 : _r_T_8; // @[Replacement.scala 250:16]
  wire [2:0] _r_T_10 = {r_left_subtree_older,_r_T_9}; // @[Cat.scala 31:58]
  wire [7:0] _r_T_11 = ~valid; // @[PTW.scala 241:57]
  wire [2:0] _r_T_20 = _r_T_11[6] ? 3'h6 : 3'h7; // @[Mux.scala 47:70]
  wire [2:0] _r_T_21 = _r_T_11[5] ? 3'h5 : _r_T_20; // @[Mux.scala 47:70]
  wire [2:0] _r_T_22 = _r_T_11[4] ? 3'h4 : _r_T_21; // @[Mux.scala 47:70]
  wire [2:0] _r_T_23 = _r_T_11[3] ? 3'h3 : _r_T_22; // @[Mux.scala 47:70]
  wire [2:0] _r_T_24 = _r_T_11[2] ? 3'h2 : _r_T_23; // @[Mux.scala 47:70]
  wire [2:0] _r_T_25 = _r_T_11[1] ? 3'h1 : _r_T_24; // @[Mux.scala 47:70]
  wire [2:0] _r_T_26 = _r_T_11[0] ? 3'h0 : _r_T_25; // @[Mux.scala 47:70]
  wire [2:0] r = &valid ? _r_T_10 : _r_T_26; // @[PTW.scala 241:18]
  wire [7:0] _valid_T = 8'h1 << r; // @[OneHot.scala 57:35]
  wire [7:0] _valid_T_1 = valid | _valid_T; // @[PTW.scala 242:22]
  wire [43:0] res_ppn = {{17'd0}, _T_15};
  wire  state_reg_set_left_older = ~r[2]; // @[Replacement.scala 196:33]
  wire  state_reg_set_left_older_1 = ~r[1]; // @[Replacement.scala 196:33]
  wire  _state_reg_T_3 = ~r[0]; // @[Replacement.scala 218:7]
  wire  _state_reg_T_4 = state_reg_set_left_older_1 ? r_left_subtree_state_1 : _state_reg_T_3; // @[Replacement.scala 203:16]
  wire  _state_reg_T_8 = state_reg_set_left_older_1 ? _state_reg_T_3 : r_right_subtree_state_1; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_9 = {state_reg_set_left_older_1,_state_reg_T_4,_state_reg_T_8}; // @[Cat.scala 31:58]
  wire [2:0] _state_reg_T_10 = state_reg_set_left_older ? r_left_subtree_state : _state_reg_T_9; // @[Replacement.scala 203:16]
  wire  _state_reg_T_15 = state_reg_set_left_older_1 ? r_left_subtree_state_2 : _state_reg_T_3; // @[Replacement.scala 203:16]
  wire  _state_reg_T_19 = state_reg_set_left_older_1 ? _state_reg_T_3 : r_right_subtree_state_2; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_20 = {state_reg_set_left_older_1,_state_reg_T_15,_state_reg_T_19}; // @[Cat.scala 31:58]
  wire [2:0] _state_reg_T_21 = state_reg_set_left_older ? _state_reg_T_20 : r_right_subtree_state; // @[Replacement.scala 206:16]
  wire [6:0] _state_reg_T_22 = {state_reg_set_left_older,_state_reg_T_10,_state_reg_T_21}; // @[Cat.scala 31:58]
  wire  _T_39 = state == 3'h1; // @[PTW.scala 247:24]
  wire [3:0] hi = hits[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] lo = hits[3:0]; // @[OneHot.scala 31:18]
  wire  _T_41 = |hi; // @[OneHot.scala 32:14]
  wire [3:0] _T_42 = hi | lo; // @[OneHot.scala 32:28]
  wire [1:0] hi_1 = _T_42[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_1 = _T_42[1:0]; // @[OneHot.scala 31:18]
  wire  _T_43 = |hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _T_44 = hi_1 | lo_1; // @[OneHot.scala 32:28]
  wire [2:0] state_reg_touch_way_sized_1 = {_T_41,_T_43,_T_44[1]}; // @[Cat.scala 31:58]
  wire  state_reg_set_left_older_3 = ~state_reg_touch_way_sized_1[2]; // @[Replacement.scala 196:33]
  wire  state_reg_set_left_older_4 = ~state_reg_touch_way_sized_1[1]; // @[Replacement.scala 196:33]
  wire  _state_reg_T_26 = ~state_reg_touch_way_sized_1[0]; // @[Replacement.scala 218:7]
  wire  _state_reg_T_27 = state_reg_set_left_older_4 ? r_left_subtree_state_1 : _state_reg_T_26; // @[Replacement.scala 203:16]
  wire  _state_reg_T_31 = state_reg_set_left_older_4 ? _state_reg_T_26 : r_right_subtree_state_1; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_32 = {state_reg_set_left_older_4,_state_reg_T_27,_state_reg_T_31}; // @[Cat.scala 31:58]
  wire [2:0] _state_reg_T_33 = state_reg_set_left_older_3 ? r_left_subtree_state : _state_reg_T_32; // @[Replacement.scala 203:16]
  wire  _state_reg_T_38 = state_reg_set_left_older_4 ? r_left_subtree_state_2 : _state_reg_T_26; // @[Replacement.scala 203:16]
  wire  _state_reg_T_42 = state_reg_set_left_older_4 ? _state_reg_T_26 : r_right_subtree_state_2; // @[Replacement.scala 206:16]
  wire [2:0] _state_reg_T_43 = {state_reg_set_left_older_4,_state_reg_T_38,_state_reg_T_42}; // @[Cat.scala 31:58]
  wire [2:0] _state_reg_T_44 = state_reg_set_left_older_3 ? _state_reg_T_43 : r_right_subtree_state; // @[Replacement.scala 206:16]
  wire [6:0] _state_reg_T_45 = {state_reg_set_left_older_3,_state_reg_T_33,_state_reg_T_44}; // @[Cat.scala 31:58]
  wire [19:0] _T_68 = hits[0] ? data__0 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_69 = hits[1] ? data__1 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_70 = hits[2] ? data__2 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_71 = hits[3] ? data__3 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_72 = hits[4] ? data__4 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_73 = hits[5] ? data__5 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_74 = hits[6] ? data__6 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_75 = hits[7] ? data__7 : 20'h0; // @[Mux.scala 27:73]
  wire [19:0] _T_76 = _T_68 | _T_69; // @[Mux.scala 27:73]
  wire [19:0] _T_77 = _T_76 | _T_70; // @[Mux.scala 27:73]
  wire [19:0] _T_78 = _T_77 | _T_71; // @[Mux.scala 27:73]
  wire [19:0] _T_79 = _T_78 | _T_72; // @[Mux.scala 27:73]
  wire [19:0] _T_80 = _T_79 | _T_73; // @[Mux.scala 27:73]
  wire [19:0] _T_81 = _T_80 | _T_74; // @[Mux.scala 27:73]
  wire [19:0] pte_cache_data = _T_81 | _T_75; // @[Mux.scala 27:73]
  reg  pte_hit; // @[PTW.scala 261:24]
  wire  _T_138 = ~reset; // @[PTW.scala 264:9]
  wire [55:0] _pmaPgLevelHomogeneous_T = {r_pte_ppn, 12'h0}; // @[PTW.scala 381:88]
  wire [55:0] _pmaPgLevelHomogeneous_T_1 = _pmaPgLevelHomogeneous_T ^ 56'h80000000; // @[Parameters.scala 137:31]
  wire [56:0] _pmaPgLevelHomogeneous_T_2 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_1)}; // @[Parameters.scala 137:49]
  wire [56:0] _pmaPgLevelHomogeneous_T_4 = $signed(_pmaPgLevelHomogeneous_T_2) & -57'sh40000000; // @[Parameters.scala 137:52]
  wire  pmaPgLevelHomogeneous_0 = $signed(_pmaPgLevelHomogeneous_T_4) == 57'sh0; // @[Parameters.scala 137:67]
  wire [55:0] _pmaPgLevelHomogeneous_T_11 = _pmaPgLevelHomogeneous_T ^ 56'hc000000; // @[Parameters.scala 137:31]
  wire [56:0] _pmaPgLevelHomogeneous_T_12 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_11)}; // @[Parameters.scala 137:49]
  wire [56:0] _pmaPgLevelHomogeneous_T_14 = $signed(_pmaPgLevelHomogeneous_T_12) & -57'sh4000000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_15 = $signed(_pmaPgLevelHomogeneous_T_14) == 57'sh0; // @[Parameters.scala 137:67]
  wire [55:0] _pmaPgLevelHomogeneous_T_16 = _pmaPgLevelHomogeneous_T ^ 56'h60000000; // @[Parameters.scala 137:31]
  wire [56:0] _pmaPgLevelHomogeneous_T_17 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_16)}; // @[Parameters.scala 137:49]
  wire [56:0] _pmaPgLevelHomogeneous_T_19 = $signed(_pmaPgLevelHomogeneous_T_17) & -57'sh20000000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_20 = $signed(_pmaPgLevelHomogeneous_T_19) == 57'sh0; // @[Parameters.scala 137:67]
  wire  pmaPgLevelHomogeneous_1 = _pmaPgLevelHomogeneous_T_15 | _pmaPgLevelHomogeneous_T_20 | pmaPgLevelHomogeneous_0; // @[TLBPermissions.scala 99:65]
  wire [56:0] _pmaPgLevelHomogeneous_T_31 = {1'b0,$signed(_pmaPgLevelHomogeneous_T)}; // @[Parameters.scala 137:49]
  wire [56:0] _pmaPgLevelHomogeneous_T_59 = $signed(_pmaPgLevelHomogeneous_T_31) & -57'sh1000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_60 = $signed(_pmaPgLevelHomogeneous_T_59) == 57'sh0; // @[Parameters.scala 137:67]
  wire [55:0] _pmaPgLevelHomogeneous_T_61 = _pmaPgLevelHomogeneous_T ^ 56'h3000; // @[Parameters.scala 137:31]
  wire [56:0] _pmaPgLevelHomogeneous_T_62 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_61)}; // @[Parameters.scala 137:49]
  wire [56:0] _pmaPgLevelHomogeneous_T_64 = $signed(_pmaPgLevelHomogeneous_T_62) & -57'sh1000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_65 = $signed(_pmaPgLevelHomogeneous_T_64) == 57'sh0; // @[Parameters.scala 137:67]
  wire [55:0] _pmaPgLevelHomogeneous_T_66 = _pmaPgLevelHomogeneous_T ^ 56'h10000; // @[Parameters.scala 137:31]
  wire [56:0] _pmaPgLevelHomogeneous_T_67 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_66)}; // @[Parameters.scala 137:49]
  wire [56:0] _pmaPgLevelHomogeneous_T_69 = $signed(_pmaPgLevelHomogeneous_T_67) & -57'sh10000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_70 = $signed(_pmaPgLevelHomogeneous_T_69) == 57'sh0; // @[Parameters.scala 137:67]
  wire [55:0] _pmaPgLevelHomogeneous_T_71 = _pmaPgLevelHomogeneous_T ^ 56'h2000000; // @[Parameters.scala 137:31]
  wire [56:0] _pmaPgLevelHomogeneous_T_72 = {1'b0,$signed(_pmaPgLevelHomogeneous_T_71)}; // @[Parameters.scala 137:49]
  wire [56:0] _pmaPgLevelHomogeneous_T_74 = $signed(_pmaPgLevelHomogeneous_T_72) & -57'sh10000; // @[Parameters.scala 137:52]
  wire  _pmaPgLevelHomogeneous_T_75 = $signed(_pmaPgLevelHomogeneous_T_74) == 57'sh0; // @[Parameters.scala 137:67]
  wire  pmaPgLevelHomogeneous_2 = _pmaPgLevelHomogeneous_T_60 | _pmaPgLevelHomogeneous_T_65 |
    _pmaPgLevelHomogeneous_T_70 | _pmaPgLevelHomogeneous_T_75 | _pmaPgLevelHomogeneous_T_15 |
    _pmaPgLevelHomogeneous_T_20 | pmaPgLevelHomogeneous_0; // @[TLBPermissions.scala 99:65]
  wire  _pmaHomogeneous_T_1 = count == 2'h1 ? pmaPgLevelHomogeneous_1 : pmaPgLevelHomogeneous_0; // @[package.scala 32:76]
  wire  _pmaHomogeneous_T_3 = count == 2'h2 ? pmaPgLevelHomogeneous_2 : _pmaHomogeneous_T_1; // @[package.scala 32:76]
  wire  pmaHomogeneous = count == 2'h3 ? pmaPgLevelHomogeneous_2 : _pmaHomogeneous_T_3; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_4 = count == 2'h1 ? io_dpath_pmp_0_mask[20] : io_dpath_pmp_0_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_6 = count == 2'h2 ? io_dpath_pmp_0_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_4; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous = count == 2'h3 ? io_dpath_pmp_0_mask[11] : _pmpHomogeneous_maskHomogeneous_T_6; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_2 = {io_dpath_pmp_0_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_3 = ~_pmpHomogeneous_T_2; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_4 = _pmpHomogeneous_T_3 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_5 = ~_pmpHomogeneous_T_4; // @[PMP.scala 60:27]
  wire [55:0] _GEN_260 = {{24'd0}, _pmpHomogeneous_T_5}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_6 = _pmaPgLevelHomogeneous_T ^ _GEN_260; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_8 = _pmpHomogeneous_T_6[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_15 = _pmpHomogeneous_T_6[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_22 = _pmpHomogeneous_T_6[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_24 = count == 2'h1 ? _pmpHomogeneous_T_15 : _pmpHomogeneous_T_8; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_26 = count == 2'h2 ? _pmpHomogeneous_T_22 : _pmpHomogeneous_T_24; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_28 = count == 2'h3 ? _pmpHomogeneous_T_22 : _pmpHomogeneous_T_26; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_29 = pmpHomogeneous_maskHomogeneous | _pmpHomogeneous_T_28; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper = ~(_pmaPgLevelHomogeneous_T < _GEN_260); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_pgMask_T_1 = count == 2'h1 ? 32'hffe00000 : 32'hc0000000; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_pgMask_T_3 = count == 2'h2 ? 32'hfffff000 : _pmpHomogeneous_pgMask_T_1; // @[package.scala 32:76]
  wire [31:0] pmpHomogeneous_pgMask = count == 2'h3 ? 32'hfffff000 : _pmpHomogeneous_pgMask_T_3; // @[package.scala 32:76]
  wire [55:0] _GEN_264 = {{24'd0}, pmpHomogeneous_pgMask}; // @[PMP.scala 110:30]
  wire [55:0] _pmpHomogeneous_endsBeforeLower_T = _pmaPgLevelHomogeneous_T & _GEN_264; // @[PMP.scala 110:30]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_5 = _pmpHomogeneous_T_5 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_266 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_5}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper = _pmpHomogeneous_endsBeforeLower_T < _GEN_266; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_34 = pmpHomogeneous_beginsAfterUpper | pmpHomogeneous_endsBeforeUpper; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_36 = io_dpath_pmp_0_cfg_a[1] ? _pmpHomogeneous_T_29 : ~io_dpath_pmp_0_cfg_a[0] |
    _pmpHomogeneous_T_34; // @[PMP.scala 118:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_12 = count == 2'h1 ? io_dpath_pmp_1_mask[20] : io_dpath_pmp_1_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_14 = count == 2'h2 ? io_dpath_pmp_1_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_12; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_1 = count == 2'h3 ? io_dpath_pmp_1_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_14; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_39 = {io_dpath_pmp_1_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_40 = ~_pmpHomogeneous_T_39; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_41 = _pmpHomogeneous_T_40 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_42 = ~_pmpHomogeneous_T_41; // @[PMP.scala 60:27]
  wire [55:0] _GEN_267 = {{24'd0}, _pmpHomogeneous_T_42}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_43 = _pmaPgLevelHomogeneous_T ^ _GEN_267; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_45 = _pmpHomogeneous_T_43[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_52 = _pmpHomogeneous_T_43[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_59 = _pmpHomogeneous_T_43[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_61 = count == 2'h1 ? _pmpHomogeneous_T_52 : _pmpHomogeneous_T_45; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_63 = count == 2'h2 ? _pmpHomogeneous_T_59 : _pmpHomogeneous_T_61; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_65 = count == 2'h3 ? _pmpHomogeneous_T_59 : _pmpHomogeneous_T_63; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_66 = pmpHomogeneous_maskHomogeneous_1 | _pmpHomogeneous_T_65; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper_1 = ~(_pmaPgLevelHomogeneous_T < _GEN_267); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_11 = _pmpHomogeneous_T_42 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_275 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_11}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper_1 = _pmpHomogeneous_endsBeforeLower_T < _GEN_275; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_71 = pmpHomogeneous_endsBeforeUpper | pmpHomogeneous_beginsAfterUpper_1 |
    pmpHomogeneous_beginsAfterUpper & pmpHomogeneous_endsBeforeUpper_1; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_73 = io_dpath_pmp_1_cfg_a[1] ? _pmpHomogeneous_T_66 : ~io_dpath_pmp_1_cfg_a[0] |
    _pmpHomogeneous_T_71; // @[PMP.scala 118:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_20 = count == 2'h1 ? io_dpath_pmp_2_mask[20] : io_dpath_pmp_2_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_22 = count == 2'h2 ? io_dpath_pmp_2_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_20; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_2 = count == 2'h3 ? io_dpath_pmp_2_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_22; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_76 = {io_dpath_pmp_2_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_77 = ~_pmpHomogeneous_T_76; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_78 = _pmpHomogeneous_T_77 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_79 = ~_pmpHomogeneous_T_78; // @[PMP.scala 60:27]
  wire [55:0] _GEN_276 = {{24'd0}, _pmpHomogeneous_T_79}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_80 = _pmaPgLevelHomogeneous_T ^ _GEN_276; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_82 = _pmpHomogeneous_T_80[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_89 = _pmpHomogeneous_T_80[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_96 = _pmpHomogeneous_T_80[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_98 = count == 2'h1 ? _pmpHomogeneous_T_89 : _pmpHomogeneous_T_82; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_100 = count == 2'h2 ? _pmpHomogeneous_T_96 : _pmpHomogeneous_T_98; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_102 = count == 2'h3 ? _pmpHomogeneous_T_96 : _pmpHomogeneous_T_100; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_103 = pmpHomogeneous_maskHomogeneous_2 | _pmpHomogeneous_T_102; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper_2 = ~(_pmaPgLevelHomogeneous_T < _GEN_276); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_17 = _pmpHomogeneous_T_79 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_284 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_17}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper_2 = _pmpHomogeneous_endsBeforeLower_T < _GEN_284; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_108 = pmpHomogeneous_endsBeforeUpper_1 | pmpHomogeneous_beginsAfterUpper_2 |
    pmpHomogeneous_beginsAfterUpper_1 & pmpHomogeneous_endsBeforeUpper_2; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_110 = io_dpath_pmp_2_cfg_a[1] ? _pmpHomogeneous_T_103 : ~io_dpath_pmp_2_cfg_a[0] |
    _pmpHomogeneous_T_108; // @[PMP.scala 118:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_28 = count == 2'h1 ? io_dpath_pmp_3_mask[20] : io_dpath_pmp_3_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_30 = count == 2'h2 ? io_dpath_pmp_3_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_28; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_3 = count == 2'h3 ? io_dpath_pmp_3_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_30; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_113 = {io_dpath_pmp_3_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_114 = ~_pmpHomogeneous_T_113; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_115 = _pmpHomogeneous_T_114 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_116 = ~_pmpHomogeneous_T_115; // @[PMP.scala 60:27]
  wire [55:0] _GEN_285 = {{24'd0}, _pmpHomogeneous_T_116}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_117 = _pmaPgLevelHomogeneous_T ^ _GEN_285; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_119 = _pmpHomogeneous_T_117[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_126 = _pmpHomogeneous_T_117[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_133 = _pmpHomogeneous_T_117[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_135 = count == 2'h1 ? _pmpHomogeneous_T_126 : _pmpHomogeneous_T_119; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_137 = count == 2'h2 ? _pmpHomogeneous_T_133 : _pmpHomogeneous_T_135; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_139 = count == 2'h3 ? _pmpHomogeneous_T_133 : _pmpHomogeneous_T_137; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_140 = pmpHomogeneous_maskHomogeneous_3 | _pmpHomogeneous_T_139; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper_3 = ~(_pmaPgLevelHomogeneous_T < _GEN_285); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_23 = _pmpHomogeneous_T_116 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_293 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_23}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper_3 = _pmpHomogeneous_endsBeforeLower_T < _GEN_293; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_145 = pmpHomogeneous_endsBeforeUpper_2 | pmpHomogeneous_beginsAfterUpper_3 |
    pmpHomogeneous_beginsAfterUpper_2 & pmpHomogeneous_endsBeforeUpper_3; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_147 = io_dpath_pmp_3_cfg_a[1] ? _pmpHomogeneous_T_140 : ~io_dpath_pmp_3_cfg_a[0] |
    _pmpHomogeneous_T_145; // @[PMP.scala 118:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_36 = count == 2'h1 ? io_dpath_pmp_4_mask[20] : io_dpath_pmp_4_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_38 = count == 2'h2 ? io_dpath_pmp_4_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_36; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_4 = count == 2'h3 ? io_dpath_pmp_4_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_38; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_150 = {io_dpath_pmp_4_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_151 = ~_pmpHomogeneous_T_150; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_152 = _pmpHomogeneous_T_151 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_153 = ~_pmpHomogeneous_T_152; // @[PMP.scala 60:27]
  wire [55:0] _GEN_294 = {{24'd0}, _pmpHomogeneous_T_153}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_154 = _pmaPgLevelHomogeneous_T ^ _GEN_294; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_156 = _pmpHomogeneous_T_154[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_163 = _pmpHomogeneous_T_154[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_170 = _pmpHomogeneous_T_154[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_172 = count == 2'h1 ? _pmpHomogeneous_T_163 : _pmpHomogeneous_T_156; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_174 = count == 2'h2 ? _pmpHomogeneous_T_170 : _pmpHomogeneous_T_172; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_176 = count == 2'h3 ? _pmpHomogeneous_T_170 : _pmpHomogeneous_T_174; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_177 = pmpHomogeneous_maskHomogeneous_4 | _pmpHomogeneous_T_176; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper_4 = ~(_pmaPgLevelHomogeneous_T < _GEN_294); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_29 = _pmpHomogeneous_T_153 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_302 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_29}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper_4 = _pmpHomogeneous_endsBeforeLower_T < _GEN_302; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_182 = pmpHomogeneous_endsBeforeUpper_3 | pmpHomogeneous_beginsAfterUpper_4 |
    pmpHomogeneous_beginsAfterUpper_3 & pmpHomogeneous_endsBeforeUpper_4; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_184 = io_dpath_pmp_4_cfg_a[1] ? _pmpHomogeneous_T_177 : ~io_dpath_pmp_4_cfg_a[0] |
    _pmpHomogeneous_T_182; // @[PMP.scala 118:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_44 = count == 2'h1 ? io_dpath_pmp_5_mask[20] : io_dpath_pmp_5_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_46 = count == 2'h2 ? io_dpath_pmp_5_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_44; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_5 = count == 2'h3 ? io_dpath_pmp_5_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_46; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_187 = {io_dpath_pmp_5_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_188 = ~_pmpHomogeneous_T_187; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_189 = _pmpHomogeneous_T_188 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_190 = ~_pmpHomogeneous_T_189; // @[PMP.scala 60:27]
  wire [55:0] _GEN_303 = {{24'd0}, _pmpHomogeneous_T_190}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_191 = _pmaPgLevelHomogeneous_T ^ _GEN_303; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_193 = _pmpHomogeneous_T_191[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_200 = _pmpHomogeneous_T_191[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_207 = _pmpHomogeneous_T_191[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_209 = count == 2'h1 ? _pmpHomogeneous_T_200 : _pmpHomogeneous_T_193; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_211 = count == 2'h2 ? _pmpHomogeneous_T_207 : _pmpHomogeneous_T_209; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_213 = count == 2'h3 ? _pmpHomogeneous_T_207 : _pmpHomogeneous_T_211; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_214 = pmpHomogeneous_maskHomogeneous_5 | _pmpHomogeneous_T_213; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper_5 = ~(_pmaPgLevelHomogeneous_T < _GEN_303); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_35 = _pmpHomogeneous_T_190 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_311 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_35}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper_5 = _pmpHomogeneous_endsBeforeLower_T < _GEN_311; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_219 = pmpHomogeneous_endsBeforeUpper_4 | pmpHomogeneous_beginsAfterUpper_5 |
    pmpHomogeneous_beginsAfterUpper_4 & pmpHomogeneous_endsBeforeUpper_5; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_221 = io_dpath_pmp_5_cfg_a[1] ? _pmpHomogeneous_T_214 : ~io_dpath_pmp_5_cfg_a[0] |
    _pmpHomogeneous_T_219; // @[PMP.scala 118:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_52 = count == 2'h1 ? io_dpath_pmp_6_mask[20] : io_dpath_pmp_6_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_54 = count == 2'h2 ? io_dpath_pmp_6_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_52; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_6 = count == 2'h3 ? io_dpath_pmp_6_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_54; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_224 = {io_dpath_pmp_6_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_225 = ~_pmpHomogeneous_T_224; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_226 = _pmpHomogeneous_T_225 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_227 = ~_pmpHomogeneous_T_226; // @[PMP.scala 60:27]
  wire [55:0] _GEN_312 = {{24'd0}, _pmpHomogeneous_T_227}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_228 = _pmaPgLevelHomogeneous_T ^ _GEN_312; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_230 = _pmpHomogeneous_T_228[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_237 = _pmpHomogeneous_T_228[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_244 = _pmpHomogeneous_T_228[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_246 = count == 2'h1 ? _pmpHomogeneous_T_237 : _pmpHomogeneous_T_230; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_248 = count == 2'h2 ? _pmpHomogeneous_T_244 : _pmpHomogeneous_T_246; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_250 = count == 2'h3 ? _pmpHomogeneous_T_244 : _pmpHomogeneous_T_248; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_251 = pmpHomogeneous_maskHomogeneous_6 | _pmpHomogeneous_T_250; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper_6 = ~(_pmaPgLevelHomogeneous_T < _GEN_312); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_41 = _pmpHomogeneous_T_227 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_320 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_41}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper_6 = _pmpHomogeneous_endsBeforeLower_T < _GEN_320; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_256 = pmpHomogeneous_endsBeforeUpper_5 | pmpHomogeneous_beginsAfterUpper_6 |
    pmpHomogeneous_beginsAfterUpper_5 & pmpHomogeneous_endsBeforeUpper_6; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_258 = io_dpath_pmp_6_cfg_a[1] ? _pmpHomogeneous_T_251 : ~io_dpath_pmp_6_cfg_a[0] |
    _pmpHomogeneous_T_256; // @[PMP.scala 118:8]
  wire  _pmpHomogeneous_maskHomogeneous_T_60 = count == 2'h1 ? io_dpath_pmp_7_mask[20] : io_dpath_pmp_7_mask[29]; // @[package.scala 32:76]
  wire  _pmpHomogeneous_maskHomogeneous_T_62 = count == 2'h2 ? io_dpath_pmp_7_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_60; // @[package.scala 32:76]
  wire  pmpHomogeneous_maskHomogeneous_7 = count == 2'h3 ? io_dpath_pmp_7_mask[11] :
    _pmpHomogeneous_maskHomogeneous_T_62; // @[package.scala 32:76]
  wire [31:0] _pmpHomogeneous_T_261 = {io_dpath_pmp_7_addr, 2'h0}; // @[PMP.scala 60:36]
  wire [31:0] _pmpHomogeneous_T_262 = ~_pmpHomogeneous_T_261; // @[PMP.scala 60:29]
  wire [31:0] _pmpHomogeneous_T_263 = _pmpHomogeneous_T_262 | 32'h3; // @[PMP.scala 60:48]
  wire [31:0] _pmpHomogeneous_T_264 = ~_pmpHomogeneous_T_263; // @[PMP.scala 60:27]
  wire [55:0] _GEN_321 = {{24'd0}, _pmpHomogeneous_T_264}; // @[PMP.scala 98:53]
  wire [55:0] _pmpHomogeneous_T_265 = _pmaPgLevelHomogeneous_T ^ _GEN_321; // @[PMP.scala 98:53]
  wire  _pmpHomogeneous_T_267 = _pmpHomogeneous_T_265[55:30] != 26'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_274 = _pmpHomogeneous_T_265[55:21] != 35'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_281 = _pmpHomogeneous_T_265[55:12] != 44'h0; // @[PMP.scala 98:78]
  wire  _pmpHomogeneous_T_283 = count == 2'h1 ? _pmpHomogeneous_T_274 : _pmpHomogeneous_T_267; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_285 = count == 2'h2 ? _pmpHomogeneous_T_281 : _pmpHomogeneous_T_283; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_287 = count == 2'h3 ? _pmpHomogeneous_T_281 : _pmpHomogeneous_T_285; // @[package.scala 32:76]
  wire  _pmpHomogeneous_T_288 = pmpHomogeneous_maskHomogeneous_7 | _pmpHomogeneous_T_287; // @[PMP.scala 98:21]
  wire  pmpHomogeneous_beginsAfterUpper_7 = ~(_pmaPgLevelHomogeneous_T < _GEN_321); // @[PMP.scala 107:28]
  wire [31:0] _pmpHomogeneous_endsBeforeUpper_T_47 = _pmpHomogeneous_T_264 & pmpHomogeneous_pgMask; // @[PMP.scala 111:53]
  wire [55:0] _GEN_329 = {{24'd0}, _pmpHomogeneous_endsBeforeUpper_T_47}; // @[PMP.scala 111:40]
  wire  pmpHomogeneous_endsBeforeUpper_7 = _pmpHomogeneous_endsBeforeLower_T < _GEN_329; // @[PMP.scala 111:40]
  wire  _pmpHomogeneous_T_293 = pmpHomogeneous_endsBeforeUpper_6 | pmpHomogeneous_beginsAfterUpper_7 |
    pmpHomogeneous_beginsAfterUpper_6 & pmpHomogeneous_endsBeforeUpper_7; // @[PMP.scala 113:41]
  wire  _pmpHomogeneous_T_295 = io_dpath_pmp_7_cfg_a[1] ? _pmpHomogeneous_T_288 : ~io_dpath_pmp_7_cfg_a[0] |
    _pmpHomogeneous_T_293; // @[PMP.scala 118:8]
  wire  pmpHomogeneous = _pmpHomogeneous_T_36 & _pmpHomogeneous_T_73 & _pmpHomogeneous_T_110 & _pmpHomogeneous_T_147 &
    _pmpHomogeneous_T_184 & _pmpHomogeneous_T_221 & _pmpHomogeneous_T_258 & _pmpHomogeneous_T_295; // @[PMP.scala 138:10]
  wire  homogeneous = pmaHomogeneous & pmpHomogeneous; // @[PTW.scala 386:36]
  wire  _T_140 = 3'h0 == state; // @[PTW.scala 420:18]
  wire  _T_141 = arb_io_out_ready & arb_io_out_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _next_state_T = arb_io_out_bits_valid ? 3'h1 : 3'h0; // @[PTW.scala 429:26]
  wire [2:0] _GEN_80 = _T_141 ? _next_state_T : state; // @[PTW.scala 422:32 429:20]
  wire  _GEN_88 = _T_141 ? 1'h0 : resp_ae_final; // @[PTW.scala 422:32 437:23 145:26]
  wire  _GEN_89 = _T_141 ? 1'h0 : resp_pf; // @[PTW.scala 422:32 438:17 146:20]
  wire [1:0] _count_T_2 = count + 2'h1; // @[PTW.scala 460:24]
  wire [2:0] _next_state_T_1 = io_mem_req_ready ? 3'h2 : 3'h1; // @[PTW.scala 463:26]
  wire [2:0] _GEN_101 = pte_cache_hit ? state : _next_state_T_1; // @[PTW.scala 459:34 463:20]
  wire  _GEN_108 = ~r_req_dest; // @[PTW.scala 133:23 476:{32,32}]
  wire  _GEN_110 = io_mem_s2_xcpt_ae_ld | resp_ae_ptw; // @[PTW.scala 473:35 474:21 144:24]
  wire [2:0] _GEN_111 = io_mem_s2_xcpt_ae_ld ? 3'h0 : 3'h5; // @[PTW.scala 471:18 473:35 475:20]
  wire  _GEN_112 = io_mem_s2_xcpt_ae_ld & _GEN_108; // @[PTW.scala 133:23 473:35]
  wire  _GEN_113 = io_mem_s2_xcpt_ae_ld & r_req_dest; // @[PTW.scala 133:23 473:35]
  wire  _T_157 = ~homogeneous; // @[PTW.scala 482:13]
  wire [1:0] _GEN_116 = ~homogeneous ? 2'h2 : count; // @[PTW.scala 482:27 483:15 143:18]
  wire [2:0] _GEN_119 = 3'h7 == state ? 3'h0 : state; // @[PTW.scala 420:18 480:18]
  wire  _GEN_120 = 3'h7 == state & _GEN_108; // @[PTW.scala 420:18 133:23]
  wire  _GEN_121 = 3'h7 == state & r_req_dest; // @[PTW.scala 420:18 133:23]
  wire [1:0] _GEN_122 = 3'h7 == state ? _GEN_116 : count; // @[PTW.scala 143:18 420:18]
  wire [2:0] _GEN_124 = 3'h4 == state ? _GEN_111 : _GEN_119; // @[PTW.scala 420:18]
  wire  _GEN_125 = 3'h4 == state & _traverse_T_16; // @[PTW.scala 420:18 262:26 472:30]
  wire  _GEN_127 = 3'h4 == state ? _GEN_112 : _GEN_120; // @[PTW.scala 420:18]
  wire  _GEN_128 = 3'h4 == state ? _GEN_113 : _GEN_121; // @[PTW.scala 420:18]
  wire [1:0] _GEN_129 = 3'h4 == state ? count : _GEN_122; // @[PTW.scala 143:18 420:18]
  wire [2:0] _GEN_131 = 3'h2 == state ? 3'h4 : _GEN_124; // @[PTW.scala 420:18 468:18]
  wire  _GEN_132 = 3'h2 == state ? 1'h0 : _GEN_125; // @[PTW.scala 420:18 262:26]
  wire  _GEN_134 = 3'h2 == state ? 1'h0 : _GEN_127; // @[PTW.scala 420:18 133:23]
  wire  _GEN_135 = 3'h2 == state ? 1'h0 : _GEN_128; // @[PTW.scala 420:18 133:23]
  wire [2:0] _GEN_144 = 3'h1 == state ? _GEN_101 : _GEN_131; // @[PTW.scala 420:18]
  wire  _GEN_145 = 3'h1 == state ? 1'h0 : _GEN_132; // @[PTW.scala 420:18 262:26]
  wire  _GEN_147 = 3'h1 == state ? 1'h0 : _GEN_134; // @[PTW.scala 420:18 133:23]
  wire  _GEN_148 = 3'h1 == state ? 1'h0 : _GEN_135; // @[PTW.scala 420:18 133:23]
  wire [2:0] _GEN_155 = 3'h0 == state ? _GEN_80 : _GEN_144; // @[PTW.scala 420:18]
  wire  _GEN_163 = 3'h0 == state ? _GEN_88 : resp_ae_final; // @[PTW.scala 420:18 145:26]
  wire  _GEN_164 = 3'h0 == state ? _GEN_89 : resp_pf; // @[PTW.scala 420:18 146:20]
  wire  _GEN_176 = 3'h0 == state ? 1'h0 : _GEN_147; // @[PTW.scala 420:18 133:23]
  wire  _GEN_177 = 3'h0 == state ? 1'h0 : _GEN_148; // @[PTW.scala 420:18 133:23]
  wire [43:0] _r_pte_T_15 = {r_pte_ppn[43:18],r_req_addr[17:0]}; // @[Cat.scala 31:58]
  wire [43:0] _r_pte_T_18 = {r_pte_ppn[43:9],r_req_addr[8:0]}; // @[Cat.scala 31:58]
  wire  r_pte_truncIdx = count[0]; // @[package.scala 31:49]
  wire [43:0] pte_2_ppn = r_pte_truncIdx ? _r_pte_T_18 : _r_pte_T_15; // @[package.scala 32:76]
  wire [43:0] _r_pte_T_23_ppn = _T_141 ? io_dpath_ptbr_ppn : r_pte_ppn; // @[PTW.scala 506:8]
  wire [43:0] _r_pte_T_24_ppn = state == 3'h7 & _T_157 ? pte_2_ppn : _r_pte_T_23_ppn; // @[PTW.scala 505:8]
  wire [43:0] _r_pte_T_25_ppn = mem_resp_valid ? res_ppn : _r_pte_T_24_ppn; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_d = mem_resp_valid ? tmp_d : r_pte_d; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_a = mem_resp_valid ? tmp_a : r_pte_a; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_g = mem_resp_valid ? tmp_g : r_pte_g; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_u = mem_resp_valid ? tmp_u : r_pte_u; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_x = mem_resp_valid ? tmp_x : r_pte_x; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_w = mem_resp_valid ? tmp_w : r_pte_w; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_r = mem_resp_valid ? tmp_r : r_pte_r; // @[PTW.scala 504:8]
  wire  _r_pte_T_25_v = mem_resp_valid ? res_v : r_pte_v; // @[PTW.scala 504:8]
  wire  ae = res_v & invalid_paddr; // @[PTW.scala 523:22]
  wire  pf = res_v & tmp_reserved_for_future != 10'h0; // @[PTW.scala 524:22]
  wire  success = res_v & ~ae & ~pf; // @[PTW.scala 525:34]
  wire [43:0] pte_ppn = {{24'd0}, pte_cache_data};
  wire  _GEN_178 = _GEN_108 | _GEN_176; // @[PTW.scala 512:{28,28}]
  wire  _GEN_179 = r_req_dest | _GEN_177; // @[PTW.scala 512:{28,28}]
  wire  _l2_refill_T_3 = success & _pte_addr_vpn_idx_T_2 & ~r_req_need_gpa; // @[PTW.scala 536:54]
  wire  _GEN_212 = traverse ? 1'h0 : _l2_refill_T_3; // @[PTW.scala 518:21 267:26]
  wire [2:0] _GEN_213 = traverse ? 3'h1 : 3'h0; // @[PTW.scala 517:16 518:21]
  wire [2:0] _GEN_222 = mem_resp_valid ? _GEN_213 : _GEN_155; // @[PTW.scala 515:25]
  Arbiter arb ( // @[PTW.scala 129:19]
    .io_in_0_ready(arb_io_in_0_ready),
    .io_in_0_valid(arb_io_in_0_valid),
    .io_in_0_bits_bits_addr(arb_io_in_0_bits_bits_addr),
    .io_in_0_bits_bits_need_gpa(arb_io_in_0_bits_bits_need_gpa),
    .io_in_1_ready(arb_io_in_1_ready),
    .io_in_1_valid(arb_io_in_1_valid),
    .io_in_1_bits_valid(arb_io_in_1_bits_valid),
    .io_in_1_bits_bits_addr(arb_io_in_1_bits_bits_addr),
    .io_in_1_bits_bits_need_gpa(arb_io_in_1_bits_bits_need_gpa),
    .io_out_ready(arb_io_out_ready),
    .io_out_valid(arb_io_out_valid),
    .io_out_bits_valid(arb_io_out_bits_valid),
    .io_out_bits_bits_addr(arb_io_out_bits_bits_addr),
    .io_out_bits_bits_need_gpa(arb_io_out_bits_bits_need_gpa),
    .io_chosen(arb_io_chosen)
  );
  OptimizationBarrier_42 state_barrier ( // @[package.scala 258:25]
    .io_x(state_barrier_io_x),
    .io_y(state_barrier_io_y)
  );
  OptimizationBarrier_43 r_pte_barrier ( // @[package.scala 258:25]
    .io_x_ppn(r_pte_barrier_io_x_ppn),
    .io_x_d(r_pte_barrier_io_x_d),
    .io_x_a(r_pte_barrier_io_x_a),
    .io_x_g(r_pte_barrier_io_x_g),
    .io_x_u(r_pte_barrier_io_x_u),
    .io_x_x(r_pte_barrier_io_x_x),
    .io_x_w(r_pte_barrier_io_x_w),
    .io_x_r(r_pte_barrier_io_x_r),
    .io_x_v(r_pte_barrier_io_x_v),
    .io_y_ppn(r_pte_barrier_io_y_ppn),
    .io_y_d(r_pte_barrier_io_y_d),
    .io_y_a(r_pte_barrier_io_y_a),
    .io_y_g(r_pte_barrier_io_y_g),
    .io_y_u(r_pte_barrier_io_y_u),
    .io_y_x(r_pte_barrier_io_y_x),
    .io_y_w(r_pte_barrier_io_y_w),
    .io_y_r(r_pte_barrier_io_y_r),
    .io_y_v(r_pte_barrier_io_y_v)
  );
  assign io_requestor_0_req_ready = arb_io_in_0_ready; // @[PTW.scala 130:13]
  assign io_requestor_0_resp_valid = resp_valid_0; // @[PTW.scala 389:32]
  assign io_requestor_0_resp_bits_ae_ptw = resp_ae_ptw; // @[PTW.scala 390:38]
  assign io_requestor_0_resp_bits_ae_final = resp_ae_final; // @[PTW.scala 391:40]
  assign io_requestor_0_resp_bits_pf = resp_pf; // @[PTW.scala 392:34]
  assign io_requestor_0_resp_bits_pte_ppn = r_pte_ppn; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_d = r_pte_d; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_a = r_pte_a; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_g = r_pte_g; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_u = r_pte_u; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_x = r_pte_x; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_w = r_pte_w; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_r = r_pte_r; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_pte_v = r_pte_v; // @[PTW.scala 397:35]
  assign io_requestor_0_resp_bits_level = count; // @[PTW.scala 167:25]
  assign io_requestor_0_resp_bits_homogeneous = pmaHomogeneous & pmpHomogeneous; // @[PTW.scala 386:36]
  assign io_requestor_0_ptbr_mode = io_dpath_ptbr_mode; // @[PTW.scala 405:26]
  assign io_requestor_0_status_debug = io_dpath_status_debug; // @[PTW.scala 409:28]
  assign io_requestor_0_status_mxr = io_dpath_status_mxr; // @[PTW.scala 409:28]
  assign io_requestor_0_status_sum = io_dpath_status_sum; // @[PTW.scala 409:28]
  assign io_requestor_0_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_0_addr = io_dpath_pmp_0_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_0_mask = io_dpath_pmp_0_mask; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_1_addr = io_dpath_pmp_1_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_1_mask = io_dpath_pmp_1_mask; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_2_addr = io_dpath_pmp_2_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_2_mask = io_dpath_pmp_2_mask; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_3_addr = io_dpath_pmp_3_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_3_mask = io_dpath_pmp_3_mask; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_4_addr = io_dpath_pmp_4_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_4_mask = io_dpath_pmp_4_mask; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_5_addr = io_dpath_pmp_5_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_5_mask = io_dpath_pmp_5_mask; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_6_addr = io_dpath_pmp_6_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_6_mask = io_dpath_pmp_6_mask; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_7_addr = io_dpath_pmp_7_addr; // @[PTW.scala 412:25]
  assign io_requestor_0_pmp_7_mask = io_dpath_pmp_7_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_req_ready = arb_io_in_1_ready; // @[PTW.scala 130:13]
  assign io_requestor_1_resp_valid = resp_valid_1; // @[PTW.scala 389:32]
  assign io_requestor_1_resp_bits_ae_ptw = resp_ae_ptw; // @[PTW.scala 390:38]
  assign io_requestor_1_resp_bits_ae_final = resp_ae_final; // @[PTW.scala 391:40]
  assign io_requestor_1_resp_bits_pf = resp_pf; // @[PTW.scala 392:34]
  assign io_requestor_1_resp_bits_pte_ppn = r_pte_ppn; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_d = r_pte_d; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_a = r_pte_a; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_g = r_pte_g; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_u = r_pte_u; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_x = r_pte_x; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_w = r_pte_w; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_r = r_pte_r; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_pte_v = r_pte_v; // @[PTW.scala 397:35]
  assign io_requestor_1_resp_bits_level = count; // @[PTW.scala 167:25]
  assign io_requestor_1_resp_bits_homogeneous = pmaHomogeneous & pmpHomogeneous; // @[PTW.scala 386:36]
  assign io_requestor_1_ptbr_mode = io_dpath_ptbr_mode; // @[PTW.scala 405:26]
  assign io_requestor_1_status_debug = io_dpath_status_debug; // @[PTW.scala 409:28]
  assign io_requestor_1_status_prv = io_dpath_status_prv; // @[PTW.scala 409:28]
  assign io_requestor_1_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_0_addr = io_dpath_pmp_0_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_0_mask = io_dpath_pmp_0_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_1_addr = io_dpath_pmp_1_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_1_mask = io_dpath_pmp_1_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_2_addr = io_dpath_pmp_2_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_2_mask = io_dpath_pmp_2_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_3_addr = io_dpath_pmp_3_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_3_mask = io_dpath_pmp_3_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_4_addr = io_dpath_pmp_4_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_4_mask = io_dpath_pmp_4_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_5_addr = io_dpath_pmp_5_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_5_mask = io_dpath_pmp_5_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_6_addr = io_dpath_pmp_6_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_6_mask = io_dpath_pmp_6_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_7_addr = io_dpath_pmp_7_addr; // @[PTW.scala 412:25]
  assign io_requestor_1_pmp_7_mask = io_dpath_pmp_7_mask; // @[PTW.scala 412:25]
  assign io_requestor_1_customCSRs_csrs_0_value = io_dpath_customCSRs_csrs_0_value; // @[PTW.scala 408:32]
  assign io_mem_req_valid = _T_39 | state == 3'h3; // @[PTW.scala 360:39]
  assign io_mem_req_bits_addr = {{8'd0}, pte_addr}; // @[PTW.scala 365:24]
  assign io_mem_s1_kill = state != 3'h2; // @[PTW.scala 369:37]
  assign io_dpath_perf_l2hit = 1'h0; // @[PTW.scala 270:23]
  assign io_dpath_perf_pte_miss = 3'h0 == state ? 1'h0 : _GEN_145; // @[PTW.scala 420:18 262:26]
  assign io_dpath_perf_pte_hit = pte_hit & _T_39 & ~io_dpath_perf_l2hit; // @[PTW.scala 263:57]
  assign arb_io_in_0_valid = io_requestor_0_req_valid; // @[PTW.scala 130:13]
  assign arb_io_in_0_bits_bits_addr = io_requestor_0_req_bits_bits_addr; // @[PTW.scala 130:13]
  assign arb_io_in_0_bits_bits_need_gpa = io_requestor_0_req_bits_bits_need_gpa; // @[PTW.scala 130:13]
  assign arb_io_in_1_valid = io_requestor_1_req_valid; // @[PTW.scala 130:13]
  assign arb_io_in_1_bits_valid = io_requestor_1_req_bits_valid; // @[PTW.scala 130:13]
  assign arb_io_in_1_bits_bits_addr = io_requestor_1_req_bits_bits_addr; // @[PTW.scala 130:13]
  assign arb_io_in_1_bits_bits_need_gpa = io_requestor_1_req_bits_bits_need_gpa; // @[PTW.scala 130:13]
  assign arb_io_out_ready = state == 3'h0 & ~l2_refill; // @[PTW.scala 131:43]
  assign state_barrier_io_x = io_mem_s2_nack ? 3'h1 : _GEN_222; // @[PTW.scala 557:25 559:16]
  assign r_pte_barrier_io_x_ppn = _T_39 & pte_cache_hit ? pte_ppn : _r_pte_T_25_ppn; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_d = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_d; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_a = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_a; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_g = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_g; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_u = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_u; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_x = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_x; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_w = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_w; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_r = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_r; // @[PTW.scala 502:8]
  assign r_pte_barrier_io_x_v = _T_39 & pte_cache_hit ? 1'h0 : _r_pte_T_25_v; // @[PTW.scala 502:8]
  always @(posedge clock) begin
    if (reset) begin // @[PTW.scala 126:18]
      state <= 3'h0; // @[PTW.scala 126:18]
    end else begin
      state <= state_barrier_io_y; // @[PTW.scala 417:9]
    end
    l2_refill <= mem_resp_valid & _GEN_212; // @[PTW.scala 515:25 267:26]
    if (mem_resp_valid) begin // @[PTW.scala 515:25]
      if (traverse) begin // @[PTW.scala 518:21]
        resp_valid_0 <= _GEN_176;
      end else begin
        resp_valid_0 <= _GEN_178;
      end
    end else begin
      resp_valid_0 <= _GEN_176;
    end
    if (mem_resp_valid) begin // @[PTW.scala 515:25]
      if (traverse) begin // @[PTW.scala 518:21]
        resp_valid_1 <= _GEN_177;
      end else begin
        resp_valid_1 <= _GEN_179;
      end
    end else begin
      resp_valid_1 <= _GEN_177;
    end
    invalidated <= io_dpath_sfence_valid | invalidated & _clock_en_T; // @[PTW.scala 358:40]
    if (mem_resp_valid) begin // @[PTW.scala 515:25]
      if (traverse) begin // @[PTW.scala 518:21]
        count <= _count_T_2; // @[PTW.scala 520:13]
      end
    end else if (3'h0 == state) begin // @[PTW.scala 420:18]
      if (_T_141) begin // @[PTW.scala 422:32]
        count <= 2'h0; // @[PTW.scala 432:21]
      end
    end else if (3'h1 == state) begin // @[PTW.scala 420:18]
      if (pte_cache_hit) begin // @[PTW.scala 459:34]
        count <= _count_T_2; // @[PTW.scala 460:15]
      end
    end else if (!(3'h2 == state)) begin // @[PTW.scala 420:18]
      count <= _GEN_129;
    end
    if (3'h0 == state) begin // @[PTW.scala 420:18]
      if (_T_141) begin // @[PTW.scala 422:32]
        resp_ae_ptw <= 1'h0; // @[PTW.scala 436:21]
      end
    end else if (!(3'h1 == state)) begin // @[PTW.scala 420:18]
      if (!(3'h2 == state)) begin // @[PTW.scala 420:18]
        if (3'h4 == state) begin // @[PTW.scala 420:18]
          resp_ae_ptw <= _GEN_110;
        end
      end
    end
    if (mem_resp_valid) begin // @[PTW.scala 515:25]
      if (traverse) begin // @[PTW.scala 518:21]
        resp_ae_final <= _GEN_163;
      end else begin
        resp_ae_final <= ae;
      end
    end else begin
      resp_ae_final <= _GEN_163;
    end
    if (mem_resp_valid) begin // @[PTW.scala 515:25]
      if (traverse) begin // @[PTW.scala 518:21]
        resp_pf <= _GEN_164;
      end else begin
        resp_pf <= pf;
      end
    end else begin
      resp_pf <= _GEN_164;
    end
    if (3'h0 == state) begin // @[PTW.scala 420:18]
      if (_T_141) begin // @[PTW.scala 422:32]
        r_req_addr <= arb_io_out_bits_bits_addr; // @[PTW.scala 427:15]
      end
    end
    if (3'h0 == state) begin // @[PTW.scala 420:18]
      if (_T_141) begin // @[PTW.scala 422:32]
        r_req_need_gpa <= arb_io_out_bits_bits_need_gpa; // @[PTW.scala 427:15]
      end
    end
    if (3'h0 == state) begin // @[PTW.scala 420:18]
      if (_T_141) begin // @[PTW.scala 422:32]
        r_req_dest <= arb_io_chosen; // @[PTW.scala 428:20]
      end
    end
    r_pte_ppn <= r_pte_barrier_io_y_ppn; // @[PTW.scala 500:9]
    r_pte_d <= r_pte_barrier_io_y_d; // @[PTW.scala 500:9]
    r_pte_a <= r_pte_barrier_io_y_a; // @[PTW.scala 500:9]
    r_pte_g <= r_pte_barrier_io_y_g; // @[PTW.scala 500:9]
    r_pte_u <= r_pte_barrier_io_y_u; // @[PTW.scala 500:9]
    r_pte_x <= r_pte_barrier_io_y_x; // @[PTW.scala 500:9]
    r_pte_w <= r_pte_barrier_io_y_w; // @[PTW.scala 500:9]
    r_pte_r <= r_pte_barrier_io_y_r; // @[PTW.scala 500:9]
    r_pte_v <= r_pte_barrier_io_y_v; // @[PTW.scala 500:9]
    mem_resp_valid <= io_mem_resp_valid; // @[PTW.scala 170:31]
    mem_resp_data <= io_mem_resp_bits_data; // @[PTW.scala 171:30]
    if (reset) begin // @[Replacement.scala 168:70]
      state_reg <= 7'h0; // @[Replacement.scala 168:70]
    end else if (pte_cache_hit & state == 3'h1) begin // @[PTW.scala 247:35]
      state_reg <= _state_reg_T_45; // @[Replacement.scala 172:15]
    end else if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      state_reg <= _state_reg_T_22; // @[Replacement.scala 172:15]
    end
    if (reset) begin // @[PTW.scala 225:24]
      valid <= 8'h0; // @[PTW.scala 225:24]
    end else if (io_dpath_sfence_valid & ~io_dpath_sfence_bits_rs1) begin // @[PTW.scala 248:111]
      valid <= 8'h0; // @[PTW.scala 248:119]
    end else if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      valid <= _valid_T_1; // @[PTW.scala 242:13]
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h0 == r) begin // @[PTW.scala 243:15]
        tags__0 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h1 == r) begin // @[PTW.scala 243:15]
        tags__1 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h2 == r) begin // @[PTW.scala 243:15]
        tags__2 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h3 == r) begin // @[PTW.scala 243:15]
        tags__3 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h4 == r) begin // @[PTW.scala 243:15]
        tags__4 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h5 == r) begin // @[PTW.scala 243:15]
        tags__5 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h6 == r) begin // @[PTW.scala 243:15]
        tags__6 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h7 == r) begin // @[PTW.scala 243:15]
        tags__7 <= tag[31:0]; // @[PTW.scala 243:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h0 == r) begin // @[PTW.scala 244:15]
        data__0 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h1 == r) begin // @[PTW.scala 244:15]
        data__1 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h2 == r) begin // @[PTW.scala 244:15]
        data__2 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h3 == r) begin // @[PTW.scala 244:15]
        data__3 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h4 == r) begin // @[PTW.scala 244:15]
        data__4 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h5 == r) begin // @[PTW.scala 244:15]
        data__5 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h6 == r) begin // @[PTW.scala 244:15]
        data__6 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (mem_resp_valid & traverse & _traverse_T_16 & ~_hit_T & ~invalidated) begin // @[PTW.scala 240:82]
      if (3'h7 == r) begin // @[PTW.scala 244:15]
        data__7 <= res_ppn[19:0]; // @[PTW.scala 244:15]
      end
    end
    if (3'h0 == state) begin // @[PTW.scala 420:18]
      pte_hit <= 1'h0; // @[PTW.scala 261:24]
    end else begin
      pte_hit <= 3'h1 == state & pte_cache_hit;
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit))) & ~reset) begin
          $fatal; // @[PTW.scala 264:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~(io_dpath_perf_l2hit & (io_dpath_perf_pte_miss | io_dpath_perf_pte_hit)))) begin
          $fwrite(32'h80000002,
            "Assertion failed: PTE Cache Hit/Miss Performance Monitor Events are lower priority than L2TLB Hit event\n    at PTW.scala:264 assert(!(io.dpath.perf.l2hit && (io.dpath.perf.pte_miss || io.dpath.perf.pte_hit)),\n"
            ); // @[PTW.scala 264:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~arb_io_out_bits_bits_need_gpa) & (_T_140 & _T_141 & _T_138)) begin
          $fatal; // @[PTW.scala 446:15]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_140 & _T_141 & _T_138 & ~(~arb_io_out_bits_bits_need_gpa)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at PTW.scala:446 assert(!arb.io.out.bits.bits.need_gpa || arb.io.out.bits.bits.stage2)\n"
            ); // @[PTW.scala 446:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(state == 3'h5) & (mem_resp_valid & _T_138)) begin
          $fatal; // @[PTW.scala 516:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (mem_resp_valid & _T_138 & ~(state == 3'h5)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PTW.scala:516 assert(state === s_wait3)\n"); // @[PTW.scala 516:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(state == 3'h4) & (io_mem_s2_nack & _T_138)) begin
          $fatal; // @[PTW.scala 558:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_mem_s2_nack & _T_138 & ~(state == 3'h4)) begin
          $fwrite(32'h80000002,"Assertion failed\n    at PTW.scala:558 assert(state === s_wait2)\n"); // @[PTW.scala 558:11]
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
  state = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  l2_refill = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  resp_valid_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  resp_valid_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  invalidated = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  count = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  resp_ae_ptw = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  resp_ae_final = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  resp_pf = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  r_req_addr = _RAND_9[26:0];
  _RAND_10 = {1{`RANDOM}};
  r_req_need_gpa = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  r_req_dest = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  r_pte_ppn = _RAND_12[43:0];
  _RAND_13 = {1{`RANDOM}};
  r_pte_d = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  r_pte_a = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  r_pte_g = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  r_pte_u = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  r_pte_x = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  r_pte_w = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  r_pte_r = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  r_pte_v = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  mem_resp_valid = _RAND_21[0:0];
  _RAND_22 = {2{`RANDOM}};
  mem_resp_data = _RAND_22[63:0];
  _RAND_23 = {1{`RANDOM}};
  state_reg = _RAND_23[6:0];
  _RAND_24 = {1{`RANDOM}};
  valid = _RAND_24[7:0];
  _RAND_25 = {1{`RANDOM}};
  tags__0 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  tags__1 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  tags__2 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  tags__3 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  tags__4 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  tags__5 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  tags__6 = _RAND_31[31:0];
  _RAND_32 = {1{`RANDOM}};
  tags__7 = _RAND_32[31:0];
  _RAND_33 = {1{`RANDOM}};
  data__0 = _RAND_33[19:0];
  _RAND_34 = {1{`RANDOM}};
  data__1 = _RAND_34[19:0];
  _RAND_35 = {1{`RANDOM}};
  data__2 = _RAND_35[19:0];
  _RAND_36 = {1{`RANDOM}};
  data__3 = _RAND_36[19:0];
  _RAND_37 = {1{`RANDOM}};
  data__4 = _RAND_37[19:0];
  _RAND_38 = {1{`RANDOM}};
  data__5 = _RAND_38[19:0];
  _RAND_39 = {1{`RANDOM}};
  data__6 = _RAND_39[19:0];
  _RAND_40 = {1{`RANDOM}};
  data__7 = _RAND_40[19:0];
  _RAND_41 = {1{`RANDOM}};
  pte_hit = _RAND_41[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
