module TLFIFOFixer_3(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [4:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [4:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
  output [4:0]  auto_out_a_bits_source,
  output [27:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
  input  [4:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
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
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [27:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [4:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire [28:0] _a_notFIFO_T_1 = {1'b0,$signed(auto_in_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [27:0] _a_id_T = auto_in_a_bits_address ^ 28'h2000; // @[Parameters.scala 137:31]
  wire [28:0] _a_id_T_1 = {1'b0,$signed(_a_id_T)}; // @[Parameters.scala 137:49]
  wire [28:0] _a_id_T_3 = $signed(_a_id_T_1) & 29'sha012000; // @[Parameters.scala 137:52]
  wire  _a_id_T_4 = $signed(_a_id_T_3) == 29'sh0; // @[Parameters.scala 137:67]
  wire [27:0] _a_id_T_5 = auto_in_a_bits_address ^ 28'h8000000; // @[Parameters.scala 137:31]
  wire [28:0] _a_id_T_6 = {1'b0,$signed(_a_id_T_5)}; // @[Parameters.scala 137:49]
  wire [28:0] _a_id_T_8 = $signed(_a_id_T_6) & 29'sh8000000; // @[Parameters.scala 137:52]
  wire  _a_id_T_9 = $signed(_a_id_T_8) == 29'sh0; // @[Parameters.scala 137:67]
  wire [27:0] _a_id_T_10 = auto_in_a_bits_address ^ 28'h2000000; // @[Parameters.scala 137:31]
  wire [28:0] _a_id_T_11 = {1'b0,$signed(_a_id_T_10)}; // @[Parameters.scala 137:49]
  wire [28:0] _a_id_T_13 = $signed(_a_id_T_11) & 29'sha010000; // @[Parameters.scala 137:52]
  wire  _a_id_T_14 = $signed(_a_id_T_13) == 29'sh0; // @[Parameters.scala 137:67]
  wire [28:0] _a_id_T_18 = $signed(_a_notFIFO_T_1) & 29'sha012000; // @[Parameters.scala 137:52]
  wire  _a_id_T_19 = $signed(_a_id_T_18) == 29'sh0; // @[Parameters.scala 137:67]
  wire [27:0] _a_id_T_20 = auto_in_a_bits_address ^ 28'h10000; // @[Parameters.scala 137:31]
  wire [28:0] _a_id_T_21 = {1'b0,$signed(_a_id_T_20)}; // @[Parameters.scala 137:49]
  wire [28:0] _a_id_T_23 = $signed(_a_id_T_21) & 29'sha010000; // @[Parameters.scala 137:52]
  wire  _a_id_T_24 = $signed(_a_id_T_23) == 29'sh0; // @[Parameters.scala 137:67]
  wire [1:0] _a_id_T_26 = _a_id_T_9 ? 2'h2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _a_id_T_27 = _a_id_T_14 ? 2'h3 : 2'h0; // @[Mux.scala 27:73]
  wire [2:0] _a_id_T_28 = _a_id_T_19 ? 3'h4 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _a_id_T_29 = _a_id_T_24 ? 3'h5 : 3'h0; // @[Mux.scala 27:73]
  wire [1:0] _GEN_82 = {{1'd0}, _a_id_T_4}; // @[Mux.scala 27:73]
  wire [1:0] _a_id_T_30 = _GEN_82 | _a_id_T_26; // @[Mux.scala 27:73]
  wire [1:0] _a_id_T_31 = _a_id_T_30 | _a_id_T_27; // @[Mux.scala 27:73]
  wire [2:0] _GEN_83 = {{1'd0}, _a_id_T_31}; // @[Mux.scala 27:73]
  wire [2:0] _a_id_T_32 = _GEN_83 | _a_id_T_28; // @[Mux.scala 27:73]
  wire [2:0] a_id = _a_id_T_32 | _a_id_T_29; // @[Mux.scala 27:73]
  wire  a_noDomain = a_id == 3'h0; // @[FIFOFixer.scala 55:29]
  wire  stalls_a_sel = auto_in_a_bits_source[4:3] == 2'h0; // @[Parameters.scala 54:32]
  reg [8:0] a_first_counter; // @[Edges.scala 228:27]
  wire  a_first = a_first_counter == 9'h0; // @[Edges.scala 230:25]
  reg  flight_0; // @[FIFOFixer.scala 71:27]
  reg  flight_1; // @[FIFOFixer.scala 71:27]
  reg  flight_2; // @[FIFOFixer.scala 71:27]
  reg  flight_3; // @[FIFOFixer.scala 71:27]
  reg  flight_4; // @[FIFOFixer.scala 71:27]
  reg  flight_5; // @[FIFOFixer.scala 71:27]
  reg  flight_6; // @[FIFOFixer.scala 71:27]
  reg  flight_7; // @[FIFOFixer.scala 71:27]
  reg [2:0] stalls_id; // @[Reg.scala 16:16]
  wire  stalls_0 = stalls_a_sel & a_first & (flight_0 | flight_1 | flight_2 | flight_3 | flight_4 | flight_5 | flight_6
     | flight_7) & (a_noDomain | stalls_id != a_id); // @[FIFOFixer.scala 80:50]
  wire  stalls_a_sel_1 = auto_in_a_bits_source[4:3] == 2'h1; // @[Parameters.scala 54:32]
  reg  flight_8; // @[FIFOFixer.scala 71:27]
  reg  flight_9; // @[FIFOFixer.scala 71:27]
  reg  flight_10; // @[FIFOFixer.scala 71:27]
  reg  flight_11; // @[FIFOFixer.scala 71:27]
  reg  flight_12; // @[FIFOFixer.scala 71:27]
  reg  flight_13; // @[FIFOFixer.scala 71:27]
  reg  flight_14; // @[FIFOFixer.scala 71:27]
  reg  flight_15; // @[FIFOFixer.scala 71:27]
  reg [2:0] stalls_id_1; // @[Reg.scala 16:16]
  wire  stalls_1 = stalls_a_sel_1 & a_first & (flight_8 | flight_9 | flight_10 | flight_11 | flight_12 | flight_13 |
    flight_14 | flight_15) & (a_noDomain | stalls_id_1 != a_id); // @[FIFOFixer.scala 80:50]
  wire  stall = stalls_0 | stalls_1; // @[FIFOFixer.scala 83:49]
  wire  _bundleIn_0_a_ready_T = ~stall; // @[FIFOFixer.scala 88:50]
  wire  bundleIn_0_a_ready = auto_out_a_ready & ~stall; // @[FIFOFixer.scala 88:33]
  wire  _a_first_T = bundleIn_0_a_ready & auto_in_a_valid; // @[Decoupled.scala 50:35]
  wire [26:0] _a_first_beats1_decode_T_1 = 27'hfff << auto_in_a_bits_size; // @[package.scala 234:77]
  wire [11:0] _a_first_beats1_decode_T_3 = ~_a_first_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] a_first_beats1_decode = _a_first_beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  a_first_beats1_opdata = ~auto_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] a_first_counter1 = a_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  _d_first_T = auto_in_d_ready & auto_out_d_valid; // @[Decoupled.scala 50:35]
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hfff << auto_out_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  d_first_beats1_opdata = auto_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  reg [8:0] d_first_counter; // @[Edges.scala 228:27]
  wire [8:0] d_first_counter1 = d_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  d_first_first = d_first_counter == 9'h0; // @[Edges.scala 230:25]
  wire  d_first = d_first_first & auto_out_d_bits_opcode != 3'h6; // @[FIFOFixer.scala 67:42]
  wire  _GEN_21 = a_first & _a_first_T ? 5'h0 == auto_in_a_bits_source | flight_0 : flight_0; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_22 = a_first & _a_first_T ? 5'h1 == auto_in_a_bits_source | flight_1 : flight_1; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_23 = a_first & _a_first_T ? 5'h2 == auto_in_a_bits_source | flight_2 : flight_2; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_24 = a_first & _a_first_T ? 5'h3 == auto_in_a_bits_source | flight_3 : flight_3; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_25 = a_first & _a_first_T ? 5'h4 == auto_in_a_bits_source | flight_4 : flight_4; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_26 = a_first & _a_first_T ? 5'h5 == auto_in_a_bits_source | flight_5 : flight_5; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_27 = a_first & _a_first_T ? 5'h6 == auto_in_a_bits_source | flight_6 : flight_6; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_28 = a_first & _a_first_T ? 5'h7 == auto_in_a_bits_source | flight_7 : flight_7; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_29 = a_first & _a_first_T ? 5'h8 == auto_in_a_bits_source | flight_8 : flight_8; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_30 = a_first & _a_first_T ? 5'h9 == auto_in_a_bits_source | flight_9 : flight_9; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_31 = a_first & _a_first_T ? 5'ha == auto_in_a_bits_source | flight_10 : flight_10; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_32 = a_first & _a_first_T ? 5'hb == auto_in_a_bits_source | flight_11 : flight_11; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_33 = a_first & _a_first_T ? 5'hc == auto_in_a_bits_source | flight_12 : flight_12; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_34 = a_first & _a_first_T ? 5'hd == auto_in_a_bits_source | flight_13 : flight_13; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_35 = a_first & _a_first_T ? 5'he == auto_in_a_bits_source | flight_14 : flight_14; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_36 = a_first & _a_first_T ? 5'hf == auto_in_a_bits_source | flight_15 : flight_15; // @[FIFOFixer.scala 71:27 72:37]
  wire  _stalls_id_T_1 = _a_first_T & stalls_a_sel; // @[FIFOFixer.scala 77:49]
  wire  _stalls_id_T_5 = _a_first_T & stalls_a_sel_1; // @[FIFOFixer.scala 77:49]
  TLMonitor_8 monitor ( // @[Nodes.scala 24:25]
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
    .io_in_d_bits_param(monitor_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt)
  );
  assign auto_in_a_ready = auto_out_a_ready & ~stall; // @[FIFOFixer.scala 88:33]
  assign auto_in_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_a_valid = auto_in_a_valid & _bundleIn_0_a_ready_T; // @[FIFOFixer.scala 87:33]
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready & ~stall; // @[FIFOFixer.scala 88:33]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_source = auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  always @(posedge clock) begin
    if (reset) begin // @[Edges.scala 228:27]
      a_first_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_a_first_T) begin // @[Edges.scala 234:17]
      if (a_first) begin // @[Edges.scala 235:21]
        if (a_first_beats1_opdata) begin // @[Edges.scala 220:14]
          a_first_counter <= a_first_beats1_decode;
        end else begin
          a_first_counter <= 9'h0;
        end
      end else begin
        a_first_counter <= a_first_counter1;
      end
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_0 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h0 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_0 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_0 <= _GEN_21;
      end
    end else begin
      flight_0 <= _GEN_21;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_1 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h1 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_1 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_1 <= _GEN_22;
      end
    end else begin
      flight_1 <= _GEN_22;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_2 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h2 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_2 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_2 <= _GEN_23;
      end
    end else begin
      flight_2 <= _GEN_23;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_3 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h3 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_3 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_3 <= _GEN_24;
      end
    end else begin
      flight_3 <= _GEN_24;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_4 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h4 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_4 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_4 <= _GEN_25;
      end
    end else begin
      flight_4 <= _GEN_25;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_5 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h5 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_5 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_5 <= _GEN_26;
      end
    end else begin
      flight_5 <= _GEN_26;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_6 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h6 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_6 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_6 <= _GEN_27;
      end
    end else begin
      flight_6 <= _GEN_27;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_7 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h7 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_7 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_7 <= _GEN_28;
      end
    end else begin
      flight_7 <= _GEN_28;
    end
    if (_stalls_id_T_1) begin // @[Reg.scala 17:18]
      stalls_id <= a_id; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_8 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h8 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_8 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_8 <= _GEN_29;
      end
    end else begin
      flight_8 <= _GEN_29;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_9 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'h9 == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_9 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_9 <= _GEN_30;
      end
    end else begin
      flight_9 <= _GEN_30;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_10 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'ha == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_10 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_10 <= _GEN_31;
      end
    end else begin
      flight_10 <= _GEN_31;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_11 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'hb == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_11 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_11 <= _GEN_32;
      end
    end else begin
      flight_11 <= _GEN_32;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_12 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'hc == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_12 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_12 <= _GEN_33;
      end
    end else begin
      flight_12 <= _GEN_33;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_13 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'hd == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_13 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_13 <= _GEN_34;
      end
    end else begin
      flight_13 <= _GEN_34;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_14 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'he == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_14 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_14 <= _GEN_35;
      end
    end else begin
      flight_14 <= _GEN_35;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight_15 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (5'hf == auto_out_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight_15 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight_15 <= _GEN_36;
      end
    end else begin
      flight_15 <= _GEN_36;
    end
    if (_stalls_id_T_5) begin // @[Reg.scala 17:18]
      stalls_id_1 <= a_id; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_first_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_d_first_T) begin // @[Edges.scala 234:17]
      if (d_first_first) begin // @[Edges.scala 235:21]
        if (d_first_beats1_opdata) begin // @[Edges.scala 220:14]
          d_first_counter <= d_first_beats1_decode;
        end else begin
          d_first_counter <= 9'h0;
        end
      end else begin
        d_first_counter <= d_first_counter1;
      end
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
  a_first_counter = _RAND_0[8:0];
  _RAND_1 = {1{`RANDOM}};
  flight_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  flight_1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  flight_2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  flight_3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  flight_4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  flight_5 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  flight_6 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  flight_7 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stalls_id = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  flight_8 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  flight_9 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  flight_10 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  flight_11 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  flight_12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  flight_13 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  flight_14 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  flight_15 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stalls_id_1 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  d_first_counter = _RAND_19[8:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
