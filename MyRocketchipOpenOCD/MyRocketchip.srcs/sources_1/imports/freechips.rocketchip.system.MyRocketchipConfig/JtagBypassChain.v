module JtagBypassChain(
  input   clock,
  input   reset,
  input   io_chainIn_shift,
  input   io_chainIn_data,
  input   io_chainIn_capture,
  input   io_chainIn_update,
  output  io_chainOut_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  reg_; // @[JtagShifter.scala 61:16]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 72:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 73:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 74:7]
  assign io_chainOut_data = reg_; // @[JtagShifter.scala 63:20]
  always @(posedge clock) begin
    if (io_chainIn_capture) begin // @[JtagShifter.scala 67:29]
      reg_ <= 1'h0; // @[JtagShifter.scala 68:9]
    end else if (io_chainIn_shift) begin // @[JtagShifter.scala 69:34]
      reg_ <= io_chainIn_data; // @[JtagShifter.scala 70:9]
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_7 & ~reset) begin
          $fatal; // @[JtagShifter.scala 72:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_7) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at JtagShifter.scala:72 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 72:9]
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
  reg_ = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
