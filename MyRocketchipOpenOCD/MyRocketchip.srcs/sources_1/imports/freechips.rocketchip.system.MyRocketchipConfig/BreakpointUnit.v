module BreakpointUnit(
  input         io_status_debug,
  input  [1:0]  io_status_prv,
  input         io_bp_0_control_action,
  input  [1:0]  io_bp_0_control_tmatch,
  input         io_bp_0_control_m,
  input         io_bp_0_control_s,
  input         io_bp_0_control_u,
  input         io_bp_0_control_x,
  input         io_bp_0_control_w,
  input         io_bp_0_control_r,
  input  [38:0] io_bp_0_address,
  input  [38:0] io_pc,
  input  [38:0] io_ea,
  output        io_xcpt_if,
  output        io_xcpt_ld,
  output        io_xcpt_st,
  output        io_debug_if,
  output        io_debug_ld,
  output        io_debug_st
);
  wire [3:0] _en_T_1 = {io_bp_0_control_m,1'h0,io_bp_0_control_s,io_bp_0_control_u}; // @[Cat.scala 31:58]
  wire [3:0] _en_T_2 = _en_T_1 >> io_status_prv; // @[Breakpoint.scala 30:68]
  wire  en = ~io_status_debug & _en_T_2[0]; // @[Breakpoint.scala 30:50]
  wire  _r_T_4 = io_ea >= io_bp_0_address ^ io_bp_0_control_tmatch[0]; // @[Breakpoint.scala 65:20]
  wire [38:0] _r_T_5 = ~io_ea; // @[Breakpoint.scala 62:6]
  wire  _r_T_8 = io_bp_0_control_tmatch[0] & io_bp_0_address[0]; // @[Breakpoint.scala 59:73]
  wire  _r_T_10 = io_bp_0_control_tmatch[0] & io_bp_0_address[0] & io_bp_0_address[1]; // @[Breakpoint.scala 59:73]
  wire  _r_T_12 = io_bp_0_control_tmatch[0] & io_bp_0_address[0] & io_bp_0_address[1] & io_bp_0_address[2]; // @[Breakpoint.scala 59:73]
  wire [3:0] _r_T_13 = {_r_T_12,_r_T_10,_r_T_8,io_bp_0_control_tmatch[0]}; // @[Cat.scala 31:58]
  wire [38:0] _GEN_11 = {{35'd0}, _r_T_13}; // @[Breakpoint.scala 62:9]
  wire [38:0] _r_T_14 = _r_T_5 | _GEN_11; // @[Breakpoint.scala 62:9]
  wire [38:0] _r_T_15 = ~io_bp_0_address; // @[Breakpoint.scala 62:24]
  wire [38:0] _r_T_24 = _r_T_15 | _GEN_11; // @[Breakpoint.scala 62:33]
  wire  _r_T_25 = _r_T_14 == _r_T_24; // @[Breakpoint.scala 62:19]
  wire  _r_T_26 = io_bp_0_control_tmatch[1] ? _r_T_4 : _r_T_25; // @[Breakpoint.scala 68:8]
  wire  r = en & io_bp_0_control_r & _r_T_26; // @[Breakpoint.scala 106:32]
  wire  w = en & io_bp_0_control_w & _r_T_26; // @[Breakpoint.scala 107:32]
  wire  _x_T_4 = io_pc >= io_bp_0_address ^ io_bp_0_control_tmatch[0]; // @[Breakpoint.scala 65:20]
  wire [38:0] _x_T_5 = ~io_pc; // @[Breakpoint.scala 62:6]
  wire [38:0] _x_T_14 = _x_T_5 | _GEN_11; // @[Breakpoint.scala 62:9]
  wire  _x_T_25 = _x_T_14 == _r_T_24; // @[Breakpoint.scala 62:19]
  wire  _x_T_26 = io_bp_0_control_tmatch[1] ? _x_T_4 : _x_T_25; // @[Breakpoint.scala 68:8]
  wire  x = en & io_bp_0_control_x & _x_T_26; // @[Breakpoint.scala 108:32]
  wire  _io_xcpt_ld_T = ~io_bp_0_control_action; // @[Breakpoint.scala 118:51]
  assign io_xcpt_if = x & _io_xcpt_ld_T; // @[Breakpoint.scala 120:{27,40} 96:14]
  assign io_xcpt_ld = r & ~io_bp_0_control_action; // @[Breakpoint.scala 118:{27,40} 97:14]
  assign io_xcpt_st = w & _io_xcpt_ld_T; // @[Breakpoint.scala 119:{27,40} 98:14]
  assign io_debug_if = x & io_bp_0_control_action; // @[Breakpoint.scala 120:{27,73} 99:15]
  assign io_debug_ld = r & io_bp_0_control_action; // @[Breakpoint.scala 100:15 118:{27,73}]
  assign io_debug_st = w & io_bp_0_control_action; // @[Breakpoint.scala 101:15 119:{27,73}]
endmodule
