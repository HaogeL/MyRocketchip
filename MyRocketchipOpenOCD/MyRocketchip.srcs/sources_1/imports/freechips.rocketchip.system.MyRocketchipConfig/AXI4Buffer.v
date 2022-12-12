module AXI4Buffer(
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [3:0]  auto_in_aw_bits_id,
  input  [30:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  input         auto_in_aw_bits_lock,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  input  [3:0]  auto_in_aw_bits_qos,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [3:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [3:0]  auto_in_ar_bits_id,
  input  [30:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input         auto_in_ar_bits_lock,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input  [3:0]  auto_in_ar_bits_qos,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [3:0]  auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [3:0]  auto_out_aw_bits_id,
  output [30:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [1:0]  auto_out_aw_bits_burst,
  output        auto_out_aw_bits_lock,
  output [3:0]  auto_out_aw_bits_cache,
  output [2:0]  auto_out_aw_bits_prot,
  output [3:0]  auto_out_aw_bits_qos,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [3:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [3:0]  auto_out_ar_bits_id,
  output [30:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [1:0]  auto_out_ar_bits_burst,
  output        auto_out_ar_bits_lock,
  output [3:0]  auto_out_ar_bits_cache,
  output [2:0]  auto_out_ar_bits_prot,
  output [3:0]  auto_out_ar_bits_qos,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [3:0]  auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input         auto_out_r_bits_last
);
  wire  bundleOut_0_aw_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [30:0] bundleOut_0_aw_deq_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_aw_deq_io_enq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_aw_deq_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_aw_deq_io_enq_bits_burst; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_enq_bits_lock; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_enq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_aw_deq_io_enq_bits_prot; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_enq_bits_qos; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [30:0] bundleOut_0_aw_deq_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_aw_deq_io_deq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_aw_deq_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_aw_deq_io_deq_bits_burst; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_aw_deq_io_deq_bits_lock; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_deq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_aw_deq_io_deq_bits_prot; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_aw_deq_io_deq_bits_qos; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_w_deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_w_deq_io_enq_bits_strb; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_enq_bits_last; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] bundleOut_0_w_deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_w_deq_io_deq_bits_strb; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_w_deq_io_deq_bits_last; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_b_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_b_deq_io_enq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_b_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_b_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_b_deq_io_deq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [30:0] bundleOut_0_ar_deq_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_ar_deq_io_enq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_ar_deq_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_ar_deq_io_enq_bits_burst; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_enq_bits_lock; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_enq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_ar_deq_io_enq_bits_prot; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_enq_bits_qos; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [30:0] bundleOut_0_ar_deq_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] bundleOut_0_ar_deq_io_deq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_ar_deq_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] bundleOut_0_ar_deq_io_deq_bits_burst; // @[Decoupled.scala 361:21]
  wire  bundleOut_0_ar_deq_io_deq_bits_lock; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_deq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] bundleOut_0_ar_deq_io_deq_bits_prot; // @[Decoupled.scala 361:21]
  wire [3:0] bundleOut_0_ar_deq_io_deq_bits_qos; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_clock; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_reset; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_r_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [63:0] bundleIn_0_r_deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_r_deq_io_enq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_enq_bits_last; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [3:0] bundleIn_0_r_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [63:0] bundleIn_0_r_deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [1:0] bundleIn_0_r_deq_io_deq_bits_resp; // @[Decoupled.scala 361:21]
  wire  bundleIn_0_r_deq_io_deq_bits_last; // @[Decoupled.scala 361:21]
  Queue bundleOut_0_aw_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_aw_deq_clock),
    .reset(bundleOut_0_aw_deq_reset),
    .io_enq_ready(bundleOut_0_aw_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_aw_deq_io_enq_valid),
    .io_enq_bits_id(bundleOut_0_aw_deq_io_enq_bits_id),
    .io_enq_bits_addr(bundleOut_0_aw_deq_io_enq_bits_addr),
    .io_enq_bits_len(bundleOut_0_aw_deq_io_enq_bits_len),
    .io_enq_bits_size(bundleOut_0_aw_deq_io_enq_bits_size),
    .io_enq_bits_burst(bundleOut_0_aw_deq_io_enq_bits_burst),
    .io_enq_bits_lock(bundleOut_0_aw_deq_io_enq_bits_lock),
    .io_enq_bits_cache(bundleOut_0_aw_deq_io_enq_bits_cache),
    .io_enq_bits_prot(bundleOut_0_aw_deq_io_enq_bits_prot),
    .io_enq_bits_qos(bundleOut_0_aw_deq_io_enq_bits_qos),
    .io_deq_ready(bundleOut_0_aw_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_aw_deq_io_deq_valid),
    .io_deq_bits_id(bundleOut_0_aw_deq_io_deq_bits_id),
    .io_deq_bits_addr(bundleOut_0_aw_deq_io_deq_bits_addr),
    .io_deq_bits_len(bundleOut_0_aw_deq_io_deq_bits_len),
    .io_deq_bits_size(bundleOut_0_aw_deq_io_deq_bits_size),
    .io_deq_bits_burst(bundleOut_0_aw_deq_io_deq_bits_burst),
    .io_deq_bits_lock(bundleOut_0_aw_deq_io_deq_bits_lock),
    .io_deq_bits_cache(bundleOut_0_aw_deq_io_deq_bits_cache),
    .io_deq_bits_prot(bundleOut_0_aw_deq_io_deq_bits_prot),
    .io_deq_bits_qos(bundleOut_0_aw_deq_io_deq_bits_qos)
  );
  Queue_1 bundleOut_0_w_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_w_deq_clock),
    .reset(bundleOut_0_w_deq_reset),
    .io_enq_ready(bundleOut_0_w_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_w_deq_io_enq_valid),
    .io_enq_bits_data(bundleOut_0_w_deq_io_enq_bits_data),
    .io_enq_bits_strb(bundleOut_0_w_deq_io_enq_bits_strb),
    .io_enq_bits_last(bundleOut_0_w_deq_io_enq_bits_last),
    .io_deq_ready(bundleOut_0_w_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_w_deq_io_deq_valid),
    .io_deq_bits_data(bundleOut_0_w_deq_io_deq_bits_data),
    .io_deq_bits_strb(bundleOut_0_w_deq_io_deq_bits_strb),
    .io_deq_bits_last(bundleOut_0_w_deq_io_deq_bits_last)
  );
  Queue_2 bundleIn_0_b_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleIn_0_b_deq_clock),
    .reset(bundleIn_0_b_deq_reset),
    .io_enq_ready(bundleIn_0_b_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_b_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_b_deq_io_enq_bits_id),
    .io_enq_bits_resp(bundleIn_0_b_deq_io_enq_bits_resp),
    .io_deq_ready(bundleIn_0_b_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_b_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_b_deq_io_deq_bits_id),
    .io_deq_bits_resp(bundleIn_0_b_deq_io_deq_bits_resp)
  );
  Queue bundleOut_0_ar_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleOut_0_ar_deq_clock),
    .reset(bundleOut_0_ar_deq_reset),
    .io_enq_ready(bundleOut_0_ar_deq_io_enq_ready),
    .io_enq_valid(bundleOut_0_ar_deq_io_enq_valid),
    .io_enq_bits_id(bundleOut_0_ar_deq_io_enq_bits_id),
    .io_enq_bits_addr(bundleOut_0_ar_deq_io_enq_bits_addr),
    .io_enq_bits_len(bundleOut_0_ar_deq_io_enq_bits_len),
    .io_enq_bits_size(bundleOut_0_ar_deq_io_enq_bits_size),
    .io_enq_bits_burst(bundleOut_0_ar_deq_io_enq_bits_burst),
    .io_enq_bits_lock(bundleOut_0_ar_deq_io_enq_bits_lock),
    .io_enq_bits_cache(bundleOut_0_ar_deq_io_enq_bits_cache),
    .io_enq_bits_prot(bundleOut_0_ar_deq_io_enq_bits_prot),
    .io_enq_bits_qos(bundleOut_0_ar_deq_io_enq_bits_qos),
    .io_deq_ready(bundleOut_0_ar_deq_io_deq_ready),
    .io_deq_valid(bundleOut_0_ar_deq_io_deq_valid),
    .io_deq_bits_id(bundleOut_0_ar_deq_io_deq_bits_id),
    .io_deq_bits_addr(bundleOut_0_ar_deq_io_deq_bits_addr),
    .io_deq_bits_len(bundleOut_0_ar_deq_io_deq_bits_len),
    .io_deq_bits_size(bundleOut_0_ar_deq_io_deq_bits_size),
    .io_deq_bits_burst(bundleOut_0_ar_deq_io_deq_bits_burst),
    .io_deq_bits_lock(bundleOut_0_ar_deq_io_deq_bits_lock),
    .io_deq_bits_cache(bundleOut_0_ar_deq_io_deq_bits_cache),
    .io_deq_bits_prot(bundleOut_0_ar_deq_io_deq_bits_prot),
    .io_deq_bits_qos(bundleOut_0_ar_deq_io_deq_bits_qos)
  );
  Queue_4 bundleIn_0_r_deq ( // @[Decoupled.scala 361:21]
    .clock(bundleIn_0_r_deq_clock),
    .reset(bundleIn_0_r_deq_reset),
    .io_enq_ready(bundleIn_0_r_deq_io_enq_ready),
    .io_enq_valid(bundleIn_0_r_deq_io_enq_valid),
    .io_enq_bits_id(bundleIn_0_r_deq_io_enq_bits_id),
    .io_enq_bits_data(bundleIn_0_r_deq_io_enq_bits_data),
    .io_enq_bits_resp(bundleIn_0_r_deq_io_enq_bits_resp),
    .io_enq_bits_last(bundleIn_0_r_deq_io_enq_bits_last),
    .io_deq_ready(bundleIn_0_r_deq_io_deq_ready),
    .io_deq_valid(bundleIn_0_r_deq_io_deq_valid),
    .io_deq_bits_id(bundleIn_0_r_deq_io_deq_bits_id),
    .io_deq_bits_data(bundleIn_0_r_deq_io_deq_bits_data),
    .io_deq_bits_resp(bundleIn_0_r_deq_io_deq_bits_resp),
    .io_deq_bits_last(bundleIn_0_r_deq_io_deq_bits_last)
  );
  assign auto_in_aw_ready = bundleOut_0_aw_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_w_ready = bundleOut_0_w_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_b_valid = bundleIn_0_b_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_in_b_bits_id = bundleIn_0_b_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_b_bits_resp = bundleIn_0_b_deq_io_deq_bits_resp; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_ar_ready = bundleOut_0_ar_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_r_valid = bundleIn_0_r_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_in_r_bits_id = bundleIn_0_r_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_data = bundleIn_0_r_deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_resp = bundleIn_0_r_deq_io_deq_bits_resp; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_last = bundleIn_0_r_deq_io_deq_bits_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_valid = bundleOut_0_aw_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_aw_bits_id = bundleOut_0_aw_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_addr = bundleOut_0_aw_deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_len = bundleOut_0_aw_deq_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_size = bundleOut_0_aw_deq_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_burst = bundleOut_0_aw_deq_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_lock = bundleOut_0_aw_deq_io_deq_bits_lock; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_cache = bundleOut_0_aw_deq_io_deq_bits_cache; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_prot = bundleOut_0_aw_deq_io_deq_bits_prot; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_qos = bundleOut_0_aw_deq_io_deq_bits_qos; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_valid = bundleOut_0_w_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_w_bits_data = bundleOut_0_w_deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_strb = bundleOut_0_w_deq_io_deq_bits_strb; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_last = bundleOut_0_w_deq_io_deq_bits_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_b_ready = bundleIn_0_b_deq_io_enq_ready; // @[Nodes.scala 1207:84 Decoupled.scala 365:17]
  assign auto_out_ar_valid = bundleOut_0_ar_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_ar_bits_id = bundleOut_0_ar_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_addr = bundleOut_0_ar_deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_len = bundleOut_0_ar_deq_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_size = bundleOut_0_ar_deq_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_burst = bundleOut_0_ar_deq_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_lock = bundleOut_0_ar_deq_io_deq_bits_lock; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_cache = bundleOut_0_ar_deq_io_deq_bits_cache; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_prot = bundleOut_0_ar_deq_io_deq_bits_prot; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_qos = bundleOut_0_ar_deq_io_deq_bits_qos; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_r_ready = bundleIn_0_r_deq_io_enq_ready; // @[Nodes.scala 1207:84 Decoupled.scala 365:17]
  assign bundleOut_0_aw_deq_clock = clock;
  assign bundleOut_0_aw_deq_reset = reset;
  assign bundleOut_0_aw_deq_io_enq_valid = auto_in_aw_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_id = auto_in_aw_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_len = auto_in_aw_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_size = auto_in_aw_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_burst = auto_in_aw_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_lock = auto_in_aw_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_cache = auto_in_aw_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_prot = auto_in_aw_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_enq_bits_qos = auto_in_aw_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_aw_deq_io_deq_ready = auto_out_aw_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleOut_0_w_deq_clock = clock;
  assign bundleOut_0_w_deq_reset = reset;
  assign bundleOut_0_w_deq_io_enq_valid = auto_in_w_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_w_deq_io_enq_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_w_deq_io_enq_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_w_deq_io_enq_bits_last = auto_in_w_bits_last; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_w_deq_io_deq_ready = auto_out_w_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_clock = clock;
  assign bundleIn_0_b_deq_reset = reset;
  assign bundleIn_0_b_deq_io_enq_valid = auto_out_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_io_enq_bits_id = auto_out_b_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_io_enq_bits_resp = auto_out_b_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_b_deq_io_deq_ready = auto_in_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_clock = clock;
  assign bundleOut_0_ar_deq_reset = reset;
  assign bundleOut_0_ar_deq_io_enq_valid = auto_in_ar_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_id = auto_in_ar_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_len = auto_in_ar_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_size = auto_in_ar_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_burst = auto_in_ar_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_lock = auto_in_ar_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_cache = auto_in_ar_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_prot = auto_in_ar_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_enq_bits_qos = auto_in_ar_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign bundleOut_0_ar_deq_io_deq_ready = auto_out_ar_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_clock = clock;
  assign bundleIn_0_r_deq_reset = reset;
  assign bundleIn_0_r_deq_io_enq_valid = auto_out_r_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_id = auto_out_r_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_data = auto_out_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_resp = auto_out_r_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_enq_bits_last = auto_out_r_bits_last; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign bundleIn_0_r_deq_io_deq_ready = auto_in_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
endmodule
