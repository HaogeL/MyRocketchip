module QueueCompatibility_14(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [3:0] io_enq_bits_tl_state_size,
  input  [6:0] io_enq_bits_tl_state_source,
  input  [2:0] io_enq_bits_extra_id,
  input        io_deq_ready,
  output       io_deq_valid,
  output [3:0] io_deq_bits_tl_state_size,
  output [6:0] io_deq_bits_tl_state_source,
  output [2:0] io_deq_bits_extra_id
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] ram_tl_state_size [0:7]; // @[Decoupled.scala 259:95]
  wire  ram_tl_state_size_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire [2:0] ram_tl_state_size_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [3:0] ram_tl_state_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [3:0] ram_tl_state_size_MPORT_data; // @[Decoupled.scala 259:95]
  wire [2:0] ram_tl_state_size_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_tl_state_size_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_tl_state_size_MPORT_en; // @[Decoupled.scala 259:95]
  reg [6:0] ram_tl_state_source [0:7]; // @[Decoupled.scala 259:95]
  wire  ram_tl_state_source_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire [2:0] ram_tl_state_source_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [6:0] ram_tl_state_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [6:0] ram_tl_state_source_MPORT_data; // @[Decoupled.scala 259:95]
  wire [2:0] ram_tl_state_source_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_tl_state_source_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_tl_state_source_MPORT_en; // @[Decoupled.scala 259:95]
  reg [2:0] ram_extra_id [0:7]; // @[Decoupled.scala 259:95]
  wire  ram_extra_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire [2:0] ram_extra_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [2:0] ram_extra_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [2:0] ram_extra_id_MPORT_data; // @[Decoupled.scala 259:95]
  wire [2:0] ram_extra_id_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_extra_id_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_extra_id_MPORT_en; // @[Decoupled.scala 259:95]
  reg [2:0] enq_ptr_value; // @[Counter.scala 62:40]
  reg [2:0] deq_ptr_value; // @[Counter.scala 62:40]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 263:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 264:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 265:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _value_T_1 = enq_ptr_value + 3'h1; // @[Counter.scala 78:24]
  wire [2:0] _value_T_3 = deq_ptr_value + 3'h1; // @[Counter.scala 78:24]
  assign ram_tl_state_size_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tl_state_size_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_tl_state_size_io_deq_bits_MPORT_data = ram_tl_state_size[ram_tl_state_size_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_tl_state_size_MPORT_data = io_enq_bits_tl_state_size;
  assign ram_tl_state_size_MPORT_addr = enq_ptr_value;
  assign ram_tl_state_size_MPORT_mask = 1'h1;
  assign ram_tl_state_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tl_state_source_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tl_state_source_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_tl_state_source_io_deq_bits_MPORT_data = ram_tl_state_source[ram_tl_state_source_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_tl_state_source_MPORT_data = io_enq_bits_tl_state_source;
  assign ram_tl_state_source_MPORT_addr = enq_ptr_value;
  assign ram_tl_state_source_MPORT_mask = 1'h1;
  assign ram_tl_state_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_extra_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_extra_id_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_extra_id_io_deq_bits_MPORT_data = ram_extra_id[ram_extra_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_extra_id_MPORT_data = io_enq_bits_extra_id;
  assign ram_extra_id_MPORT_addr = enq_ptr_value;
  assign ram_extra_id_MPORT_mask = 1'h1;
  assign ram_extra_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 288:19]
  assign io_deq_bits_tl_state_size = ram_tl_state_size_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_tl_state_source = ram_tl_state_source_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_extra_id = ram_extra_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  always @(posedge clock) begin
    if (ram_tl_state_size_MPORT_en & ram_tl_state_size_MPORT_mask) begin
      ram_tl_state_size[ram_tl_state_size_MPORT_addr] <= ram_tl_state_size_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_tl_state_source_MPORT_en & ram_tl_state_source_MPORT_mask) begin
      ram_tl_state_source[ram_tl_state_source_MPORT_addr] <= ram_tl_state_source_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_extra_id_MPORT_en & ram_extra_id_MPORT_mask) begin
      ram_extra_id[ram_extra_id_MPORT_addr] <= ram_extra_id_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Counter.scala 62:40]
      enq_ptr_value <= 3'h0; // @[Counter.scala 62:40]
    end else if (do_enq) begin // @[Decoupled.scala 272:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 78:15]
    end
    if (reset) begin // @[Counter.scala 62:40]
      deq_ptr_value <= 3'h0; // @[Counter.scala 62:40]
    end else if (do_deq) begin // @[Decoupled.scala 276:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 78:15]
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 279:27]
      maybe_full <= do_enq; // @[Decoupled.scala 280:16]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_tl_state_size[initvar] = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_tl_state_source[initvar] = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram_extra_id[initvar] = _RAND_2[2:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  enq_ptr_value = _RAND_3[2:0];
  _RAND_4 = {1{`RANDOM}};
  deq_ptr_value = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  maybe_full = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
