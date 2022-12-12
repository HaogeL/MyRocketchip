module ALU(
  input         io_dw,
  input  [3:0]  io_fn,
  input  [63:0] io_in2,
  input  [63:0] io_in1,
  output [63:0] io_out,
  output [63:0] io_adder_out,
  output        io_cmp_out
);
  wire [63:0] _in2_inv_T_1 = ~io_in2; // @[ALU.scala 62:35]
  wire [63:0] in2_inv = io_fn[3] ? _in2_inv_T_1 : io_in2; // @[ALU.scala 62:20]
  wire [63:0] in1_xor_in2 = io_in1 ^ in2_inv; // @[ALU.scala 63:28]
  wire [63:0] _io_adder_out_T_1 = io_in1 + in2_inv; // @[ALU.scala 64:26]
  wire [63:0] _GEN_1 = {{63'd0}, io_fn[3]}; // @[ALU.scala 64:36]
  wire  _slt_T_7 = io_fn[1] ? io_in2[63] : io_in1[63]; // @[ALU.scala 69:8]
  wire  slt = io_in1[63] == io_in2[63] ? io_adder_out[63] : _slt_T_7; // @[ALU.scala 68:8]
  wire  _io_cmp_out_T_2 = ~io_fn[3]; // @[ALU.scala 45:26]
  wire  _io_cmp_out_T_4 = _io_cmp_out_T_2 ? in1_xor_in2 == 64'h0 : slt; // @[ALU.scala 70:41]
  wire  _T_2 = io_fn[3] & io_in1[31]; // @[ALU.scala 77:46]
  wire [31:0] _T_4 = _T_2 ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [31:0] _T_7 = io_dw ? io_in1[63:32] : _T_4; // @[ALU.scala 78:24]
  wire  _T_10 = io_in2[5] & io_dw; // @[ALU.scala 79:33]
  wire [5:0] shamt = {_T_10,io_in2[4:0]}; // @[Cat.scala 31:58]
  wire [63:0] shin_r = {_T_7,io_in1[31:0]}; // @[Cat.scala 31:58]
  wire  _shin_T_2 = io_fn == 4'h5 | io_fn == 4'hb; // @[ALU.scala 82:35]
  wire [63:0] _GEN_2 = {{32'd0}, shin_r[63:32]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_6 = _GEN_2 & 64'hffffffff; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_8 = {shin_r[31:0], 32'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shin_T_10 = _shin_T_8 & 64'hffffffff00000000; // @[Bitwise.scala 105:80]
  wire [63:0] _shin_T_11 = _shin_T_6 | _shin_T_10; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_3 = {{16'd0}, _shin_T_11[63:16]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_16 = _GEN_3 & 64'hffff0000ffff; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_18 = {_shin_T_11[47:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shin_T_20 = _shin_T_18 & 64'hffff0000ffff0000; // @[Bitwise.scala 105:80]
  wire [63:0] _shin_T_21 = _shin_T_16 | _shin_T_20; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_4 = {{8'd0}, _shin_T_21[63:8]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_26 = _GEN_4 & 64'hff00ff00ff00ff; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_28 = {_shin_T_21[55:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shin_T_30 = _shin_T_28 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 105:80]
  wire [63:0] _shin_T_31 = _shin_T_26 | _shin_T_30; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_5 = {{4'd0}, _shin_T_31[63:4]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_36 = _GEN_5 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_38 = {_shin_T_31[59:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shin_T_40 = _shin_T_38 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 105:80]
  wire [63:0] _shin_T_41 = _shin_T_36 | _shin_T_40; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_6 = {{2'd0}, _shin_T_41[63:2]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_46 = _GEN_6 & 64'h3333333333333333; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_48 = {_shin_T_41[61:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shin_T_50 = _shin_T_48 & 64'hcccccccccccccccc; // @[Bitwise.scala 105:80]
  wire [63:0] _shin_T_51 = _shin_T_46 | _shin_T_50; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_7 = {{1'd0}, _shin_T_51[63:1]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_56 = _GEN_7 & 64'h5555555555555555; // @[Bitwise.scala 105:31]
  wire [63:0] _shin_T_58 = {_shin_T_51[62:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shin_T_60 = _shin_T_58 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 105:80]
  wire [63:0] _shin_T_61 = _shin_T_56 | _shin_T_60; // @[Bitwise.scala 105:39]
  wire [63:0] shin = io_fn == 4'h5 | io_fn == 4'hb ? shin_r : _shin_T_61; // @[ALU.scala 82:17]
  wire  _shout_r_T_2 = io_fn[3] & shin[63]; // @[ALU.scala 83:35]
  wire [64:0] _shout_r_T_4 = {_shout_r_T_2,shin}; // @[ALU.scala 83:57]
  wire [64:0] _shout_r_T_5 = $signed(_shout_r_T_4) >>> shamt; // @[ALU.scala 83:64]
  wire [63:0] shout_r = _shout_r_T_5[63:0]; // @[ALU.scala 83:73]
  wire [63:0] _GEN_8 = {{32'd0}, shout_r[63:32]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_3 = _GEN_8 & 64'hffffffff; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_5 = {shout_r[31:0], 32'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shout_l_T_7 = _shout_l_T_5 & 64'hffffffff00000000; // @[Bitwise.scala 105:80]
  wire [63:0] _shout_l_T_8 = _shout_l_T_3 | _shout_l_T_7; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_9 = {{16'd0}, _shout_l_T_8[63:16]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_13 = _GEN_9 & 64'hffff0000ffff; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_15 = {_shout_l_T_8[47:0], 16'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shout_l_T_17 = _shout_l_T_15 & 64'hffff0000ffff0000; // @[Bitwise.scala 105:80]
  wire [63:0] _shout_l_T_18 = _shout_l_T_13 | _shout_l_T_17; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_10 = {{8'd0}, _shout_l_T_18[63:8]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_23 = _GEN_10 & 64'hff00ff00ff00ff; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_25 = {_shout_l_T_18[55:0], 8'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shout_l_T_27 = _shout_l_T_25 & 64'hff00ff00ff00ff00; // @[Bitwise.scala 105:80]
  wire [63:0] _shout_l_T_28 = _shout_l_T_23 | _shout_l_T_27; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_11 = {{4'd0}, _shout_l_T_28[63:4]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_33 = _GEN_11 & 64'hf0f0f0f0f0f0f0f; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_35 = {_shout_l_T_28[59:0], 4'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shout_l_T_37 = _shout_l_T_35 & 64'hf0f0f0f0f0f0f0f0; // @[Bitwise.scala 105:80]
  wire [63:0] _shout_l_T_38 = _shout_l_T_33 | _shout_l_T_37; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_12 = {{2'd0}, _shout_l_T_38[63:2]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_43 = _GEN_12 & 64'h3333333333333333; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_45 = {_shout_l_T_38[61:0], 2'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shout_l_T_47 = _shout_l_T_45 & 64'hcccccccccccccccc; // @[Bitwise.scala 105:80]
  wire [63:0] _shout_l_T_48 = _shout_l_T_43 | _shout_l_T_47; // @[Bitwise.scala 105:39]
  wire [63:0] _GEN_13 = {{1'd0}, _shout_l_T_48[63:1]}; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_53 = _GEN_13 & 64'h5555555555555555; // @[Bitwise.scala 105:31]
  wire [63:0] _shout_l_T_55 = {_shout_l_T_48[62:0], 1'h0}; // @[Bitwise.scala 105:70]
  wire [63:0] _shout_l_T_57 = _shout_l_T_55 & 64'haaaaaaaaaaaaaaaa; // @[Bitwise.scala 105:80]
  wire [63:0] shout_l = _shout_l_T_53 | _shout_l_T_57; // @[Bitwise.scala 105:39]
  wire [63:0] _shout_T_3 = _shin_T_2 ? shout_r : 64'h0; // @[ALU.scala 85:18]
  wire [63:0] _shout_T_5 = io_fn == 4'h1 ? shout_l : 64'h0; // @[ALU.scala 86:18]
  wire [63:0] shout = _shout_T_3 | _shout_T_5; // @[ALU.scala 85:70]
  wire  _logic_T_1 = io_fn == 4'h6; // @[ALU.scala 89:45]
  wire [63:0] _logic_T_3 = io_fn == 4'h4 | io_fn == 4'h6 ? in1_xor_in2 : 64'h0; // @[ALU.scala 89:18]
  wire [63:0] _logic_T_7 = io_in1 & io_in2; // @[ALU.scala 90:63]
  wire [63:0] _logic_T_8 = _logic_T_1 | io_fn == 4'h7 ? _logic_T_7 : 64'h0; // @[ALU.scala 90:18]
  wire [63:0] logic_ = _logic_T_3 | _logic_T_8; // @[ALU.scala 89:74]
  wire  _shift_logic_T = io_fn >= 4'hc; // @[ALU.scala 42:30]
  wire  _shift_logic_T_1 = _shift_logic_T & slt; // @[ALU.scala 91:35]
  wire [63:0] _GEN_14 = {{63'd0}, _shift_logic_T_1}; // @[ALU.scala 91:43]
  wire [63:0] _shift_logic_T_2 = _GEN_14 | logic_; // @[ALU.scala 91:43]
  wire [63:0] shift_logic = _shift_logic_T_2 | shout; // @[ALU.scala 91:51]
  wire [63:0] out = io_fn == 4'h0 | io_fn == 4'ha ? io_adder_out : shift_logic; // @[ALU.scala 92:16]
  wire [31:0] _io_out_T_2 = out[31] ? 32'hffffffff : 32'h0; // @[Bitwise.scala 74:12]
  wire [63:0] _io_out_T_4 = {_io_out_T_2,out[31:0]}; // @[Cat.scala 31:58]
  assign io_out = ~io_dw ? _io_out_T_4 : out; // @[ALU.scala 94:10 97:{28,37}]
  assign io_adder_out = _io_adder_out_T_1 + _GEN_1; // @[ALU.scala 64:36]
  assign io_cmp_out = io_fn[0] ^ _io_cmp_out_T_4; // @[ALU.scala 70:36]
endmodule
