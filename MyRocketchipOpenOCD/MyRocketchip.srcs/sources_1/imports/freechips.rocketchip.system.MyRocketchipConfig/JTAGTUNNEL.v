module JTAGTUNNEL(
  output  jtag_tck,
  output  jtag_tms,
  output  jtag_tdi,
  input   jtag_tdo,
  input   jtag_tdo_en
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  bscane2_TDO; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_CAPTURE; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_DRCK; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_RESET; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_RUNTEST; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_SEL; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_SHIFT; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_TCK; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_TDI; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_TMS; // @[Bscane2Jtag.scala 44:32]
  wire  bscane2_UPDATE; // @[Bscane2Jtag.scala 44:32]
  wire  bufgce_O; // @[Bscane2Jtag.scala 47:22]
  wire  bufgce_CE; // @[Bscane2Jtag.scala 47:22]
  wire  bufgce_I; // @[Bscane2Jtag.scala 47:22]
  wire  negClock = ~bscane2_TCK; // @[Bscane2Jtag.scala 53:40]
  wire  _T = ~bscane2_SHIFT; // @[Bscane2Jtag.scala 57:13]
  reg [6:0] shiftCounter; // @[Bscane2Jtag.scala 59:33]
  reg [7:0] posCounter; // @[Bscane2Jtag.scala 60:31]
  reg  tdiRegister; // @[Bscane2Jtag.scala 61:32]
  wire [7:0] _posCounter_T_1 = posCounter + 8'h1; // @[Bscane2Jtag.scala 62:32]
  wire [6:0] _shiftCounter_T_1 = {bscane2_TDI,shiftCounter[6:1]}; // @[Cat.scala 31:58]
  reg [7:0] negCounter; // @[Bscane2Jtag.scala 73:31]
  wire [7:0] _negCounter_T_1 = negCounter + 8'h1; // @[Bscane2Jtag.scala 74:32]
  wire [6:0] _jtag_tms_T_1 = shiftCounter + 7'h7; // @[Bscane2Jtag.scala 78:26]
  wire [6:0] _jtag_tms_T_3 = shiftCounter + 7'h8; // @[Bscane2Jtag.scala 79:26]
  wire [7:0] _GEN_2 = {{1'd0}, _jtag_tms_T_1}; // @[Mux.scala 81:61]
  wire [7:0] _GEN_3 = {{1'd0}, _jtag_tms_T_3}; // @[Mux.scala 81:61]
  BSCANE2 #(.JTAG_CHAIN(4)) bscane2 ( // @[Bscane2Jtag.scala 44:32]
    .TDO(bscane2_TDO),
    .CAPTURE(bscane2_CAPTURE),
    .DRCK(bscane2_DRCK),
    .RESET(bscane2_RESET),
    .RUNTEST(bscane2_RUNTEST),
    .SEL(bscane2_SEL),
    .SHIFT(bscane2_SHIFT),
    .TCK(bscane2_TCK),
    .TDI(bscane2_TDI),
    .TMS(bscane2_TMS),
    .UPDATE(bscane2_UPDATE)
  );
  BUFGCE bufgce ( // @[Bscane2Jtag.scala 47:22]
    .O(bufgce_O),
    .CE(bufgce_CE),
    .I(bufgce_I)
  );
  assign jtag_tck = bufgce_O; // @[Bscane2Jtag.scala 50:24]
  assign jtag_tms = _GEN_3 == negCounter | (_GEN_2 == negCounter | (8'h5 == negCounter | 8'h4 == negCounter &
    tdiRegister)); // @[Mux.scala 81:58]
  assign jtag_tdi = bscane2_TDI; // @[Bscane2Jtag.scala 45:12]
  assign bscane2_TDO = jtag_tdo_en ? jtag_tdo : 1'h1; // @[Bscane2Jtag.scala 46:21]
  assign bufgce_CE = bscane2_SEL; // @[Bscane2Jtag.scala 49:13]
  assign bufgce_I = bscane2_TCK; // @[Bscane2Jtag.scala 48:12]
  always @(posedge bscane2_TCK) begin
    if (_T) begin // @[Bscane2Jtag.scala 59:33]
      shiftCounter <= 7'h0; // @[Bscane2Jtag.scala 59:33]
    end else if (posCounter >= 8'h1 & posCounter <= 8'h7) begin // @[Bscane2Jtag.scala 63:52]
      shiftCounter <= _shiftCounter_T_1; // @[Bscane2Jtag.scala 64:22]
    end
    if (_T) begin // @[Bscane2Jtag.scala 60:31]
      posCounter <= 8'h0; // @[Bscane2Jtag.scala 60:31]
    end else begin
      posCounter <= _posCounter_T_1; // @[Bscane2Jtag.scala 62:18]
    end
    if (_T) begin // @[Bscane2Jtag.scala 61:32]
      tdiRegister <= 1'h0; // @[Bscane2Jtag.scala 61:32]
    end else if (posCounter == 8'h0) begin // @[Bscane2Jtag.scala 66:32]
      tdiRegister <= ~bscane2_TDI; // @[Bscane2Jtag.scala 67:21]
    end
  end
  always @(posedge negClock) begin
    if (_T) begin // @[Bscane2Jtag.scala 73:31]
      negCounter <= 8'h0; // @[Bscane2Jtag.scala 73:31]
    end else begin
      negCounter <= _negCounter_T_1; // @[Bscane2Jtag.scala 74:18]
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
  shiftCounter = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  posCounter = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  tdiRegister = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  negCounter = _RAND_3[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
