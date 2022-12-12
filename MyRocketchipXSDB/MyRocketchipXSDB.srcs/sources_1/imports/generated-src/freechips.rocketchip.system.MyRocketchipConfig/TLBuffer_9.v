module TLBuffer_9(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [1:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [2:0]  auto_in_b_bits_opcode,
  output [1:0]  auto_in_b_bits_param,
  output [3:0]  auto_in_b_bits_size,
  output [1:0]  auto_in_b_bits_source,
  output [31:0] auto_in_b_bits_address,
  output [7:0]  auto_in_b_bits_mask,
  output        auto_in_b_bits_corrupt,
  output        auto_in_c_ready,
  input         auto_in_c_valid,
  input  [2:0]  auto_in_c_bits_opcode,
  input  [2:0]  auto_in_c_bits_param,
  input  [3:0]  auto_in_c_bits_size,
  input  [1:0]  auto_in_c_bits_source,
  input  [31:0] auto_in_c_bits_address,
  input  [63:0] auto_in_c_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [1:0]  auto_in_d_bits_source,
  output [1:0]  auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  output        auto_in_e_ready,
  input         auto_in_e_valid,
  input  [1:0]  auto_in_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [1:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [1:0]  auto_out_b_bits_param,
  input  [31:0] auto_out_b_bits_address,
  input         auto_out_c_ready,
  output        auto_out_c_valid,
  output [2:0]  auto_out_c_bits_opcode,
  output [2:0]  auto_out_c_bits_param,
  output [3:0]  auto_out_c_bits_size,
  output [1:0]  auto_out_c_bits_source,
  output [31:0] auto_out_c_bits_address,
  output [63:0] auto_out_c_bits_data,
  output        auto_out_c_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [1:0]  auto_out_d_bits_source,
  input  [1:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  output        auto_out_e_valid,
  output [1:0]  auto_out_e_bits_sink
);
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_b_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_b_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_b_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_b_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_b_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_b_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_b_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_c_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_c_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_c_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_c_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_c_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_c_bits_address; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_e_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_e_valid; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_e_bits_sink; // @[Nodes.scala 24:25]
  wire  bundleOut_0_a_q_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_a_q_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_a_q_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_a_q_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_a_q_io_enq_bits_opcode; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_a_q_io_enq_bits_param; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_a_q_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_a_q_io_enq_bits_source; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_a_q_io_enq_bits_address; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_a_q_io_enq_bits_mask; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_a_q_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_a_q_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_a_q_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_a_q_io_deq_bits_opcode; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_a_q_io_deq_bits_param; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_a_q_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_a_q_io_deq_bits_source; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_a_q_io_deq_bits_address; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_a_q_io_deq_bits_mask; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_a_q_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_a_q_io_deq_bits_corrupt; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_clock; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_reset; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [2:0] bundleIn_0_d_q_io_enq_bits_opcode; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_d_q_io_enq_bits_param; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_d_q_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_d_q_io_enq_bits_source; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_d_q_io_enq_bits_sink; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_enq_bits_denied; // @[Decoupled.scala 361:21]
  wire [63:0] bundleIn_0_d_q_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_enq_bits_corrupt; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [2:0] bundleIn_0_d_q_io_deq_bits_opcode; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_d_q_io_deq_bits_param; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_d_q_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_d_q_io_deq_bits_source; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_d_q_io_deq_bits_sink; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_deq_bits_denied; // @[Decoupled.scala 361:21]
  wire [63:0] bundleIn_0_d_q_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_d_q_io_deq_bits_corrupt; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_q_clock; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_q_reset; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_q_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_q_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_b_q_io_enq_bits_param; // @[Decoupled.scala 361:21]
  wire [31:0] bundleIn_0_b_q_io_enq_bits_address; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_q_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_q_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [2:0] bundleIn_0_b_q_io_deq_bits_opcode; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_b_q_io_deq_bits_param; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_b_q_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_b_q_io_deq_bits_source; // @[Decoupled.scala 361:21]
  wire [31:0] bundleIn_0_b_q_io_deq_bits_address; // @[Decoupled.scala 361:21]
  wire [7:0] bundleIn_0_b_q_io_deq_bits_mask; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_q_io_deq_bits_corrupt; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_c_q_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_c_q_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_c_q_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_c_q_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_c_q_io_enq_bits_opcode; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_c_q_io_enq_bits_param; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_c_q_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_c_q_io_enq_bits_source; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_c_q_io_enq_bits_address; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_c_q_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_c_q_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_c_q_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_c_q_io_deq_bits_opcode; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_c_q_io_deq_bits_param; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_c_q_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_c_q_io_deq_bits_source; // @[Decoupled.scala 361:21]
  wire [31:0] bundleOut_0_c_q_io_deq_bits_address; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_c_q_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_c_q_io_deq_bits_corrupt; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_e_q_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_e_q_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_e_q_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_e_q_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_e_q_io_enq_bits_sink; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_e_q_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_e_q_io_deq_bits_sink; // @[Decoupled.scala 361:21]
  TLMonitor_25 monitor ( // @[Nodes.scala 24:25]
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
    .io_in_b_ready(monitor_io_in_b_ready),
    .io_in_b_valid(monitor_io_in_b_valid),
    .io_in_b_bits_opcode(monitor_io_in_b_bits_opcode),
    .io_in_b_bits_param(monitor_io_in_b_bits_param),
    .io_in_b_bits_size(monitor_io_in_b_bits_size),
    .io_in_b_bits_source(monitor_io_in_b_bits_source),
    .io_in_b_bits_address(monitor_io_in_b_bits_address),
    .io_in_b_bits_mask(monitor_io_in_b_bits_mask),
    .io_in_b_bits_corrupt(monitor_io_in_b_bits_corrupt),
    .io_in_c_ready(monitor_io_in_c_ready),
    .io_in_c_valid(monitor_io_in_c_valid),
    .io_in_c_bits_opcode(monitor_io_in_c_bits_opcode),
    .io_in_c_bits_param(monitor_io_in_c_bits_param),
    .io_in_c_bits_size(monitor_io_in_c_bits_size),
    .io_in_c_bits_source(monitor_io_in_c_bits_source),
    .io_in_c_bits_address(monitor_io_in_c_bits_address),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt),
    .io_in_e_ready(monitor_io_in_e_ready),
    .io_in_e_valid(monitor_io_in_e_valid),
    .io_in_e_bits_sink(monitor_io_in_e_bits_sink)
  );
  Queue_32 bundleOut_0_a_q ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_a_q_clock),
    .reset(bundleOut_0_a_q_reset),
    .io_enq_ready(bundleOut_0_a_q_io_enq_ready),
    .io_enq_valid(bundleOut_0_a_q_io_enq_valid),
    .io_enq_bits_opcode(bundleOut_0_a_q_io_enq_bits_opcode),
    .io_enq_bits_param(bundleOut_0_a_q_io_enq_bits_param),
    .io_enq_bits_size(bundleOut_0_a_q_io_enq_bits_size),
    .io_enq_bits_source(bundleOut_0_a_q_io_enq_bits_source),
    .io_enq_bits_address(bundleOut_0_a_q_io_enq_bits_address),
    .io_enq_bits_mask(bundleOut_0_a_q_io_enq_bits_mask),
    .io_enq_bits_data(bundleOut_0_a_q_io_enq_bits_data),
    .io_deq_ready(bundleOut_0_a_q_io_deq_ready),
    .io_deq_valid(bundleOut_0_a_q_io_deq_valid),
    .io_deq_bits_opcode(bundleOut_0_a_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleOut_0_a_q_io_deq_bits_param),
    .io_deq_bits_size(bundleOut_0_a_q_io_deq_bits_size),
    .io_deq_bits_source(bundleOut_0_a_q_io_deq_bits_source),
    .io_deq_bits_address(bundleOut_0_a_q_io_deq_bits_address),
    .io_deq_bits_mask(bundleOut_0_a_q_io_deq_bits_mask),
    .io_deq_bits_data(bundleOut_0_a_q_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleOut_0_a_q_io_deq_bits_corrupt)
  );
  Queue_33 bundleIn_0_d_q ( // @[Decoupled.scala 361:21]
    .clock(bundleIn_0_d_q_clock),
    .reset(bundleIn_0_d_q_reset),
    .io_enq_ready(bundleIn_0_d_q_io_enq_ready),
    .io_enq_valid(bundleIn_0_d_q_io_enq_valid),
    .io_enq_bits_opcode(bundleIn_0_d_q_io_enq_bits_opcode),
    .io_enq_bits_param(bundleIn_0_d_q_io_enq_bits_param),
    .io_enq_bits_size(bundleIn_0_d_q_io_enq_bits_size),
    .io_enq_bits_source(bundleIn_0_d_q_io_enq_bits_source),
    .io_enq_bits_sink(bundleIn_0_d_q_io_enq_bits_sink),
    .io_enq_bits_denied(bundleIn_0_d_q_io_enq_bits_denied),
    .io_enq_bits_data(bundleIn_0_d_q_io_enq_bits_data),
    .io_enq_bits_corrupt(bundleIn_0_d_q_io_enq_bits_corrupt),
    .io_deq_ready(bundleIn_0_d_q_io_deq_ready),
    .io_deq_valid(bundleIn_0_d_q_io_deq_valid),
    .io_deq_bits_opcode(bundleIn_0_d_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleIn_0_d_q_io_deq_bits_param),
    .io_deq_bits_size(bundleIn_0_d_q_io_deq_bits_size),
    .io_deq_bits_source(bundleIn_0_d_q_io_deq_bits_source),
    .io_deq_bits_sink(bundleIn_0_d_q_io_deq_bits_sink),
    .io_deq_bits_denied(bundleIn_0_d_q_io_deq_bits_denied),
    .io_deq_bits_data(bundleIn_0_d_q_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleIn_0_d_q_io_deq_bits_corrupt)
  );
  Queue_34 bundleIn_0_b_q ( // @[Decoupled.scala 361:21]
    .clock(bundleIn_0_b_q_clock),
    .reset(bundleIn_0_b_q_reset),
    .io_enq_ready(bundleIn_0_b_q_io_enq_ready),
    .io_enq_valid(bundleIn_0_b_q_io_enq_valid),
    .io_enq_bits_param(bundleIn_0_b_q_io_enq_bits_param),
    .io_enq_bits_address(bundleIn_0_b_q_io_enq_bits_address),
    .io_deq_ready(bundleIn_0_b_q_io_deq_ready),
    .io_deq_valid(bundleIn_0_b_q_io_deq_valid),
    .io_deq_bits_opcode(bundleIn_0_b_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleIn_0_b_q_io_deq_bits_param),
    .io_deq_bits_size(bundleIn_0_b_q_io_deq_bits_size),
    .io_deq_bits_source(bundleIn_0_b_q_io_deq_bits_source),
    .io_deq_bits_address(bundleIn_0_b_q_io_deq_bits_address),
    .io_deq_bits_mask(bundleIn_0_b_q_io_deq_bits_mask),
    .io_deq_bits_corrupt(bundleIn_0_b_q_io_deq_bits_corrupt)
  );
  Queue_35 bundleOut_0_c_q ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_c_q_clock),
    .reset(bundleOut_0_c_q_reset),
    .io_enq_ready(bundleOut_0_c_q_io_enq_ready),
    .io_enq_valid(bundleOut_0_c_q_io_enq_valid),
    .io_enq_bits_opcode(bundleOut_0_c_q_io_enq_bits_opcode),
    .io_enq_bits_param(bundleOut_0_c_q_io_enq_bits_param),
    .io_enq_bits_size(bundleOut_0_c_q_io_enq_bits_size),
    .io_enq_bits_source(bundleOut_0_c_q_io_enq_bits_source),
    .io_enq_bits_address(bundleOut_0_c_q_io_enq_bits_address),
    .io_enq_bits_data(bundleOut_0_c_q_io_enq_bits_data),
    .io_deq_ready(bundleOut_0_c_q_io_deq_ready),
    .io_deq_valid(bundleOut_0_c_q_io_deq_valid),
    .io_deq_bits_opcode(bundleOut_0_c_q_io_deq_bits_opcode),
    .io_deq_bits_param(bundleOut_0_c_q_io_deq_bits_param),
    .io_deq_bits_size(bundleOut_0_c_q_io_deq_bits_size),
    .io_deq_bits_source(bundleOut_0_c_q_io_deq_bits_source),
    .io_deq_bits_address(bundleOut_0_c_q_io_deq_bits_address),
    .io_deq_bits_data(bundleOut_0_c_q_io_deq_bits_data),
    .io_deq_bits_corrupt(bundleOut_0_c_q_io_deq_bits_corrupt)
  );
  Queue_36 bundleOut_0_e_q ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_e_q_clock),
    .reset(bundleOut_0_e_q_reset),
    .io_enq_ready(bundleOut_0_e_q_io_enq_ready),
    .io_enq_valid(bundleOut_0_e_q_io_enq_valid),
    .io_enq_bits_sink(bundleOut_0_e_q_io_enq_bits_sink),
    .io_deq_valid(bundleOut_0_e_q_io_deq_valid),
    .io_deq_bits_sink(bundleOut_0_e_q_io_deq_bits_sink)
  );
  assign auto_in_a_ready = bundleOut_0_a_q_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_b_valid = bundleIn_0_b_q_io_deq_valid; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_b_bits_opcode = bundleIn_0_b_q_io_deq_bits_opcode; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_b_bits_param = bundleIn_0_b_q_io_deq_bits_param; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_b_bits_size = bundleIn_0_b_q_io_deq_bits_size; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_b_bits_source = bundleIn_0_b_q_io_deq_bits_source; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_b_bits_address = bundleIn_0_b_q_io_deq_bits_address; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_b_bits_mask = bundleIn_0_b_q_io_deq_bits_mask; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_b_bits_corrupt = bundleIn_0_b_q_io_deq_bits_corrupt; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign auto_in_c_ready = bundleOut_0_c_q_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_d_valid = bundleIn_0_d_q_io_deq_valid; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_opcode = bundleIn_0_d_q_io_deq_bits_opcode; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_param = bundleIn_0_d_q_io_deq_bits_param; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_size = bundleIn_0_d_q_io_deq_bits_size; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_source = bundleIn_0_d_q_io_deq_bits_source; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_sink = bundleIn_0_d_q_io_deq_bits_sink; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_denied = bundleIn_0_d_q_io_deq_bits_denied; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_data = bundleIn_0_d_q_io_deq_bits_data; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_d_bits_corrupt = bundleIn_0_d_q_io_deq_bits_corrupt; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign auto_in_e_ready = bundleOut_0_e_q_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_out_a_valid = bundleOut_0_a_q_io_deq_valid; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_opcode = bundleOut_0_a_q_io_deq_bits_opcode; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_param = bundleOut_0_a_q_io_deq_bits_param; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_size = bundleOut_0_a_q_io_deq_bits_size; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_source = bundleOut_0_a_q_io_deq_bits_source; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_address = bundleOut_0_a_q_io_deq_bits_address; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_mask = bundleOut_0_a_q_io_deq_bits_mask; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_data = bundleOut_0_a_q_io_deq_bits_data; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_a_bits_corrupt = bundleOut_0_a_q_io_deq_bits_corrupt; // @[Nodes.scala 1207:84 Buffer.scala 37:13]
  assign auto_out_b_ready = bundleIn_0_b_q_io_enq_ready; // @[Nodes.scala 1207:84 Decoupled.scala 365:17]
  assign auto_out_c_valid = bundleOut_0_c_q_io_deq_valid; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_c_bits_opcode = bundleOut_0_c_q_io_deq_bits_opcode; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_c_bits_param = bundleOut_0_c_q_io_deq_bits_param; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_c_bits_size = bundleOut_0_c_q_io_deq_bits_size; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_c_bits_source = bundleOut_0_c_q_io_deq_bits_source; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_c_bits_address = bundleOut_0_c_q_io_deq_bits_address; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_c_bits_data = bundleOut_0_c_q_io_deq_bits_data; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_c_bits_corrupt = bundleOut_0_c_q_io_deq_bits_corrupt; // @[Nodes.scala 1207:84 Buffer.scala 42:15]
  assign auto_out_d_ready = bundleIn_0_d_q_io_enq_ready; // @[Nodes.scala 1207:84 Decoupled.scala 365:17]
  assign auto_out_e_valid = bundleOut_0_e_q_io_deq_valid; // @[Nodes.scala 1207:84 Buffer.scala 43:15]
  assign auto_out_e_bits_sink = bundleOut_0_e_q_io_deq_bits_sink; // @[Nodes.scala 1207:84 Buffer.scala 43:15]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = bundleOut_0_a_q_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_b_ready = auto_in_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_b_valid = bundleIn_0_b_q_io_deq_valid; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_b_bits_opcode = bundleIn_0_b_q_io_deq_bits_opcode; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_b_bits_param = bundleIn_0_b_q_io_deq_bits_param; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_b_bits_size = bundleIn_0_b_q_io_deq_bits_size; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_b_bits_source = bundleIn_0_b_q_io_deq_bits_source; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_b_bits_address = bundleIn_0_b_q_io_deq_bits_address; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_b_bits_mask = bundleIn_0_b_q_io_deq_bits_mask; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_b_bits_corrupt = bundleIn_0_b_q_io_deq_bits_corrupt; // @[Nodes.scala 1210:84 Buffer.scala 41:15]
  assign monitor_io_in_c_ready = bundleOut_0_c_q_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign monitor_io_in_c_valid = auto_in_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_opcode = auto_in_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_param = auto_in_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_size = auto_in_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_source = auto_in_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_c_bits_address = auto_in_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = bundleIn_0_d_q_io_deq_valid; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_d_bits_opcode = bundleIn_0_d_q_io_deq_bits_opcode; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_d_bits_param = bundleIn_0_d_q_io_deq_bits_param; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_d_bits_size = bundleIn_0_d_q_io_deq_bits_size; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_d_bits_source = bundleIn_0_d_q_io_deq_bits_source; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_d_bits_sink = bundleIn_0_d_q_io_deq_bits_sink; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_d_bits_denied = bundleIn_0_d_q_io_deq_bits_denied; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_d_bits_corrupt = bundleIn_0_d_q_io_deq_bits_corrupt; // @[Nodes.scala 1210:84 Buffer.scala 38:13]
  assign monitor_io_in_e_ready = bundleOut_0_e_q_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign monitor_io_in_e_valid = auto_in_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_e_bits_sink = auto_in_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_clock = clock;
  assign bundleOut_0_a_q_reset = reset;
  assign bundleOut_0_a_q_io_enq_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_enq_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_enq_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_enq_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_enq_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_enq_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_enq_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_a_q_io_deq_ready = auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_clock = clock;
  assign bundleIn_0_d_q_reset = reset;
  assign bundleIn_0_d_q_io_enq_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_enq_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_d_q_io_deq_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleIn_0_b_q_clock = clock;
  assign bundleIn_0_b_q_reset = reset;
  assign bundleIn_0_b_q_io_enq_valid = auto_out_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_q_io_enq_bits_param = auto_out_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_q_io_enq_bits_address = auto_out_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_q_io_deq_ready = auto_in_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_clock = clock;
  assign bundleOut_0_c_q_reset = reset;
  assign bundleOut_0_c_q_io_enq_valid = auto_in_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_io_enq_bits_opcode = auto_in_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_io_enq_bits_param = auto_in_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_io_enq_bits_size = auto_in_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_io_enq_bits_source = auto_in_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_io_enq_bits_address = auto_in_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_io_enq_bits_data = auto_in_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_c_q_io_deq_ready = auto_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleOut_0_e_q_clock = clock;
  assign bundleOut_0_e_q_reset = reset;
  assign bundleOut_0_e_q_io_enq_valid = auto_in_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_e_q_io_enq_bits_sink = auto_in_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
