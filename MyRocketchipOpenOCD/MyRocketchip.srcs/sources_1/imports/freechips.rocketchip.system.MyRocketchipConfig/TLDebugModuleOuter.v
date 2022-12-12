module TLDebugModuleOuter(
  input         clock,
  input         reset,
  output        auto_dmi_in_a_ready,
  input         auto_dmi_in_a_valid,
  input  [2:0]  auto_dmi_in_a_bits_opcode,
  input  [6:0]  auto_dmi_in_a_bits_address,
  input  [31:0] auto_dmi_in_a_bits_data,
  input         auto_dmi_in_d_ready,
  output        auto_dmi_in_d_valid,
  output [2:0]  auto_dmi_in_d_bits_opcode,
  output [31:0] auto_dmi_in_d_bits_data,
  output        auto_int_out_0,
  output        io_ctrl_ndreset,
  output        io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
  input         io_innerCtrl_ready,
  output        io_innerCtrl_valid,
  output        io_innerCtrl_bits_resumereq,
  output [9:0]  io_innerCtrl_bits_hartsel,
  output        io_innerCtrl_bits_ackhavereset,
  output        io_innerCtrl_bits_hrmask_0,
  input         io_hgDebugInt_0
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
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [6:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  reg  DMCONTROLReg_haltreq; // @[Debug.scala 335:31]
  reg  DMCONTROLReg_ndmreset; // @[Debug.scala 335:31]
  reg  DMCONTROLReg_dmactive; // @[Debug.scala 335:31]
  wire  _T_1 = ~DMCONTROLReg_dmactive; // @[Debug.scala 353:11]
  wire  in_bits_read = auto_dmi_in_a_bits_opcode == 3'h4; // @[RegisterRouter.scala 71:36]
  wire [2:0] in_bits_index = auto_dmi_in_a_bits_address[4:2]; // @[RegisterRouter.scala 70:18 72:19]
  wire  out_iindex = in_bits_index[1]; // @[RegisterRouter.scala 82:24]
  wire [2:0] out_findex = in_bits_index & 3'h5; // @[RegisterRouter.scala 82:24]
  wire  _out_T_2 = out_findex == 3'h0; // @[RegisterRouter.scala 82:24]
  wire [1:0] _out_backSel_T = 2'h1 << out_iindex; // @[OneHot.scala 57:35]
  wire  out_backSel_0 = _out_backSel_T[0]; // @[RegisterRouter.scala 82:24]
  wire  out_woready_1 = auto_dmi_in_a_valid & auto_dmi_in_d_ready & ~in_bits_read & out_backSel_0 & out_findex == 3'h0; // @[RegisterRouter.scala 82:24]
  wire  DMCONTROLWrData_ndmreset = auto_dmi_in_a_bits_data[1]; // @[RegisterRouter.scala 82:24]
  wire  DMCONTROLWrData_haltreq = auto_dmi_in_a_bits_data[31]; // @[RegisterRouter.scala 82:24]
  wire  DMCONTROLWrData_dmactive = auto_dmi_in_a_bits_data[0]; // @[RegisterRouter.scala 82:24]
  reg  hrmaskReg_0; // @[Debug.scala 470:28]
  wire  DMCONTROLWrData_clrresethaltreq = auto_dmi_in_a_bits_data[2]; // @[RegisterRouter.scala 82:24]
  wire  _T_11 = io_innerCtrl_bits_hartsel == 10'h0; // @[Debug.scala 399:35]
  wire  DMCONTROLWrData_setresethaltreq = auto_dmi_in_a_bits_data[3]; // @[RegisterRouter.scala 82:24]
  wire  _GEN_23 = out_woready_1 & DMCONTROLWrData_setresethaltreq & _T_11 | hrmaskReg_0; // @[Debug.scala 478:102 472:15 479:30]
  wire  _GEN_24 = out_woready_1 & DMCONTROLWrData_clrresethaltreq & _T_11 ? 1'h0 : _GEN_23; // @[Debug.scala 476:102 477:30]
  wire  _T_18 = DMCONTROLReg_dmactive & io_ctrl_dmactiveAck; // @[Debug.scala 486:43]
  wire [4:0] out_prepend_3 = {1'h0,1'h0,1'h0,DMCONTROLReg_ndmreset,_T_18}; // @[Cat.scala 31:58]
  wire [15:0] _out_T_51 = {{11'd0}, out_prepend_3}; // @[RegisterRouter.scala 82:24]
  wire [17:0] out_prepend_5 = {1'h0,1'h0,_out_T_51}; // @[Cat.scala 31:58]
  wire [25:0] _out_T_69 = {{8'd0}, out_prepend_5}; // @[RegisterRouter.scala 82:24]
  wire  DMCONTROLWrData_ackhavereset = auto_dmi_in_a_bits_data[28]; // @[RegisterRouter.scala 82:24]
  wire  DMCONTROLWrData_resumereq = auto_dmi_in_a_bits_data[30]; // @[RegisterRouter.scala 82:24]
  wire [31:0] out_prepend_11 = {DMCONTROLReg_haltreq,1'h0,1'h0,1'h0,1'h0,1'h0,_out_T_69}; // @[Cat.scala 31:58]
  wire  _GEN_35 = out_iindex ? _out_T_2 : _out_T_2; // @[MuxLiteral.scala 48:{10,10}]
  wire [31:0] _GEN_37 = out_iindex ? 32'h112380 : out_prepend_11; // @[MuxLiteral.scala 48:{10,10}]
  reg  debugIntRegs_0; // @[Debug.scala 551:31]
  reg  innerCtrlValidReg; // @[Debug.scala 582:36]
  reg  innerCtrlResumeReqReg; // @[Debug.scala 583:40]
  reg  innerCtrlAckHaveResetReg; // @[Debug.scala 584:43]
  wire  _innerCtrlValidReg_T = ~io_innerCtrl_ready; // @[Debug.scala 589:54]
  TLMonitor_29 monitor ( // @[Nodes.scala 24:25]
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode)
  );
  assign auto_dmi_in_a_ready = auto_dmi_in_d_ready; // @[RegisterRouter.scala 82:24]
  assign auto_dmi_in_d_valid = auto_dmi_in_a_valid; // @[RegisterRouter.scala 82:24]
  assign auto_dmi_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 97:19]
  assign auto_dmi_in_d_bits_data = _GEN_35 ? _GEN_37 : 32'h0; // @[RegisterRouter.scala 82:24]
  assign auto_int_out_0 = debugIntRegs_0 | io_hgDebugInt_0; // @[Debug.scala 557:60]
  assign io_ctrl_ndreset = DMCONTROLReg_ndmreset; // @[Debug.scala 603:21]
  assign io_ctrl_dmactive = DMCONTROLReg_dmactive; // @[Debug.scala 604:22]
  assign io_innerCtrl_valid = out_woready_1 | innerCtrlValidReg; // @[Debug.scala 593:54]
  assign io_innerCtrl_bits_resumereq = out_woready_1 & DMCONTROLWrData_resumereq | innerCtrlResumeReqReg; // @[Debug.scala 595:83]
  assign io_innerCtrl_bits_hartsel = 10'h0; // @[Debug.scala 594:42]
  assign io_innerCtrl_bits_ackhavereset = out_woready_1 & DMCONTROLWrData_ackhavereset | innerCtrlAckHaveResetReg; // @[Debug.scala 596:89]
  assign io_innerCtrl_bits_hrmask_0 = _T_1 ? 1'h0 : _GEN_24; // @[Debug.scala 474:44 475:30]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_dmi_in_d_ready; // @[RegisterRouter.scala 82:24]
  assign monitor_io_in_a_valid = auto_dmi_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_dmi_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_dmi_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_dmi_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_dmi_in_a_valid; // @[RegisterRouter.scala 82:24]
  assign monitor_io_in_d_bits_opcode = {{2'd0}, in_bits_read}; // @[Nodes.scala 1210:84 RegisterRouter.scala 97:19]
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 353:22]
      DMCONTROLReg_haltreq <= 1'h0; // @[Debug.scala 354:20]
    end else if (~DMCONTROLReg_dmactive) begin // @[Debug.scala 360:47]
      DMCONTROLReg_haltreq <= 1'h0; // @[Debug.scala 360:75]
    end else if (out_woready_1) begin // @[Debug.scala 352:18]
      DMCONTROLReg_haltreq <= DMCONTROLWrData_haltreq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 353:22]
      DMCONTROLReg_ndmreset <= 1'h0; // @[Debug.scala 354:20]
    end else if (~DMCONTROLReg_dmactive) begin // @[Debug.scala 356:47]
      DMCONTROLReg_ndmreset <= 1'h0; // @[Debug.scala 356:75]
    end else if (out_woready_1) begin // @[Debug.scala 352:18]
      DMCONTROLReg_ndmreset <= DMCONTROLWrData_ndmreset;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 364:25]
      DMCONTROLReg_dmactive <= 1'h0; // @[Debug.scala 365:29]
    end else if (out_woready_1) begin // @[Debug.scala 353:22]
      DMCONTROLReg_dmactive <= DMCONTROLWrData_dmactive; // @[Debug.scala 354:20]
    end else if (~DMCONTROLReg_dmactive) begin // @[Debug.scala 352:18]
      DMCONTROLReg_dmactive <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 474:44]
      hrmaskReg_0 <= 1'h0; // @[Debug.scala 475:30]
    end else if (_T_1) begin // @[Debug.scala 476:102]
      hrmaskReg_0 <= 1'h0; // @[Debug.scala 477:30]
    end else if (out_woready_1 & DMCONTROLWrData_clrresethaltreq & _T_11) begin
      hrmaskReg_0 <= 1'h0;
    end else begin
      hrmaskReg_0 <= _GEN_23;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 567:44]
      debugIntRegs_0 <= 1'h0; // @[Debug.scala 568:32]
    end else if (_T_1) begin // @[Debug.scala 571:96]
      debugIntRegs_0 <= 1'h0; // @[Debug.scala 572:34]
    end else if (out_woready_1) begin // @[Debug.scala 553:17]
      debugIntRegs_0 <= DMCONTROLWrData_haltreq;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 589:52]
      innerCtrlValidReg <= 1'h0;
    end else begin
      innerCtrlValidReg <= io_innerCtrl_valid & ~io_innerCtrl_ready;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 590:61]
      innerCtrlResumeReqReg <= 1'h0;
    end else begin
      innerCtrlResumeReqReg <= io_innerCtrl_bits_resumereq & _innerCtrlValidReg_T;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Debug.scala 591:64]
      innerCtrlAckHaveResetReg <= 1'h0;
    end else begin
      innerCtrlAckHaveResetReg <= io_innerCtrl_bits_ackhavereset & _innerCtrlValidReg_T;
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
  _RAND_0 = {1{`RANDOM}};
  DMCONTROLReg_haltreq = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  DMCONTROLReg_ndmreset = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  DMCONTROLReg_dmactive = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  hrmaskReg_0 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  debugIntRegs_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  innerCtrlValidReg = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  innerCtrlResumeReqReg = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  innerCtrlAckHaveResetReg = _RAND_7[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    DMCONTROLReg_haltreq = 1'h0;
  end
  if (reset) begin
    DMCONTROLReg_ndmreset = 1'h0;
  end
  if (reset) begin
    DMCONTROLReg_dmactive = 1'h0;
  end
  if (reset) begin
    hrmaskReg_0 = 1'h0;
  end
  if (reset) begin
    debugIntRegs_0 = 1'h0;
  end
  if (reset) begin
    innerCtrlValidReg = 1'h0;
  end
  if (reset) begin
    innerCtrlResumeReqReg = 1'h0;
  end
  if (reset) begin
    innerCtrlAckHaveResetReg = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
