module TLPLIC(
  input         clock,
  input         reset,
  input         auto_int_in_0,
  input         auto_int_in_1,
  input         auto_int_in_2,
  input         auto_int_in_3,
  input         auto_int_in_4,
  input         auto_int_in_5,
  input         auto_int_in_6,
  output        auto_int_out_1_0,
  output        auto_int_out_0_0,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [8:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [8:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data
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
  reg [31:0] _RAND_21;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [27:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  gateways_gateway_clock; // @[Plic.scala 155:27]
  wire  gateways_gateway_reset; // @[Plic.scala 155:27]
  wire  gateways_gateway_io_interrupt; // @[Plic.scala 155:27]
  wire  gateways_gateway_io_plic_valid; // @[Plic.scala 155:27]
  wire  gateways_gateway_io_plic_ready; // @[Plic.scala 155:27]
  wire  gateways_gateway_io_plic_complete; // @[Plic.scala 155:27]
  wire  gateways_gateway_1_clock; // @[Plic.scala 155:27]
  wire  gateways_gateway_1_reset; // @[Plic.scala 155:27]
  wire  gateways_gateway_1_io_interrupt; // @[Plic.scala 155:27]
  wire  gateways_gateway_1_io_plic_valid; // @[Plic.scala 155:27]
  wire  gateways_gateway_1_io_plic_ready; // @[Plic.scala 155:27]
  wire  gateways_gateway_1_io_plic_complete; // @[Plic.scala 155:27]
  wire  gateways_gateway_2_clock; // @[Plic.scala 155:27]
  wire  gateways_gateway_2_reset; // @[Plic.scala 155:27]
  wire  gateways_gateway_2_io_interrupt; // @[Plic.scala 155:27]
  wire  gateways_gateway_2_io_plic_valid; // @[Plic.scala 155:27]
  wire  gateways_gateway_2_io_plic_ready; // @[Plic.scala 155:27]
  wire  gateways_gateway_2_io_plic_complete; // @[Plic.scala 155:27]
  wire  gateways_gateway_3_clock; // @[Plic.scala 155:27]
  wire  gateways_gateway_3_reset; // @[Plic.scala 155:27]
  wire  gateways_gateway_3_io_interrupt; // @[Plic.scala 155:27]
  wire  gateways_gateway_3_io_plic_valid; // @[Plic.scala 155:27]
  wire  gateways_gateway_3_io_plic_ready; // @[Plic.scala 155:27]
  wire  gateways_gateway_3_io_plic_complete; // @[Plic.scala 155:27]
  wire  gateways_gateway_4_clock; // @[Plic.scala 155:27]
  wire  gateways_gateway_4_reset; // @[Plic.scala 155:27]
  wire  gateways_gateway_4_io_interrupt; // @[Plic.scala 155:27]
  wire  gateways_gateway_4_io_plic_valid; // @[Plic.scala 155:27]
  wire  gateways_gateway_4_io_plic_ready; // @[Plic.scala 155:27]
  wire  gateways_gateway_4_io_plic_complete; // @[Plic.scala 155:27]
  wire  gateways_gateway_5_clock; // @[Plic.scala 155:27]
  wire  gateways_gateway_5_reset; // @[Plic.scala 155:27]
  wire  gateways_gateway_5_io_interrupt; // @[Plic.scala 155:27]
  wire  gateways_gateway_5_io_plic_valid; // @[Plic.scala 155:27]
  wire  gateways_gateway_5_io_plic_ready; // @[Plic.scala 155:27]
  wire  gateways_gateway_5_io_plic_complete; // @[Plic.scala 155:27]
  wire  gateways_gateway_6_clock; // @[Plic.scala 155:27]
  wire  gateways_gateway_6_reset; // @[Plic.scala 155:27]
  wire  gateways_gateway_6_io_interrupt; // @[Plic.scala 155:27]
  wire  gateways_gateway_6_io_plic_valid; // @[Plic.scala 155:27]
  wire  gateways_gateway_6_io_plic_ready; // @[Plic.scala 155:27]
  wire  gateways_gateway_6_io_plic_complete; // @[Plic.scala 155:27]
  wire [2:0] fanin_io_prio_0; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_prio_1; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_prio_2; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_prio_3; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_prio_4; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_prio_5; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_prio_6; // @[Plic.scala 183:25]
  wire [6:0] fanin_io_ip; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_dev; // @[Plic.scala 183:25]
  wire [2:0] fanin_io_max; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_prio_0; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_prio_1; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_prio_2; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_prio_3; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_prio_4; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_prio_5; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_prio_6; // @[Plic.scala 183:25]
  wire [6:0] fanin_1_io_ip; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_dev; // @[Plic.scala 183:25]
  wire [2:0] fanin_1_io_max; // @[Plic.scala 183:25]
  wire  out_back_clock; // @[Decoupled.scala 361:21]
  wire  out_back_reset; // @[Decoupled.scala 361:21]
  wire  out_back_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  out_back_io_enq_valid; // @[Decoupled.scala 361:21]
  wire  out_back_io_enq_bits_read; // @[Decoupled.scala 361:21]
  wire [22:0] out_back_io_enq_bits_index; // @[Decoupled.scala 361:21]
  wire [63:0] out_back_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] out_back_io_enq_bits_mask; // @[Decoupled.scala 361:21]
  wire [8:0] out_back_io_enq_bits_extra_tlrr_extra_source; // @[Decoupled.scala 361:21]
  wire [1:0] out_back_io_enq_bits_extra_tlrr_extra_size; // @[Decoupled.scala 361:21]
  wire  out_back_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  out_back_io_deq_valid; // @[Decoupled.scala 361:21]
  wire  out_back_io_deq_bits_read; // @[Decoupled.scala 361:21]
  wire [22:0] out_back_io_deq_bits_index; // @[Decoupled.scala 361:21]
  wire [63:0] out_back_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] out_back_io_deq_bits_mask; // @[Decoupled.scala 361:21]
  wire [8:0] out_back_io_deq_bits_extra_tlrr_extra_source; // @[Decoupled.scala 361:21]
  wire [1:0] out_back_io_deq_bits_extra_tlrr_extra_size; // @[Decoupled.scala 361:21]
  reg [2:0] priority_0; // @[Plic.scala 162:31]
  reg [2:0] priority_1; // @[Plic.scala 162:31]
  reg [2:0] priority_2; // @[Plic.scala 162:31]
  reg [2:0] priority_3; // @[Plic.scala 162:31]
  reg [2:0] priority_4; // @[Plic.scala 162:31]
  reg [2:0] priority_5; // @[Plic.scala 162:31]
  reg [2:0] priority_6; // @[Plic.scala 162:31]
  reg [2:0] threshold_0; // @[Plic.scala 165:31]
  reg [2:0] threshold_1; // @[Plic.scala 165:31]
  reg  pending_0; // @[Plic.scala 167:22]
  reg  pending_1; // @[Plic.scala 167:22]
  reg  pending_2; // @[Plic.scala 167:22]
  reg  pending_3; // @[Plic.scala 167:22]
  reg  pending_4; // @[Plic.scala 167:22]
  reg  pending_5; // @[Plic.scala 167:22]
  reg  pending_6; // @[Plic.scala 167:22]
  reg [6:0] enables_0_0; // @[Plic.scala 173:26]
  reg [6:0] enables_1_0; // @[Plic.scala 173:26]
  wire [7:0] enableVec0_0 = {enables_0_0,1'h0}; // @[Cat.scala 31:58]
  wire [7:0] enableVec0_1 = {enables_1_0,1'h0}; // @[Cat.scala 31:58]
  reg [2:0] maxDevs_0; // @[Plic.scala 180:22]
  reg [2:0] maxDevs_1; // @[Plic.scala 180:22]
  wire [6:0] pendingUInt = {pending_6,pending_5,pending_4,pending_3,pending_2,pending_1,pending_0}; // @[Cat.scala 31:58]
  reg [2:0] bundleOut_0_0_REG; // @[Plic.scala 187:41]
  reg [2:0] bundleOut_1_0_REG; // @[Plic.scala 187:41]
  wire [5:0] out_oindex = {out_back_io_deq_bits_index[18],out_back_io_deq_bits_index[10],out_back_io_deq_bits_index[9],
    out_back_io_deq_bits_index[4],out_back_io_deq_bits_index[1],out_back_io_deq_bits_index[0]}; // @[Cat.scala 31:58]
  wire [63:0] _out_backSel_T = 64'h1 << out_oindex; // @[OneHot.scala 57:35]
  wire  out_backSel_40 = _out_backSel_T[40]; // @[RegisterRouter.scala 82:24]
  wire [22:0] out_bindex = out_back_io_deq_bits_index & 23'h7bf9ec; // @[RegisterRouter.scala 82:24]
  wire  _out_T_13 = out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_roready_19 = out_back_io_deq_valid & auto_in_d_ready & out_back_io_deq_bits_read & out_backSel_40 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire [7:0] _out_backMask_T_23 = out_back_io_deq_bits_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_21 = out_back_io_deq_bits_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_19 = out_back_io_deq_bits_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_17 = out_back_io_deq_bits_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_15 = out_back_io_deq_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_13 = out_back_io_deq_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_11 = out_back_io_deq_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_9 = out_back_io_deq_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] out_backMask = {_out_backMask_T_23,_out_backMask_T_21,_out_backMask_T_19,_out_backMask_T_17,
    _out_backMask_T_15,_out_backMask_T_13,_out_backMask_T_11,_out_backMask_T_9}; // @[Cat.scala 31:58]
  wire  out_romask_19 = |out_backMask[63:32]; // @[RegisterRouter.scala 82:24]
  wire  out_f_roready_19 = out_roready_19 & out_romask_19; // @[RegisterRouter.scala 82:24]
  wire  out_backSel_32 = _out_backSel_T[32]; // @[RegisterRouter.scala 82:24]
  wire  out_roready_24 = out_back_io_deq_valid & auto_in_d_ready & out_back_io_deq_bits_read & out_backSel_32 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_roready_24 = out_roready_24 & out_romask_19; // @[RegisterRouter.scala 82:24]
  wire [1:0] _T = {out_f_roready_19,out_f_roready_24}; // @[Plic.scala 244:21]
  wire [1:0] _T_3 = _T - 2'h1; // @[Plic.scala 244:46]
  wire [1:0] _T_4 = _T & _T_3; // @[Plic.scala 244:28]
  wire  _T_7 = ~reset; // @[Plic.scala 244:11]
  wire [2:0] _claiming_T = out_f_roready_24 ? maxDevs_0 : 3'h0; // @[Plic.scala 245:49]
  wire [2:0] _claiming_T_1 = out_f_roready_19 ? maxDevs_1 : 3'h0; // @[Plic.scala 245:49]
  wire [2:0] claiming = _claiming_T | _claiming_T_1; // @[Plic.scala 245:96]
  wire [7:0] _claimedDevs_T = 8'h1 << claiming; // @[OneHot.scala 64:12]
  wire  claimedDevs_1 = _claimedDevs_T[1]; // @[Plic.scala 246:58]
  wire  claimedDevs_2 = _claimedDevs_T[2]; // @[Plic.scala 246:58]
  wire  claimedDevs_3 = _claimedDevs_T[3]; // @[Plic.scala 246:58]
  wire  claimedDevs_4 = _claimedDevs_T[4]; // @[Plic.scala 246:58]
  wire  claimedDevs_5 = _claimedDevs_T[5]; // @[Plic.scala 246:58]
  wire  claimedDevs_6 = _claimedDevs_T[6]; // @[Plic.scala 246:58]
  wire  claimedDevs_7 = _claimedDevs_T[7]; // @[Plic.scala 246:58]
  wire  out_woready_19 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_40 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_womask_19 = &out_backMask[63:32]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_19 = out_woready_19 & out_womask_19; // @[RegisterRouter.scala 82:24]
  wire [2:0] completerDev = out_back_io_deq_bits_data[34:32]; // @[package.scala 154:13]
  wire [7:0] _out_completer_1_T = enableVec0_1 >> completerDev; // @[Plic.scala 294:51]
  wire  completer_1 = out_f_woready_19 & _out_completer_1_T[0]; // @[Plic.scala 294:35]
  wire  out_woready_24 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_32 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_24 = out_woready_24 & out_womask_19; // @[RegisterRouter.scala 82:24]
  wire [7:0] _out_completer_0_T = enableVec0_0 >> completerDev; // @[Plic.scala 294:51]
  wire  completer_0 = out_f_woready_24 & _out_completer_0_T[0]; // @[Plic.scala 294:35]
  wire [1:0] _T_16 = {completer_1,completer_0}; // @[Plic.scala 261:23]
  wire [1:0] _T_19 = _T_16 - 2'h1; // @[Plic.scala 261:50]
  wire [1:0] _T_20 = _T_16 & _T_19; // @[Plic.scala 261:30]
  wire [7:0] _completedDevs_T_1 = 8'h1 << completerDev; // @[OneHot.scala 64:12]
  wire [7:0] completedDevs = completer_0 | completer_1 ? _completedDevs_T_1 : 8'h0; // @[Plic.scala 263:28]
  wire  out_backSel_16 = _out_backSel_T[16]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_0 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_16 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_womask_1 = &out_backMask[7:1]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_1 = out_woready_0 & out_womask_1; // @[RegisterRouter.scala 82:24]
  wire  out_womask_2 = &out_backMask[34:32]; // @[RegisterRouter.scala 82:24]
  wire  out_backSel_0 = _out_backSel_T[0]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_2 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_0 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_2 = out_woready_2 & out_womask_2; // @[RegisterRouter.scala 82:24]
  wire [34:0] out_prepend_1 = {priority_0,32'h0}; // @[Cat.scala 31:58]
  wire  out_backSel_20 = _out_backSel_T[20]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_3 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_20 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_4 = out_woready_3 & out_womask_1; // @[RegisterRouter.scala 82:24]
  wire  out_womask_5 = &out_backMask[2:0]; // @[RegisterRouter.scala 82:24]
  wire  out_backSel_1 = _out_backSel_T[1]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_5 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_1 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_5 = out_woready_5 & out_womask_5; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_6 = out_woready_5 & out_womask_2; // @[RegisterRouter.scala 82:24]
  wire [31:0] _out_prepend_T_3 = {{29'd0}, priority_1}; // @[RegisterRouter.scala 82:24]
  wire [34:0] out_prepend_3 = {priority_2,_out_prepend_T_3}; // @[Cat.scala 31:58]
  wire [7:0] out_prepend_10 = {pending_6,pending_5,pending_4,pending_3,pending_2,pending_1,pending_0,1'h0}; // @[Cat.scala 31:58]
  wire  out_backSel_2 = _out_backSel_T[2]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_15 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_2 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_15 = out_woready_15 & out_womask_5; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_16 = out_woready_15 & out_womask_2; // @[RegisterRouter.scala 82:24]
  wire [31:0] _out_prepend_T_11 = {{29'd0}, priority_3}; // @[RegisterRouter.scala 82:24]
  wire [34:0] out_prepend_11 = {priority_4,_out_prepend_T_11}; // @[Cat.scala 31:58]
  wire  out_f_woready_17 = out_woready_19 & out_womask_5; // @[RegisterRouter.scala 82:24]
  wire [3:0] out_prepend_12 = {1'h0,threshold_1}; // @[Cat.scala 31:58]
  wire [31:0] _out_T_203 = {{28'd0}, out_prepend_12}; // @[RegisterRouter.scala 82:24]
  wire [34:0] out_prepend_13 = {maxDevs_1,_out_T_203}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_219 = {{29'd0}, out_prepend_13}; // @[RegisterRouter.scala 82:24]
  wire  out_backSel_3 = _out_backSel_T[3]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_20 = out_back_io_deq_valid & auto_in_d_ready & ~out_back_io_deq_bits_read & out_backSel_3 &
    out_bindex == 23'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_20 = out_woready_20 & out_womask_5; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_21 = out_woready_20 & out_womask_2; // @[RegisterRouter.scala 82:24]
  wire [31:0] _out_prepend_T_14 = {{29'd0}, priority_5}; // @[RegisterRouter.scala 82:24]
  wire [34:0] out_prepend_14 = {priority_6,_out_prepend_T_14}; // @[Cat.scala 31:58]
  wire  out_f_woready_22 = out_woready_24 & out_womask_5; // @[RegisterRouter.scala 82:24]
  wire [3:0] out_prepend_15 = {1'h0,threshold_0}; // @[Cat.scala 31:58]
  wire [31:0] _out_T_261 = {{28'd0}, out_prepend_15}; // @[RegisterRouter.scala 82:24]
  wire [34:0] out_prepend_16 = {maxDevs_0,_out_T_261}; // @[Cat.scala 31:58]
  wire [63:0] _out_T_277 = {{29'd0}, out_prepend_16}; // @[RegisterRouter.scala 82:24]
  wire  _GEN_274 = 6'h28 == out_oindex ? _out_T_13 : 1'h1; // @[MuxLiteral.scala 53:{26,32}]
  wire  _GEN_275 = 6'h20 == out_oindex ? _out_T_13 : _GEN_274; // @[MuxLiteral.scala 53:{26,32}]
  wire  _GEN_276 = 6'h14 == out_oindex ? _out_T_13 : _GEN_275; // @[MuxLiteral.scala 53:{26,32}]
  wire  _GEN_277 = 6'h10 == out_oindex ? _out_T_13 : _GEN_276; // @[MuxLiteral.scala 53:{26,32}]
  wire  _GEN_278 = 6'h8 == out_oindex ? _out_T_13 : _GEN_277; // @[MuxLiteral.scala 53:{26,32}]
  wire  _GEN_279 = 6'h3 == out_oindex ? _out_T_13 : _GEN_278; // @[MuxLiteral.scala 53:{26,32}]
  wire  _GEN_280 = 6'h2 == out_oindex ? _out_T_13 : _GEN_279; // @[MuxLiteral.scala 53:{26,32}]
  wire  _GEN_281 = 6'h1 == out_oindex ? _out_T_13 : _GEN_280; // @[MuxLiteral.scala 53:{26,32}]
  wire  out_out_bits_data_out = 6'h0 == out_oindex ? _out_T_13 : _GEN_281; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_283 = 6'h28 == out_oindex ? _out_T_219 : 64'h0; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_284 = 6'h20 == out_oindex ? _out_T_277 : _GEN_283; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_285 = 6'h14 == out_oindex ? {{56'd0}, enableVec0_1} : _GEN_284; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_286 = 6'h10 == out_oindex ? {{56'd0}, enableVec0_0} : _GEN_285; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_287 = 6'h8 == out_oindex ? {{56'd0}, out_prepend_10} : _GEN_286; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_288 = 6'h3 == out_oindex ? {{29'd0}, out_prepend_14} : _GEN_287; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_289 = 6'h2 == out_oindex ? {{29'd0}, out_prepend_11} : _GEN_288; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] _GEN_290 = 6'h1 == out_oindex ? {{29'd0}, out_prepend_3} : _GEN_289; // @[MuxLiteral.scala 53:{26,32}]
  wire [63:0] out_out_bits_data_out_1 = 6'h0 == out_oindex ? {{29'd0}, out_prepend_1} : _GEN_290; // @[MuxLiteral.scala 53:{26,32}]
  wire  out_bits_read = out_back_io_deq_bits_read; // @[RegisterRouter.scala 82:{24,24}]
  TLMonitor_26 monitor ( // @[Nodes.scala 24:25]
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(monitor_io_in_a_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source)
  );
  LevelGateway gateways_gateway ( // @[Plic.scala 155:27]
    .clock(gateways_gateway_clock),
    .reset(gateways_gateway_reset),
    .io_interrupt(gateways_gateway_io_interrupt),
    .io_plic_valid(gateways_gateway_io_plic_valid),
    .io_plic_ready(gateways_gateway_io_plic_ready),
    .io_plic_complete(gateways_gateway_io_plic_complete)
  );
  LevelGateway gateways_gateway_1 ( // @[Plic.scala 155:27]
    .clock(gateways_gateway_1_clock),
    .reset(gateways_gateway_1_reset),
    .io_interrupt(gateways_gateway_1_io_interrupt),
    .io_plic_valid(gateways_gateway_1_io_plic_valid),
    .io_plic_ready(gateways_gateway_1_io_plic_ready),
    .io_plic_complete(gateways_gateway_1_io_plic_complete)
  );
  LevelGateway gateways_gateway_2 ( // @[Plic.scala 155:27]
    .clock(gateways_gateway_2_clock),
    .reset(gateways_gateway_2_reset),
    .io_interrupt(gateways_gateway_2_io_interrupt),
    .io_plic_valid(gateways_gateway_2_io_plic_valid),
    .io_plic_ready(gateways_gateway_2_io_plic_ready),
    .io_plic_complete(gateways_gateway_2_io_plic_complete)
  );
  LevelGateway gateways_gateway_3 ( // @[Plic.scala 155:27]
    .clock(gateways_gateway_3_clock),
    .reset(gateways_gateway_3_reset),
    .io_interrupt(gateways_gateway_3_io_interrupt),
    .io_plic_valid(gateways_gateway_3_io_plic_valid),
    .io_plic_ready(gateways_gateway_3_io_plic_ready),
    .io_plic_complete(gateways_gateway_3_io_plic_complete)
  );
  LevelGateway gateways_gateway_4 ( // @[Plic.scala 155:27]
    .clock(gateways_gateway_4_clock),
    .reset(gateways_gateway_4_reset),
    .io_interrupt(gateways_gateway_4_io_interrupt),
    .io_plic_valid(gateways_gateway_4_io_plic_valid),
    .io_plic_ready(gateways_gateway_4_io_plic_ready),
    .io_plic_complete(gateways_gateway_4_io_plic_complete)
  );
  LevelGateway gateways_gateway_5 ( // @[Plic.scala 155:27]
    .clock(gateways_gateway_5_clock),
    .reset(gateways_gateway_5_reset),
    .io_interrupt(gateways_gateway_5_io_interrupt),
    .io_plic_valid(gateways_gateway_5_io_plic_valid),
    .io_plic_ready(gateways_gateway_5_io_plic_ready),
    .io_plic_complete(gateways_gateway_5_io_plic_complete)
  );
  LevelGateway gateways_gateway_6 ( // @[Plic.scala 155:27]
    .clock(gateways_gateway_6_clock),
    .reset(gateways_gateway_6_reset),
    .io_interrupt(gateways_gateway_6_io_interrupt),
    .io_plic_valid(gateways_gateway_6_io_plic_valid),
    .io_plic_ready(gateways_gateway_6_io_plic_ready),
    .io_plic_complete(gateways_gateway_6_io_plic_complete)
  );
  PLICFanIn fanin ( // @[Plic.scala 183:25]
    .io_prio_0(fanin_io_prio_0),
    .io_prio_1(fanin_io_prio_1),
    .io_prio_2(fanin_io_prio_2),
    .io_prio_3(fanin_io_prio_3),
    .io_prio_4(fanin_io_prio_4),
    .io_prio_5(fanin_io_prio_5),
    .io_prio_6(fanin_io_prio_6),
    .io_ip(fanin_io_ip),
    .io_dev(fanin_io_dev),
    .io_max(fanin_io_max)
  );
  PLICFanIn fanin_1 ( // @[Plic.scala 183:25]
    .io_prio_0(fanin_1_io_prio_0),
    .io_prio_1(fanin_1_io_prio_1),
    .io_prio_2(fanin_1_io_prio_2),
    .io_prio_3(fanin_1_io_prio_3),
    .io_prio_4(fanin_1_io_prio_4),
    .io_prio_5(fanin_1_io_prio_5),
    .io_prio_6(fanin_1_io_prio_6),
    .io_ip(fanin_1_io_ip),
    .io_dev(fanin_1_io_dev),
    .io_max(fanin_1_io_max)
  );
  Queue_37 out_back ( // @[Decoupled.scala 361:21]
    .clock(out_back_clock),
    .reset(out_back_reset),
    .io_enq_ready(out_back_io_enq_ready),
    .io_enq_valid(out_back_io_enq_valid),
    .io_enq_bits_read(out_back_io_enq_bits_read),
    .io_enq_bits_index(out_back_io_enq_bits_index),
    .io_enq_bits_data(out_back_io_enq_bits_data),
    .io_enq_bits_mask(out_back_io_enq_bits_mask),
    .io_enq_bits_extra_tlrr_extra_source(out_back_io_enq_bits_extra_tlrr_extra_source),
    .io_enq_bits_extra_tlrr_extra_size(out_back_io_enq_bits_extra_tlrr_extra_size),
    .io_deq_ready(out_back_io_deq_ready),
    .io_deq_valid(out_back_io_deq_valid),
    .io_deq_bits_read(out_back_io_deq_bits_read),
    .io_deq_bits_index(out_back_io_deq_bits_index),
    .io_deq_bits_data(out_back_io_deq_bits_data),
    .io_deq_bits_mask(out_back_io_deq_bits_mask),
    .io_deq_bits_extra_tlrr_extra_source(out_back_io_deq_bits_extra_tlrr_extra_source),
    .io_deq_bits_extra_tlrr_extra_size(out_back_io_deq_bits_extra_tlrr_extra_size)
  );
  assign auto_int_out_1_0 = bundleOut_1_0_REG > threshold_1; // @[Plic.scala 187:63]
  assign auto_int_out_0_0 = bundleOut_0_0_REG > threshold_0; // @[Plic.scala 187:63]
  assign auto_in_a_ready = out_back_io_enq_ready; // @[Decoupled.scala 365:17 RegisterRouter.scala 82:24]
  assign auto_in_d_valid = out_back_io_deq_valid; // @[RegisterRouter.scala 82:24]
  assign auto_in_d_bits_opcode = {{2'd0}, out_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 97:19]
  assign auto_in_d_bits_size = out_back_io_deq_bits_extra_tlrr_extra_size; // @[RegisterRouter.scala 82:{24,24}]
  assign auto_in_d_bits_source = out_back_io_deq_bits_extra_tlrr_extra_source; // @[RegisterRouter.scala 82:{24,24}]
  assign auto_in_d_bits_data = out_out_bits_data_out ? out_out_bits_data_out_1 : 64'h0; // @[RegisterRouter.scala 82:24]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = out_back_io_enq_ready; // @[Decoupled.scala 365:17 RegisterRouter.scala 82:24]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = out_back_io_deq_valid; // @[RegisterRouter.scala 82:24]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, out_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 97:19]
  assign monitor_io_in_d_bits_size = out_back_io_deq_bits_extra_tlrr_extra_size; // @[RegisterRouter.scala 82:{24,24}]
  assign monitor_io_in_d_bits_source = out_back_io_deq_bits_extra_tlrr_extra_source; // @[RegisterRouter.scala 82:{24,24}]
  assign gateways_gateway_clock = clock;
  assign gateways_gateway_reset = reset;
  assign gateways_gateway_io_interrupt = auto_int_in_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_io_plic_ready = ~pending_0; // @[Plic.scala 249:18]
  assign gateways_gateway_io_plic_complete = completedDevs[1]; // @[Plic.scala 264:33]
  assign gateways_gateway_1_clock = clock;
  assign gateways_gateway_1_reset = reset;
  assign gateways_gateway_1_io_interrupt = auto_int_in_1; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_1_io_plic_ready = ~pending_1; // @[Plic.scala 249:18]
  assign gateways_gateway_1_io_plic_complete = completedDevs[2]; // @[Plic.scala 264:33]
  assign gateways_gateway_2_clock = clock;
  assign gateways_gateway_2_reset = reset;
  assign gateways_gateway_2_io_interrupt = auto_int_in_2; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_2_io_plic_ready = ~pending_2; // @[Plic.scala 249:18]
  assign gateways_gateway_2_io_plic_complete = completedDevs[3]; // @[Plic.scala 264:33]
  assign gateways_gateway_3_clock = clock;
  assign gateways_gateway_3_reset = reset;
  assign gateways_gateway_3_io_interrupt = auto_int_in_3; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_3_io_plic_ready = ~pending_3; // @[Plic.scala 249:18]
  assign gateways_gateway_3_io_plic_complete = completedDevs[4]; // @[Plic.scala 264:33]
  assign gateways_gateway_4_clock = clock;
  assign gateways_gateway_4_reset = reset;
  assign gateways_gateway_4_io_interrupt = auto_int_in_4; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_4_io_plic_ready = ~pending_4; // @[Plic.scala 249:18]
  assign gateways_gateway_4_io_plic_complete = completedDevs[5]; // @[Plic.scala 264:33]
  assign gateways_gateway_5_clock = clock;
  assign gateways_gateway_5_reset = reset;
  assign gateways_gateway_5_io_interrupt = auto_int_in_5; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_5_io_plic_ready = ~pending_5; // @[Plic.scala 249:18]
  assign gateways_gateway_5_io_plic_complete = completedDevs[6]; // @[Plic.scala 264:33]
  assign gateways_gateway_6_clock = clock;
  assign gateways_gateway_6_reset = reset;
  assign gateways_gateway_6_io_interrupt = auto_int_in_6; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign gateways_gateway_6_io_plic_ready = ~pending_6; // @[Plic.scala 249:18]
  assign gateways_gateway_6_io_plic_complete = completedDevs[7]; // @[Plic.scala 264:33]
  assign fanin_io_prio_0 = priority_0; // @[Plic.scala 184:21]
  assign fanin_io_prio_1 = priority_1; // @[Plic.scala 184:21]
  assign fanin_io_prio_2 = priority_2; // @[Plic.scala 184:21]
  assign fanin_io_prio_3 = priority_3; // @[Plic.scala 184:21]
  assign fanin_io_prio_4 = priority_4; // @[Plic.scala 184:21]
  assign fanin_io_prio_5 = priority_5; // @[Plic.scala 184:21]
  assign fanin_io_prio_6 = priority_6; // @[Plic.scala 184:21]
  assign fanin_io_ip = enables_0_0 & pendingUInt; // @[Plic.scala 185:40]
  assign fanin_1_io_prio_0 = priority_0; // @[Plic.scala 184:21]
  assign fanin_1_io_prio_1 = priority_1; // @[Plic.scala 184:21]
  assign fanin_1_io_prio_2 = priority_2; // @[Plic.scala 184:21]
  assign fanin_1_io_prio_3 = priority_3; // @[Plic.scala 184:21]
  assign fanin_1_io_prio_4 = priority_4; // @[Plic.scala 184:21]
  assign fanin_1_io_prio_5 = priority_5; // @[Plic.scala 184:21]
  assign fanin_1_io_prio_6 = priority_6; // @[Plic.scala 184:21]
  assign fanin_1_io_ip = enables_1_0 & pendingUInt; // @[Plic.scala 185:40]
  assign out_back_clock = clock;
  assign out_back_reset = reset;
  assign out_back_io_enq_valid = auto_in_a_valid; // @[RegisterRouter.scala 82:24]
  assign out_back_io_enq_bits_read = auto_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 71:36]
  assign out_back_io_enq_bits_index = auto_in_a_bits_address[25:3]; // @[RegisterRouter.scala 70:18 72:19]
  assign out_back_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_enq_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_enq_bits_extra_tlrr_extra_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_enq_bits_extra_tlrr_extra_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign out_back_io_deq_ready = auto_in_d_ready; // @[RegisterRouter.scala 82:24]
  always @(posedge clock) begin
    if (out_f_woready_2) begin // @[RegField.scala 74:88]
      priority_0 <= out_back_io_deq_bits_data[34:32]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_5) begin // @[RegField.scala 74:88]
      priority_1 <= out_back_io_deq_bits_data[2:0]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_6) begin // @[RegField.scala 74:88]
      priority_2 <= out_back_io_deq_bits_data[34:32]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_15) begin // @[RegField.scala 74:88]
      priority_3 <= out_back_io_deq_bits_data[2:0]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_16) begin // @[RegField.scala 74:88]
      priority_4 <= out_back_io_deq_bits_data[34:32]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_20) begin // @[RegField.scala 74:88]
      priority_5 <= out_back_io_deq_bits_data[2:0]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_21) begin // @[RegField.scala 74:88]
      priority_6 <= out_back_io_deq_bits_data[34:32]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_22) begin // @[RegField.scala 74:88]
      threshold_0 <= out_back_io_deq_bits_data[2:0]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_17) begin // @[RegField.scala 74:88]
      threshold_1 <= out_back_io_deq_bits_data[2:0]; // @[RegField.scala 74:92]
    end
    if (reset) begin // @[Plic.scala 167:22]
      pending_0 <= 1'h0; // @[Plic.scala 167:22]
    end else if (claimedDevs_1 | gateways_gateway_io_plic_valid) begin // @[Plic.scala 250:27]
      pending_0 <= ~claimedDevs_1; // @[Plic.scala 250:31]
    end
    if (reset) begin // @[Plic.scala 167:22]
      pending_1 <= 1'h0; // @[Plic.scala 167:22]
    end else if (claimedDevs_2 | gateways_gateway_1_io_plic_valid) begin // @[Plic.scala 250:27]
      pending_1 <= ~claimedDevs_2; // @[Plic.scala 250:31]
    end
    if (reset) begin // @[Plic.scala 167:22]
      pending_2 <= 1'h0; // @[Plic.scala 167:22]
    end else if (claimedDevs_3 | gateways_gateway_2_io_plic_valid) begin // @[Plic.scala 250:27]
      pending_2 <= ~claimedDevs_3; // @[Plic.scala 250:31]
    end
    if (reset) begin // @[Plic.scala 167:22]
      pending_3 <= 1'h0; // @[Plic.scala 167:22]
    end else if (claimedDevs_4 | gateways_gateway_3_io_plic_valid) begin // @[Plic.scala 250:27]
      pending_3 <= ~claimedDevs_4; // @[Plic.scala 250:31]
    end
    if (reset) begin // @[Plic.scala 167:22]
      pending_4 <= 1'h0; // @[Plic.scala 167:22]
    end else if (claimedDevs_5 | gateways_gateway_4_io_plic_valid) begin // @[Plic.scala 250:27]
      pending_4 <= ~claimedDevs_5; // @[Plic.scala 250:31]
    end
    if (reset) begin // @[Plic.scala 167:22]
      pending_5 <= 1'h0; // @[Plic.scala 167:22]
    end else if (claimedDevs_6 | gateways_gateway_5_io_plic_valid) begin // @[Plic.scala 250:27]
      pending_5 <= ~claimedDevs_6; // @[Plic.scala 250:31]
    end
    if (reset) begin // @[Plic.scala 167:22]
      pending_6 <= 1'h0; // @[Plic.scala 167:22]
    end else if (claimedDevs_7 | gateways_gateway_6_io_plic_valid) begin // @[Plic.scala 250:27]
      pending_6 <= ~claimedDevs_7; // @[Plic.scala 250:31]
    end
    if (out_f_woready_1) begin // @[RegField.scala 74:88]
      enables_0_0 <= out_back_io_deq_bits_data[7:1]; // @[RegField.scala 74:92]
    end
    if (out_f_woready_4) begin // @[RegField.scala 74:88]
      enables_1_0 <= out_back_io_deq_bits_data[7:1]; // @[RegField.scala 74:92]
    end
    maxDevs_0 <= fanin_io_dev; // @[Plic.scala 186:21]
    maxDevs_1 <= fanin_1_io_dev; // @[Plic.scala 186:21]
    bundleOut_0_0_REG <= fanin_io_max; // @[Plic.scala 187:41]
    bundleOut_1_0_REG <= fanin_1_io_max; // @[Plic.scala 187:41]
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_4 == 2'h0) & ~reset) begin
          $fatal; // @[Plic.scala 244:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(_T_4 == 2'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Plic.scala:244 assert((claimer.asUInt & (claimer.asUInt - UInt(1))) === UInt(0)) // One-Hot\n"
            ); // @[Plic.scala 244:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_20 == 2'h0) & _T_7) begin
          $fatal; // @[Plic.scala 261:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7 & ~(_T_20 == 2'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Plic.scala:261 assert((completer.asUInt & (completer.asUInt - UInt(1))) === UInt(0)) // One-Hot\n"
            ); // @[Plic.scala 261:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(completerDev == completerDev) & _T_7) begin
          $fatal; // @[Plic.scala 291:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7 & ~(completerDev == completerDev)) begin
          $fwrite(32'h80000002,
            "Assertion failed: completerDev should be consistent for all harts\n    at Plic.scala:291 assert(completerDev === data.extract(log2Ceil(nDevices+1)-1, 0),\n"
            ); // @[Plic.scala 291:19]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(completerDev == completerDev) & _T_7) begin
          $fatal; // @[Plic.scala 291:19]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_7 & ~(completerDev == completerDev)) begin
          $fwrite(32'h80000002,
            "Assertion failed: completerDev should be consistent for all harts\n    at Plic.scala:291 assert(completerDev === data.extract(log2Ceil(nDevices+1)-1, 0),\n"
            ); // @[Plic.scala 291:19]
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
  priority_0 = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  priority_1 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  priority_2 = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  priority_3 = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  priority_4 = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  priority_5 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  priority_6 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  threshold_0 = _RAND_7[2:0];
  _RAND_8 = {1{`RANDOM}};
  threshold_1 = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  pending_0 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  pending_1 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  pending_2 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  pending_3 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  pending_4 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  pending_5 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  pending_6 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  enables_0_0 = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  enables_1_0 = _RAND_17[6:0];
  _RAND_18 = {1{`RANDOM}};
  maxDevs_0 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  maxDevs_1 = _RAND_19[2:0];
  _RAND_20 = {1{`RANDOM}};
  bundleOut_0_0_REG = _RAND_20[2:0];
  _RAND_21 = {1{`RANDOM}};
  bundleOut_1_0_REG = _RAND_21[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
