module PLICFanIn(
  input  [2:0] io_prio_0,
  input  [2:0] io_prio_1,
  input  [2:0] io_prio_2,
  input  [2:0] io_prio_3,
  input  [2:0] io_prio_4,
  input  [2:0] io_prio_5,
  input  [2:0] io_prio_6,
  input  [6:0] io_ip,
  output [2:0] io_dev,
  output [2:0] io_max
);
  wire [3:0] effectivePriority_1 = {io_ip[0],io_prio_0}; // @[Cat.scala 31:58]
  wire [3:0] effectivePriority_2 = {io_ip[1],io_prio_1}; // @[Cat.scala 31:58]
  wire [3:0] effectivePriority_3 = {io_ip[2],io_prio_2}; // @[Cat.scala 31:58]
  wire [3:0] effectivePriority_4 = {io_ip[3],io_prio_3}; // @[Cat.scala 31:58]
  wire [3:0] effectivePriority_5 = {io_ip[4],io_prio_4}; // @[Cat.scala 31:58]
  wire [3:0] effectivePriority_6 = {io_ip[5],io_prio_5}; // @[Cat.scala 31:58]
  wire [3:0] effectivePriority_7 = {io_ip[6],io_prio_6}; // @[Cat.scala 31:58]
  wire  _T = 4'h8 >= effectivePriority_1; // @[Plic.scala 344:20]
  wire [3:0] _T_2 = _T ? 4'h8 : effectivePriority_1; // @[Misc.scala 34:9]
  wire  _T_3 = _T ? 1'h0 : 1'h1; // @[Misc.scala 34:36]
  wire  _T_4 = effectivePriority_2 >= effectivePriority_3; // @[Plic.scala 344:20]
  wire [3:0] _T_6 = _T_4 ? effectivePriority_2 : effectivePriority_3; // @[Misc.scala 34:9]
  wire  _T_7 = _T_4 ? 1'h0 : 1'h1; // @[Misc.scala 34:36]
  wire  _T_8 = _T_2 >= _T_6; // @[Plic.scala 344:20]
  wire [1:0] _GEN_0 = {{1'd0}, _T_7}; // @[Plic.scala 344:61]
  wire [1:0] _T_9 = 2'h2 | _GEN_0; // @[Plic.scala 344:61]
  wire [3:0] _T_10 = _T_8 ? _T_2 : _T_6; // @[Misc.scala 34:9]
  wire [1:0] _T_11 = _T_8 ? {{1'd0}, _T_3} : _T_9; // @[Misc.scala 34:36]
  wire  _T_12 = effectivePriority_4 >= effectivePriority_5; // @[Plic.scala 344:20]
  wire [3:0] _T_14 = _T_12 ? effectivePriority_4 : effectivePriority_5; // @[Misc.scala 34:9]
  wire  _T_15 = _T_12 ? 1'h0 : 1'h1; // @[Misc.scala 34:36]
  wire  _T_16 = effectivePriority_6 >= effectivePriority_7; // @[Plic.scala 344:20]
  wire [3:0] _T_18 = _T_16 ? effectivePriority_6 : effectivePriority_7; // @[Misc.scala 34:9]
  wire  _T_19 = _T_16 ? 1'h0 : 1'h1; // @[Misc.scala 34:36]
  wire  _T_20 = _T_14 >= _T_18; // @[Plic.scala 344:20]
  wire [1:0] _GEN_1 = {{1'd0}, _T_19}; // @[Plic.scala 344:61]
  wire [1:0] _T_21 = 2'h2 | _GEN_1; // @[Plic.scala 344:61]
  wire [3:0] _T_22 = _T_20 ? _T_14 : _T_18; // @[Misc.scala 34:9]
  wire [1:0] _T_23 = _T_20 ? {{1'd0}, _T_15} : _T_21; // @[Misc.scala 34:36]
  wire  _T_24 = _T_10 >= _T_22; // @[Plic.scala 344:20]
  wire [2:0] _GEN_2 = {{1'd0}, _T_23}; // @[Plic.scala 344:61]
  wire [2:0] _T_25 = 3'h4 | _GEN_2; // @[Plic.scala 344:61]
  wire [3:0] maxPri = _T_24 ? _T_10 : _T_22; // @[Misc.scala 34:9]
  assign io_dev = _T_24 ? {{1'd0}, _T_11} : _T_25; // @[Misc.scala 34:36]
  assign io_max = maxPri[2:0]; // @[Plic.scala 350:10]
endmodule
