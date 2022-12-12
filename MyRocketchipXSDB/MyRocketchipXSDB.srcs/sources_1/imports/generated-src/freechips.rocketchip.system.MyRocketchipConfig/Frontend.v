module Frontend(
  input         clock,
  input         reset,
  input         auto_icache_master_out_a_ready,
  output        auto_icache_master_out_a_valid,
  output [31:0] auto_icache_master_out_a_bits_address,
  input         auto_icache_master_out_d_valid,
  input  [2:0]  auto_icache_master_out_d_bits_opcode,
  input  [3:0]  auto_icache_master_out_d_bits_size,
  input  [63:0] auto_icache_master_out_d_bits_data,
  input         auto_icache_master_out_d_bits_corrupt,
  input         io_cpu_might_request,
  input         io_cpu_req_valid,
  input  [39:0] io_cpu_req_bits_pc,
  input         io_cpu_req_bits_speculative,
  input         io_cpu_sfence_valid,
  input         io_cpu_sfence_bits_rs1,
  input         io_cpu_sfence_bits_rs2,
  input  [38:0] io_cpu_sfence_bits_addr,
  input         io_cpu_resp_ready,
  output        io_cpu_resp_valid,
  output        io_cpu_resp_bits_btb_taken,
  output        io_cpu_resp_bits_btb_bridx,
  output [4:0]  io_cpu_resp_bits_btb_entry,
  output [7:0]  io_cpu_resp_bits_btb_bht_history,
  output [39:0] io_cpu_resp_bits_pc,
  output [31:0] io_cpu_resp_bits_data,
  output        io_cpu_resp_bits_xcpt_pf_inst,
  output        io_cpu_resp_bits_xcpt_ae_inst,
  output        io_cpu_resp_bits_replay,
  input         io_cpu_btb_update_valid,
  input  [4:0]  io_cpu_btb_update_bits_prediction_entry,
  input  [38:0] io_cpu_btb_update_bits_pc,
  input         io_cpu_btb_update_bits_isValid,
  input  [38:0] io_cpu_btb_update_bits_br_pc,
  input  [1:0]  io_cpu_btb_update_bits_cfiType,
  input         io_cpu_bht_update_valid,
  input  [7:0]  io_cpu_bht_update_bits_prediction_history,
  input  [38:0] io_cpu_bht_update_bits_pc,
  input         io_cpu_bht_update_bits_branch,
  input         io_cpu_bht_update_bits_taken,
  input         io_cpu_bht_update_bits_mispredict,
  input         io_cpu_flush_icache,
  output [39:0] io_cpu_npc,
  input         io_cpu_progress,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
  output        io_ptw_req_bits_valid,
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
  input  [1:0]  io_ptw_status_prv,
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
  input  [31:0] io_ptw_pmp_7_mask,
  input  [63:0] io_ptw_customCSRs_csrs_0_value
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
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
`endif // RANDOMIZE_REG_INIT
  wire  icache_clock; // @[Frontend.scala 66:26]
  wire  icache_reset; // @[Frontend.scala 66:26]
  wire  icache_auto_master_out_a_ready; // @[Frontend.scala 66:26]
  wire  icache_auto_master_out_a_valid; // @[Frontend.scala 66:26]
  wire [31:0] icache_auto_master_out_a_bits_address; // @[Frontend.scala 66:26]
  wire  icache_auto_master_out_d_valid; // @[Frontend.scala 66:26]
  wire [2:0] icache_auto_master_out_d_bits_opcode; // @[Frontend.scala 66:26]
  wire [3:0] icache_auto_master_out_d_bits_size; // @[Frontend.scala 66:26]
  wire [63:0] icache_auto_master_out_d_bits_data; // @[Frontend.scala 66:26]
  wire  icache_auto_master_out_d_bits_corrupt; // @[Frontend.scala 66:26]
  wire  icache_io_req_ready; // @[Frontend.scala 66:26]
  wire  icache_io_req_valid; // @[Frontend.scala 66:26]
  wire [38:0] icache_io_req_bits_addr; // @[Frontend.scala 66:26]
  wire [31:0] icache_io_s1_paddr; // @[Frontend.scala 66:26]
  wire  icache_io_s1_kill; // @[Frontend.scala 66:26]
  wire  icache_io_s2_kill; // @[Frontend.scala 66:26]
  wire  icache_io_resp_valid; // @[Frontend.scala 66:26]
  wire [31:0] icache_io_resp_bits_data; // @[Frontend.scala 66:26]
  wire  icache_io_resp_bits_ae; // @[Frontend.scala 66:26]
  wire  icache_io_invalidate; // @[Frontend.scala 66:26]
  wire  fq_clock; // @[Frontend.scala 88:57]
  wire  fq_reset; // @[Frontend.scala 88:57]
  wire  fq_io_enq_ready; // @[Frontend.scala 88:57]
  wire  fq_io_enq_valid; // @[Frontend.scala 88:57]
  wire  fq_io_enq_bits_btb_taken; // @[Frontend.scala 88:57]
  wire  fq_io_enq_bits_btb_bridx; // @[Frontend.scala 88:57]
  wire [4:0] fq_io_enq_bits_btb_entry; // @[Frontend.scala 88:57]
  wire [7:0] fq_io_enq_bits_btb_bht_history; // @[Frontend.scala 88:57]
  wire [39:0] fq_io_enq_bits_pc; // @[Frontend.scala 88:57]
  wire [31:0] fq_io_enq_bits_data; // @[Frontend.scala 88:57]
  wire [1:0] fq_io_enq_bits_mask; // @[Frontend.scala 88:57]
  wire  fq_io_enq_bits_xcpt_pf_inst; // @[Frontend.scala 88:57]
  wire  fq_io_enq_bits_xcpt_ae_inst; // @[Frontend.scala 88:57]
  wire  fq_io_enq_bits_replay; // @[Frontend.scala 88:57]
  wire  fq_io_deq_ready; // @[Frontend.scala 88:57]
  wire  fq_io_deq_valid; // @[Frontend.scala 88:57]
  wire  fq_io_deq_bits_btb_taken; // @[Frontend.scala 88:57]
  wire  fq_io_deq_bits_btb_bridx; // @[Frontend.scala 88:57]
  wire [4:0] fq_io_deq_bits_btb_entry; // @[Frontend.scala 88:57]
  wire [7:0] fq_io_deq_bits_btb_bht_history; // @[Frontend.scala 88:57]
  wire [39:0] fq_io_deq_bits_pc; // @[Frontend.scala 88:57]
  wire [31:0] fq_io_deq_bits_data; // @[Frontend.scala 88:57]
  wire  fq_io_deq_bits_xcpt_pf_inst; // @[Frontend.scala 88:57]
  wire  fq_io_deq_bits_xcpt_ae_inst; // @[Frontend.scala 88:57]
  wire  fq_io_deq_bits_replay; // @[Frontend.scala 88:57]
  wire [4:0] fq_io_mask; // @[Frontend.scala 88:57]
  wire  tlb_clock; // @[Frontend.scala 102:19]
  wire  tlb_reset; // @[Frontend.scala 102:19]
  wire  tlb_io_req_ready; // @[Frontend.scala 102:19]
  wire  tlb_io_req_valid; // @[Frontend.scala 102:19]
  wire [39:0] tlb_io_req_bits_vaddr; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_req_bits_prv; // @[Frontend.scala 102:19]
  wire  tlb_io_resp_miss; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_resp_paddr; // @[Frontend.scala 102:19]
  wire  tlb_io_resp_pf_inst; // @[Frontend.scala 102:19]
  wire  tlb_io_resp_ae_inst; // @[Frontend.scala 102:19]
  wire  tlb_io_resp_cacheable; // @[Frontend.scala 102:19]
  wire  tlb_io_sfence_valid; // @[Frontend.scala 102:19]
  wire  tlb_io_sfence_bits_rs1; // @[Frontend.scala 102:19]
  wire  tlb_io_sfence_bits_rs2; // @[Frontend.scala 102:19]
  wire [38:0] tlb_io_sfence_bits_addr; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_req_ready; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_req_valid; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_req_bits_valid; // @[Frontend.scala 102:19]
  wire [26:0] tlb_io_ptw_req_bits_bits_addr; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_req_bits_bits_need_gpa; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_valid; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_ae_ptw; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_ae_final; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pf; // @[Frontend.scala 102:19]
  wire [43:0] tlb_io_ptw_resp_bits_pte_ppn; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_d; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_g; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_u; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_r; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_pte_v; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_resp_bits_level; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_resp_bits_homogeneous; // @[Frontend.scala 102:19]
  wire [3:0] tlb_io_ptw_ptbr_mode; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_status_debug; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_0_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_0_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_0_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_0_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_0_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_0_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_1_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_1_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_1_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_1_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_1_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_1_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_2_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_2_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_2_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_2_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_2_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_2_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_3_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_3_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_3_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_3_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_3_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_3_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_4_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_4_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_4_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_4_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_4_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_4_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_5_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_5_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_5_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_5_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_5_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_5_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_6_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_6_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_6_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_6_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_6_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_6_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_7_cfg_l; // @[Frontend.scala 102:19]
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_7_cfg_x; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_7_cfg_w; // @[Frontend.scala 102:19]
  wire  tlb_io_ptw_pmp_7_cfg_r; // @[Frontend.scala 102:19]
  wire [29:0] tlb_io_ptw_pmp_7_addr; // @[Frontend.scala 102:19]
  wire [31:0] tlb_io_ptw_pmp_7_mask; // @[Frontend.scala 102:19]
  wire  tlb_io_kill; // @[Frontend.scala 102:19]
  wire  btb_clock; // @[Frontend.scala 194:21]
  wire  btb_reset; // @[Frontend.scala 194:21]
  wire [38:0] btb_io_req_bits_addr; // @[Frontend.scala 194:21]
  wire  btb_io_resp_valid; // @[Frontend.scala 194:21]
  wire  btb_io_resp_bits_taken; // @[Frontend.scala 194:21]
  wire  btb_io_resp_bits_bridx; // @[Frontend.scala 194:21]
  wire [38:0] btb_io_resp_bits_target; // @[Frontend.scala 194:21]
  wire [4:0] btb_io_resp_bits_entry; // @[Frontend.scala 194:21]
  wire [7:0] btb_io_resp_bits_bht_history; // @[Frontend.scala 194:21]
  wire  btb_io_resp_bits_bht_value; // @[Frontend.scala 194:21]
  wire  btb_io_btb_update_valid; // @[Frontend.scala 194:21]
  wire [4:0] btb_io_btb_update_bits_prediction_entry; // @[Frontend.scala 194:21]
  wire [38:0] btb_io_btb_update_bits_pc; // @[Frontend.scala 194:21]
  wire  btb_io_btb_update_bits_isValid; // @[Frontend.scala 194:21]
  wire [38:0] btb_io_btb_update_bits_br_pc; // @[Frontend.scala 194:21]
  wire [1:0] btb_io_btb_update_bits_cfiType; // @[Frontend.scala 194:21]
  wire  btb_io_bht_update_valid; // @[Frontend.scala 194:21]
  wire [7:0] btb_io_bht_update_bits_prediction_history; // @[Frontend.scala 194:21]
  wire [38:0] btb_io_bht_update_bits_pc; // @[Frontend.scala 194:21]
  wire  btb_io_bht_update_bits_branch; // @[Frontend.scala 194:21]
  wire  btb_io_bht_update_bits_taken; // @[Frontend.scala 194:21]
  wire  btb_io_bht_update_bits_mispredict; // @[Frontend.scala 194:21]
  wire  btb_io_bht_advance_valid; // @[Frontend.scala 194:21]
  wire  btb_io_bht_advance_bits_bht_value; // @[Frontend.scala 194:21]
  wire  btb_io_ras_update_valid; // @[Frontend.scala 194:21]
  wire [1:0] btb_io_ras_update_bits_cfiType; // @[Frontend.scala 194:21]
  wire [38:0] btb_io_ras_update_bits_returnAddr; // @[Frontend.scala 194:21]
  wire  btb_io_ras_head_valid; // @[Frontend.scala 194:21]
  wire [38:0] btb_io_ras_head_bits; // @[Frontend.scala 194:21]
  wire  btb_io_flush; // @[Frontend.scala 194:21]
  wire  _T_9 = ~reset; // @[Frontend.scala 93:9]
  reg  s1_valid; // @[Frontend.scala 104:21]
  reg  s2_valid; // @[Frontend.scala 105:25]
  wire  _s0_fq_has_space_T_4 = ~s1_valid; // @[Frontend.scala 108:45]
  wire  _s0_fq_has_space_T_5 = ~s2_valid; // @[Frontend.scala 108:58]
  wire  _s0_fq_has_space_T_7 = ~fq_io_mask[3] & (~s1_valid | ~s2_valid); // @[Frontend.scala 108:41]
  wire  _s0_fq_has_space_T_8 = ~fq_io_mask[2] | _s0_fq_has_space_T_7; // @[Frontend.scala 107:40]
  wire  _s0_fq_has_space_T_14 = ~fq_io_mask[4] & (_s0_fq_has_space_T_4 & _s0_fq_has_space_T_5); // @[Frontend.scala 109:41]
  wire  s0_fq_has_space = _s0_fq_has_space_T_8 | _s0_fq_has_space_T_14; // @[Frontend.scala 108:70]
  wire  s0_valid = io_cpu_req_valid | s0_fq_has_space; // @[Frontend.scala 110:35]
  reg [39:0] s1_pc; // @[Frontend.scala 112:18]
  reg  s1_speculative; // @[Frontend.scala 113:27]
  reg [39:0] s2_pc; // @[Frontend.scala 114:22]
  reg  s2_btb_resp_valid; // @[Frontend.scala 115:44]
  reg  s2_btb_resp_bits_taken; // @[Frontend.scala 116:29]
  reg  s2_btb_resp_bits_bridx; // @[Frontend.scala 116:29]
  reg [4:0] s2_btb_resp_bits_entry; // @[Frontend.scala 116:29]
  reg [7:0] s2_btb_resp_bits_bht_history; // @[Frontend.scala 116:29]
  reg  s2_btb_resp_bits_bht_value; // @[Frontend.scala 116:29]
  wire  s2_btb_taken = s2_btb_resp_valid & s2_btb_resp_bits_taken; // @[Frontend.scala 117:40]
  reg  s2_tlb_resp_miss; // @[Frontend.scala 118:24]
  reg  s2_tlb_resp_pf_inst; // @[Frontend.scala 118:24]
  reg  s2_tlb_resp_ae_inst; // @[Frontend.scala 118:24]
  reg  s2_tlb_resp_cacheable; // @[Frontend.scala 118:24]
  wire  s2_xcpt = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst; // @[Frontend.scala 119:37]
  reg  s2_speculative; // @[Frontend.scala 120:27]
  reg  s2_partial_insn_valid; // @[Frontend.scala 121:38]
  reg [15:0] s2_partial_insn; // @[Frontend.scala 122:28]
  reg  wrong_path; // @[Frontend.scala 123:27]
  wire [39:0] _s1_base_pc_T = ~s1_pc; // @[Frontend.scala 125:22]
  wire [39:0] _s1_base_pc_T_1 = _s1_base_pc_T | 40'h3; // @[Frontend.scala 125:29]
  wire [39:0] s1_base_pc = ~_s1_base_pc_T_1; // @[Frontend.scala 125:20]
  wire [39:0] ntpc = s1_base_pc + 40'h4; // @[Frontend.scala 126:25]
  wire  _s2_replay_T = fq_io_enq_ready & fq_io_enq_valid; // @[Decoupled.scala 50:35]
  reg  s2_replay_REG; // @[Frontend.scala 131:58]
  wire  s2_replay = s2_valid & ~_s2_replay_T | s2_replay_REG; // @[Frontend.scala 131:48]
  wire  _taken_prevRVI_T_1 = s2_partial_insn[1:0] != 2'h3; // @[Frontend.scala 223:45]
  wire  taken_prevRVI = s2_partial_insn_valid & ~_taken_prevRVI_T_1; // @[Frontend.scala 224:31]
  wire [15:0] taken_bits = fq_io_enq_bits_data[15:0]; // @[Frontend.scala 226:37]
  wire [31:0] taken_rviBits = {taken_bits,s2_partial_insn}; // @[Cat.scala 31:58]
  wire  taken_rviJump = taken_rviBits[6:0] == 7'h6f; // @[Frontend.scala 230:34]
  wire  taken_rviJALR = taken_rviBits[6:0] == 7'h67; // @[Frontend.scala 231:34]
  wire  taken_rviBranch = taken_rviBits[6:0] == 7'h63; // @[Frontend.scala 229:36]
  wire  taken_valid = fq_io_enq_bits_mask[0] & ~taken_prevRVI; // @[Frontend.scala 225:44]
  wire [15:0] _taken_rvcJump_T = taken_bits & 16'he003; // @[Frontend.scala 236:26]
  wire  taken_rvcJump = 16'ha001 == _taken_rvcJump_T; // @[Frontend.scala 236:26]
  wire [15:0] _taken_rvcJALR_T = taken_bits & 16'hf003; // @[Frontend.scala 240:26]
  wire  _taken_rvcJALR_T_3 = taken_bits[6:2] == 5'h0; // @[Frontend.scala 240:62]
  wire  taken_rvcJALR = 16'h9002 == _taken_rvcJALR_T & taken_bits[6:2] == 5'h0; // @[Frontend.scala 240:49]
  wire  taken_rvcJR = 16'h8002 == _taken_rvcJALR_T & _taken_rvcJALR_T_3; // @[Frontend.scala 238:46]
  wire  taken_rvcBranch = 16'hc001 == _taken_rvcJump_T | 16'he001 == _taken_rvcJump_T; // @[Frontend.scala 234:52]
  wire  _taken_taken_T_8 = taken_valid & (taken_rvcJump | taken_rvcJALR | taken_rvcJR | taken_rvcBranch &
    s2_btb_resp_bits_bht_value); // @[Frontend.scala 246:15]
  wire  taken_taken = taken_prevRVI & (taken_rviJump | taken_rviJALR | taken_rviBranch & s2_btb_resp_bits_bht_value) |
    _taken_taken_T_8; // @[Frontend.scala 245:71]
  wire  taken_idx = ~taken_taken; // @[Frontend.scala 260:13]
  wire  _taken_T_36 = ~s2_btb_taken; // @[Frontend.scala 269:15]
  wire  _taken_prevRVI_T_4 = taken_bits[1:0] != 2'h3; // @[Frontend.scala 223:45]
  wire  _taken_prevRVI_T_5 = ~_taken_prevRVI_T_4; // @[Frontend.scala 224:34]
  wire  taken_prevRVI_1 = taken_valid & ~_taken_prevRVI_T_4; // @[Frontend.scala 224:31]
  wire [15:0] taken_bits_1 = fq_io_enq_bits_data[31:16]; // @[Frontend.scala 226:37]
  wire [31:0] taken_rviBits_1 = {taken_bits_1,taken_bits}; // @[Cat.scala 31:58]
  wire  taken_rviJALR_1 = taken_rviBits_1[6:0] == 7'h67; // @[Frontend.scala 231:34]
  wire [4:0] _taken_rviReturn_T_10 = taken_rviBits_1[19:15] & 5'h1b; // @[Frontend.scala 232:66]
  wire  taken_rviReturn_1 = taken_rviJALR_1 & ~taken_rviBits_1[7] & 5'h1 == _taken_rviReturn_T_10; // @[Frontend.scala 232:46]
  wire  taken_valid_1 = fq_io_enq_bits_mask[1] & ~taken_prevRVI_1; // @[Frontend.scala 225:44]
  wire [15:0] _taken_rvcJR_T_4 = taken_bits_1 & 16'hf003; // @[Frontend.scala 238:24]
  wire  _taken_rvcJR_T_7 = taken_bits_1[6:2] == 5'h0; // @[Frontend.scala 238:59]
  wire  taken_rvcJR_1 = 16'h8002 == _taken_rvcJR_T_4 & taken_bits_1[6:2] == 5'h0; // @[Frontend.scala 238:46]
  wire [4:0] _taken_rvcReturn_T_4 = taken_bits_1[11:7] & 5'h1b; // @[Frontend.scala 239:49]
  wire  taken_rvcReturn_1 = taken_rvcJR_1 & 5'h1 == _taken_rvcReturn_T_4; // @[Frontend.scala 239:29]
  wire  taken_predictReturn_1 = btb_io_ras_head_valid & (taken_prevRVI_1 & taken_rviReturn_1 | taken_valid_1 &
    taken_rvcReturn_1); // @[Frontend.scala 247:49]
  wire [4:0] _taken_rviReturn_T_4 = taken_rviBits[19:15] & 5'h1b; // @[Frontend.scala 232:66]
  wire  taken_rviReturn = taken_rviJALR & ~taken_rviBits[7] & 5'h1 == _taken_rviReturn_T_4; // @[Frontend.scala 232:46]
  wire [4:0] _taken_rvcReturn_T_1 = taken_bits[11:7] & 5'h1b; // @[Frontend.scala 239:49]
  wire  taken_rvcReturn = taken_rvcJR & 5'h1 == _taken_rvcReturn_T_1; // @[Frontend.scala 239:29]
  wire  taken_predictReturn = btb_io_ras_head_valid & (taken_prevRVI & taken_rviReturn | taken_valid & taken_rvcReturn); // @[Frontend.scala 247:49]
  wire  _taken_T_16 = s2_valid & taken_predictReturn; // @[Frontend.scala 273:26]
  wire  _GEN_56 = ~s2_btb_taken & _taken_T_16; // @[Frontend.scala 269:30]
  wire  _GEN_89 = s2_valid & taken_predictReturn_1 | _GEN_56; // @[Frontend.scala 273:44 274:20]
  wire  _GEN_92 = ~s2_btb_taken ? _GEN_89 : ~s2_btb_taken & _taken_T_16; // @[Frontend.scala 269:30]
  wire  useRAS = taken_idx ? _GEN_92 : _GEN_56; // @[Frontend.scala 260:25]
  wire  taken_rviBranch_1 = taken_rviBits_1[6:0] == 7'h63; // @[Frontend.scala 229:36]
  wire [15:0] _taken_rvcBranch_T_4 = taken_bits_1 & 16'he003; // @[Frontend.scala 234:28]
  wire  taken_rvcBranch_1 = 16'hc001 == _taken_rvcBranch_T_4 | 16'he001 == _taken_rvcBranch_T_4; // @[Frontend.scala 234:52]
  wire  _taken_predictBranch_T_5 = taken_prevRVI_1 & taken_rviBranch_1 | taken_valid_1 & taken_rvcBranch_1; // @[Frontend.scala 249:66]
  wire  taken_predictBranch_1 = s2_btb_resp_bits_bht_value & (taken_prevRVI_1 & taken_rviBranch_1 | taken_valid_1 &
    taken_rvcBranch_1); // @[Frontend.scala 249:41]
  wire  taken_rviJump_1 = taken_rviBits_1[6:0] == 7'h6f; // @[Frontend.scala 230:34]
  wire  taken_rvcJump_1 = 16'ha001 == _taken_rvcBranch_T_4; // @[Frontend.scala 236:26]
  wire  taken_predictJump_1 = taken_prevRVI_1 & taken_rviJump_1 | taken_valid_1 & taken_rvcJump_1; // @[Frontend.scala 248:44]
  wire [39:0] _s2_base_pc_T = ~s2_pc; // @[Frontend.scala 216:24]
  wire [39:0] _s2_base_pc_T_1 = _s2_base_pc_T | 40'h3; // @[Frontend.scala 216:31]
  wire [39:0] s2_base_pc = ~_s2_base_pc_T_1; // @[Frontend.scala 216:22]
  wire [39:0] taken_pc_1 = s2_base_pc | 40'h2; // @[Frontend.scala 277:33]
  wire [39:0] _taken_npc_T_6 = taken_pc_1 - 40'h2; // @[Frontend.scala 280:36]
  wire [39:0] _taken_npc_T_8 = taken_prevRVI_1 ? _taken_npc_T_6 : taken_pc_1; // @[Frontend.scala 280:57]
  wire  taken_rviImm_sign_2 = taken_rviBits_1[31]; // @[RocketCore.scala 1086:53]
  wire  taken_rviImm_hi_hi_hi_2 = taken_rviBits_1[31]; // @[Cat.scala 31:58]
  wire [10:0] taken_rviImm_hi_hi_lo_2 = {11{taken_rviImm_sign_2}}; // @[Cat.scala 31:58]
  wire [7:0] taken_rviImm_hi_lo_hi_2 = taken_rviBits_1[19:12]; // @[Cat.scala 31:58]
  wire  taken_rviImm_hi_lo_lo_2 = taken_rviBits_1[20]; // @[Cat.scala 31:58]
  wire [5:0] taken_rviImm_b10_5_2 = taken_rviBits_1[30:25]; // @[RocketCore.scala 1092:66]
  wire [3:0] taken_rviImm_b4_1_2 = taken_rviBits_1[24:21]; // @[RocketCore.scala 1095:52]
  wire [31:0] _taken_rviImm_T_7 = {taken_rviImm_hi_hi_hi_2,taken_rviImm_hi_hi_lo_2,taken_rviImm_hi_lo_hi_2,
    taken_rviImm_hi_lo_lo_2,taken_rviImm_b10_5_2,taken_rviImm_b4_1_2,1'h0}; // @[RocketCore.scala 1100:53]
  wire [7:0] taken_rviImm_hi_lo_hi_3 = {8{taken_rviImm_sign_2}}; // @[Cat.scala 31:58]
  wire  taken_rviImm_hi_lo_lo_3 = taken_rviBits_1[7]; // @[Cat.scala 31:58]
  wire [31:0] _taken_rviImm_T_9 = {taken_rviImm_hi_hi_hi_2,taken_rviImm_hi_hi_lo_2,taken_rviImm_hi_lo_hi_3,
    taken_rviImm_hi_lo_lo_3,taken_rviImm_b10_5_2,taken_rviBits_1[11:8],1'h0}; // @[RocketCore.scala 1100:53]
  wire [31:0] taken_rviImm_1 = taken_rviBits_1[3] ? $signed(_taken_rviImm_T_7) : $signed(_taken_rviImm_T_9); // @[Frontend.scala 242:23]
  wire [4:0] _taken_rvcImm_T_25 = taken_bits_1[12] ? 5'h1f : 5'h0; // @[Bitwise.scala 74:12]
  wire [12:0] _taken_rvcImm_T_31 = {_taken_rvcImm_T_25,taken_bits_1[6:5],taken_bits_1[2],taken_bits_1[11:10],
    taken_bits_1[4:3],1'h0}; // @[Frontend.scala 237:66]
  wire [9:0] _taken_rvcImm_T_34 = taken_bits_1[12] ? 10'h3ff : 10'h0; // @[Bitwise.scala 74:12]
  wire [20:0] _taken_rvcImm_T_43 = {_taken_rvcImm_T_34,taken_bits_1[8],taken_bits_1[10:9],taken_bits_1[6],taken_bits_1[7
    ],taken_bits_1[2],taken_bits_1[11],taken_bits_1[5:3],1'h0}; // @[Frontend.scala 237:106]
  wire [20:0] taken_rvcImm_1 = taken_bits_1[14] ? $signed({{8{_taken_rvcImm_T_31[12]}},_taken_rvcImm_T_31}) : $signed(
    _taken_rvcImm_T_43); // @[Frontend.scala 237:23]
  wire [31:0] _taken_npc_T_9 = taken_prevRVI_1 ? $signed(taken_rviImm_1) : $signed({{11{taken_rvcImm_1[20]}},
    taken_rvcImm_1}); // @[Frontend.scala 280:69]
  wire [39:0] _GEN_142 = {{8{_taken_npc_T_9[31]}},_taken_npc_T_9}; // @[Frontend.scala 280:64]
  wire [39:0] _taken_predicted_npc_T_1 = $signed(_taken_npc_T_8) + $signed(_GEN_142); // @[Frontend.scala 281:34]
  wire  _taken_predictBranch_T_2 = taken_prevRVI & taken_rviBranch | taken_valid & taken_rvcBranch; // @[Frontend.scala 249:66]
  wire  taken_predictBranch = s2_btb_resp_bits_bht_value & (taken_prevRVI & taken_rviBranch | taken_valid &
    taken_rvcBranch); // @[Frontend.scala 249:41]
  wire  taken_predictJump = taken_prevRVI & taken_rviJump | taken_valid & taken_rvcJump; // @[Frontend.scala 248:44]
  wire [39:0] _taken_npc_T = ~_s2_base_pc_T_1; // @[Frontend.scala 279:32]
  wire  taken_rviImm_sign = taken_rviBits[31]; // @[RocketCore.scala 1086:53]
  wire  taken_rviImm_hi_hi_hi = taken_rviBits[31]; // @[Cat.scala 31:58]
  wire [10:0] taken_rviImm_hi_hi_lo = {11{taken_rviImm_sign}}; // @[Cat.scala 31:58]
  wire [7:0] taken_rviImm_hi_lo_hi = taken_rviBits[19:12]; // @[Cat.scala 31:58]
  wire  taken_rviImm_hi_lo_lo = taken_rviBits[20]; // @[Cat.scala 31:58]
  wire [5:0] taken_rviImm_b10_5 = taken_rviBits[30:25]; // @[RocketCore.scala 1092:66]
  wire [3:0] taken_rviImm_b4_1 = taken_rviBits[24:21]; // @[RocketCore.scala 1095:52]
  wire [31:0] _taken_rviImm_T_2 = {taken_rviImm_hi_hi_hi,taken_rviImm_hi_hi_lo,taken_rviImm_hi_lo_hi,
    taken_rviImm_hi_lo_lo,taken_rviImm_b10_5,taken_rviImm_b4_1,1'h0}; // @[RocketCore.scala 1100:53]
  wire [7:0] taken_rviImm_hi_lo_hi_1 = {8{taken_rviImm_sign}}; // @[Cat.scala 31:58]
  wire  taken_rviImm_hi_lo_lo_1 = taken_rviBits[7]; // @[Cat.scala 31:58]
  wire [31:0] _taken_rviImm_T_4 = {taken_rviImm_hi_hi_hi,taken_rviImm_hi_hi_lo,taken_rviImm_hi_lo_hi_1,
    taken_rviImm_hi_lo_lo_1,taken_rviImm_b10_5,taken_rviBits[11:8],1'h0}; // @[RocketCore.scala 1100:53]
  wire [31:0] taken_rviImm = taken_rviBits[3] ? $signed(_taken_rviImm_T_2) : $signed(_taken_rviImm_T_4); // @[Frontend.scala 242:23]
  wire [32:0] _taken_npc_T_1 = $signed(taken_rviImm) - 32'sh2; // @[Frontend.scala 279:61]
  wire [4:0] _taken_rvcImm_T_3 = taken_bits[12] ? 5'h1f : 5'h0; // @[Bitwise.scala 74:12]
  wire [12:0] _taken_rvcImm_T_9 = {_taken_rvcImm_T_3,taken_bits[6:5],taken_bits[2],taken_bits[11:10],taken_bits[4:3],1'h0
    }; // @[Frontend.scala 237:66]
  wire [9:0] _taken_rvcImm_T_12 = taken_bits[12] ? 10'h3ff : 10'h0; // @[Bitwise.scala 74:12]
  wire [20:0] _taken_rvcImm_T_21 = {_taken_rvcImm_T_12,taken_bits[8],taken_bits[10:9],taken_bits[6],taken_bits[7],
    taken_bits[2],taken_bits[11],taken_bits[5:3],1'h0}; // @[Frontend.scala 237:106]
  wire [20:0] taken_rvcImm = taken_bits[14] ? $signed({{8{_taken_rvcImm_T_9[12]}},_taken_rvcImm_T_9}) : $signed(
    _taken_rvcImm_T_21); // @[Frontend.scala 237:23]
  wire [32:0] _taken_npc_T_2 = taken_prevRVI ? $signed(_taken_npc_T_1) : $signed({{12{taken_rvcImm[20]}},taken_rvcImm}); // @[Frontend.scala 279:44]
  wire [39:0] _GEN_143 = {{7{_taken_npc_T_2[32]}},_taken_npc_T_2}; // @[Frontend.scala 279:39]
  wire [39:0] _taken_predicted_npc_T = $signed(_taken_npc_T) + $signed(_GEN_143); // @[Frontend.scala 281:34]
  wire  predicted_taken = btb_io_resp_valid & btb_io_resp_bits_taken; // @[Frontend.scala 207:29]
  wire [39:0] _predicted_npc_T_1 = {btb_io_resp_bits_target[38],btb_io_resp_bits_target}; // @[Cat.scala 31:58]
  wire [39:0] _GEN_39 = predicted_taken ? _predicted_npc_T_1 : ntpc; // @[Frontend.scala 207:56 208:21]
  wire [39:0] _GEN_54 = s2_valid & (taken_predictBranch | taken_predictJump) ? _taken_predicted_npc_T : _GEN_39; // @[Frontend.scala 276:61 281:27]
  wire [39:0] _GEN_57 = ~s2_btb_taken ? _GEN_54 : _GEN_39; // @[Frontend.scala 269:30]
  wire [39:0] _GEN_90 = s2_valid & (taken_predictBranch_1 | taken_predictJump_1) ? _taken_predicted_npc_T_1 : _GEN_57; // @[Frontend.scala 276:61 281:27]
  wire [39:0] _GEN_93 = ~s2_btb_taken ? _GEN_90 : _GEN_57; // @[Frontend.scala 269:30]
  wire [39:0] _GEN_110 = taken_idx ? _GEN_93 : _GEN_57; // @[Frontend.scala 260:25]
  wire [39:0] predicted_npc = useRAS ? {{1'd0}, btb_io_ras_head_bits} : _GEN_110; // @[Frontend.scala 320:19 321:21]
  wire [39:0] npc = s2_replay ? s2_pc : predicted_npc; // @[Frontend.scala 132:16]
  wire  s0_speculative = s1_speculative | s2_valid & ~s2_speculative | predicted_taken; // @[Frontend.scala 138:72]
  wire  _T_11 = ~s2_replay; // @[Frontend.scala 144:9]
  wire  taken_rvcJALR_1 = 16'h9002 == _taken_rvcJR_T_4 & _taken_rvcJR_T_7; // @[Frontend.scala 240:49]
  wire  _taken_taken_T_17 = taken_valid_1 & (taken_rvcJump_1 | taken_rvcJALR_1 | taken_rvcJR_1 | taken_rvcBranch_1 &
    s2_btb_resp_bits_bht_value); // @[Frontend.scala 246:15]
  wire  taken_taken_1 = taken_prevRVI_1 & (taken_rviJump_1 | taken_rviJALR_1 | taken_rviBranch_1 &
    s2_btb_resp_bits_bht_value) | _taken_taken_T_17; // @[Frontend.scala 245:71]
  wire  taken = taken_taken | taken_taken_1; // @[Frontend.scala 301:19]
  wire  _GEN_127 = _s2_replay_T | io_cpu_req_valid; // @[Frontend.scala 331:{33,47}]
  wire  _GEN_131 = taken ? _GEN_127 : io_cpu_req_valid; // @[Frontend.scala 327:20]
  wire  s2_redirect = _taken_T_36 ? _GEN_131 : io_cpu_req_valid; // @[Frontend.scala 326:26]
  wire  _GEN_0 = ~s2_replay & ~s2_redirect; // @[Frontend.scala 143:12 144:21 145:14]
  reg [1:0] recent_progress_counter; // @[Frontend.scala 152:40]
  wire  recent_progress = recent_progress_counter > 2'h0; // @[Frontend.scala 153:49]
  wire  _T_12 = io_ptw_req_ready & io_ptw_req_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _recent_progress_counter_T_1 = recent_progress_counter - 2'h1; // @[Frontend.scala 154:97]
  wire  s2_kill_speculative_tlb_refill = s2_speculative & ~recent_progress; // @[Frontend.scala 157:55]
  wire  s2_can_speculatively_refill = s2_tlb_resp_cacheable & ~io_ptw_customCSRs_csrs_0_value[3]; // @[Frontend.scala 175:59]
  reg  fq_io_enq_valid_REG; // @[Frontend.scala 180:29]
  wire  _fq_io_enq_valid_T_1 = s2_kill_speculative_tlb_refill & s2_tlb_resp_miss; // @[Frontend.scala 180:112]
  wire [39:0] _io_cpu_npc_T = io_cpu_req_valid ? io_cpu_req_bits_pc : npc; // @[Frontend.scala 182:28]
  wire [39:0] _io_cpu_npc_T_1 = ~_io_cpu_npc_T; // @[Frontend.scala 371:29]
  wire [39:0] _io_cpu_npc_T_2 = _io_cpu_npc_T_1 | 40'h1; // @[Frontend.scala 371:33]
  wire [2:0] _fq_io_enq_bits_mask_T_1 = 3'h3 << s2_pc[1]; // @[Frontend.scala 185:52]
  wire  fetch_bubble_likely = ~fq_io_mask[1]; // @[Frontend.scala 308:33]
  wire  _btb_io_btb_update_valid_T_2 = _s2_replay_T & ~wrong_path; // @[Frontend.scala 309:51]
  wire  _taken_T_27 = ~s2_btb_resp_valid & (taken_predictBranch & s2_btb_resp_bits_bht_value | taken_predictJump |
    taken_predictReturn); // @[Frontend.scala 288:34]
  wire  _GEN_103 = ~s2_btb_resp_valid & (taken_predictBranch_1 & s2_btb_resp_bits_bht_value | taken_predictJump_1 |
    taken_predictReturn_1) | ~s2_btb_resp_valid & (taken_predictBranch & s2_btb_resp_bits_bht_value | taken_predictJump
     | taken_predictReturn); // @[Frontend.scala 288:125 289:21]
  wire  updateBTB = taken_idx ? _GEN_103 : _taken_T_27; // @[Frontend.scala 260:25]
  wire [1:0] _btb_io_btb_update_bits_br_pc_T = {taken_idx, 1'h0}; // @[Frontend.scala 313:63]
  wire [39:0] _GEN_144 = {{38'd0}, _btb_io_btb_update_bits_br_pc_T}; // @[Frontend.scala 313:50]
  wire [39:0] _btb_io_btb_update_bits_br_pc_T_1 = s2_base_pc | _GEN_144; // @[Frontend.scala 313:50]
  wire [39:0] _GEN_47 = ~io_cpu_btb_update_valid ? _btb_io_btb_update_bits_br_pc_T_1 : {{1'd0},
    io_cpu_btb_update_bits_br_pc}; // @[Frontend.scala 198:23 307:37 313:36]
  wire [39:0] _GEN_48 = ~io_cpu_btb_update_valid ? s2_base_pc : {{1'd0}, io_cpu_btb_update_bits_pc}; // @[Frontend.scala 198:23 307:37 314:33]
  wire [1:0] after_idx = taken_idx ? 2'h2 : 2'h1; // @[Frontend.scala 260:25 262:19]
  wire [2:0] _btb_io_ras_update_bits_returnAddr_T = {after_idx, 1'h0}; // @[Frontend.scala 317:66]
  wire [39:0] _GEN_145 = {{37'd0}, _btb_io_ras_update_bits_returnAddr_T}; // @[Frontend.scala 317:53]
  wire [39:0] _btb_io_ras_update_bits_returnAddr_T_2 = s2_base_pc + _GEN_145; // @[Frontend.scala 317:53]
  wire  taken_rviCall = (taken_rviJALR | taken_rviJump) & taken_rviBits[7]; // @[Frontend.scala 233:42]
  wire  _GEN_50 = s2_valid & s2_btb_resp_valid & ~s2_btb_resp_bits_bridx & taken_valid & _taken_prevRVI_T_5 | (
    icache_io_s2_kill & ~icache_io_resp_valid & ~s2_xcpt | _fq_io_enq_valid_T_1); // @[Frontend.scala 186:25 251:95 255:31]
  wire  _GEN_51 = s2_valid & s2_btb_resp_valid & ~s2_btb_resp_bits_bridx & taken_valid & _taken_prevRVI_T_5 | wrong_path
    ; // @[Frontend.scala 251:95 256:20 123:27]
  wire  _taken_btb_io_ras_update_bits_cfiType_T = taken_prevRVI ? taken_rviReturn : taken_rvcReturn; // @[Frontend.scala 264:50]
  wire  _taken_btb_io_ras_update_bits_cfiType_T_1 = taken_prevRVI ? taken_rviCall : taken_rvcJALR; // @[Frontend.scala 265:50]
  wire  _taken_btb_io_ras_update_bits_cfiType_T_2 = taken_prevRVI ? taken_rviBranch : taken_rvcBranch; // @[Frontend.scala 266:50]
  wire  _taken_btb_io_ras_update_bits_cfiType_T_5 = _taken_btb_io_ras_update_bits_cfiType_T_2 ? 1'h0 : 1'h1; // @[Frontend.scala 266:46]
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_6 = _taken_btb_io_ras_update_bits_cfiType_T_1 ? 2'h2 : {{1'd0},
    _taken_btb_io_ras_update_bits_cfiType_T_5}; // @[Frontend.scala 265:46]
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_7 = _taken_btb_io_ras_update_bits_cfiType_T ? 2'h3 :
    _taken_btb_io_ras_update_bits_cfiType_T_6; // @[Frontend.scala 264:46]
  wire  _GEN_52 = _s2_replay_T & taken_taken & ~taken_predictBranch & ~taken_predictJump & ~taken_predictReturn |
    _GEN_51; // @[Frontend.scala 270:96 271:24]
  wire  _GEN_55 = ~s2_btb_taken ? _GEN_52 : _GEN_51; // @[Frontend.scala 269:30]
  wire  _GEN_58 = _taken_predictBranch_T_2 & _btb_io_btb_update_valid_T_2; // @[Frontend.scala 201:30 284:59 285:36]
  wire  taken_rvc_1 = taken_bits_1[1:0] != 2'h3; // @[Frontend.scala 223:45]
  wire  taken_rviCall_1 = (taken_rviJALR_1 | taken_rviJump_1) & taken_rviBits_1[7]; // @[Frontend.scala 233:42]
  wire  _taken_T_33 = ~taken_rvc_1; // @[Frontend.scala 251:89]
  wire  _GEN_87 = s2_valid & s2_btb_resp_valid & s2_btb_resp_bits_bridx & taken_valid_1 & ~taken_rvc_1 | _GEN_55; // @[Frontend.scala 251:95 256:20]
  wire  _taken_btb_io_ras_update_bits_cfiType_T_8 = taken_prevRVI_1 ? taken_rviReturn_1 : taken_rvcReturn_1; // @[Frontend.scala 264:50]
  wire  _taken_btb_io_ras_update_bits_cfiType_T_9 = taken_prevRVI_1 ? taken_rviCall_1 : taken_rvcJALR_1; // @[Frontend.scala 265:50]
  wire  _taken_btb_io_ras_update_bits_cfiType_T_10 = taken_prevRVI_1 ? taken_rviBranch_1 : taken_rvcBranch_1; // @[Frontend.scala 266:50]
  wire  _taken_btb_io_ras_update_bits_cfiType_T_13 = _taken_btb_io_ras_update_bits_cfiType_T_10 ? 1'h0 : 1'h1; // @[Frontend.scala 266:46]
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_14 = _taken_btb_io_ras_update_bits_cfiType_T_9 ? 2'h2 : {{1'd0},
    _taken_btb_io_ras_update_bits_cfiType_T_13}; // @[Frontend.scala 265:46]
  wire [1:0] _taken_btb_io_ras_update_bits_cfiType_T_15 = _taken_btb_io_ras_update_bits_cfiType_T_8 ? 2'h3 :
    _taken_btb_io_ras_update_bits_cfiType_T_14; // @[Frontend.scala 264:46]
  wire  _GEN_88 = _s2_replay_T & taken_taken_1 & ~taken_predictBranch_1 & ~taken_predictJump_1 & ~taken_predictReturn_1
     | _GEN_87; // @[Frontend.scala 270:96 271:24]
  wire  _GEN_94 = _taken_predictBranch_T_5 ? _btb_io_btb_update_valid_T_2 : _GEN_58; // @[Frontend.scala 284:59 285:36]
  wire  _taken_T_61 = taken_valid_1 & taken_idx & _taken_T_33; // @[Frontend.scala 296:37]
  wire [15:0] _taken_s2_partial_insn_T = taken_bits_1 | 16'h3; // @[Frontend.scala 298:37]
  wire  _GEN_128 = taken ? taken_idx : s2_btb_resp_bits_bridx; // @[Frontend.scala 327:20 187:22 328:34]
  wire  _GEN_129 = taken | s2_btb_taken; // @[Frontend.scala 327:20 188:28 329:34]
  wire [4:0] _GEN_130 = taken ? 5'h1c : s2_btb_resp_bits_entry; // @[Frontend.scala 327:20 187:22 330:34]
  ICache icache ( // @[Frontend.scala 66:26]
    .clock(icache_clock),
    .reset(icache_reset),
    .auto_master_out_a_ready(icache_auto_master_out_a_ready),
    .auto_master_out_a_valid(icache_auto_master_out_a_valid),
    .auto_master_out_a_bits_address(icache_auto_master_out_a_bits_address),
    .auto_master_out_d_valid(icache_auto_master_out_d_valid),
    .auto_master_out_d_bits_opcode(icache_auto_master_out_d_bits_opcode),
    .auto_master_out_d_bits_size(icache_auto_master_out_d_bits_size),
    .auto_master_out_d_bits_data(icache_auto_master_out_d_bits_data),
    .auto_master_out_d_bits_corrupt(icache_auto_master_out_d_bits_corrupt),
    .io_req_ready(icache_io_req_ready),
    .io_req_valid(icache_io_req_valid),
    .io_req_bits_addr(icache_io_req_bits_addr),
    .io_s1_paddr(icache_io_s1_paddr),
    .io_s1_kill(icache_io_s1_kill),
    .io_s2_kill(icache_io_s2_kill),
    .io_resp_valid(icache_io_resp_valid),
    .io_resp_bits_data(icache_io_resp_bits_data),
    .io_resp_bits_ae(icache_io_resp_bits_ae),
    .io_invalidate(icache_io_invalidate)
  );
  ShiftQueue fq ( // @[Frontend.scala 88:57]
    .clock(fq_clock),
    .reset(fq_reset),
    .io_enq_ready(fq_io_enq_ready),
    .io_enq_valid(fq_io_enq_valid),
    .io_enq_bits_btb_taken(fq_io_enq_bits_btb_taken),
    .io_enq_bits_btb_bridx(fq_io_enq_bits_btb_bridx),
    .io_enq_bits_btb_entry(fq_io_enq_bits_btb_entry),
    .io_enq_bits_btb_bht_history(fq_io_enq_bits_btb_bht_history),
    .io_enq_bits_pc(fq_io_enq_bits_pc),
    .io_enq_bits_data(fq_io_enq_bits_data),
    .io_enq_bits_mask(fq_io_enq_bits_mask),
    .io_enq_bits_xcpt_pf_inst(fq_io_enq_bits_xcpt_pf_inst),
    .io_enq_bits_xcpt_ae_inst(fq_io_enq_bits_xcpt_ae_inst),
    .io_enq_bits_replay(fq_io_enq_bits_replay),
    .io_deq_ready(fq_io_deq_ready),
    .io_deq_valid(fq_io_deq_valid),
    .io_deq_bits_btb_taken(fq_io_deq_bits_btb_taken),
    .io_deq_bits_btb_bridx(fq_io_deq_bits_btb_bridx),
    .io_deq_bits_btb_entry(fq_io_deq_bits_btb_entry),
    .io_deq_bits_btb_bht_history(fq_io_deq_bits_btb_bht_history),
    .io_deq_bits_pc(fq_io_deq_bits_pc),
    .io_deq_bits_data(fq_io_deq_bits_data),
    .io_deq_bits_xcpt_pf_inst(fq_io_deq_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_ae_inst(fq_io_deq_bits_xcpt_ae_inst),
    .io_deq_bits_replay(fq_io_deq_bits_replay),
    .io_mask(fq_io_mask)
  );
  TLB_1 tlb ( // @[Frontend.scala 102:19]
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_req_bits_prv(tlb_io_req_bits_prv),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_inst(tlb_io_resp_pf_inst),
    .io_resp_ae_inst(tlb_io_resp_ae_inst),
    .io_resp_cacheable(tlb_io_resp_cacheable),
    .io_sfence_valid(tlb_io_sfence_valid),
    .io_sfence_bits_rs1(tlb_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(tlb_io_sfence_bits_rs2),
    .io_sfence_bits_addr(tlb_io_sfence_bits_addr),
    .io_ptw_req_ready(tlb_io_ptw_req_ready),
    .io_ptw_req_valid(tlb_io_ptw_req_valid),
    .io_ptw_req_bits_valid(tlb_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(tlb_io_ptw_req_bits_bits_addr),
    .io_ptw_req_bits_bits_need_gpa(tlb_io_ptw_req_bits_bits_need_gpa),
    .io_ptw_resp_valid(tlb_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae_ptw(tlb_io_ptw_resp_bits_ae_ptw),
    .io_ptw_resp_bits_ae_final(tlb_io_ptw_resp_bits_ae_final),
    .io_ptw_resp_bits_pf(tlb_io_ptw_resp_bits_pf),
    .io_ptw_resp_bits_pte_ppn(tlb_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(tlb_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(tlb_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(tlb_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(tlb_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(tlb_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(tlb_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(tlb_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(tlb_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(tlb_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_homogeneous(tlb_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(tlb_io_ptw_ptbr_mode),
    .io_ptw_status_debug(tlb_io_ptw_status_debug),
    .io_ptw_pmp_0_cfg_l(tlb_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(tlb_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(tlb_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(tlb_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(tlb_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(tlb_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(tlb_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(tlb_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(tlb_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(tlb_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(tlb_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(tlb_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(tlb_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(tlb_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(tlb_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(tlb_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(tlb_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(tlb_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(tlb_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(tlb_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(tlb_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(tlb_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(tlb_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(tlb_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(tlb_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(tlb_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(tlb_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(tlb_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(tlb_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(tlb_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(tlb_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(tlb_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(tlb_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(tlb_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(tlb_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(tlb_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(tlb_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(tlb_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(tlb_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(tlb_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(tlb_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(tlb_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(tlb_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(tlb_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(tlb_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(tlb_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(tlb_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(tlb_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(tlb_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(tlb_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(tlb_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(tlb_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(tlb_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(tlb_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(tlb_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(tlb_io_ptw_pmp_7_mask),
    .io_kill(tlb_io_kill)
  );
  BTB btb ( // @[Frontend.scala 194:21]
    .clock(btb_clock),
    .reset(btb_reset),
    .io_req_bits_addr(btb_io_req_bits_addr),
    .io_resp_valid(btb_io_resp_valid),
    .io_resp_bits_taken(btb_io_resp_bits_taken),
    .io_resp_bits_bridx(btb_io_resp_bits_bridx),
    .io_resp_bits_target(btb_io_resp_bits_target),
    .io_resp_bits_entry(btb_io_resp_bits_entry),
    .io_resp_bits_bht_history(btb_io_resp_bits_bht_history),
    .io_resp_bits_bht_value(btb_io_resp_bits_bht_value),
    .io_btb_update_valid(btb_io_btb_update_valid),
    .io_btb_update_bits_prediction_entry(btb_io_btb_update_bits_prediction_entry),
    .io_btb_update_bits_pc(btb_io_btb_update_bits_pc),
    .io_btb_update_bits_isValid(btb_io_btb_update_bits_isValid),
    .io_btb_update_bits_br_pc(btb_io_btb_update_bits_br_pc),
    .io_btb_update_bits_cfiType(btb_io_btb_update_bits_cfiType),
    .io_bht_update_valid(btb_io_bht_update_valid),
    .io_bht_update_bits_prediction_history(btb_io_bht_update_bits_prediction_history),
    .io_bht_update_bits_pc(btb_io_bht_update_bits_pc),
    .io_bht_update_bits_branch(btb_io_bht_update_bits_branch),
    .io_bht_update_bits_taken(btb_io_bht_update_bits_taken),
    .io_bht_update_bits_mispredict(btb_io_bht_update_bits_mispredict),
    .io_bht_advance_valid(btb_io_bht_advance_valid),
    .io_bht_advance_bits_bht_value(btb_io_bht_advance_bits_bht_value),
    .io_ras_update_valid(btb_io_ras_update_valid),
    .io_ras_update_bits_cfiType(btb_io_ras_update_bits_cfiType),
    .io_ras_update_bits_returnAddr(btb_io_ras_update_bits_returnAddr),
    .io_ras_head_valid(btb_io_ras_head_valid),
    .io_ras_head_bits(btb_io_ras_head_bits),
    .io_flush(btb_io_flush)
  );
  assign auto_icache_master_out_a_valid = icache_auto_master_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_icache_master_out_a_bits_address = icache_auto_master_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign io_cpu_resp_valid = fq_io_deq_valid; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_btb_taken = fq_io_deq_bits_btb_taken; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_btb_bridx = fq_io_deq_bits_btb_bridx; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_btb_entry = fq_io_deq_bits_btb_entry; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_btb_bht_history = fq_io_deq_bits_btb_bht_history; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_pc = fq_io_deq_bits_pc; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_data = fq_io_deq_bits_data; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_xcpt_pf_inst = fq_io_deq_bits_xcpt_pf_inst; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_xcpt_ae_inst = fq_io_deq_bits_xcpt_ae_inst; // @[Frontend.scala 340:15]
  assign io_cpu_resp_bits_replay = fq_io_deq_bits_replay; // @[Frontend.scala 340:15]
  assign io_cpu_npc = ~_io_cpu_npc_T_2; // @[Frontend.scala 371:27]
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; // @[Frontend.scala 159:10]
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid; // @[Frontend.scala 159:10]
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; // @[Frontend.scala 159:10]
  assign io_ptw_req_bits_bits_need_gpa = tlb_io_ptw_req_bits_bits_need_gpa; // @[Frontend.scala 159:10]
  assign icache_clock = clock; // @[Frontend.scala 98:16]
  assign icache_reset = reset;
  assign icache_auto_master_out_a_ready = auto_icache_master_out_a_ready; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_valid = auto_icache_master_out_d_valid; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_opcode = auto_icache_master_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_size = auto_icache_master_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_data = auto_icache_master_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign icache_auto_master_out_d_bits_corrupt = auto_icache_master_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign icache_io_req_valid = io_cpu_req_valid | s0_fq_has_space; // @[Frontend.scala 110:35]
  assign icache_io_req_bits_addr = io_cpu_npc[38:0]; // @[Frontend.scala 170:27]
  assign icache_io_s1_paddr = tlb_io_resp_paddr; // @[Frontend.scala 172:22]
  assign icache_io_s1_kill = s2_redirect | tlb_io_resp_miss | s2_replay; // @[Frontend.scala 174:56]
  assign icache_io_s2_kill = s2_speculative & ~s2_can_speculatively_refill | s2_xcpt; // @[Frontend.scala 176:71]
  assign icache_io_invalidate = io_cpu_flush_icache; // @[Frontend.scala 171:24]
  assign fq_clock = clock;
  assign fq_reset = reset | io_cpu_req_valid; // @[Frontend.scala 88:28]
  assign fq_io_enq_valid = fq_io_enq_valid_REG & s2_valid & (icache_io_resp_valid | s2_kill_speculative_tlb_refill &
    s2_tlb_resp_miss | ~s2_tlb_resp_miss & icache_io_s2_kill); // @[Frontend.scala 180:52]
  assign fq_io_enq_bits_btb_taken = _taken_T_36 ? _GEN_129 : s2_btb_taken; // @[Frontend.scala 326:26 188:28]
  assign fq_io_enq_bits_btb_bridx = _taken_T_36 ? _GEN_128 : s2_btb_resp_bits_bridx; // @[Frontend.scala 187:22 326:26]
  assign fq_io_enq_bits_btb_entry = _taken_T_36 ? _GEN_130 : s2_btb_resp_bits_entry; // @[Frontend.scala 187:22 326:26]
  assign fq_io_enq_bits_btb_bht_history = s2_btb_resp_bits_bht_history; // @[Frontend.scala 187:22]
  assign fq_io_enq_bits_pc = s2_pc; // @[Frontend.scala 181:21]
  assign fq_io_enq_bits_data = icache_io_resp_bits_data; // @[Frontend.scala 184:23]
  assign fq_io_enq_bits_mask = _fq_io_enq_bits_mask_T_1[1:0]; // @[Frontend.scala 185:23]
  assign fq_io_enq_bits_xcpt_pf_inst = s2_tlb_resp_pf_inst; // @[Frontend.scala 189:23]
  assign fq_io_enq_bits_xcpt_ae_inst = icache_io_resp_valid & icache_io_resp_bits_ae | s2_tlb_resp_ae_inst; // @[Frontend.scala 189:23 191:{57,87}]
  assign fq_io_enq_bits_replay = s2_valid & s2_btb_resp_valid & s2_btb_resp_bits_bridx & taken_valid_1 & ~taken_rvc_1 |
    _GEN_50; // @[Frontend.scala 251:95 255:31]
  assign fq_io_deq_ready = io_cpu_resp_ready; // @[Frontend.scala 340:15]
  assign tlb_clock = clock;
  assign tlb_reset = reset;
  assign tlb_io_req_valid = s1_valid & _T_11; // @[Frontend.scala 160:32]
  assign tlb_io_req_bits_vaddr = s1_pc; // @[Frontend.scala 161:25]
  assign tlb_io_req_bits_prv = io_ptw_status_prv; // @[Frontend.scala 164:23]
  assign tlb_io_sfence_valid = io_cpu_sfence_valid; // @[Frontend.scala 166:17]
  assign tlb_io_sfence_bits_rs1 = io_cpu_sfence_bits_rs1; // @[Frontend.scala 166:17]
  assign tlb_io_sfence_bits_rs2 = io_cpu_sfence_bits_rs2; // @[Frontend.scala 166:17]
  assign tlb_io_sfence_bits_addr = io_cpu_sfence_bits_addr; // @[Frontend.scala 166:17]
  assign tlb_io_ptw_req_ready = io_ptw_req_ready; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_ae_ptw = io_ptw_resp_bits_ae_ptw; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_ae_final = io_ptw_resp_bits_ae_final; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pf = io_ptw_resp_bits_pf; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_status_debug = io_ptw_status_debug; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr; // @[Frontend.scala 159:10]
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask; // @[Frontend.scala 159:10]
  assign tlb_io_kill = _s0_fq_has_space_T_5 | s2_kill_speculative_tlb_refill; // @[Frontend.scala 167:28]
  assign btb_clock = clock;
  assign btb_reset = reset;
  assign btb_io_req_bits_addr = s1_pc[38:0]; // @[Frontend.scala 197:26]
  assign btb_io_btb_update_valid = ~io_cpu_btb_update_valid ? _s2_replay_T & ~wrong_path & fetch_bubble_likely &
    updateBTB : io_cpu_btb_update_valid; // @[Frontend.scala 198:23 307:37 309:31]
  assign btb_io_btb_update_bits_prediction_entry = ~io_cpu_btb_update_valid ? 5'h1c :
    io_cpu_btb_update_bits_prediction_entry; // @[Frontend.scala 198:23 307:37 310:47]
  assign btb_io_btb_update_bits_pc = _GEN_48[38:0];
  assign btb_io_btb_update_bits_isValid = ~io_cpu_btb_update_valid | io_cpu_btb_update_bits_isValid; // @[Frontend.scala 198:23 307:37 311:38]
  assign btb_io_btb_update_bits_br_pc = _GEN_47[38:0];
  assign btb_io_btb_update_bits_cfiType = ~io_cpu_btb_update_valid ? btb_io_ras_update_bits_cfiType :
    io_cpu_btb_update_bits_cfiType; // @[Frontend.scala 198:23 307:37 312:38]
  assign btb_io_bht_update_valid = io_cpu_bht_update_valid; // @[Frontend.scala 199:23 214:{24,50}]
  assign btb_io_bht_update_bits_prediction_history = io_cpu_bht_update_bits_prediction_history; // @[Frontend.scala 199:23]
  assign btb_io_bht_update_bits_pc = io_cpu_bht_update_bits_pc; // @[Frontend.scala 199:23]
  assign btb_io_bht_update_bits_branch = io_cpu_bht_update_bits_branch; // @[Frontend.scala 199:23]
  assign btb_io_bht_update_bits_taken = io_cpu_bht_update_bits_taken; // @[Frontend.scala 199:23]
  assign btb_io_bht_update_bits_mispredict = io_cpu_bht_update_bits_mispredict; // @[Frontend.scala 199:23]
  assign btb_io_bht_advance_valid = taken_idx ? _GEN_94 : _GEN_58; // @[Frontend.scala 260:25]
  assign btb_io_bht_advance_bits_bht_value = s2_btb_resp_bits_bht_value; // @[Frontend.scala 260:25]
  assign btb_io_ras_update_valid = taken_idx ? _btb_io_btb_update_valid_T_2 & (taken_prevRVI_1 & (taken_rviCall_1 |
    taken_rviReturn_1) | taken_valid_1 & (taken_rvcJALR_1 | taken_rvcReturn_1)) : _btb_io_btb_update_valid_T_2 & (
    taken_prevRVI & (taken_rviCall | taken_rviReturn) | taken_valid & (taken_rvcJALR | taken_rvcReturn)); // @[Frontend.scala 260:25 263:33]
  assign btb_io_ras_update_bits_cfiType = taken_idx ? _taken_btb_io_ras_update_bits_cfiType_T_15 :
    _taken_btb_io_ras_update_bits_cfiType_T_7; // @[Frontend.scala 260:25 264:40]
  assign btb_io_ras_update_bits_returnAddr = _btb_io_ras_update_bits_returnAddr_T_2[38:0]; // @[Frontend.scala 317:39]
  assign btb_io_flush = s2_valid & s2_btb_resp_valid & s2_btb_resp_bits_bridx & taken_valid_1 & ~taken_rvc_1 | s2_valid
     & s2_btb_resp_valid & ~s2_btb_resp_bits_bridx & taken_valid & _taken_prevRVI_T_5; // @[Frontend.scala 251:95 254:22]
  always @(posedge clock) begin
    s1_valid <= io_cpu_req_valid | s0_fq_has_space; // @[Frontend.scala 110:35]
    if (reset) begin // @[Frontend.scala 105:25]
      s2_valid <= 1'h0; // @[Frontend.scala 105:25]
    end else begin
      s2_valid <= _GEN_0;
    end
    s1_pc <= io_cpu_npc; // @[Frontend.scala 134:9]
    if (io_cpu_req_valid) begin // @[Frontend.scala 140:24]
      s1_speculative <= io_cpu_req_bits_speculative;
    end else if (s2_replay) begin // @[Frontend.scala 140:75]
      s1_speculative <= s2_speculative;
    end else begin
      s1_speculative <= s0_speculative;
    end
    if (reset) begin // @[Frontend.scala 114:22]
      s2_pc <= 40'h10040; // @[Frontend.scala 114:22]
    end else if (~s2_replay) begin // @[Frontend.scala 144:21]
      s2_pc <= s1_pc; // @[Frontend.scala 146:11]
    end
    if (_T_11) begin // @[Frontend.scala 202:23]
      s2_btb_resp_valid <= btb_io_resp_valid; // @[Frontend.scala 204:25]
    end
    if (_T_11) begin // @[Frontend.scala 202:23]
      s2_btb_resp_bits_taken <= btb_io_resp_bits_taken; // @[Frontend.scala 205:24]
    end
    if (_T_11) begin // @[Frontend.scala 202:23]
      s2_btb_resp_bits_bridx <= btb_io_resp_bits_bridx; // @[Frontend.scala 205:24]
    end
    if (_T_11) begin // @[Frontend.scala 202:23]
      s2_btb_resp_bits_entry <= btb_io_resp_bits_entry; // @[Frontend.scala 205:24]
    end
    if (_T_11) begin // @[Frontend.scala 202:23]
      s2_btb_resp_bits_bht_history <= btb_io_resp_bits_bht_history; // @[Frontend.scala 205:24]
    end
    if (_T_11) begin // @[Frontend.scala 202:23]
      s2_btb_resp_bits_bht_value <= btb_io_resp_bits_bht_value; // @[Frontend.scala 205:24]
    end
    if (~s2_replay) begin // @[Frontend.scala 144:21]
      s2_tlb_resp_miss <= tlb_io_resp_miss; // @[Frontend.scala 148:17]
    end
    if (~s2_replay) begin // @[Frontend.scala 144:21]
      s2_tlb_resp_pf_inst <= tlb_io_resp_pf_inst; // @[Frontend.scala 148:17]
    end
    if (~s2_replay) begin // @[Frontend.scala 144:21]
      s2_tlb_resp_ae_inst <= tlb_io_resp_ae_inst; // @[Frontend.scala 148:17]
    end
    if (~s2_replay) begin // @[Frontend.scala 144:21]
      s2_tlb_resp_cacheable <= tlb_io_resp_cacheable; // @[Frontend.scala 148:17]
    end
    if (reset) begin // @[Frontend.scala 120:27]
      s2_speculative <= 1'h0; // @[Frontend.scala 120:27]
    end else if (~s2_replay) begin // @[Frontend.scala 144:21]
      s2_speculative <= s1_speculative; // @[Frontend.scala 147:20]
    end
    if (reset) begin // @[Frontend.scala 121:38]
      s2_partial_insn_valid <= 1'h0; // @[Frontend.scala 121:38]
    end else if (s2_redirect) begin // @[Frontend.scala 336:24]
      s2_partial_insn_valid <= 1'h0; // @[Frontend.scala 336:48]
    end else if (_s2_replay_T & (s2_btb_taken | taken)) begin // @[Frontend.scala 323:56]
      s2_partial_insn_valid <= 1'h0; // @[Frontend.scala 324:29]
    end else if (_s2_replay_T) begin // @[Frontend.scala 294:33]
      s2_partial_insn_valid <= _taken_T_61;
    end
    if (_s2_replay_T) begin // @[Frontend.scala 294:33]
      if (taken_valid_1 & taken_idx & _taken_T_33) begin // @[Frontend.scala 296:46]
        s2_partial_insn <= _taken_s2_partial_insn_T; // @[Frontend.scala 298:29]
      end
    end
    if (reset) begin // @[Frontend.scala 123:27]
      wrong_path <= 1'h0; // @[Frontend.scala 123:27]
    end else if (io_cpu_req_valid) begin // @[Frontend.scala 337:29]
      wrong_path <= 1'h0; // @[Frontend.scala 337:42]
    end else if (taken_idx) begin // @[Frontend.scala 260:25]
      if (~s2_btb_taken) begin // @[Frontend.scala 269:30]
        wrong_path <= _GEN_88;
      end else begin
        wrong_path <= _GEN_87;
      end
    end else begin
      wrong_path <= _GEN_87;
    end
    s2_replay_REG <= reset | s2_replay & ~s0_valid; // @[Frontend.scala 131:{58,58,58}]
    if (reset) begin // @[Frontend.scala 152:40]
      recent_progress_counter <= 2'h3; // @[Frontend.scala 152:40]
    end else if (io_cpu_progress) begin // @[Frontend.scala 155:25]
      recent_progress_counter <= 2'h3; // @[Frontend.scala 155:51]
    end else if (_T_12 & recent_progress) begin // @[Frontend.scala 154:44]
      recent_progress_counter <= _recent_progress_counter_T_1; // @[Frontend.scala 154:70]
    end
    fq_io_enq_valid_REG <= s1_valid; // @[Frontend.scala 180:29]
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_cpu_req_valid | io_cpu_sfence_valid | io_cpu_flush_icache | io_cpu_bht_update_valid |
          io_cpu_btb_update_valid) | io_cpu_might_request) & ~reset) begin
          $fatal; // @[Frontend.scala 93:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~(io_cpu_req_valid | io_cpu_sfence_valid | io_cpu_flush_icache | io_cpu_bht_update_valid |
          io_cpu_btb_update_valid) | io_cpu_might_request)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Frontend.scala:93 assert(!(io.cpu.req.valid || io.cpu.sfence.valid || io.cpu.flush_icache || io.cpu.bht_update.valid || io.cpu.btb_update.valid) || io.cpu.might_request)\n"
            ); // @[Frontend.scala 93:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(s2_speculative & io_ptw_customCSRs_csrs_0_value[3] & ~icache_io_s2_kill)) & _T_9) begin
          $fatal; // @[Frontend.scala 190:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_9 & ~(~(s2_speculative & io_ptw_customCSRs_csrs_0_value[3] & ~icache_io_s2_kill))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Frontend.scala:190 assert(!(s2_speculative && io.ptw.customCSRs.asInstanceOf[RocketCustomCSRs].disableSpeculativeICacheRefill && !icache.io.s2_kill))\n"
            ); // @[Frontend.scala 190:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~s2_partial_insn_valid | fq_io_enq_bits_mask[0]) & _T_9) begin
          $fatal; // @[Frontend.scala 335:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_9 & ~(~s2_partial_insn_valid | fq_io_enq_bits_mask[0])) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Frontend.scala:335 assert(!s2_partial_insn_valid || fq.io.enq.bits.mask(0))\n"); // @[Frontend.scala 335:11]
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
  s1_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  s2_valid = _RAND_1[0:0];
  _RAND_2 = {2{`RANDOM}};
  s1_pc = _RAND_2[39:0];
  _RAND_3 = {1{`RANDOM}};
  s1_speculative = _RAND_3[0:0];
  _RAND_4 = {2{`RANDOM}};
  s2_pc = _RAND_4[39:0];
  _RAND_5 = {1{`RANDOM}};
  s2_btb_resp_valid = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  s2_btb_resp_bits_taken = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  s2_btb_resp_bits_bridx = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  s2_btb_resp_bits_entry = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_history = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_value = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  s2_tlb_resp_miss = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  s2_tlb_resp_pf_inst = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  s2_tlb_resp_ae_inst = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  s2_tlb_resp_cacheable = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  s2_speculative = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  s2_partial_insn_valid = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  s2_partial_insn = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  wrong_path = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  s2_replay_REG = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  recent_progress_counter = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  fq_io_enq_valid_REG = _RAND_21[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
