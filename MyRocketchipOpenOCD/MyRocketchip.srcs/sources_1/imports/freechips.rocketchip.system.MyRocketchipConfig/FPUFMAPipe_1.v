module FPUFMAPipe_1(
  input         clock,
  input         reset,
  input         io_in_valid,
  input         io_in_bits_ren3,
  input         io_in_bits_swap23,
  input  [2:0]  io_in_bits_rm,
  input  [1:0]  io_in_bits_fmaCmd,
  input  [64:0] io_in_bits_in1,
  input  [64:0] io_in_bits_in2,
  input  [64:0] io_in_bits_in3,
  output [64:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [95:0] _RAND_3;
  reg [95:0] _RAND_4;
  reg [95:0] _RAND_5;
  reg [95:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  fma_clock; // @[FPU.scala 711:19]
  wire  fma_reset; // @[FPU.scala 711:19]
  wire  fma_io_validin; // @[FPU.scala 711:19]
  wire [1:0] fma_io_op; // @[FPU.scala 711:19]
  wire [64:0] fma_io_a; // @[FPU.scala 711:19]
  wire [64:0] fma_io_b; // @[FPU.scala 711:19]
  wire [64:0] fma_io_c; // @[FPU.scala 711:19]
  wire [2:0] fma_io_roundingMode; // @[FPU.scala 711:19]
  wire [64:0] fma_io_out; // @[FPU.scala 711:19]
  wire [4:0] fma_io_exceptionFlags; // @[FPU.scala 711:19]
  wire  fma_io_validout; // @[FPU.scala 711:19]
  reg  valid; // @[FPU.scala 699:18]
  reg [2:0] in_rm; // @[FPU.scala 700:15]
  reg [1:0] in_fmaCmd; // @[FPU.scala 700:15]
  reg [64:0] in_in1; // @[FPU.scala 700:15]
  reg [64:0] in_in2; // @[FPU.scala 700:15]
  reg [64:0] in_in3; // @[FPU.scala 700:15]
  wire [64:0] _zero_T = io_in_bits_in1 ^ io_in_bits_in2; // @[FPU.scala 703:32]
  wire [64:0] zero = _zero_T & 65'h10000000000000000; // @[FPU.scala 703:50]
  wire [64:0] res_data_maskedNaN = fma_io_out & 65'h1efefffffffffffff; // @[FPU.scala 408:25]
  wire  _res_data_T_1 = &fma_io_out[63:61]; // @[FPU.scala 244:56]
  reg [64:0] io_out_b_data; // @[Reg.scala 16:16]
  reg [4:0] io_out_b_exc; // @[Reg.scala 16:16]
  wire [4:0] res_exc = fma_io_exceptionFlags; // @[FPU.scala 720:17 722:11]
  MulAddRecFNPipe_1 fma ( // @[FPU.scala 711:19]
    .clock(fma_clock),
    .reset(fma_reset),
    .io_validin(fma_io_validin),
    .io_op(fma_io_op),
    .io_a(fma_io_a),
    .io_b(fma_io_b),
    .io_c(fma_io_c),
    .io_roundingMode(fma_io_roundingMode),
    .io_out(fma_io_out),
    .io_exceptionFlags(fma_io_exceptionFlags),
    .io_validout(fma_io_validout)
  );
  assign io_out_bits_data = io_out_b_data; // @[Valid.scala 122:21 124:16]
  assign io_out_bits_exc = io_out_b_exc; // @[Valid.scala 122:21 124:16]
  assign fma_clock = clock;
  assign fma_reset = reset;
  assign fma_io_validin = valid; // @[FPU.scala 712:18]
  assign fma_io_op = in_fmaCmd; // @[FPU.scala 713:13]
  assign fma_io_a = in_in1; // @[FPU.scala 716:12]
  assign fma_io_b = in_in2; // @[FPU.scala 717:12]
  assign fma_io_c = in_in3; // @[FPU.scala 718:12]
  assign fma_io_roundingMode = in_rm; // @[FPU.scala 714:23]
  always @(posedge clock) begin
    valid <= io_in_valid; // @[FPU.scala 699:18]
    if (io_in_valid) begin // @[FPU.scala 701:22]
      in_rm <= io_in_bits_rm; // @[FPU.scala 706:8]
    end
    if (io_in_valid) begin // @[FPU.scala 701:22]
      in_fmaCmd <= io_in_bits_fmaCmd; // @[FPU.scala 706:8]
    end
    if (io_in_valid) begin // @[FPU.scala 701:22]
      in_in1 <= io_in_bits_in1; // @[FPU.scala 706:8]
    end
    if (io_in_valid) begin // @[FPU.scala 701:22]
      if (io_in_bits_swap23) begin // @[FPU.scala 707:23]
        in_in2 <= 65'h8000000000000000; // @[FPU.scala 707:32]
      end else begin
        in_in2 <= io_in_bits_in2; // @[FPU.scala 706:8]
      end
    end
    if (io_in_valid) begin // @[FPU.scala 701:22]
      if (~(io_in_bits_ren3 | io_in_bits_swap23)) begin // @[FPU.scala 708:37]
        in_in3 <= zero; // @[FPU.scala 708:46]
      end else begin
        in_in3 <= io_in_bits_in3; // @[FPU.scala 706:8]
      end
    end
    if (fma_io_validout) begin // @[Reg.scala 17:18]
      if (_res_data_T_1) begin // @[FPU.scala 409:10]
        io_out_b_data <= res_data_maskedNaN;
      end else begin
        io_out_b_data <= fma_io_out;
      end
    end
    if (fma_io_validout) begin // @[Reg.scala 17:18]
      io_out_b_exc <= res_exc; // @[Reg.scala 17:22]
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
  valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  in_rm = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  in_fmaCmd = _RAND_2[1:0];
  _RAND_3 = {3{`RANDOM}};
  in_in1 = _RAND_3[64:0];
  _RAND_4 = {3{`RANDOM}};
  in_in2 = _RAND_4[64:0];
  _RAND_5 = {3{`RANDOM}};
  in_in3 = _RAND_5[64:0];
  _RAND_6 = {3{`RANDOM}};
  io_out_b_data = _RAND_6[64:0];
  _RAND_7 = {1{`RANDOM}};
  io_out_b_exc = _RAND_7[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
