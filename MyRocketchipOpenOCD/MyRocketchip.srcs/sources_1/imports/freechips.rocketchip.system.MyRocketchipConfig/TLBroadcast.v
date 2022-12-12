module TLBroadcast(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input         auto_in_a_bits_user_amba_prot_bufferable,
  input         auto_in_a_bits_user_amba_prot_modifiable,
  input         auto_in_a_bits_user_amba_prot_readalloc,
  input         auto_in_a_bits_user_amba_prot_writealloc,
  input         auto_in_a_bits_user_amba_prot_privileged,
  input         auto_in_a_bits_user_amba_prot_secure,
  input         auto_in_a_bits_user_amba_prot_fetch,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [1:0]  auto_in_b_bits_param,
  output [31:0] auto_in_b_bits_address,
  output        auto_in_c_ready,
  input         auto_in_c_valid,
  input  [2:0]  auto_in_c_bits_opcode,
  input  [2:0]  auto_in_c_bits_param,
  input  [2:0]  auto_in_c_bits_size,
  input  [4:0]  auto_in_c_bits_source,
  input  [31:0] auto_in_c_bits_address,
  input  [63:0] auto_in_c_bits_data,
  input         auto_in_c_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output [1:0]  auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_in_e_valid,
  input  [1:0]  auto_in_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [2:0]  auto_out_a_bits_size,
  output [6:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output        auto_out_a_bits_user_amba_prot_bufferable,
  output        auto_out_a_bits_user_amba_prot_modifiable,
  output        auto_out_a_bits_user_amba_prot_readalloc,
  output        auto_out_a_bits_user_amba_prot_writealloc,
  output        auto_out_a_bits_user_amba_prot_privileged,
  output        auto_out_a_bits_user_amba_prot_secure,
  output        auto_out_a_bits_user_amba_prot_fetch,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [2:0]  auto_out_d_bits_size,
  input  [6:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
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
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_valid; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_b_bits_param; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_b_bits_address; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_c_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_c_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_c_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_c_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_c_bits_address; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_e_valid; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_e_bits_sink; // @[Nodes.scala 24:25]
  wire  BroadcastFilter_io_request_ready; // @[Broadcast.scala 99:26]
  wire  BroadcastFilter_io_request_valid; // @[Broadcast.scala 99:26]
  wire [1:0] BroadcastFilter_io_request_bits_mshr; // @[Broadcast.scala 99:26]
  wire [31:0] BroadcastFilter_io_request_bits_address; // @[Broadcast.scala 99:26]
  wire  BroadcastFilter_io_request_bits_allocOH; // @[Broadcast.scala 99:26]
  wire  BroadcastFilter_io_request_bits_needT; // @[Broadcast.scala 99:26]
  wire  BroadcastFilter_io_response_ready; // @[Broadcast.scala 99:26]
  wire  BroadcastFilter_io_response_valid; // @[Broadcast.scala 99:26]
  wire [1:0] BroadcastFilter_io_response_bits_mshr; // @[Broadcast.scala 99:26]
  wire [31:0] BroadcastFilter_io_response_bits_address; // @[Broadcast.scala 99:26]
  wire  BroadcastFilter_io_response_bits_allocOH; // @[Broadcast.scala 99:26]
  wire  BroadcastFilter_io_response_bits_needT; // @[Broadcast.scala 99:26]
  wire  TLBroadcastTracker_clock; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_reset; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_first; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_io_in_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_io_in_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_io_in_a_bits_size; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_io_in_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_io_in_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_in_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_io_in_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_io_in_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_io_out_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_io_out_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_io_out_a_bits_size; // @[Broadcast.scala 107:15]
  wire [6:0] TLBroadcastTracker_io_out_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_io_out_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_out_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_io_out_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_io_out_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_probe_valid; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_probe_bits_count; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_probenack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_probedack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_probesack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_d_last; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_e_last; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_io_source; // @[Broadcast.scala 107:15]
  wire [25:0] TLBroadcastTracker_io_line; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_idle; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_io_need_d; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_clock; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_reset; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_first; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_1_io_in_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_1_io_in_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_1_io_in_a_bits_size; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_1_io_in_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_1_io_in_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_1_io_in_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_1_io_in_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_1_io_out_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_1_io_out_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_1_io_out_a_bits_size; // @[Broadcast.scala 107:15]
  wire [6:0] TLBroadcastTracker_1_io_out_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_1_io_out_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_1_io_out_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_1_io_out_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_probe_valid; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_probe_bits_count; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_probenack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_probedack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_probesack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_d_last; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_e_last; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_1_io_source; // @[Broadcast.scala 107:15]
  wire [25:0] TLBroadcastTracker_1_io_line; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_idle; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_1_io_need_d; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_clock; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_reset; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_first; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_2_io_in_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_2_io_in_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_2_io_in_a_bits_size; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_2_io_in_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_2_io_in_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_2_io_in_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_2_io_in_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_2_io_out_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_2_io_out_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_2_io_out_a_bits_size; // @[Broadcast.scala 107:15]
  wire [6:0] TLBroadcastTracker_2_io_out_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_2_io_out_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_2_io_out_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_2_io_out_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_probe_valid; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_probe_bits_count; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_probenack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_probedack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_probesack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_d_last; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_e_last; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_2_io_source; // @[Broadcast.scala 107:15]
  wire [25:0] TLBroadcastTracker_2_io_line; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_idle; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_2_io_need_d; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_clock; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_reset; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_first; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_3_io_in_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_3_io_in_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_3_io_in_a_bits_size; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_3_io_in_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_3_io_in_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_3_io_in_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_3_io_in_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_ready; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_valid; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_3_io_out_a_bits_opcode; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_3_io_out_a_bits_param; // @[Broadcast.scala 107:15]
  wire [2:0] TLBroadcastTracker_3_io_out_a_bits_size; // @[Broadcast.scala 107:15]
  wire [6:0] TLBroadcastTracker_3_io_out_a_bits_source; // @[Broadcast.scala 107:15]
  wire [31:0] TLBroadcastTracker_3_io_out_a_bits_address; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_bufferable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_modifiable; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_readalloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_writealloc; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_privileged; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_secure; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_fetch; // @[Broadcast.scala 107:15]
  wire [7:0] TLBroadcastTracker_3_io_out_a_bits_mask; // @[Broadcast.scala 107:15]
  wire [63:0] TLBroadcastTracker_3_io_out_a_bits_data; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_probe_valid; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_probe_bits_count; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_probenack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_probedack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_probesack; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_d_last; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_e_last; // @[Broadcast.scala 107:15]
  wire [4:0] TLBroadcastTracker_3_io_source; // @[Broadcast.scala 107:15]
  wire [25:0] TLBroadcastTracker_3_io_line; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_idle; // @[Broadcast.scala 107:15]
  wire  TLBroadcastTracker_3_io_need_d; // @[Broadcast.scala 107:15]
  wire [3:0] _T = 4'h1 << auto_in_e_bits_sink; // @[OneHot.scala 57:35]
  wire  _T_14 = auto_out_d_bits_source[6:5] == 2'h1; // @[Broadcast.scala 119:27]
  wire  opdata = auto_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  reg [2:0] beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = beatsLeft == 3'h0; // @[Arbiter.scala 88:28]
  wire  _T_56 = opdata | ~auto_out_d_bits_source[6]; // @[Broadcast.scala 140:34]
  reg [2:0] counter; // @[Edges.scala 228:27]
  wire [2:0] _T_38 = opdata ? 3'h5 : 3'h6; // @[Broadcast.scala 132:36]
  wire [2:0] out_1_bits_opcode = auto_out_d_bits_source[6] ? _T_38 : auto_out_d_bits_opcode; // @[Broadcast.scala 130:21 131:24 132:30]
  wire  beats1_opdata = out_1_bits_opcode[0]; // @[Edges.scala 105:36]
  wire [12:0] _beats1_decode_T_1 = 13'h3f << auto_out_d_bits_size; // @[package.scala 234:77]
  wire [5:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire [2:0] beats1_decode = _beats1_decode_T_3[5:3]; // @[Edges.scala 219:59]
  wire [2:0] beats1 = beats1_opdata ? beats1_decode : 3'h0; // @[Edges.scala 220:14]
  wire  last = counter == 3'h1 | beats1 == 3'h0; // @[Edges.scala 231:37]
  wire  _T_35 = ~_T_14; // @[Broadcast.scala 129:51]
  wire  out_1_earlyValid = auto_out_d_valid & ~_T_14; // @[Broadcast.scala 129:48]
  wire  _T_113 = auto_in_c_bits_opcode == 3'h6; // @[Broadcast.scala 161:45]
  wire  out_earlyValid = auto_in_c_valid & _T_113; // @[Broadcast.scala 192:79]
  wire [1:0] _readys_T = {out_1_earlyValid,out_earlyValid}; // @[Cat.scala 31:58]
  wire [2:0] _readys_T_1 = {_readys_T, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_T_3 = _readys_T | _readys_T_1[1:0]; // @[package.scala 244:43]
  wire [2:0] _readys_T_5 = {_readys_T_3, 1'h0}; // @[Arbiter.scala 16:78]
  wire [1:0] _readys_T_7 = ~_readys_T_5[1:0]; // @[Arbiter.scala 16:61]
  wire  readys__1 = _readys_T_7[1]; // @[Arbiter.scala 95:86]
  reg  state__1; // @[Arbiter.scala 116:26]
  wire  allowed__1 = idle ? readys__1 : state__1; // @[Arbiter.scala 121:24]
  wire  out_1_ready = auto_in_d_ready & allowed__1; // @[Arbiter.scala 123:31]
  wire  _T_15 = out_1_ready & out_1_earlyValid; // @[Decoupled.scala 50:35]
  wire [2:0] counter1 = counter - 3'h1; // @[Edges.scala 229:28]
  wire  first = counter == 3'h0; // @[Edges.scala 230:25]
  wire [4:0] out_1_bits_source = auto_out_d_bits_source[4:0]; // @[Broadcast.scala 121:26 130:21]
  wire  _T_17 = TLBroadcastTracker_io_need_d & TLBroadcastTracker_io_source == out_1_bits_source; // @[Broadcast.scala 123:62]
  wire  _T_19 = TLBroadcastTracker_1_io_need_d & TLBroadcastTracker_1_io_source == out_1_bits_source; // @[Broadcast.scala 123:62]
  wire  _T_21 = TLBroadcastTracker_2_io_need_d & TLBroadcastTracker_2_io_source == out_1_bits_source; // @[Broadcast.scala 123:62]
  wire  _T_23 = TLBroadcastTracker_3_io_need_d & TLBroadcastTracker_3_io_source == out_1_bits_source; // @[Broadcast.scala 123:62]
  wire [3:0] _T_24 = {_T_23,_T_21,_T_19,_T_17}; // @[Broadcast.scala 123:102]
  reg [3:0] r; // @[Reg.scala 16:16]
  wire [3:0] _GEN_1 = first ? _T_24 : r; // @[Reg.scala 16:16 17:{18,22}]
  wire  _T_32 = ~reset; // @[Broadcast.scala 125:14]
  wire  bundleOut_0_d_ready = out_1_ready | _T_14; // @[Broadcast.scala 128:50]
  wire [1:0] _T_40 = auto_out_d_bits_source[5] ? 2'h0 : 2'h1; // @[Broadcast.scala 133:51]
  wire [1:0] _T_41 = opdata ? _T_40 : 2'h0; // @[Broadcast.scala 133:36]
  wire [1:0] out_1_bits_param = auto_out_d_bits_source[6] ? _T_41 : 2'h0; // @[Broadcast.scala 130:21 131:24 133:30]
  wire [1:0] hi_1 = _GEN_1[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_1 = _GEN_1[1:0]; // @[OneHot.scala 31:18]
  wire  _T_42 = |hi_1; // @[OneHot.scala 32:14]
  wire [1:0] _T_43 = hi_1 | lo_1; // @[OneHot.scala 32:28]
  wire [1:0] out_1_bits_sink = {_T_42,_T_43[1]}; // @[Cat.scala 31:58]
  wire  _T_65 = bundleOut_0_d_ready & auto_out_d_valid; // @[Decoupled.scala 50:35]
  wire  _T_110 = auto_in_c_bits_opcode == 3'h4; // @[Broadcast.scala 158:45]
  wire  _T_111 = auto_in_c_bits_opcode == 3'h5; // @[Broadcast.scala 159:45]
  wire  _T_112 = auto_in_c_bits_opcode == 3'h7; // @[Broadcast.scala 160:45]
  wire  _T_115 = TLBroadcastTracker_io_line == auto_in_c_bits_address[31:6]; // @[Broadcast.scala 162:55]
  wire  _T_117 = TLBroadcastTracker_1_io_line == auto_in_c_bits_address[31:6]; // @[Broadcast.scala 162:55]
  wire  _T_119 = TLBroadcastTracker_2_io_line == auto_in_c_bits_address[31:6]; // @[Broadcast.scala 162:55]
  wire  _T_121 = TLBroadcastTracker_3_io_line == auto_in_c_bits_address[31:6]; // @[Broadcast.scala 162:55]
  wire [4:0] _T_122 = _T_115 ? TLBroadcastTracker_io_source : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _T_123 = _T_117 ? TLBroadcastTracker_1_io_source : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _T_124 = _T_119 ? TLBroadcastTracker_2_io_source : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _T_125 = _T_121 ? TLBroadcastTracker_3_io_source : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _T_126 = _T_122 | _T_123; // @[Mux.scala 27:73]
  wire [4:0] _T_127 = _T_126 | _T_124; // @[Mux.scala 27:73]
  wire [4:0] _T_128 = _T_127 | _T_125; // @[Mux.scala 27:73]
  wire  readys__0 = _readys_T_7[0]; // @[Arbiter.scala 95:86]
  reg  state__0; // @[Arbiter.scala 116:26]
  wire  allowed__0 = idle ? readys__0 : state__0; // @[Arbiter.scala 121:24]
  wire  out_ready = auto_in_d_ready & allowed__0; // @[Arbiter.scala 123:31]
  reg [2:0] beatsLeft_1; // @[Arbiter.scala 87:30]
  wire  idle_1 = beatsLeft_1 == 3'h0; // @[Arbiter.scala 88:28]
  wire  out_7_earlyValid = TLBroadcastTracker_3_io_out_a_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_6_earlyValid = TLBroadcastTracker_2_io_out_a_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_5_earlyValid = TLBroadcastTracker_1_io_out_a_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_4_earlyValid = TLBroadcastTracker_io_out_a_valid; // @[ReadyValidCancel.scala 68:19 69:20]
  wire  out_3_earlyValid = auto_in_c_valid & (_T_111 | _T_112); // @[Broadcast.scala 197:35]
  wire [4:0] _readys_T_10 = {out_7_earlyValid,out_6_earlyValid,out_5_earlyValid,out_4_earlyValid,out_3_earlyValid}; // @[Cat.scala 31:58]
  wire [5:0] _readys_T_11 = {_readys_T_10, 1'h0}; // @[package.scala 244:48]
  wire [4:0] _readys_T_13 = _readys_T_10 | _readys_T_11[4:0]; // @[package.scala 244:43]
  wire [6:0] _readys_T_14 = {_readys_T_13, 2'h0}; // @[package.scala 244:48]
  wire [4:0] _readys_T_16 = _readys_T_13 | _readys_T_14[4:0]; // @[package.scala 244:43]
  wire [8:0] _readys_T_17 = {_readys_T_16, 4'h0}; // @[package.scala 244:48]
  wire [4:0] _readys_T_19 = _readys_T_16 | _readys_T_17[4:0]; // @[package.scala 244:43]
  wire [5:0] _readys_T_21 = {_readys_T_19, 1'h0}; // @[Arbiter.scala 16:78]
  wire [4:0] _readys_T_23 = ~_readys_T_21[4:0]; // @[Arbiter.scala 16:61]
  wire  readys_1_0 = _readys_T_23[0]; // @[Arbiter.scala 95:86]
  reg  state_1_0; // @[Arbiter.scala 116:26]
  wire  allowed_1_0 = idle_1 ? readys_1_0 : state_1_0; // @[Arbiter.scala 121:24]
  wire  out_3_ready = auto_out_a_ready & allowed_1_0; // @[Arbiter.scala 123:31]
  wire  _bundleIn_0_c_ready_T = _T_113 ? out_ready : out_3_ready; // @[Broadcast.scala 184:38]
  wire  bundleIn_0_c_ready = _T_110 | _bundleIn_0_c_ready_T; // @[Broadcast.scala 184:32]
  wire  _T_135 = bundleIn_0_c_ready & auto_in_c_valid; // @[Decoupled.scala 50:35]
  wire  _T_136 = _T_110 | _T_111; // @[Broadcast.scala 170:52]
  wire  _T_149 = auto_in_c_bits_param == 3'h4; // @[Broadcast.scala 178:27]
  wire  _T_150 = auto_in_c_bits_param == 3'h0 | _T_149; // @[Broadcast.scala 177:50]
  wire [12:0] _beats1_decode_T_5 = 13'h3f << auto_in_c_bits_size; // @[package.scala 234:77]
  wire [5:0] _beats1_decode_T_7 = ~_beats1_decode_T_5[5:0]; // @[package.scala 234:46]
  wire [2:0] beats1_decode_1 = _beats1_decode_T_7[5:3]; // @[Edges.scala 219:59]
  wire [1:0] _T_197 = _T_112 ? 2'h2 : 2'h1; // @[Broadcast.scala 195:25]
  wire [4:0] _T_198 = _T_112 ? auto_in_c_bits_source : _T_128; // @[Broadcast.scala 196:25]
  wire [6:0] a_source = {_T_197,_T_198}; // @[Cat.scala 31:58]
  wire [1:0] a_mask_sizeOH_shiftAmount = auto_in_c_bits_size[1:0]; // @[OneHot.scala 63:49]
  wire [3:0] _a_mask_sizeOH_T_1 = 4'h1 << a_mask_sizeOH_shiftAmount; // @[OneHot.scala 64:12]
  wire [2:0] a_mask_sizeOH = _a_mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _a_mask_T = auto_in_c_bits_size >= 3'h3; // @[Misc.scala 205:21]
  wire  a_mask_size = a_mask_sizeOH[2]; // @[Misc.scala 208:26]
  wire  a_mask_bit = auto_in_c_bits_address[2]; // @[Misc.scala 209:26]
  wire  a_mask_nbit = ~a_mask_bit; // @[Misc.scala 210:20]
  wire  a_mask_acc = _a_mask_T | a_mask_size & a_mask_nbit; // @[Misc.scala 214:29]
  wire  a_mask_acc_1 = _a_mask_T | a_mask_size & a_mask_bit; // @[Misc.scala 214:29]
  wire  a_mask_size_1 = a_mask_sizeOH[1]; // @[Misc.scala 208:26]
  wire  a_mask_bit_1 = auto_in_c_bits_address[1]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_1 = ~a_mask_bit_1; // @[Misc.scala 210:20]
  wire  a_mask_eq_2 = a_mask_nbit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_2 = a_mask_acc | a_mask_size_1 & a_mask_eq_2; // @[Misc.scala 214:29]
  wire  a_mask_eq_3 = a_mask_nbit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_3 = a_mask_acc | a_mask_size_1 & a_mask_eq_3; // @[Misc.scala 214:29]
  wire  a_mask_eq_4 = a_mask_bit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_4 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_4; // @[Misc.scala 214:29]
  wire  a_mask_eq_5 = a_mask_bit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_5 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_5; // @[Misc.scala 214:29]
  wire  a_mask_size_2 = a_mask_sizeOH[0]; // @[Misc.scala 208:26]
  wire  a_mask_bit_2 = auto_in_c_bits_address[0]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_2 = ~a_mask_bit_2; // @[Misc.scala 210:20]
  wire  a_mask_eq_6 = a_mask_eq_2 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_6 = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_6; // @[Misc.scala 214:29]
  wire  a_mask_eq_7 = a_mask_eq_2 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_7 = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_7; // @[Misc.scala 214:29]
  wire  a_mask_eq_8 = a_mask_eq_3 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_8 = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_8; // @[Misc.scala 214:29]
  wire  a_mask_eq_9 = a_mask_eq_3 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_9 = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_9; // @[Misc.scala 214:29]
  wire  a_mask_eq_10 = a_mask_eq_4 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_10 = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_10; // @[Misc.scala 214:29]
  wire  a_mask_eq_11 = a_mask_eq_4 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_11 = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_11; // @[Misc.scala 214:29]
  wire  a_mask_eq_12 = a_mask_eq_5 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_12 = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_12; // @[Misc.scala 214:29]
  wire  a_mask_eq_13 = a_mask_eq_5 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_13 = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_13; // @[Misc.scala 214:29]
  wire [7:0] a_mask = {a_mask_acc_13,a_mask_acc_12,a_mask_acc_11,a_mask_acc_10,a_mask_acc_9,a_mask_acc_8,a_mask_acc_7,
    a_mask_acc_6}; // @[Cat.scala 31:58]
  wire  latch = idle & auto_in_d_ready; // @[Arbiter.scala 89:24]
  wire  earlyWinner__0 = readys__0 & out_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner__1 = readys__1 & out_1_earlyValid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T = earlyWinner__0 | earlyWinner__1; // @[Arbiter.scala 104:53]
  wire  _T_217 = out_earlyValid | out_1_earlyValid; // @[Arbiter.scala 107:36]
  wire  _T_218 = ~(out_earlyValid | out_1_earlyValid); // @[Arbiter.scala 107:15]
  wire  muxStateEarly__0 = idle ? earlyWinner__0 : state__0; // @[Arbiter.scala 117:30]
  wire  muxStateEarly__1 = idle ? earlyWinner__1 : state__1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_3 = state__0 & out_earlyValid | state__1 & out_1_earlyValid; // @[Mux.scala 27:73]
  wire  sink_ACancel_earlyValid = idle ? _T_217 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = auto_in_d_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 49:33]
  wire [2:0] _GEN_14 = {{2'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52]
  wire [2:0] _beatsLeft_T_4 = beatsLeft - _GEN_14; // @[Arbiter.scala 113:52]
  wire [4:0] _T_243 = muxStateEarly__0 ? auto_in_c_bits_source : 5'h0; // @[Mux.scala 27:73]
  wire [4:0] _T_244 = muxStateEarly__1 ? out_1_bits_source : 5'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_246 = muxStateEarly__0 ? auto_in_c_bits_size : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_247 = muxStateEarly__1 ? auto_out_d_bits_size : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_252 = muxStateEarly__0 ? 3'h6 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_253 = muxStateEarly__1 ? out_1_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  wire [12:0] _decode_T_13 = 13'h3f << TLBroadcastTracker_io_out_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _decode_T_15 = ~_decode_T_13[5:0]; // @[package.scala 234:46]
  wire [2:0] decode_3 = _decode_T_15[5:3]; // @[Edges.scala 219:59]
  wire  opdata_4 = ~TLBroadcastTracker_io_out_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [2:0] _T_256 = opdata_4 ? decode_3 : 3'h0; // @[Edges.scala 220:14]
  wire [12:0] _decode_T_17 = 13'h3f << TLBroadcastTracker_1_io_out_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _decode_T_19 = ~_decode_T_17[5:0]; // @[package.scala 234:46]
  wire [2:0] decode_4 = _decode_T_19[5:3]; // @[Edges.scala 219:59]
  wire  opdata_5 = ~TLBroadcastTracker_1_io_out_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [2:0] _T_257 = opdata_5 ? decode_4 : 3'h0; // @[Edges.scala 220:14]
  wire [12:0] _decode_T_21 = 13'h3f << TLBroadcastTracker_2_io_out_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _decode_T_23 = ~_decode_T_21[5:0]; // @[package.scala 234:46]
  wire [2:0] decode_5 = _decode_T_23[5:3]; // @[Edges.scala 219:59]
  wire  opdata_6 = ~TLBroadcastTracker_2_io_out_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [2:0] _T_258 = opdata_6 ? decode_5 : 3'h0; // @[Edges.scala 220:14]
  wire [12:0] _decode_T_25 = 13'h3f << TLBroadcastTracker_3_io_out_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _decode_T_27 = ~_decode_T_25[5:0]; // @[package.scala 234:46]
  wire [2:0] decode_6 = _decode_T_27[5:3]; // @[Edges.scala 219:59]
  wire  opdata_7 = ~TLBroadcastTracker_3_io_out_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [2:0] _T_259 = opdata_7 ? decode_6 : 3'h0; // @[Edges.scala 220:14]
  wire  latch_1 = idle_1 & auto_out_a_ready; // @[Arbiter.scala 89:24]
  wire  readys_1_1 = _readys_T_23[1]; // @[Arbiter.scala 95:86]
  wire  readys_1_2 = _readys_T_23[2]; // @[Arbiter.scala 95:86]
  wire  readys_1_3 = _readys_T_23[3]; // @[Arbiter.scala 95:86]
  wire  readys_1_4 = _readys_T_23[4]; // @[Arbiter.scala 95:86]
  wire  earlyWinner_1_0 = readys_1_0 & out_3_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_1 = readys_1_1 & out_4_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_2 = readys_1_2 & out_5_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_3 = readys_1_3 & out_6_earlyValid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1_4 = readys_1_4 & out_7_earlyValid; // @[Arbiter.scala 97:79]
  wire  prefixOR_2 = earlyWinner_1_0 | earlyWinner_1_1; // @[Arbiter.scala 104:53]
  wire  prefixOR_3 = prefixOR_2 | earlyWinner_1_2; // @[Arbiter.scala 104:53]
  wire  prefixOR_4 = prefixOR_3 | earlyWinner_1_3; // @[Arbiter.scala 104:53]
  wire  _prefixOR_T_1 = prefixOR_4 | earlyWinner_1_4; // @[Arbiter.scala 104:53]
  wire  _T_285 = out_3_earlyValid | out_4_earlyValid | out_5_earlyValid | out_6_earlyValid | out_7_earlyValid; // @[Arbiter.scala 107:36]
  wire  _T_286 = ~(out_3_earlyValid | out_4_earlyValid | out_5_earlyValid | out_6_earlyValid | out_7_earlyValid); // @[Arbiter.scala 107:15]
  wire [2:0] maskedBeats_0_1 = earlyWinner_1_0 ? beats1_decode_1 : 3'h0; // @[Arbiter.scala 111:73]
  wire [2:0] maskedBeats_1_1 = earlyWinner_1_1 ? _T_256 : 3'h0; // @[Arbiter.scala 111:73]
  wire [2:0] maskedBeats_2 = earlyWinner_1_2 ? _T_257 : 3'h0; // @[Arbiter.scala 111:73]
  wire [2:0] maskedBeats_3 = earlyWinner_1_3 ? _T_258 : 3'h0; // @[Arbiter.scala 111:73]
  wire [2:0] maskedBeats_4 = earlyWinner_1_4 ? _T_259 : 3'h0; // @[Arbiter.scala 111:73]
  wire [2:0] _initBeats_T = maskedBeats_0_1 | maskedBeats_1_1; // @[Arbiter.scala 112:44]
  wire [2:0] _initBeats_T_1 = _initBeats_T | maskedBeats_2; // @[Arbiter.scala 112:44]
  wire [2:0] _initBeats_T_2 = _initBeats_T_1 | maskedBeats_3; // @[Arbiter.scala 112:44]
  wire [2:0] initBeats_1 = _initBeats_T_2 | maskedBeats_4; // @[Arbiter.scala 112:44]
  wire  muxStateEarly_1_0 = idle_1 ? earlyWinner_1_0 : state_1_0; // @[Arbiter.scala 117:30]
  reg  state_1_1; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_1 = idle_1 ? earlyWinner_1_1 : state_1_1; // @[Arbiter.scala 117:30]
  reg  state_1_2; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_2 = idle_1 ? earlyWinner_1_2 : state_1_2; // @[Arbiter.scala 117:30]
  reg  state_1_3; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_3 = idle_1 ? earlyWinner_1_3 : state_1_3; // @[Arbiter.scala 117:30]
  reg  state_1_4; // @[Arbiter.scala 116:26]
  wire  muxStateEarly_1_4 = idle_1 ? earlyWinner_1_4 : state_1_4; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_17 = state_1_0 & out_3_earlyValid | state_1_1 & out_4_earlyValid | state_1_2 &
    out_5_earlyValid | state_1_3 & out_6_earlyValid | state_1_4 & out_7_earlyValid; // @[Mux.scala 27:73]
  wire  sink_ACancel_1_earlyValid = idle_1 ? _T_285 : _sink_ACancel_earlyValid_T_17; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_8 = auto_out_a_ready & sink_ACancel_1_earlyValid; // @[ReadyValidCancel.scala 49:33]
  wire [2:0] _GEN_15 = {{2'd0}, _beatsLeft_T_8}; // @[Arbiter.scala 113:52]
  wire [2:0] _beatsLeft_T_10 = beatsLeft_1 - _GEN_15; // @[Arbiter.scala 113:52]
  wire  allowed_1_1 = idle_1 ? readys_1_1 : state_1_1; // @[Arbiter.scala 121:24]
  wire  allowed_1_2 = idle_1 ? readys_1_2 : state_1_2; // @[Arbiter.scala 121:24]
  wire  allowed_1_3 = idle_1 ? readys_1_3 : state_1_3; // @[Arbiter.scala 121:24]
  wire  allowed_1_4 = idle_1 ? readys_1_4 : state_1_4; // @[Arbiter.scala 121:24]
  wire [63:0] _T_317 = muxStateEarly_1_0 ? auto_in_c_bits_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] out_4_bits_data = TLBroadcastTracker_io_out_a_bits_data; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [63:0] _T_318 = muxStateEarly_1_1 ? out_4_bits_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] out_5_bits_data = TLBroadcastTracker_1_io_out_a_bits_data; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [63:0] _T_319 = muxStateEarly_1_2 ? out_5_bits_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] out_6_bits_data = TLBroadcastTracker_2_io_out_a_bits_data; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [63:0] _T_320 = muxStateEarly_1_3 ? out_6_bits_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] out_7_bits_data = TLBroadcastTracker_3_io_out_a_bits_data; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [63:0] _T_321 = muxStateEarly_1_4 ? out_7_bits_data : 64'h0; // @[Mux.scala 27:73]
  wire [63:0] _T_322 = _T_317 | _T_318; // @[Mux.scala 27:73]
  wire [63:0] _T_323 = _T_322 | _T_319; // @[Mux.scala 27:73]
  wire [63:0] _T_324 = _T_323 | _T_320; // @[Mux.scala 27:73]
  wire [7:0] _T_326 = muxStateEarly_1_0 ? a_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] out_4_bits_mask = TLBroadcastTracker_io_out_a_bits_mask; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [7:0] _T_327 = muxStateEarly_1_1 ? out_4_bits_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] out_5_bits_mask = TLBroadcastTracker_1_io_out_a_bits_mask; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [7:0] _T_328 = muxStateEarly_1_2 ? out_5_bits_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] out_6_bits_mask = TLBroadcastTracker_2_io_out_a_bits_mask; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [7:0] _T_329 = muxStateEarly_1_3 ? out_6_bits_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] out_7_bits_mask = TLBroadcastTracker_3_io_out_a_bits_mask; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [7:0] _T_330 = muxStateEarly_1_4 ? out_7_bits_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _T_331 = _T_326 | _T_327; // @[Mux.scala 27:73]
  wire [7:0] _T_332 = _T_331 | _T_328; // @[Mux.scala 27:73]
  wire [7:0] _T_333 = _T_332 | _T_329; // @[Mux.scala 27:73]
  wire  out_4_bits_user_amba_prot_fetch = TLBroadcastTracker_io_out_a_bits_user_amba_prot_fetch; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_5_bits_user_amba_prot_fetch = TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_fetch; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_6_bits_user_amba_prot_fetch = TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_fetch; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_7_bits_user_amba_prot_fetch = TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_fetch; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_4_bits_user_amba_prot_secure = TLBroadcastTracker_io_out_a_bits_user_amba_prot_secure; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_5_bits_user_amba_prot_secure = TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_secure; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_6_bits_user_amba_prot_secure = TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_secure; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_7_bits_user_amba_prot_secure = TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_secure; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_4_bits_user_amba_prot_privileged = TLBroadcastTracker_io_out_a_bits_user_amba_prot_privileged; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_5_bits_user_amba_prot_privileged = TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_privileged; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_6_bits_user_amba_prot_privileged = TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_privileged; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_7_bits_user_amba_prot_privileged = TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_privileged; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_4_bits_user_amba_prot_writealloc = TLBroadcastTracker_io_out_a_bits_user_amba_prot_writealloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_5_bits_user_amba_prot_writealloc = TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_writealloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_6_bits_user_amba_prot_writealloc = TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_writealloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_7_bits_user_amba_prot_writealloc = TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_writealloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_4_bits_user_amba_prot_readalloc = TLBroadcastTracker_io_out_a_bits_user_amba_prot_readalloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_5_bits_user_amba_prot_readalloc = TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_readalloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_6_bits_user_amba_prot_readalloc = TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_readalloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_7_bits_user_amba_prot_readalloc = TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_readalloc; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_4_bits_user_amba_prot_modifiable = TLBroadcastTracker_io_out_a_bits_user_amba_prot_modifiable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_5_bits_user_amba_prot_modifiable = TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_modifiable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_6_bits_user_amba_prot_modifiable = TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_modifiable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_7_bits_user_amba_prot_modifiable = TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_modifiable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_4_bits_user_amba_prot_bufferable = TLBroadcastTracker_io_out_a_bits_user_amba_prot_bufferable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_5_bits_user_amba_prot_bufferable = TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_bufferable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_6_bits_user_amba_prot_bufferable = TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_bufferable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire  out_7_bits_user_amba_prot_bufferable = TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_bufferable; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [31:0] _T_398 = muxStateEarly_1_0 ? auto_in_c_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] out_4_bits_address = TLBroadcastTracker_io_out_a_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [31:0] _T_399 = muxStateEarly_1_1 ? out_4_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] out_5_bits_address = TLBroadcastTracker_1_io_out_a_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [31:0] _T_400 = muxStateEarly_1_2 ? out_5_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] out_6_bits_address = TLBroadcastTracker_2_io_out_a_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [31:0] _T_401 = muxStateEarly_1_3 ? out_6_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] out_7_bits_address = TLBroadcastTracker_3_io_out_a_bits_address; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [31:0] _T_402 = muxStateEarly_1_4 ? out_7_bits_address : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_403 = _T_398 | _T_399; // @[Mux.scala 27:73]
  wire [31:0] _T_404 = _T_403 | _T_400; // @[Mux.scala 27:73]
  wire [31:0] _T_405 = _T_404 | _T_401; // @[Mux.scala 27:73]
  wire [6:0] _T_407 = muxStateEarly_1_0 ? a_source : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] out_4_bits_source = TLBroadcastTracker_io_out_a_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [6:0] _T_408 = muxStateEarly_1_1 ? out_4_bits_source : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] out_5_bits_source = TLBroadcastTracker_1_io_out_a_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [6:0] _T_409 = muxStateEarly_1_2 ? out_5_bits_source : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] out_6_bits_source = TLBroadcastTracker_2_io_out_a_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [6:0] _T_410 = muxStateEarly_1_3 ? out_6_bits_source : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] out_7_bits_source = TLBroadcastTracker_3_io_out_a_bits_source; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [6:0] _T_411 = muxStateEarly_1_4 ? out_7_bits_source : 7'h0; // @[Mux.scala 27:73]
  wire [6:0] _T_412 = _T_407 | _T_408; // @[Mux.scala 27:73]
  wire [6:0] _T_413 = _T_412 | _T_409; // @[Mux.scala 27:73]
  wire [6:0] _T_414 = _T_413 | _T_410; // @[Mux.scala 27:73]
  wire [2:0] _T_416 = muxStateEarly_1_0 ? auto_in_c_bits_size : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_4_bits_size = TLBroadcastTracker_io_out_a_bits_size; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_417 = muxStateEarly_1_1 ? out_4_bits_size : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_5_bits_size = TLBroadcastTracker_1_io_out_a_bits_size; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_418 = muxStateEarly_1_2 ? out_5_bits_size : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_6_bits_size = TLBroadcastTracker_2_io_out_a_bits_size; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_419 = muxStateEarly_1_3 ? out_6_bits_size : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_7_bits_size = TLBroadcastTracker_3_io_out_a_bits_size; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_420 = muxStateEarly_1_4 ? out_7_bits_size : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_421 = _T_416 | _T_417; // @[Mux.scala 27:73]
  wire [2:0] _T_422 = _T_421 | _T_418; // @[Mux.scala 27:73]
  wire [2:0] _T_423 = _T_422 | _T_419; // @[Mux.scala 27:73]
  wire [2:0] out_4_bits_param = TLBroadcastTracker_io_out_a_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_426 = muxStateEarly_1_1 ? out_4_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_5_bits_param = TLBroadcastTracker_1_io_out_a_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_427 = muxStateEarly_1_2 ? out_5_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_6_bits_param = TLBroadcastTracker_2_io_out_a_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_428 = muxStateEarly_1_3 ? out_6_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_7_bits_param = TLBroadcastTracker_3_io_out_a_bits_param; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_429 = muxStateEarly_1_4 ? out_7_bits_param : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_431 = _T_426 | _T_427; // @[Mux.scala 27:73]
  wire [2:0] _T_432 = _T_431 | _T_428; // @[Mux.scala 27:73]
  wire [2:0] out_4_bits_opcode = TLBroadcastTracker_io_out_a_bits_opcode; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_435 = muxStateEarly_1_1 ? out_4_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_5_bits_opcode = TLBroadcastTracker_1_io_out_a_bits_opcode; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_436 = muxStateEarly_1_2 ? out_5_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_6_bits_opcode = TLBroadcastTracker_2_io_out_a_bits_opcode; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_437 = muxStateEarly_1_3 ? out_6_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] out_7_bits_opcode = TLBroadcastTracker_3_io_out_a_bits_opcode; // @[ReadyValidCancel.scala 68:19 71:14]
  wire [2:0] _T_438 = muxStateEarly_1_4 ? out_7_bits_opcode : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_440 = _T_435 | _T_436; // @[Mux.scala 27:73]
  wire [2:0] _T_441 = _T_440 | _T_437; // @[Mux.scala 27:73]
  reg  REG; // @[Broadcast.scala 215:31]
  reg [25:0] REG_1; // @[Broadcast.scala 216:27]
  reg [1:0] REG_2; // @[Broadcast.scala 217:28]
  wire [1:0] _T_444 = {REG, 1'h0}; // @[Broadcast.scala 218:58]
  wire [1:0] _T_445 = ~_T_444; // @[Broadcast.scala 218:37]
  wire [1:0] _GEN_16 = {{1'd0}, REG}; // @[Broadcast.scala 218:35]
  wire [1:0] _T_446 = _GEN_16 & _T_445; // @[Broadcast.scala 218:35]
  wire  bundleIn_0_b_valid = |REG; // @[Broadcast.scala 219:38]
  wire  _T_449 = auto_in_b_ready & bundleIn_0_b_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _T_450 = ~_T_446; // @[Broadcast.scala 227:55]
  wire [1:0] _T_451 = _GEN_16 & _T_450; // @[Broadcast.scala 227:53]
  wire [1:0] _GEN_5 = _T_449 ? _T_451 : {{1'd0}, REG}; // @[Broadcast.scala 227:26 215:31 227:39]
  reg [2:0] counter_2; // @[Edges.scala 228:27]
  wire  first_2 = counter_2 == 3'h0; // @[Edges.scala 230:25]
  wire  _bundleIn_0_a_ready_T_1 = ~first_2 | BroadcastFilter_io_request_ready; // @[Broadcast.scala 243:31]
  wire [3:0] _T_464 = {TLBroadcastTracker_3_io_line == auto_in_a_bits_address[31:6],TLBroadcastTracker_2_io_line ==
    auto_in_a_bits_address[31:6],TLBroadcastTracker_1_io_line == auto_in_a_bits_address[31:6],TLBroadcastTracker_io_line
     == auto_in_a_bits_address[31:6]}; // @[Broadcast.scala 236:100]
  wire  _T_465 = |_T_464; // @[Broadcast.scala 237:43]
  wire  _WIRE_38_3 = TLBroadcastTracker_3_io_idle; // @[Broadcast.scala 234:{33,33}]
  wire  _WIRE_38_2 = TLBroadcastTracker_2_io_idle; // @[Broadcast.scala 234:{33,33}]
  wire  _WIRE_38_1 = TLBroadcastTracker_1_io_idle; // @[Broadcast.scala 234:{33,33}]
  wire  _WIRE_38_0 = TLBroadcastTracker_io_idle; // @[Broadcast.scala 234:{33,33}]
  wire [3:0] _T_454 = {_WIRE_38_3,_WIRE_38_2,_WIRE_38_1,_WIRE_38_0}; // @[Broadcast.scala 234:64]
  wire [4:0] _T_466 = {_T_454, 1'h0}; // @[package.scala 244:48]
  wire [3:0] _T_468 = _T_454 | _T_466[3:0]; // @[package.scala 244:43]
  wire [5:0] _T_469 = {_T_468, 2'h0}; // @[package.scala 244:48]
  wire [3:0] _T_471 = _T_468 | _T_469[3:0]; // @[package.scala 244:43]
  wire [4:0] _T_473 = {_T_471, 1'h0}; // @[Broadcast.scala 238:64]
  wire [4:0] _T_474 = ~_T_473; // @[Broadcast.scala 238:41]
  wire [4:0] _GEN_18 = {{1'd0}, _T_454}; // @[Broadcast.scala 238:39]
  wire [4:0] _T_475 = _GEN_18 & _T_474; // @[Broadcast.scala 238:39]
  wire [4:0] _T_476 = _T_465 ? {{1'd0}, _T_464} : _T_475; // @[Broadcast.scala 239:30]
  wire  _WIRE_40_3 = TLBroadcastTracker_3_io_in_a_ready; // @[Broadcast.scala 240:{34,34}]
  wire  _WIRE_40_2 = TLBroadcastTracker_2_io_in_a_ready; // @[Broadcast.scala 240:{34,34}]
  wire  _WIRE_40_1 = TLBroadcastTracker_1_io_in_a_ready; // @[Broadcast.scala 240:{34,34}]
  wire  _WIRE_40_0 = TLBroadcastTracker_io_in_a_ready; // @[Broadcast.scala 240:{34,34}]
  wire [3:0] _T_477 = {_WIRE_40_3,_WIRE_40_2,_WIRE_40_1,_WIRE_40_0}; // @[Broadcast.scala 240:63]
  wire [4:0] _GEN_19 = {{1'd0}, _T_477}; // @[Broadcast.scala 241:41]
  wire [4:0] _T_478 = _T_476 & _GEN_19; // @[Broadcast.scala 241:41]
  wire  _T_479 = |_T_478; // @[Broadcast.scala 241:61]
  wire  bundleIn_0_a_ready = (~first_2 | BroadcastFilter_io_request_ready) & _T_479; // @[Broadcast.scala 243:59]
  wire  _T_453 = bundleIn_0_a_ready & auto_in_a_valid; // @[Decoupled.scala 50:35]
  wire [12:0] _beats1_decode_T_9 = 13'h3f << auto_in_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _beats1_decode_T_11 = ~_beats1_decode_T_9[5:0]; // @[package.scala 234:46]
  wire [2:0] beats1_decode_2 = _beats1_decode_T_11[5:3]; // @[Edges.scala 219:59]
  wire  beats1_opdata_2 = ~auto_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [2:0] counter1_2 = counter_2 - 3'h1; // @[Edges.scala 229:28]
  wire [3:0] lo_5 = _T_476[3:0]; // @[OneHot.scala 31:18]
  wire  _T_503 = |_T_476[4]; // @[OneHot.scala 32:14]
  wire [3:0] _GEN_20 = {{3'd0}, _T_476[4]}; // @[OneHot.scala 32:28]
  wire [3:0] _T_504 = _GEN_20 | lo_5; // @[OneHot.scala 32:28]
  wire [1:0] hi_6 = _T_504[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] lo_6 = _T_504[1:0]; // @[OneHot.scala 31:18]
  wire  _T_505 = |hi_6; // @[OneHot.scala 32:14]
  wire [1:0] _T_506 = hi_6 | lo_6; // @[OneHot.scala 32:28]
  wire [2:0] _T_509 = {_T_503,_T_505,_T_506[1]}; // @[Cat.scala 31:58]
  wire  acq_needT = 3'h2 == auto_in_a_bits_param | 3'h1 == auto_in_a_bits_param; // @[Mux.scala 81:58]
  wire  _T_521 = 3'h4 == auto_in_a_bits_opcode ? 1'h0 : 1'h1; // @[Mux.scala 81:58]
  wire  _T_523 = 3'h5 == auto_in_a_bits_opcode ? 3'h1 == auto_in_a_bits_param : _T_521; // @[Mux.scala 81:58]
  wire  _T_525 = 3'h6 == auto_in_a_bits_opcode ? acq_needT : _T_523; // @[Mux.scala 81:58]
  wire  _T_531 = ~BroadcastFilter_io_response_bits_allocOH; // @[Broadcast.scala 257:54]
  wire  _T_535 = BroadcastFilter_io_response_ready & BroadcastFilter_io_response_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _GEN_7 = _T_535 ? {{1'd0}, _T_531} : _GEN_5; // @[Broadcast.scala 260:40 261:21]
  wire [1:0] shiftAmount = BroadcastFilter_io_response_bits_mshr; // @[OneHot.scala 63:49]
  wire [3:0] _T_540 = 4'h1 << shiftAmount; // @[OneHot.scala 64:12]
  TLMonitor_21 monitor ( // @[Nodes.scala 24:25]
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
    .io_in_b_ready(monitor_io_in_b_ready),
    .io_in_b_valid(monitor_io_in_b_valid),
    .io_in_b_bits_param(monitor_io_in_b_bits_param),
    .io_in_b_bits_address(monitor_io_in_b_bits_address),
    .io_in_c_ready(monitor_io_in_c_ready),
    .io_in_c_valid(monitor_io_in_c_valid),
    .io_in_c_bits_opcode(monitor_io_in_c_bits_opcode),
    .io_in_c_bits_param(monitor_io_in_c_bits_param),
    .io_in_c_bits_size(monitor_io_in_c_bits_size),
    .io_in_c_bits_source(monitor_io_in_c_bits_source),
    .io_in_c_bits_address(monitor_io_in_c_bits_address),
    .io_in_c_bits_corrupt(monitor_io_in_c_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt),
    .io_in_e_valid(monitor_io_in_e_valid),
    .io_in_e_bits_sink(monitor_io_in_e_bits_sink)
  );
  BroadcastFilter BroadcastFilter ( // @[Broadcast.scala 99:26]
    .io_request_ready(BroadcastFilter_io_request_ready),
    .io_request_valid(BroadcastFilter_io_request_valid),
    .io_request_bits_mshr(BroadcastFilter_io_request_bits_mshr),
    .io_request_bits_address(BroadcastFilter_io_request_bits_address),
    .io_request_bits_allocOH(BroadcastFilter_io_request_bits_allocOH),
    .io_request_bits_needT(BroadcastFilter_io_request_bits_needT),
    .io_response_ready(BroadcastFilter_io_response_ready),
    .io_response_valid(BroadcastFilter_io_response_valid),
    .io_response_bits_mshr(BroadcastFilter_io_response_bits_mshr),
    .io_response_bits_address(BroadcastFilter_io_response_bits_address),
    .io_response_bits_allocOH(BroadcastFilter_io_response_bits_allocOH),
    .io_response_bits_needT(BroadcastFilter_io_response_bits_needT)
  );
  TLBroadcastTracker TLBroadcastTracker ( // @[Broadcast.scala 107:15]
    .clock(TLBroadcastTracker_clock),
    .reset(TLBroadcastTracker_reset),
    .io_in_a_first(TLBroadcastTracker_io_in_a_first),
    .io_in_a_ready(TLBroadcastTracker_io_in_a_ready),
    .io_in_a_valid(TLBroadcastTracker_io_in_a_valid),
    .io_in_a_bits_opcode(TLBroadcastTracker_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLBroadcastTracker_io_in_a_bits_param),
    .io_in_a_bits_size(TLBroadcastTracker_io_in_a_bits_size),
    .io_in_a_bits_source(TLBroadcastTracker_io_in_a_bits_source),
    .io_in_a_bits_address(TLBroadcastTracker_io_in_a_bits_address),
    .io_in_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_io_in_a_bits_user_amba_prot_bufferable),
    .io_in_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_io_in_a_bits_user_amba_prot_modifiable),
    .io_in_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_io_in_a_bits_user_amba_prot_readalloc),
    .io_in_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_io_in_a_bits_user_amba_prot_writealloc),
    .io_in_a_bits_user_amba_prot_privileged(TLBroadcastTracker_io_in_a_bits_user_amba_prot_privileged),
    .io_in_a_bits_user_amba_prot_secure(TLBroadcastTracker_io_in_a_bits_user_amba_prot_secure),
    .io_in_a_bits_user_amba_prot_fetch(TLBroadcastTracker_io_in_a_bits_user_amba_prot_fetch),
    .io_in_a_bits_mask(TLBroadcastTracker_io_in_a_bits_mask),
    .io_in_a_bits_data(TLBroadcastTracker_io_in_a_bits_data),
    .io_out_a_ready(TLBroadcastTracker_io_out_a_ready),
    .io_out_a_valid(TLBroadcastTracker_io_out_a_valid),
    .io_out_a_bits_opcode(TLBroadcastTracker_io_out_a_bits_opcode),
    .io_out_a_bits_param(TLBroadcastTracker_io_out_a_bits_param),
    .io_out_a_bits_size(TLBroadcastTracker_io_out_a_bits_size),
    .io_out_a_bits_source(TLBroadcastTracker_io_out_a_bits_source),
    .io_out_a_bits_address(TLBroadcastTracker_io_out_a_bits_address),
    .io_out_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_io_out_a_bits_user_amba_prot_bufferable),
    .io_out_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_io_out_a_bits_user_amba_prot_modifiable),
    .io_out_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_io_out_a_bits_user_amba_prot_readalloc),
    .io_out_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_io_out_a_bits_user_amba_prot_writealloc),
    .io_out_a_bits_user_amba_prot_privileged(TLBroadcastTracker_io_out_a_bits_user_amba_prot_privileged),
    .io_out_a_bits_user_amba_prot_secure(TLBroadcastTracker_io_out_a_bits_user_amba_prot_secure),
    .io_out_a_bits_user_amba_prot_fetch(TLBroadcastTracker_io_out_a_bits_user_amba_prot_fetch),
    .io_out_a_bits_mask(TLBroadcastTracker_io_out_a_bits_mask),
    .io_out_a_bits_data(TLBroadcastTracker_io_out_a_bits_data),
    .io_probe_valid(TLBroadcastTracker_io_probe_valid),
    .io_probe_bits_count(TLBroadcastTracker_io_probe_bits_count),
    .io_probenack(TLBroadcastTracker_io_probenack),
    .io_probedack(TLBroadcastTracker_io_probedack),
    .io_probesack(TLBroadcastTracker_io_probesack),
    .io_d_last(TLBroadcastTracker_io_d_last),
    .io_e_last(TLBroadcastTracker_io_e_last),
    .io_source(TLBroadcastTracker_io_source),
    .io_line(TLBroadcastTracker_io_line),
    .io_idle(TLBroadcastTracker_io_idle),
    .io_need_d(TLBroadcastTracker_io_need_d)
  );
  TLBroadcastTracker_1 TLBroadcastTracker_1 ( // @[Broadcast.scala 107:15]
    .clock(TLBroadcastTracker_1_clock),
    .reset(TLBroadcastTracker_1_reset),
    .io_in_a_first(TLBroadcastTracker_1_io_in_a_first),
    .io_in_a_ready(TLBroadcastTracker_1_io_in_a_ready),
    .io_in_a_valid(TLBroadcastTracker_1_io_in_a_valid),
    .io_in_a_bits_opcode(TLBroadcastTracker_1_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLBroadcastTracker_1_io_in_a_bits_param),
    .io_in_a_bits_size(TLBroadcastTracker_1_io_in_a_bits_size),
    .io_in_a_bits_source(TLBroadcastTracker_1_io_in_a_bits_source),
    .io_in_a_bits_address(TLBroadcastTracker_1_io_in_a_bits_address),
    .io_in_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_bufferable),
    .io_in_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_modifiable),
    .io_in_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_readalloc),
    .io_in_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_writealloc),
    .io_in_a_bits_user_amba_prot_privileged(TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_privileged),
    .io_in_a_bits_user_amba_prot_secure(TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_secure),
    .io_in_a_bits_user_amba_prot_fetch(TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_fetch),
    .io_in_a_bits_mask(TLBroadcastTracker_1_io_in_a_bits_mask),
    .io_in_a_bits_data(TLBroadcastTracker_1_io_in_a_bits_data),
    .io_out_a_ready(TLBroadcastTracker_1_io_out_a_ready),
    .io_out_a_valid(TLBroadcastTracker_1_io_out_a_valid),
    .io_out_a_bits_opcode(TLBroadcastTracker_1_io_out_a_bits_opcode),
    .io_out_a_bits_param(TLBroadcastTracker_1_io_out_a_bits_param),
    .io_out_a_bits_size(TLBroadcastTracker_1_io_out_a_bits_size),
    .io_out_a_bits_source(TLBroadcastTracker_1_io_out_a_bits_source),
    .io_out_a_bits_address(TLBroadcastTracker_1_io_out_a_bits_address),
    .io_out_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_bufferable),
    .io_out_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_modifiable),
    .io_out_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_readalloc),
    .io_out_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_writealloc),
    .io_out_a_bits_user_amba_prot_privileged(TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_privileged),
    .io_out_a_bits_user_amba_prot_secure(TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_secure),
    .io_out_a_bits_user_amba_prot_fetch(TLBroadcastTracker_1_io_out_a_bits_user_amba_prot_fetch),
    .io_out_a_bits_mask(TLBroadcastTracker_1_io_out_a_bits_mask),
    .io_out_a_bits_data(TLBroadcastTracker_1_io_out_a_bits_data),
    .io_probe_valid(TLBroadcastTracker_1_io_probe_valid),
    .io_probe_bits_count(TLBroadcastTracker_1_io_probe_bits_count),
    .io_probenack(TLBroadcastTracker_1_io_probenack),
    .io_probedack(TLBroadcastTracker_1_io_probedack),
    .io_probesack(TLBroadcastTracker_1_io_probesack),
    .io_d_last(TLBroadcastTracker_1_io_d_last),
    .io_e_last(TLBroadcastTracker_1_io_e_last),
    .io_source(TLBroadcastTracker_1_io_source),
    .io_line(TLBroadcastTracker_1_io_line),
    .io_idle(TLBroadcastTracker_1_io_idle),
    .io_need_d(TLBroadcastTracker_1_io_need_d)
  );
  TLBroadcastTracker_2 TLBroadcastTracker_2 ( // @[Broadcast.scala 107:15]
    .clock(TLBroadcastTracker_2_clock),
    .reset(TLBroadcastTracker_2_reset),
    .io_in_a_first(TLBroadcastTracker_2_io_in_a_first),
    .io_in_a_ready(TLBroadcastTracker_2_io_in_a_ready),
    .io_in_a_valid(TLBroadcastTracker_2_io_in_a_valid),
    .io_in_a_bits_opcode(TLBroadcastTracker_2_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLBroadcastTracker_2_io_in_a_bits_param),
    .io_in_a_bits_size(TLBroadcastTracker_2_io_in_a_bits_size),
    .io_in_a_bits_source(TLBroadcastTracker_2_io_in_a_bits_source),
    .io_in_a_bits_address(TLBroadcastTracker_2_io_in_a_bits_address),
    .io_in_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_bufferable),
    .io_in_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_modifiable),
    .io_in_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_readalloc),
    .io_in_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_writealloc),
    .io_in_a_bits_user_amba_prot_privileged(TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_privileged),
    .io_in_a_bits_user_amba_prot_secure(TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_secure),
    .io_in_a_bits_user_amba_prot_fetch(TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_fetch),
    .io_in_a_bits_mask(TLBroadcastTracker_2_io_in_a_bits_mask),
    .io_in_a_bits_data(TLBroadcastTracker_2_io_in_a_bits_data),
    .io_out_a_ready(TLBroadcastTracker_2_io_out_a_ready),
    .io_out_a_valid(TLBroadcastTracker_2_io_out_a_valid),
    .io_out_a_bits_opcode(TLBroadcastTracker_2_io_out_a_bits_opcode),
    .io_out_a_bits_param(TLBroadcastTracker_2_io_out_a_bits_param),
    .io_out_a_bits_size(TLBroadcastTracker_2_io_out_a_bits_size),
    .io_out_a_bits_source(TLBroadcastTracker_2_io_out_a_bits_source),
    .io_out_a_bits_address(TLBroadcastTracker_2_io_out_a_bits_address),
    .io_out_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_bufferable),
    .io_out_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_modifiable),
    .io_out_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_readalloc),
    .io_out_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_writealloc),
    .io_out_a_bits_user_amba_prot_privileged(TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_privileged),
    .io_out_a_bits_user_amba_prot_secure(TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_secure),
    .io_out_a_bits_user_amba_prot_fetch(TLBroadcastTracker_2_io_out_a_bits_user_amba_prot_fetch),
    .io_out_a_bits_mask(TLBroadcastTracker_2_io_out_a_bits_mask),
    .io_out_a_bits_data(TLBroadcastTracker_2_io_out_a_bits_data),
    .io_probe_valid(TLBroadcastTracker_2_io_probe_valid),
    .io_probe_bits_count(TLBroadcastTracker_2_io_probe_bits_count),
    .io_probenack(TLBroadcastTracker_2_io_probenack),
    .io_probedack(TLBroadcastTracker_2_io_probedack),
    .io_probesack(TLBroadcastTracker_2_io_probesack),
    .io_d_last(TLBroadcastTracker_2_io_d_last),
    .io_e_last(TLBroadcastTracker_2_io_e_last),
    .io_source(TLBroadcastTracker_2_io_source),
    .io_line(TLBroadcastTracker_2_io_line),
    .io_idle(TLBroadcastTracker_2_io_idle),
    .io_need_d(TLBroadcastTracker_2_io_need_d)
  );
  TLBroadcastTracker_3 TLBroadcastTracker_3 ( // @[Broadcast.scala 107:15]
    .clock(TLBroadcastTracker_3_clock),
    .reset(TLBroadcastTracker_3_reset),
    .io_in_a_first(TLBroadcastTracker_3_io_in_a_first),
    .io_in_a_ready(TLBroadcastTracker_3_io_in_a_ready),
    .io_in_a_valid(TLBroadcastTracker_3_io_in_a_valid),
    .io_in_a_bits_opcode(TLBroadcastTracker_3_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLBroadcastTracker_3_io_in_a_bits_param),
    .io_in_a_bits_size(TLBroadcastTracker_3_io_in_a_bits_size),
    .io_in_a_bits_source(TLBroadcastTracker_3_io_in_a_bits_source),
    .io_in_a_bits_address(TLBroadcastTracker_3_io_in_a_bits_address),
    .io_in_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_bufferable),
    .io_in_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_modifiable),
    .io_in_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_readalloc),
    .io_in_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_writealloc),
    .io_in_a_bits_user_amba_prot_privileged(TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_privileged),
    .io_in_a_bits_user_amba_prot_secure(TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_secure),
    .io_in_a_bits_user_amba_prot_fetch(TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_fetch),
    .io_in_a_bits_mask(TLBroadcastTracker_3_io_in_a_bits_mask),
    .io_in_a_bits_data(TLBroadcastTracker_3_io_in_a_bits_data),
    .io_out_a_ready(TLBroadcastTracker_3_io_out_a_ready),
    .io_out_a_valid(TLBroadcastTracker_3_io_out_a_valid),
    .io_out_a_bits_opcode(TLBroadcastTracker_3_io_out_a_bits_opcode),
    .io_out_a_bits_param(TLBroadcastTracker_3_io_out_a_bits_param),
    .io_out_a_bits_size(TLBroadcastTracker_3_io_out_a_bits_size),
    .io_out_a_bits_source(TLBroadcastTracker_3_io_out_a_bits_source),
    .io_out_a_bits_address(TLBroadcastTracker_3_io_out_a_bits_address),
    .io_out_a_bits_user_amba_prot_bufferable(TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_bufferable),
    .io_out_a_bits_user_amba_prot_modifiable(TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_modifiable),
    .io_out_a_bits_user_amba_prot_readalloc(TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_readalloc),
    .io_out_a_bits_user_amba_prot_writealloc(TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_writealloc),
    .io_out_a_bits_user_amba_prot_privileged(TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_privileged),
    .io_out_a_bits_user_amba_prot_secure(TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_secure),
    .io_out_a_bits_user_amba_prot_fetch(TLBroadcastTracker_3_io_out_a_bits_user_amba_prot_fetch),
    .io_out_a_bits_mask(TLBroadcastTracker_3_io_out_a_bits_mask),
    .io_out_a_bits_data(TLBroadcastTracker_3_io_out_a_bits_data),
    .io_probe_valid(TLBroadcastTracker_3_io_probe_valid),
    .io_probe_bits_count(TLBroadcastTracker_3_io_probe_bits_count),
    .io_probenack(TLBroadcastTracker_3_io_probenack),
    .io_probedack(TLBroadcastTracker_3_io_probedack),
    .io_probesack(TLBroadcastTracker_3_io_probesack),
    .io_d_last(TLBroadcastTracker_3_io_d_last),
    .io_e_last(TLBroadcastTracker_3_io_e_last),
    .io_source(TLBroadcastTracker_3_io_source),
    .io_line(TLBroadcastTracker_3_io_line),
    .io_idle(TLBroadcastTracker_3_io_idle),
    .io_need_d(TLBroadcastTracker_3_io_need_d)
  );
  assign auto_in_a_ready = (~first_2 | BroadcastFilter_io_request_ready) & _T_479; // @[Broadcast.scala 243:59]
  assign auto_in_b_valid = |REG; // @[Broadcast.scala 219:38]
  assign auto_in_b_bits_param = REG_2; // @[Edges.scala 600:17 602:15]
  assign auto_in_b_bits_address = {REG_1, 6'h0}; // @[Broadcast.scala 225:46]
  assign auto_in_c_ready = _T_110 | _bundleIn_0_c_ready_T; // @[Broadcast.scala 184:32]
  assign auto_in_d_valid = idle ? _T_217 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_in_d_bits_opcode = _T_252 | _T_253; // @[Mux.scala 27:73]
  assign auto_in_d_bits_param = muxStateEarly__1 ? out_1_bits_param : 2'h0; // @[Mux.scala 27:73]
  assign auto_in_d_bits_size = _T_246 | _T_247; // @[Mux.scala 27:73]
  assign auto_in_d_bits_source = _T_243 | _T_244; // @[Mux.scala 27:73]
  assign auto_in_d_bits_sink = muxStateEarly__1 ? out_1_bits_sink : 2'h0; // @[Mux.scala 27:73]
  assign auto_in_d_bits_denied = muxStateEarly__1 & auto_out_d_bits_denied; // @[Mux.scala 27:73]
  assign auto_in_d_bits_data = muxStateEarly__1 ? auto_out_d_bits_data : 64'h0; // @[Mux.scala 27:73]
  assign auto_in_d_bits_corrupt = muxStateEarly__1 & auto_out_d_bits_corrupt; // @[Mux.scala 27:73]
  assign auto_out_a_valid = idle_1 ? _T_285 : _sink_ACancel_earlyValid_T_17; // @[Arbiter.scala 125:29]
  assign auto_out_a_bits_opcode = _T_441 | _T_438; // @[Mux.scala 27:73]
  assign auto_out_a_bits_param = _T_432 | _T_429; // @[Mux.scala 27:73]
  assign auto_out_a_bits_size = _T_423 | _T_420; // @[Mux.scala 27:73]
  assign auto_out_a_bits_source = _T_414 | _T_411; // @[Mux.scala 27:73]
  assign auto_out_a_bits_address = _T_405 | _T_402; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_bufferable = muxStateEarly_1_0 | muxStateEarly_1_1 &
    out_4_bits_user_amba_prot_bufferable | muxStateEarly_1_2 & out_5_bits_user_amba_prot_bufferable | muxStateEarly_1_3
     & out_6_bits_user_amba_prot_bufferable | muxStateEarly_1_4 & out_7_bits_user_amba_prot_bufferable; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_modifiable = muxStateEarly_1_0 | muxStateEarly_1_1 &
    out_4_bits_user_amba_prot_modifiable | muxStateEarly_1_2 & out_5_bits_user_amba_prot_modifiable | muxStateEarly_1_3
     & out_6_bits_user_amba_prot_modifiable | muxStateEarly_1_4 & out_7_bits_user_amba_prot_modifiable; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_readalloc = muxStateEarly_1_0 | muxStateEarly_1_1 &
    out_4_bits_user_amba_prot_readalloc | muxStateEarly_1_2 & out_5_bits_user_amba_prot_readalloc | muxStateEarly_1_3 &
    out_6_bits_user_amba_prot_readalloc | muxStateEarly_1_4 & out_7_bits_user_amba_prot_readalloc; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_writealloc = muxStateEarly_1_0 | muxStateEarly_1_1 &
    out_4_bits_user_amba_prot_writealloc | muxStateEarly_1_2 & out_5_bits_user_amba_prot_writealloc | muxStateEarly_1_3
     & out_6_bits_user_amba_prot_writealloc | muxStateEarly_1_4 & out_7_bits_user_amba_prot_writealloc; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_privileged = muxStateEarly_1_0 | muxStateEarly_1_1 &
    out_4_bits_user_amba_prot_privileged | muxStateEarly_1_2 & out_5_bits_user_amba_prot_privileged | muxStateEarly_1_3
     & out_6_bits_user_amba_prot_privileged | muxStateEarly_1_4 & out_7_bits_user_amba_prot_privileged; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_secure = muxStateEarly_1_0 | muxStateEarly_1_1 &
    out_4_bits_user_amba_prot_secure | muxStateEarly_1_2 & out_5_bits_user_amba_prot_secure | muxStateEarly_1_3 &
    out_6_bits_user_amba_prot_secure | muxStateEarly_1_4 & out_7_bits_user_amba_prot_secure; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_fetch = muxStateEarly_1_1 & out_4_bits_user_amba_prot_fetch | muxStateEarly_1_2
     & out_5_bits_user_amba_prot_fetch | muxStateEarly_1_3 & out_6_bits_user_amba_prot_fetch | muxStateEarly_1_4 &
    out_7_bits_user_amba_prot_fetch; // @[Mux.scala 27:73]
  assign auto_out_a_bits_mask = _T_333 | _T_330; // @[Mux.scala 27:73]
  assign auto_out_a_bits_data = _T_324 | _T_321; // @[Mux.scala 27:73]
  assign auto_out_d_ready = out_1_ready | _T_14; // @[Broadcast.scala 128:50]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = (~first_2 | BroadcastFilter_io_request_ready) & _T_479; // @[Broadcast.scala 243:59]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_b_ready = auto_in_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_b_valid = |REG; // @[Broadcast.scala 219:38]
  assign monitor_io_in_b_bits_param = REG_2; // @[Edges.scala 600:17 602:15]
  assign monitor_io_in_b_bits_address = {REG_1, 6'h0}; // @[Broadcast.scala 225:46]
  assign monitor_io_in_c_ready = _T_110 | _bundleIn_0_c_ready_T; // @[Broadcast.scala 184:32]
  assign monitor_io_in_c_valid = auto_in_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_opcode = auto_in_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_param = auto_in_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_size = auto_in_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_source = auto_in_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_address = auto_in_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_corrupt = auto_in_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = idle ? _T_217 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign monitor_io_in_d_bits_opcode = _T_252 | _T_253; // @[Mux.scala 27:73]
  assign monitor_io_in_d_bits_param = muxStateEarly__1 ? out_1_bits_param : 2'h0; // @[Mux.scala 27:73]
  assign monitor_io_in_d_bits_size = _T_246 | _T_247; // @[Mux.scala 27:73]
  assign monitor_io_in_d_bits_source = _T_243 | _T_244; // @[Mux.scala 27:73]
  assign monitor_io_in_d_bits_sink = muxStateEarly__1 ? out_1_bits_sink : 2'h0; // @[Mux.scala 27:73]
  assign monitor_io_in_d_bits_denied = muxStateEarly__1 & auto_out_d_bits_denied; // @[Mux.scala 27:73]
  assign monitor_io_in_d_bits_corrupt = muxStateEarly__1 & auto_out_d_bits_corrupt; // @[Mux.scala 27:73]
  assign monitor_io_in_e_valid = auto_in_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_e_bits_sink = auto_in_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign BroadcastFilter_io_request_valid = auto_in_a_valid & first_2 & _T_479; // @[Broadcast.scala 250:56]
  assign BroadcastFilter_io_request_bits_mshr = _T_509[1:0]; // @[Broadcast.scala 251:38]
  assign BroadcastFilter_io_request_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign BroadcastFilter_io_request_bits_allocOH = auto_in_a_bits_source == 5'h10; // @[Parameters.scala 46:9]
  assign BroadcastFilter_io_request_bits_needT = 3'h7 == auto_in_a_bits_opcode ? acq_needT : _T_525; // @[Mux.scala 81:58]
  assign BroadcastFilter_io_response_ready = ~bundleIn_0_b_valid; // @[Broadcast.scala 259:35]
  assign TLBroadcastTracker_clock = clock;
  assign TLBroadcastTracker_reset = reset;
  assign TLBroadcastTracker_io_in_a_first = counter_2 == 3'h0; // @[Edges.scala 230:25]
  assign TLBroadcastTracker_io_in_a_valid = auto_in_a_valid & _T_476[0] & _bundleIn_0_a_ready_T_1; // @[Broadcast.scala 245:46]
  assign TLBroadcastTracker_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_user_amba_prot_bufferable = auto_in_a_bits_user_amba_prot_bufferable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_user_amba_prot_modifiable = auto_in_a_bits_user_amba_prot_modifiable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_user_amba_prot_readalloc = auto_in_a_bits_user_amba_prot_readalloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_user_amba_prot_writealloc = auto_in_a_bits_user_amba_prot_writealloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_user_amba_prot_privileged = auto_in_a_bits_user_amba_prot_privileged; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_user_amba_prot_secure = auto_in_a_bits_user_amba_prot_secure; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_user_amba_prot_fetch = auto_in_a_bits_user_amba_prot_fetch; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_io_out_a_ready = auto_out_a_ready & allowed_1_1; // @[Arbiter.scala 123:31]
  assign TLBroadcastTracker_io_probe_valid = _T_535 & _T_540[0]; // @[Broadcast.scala 272:58]
  assign TLBroadcastTracker_io_probe_bits_count = ~BroadcastFilter_io_response_bits_allocOH; // @[Broadcast.scala 257:54]
  assign TLBroadcastTracker_io_probenack = _T_135 & _T_110 & _T_115; // @[Broadcast.scala 175:56]
  assign TLBroadcastTracker_io_probedack = _GEN_1[0] & _T_65 & _T_14; // @[Broadcast.scala 143:53]
  assign TLBroadcastTracker_io_probesack = _T_135 & _T_115 & _T_136 & _T_150; // @[Broadcast.scala 176:86]
  assign TLBroadcastTracker_io_d_last = _GEN_1[0] & _T_15 & _T_56 & last; // @[Broadcast.scala 142:67]
  assign TLBroadcastTracker_io_e_last = _T[0] & auto_in_e_valid; // @[Broadcast.scala 113:34]
  assign TLBroadcastTracker_1_clock = clock;
  assign TLBroadcastTracker_1_reset = reset;
  assign TLBroadcastTracker_1_io_in_a_first = counter_2 == 3'h0; // @[Edges.scala 230:25]
  assign TLBroadcastTracker_1_io_in_a_valid = auto_in_a_valid & _T_476[1] & _bundleIn_0_a_ready_T_1; // @[Broadcast.scala 245:46]
  assign TLBroadcastTracker_1_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_bufferable = auto_in_a_bits_user_amba_prot_bufferable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_modifiable = auto_in_a_bits_user_amba_prot_modifiable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_readalloc = auto_in_a_bits_user_amba_prot_readalloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_writealloc = auto_in_a_bits_user_amba_prot_writealloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_privileged = auto_in_a_bits_user_amba_prot_privileged; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_secure = auto_in_a_bits_user_amba_prot_secure; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_user_amba_prot_fetch = auto_in_a_bits_user_amba_prot_fetch; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_1_io_out_a_ready = auto_out_a_ready & allowed_1_2; // @[Arbiter.scala 123:31]
  assign TLBroadcastTracker_1_io_probe_valid = _T_535 & _T_540[1]; // @[Broadcast.scala 272:58]
  assign TLBroadcastTracker_1_io_probe_bits_count = ~BroadcastFilter_io_response_bits_allocOH; // @[Broadcast.scala 257:54]
  assign TLBroadcastTracker_1_io_probenack = _T_135 & _T_110 & _T_117; // @[Broadcast.scala 175:56]
  assign TLBroadcastTracker_1_io_probedack = _GEN_1[1] & _T_65 & _T_14; // @[Broadcast.scala 143:53]
  assign TLBroadcastTracker_1_io_probesack = _T_135 & _T_117 & _T_136 & _T_150; // @[Broadcast.scala 176:86]
  assign TLBroadcastTracker_1_io_d_last = _GEN_1[1] & _T_15 & _T_56 & last; // @[Broadcast.scala 142:67]
  assign TLBroadcastTracker_1_io_e_last = _T[1] & auto_in_e_valid; // @[Broadcast.scala 113:34]
  assign TLBroadcastTracker_2_clock = clock;
  assign TLBroadcastTracker_2_reset = reset;
  assign TLBroadcastTracker_2_io_in_a_first = counter_2 == 3'h0; // @[Edges.scala 230:25]
  assign TLBroadcastTracker_2_io_in_a_valid = auto_in_a_valid & _T_476[2] & _bundleIn_0_a_ready_T_1; // @[Broadcast.scala 245:46]
  assign TLBroadcastTracker_2_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_bufferable = auto_in_a_bits_user_amba_prot_bufferable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_modifiable = auto_in_a_bits_user_amba_prot_modifiable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_readalloc = auto_in_a_bits_user_amba_prot_readalloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_writealloc = auto_in_a_bits_user_amba_prot_writealloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_privileged = auto_in_a_bits_user_amba_prot_privileged; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_secure = auto_in_a_bits_user_amba_prot_secure; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_user_amba_prot_fetch = auto_in_a_bits_user_amba_prot_fetch; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_2_io_out_a_ready = auto_out_a_ready & allowed_1_3; // @[Arbiter.scala 123:31]
  assign TLBroadcastTracker_2_io_probe_valid = _T_535 & _T_540[2]; // @[Broadcast.scala 272:58]
  assign TLBroadcastTracker_2_io_probe_bits_count = ~BroadcastFilter_io_response_bits_allocOH; // @[Broadcast.scala 257:54]
  assign TLBroadcastTracker_2_io_probenack = _T_135 & _T_110 & _T_119; // @[Broadcast.scala 175:56]
  assign TLBroadcastTracker_2_io_probedack = _GEN_1[2] & _T_65 & _T_14; // @[Broadcast.scala 143:53]
  assign TLBroadcastTracker_2_io_probesack = _T_135 & _T_119 & _T_136 & _T_150; // @[Broadcast.scala 176:86]
  assign TLBroadcastTracker_2_io_d_last = _GEN_1[2] & _T_15 & _T_56 & last; // @[Broadcast.scala 142:67]
  assign TLBroadcastTracker_2_io_e_last = _T[2] & auto_in_e_valid; // @[Broadcast.scala 113:34]
  assign TLBroadcastTracker_3_clock = clock;
  assign TLBroadcastTracker_3_reset = reset;
  assign TLBroadcastTracker_3_io_in_a_first = counter_2 == 3'h0; // @[Edges.scala 230:25]
  assign TLBroadcastTracker_3_io_in_a_valid = auto_in_a_valid & _T_476[3] & _bundleIn_0_a_ready_T_1; // @[Broadcast.scala 245:46]
  assign TLBroadcastTracker_3_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_bufferable = auto_in_a_bits_user_amba_prot_bufferable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_modifiable = auto_in_a_bits_user_amba_prot_modifiable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_readalloc = auto_in_a_bits_user_amba_prot_readalloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_writealloc = auto_in_a_bits_user_amba_prot_writealloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_privileged = auto_in_a_bits_user_amba_prot_privileged; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_secure = auto_in_a_bits_user_amba_prot_secure; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_user_amba_prot_fetch = auto_in_a_bits_user_amba_prot_fetch; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_in_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign TLBroadcastTracker_3_io_out_a_ready = auto_out_a_ready & allowed_1_4; // @[Arbiter.scala 123:31]
  assign TLBroadcastTracker_3_io_probe_valid = _T_535 & _T_540[3]; // @[Broadcast.scala 272:58]
  assign TLBroadcastTracker_3_io_probe_bits_count = ~BroadcastFilter_io_response_bits_allocOH; // @[Broadcast.scala 257:54]
  assign TLBroadcastTracker_3_io_probenack = _T_135 & _T_110 & _T_121; // @[Broadcast.scala 175:56]
  assign TLBroadcastTracker_3_io_probedack = _GEN_1[3] & _T_65 & _T_14; // @[Broadcast.scala 143:53]
  assign TLBroadcastTracker_3_io_probesack = _T_135 & _T_121 & _T_136 & _T_150; // @[Broadcast.scala 176:86]
  assign TLBroadcastTracker_3_io_d_last = _GEN_1[3] & _T_15 & _T_56 & last; // @[Broadcast.scala 142:67]
  assign TLBroadcastTracker_3_io_e_last = _T[3] & auto_in_e_valid; // @[Broadcast.scala 113:34]
  always @(posedge clock) begin
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft <= 3'h0; // @[Arbiter.scala 87:30]
    end else if (latch) begin // @[Arbiter.scala 113:23]
      if (earlyWinner__1) begin // @[Arbiter.scala 111:73]
        if (beats1_opdata) begin // @[Edges.scala 220:14]
          beatsLeft <= beats1_decode;
        end else begin
          beatsLeft <= 3'h0;
        end
      end else begin
        beatsLeft <= 3'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (_T_15) begin // @[Edges.scala 234:17]
      if (first) begin // @[Edges.scala 235:21]
        if (beats1_opdata) begin // @[Edges.scala 220:14]
          counter <= beats1_decode;
        end else begin
          counter <= 3'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state__1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state__1 <= earlyWinner__1;
    end
    if (first) begin // @[Reg.scala 17:18]
      r <= _T_24; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state__0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state__0 <= earlyWinner__0;
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft_1 <= 3'h0; // @[Arbiter.scala 87:30]
    end else if (latch_1) begin // @[Arbiter.scala 113:23]
      beatsLeft_1 <= initBeats_1;
    end else begin
      beatsLeft_1 <= _beatsLeft_T_10;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_0 <= earlyWinner_1_0;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_1 <= earlyWinner_1_1;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_2 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_2 <= earlyWinner_1_2;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_3 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_3 <= earlyWinner_1_3;
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1_4 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle_1) begin // @[Arbiter.scala 117:30]
      state_1_4 <= earlyWinner_1_4;
    end
    if (reset) begin // @[Broadcast.scala 215:31]
      REG <= 1'h0; // @[Broadcast.scala 215:31]
    end else begin
      REG <= _GEN_7[0];
    end
    if (_T_535) begin // @[Broadcast.scala 260:40]
      REG_1 <= BroadcastFilter_io_response_bits_address[31:6]; // @[Broadcast.scala 262:21]
    end
    if (_T_535) begin // @[Broadcast.scala 260:40]
      if (BroadcastFilter_io_response_bits_needT) begin // @[Broadcast.scala 263:27]
        REG_2 <= 2'h2;
      end else begin
        REG_2 <= 2'h1;
      end
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter_2 <= 3'h0; // @[Edges.scala 228:27]
    end else if (_T_453) begin // @[Edges.scala 234:17]
      if (first_2) begin // @[Edges.scala 235:21]
        if (beats1_opdata_2) begin // @[Edges.scala 220:14]
          counter_2 <= beats1_decode_2;
        end else begin
          counter_2 <= 3'h0;
        end
      end else begin
        counter_2 <= counter1_2;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~auto_out_d_valid | _T_35 | auto_out_d_bits_opcode == 3'h0) & ~reset) begin
          $fatal; // @[Broadcast.scala 125:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~auto_out_d_valid | _T_35 | auto_out_d_bits_opcode == 3'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Broadcast.scala:125 assert (!out.d.valid || !d_drop || out.d.bits.opcode === TLMessages.AccessAck)\n"
            ); // @[Broadcast.scala 125:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~out_1_earlyValid | (|_GEN_1 | out_1_bits_opcode == 3'h6)) & _T_32) begin
          $fatal; // @[Broadcast.scala 137:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & ~(~out_1_earlyValid | (|_GEN_1 | out_1_bits_opcode == 3'h6))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Broadcast.scala:137 assert (!d_normal.valid || (d_trackerOH.orR() || d_normal.bits.opcode === TLMessages.ReleaseAck))\n"
            ); // @[Broadcast.scala 137:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner__0 | ~earlyWinner__1) & _T_32) begin
          $fatal; // @[Arbiter.scala 105:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & ~(~earlyWinner__0 | ~earlyWinner__1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(out_earlyValid | out_1_earlyValid) | _prefixOR_T) & _T_32) begin
          $fatal; // @[Arbiter.scala 107:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & ~(~(out_earlyValid | out_1_earlyValid) | _prefixOR_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_218 | _T_217) & _T_32) begin
          $fatal; // @[Arbiter.scala 108:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & ~(_T_218 | _T_217)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~((~earlyWinner_1_0 | ~earlyWinner_1_1) & (~prefixOR_2 | ~earlyWinner_1_2) & (~prefixOR_3 | ~earlyWinner_1_3
          ) & (~prefixOR_4 | ~earlyWinner_1_4)) & _T_32) begin
          $fatal; // @[Arbiter.scala 105:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & ~((~earlyWinner_1_0 | ~earlyWinner_1_1) & (~prefixOR_2 | ~earlyWinner_1_2) & (~prefixOR_3 | ~
          earlyWinner_1_3) & (~prefixOR_4 | ~earlyWinner_1_4))) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(out_3_earlyValid | out_4_earlyValid | out_5_earlyValid | out_6_earlyValid | out_7_earlyValid) |
          _prefixOR_T_1) & _T_32) begin
          $fatal; // @[Arbiter.scala 107:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & ~(~(out_3_earlyValid | out_4_earlyValid | out_5_earlyValid | out_6_earlyValid | out_7_earlyValid) |
          _prefixOR_T_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_286 | _T_285) & _T_32) begin
          $fatal; // @[Arbiter.scala 108:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_32 & ~(_T_286 | _T_285)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14]
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
  beatsLeft = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  counter = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  state__1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  r = _RAND_3[3:0];
  _RAND_4 = {1{`RANDOM}};
  state__0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  beatsLeft_1 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  state_1_0 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  state_1_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  state_1_2 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  state_1_3 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  state_1_4 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  REG = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  REG_1 = _RAND_12[25:0];
  _RAND_13 = {1{`RANDOM}};
  REG_2 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  counter_2 = _RAND_14[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
