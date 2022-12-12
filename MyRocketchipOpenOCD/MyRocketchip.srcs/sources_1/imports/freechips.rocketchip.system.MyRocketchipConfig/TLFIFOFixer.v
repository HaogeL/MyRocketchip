module TLFIFOFixer(
  input         clock,
  input         reset,
  output        auto_in_1_a_ready,
  input         auto_in_1_a_valid,
  input  [2:0]  auto_in_1_a_bits_opcode,
  input  [2:0]  auto_in_1_a_bits_param,
  input  [3:0]  auto_in_1_a_bits_size,
  input  [1:0]  auto_in_1_a_bits_source,
  input  [31:0] auto_in_1_a_bits_address,
  input  [7:0]  auto_in_1_a_bits_mask,
  input  [63:0] auto_in_1_a_bits_data,
  input         auto_in_1_a_bits_corrupt,
  input         auto_in_1_b_ready,
  output        auto_in_1_b_valid,
  output [1:0]  auto_in_1_b_bits_param,
  output [31:0] auto_in_1_b_bits_address,
  output        auto_in_1_c_ready,
  input         auto_in_1_c_valid,
  input  [2:0]  auto_in_1_c_bits_opcode,
  input  [2:0]  auto_in_1_c_bits_param,
  input  [3:0]  auto_in_1_c_bits_size,
  input  [1:0]  auto_in_1_c_bits_source,
  input  [31:0] auto_in_1_c_bits_address,
  input  [63:0] auto_in_1_c_bits_data,
  input         auto_in_1_c_bits_corrupt,
  input         auto_in_1_d_ready,
  output        auto_in_1_d_valid,
  output [2:0]  auto_in_1_d_bits_opcode,
  output [1:0]  auto_in_1_d_bits_param,
  output [3:0]  auto_in_1_d_bits_size,
  output [1:0]  auto_in_1_d_bits_source,
  output [1:0]  auto_in_1_d_bits_sink,
  output        auto_in_1_d_bits_denied,
  output [63:0] auto_in_1_d_bits_data,
  output        auto_in_1_d_bits_corrupt,
  input         auto_in_1_e_valid,
  input  [1:0]  auto_in_1_e_bits_sink,
  output        auto_in_0_a_ready,
  input         auto_in_0_a_valid,
  input  [2:0]  auto_in_0_a_bits_opcode,
  input  [2:0]  auto_in_0_a_bits_param,
  input  [3:0]  auto_in_0_a_bits_size,
  input  [3:0]  auto_in_0_a_bits_source,
  input  [31:0] auto_in_0_a_bits_address,
  input         auto_in_0_a_bits_user_amba_prot_bufferable,
  input         auto_in_0_a_bits_user_amba_prot_modifiable,
  input         auto_in_0_a_bits_user_amba_prot_readalloc,
  input         auto_in_0_a_bits_user_amba_prot_writealloc,
  input         auto_in_0_a_bits_user_amba_prot_privileged,
  input         auto_in_0_a_bits_user_amba_prot_secure,
  input         auto_in_0_a_bits_user_amba_prot_fetch,
  input  [7:0]  auto_in_0_a_bits_mask,
  input  [63:0] auto_in_0_a_bits_data,
  input         auto_in_0_a_bits_corrupt,
  input         auto_in_0_d_ready,
  output        auto_in_0_d_valid,
  output [2:0]  auto_in_0_d_bits_opcode,
  output [1:0]  auto_in_0_d_bits_param,
  output [3:0]  auto_in_0_d_bits_size,
  output [3:0]  auto_in_0_d_bits_source,
  output [1:0]  auto_in_0_d_bits_sink,
  output        auto_in_0_d_bits_denied,
  output [63:0] auto_in_0_d_bits_data,
  output        auto_in_0_d_bits_corrupt,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
  output [2:0]  auto_out_1_a_bits_param,
  output [3:0]  auto_out_1_a_bits_size,
  output [1:0]  auto_out_1_a_bits_source,
  output [31:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
  output        auto_out_1_b_ready,
  input         auto_out_1_b_valid,
  input  [1:0]  auto_out_1_b_bits_param,
  input  [31:0] auto_out_1_b_bits_address,
  input         auto_out_1_c_ready,
  output        auto_out_1_c_valid,
  output [2:0]  auto_out_1_c_bits_opcode,
  output [2:0]  auto_out_1_c_bits_param,
  output [3:0]  auto_out_1_c_bits_size,
  output [1:0]  auto_out_1_c_bits_source,
  output [31:0] auto_out_1_c_bits_address,
  output [63:0] auto_out_1_c_bits_data,
  output        auto_out_1_c_bits_corrupt,
  output        auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [1:0]  auto_out_1_d_bits_param,
  input  [3:0]  auto_out_1_d_bits_size,
  input  [1:0]  auto_out_1_d_bits_source,
  input  [1:0]  auto_out_1_d_bits_sink,
  input         auto_out_1_d_bits_denied,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_1_d_bits_corrupt,
  output        auto_out_1_e_valid,
  output [1:0]  auto_out_1_e_bits_sink,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
  output [2:0]  auto_out_0_a_bits_param,
  output [3:0]  auto_out_0_a_bits_size,
  output [3:0]  auto_out_0_a_bits_source,
  output [31:0] auto_out_0_a_bits_address,
  output        auto_out_0_a_bits_user_amba_prot_bufferable,
  output        auto_out_0_a_bits_user_amba_prot_modifiable,
  output        auto_out_0_a_bits_user_amba_prot_readalloc,
  output        auto_out_0_a_bits_user_amba_prot_writealloc,
  output        auto_out_0_a_bits_user_amba_prot_privileged,
  output        auto_out_0_a_bits_user_amba_prot_secure,
  output        auto_out_0_a_bits_user_amba_prot_fetch,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
  output        auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [3:0]  auto_out_0_d_bits_source,
  input  [1:0]  auto_out_0_d_bits_sink,
  input         auto_out_0_d_bits_denied,
  input  [63:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt
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
  wire [3:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [3:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_clock; // @[Nodes.scala 24:25]
  wire  monitor_1_reset; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_1_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_1_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_a_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_b_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_b_valid; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_b_bits_param; // @[Nodes.scala 24:25]
  wire [31:0] monitor_1_io_in_b_bits_address; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_c_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_c_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_c_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_c_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_c_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_c_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_1_io_in_c_bits_address; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_c_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_1_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_d_bits_param; // @[Nodes.scala 24:25]
  wire [3:0] monitor_1_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_d_bits_sink; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  monitor_1_io_in_e_valid; // @[Nodes.scala 24:25]
  wire [1:0] monitor_1_io_in_e_bits_sink; // @[Nodes.scala 24:25]
  wire [32:0] _a_notFIFO_T_1 = {1'b0,$signed(auto_in_0_a_bits_address)}; // @[Parameters.scala 137:49]
  wire [31:0] _a_notFIFO_T_5 = auto_in_0_a_bits_address ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _a_notFIFO_T_6 = {1'b0,$signed(_a_notFIFO_T_5)}; // @[Parameters.scala 137:49]
  wire [32:0] _a_notFIFO_T_8 = $signed(_a_notFIFO_T_6) & 33'sh80000000; // @[Parameters.scala 137:52]
  wire  a_notFIFO = $signed(_a_notFIFO_T_8) == 33'sh0; // @[Parameters.scala 137:67]
  wire [32:0] _a_id_T_3 = $signed(_a_notFIFO_T_1) & 33'sh40000000; // @[Parameters.scala 137:52]
  wire  _a_id_T_4 = $signed(_a_id_T_3) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _a_id_T_5 = auto_in_0_a_bits_address ^ 32'h40000000; // @[Parameters.scala 137:31]
  wire [32:0] _a_id_T_6 = {1'b0,$signed(_a_id_T_5)}; // @[Parameters.scala 137:49]
  wire [32:0] _a_id_T_8 = $signed(_a_id_T_6) & 33'sh40000000; // @[Parameters.scala 137:52]
  wire  _a_id_T_9 = $signed(_a_id_T_8) == 33'sh0; // @[Parameters.scala 137:67]
  wire [1:0] _a_id_T_11 = _a_id_T_9 ? 2'h2 : 2'h0; // @[Mux.scala 27:73]
  wire [1:0] _GEN_86 = {{1'd0}, _a_id_T_4}; // @[Mux.scala 27:73]
  wire [1:0] a_id = _GEN_86 | _a_id_T_11; // @[Mux.scala 27:73]
  wire  a_noDomain = a_id == 2'h0; // @[FIFOFixer.scala 55:29]
  wire  stalls_a_sel = ~auto_in_0_a_bits_source[3]; // @[Parameters.scala 54:32]
  reg [8:0] a_first_counter; // @[Edges.scala 228:27]
  wire  a_first = a_first_counter == 9'h0; // @[Edges.scala 230:25]
  reg  flight__0; // @[FIFOFixer.scala 71:27]
  reg  flight__1; // @[FIFOFixer.scala 71:27]
  reg  flight__2; // @[FIFOFixer.scala 71:27]
  reg  flight__3; // @[FIFOFixer.scala 71:27]
  reg  flight__4; // @[FIFOFixer.scala 71:27]
  reg  flight__5; // @[FIFOFixer.scala 71:27]
  reg  flight__6; // @[FIFOFixer.scala 71:27]
  reg  flight__7; // @[FIFOFixer.scala 71:27]
  reg [1:0] stalls_id; // @[Reg.scala 16:16]
  wire  stalls_0 = stalls_a_sel & a_first & (flight__0 | flight__1 | flight__2 | flight__3 | flight__4 | flight__5 |
    flight__6 | flight__7) & (a_noDomain | stalls_id != a_id); // @[FIFOFixer.scala 80:50]
  reg  flight__8; // @[FIFOFixer.scala 71:27]
  reg  flight__9; // @[FIFOFixer.scala 71:27]
  reg  flight__10; // @[FIFOFixer.scala 71:27]
  reg  flight__11; // @[FIFOFixer.scala 71:27]
  reg  flight__12; // @[FIFOFixer.scala 71:27]
  reg  flight__13; // @[FIFOFixer.scala 71:27]
  reg  flight__14; // @[FIFOFixer.scala 71:27]
  reg  flight__15; // @[FIFOFixer.scala 71:27]
  reg [1:0] stalls_id_1; // @[Reg.scala 16:16]
  wire  stalls_1 = auto_in_0_a_bits_source[3] & a_first & (flight__8 | flight__9 | flight__10 | flight__11 | flight__12
     | flight__13 | flight__14 | flight__15) & (a_noDomain | stalls_id_1 != a_id); // @[FIFOFixer.scala 80:50]
  wire  stall = stalls_0 | stalls_1; // @[FIFOFixer.scala 83:49]
  wire  _bundleIn_0_a_ready_T_1 = a_notFIFO | ~stall; // @[FIFOFixer.scala 88:47]
  wire  bundleIn_0_a_ready = auto_out_0_a_ready & (a_notFIFO | ~stall); // @[FIFOFixer.scala 88:33]
  wire  _a_first_T = bundleIn_0_a_ready & auto_in_0_a_valid; // @[Decoupled.scala 50:35]
  wire [26:0] _a_first_beats1_decode_T_1 = 27'hfff << auto_in_0_a_bits_size; // @[package.scala 234:77]
  wire [11:0] _a_first_beats1_decode_T_3 = ~_a_first_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] a_first_beats1_decode = _a_first_beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  a_first_beats1_opdata = ~auto_in_0_a_bits_opcode[2]; // @[Edges.scala 91:28]
  wire [8:0] a_first_counter1 = a_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  _d_first_T = auto_in_0_d_ready & auto_out_0_d_valid; // @[Decoupled.scala 50:35]
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hfff << auto_out_0_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _d_first_beats1_decode_T_3 = ~_d_first_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] d_first_beats1_decode = _d_first_beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire  d_first_beats1_opdata = auto_out_0_d_bits_opcode[0]; // @[Edges.scala 105:36]
  reg [8:0] d_first_counter; // @[Edges.scala 228:27]
  wire [8:0] d_first_counter1 = d_first_counter - 9'h1; // @[Edges.scala 229:28]
  wire  d_first_first = d_first_counter == 9'h0; // @[Edges.scala 230:25]
  wire  d_first = d_first_first & auto_out_0_d_bits_opcode != 3'h6; // @[FIFOFixer.scala 67:42]
  wire  _flight_T = ~a_notFIFO; // @[FIFOFixer.scala 72:67]
  wire  _GEN_2 = 4'h0 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__0; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_3 = 4'h1 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__1; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_4 = 4'h2 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__2; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_5 = 4'h3 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__3; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_6 = 4'h4 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__4; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_7 = 4'h5 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__5; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_8 = 4'h6 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__6; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_9 = 4'h7 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__7; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_10 = 4'h8 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__8; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_11 = 4'h9 == auto_in_0_a_bits_source ? ~a_notFIFO : flight__9; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_12 = 4'ha == auto_in_0_a_bits_source ? ~a_notFIFO : flight__10; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_13 = 4'hb == auto_in_0_a_bits_source ? ~a_notFIFO : flight__11; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_14 = 4'hc == auto_in_0_a_bits_source ? ~a_notFIFO : flight__12; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_15 = 4'hd == auto_in_0_a_bits_source ? ~a_notFIFO : flight__13; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_16 = 4'he == auto_in_0_a_bits_source ? ~a_notFIFO : flight__14; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_17 = 4'hf == auto_in_0_a_bits_source ? ~a_notFIFO : flight__15; // @[FIFOFixer.scala 71:27 72:{64,64}]
  wire  _GEN_18 = a_first & _a_first_T ? _GEN_2 : flight__0; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_19 = a_first & _a_first_T ? _GEN_3 : flight__1; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_20 = a_first & _a_first_T ? _GEN_4 : flight__2; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_21 = a_first & _a_first_T ? _GEN_5 : flight__3; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_22 = a_first & _a_first_T ? _GEN_6 : flight__4; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_23 = a_first & _a_first_T ? _GEN_7 : flight__5; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_24 = a_first & _a_first_T ? _GEN_8 : flight__6; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_25 = a_first & _a_first_T ? _GEN_9 : flight__7; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_26 = a_first & _a_first_T ? _GEN_10 : flight__8; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_27 = a_first & _a_first_T ? _GEN_11 : flight__9; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_28 = a_first & _a_first_T ? _GEN_12 : flight__10; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_29 = a_first & _a_first_T ? _GEN_13 : flight__11; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_30 = a_first & _a_first_T ? _GEN_14 : flight__12; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_31 = a_first & _a_first_T ? _GEN_15 : flight__13; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_32 = a_first & _a_first_T ? _GEN_16 : flight__14; // @[FIFOFixer.scala 71:27 72:37]
  wire  _GEN_33 = a_first & _a_first_T ? _GEN_17 : flight__15; // @[FIFOFixer.scala 71:27 72:37]
  wire  _stalls_id_T_3 = _a_first_T & stalls_a_sel & _flight_T; // @[FIFOFixer.scala 77:58]
  wire  _stalls_id_T_7 = _a_first_T & auto_in_0_a_bits_source[3] & _flight_T; // @[FIFOFixer.scala 77:58]
  TLMonitor_2 monitor ( // @[Nodes.scala 24:25]
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
  TLMonitor_3 monitor_1 ( // @[Nodes.scala 24:25]
    .clock(monitor_1_clock),
    .reset(monitor_1_reset),
    .io_in_a_ready(monitor_1_io_in_a_ready),
    .io_in_a_valid(monitor_1_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_1_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_1_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_1_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_1_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_1_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_1_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(monitor_1_io_in_a_bits_corrupt),
    .io_in_b_ready(monitor_1_io_in_b_ready),
    .io_in_b_valid(monitor_1_io_in_b_valid),
    .io_in_b_bits_param(monitor_1_io_in_b_bits_param),
    .io_in_b_bits_address(monitor_1_io_in_b_bits_address),
    .io_in_c_ready(monitor_1_io_in_c_ready),
    .io_in_c_valid(monitor_1_io_in_c_valid),
    .io_in_c_bits_opcode(monitor_1_io_in_c_bits_opcode),
    .io_in_c_bits_param(monitor_1_io_in_c_bits_param),
    .io_in_c_bits_size(monitor_1_io_in_c_bits_size),
    .io_in_c_bits_source(monitor_1_io_in_c_bits_source),
    .io_in_c_bits_address(monitor_1_io_in_c_bits_address),
    .io_in_c_bits_corrupt(monitor_1_io_in_c_bits_corrupt),
    .io_in_d_ready(monitor_1_io_in_d_ready),
    .io_in_d_valid(monitor_1_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_1_io_in_d_bits_opcode),
    .io_in_d_bits_param(monitor_1_io_in_d_bits_param),
    .io_in_d_bits_size(monitor_1_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_1_io_in_d_bits_source),
    .io_in_d_bits_sink(monitor_1_io_in_d_bits_sink),
    .io_in_d_bits_denied(monitor_1_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(monitor_1_io_in_d_bits_corrupt),
    .io_in_e_valid(monitor_1_io_in_e_valid),
    .io_in_e_bits_sink(monitor_1_io_in_e_bits_sink)
  );
  assign auto_in_1_a_ready = auto_out_1_a_ready; // @[FIFOFixer.scala 88:33]
  assign auto_in_1_b_valid = auto_out_1_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_b_bits_param = auto_out_1_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_b_bits_address = auto_out_1_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_c_ready = auto_out_1_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_valid = auto_out_1_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_opcode = auto_out_1_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_param = auto_out_1_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_size = auto_out_1_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_source = auto_out_1_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_sink = auto_out_1_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_denied = auto_out_1_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_data = auto_out_1_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_1_d_bits_corrupt = auto_out_1_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_a_ready = auto_out_0_a_ready & (a_notFIFO | ~stall); // @[FIFOFixer.scala 88:33]
  assign auto_in_0_d_valid = auto_out_0_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_opcode = auto_out_0_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_param = auto_out_0_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_size = auto_out_0_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_source = auto_out_0_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_sink = auto_out_0_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_denied = auto_out_0_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_data = auto_out_0_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_0_d_bits_corrupt = auto_out_0_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_out_1_a_valid = auto_in_1_a_valid; // @[FIFOFixer.scala 87:33]
  assign auto_out_1_a_bits_opcode = auto_in_1_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_param = auto_in_1_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_size = auto_in_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_source = auto_in_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_address = auto_in_1_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_mask = auto_in_1_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_data = auto_in_1_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_a_bits_corrupt = auto_in_1_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_b_ready = auto_in_1_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_valid = auto_in_1_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_opcode = auto_in_1_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_param = auto_in_1_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_size = auto_in_1_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_source = auto_in_1_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_address = auto_in_1_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_data = auto_in_1_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_c_bits_corrupt = auto_in_1_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_d_ready = auto_in_1_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_e_valid = auto_in_1_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_1_e_bits_sink = auto_in_1_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_valid = auto_in_0_a_valid & _bundleIn_0_a_ready_T_1; // @[FIFOFixer.scala 87:33]
  assign auto_out_0_a_bits_opcode = auto_in_0_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_param = auto_in_0_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_size = auto_in_0_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_source = auto_in_0_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_address = auto_in_0_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_user_amba_prot_bufferable = auto_in_0_a_bits_user_amba_prot_bufferable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_user_amba_prot_modifiable = auto_in_0_a_bits_user_amba_prot_modifiable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_user_amba_prot_readalloc = auto_in_0_a_bits_user_amba_prot_readalloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_user_amba_prot_writealloc = auto_in_0_a_bits_user_amba_prot_writealloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_user_amba_prot_privileged = auto_in_0_a_bits_user_amba_prot_privileged; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_user_amba_prot_secure = auto_in_0_a_bits_user_amba_prot_secure; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_user_amba_prot_fetch = auto_in_0_a_bits_user_amba_prot_fetch; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_mask = auto_in_0_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_data = auto_in_0_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_a_bits_corrupt = auto_in_0_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_out_0_d_ready = auto_in_0_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_0_a_ready & (a_notFIFO | ~stall); // @[FIFOFixer.scala 88:33]
  assign monitor_io_in_a_valid = auto_in_0_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_0_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_0_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_0_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_0_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_0_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_0_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = auto_out_0_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_opcode = auto_out_0_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_param = auto_out_0_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_size = auto_out_0_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_source = auto_out_0_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_sink = auto_out_0_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_denied = auto_out_0_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_io_in_d_bits_corrupt = auto_out_0_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_clock = clock;
  assign monitor_1_reset = reset;
  assign monitor_1_io_in_a_ready = auto_out_1_a_ready; // @[FIFOFixer.scala 88:33]
  assign monitor_1_io_in_a_valid = auto_in_1_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_param = auto_in_1_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_size = auto_in_1_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_source = auto_in_1_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_address = auto_in_1_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_b_ready = auto_in_1_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_b_valid = auto_out_1_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_b_bits_param = auto_out_1_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_b_bits_address = auto_out_1_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_c_ready = auto_out_1_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_c_valid = auto_in_1_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_opcode = auto_in_1_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_param = auto_in_1_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_size = auto_in_1_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_source = auto_in_1_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_address = auto_in_1_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_c_bits_corrupt = auto_in_1_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_d_ready = auto_in_1_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_d_valid = auto_out_1_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_opcode = auto_out_1_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_param = auto_out_1_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_size = auto_out_1_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_source = auto_out_1_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_sink = auto_out_1_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_denied = auto_out_1_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_d_bits_corrupt = auto_out_1_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign monitor_1_io_in_e_valid = auto_in_1_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_1_io_in_e_bits_sink = auto_in_1_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
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
      flight__0 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h0 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__0 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__0 <= _GEN_18;
      end
    end else begin
      flight__0 <= _GEN_18;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__1 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h1 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__1 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__1 <= _GEN_19;
      end
    end else begin
      flight__1 <= _GEN_19;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__2 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h2 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__2 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__2 <= _GEN_20;
      end
    end else begin
      flight__2 <= _GEN_20;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__3 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h3 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__3 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__3 <= _GEN_21;
      end
    end else begin
      flight__3 <= _GEN_21;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__4 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h4 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__4 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__4 <= _GEN_22;
      end
    end else begin
      flight__4 <= _GEN_22;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__5 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h5 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__5 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__5 <= _GEN_23;
      end
    end else begin
      flight__5 <= _GEN_23;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__6 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h6 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__6 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__6 <= _GEN_24;
      end
    end else begin
      flight__6 <= _GEN_24;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__7 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h7 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__7 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__7 <= _GEN_25;
      end
    end else begin
      flight__7 <= _GEN_25;
    end
    if (_stalls_id_T_3) begin // @[Reg.scala 17:18]
      stalls_id <= a_id; // @[Reg.scala 17:22]
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__8 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h8 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__8 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__8 <= _GEN_26;
      end
    end else begin
      flight__8 <= _GEN_26;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__9 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'h9 == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__9 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__9 <= _GEN_27;
      end
    end else begin
      flight__9 <= _GEN_27;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__10 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'ha == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__10 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__10 <= _GEN_28;
      end
    end else begin
      flight__10 <= _GEN_28;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__11 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'hb == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__11 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__11 <= _GEN_29;
      end
    end else begin
      flight__11 <= _GEN_29;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__12 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'hc == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__12 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__12 <= _GEN_30;
      end
    end else begin
      flight__12 <= _GEN_30;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__13 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'hd == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__13 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__13 <= _GEN_31;
      end
    end else begin
      flight__13 <= _GEN_31;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__14 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'he == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__14 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__14 <= _GEN_32;
      end
    end else begin
      flight__14 <= _GEN_32;
    end
    if (reset) begin // @[FIFOFixer.scala 71:27]
      flight__15 <= 1'h0; // @[FIFOFixer.scala 71:27]
    end else if (d_first & _d_first_T) begin // @[FIFOFixer.scala 73:37]
      if (4'hf == auto_out_0_d_bits_source) begin // @[FIFOFixer.scala 73:64]
        flight__15 <= 1'h0; // @[FIFOFixer.scala 73:64]
      end else begin
        flight__15 <= _GEN_33;
      end
    end else begin
      flight__15 <= _GEN_33;
    end
    if (_stalls_id_T_7) begin // @[Reg.scala 17:18]
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
  flight__0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  flight__1 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  flight__2 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  flight__3 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  flight__4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  flight__5 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  flight__6 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  flight__7 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  stalls_id = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  flight__8 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  flight__9 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  flight__10 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  flight__11 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  flight__12 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  flight__13 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  flight__14 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  flight__15 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  stalls_id_1 = _RAND_18[1:0];
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
