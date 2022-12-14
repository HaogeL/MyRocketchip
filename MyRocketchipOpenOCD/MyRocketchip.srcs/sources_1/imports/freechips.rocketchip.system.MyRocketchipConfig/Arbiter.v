module Arbiter(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [26:0] io_in_0_bits_bits_addr,
  input         io_in_0_bits_bits_need_gpa,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input         io_in_1_bits_valid,
  input  [26:0] io_in_1_bits_bits_addr,
  input         io_in_1_bits_bits_need_gpa,
  input         io_out_ready,
  output        io_out_valid,
  output        io_out_bits_valid,
  output [26:0] io_out_bits_bits_addr,
  output        io_out_bits_bits_need_gpa,
  output        io_chosen
);
  wire  grant_1 = ~io_in_0_valid; // @[Arbiter.scala 46:78]
  assign io_in_0_ready = io_out_ready; // @[Arbiter.scala 149:19]
  assign io_in_1_ready = grant_1 & io_out_ready; // @[Arbiter.scala 149:19]
  assign io_out_valid = ~grant_1 | io_in_1_valid; // @[Arbiter.scala 150:31]
  assign io_out_bits_valid = io_in_0_valid | io_in_1_bits_valid; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_bits_addr = io_in_0_valid ? io_in_0_bits_bits_addr : io_in_1_bits_bits_addr; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_out_bits_bits_need_gpa = io_in_0_valid ? io_in_0_bits_bits_need_gpa : io_in_1_bits_bits_need_gpa; // @[Arbiter.scala 139:15 141:26 143:19]
  assign io_chosen = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 138:13 141:26 142:17]
endmodule
