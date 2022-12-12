module CLINT(
  input         clock,
  input         reset,
  output        auto_int_out_0,
  output        auto_int_out_1,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [8:0]  auto_in_a_bits_source,
  input  [25:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [8:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data,
  input         io_rtcTick
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [25:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [8:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  reg [63:0] time_; // @[CLINT.scala 67:23]
  wire [63:0] _time_T_1 = time_ + 64'h1; // @[CLINT.scala 68:38]
  reg [63:0] timecmp_0; // @[CLINT.scala 71:41]
  reg  ipi_0; // @[CLINT.scala 72:41]
  wire [7:0] oldBytes__0 = timecmp_0[7:0]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes__1 = timecmp_0[15:8]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes__2 = timecmp_0[23:16]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes__3 = timecmp_0[31:24]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes__4 = timecmp_0[39:32]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes__5 = timecmp_0[47:40]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes__6 = timecmp_0[55:48]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes__7 = timecmp_0[63:56]; // @[RegField.scala 151:53]
  wire  in_bits_read = auto_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 71:36]
  wire [12:0] in_bits_index = auto_in_a_bits_address[15:3]; // @[RegisterRouter.scala 70:18 72:19]
  wire [1:0] out_iindex = {in_bits_index[12],in_bits_index[11]}; // @[Cat.scala 31:58]
  wire [12:0] out_findex = in_bits_index & 13'h7ff; // @[RegisterRouter.scala 82:24]
  wire  _out_T_4 = out_findex == 13'h7ff; // @[RegisterRouter.scala 82:24]
  wire  _out_T_2 = out_findex == 13'h0; // @[RegisterRouter.scala 82:24]
  wire [3:0] _out_backSel_T = 4'h1 << out_iindex; // @[OneHot.scala 57:35]
  wire  out_backSel_1 = _out_backSel_T[1]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_2 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_backSel_1 & out_findex == 13'h0; // @[RegisterRouter.scala 82:24]
  wire [7:0] _out_backMask_T_23 = auto_in_a_bits_mask[7] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_21 = auto_in_a_bits_mask[6] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_19 = auto_in_a_bits_mask[5] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_17 = auto_in_a_bits_mask[4] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_15 = auto_in_a_bits_mask[3] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_13 = auto_in_a_bits_mask[2] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_11 = auto_in_a_bits_mask[1] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [7:0] _out_backMask_T_9 = auto_in_a_bits_mask[0] ? 8'hff : 8'h0; // @[Bitwise.scala 74:12]
  wire [63:0] out_backMask = {_out_backMask_T_23,_out_backMask_T_21,_out_backMask_T_19,_out_backMask_T_17,
    _out_backMask_T_15,_out_backMask_T_13,_out_backMask_T_11,_out_backMask_T_9}; // @[Cat.scala 31:58]
  wire  out_womask_2 = &out_backMask[7:0]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_2 = out_woready_2 & out_womask_2; // @[RegisterRouter.scala 82:24]
  wire  out_womask_3 = &out_backMask[15:8]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_3 = out_woready_2 & out_womask_3; // @[RegisterRouter.scala 82:24]
  wire  out_womask_4 = &out_backMask[23:16]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_4 = out_woready_2 & out_womask_4; // @[RegisterRouter.scala 82:24]
  wire  out_womask_5 = &out_backMask[31:24]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_5 = out_woready_2 & out_womask_5; // @[RegisterRouter.scala 82:24]
  wire  out_womask_6 = &out_backMask[39:32]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_6 = out_woready_2 & out_womask_6; // @[RegisterRouter.scala 82:24]
  wire  out_womask_7 = &out_backMask[47:40]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_7 = out_woready_2 & out_womask_7; // @[RegisterRouter.scala 82:24]
  wire  out_womask_8 = &out_backMask[55:48]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_8 = out_woready_2 & out_womask_8; // @[RegisterRouter.scala 82:24]
  wire  out_womask_9 = &out_backMask[63:56]; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_9 = out_woready_2 & out_womask_9; // @[RegisterRouter.scala 82:24]
  wire [7:0] newBytes__1 = out_f_woready_3 ? auto_in_a_bits_data[15:8] : oldBytes__1; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes__0 = out_f_woready_2 ? auto_in_a_bits_data[7:0] : oldBytes__0; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes__3 = out_f_woready_5 ? auto_in_a_bits_data[31:24] : oldBytes__3; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes__2 = out_f_woready_4 ? auto_in_a_bits_data[23:16] : oldBytes__2; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes__5 = out_f_woready_7 ? auto_in_a_bits_data[47:40] : oldBytes__5; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes__4 = out_f_woready_6 ? auto_in_a_bits_data[39:32] : oldBytes__4; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes__7 = out_f_woready_9 ? auto_in_a_bits_data[63:56] : oldBytes__7; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes__6 = out_f_woready_8 ? auto_in_a_bits_data[55:48] : oldBytes__6; // @[RegField.scala 158:{20,33}]
  wire [63:0] _timecmp_0_T = {newBytes__7,newBytes__6,newBytes__5,newBytes__4,newBytes__3,newBytes__2,newBytes__1,
    newBytes__0}; // @[RegField.scala 154:52]
  wire [7:0] oldBytes_1_0 = time_[7:0]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1_1 = time_[15:8]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1_2 = time_[23:16]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1_3 = time_[31:24]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1_4 = time_[39:32]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1_5 = time_[47:40]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1_6 = time_[55:48]; // @[RegField.scala 151:53]
  wire [7:0] oldBytes_1_7 = time_[63:56]; // @[RegField.scala 151:53]
  wire  out_backSel_2 = _out_backSel_T[2]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_10 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_backSel_2 & out_findex == 13'h7ff; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_10 = out_woready_10 & out_womask_2; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_11 = out_woready_10 & out_womask_3; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_12 = out_woready_10 & out_womask_4; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_13 = out_woready_10 & out_womask_5; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_14 = out_woready_10 & out_womask_6; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_15 = out_woready_10 & out_womask_7; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_16 = out_woready_10 & out_womask_8; // @[RegisterRouter.scala 82:24]
  wire  out_f_woready_17 = out_woready_10 & out_womask_9; // @[RegisterRouter.scala 82:24]
  wire [7:0] newBytes_1_1 = out_f_woready_11 ? auto_in_a_bits_data[15:8] : oldBytes_1_1; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes_1_0 = out_f_woready_10 ? auto_in_a_bits_data[7:0] : oldBytes_1_0; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes_1_3 = out_f_woready_13 ? auto_in_a_bits_data[31:24] : oldBytes_1_3; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes_1_2 = out_f_woready_12 ? auto_in_a_bits_data[23:16] : oldBytes_1_2; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes_1_5 = out_f_woready_15 ? auto_in_a_bits_data[47:40] : oldBytes_1_5; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes_1_4 = out_f_woready_14 ? auto_in_a_bits_data[39:32] : oldBytes_1_4; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes_1_7 = out_f_woready_17 ? auto_in_a_bits_data[63:56] : oldBytes_1_7; // @[RegField.scala 158:{20,33}]
  wire [7:0] newBytes_1_6 = out_f_woready_16 ? auto_in_a_bits_data[55:48] : oldBytes_1_6; // @[RegField.scala 158:{20,33}]
  wire [63:0] _time_T_2 = {newBytes_1_7,newBytes_1_6,newBytes_1_5,newBytes_1_4,newBytes_1_3,newBytes_1_2,newBytes_1_1,
    newBytes_1_0}; // @[RegField.scala 154:52]
  wire  out_wimask = &out_backMask[0]; // @[RegisterRouter.scala 82:24]
  wire  out_frontSel_0 = _out_backSel_T[0]; // @[RegisterRouter.scala 82:24]
  wire  out_wivalid_0 = auto_in_a_valid & auto_in_d_ready & ~in_bits_read & out_frontSel_0 & out_findex == 13'h0; // @[RegisterRouter.scala 82:24]
  wire  out_f_wivalid = out_wivalid_0 & out_wimask; // @[RegisterRouter.scala 82:24]
  wire [1:0] out_prepend = {1'h0,ipi_0}; // @[Cat.scala 31:58]
  wire [31:0] _out_T_24 = {{30'd0}, out_prepend}; // @[RegisterRouter.scala 82:24]
  wire [63:0] out_prepend_7 = {oldBytes__7,oldBytes__6,oldBytes__5,oldBytes__4,oldBytes__3,oldBytes__2,oldBytes__1,
    oldBytes__0}; // @[Cat.scala 31:58]
  wire [63:0] out_prepend_14 = {oldBytes_1_7,oldBytes_1_6,oldBytes_1_5,oldBytes_1_4,oldBytes_1_3,oldBytes_1_2,
    oldBytes_1_1,oldBytes_1_0}; // @[Cat.scala 31:58]
  wire  _GEN_37 = 2'h1 == out_iindex ? _out_T_2 : _out_T_2; // @[MuxLiteral.scala 48:{10,10}]
  wire  _GEN_38 = 2'h2 == out_iindex ? _out_T_4 : _GEN_37; // @[MuxLiteral.scala 48:{10,10}]
  wire  _GEN_39 = 2'h3 == out_iindex | _GEN_38; // @[MuxLiteral.scala 48:{10,10}]
  wire [63:0] _out_out_bits_data_WIRE_1_0 = {{32'd0}, _out_T_24}; // @[MuxLiteral.scala 48:{48,48}]
  wire [63:0] _GEN_41 = 2'h1 == out_iindex ? out_prepend_7 : _out_out_bits_data_WIRE_1_0; // @[MuxLiteral.scala 48:{10,10}]
  wire [63:0] _GEN_42 = 2'h2 == out_iindex ? out_prepend_14 : _GEN_41; // @[MuxLiteral.scala 48:{10,10}]
  wire [63:0] _GEN_43 = 2'h3 == out_iindex ? 64'h0 : _GEN_42; // @[MuxLiteral.scala 48:{10,10}]
  TLMonitor_27 monitor ( // @[Nodes.scala 24:25]
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
  assign auto_int_out_0 = ipi_0; // @[CLINT.scala 76:37]
  assign auto_int_out_1 = time_ >= timecmp_0; // @[CLINT.scala 77:43]
  assign auto_in_a_ready = auto_in_d_ready; // @[RegisterRouter.scala 82:24]
  assign auto_in_d_valid = auto_in_a_valid; // @[RegisterRouter.scala 82:24]
  assign auto_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 97:19]
  assign auto_in_d_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_in_d_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_in_d_bits_data = _GEN_39 ? _GEN_43 : 64'h0; // @[RegisterRouter.scala 82:24]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_in_d_ready; // @[RegisterRouter.scala 82:24]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_in_a_valid; // @[RegisterRouter.scala 82:24]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 97:19]
  assign monitor_io_in_d_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  always @(posedge clock) begin
    if (reset) begin // @[CLINT.scala 67:23]
      time_ <= 64'h0; // @[CLINT.scala 67:23]
    end else if (out_f_woready_10 | out_f_woready_11 | out_f_woready_12 | out_f_woready_13 | out_f_woready_14 |
      out_f_woready_15 | out_f_woready_16 | out_f_woready_17) begin // @[RegField.scala 154:34]
      time_ <= _time_T_2; // @[RegField.scala 154:40]
    end else if (io_rtcTick) begin // @[CLINT.scala 68:23]
      time_ <= _time_T_1; // @[CLINT.scala 68:30]
    end
    if (out_f_woready_2 | out_f_woready_3 | out_f_woready_4 | out_f_woready_5 | out_f_woready_6 | out_f_woready_7 |
      out_f_woready_8 | out_f_woready_9) begin // @[RegField.scala 154:34]
      timecmp_0 <= _timecmp_0_T; // @[RegField.scala 154:40]
    end
    if (reset) begin // @[CLINT.scala 72:41]
      ipi_0 <= 1'h0; // @[CLINT.scala 72:41]
    end else if (out_f_wivalid) begin // @[RegField.scala 74:88]
      ipi_0 <= auto_in_a_bits_data[0]; // @[RegField.scala 74:92]
    end
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
  _RAND_0 = {2{`RANDOM}};
  time_ = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  timecmp_0 = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  ipi_0 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
