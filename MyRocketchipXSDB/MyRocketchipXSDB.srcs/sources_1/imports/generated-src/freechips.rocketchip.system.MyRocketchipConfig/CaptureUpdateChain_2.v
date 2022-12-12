module CaptureUpdateChain_2(
  input        clock,
  input        reset,
  input        io_chainIn_shift,
  input        io_chainIn_data,
  input        io_chainIn_capture,
  input        io_chainIn_update,
  output       io_chainOut_data,
  output [4:0] io_update_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg  regs_0; // @[JtagShifter.scala 154:39]
  reg  regs_1; // @[JtagShifter.scala 154:39]
  reg  regs_2; // @[JtagShifter.scala 154:39]
  reg  regs_3; // @[JtagShifter.scala 154:39]
  reg  regs_4; // @[JtagShifter.scala 154:39]
  wire [1:0] updateBits_lo = {regs_1,regs_0}; // @[Cat.scala 31:58]
  wire [2:0] updateBits_hi = {regs_4,regs_3,regs_2}; // @[Cat.scala 31:58]
  wire  _GEN_1 = io_chainIn_shift ? regs_1 : regs_0; // @[JtagShifter.scala 174:34 176:37 154:39]
  wire  _GEN_9 = io_chainIn_update ? regs_0 : _GEN_1; // @[JtagShifter.scala 171:35 154:39]
  wire  _T_1 = ~(io_chainIn_capture & io_chainIn_update); // @[JtagShifter.scala 183:10]
  wire  _T_4 = _T_1 & ~(io_chainIn_capture & io_chainIn_shift); // @[JtagShifter.scala 184:7]
  wire  _T_7 = _T_4 & ~(io_chainIn_update & io_chainIn_shift); // @[JtagShifter.scala 185:7]
  assign io_chainOut_data = regs_0; // @[JtagShifter.scala 156:20]
  assign io_update_bits = {updateBits_hi,updateBits_lo}; // @[Cat.scala 31:58]
  always @(posedge clock) begin
    regs_0 <= io_chainIn_capture | _GEN_9; // @[JtagShifter.scala 166:29 167:59]
    if (io_chainIn_capture) begin // @[JtagShifter.scala 166:29]
      regs_1 <= 1'h0; // @[JtagShifter.scala 167:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 171:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 174:34]
        regs_1 <= regs_2; // @[JtagShifter.scala 176:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 166:29]
      regs_2 <= 1'h0; // @[JtagShifter.scala 167:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 171:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 174:34]
        regs_2 <= regs_3; // @[JtagShifter.scala 176:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 166:29]
      regs_3 <= 1'h0; // @[JtagShifter.scala 167:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 171:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 174:34]
        regs_3 <= regs_4; // @[JtagShifter.scala 176:37]
      end
    end
    if (io_chainIn_capture) begin // @[JtagShifter.scala 166:29]
      regs_4 <= 1'h0; // @[JtagShifter.scala 167:59]
    end else if (!(io_chainIn_update)) begin // @[JtagShifter.scala 171:35]
      if (io_chainIn_shift) begin // @[JtagShifter.scala 174:34]
        regs_4 <= io_chainIn_data; // @[JtagShifter.scala 175:15]
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_7 & ~reset) begin
          $fatal; // @[JtagShifter.scala 183:9]
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
            "Assertion failed\n    at JtagShifter.scala:183 assert(!(io.chainIn.capture && io.chainIn.update)\n"); // @[JtagShifter.scala 183:9]
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
  regs_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
