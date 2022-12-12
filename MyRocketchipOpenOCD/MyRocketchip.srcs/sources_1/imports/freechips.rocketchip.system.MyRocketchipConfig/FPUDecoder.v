module FPUDecoder(
  input  [31:0] io_inst,
  output        io_sigs_wen,
  output        io_sigs_ren1,
  output        io_sigs_ren2,
  output        io_sigs_ren3,
  output        io_sigs_swap12,
  output        io_sigs_swap23,
  output [1:0]  io_sigs_typeTagIn,
  output [1:0]  io_sigs_typeTagOut,
  output        io_sigs_fromint,
  output        io_sigs_toint,
  output        io_sigs_fastpipe,
  output        io_sigs_fma,
  output        io_sigs_div,
  output        io_sigs_sqrt,
  output        io_sigs_wflags
);
  wire [31:0] decoder_decoded_invInputs = ~io_inst; // @[pla.scala 78:21]
  wire  decoder_decoded_andMatrixInput_0 = io_inst[0]; // @[pla.scala 90:45]
  wire  decoder_decoded_andMatrixInput_1 = io_inst[1]; // @[pla.scala 90:45]
  wire  decoder_decoded_andMatrixInput_2 = decoder_decoded_invInputs[4]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_3 = decoder_decoded_invInputs[5]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_4 = io_inst[6]; // @[pla.scala 90:45]
  wire [4:0] _decoder_decoded_T = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2,decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_1 = &_decoder_decoded_T; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_2_1 = decoder_decoded_invInputs[2]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_3_1 = decoder_decoded_invInputs[3]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_4_1 = io_inst[4]; // @[pla.scala 90:45]
  wire  decoder_decoded_andMatrixInput_7 = decoder_decoded_invInputs[26]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_8 = decoder_decoded_invInputs[29]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_9 = decoder_decoded_invInputs[30]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_10 = decoder_decoded_invInputs[31]; // @[pla.scala 91:29]
  wire [4:0] decoder_decoded_lo_1 = {decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_9,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [10:0] _decoder_decoded_T_2 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_lo_1}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_3 = &_decoder_decoded_T_2; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_8_1 = decoder_decoded_invInputs[27]; // @[pla.scala 91:29]
  wire [5:0] decoder_decoded_lo_2 = {decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_9,
    decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoder_decoded_T_4 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_lo_2}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_5 = &_decoder_decoded_T_4; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_8_2 = decoder_decoded_invInputs[28]; // @[pla.scala 91:29]
  wire [5:0] decoder_decoded_lo_3 = {decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_9,
    decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoder_decoded_T_6 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_lo_3}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_7 = &_decoder_decoded_T_6; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_2_4 = io_inst[2]; // @[pla.scala 90:45]
  wire  decoder_decoded_andMatrixInput_5_3 = decoder_decoded_invInputs[6]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_6_3 = io_inst[13]; // @[pla.scala 90:45]
  wire  decoder_decoded_andMatrixInput_7_3 = decoder_decoded_invInputs[14]; // @[pla.scala 91:29]
  wire [7:0] _decoder_decoded_T_8 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_4,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_2,
    decoder_decoded_andMatrixInput_5_3,decoder_decoded_andMatrixInput_6_3,decoder_decoded_andMatrixInput_7_3}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_9 = &_decoder_decoded_T_8; // @[pla.scala 98:74]
  wire [8:0] _decoder_decoded_T_10 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_4,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_2,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_5_3,decoder_decoded_andMatrixInput_6_3,
    decoder_decoded_andMatrixInput_7_3}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_11 = &_decoder_decoded_T_10; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_5_5 = io_inst[5]; // @[pla.scala 90:45]
  wire [8:0] _decoder_decoded_T_12 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_4,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_2,
    decoder_decoded_andMatrixInput_5_5,decoder_decoded_andMatrixInput_5_3,decoder_decoded_andMatrixInput_6_3,
    decoder_decoded_andMatrixInput_7_3}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_13 = &_decoder_decoded_T_12; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_7_6 = io_inst[12]; // @[pla.scala 90:45]
  wire [9:0] _decoder_decoded_T_14 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_4,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_2,
    decoder_decoded_andMatrixInput_5_5,decoder_decoded_andMatrixInput_5_3,decoder_decoded_andMatrixInput_7_6,
    decoder_decoded_andMatrixInput_6_3,decoder_decoded_andMatrixInput_7_3}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_15 = &_decoder_decoded_T_14; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_5_7 = io_inst[25]; // @[pla.scala 90:45]
  wire [6:0] _decoder_decoded_T_16 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2,decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,
    decoder_decoded_andMatrixInput_5_7,decoder_decoded_andMatrixInput_7}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_17 = &_decoder_decoded_T_16; // @[pla.scala 98:74]
  wire [5:0] decoder_decoded_lo_9 = {decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_5_7,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_9,
    decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [11:0] _decoder_decoded_T_18 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_lo_9}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_19 = &_decoder_decoded_T_18; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_8_7 = io_inst[27]; // @[pla.scala 90:45]
  wire  decoder_decoded_andMatrixInput_9_5 = io_inst[28]; // @[pla.scala 90:45]
  wire [5:0] decoder_decoded_lo_10 = {decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_7,
    decoder_decoded_andMatrixInput_9_5,decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_9,
    decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [12:0] _decoder_decoded_T_20 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_lo_10}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_21 = &_decoder_decoded_T_20; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_7_9 = decoder_decoded_invInputs[12]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_12_1 = io_inst[29]; // @[pla.scala 90:45]
  wire [6:0] decoder_decoded_lo_11 = {decoder_decoded_andMatrixInput_7_9,decoder_decoded_andMatrixInput_7_3,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,
    decoder_decoded_andMatrixInput_12_1,decoder_decoded_andMatrixInput_9}; // @[Cat.scala 31:58]
  wire [13:0] _decoder_decoded_T_22 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_lo_11}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_23 = &_decoder_decoded_T_22; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_7_10 = decoder_decoded_invInputs[13]; // @[pla.scala 91:29]
  wire [6:0] decoder_decoded_lo_12 = {decoder_decoded_andMatrixInput_7_10,decoder_decoded_andMatrixInput_7_3,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,
    decoder_decoded_andMatrixInput_12_1,decoder_decoded_andMatrixInput_9}; // @[Cat.scala 31:58]
  wire [13:0] _decoder_decoded_T_24 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_lo_12}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_25 = &_decoder_decoded_T_24; // @[pla.scala 98:74]
  wire [6:0] decoder_decoded_lo_13 = {decoder_decoded_andMatrixInput_7_10,decoder_decoded_andMatrixInput_7_3,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_9,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [13:0] _decoder_decoded_T_26 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_lo_13}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_27 = &_decoder_decoded_T_26; // @[pla.scala 98:74]
  wire [6:0] decoder_decoded_lo_14 = {decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_9,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [14:0] _decoder_decoded_T_28 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_9,
    decoder_decoded_lo_14}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_29 = &_decoder_decoded_T_28; // @[pla.scala 98:74]
  wire [6:0] decoder_decoded_lo_15 = {decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_5_7,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,
    decoder_decoded_andMatrixInput_12_1,decoder_decoded_andMatrixInput_9}; // @[Cat.scala 31:58]
  wire [14:0] _decoder_decoded_T_30 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_9,
    decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_31 = &_decoder_decoded_T_30; // @[pla.scala 98:74]
  wire [14:0] _decoder_decoded_T_32 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_10,
    decoder_decoded_lo_15}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_33 = &_decoder_decoded_T_32; // @[pla.scala 98:74]
  wire [6:0] decoder_decoded_lo_17 = {decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_5_7,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_9,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [14:0] _decoder_decoded_T_34 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_10,
    decoder_decoded_lo_17}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_35 = &_decoder_decoded_T_34; // @[pla.scala 98:74]
  wire [6:0] decoder_decoded_lo_18 = {decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_7,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_9,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [14:0] _decoder_decoded_T_36 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_10,
    decoder_decoded_lo_18}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_37 = &_decoder_decoded_T_36; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_7_17 = io_inst[20]; // @[pla.scala 90:45]
  wire  decoder_decoded_andMatrixInput_8_16 = decoder_decoded_invInputs[21]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_9_14 = decoder_decoded_invInputs[22]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_10_13 = decoder_decoded_invInputs[23]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_11_12 = decoder_decoded_invInputs[24]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_12_9 = decoder_decoded_invInputs[25]; // @[pla.scala 91:29]
  wire  decoder_decoded_andMatrixInput_17 = io_inst[30]; // @[pla.scala 90:45]
  wire [8:0] decoder_decoded_lo_19 = {decoder_decoded_andMatrixInput_9_14,decoder_decoded_andMatrixInput_10_13,
    decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_12_9,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_8,
    decoder_decoded_andMatrixInput_17}; // @[Cat.scala 31:58]
  wire [17:0] _decoder_decoded_T_38 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_17,
    decoder_decoded_andMatrixInput_8_16,decoder_decoded_lo_19}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_39 = &_decoder_decoded_T_38; // @[pla.scala 98:74]
  wire [9:0] decoder_decoded_hi_20 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_17,
    decoder_decoded_andMatrixInput_8_16,decoder_decoded_andMatrixInput_9_14}; // @[Cat.scala 31:58]
  wire [18:0] _decoder_decoded_T_40 = {decoder_decoded_hi_20,decoder_decoded_andMatrixInput_10_13,
    decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_12_9,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_8,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_41 = &_decoder_decoded_T_40; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_7_19 = decoder_decoded_invInputs[20]; // @[pla.scala 91:29]
  wire [8:0] decoder_decoded_lo_21 = {decoder_decoded_andMatrixInput_9_14,decoder_decoded_andMatrixInput_10_13,
    decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_5_7,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_8,
    decoder_decoded_andMatrixInput_17}; // @[Cat.scala 31:58]
  wire [17:0] _decoder_decoded_T_42 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_19,
    decoder_decoded_andMatrixInput_8_16,decoder_decoded_lo_21}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_43 = &_decoder_decoded_T_42; // @[pla.scala 98:74]
  wire [9:0] decoder_decoded_hi_22 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_19,
    decoder_decoded_andMatrixInput_8_16,decoder_decoded_andMatrixInput_9_14}; // @[Cat.scala 31:58]
  wire [18:0] _decoder_decoded_T_44 = {decoder_decoded_hi_22,decoder_decoded_andMatrixInput_10_13,
    decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_5_7,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_8,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_45 = &_decoder_decoded_T_44; // @[pla.scala 98:74]
  wire [8:0] decoder_decoded_lo_23 = {decoder_decoded_andMatrixInput_9_14,decoder_decoded_andMatrixInput_10_13,
    decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_7,
    decoder_decoded_andMatrixInput_9_5,decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_17,
    decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire [17:0] _decoder_decoded_T_46 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_19,
    decoder_decoded_andMatrixInput_8_16,decoder_decoded_lo_23}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_47 = &_decoder_decoded_T_46; // @[pla.scala 98:74]
  wire [18:0] _decoder_decoded_T_48 = {decoder_decoded_hi_22,decoder_decoded_andMatrixInput_10_13,
    decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_5_7,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_7,decoder_decoded_andMatrixInput_9_5,decoder_decoded_andMatrixInput_8,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_10}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_49 = &_decoder_decoded_T_48; // @[pla.scala 98:74]
  wire  decoder_decoded_andMatrixInput_14_11 = io_inst[31]; // @[pla.scala 90:45]
  wire [6:0] decoder_decoded_lo_25 = {decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_9,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [14:0] _decoder_decoded_T_50 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_9,
    decoder_decoded_lo_25}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_51 = &_decoder_decoded_T_50; // @[pla.scala 98:74]
  wire [14:0] _decoder_decoded_T_52 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_10,
    decoder_decoded_lo_25}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_53 = &_decoder_decoded_T_52; // @[pla.scala 98:74]
  wire [6:0] decoder_decoded_lo_27 = {decoder_decoded_andMatrixInput_10_13,decoder_decoded_andMatrixInput_11_12,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [14:0] _decoder_decoded_T_54 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_lo_27}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_55 = &_decoder_decoded_T_54; // @[pla.scala 98:74]
  wire [7:0] decoder_decoded_lo_28 = {decoder_decoded_andMatrixInput_10_13,decoder_decoded_andMatrixInput_11_12,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,
    decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [15:0] _decoder_decoded_T_56 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_lo_28}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_57 = &_decoder_decoded_T_56; // @[pla.scala 98:74]
  wire [7:0] decoder_decoded_lo_29 = {decoder_decoded_andMatrixInput_10_13,decoder_decoded_andMatrixInput_11_12,
    decoder_decoded_andMatrixInput_5_7,decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,
    decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [15:0] _decoder_decoded_T_58 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_lo_29}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_59 = &_decoder_decoded_T_58; // @[pla.scala 98:74]
  wire [7:0] decoder_decoded_lo_30 = {decoder_decoded_andMatrixInput_10_13,decoder_decoded_andMatrixInput_11_12,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_9_5,
    decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [15:0] _decoder_decoded_T_60 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_lo_30}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_61 = &_decoder_decoded_T_60; // @[pla.scala 98:74]
  wire [7:0] decoder_decoded_lo_31 = {decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_5_7,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_9_5,
    decoder_decoded_andMatrixInput_8,decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [16:0] _decoder_decoded_T_62 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_andMatrixInput_10_13,decoder_decoded_lo_31}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_63 = &_decoder_decoded_T_62; // @[pla.scala 98:74]
  wire [9:0] decoder_decoded_lo_32 = {decoder_decoded_andMatrixInput_8_16,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_andMatrixInput_10_13,decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [9:0] decoder_decoded_hi_32 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_10,
    decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_7_19}; // @[Cat.scala 31:58]
  wire [19:0] _decoder_decoded_T_64 = {decoder_decoded_hi_32,decoder_decoded_lo_32}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_65 = &_decoder_decoded_T_64; // @[pla.scala 98:74]
  wire [4:0] decoder_decoded_hi_lo_32 = {decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_9,
    decoder_decoded_andMatrixInput_7_10,decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_7_19}; // @[Cat.scala 31:58]
  wire [20:0] _decoder_decoded_T_66 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_hi_lo_32,decoder_decoded_lo_32}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_67 = &_decoder_decoded_T_66; // @[pla.scala 98:74]
  wire [9:0] decoder_decoded_lo_34 = {decoder_decoded_andMatrixInput_8_16,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_andMatrixInput_10_13,decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_5_7,
    decoder_decoded_andMatrixInput_7,decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [20:0] _decoder_decoded_T_68 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_hi_lo_32,decoder_decoded_lo_34}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_69 = &_decoder_decoded_T_68; // @[pla.scala 98:74]
  wire [9:0] decoder_decoded_lo_35 = {decoder_decoded_andMatrixInput_9_14,decoder_decoded_andMatrixInput_10_13,
    decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_5_7,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_8_2,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [4:0] decoder_decoded_hi_lo_34 = {decoder_decoded_andMatrixInput_4,decoder_decoded_andMatrixInput_7_10,
    decoder_decoded_andMatrixInput_7_3,decoder_decoded_andMatrixInput_7_19,decoder_decoded_andMatrixInput_8_16}; // @[Cat.scala 31:58]
  wire [20:0] _decoder_decoded_T_70 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_hi_lo_34,decoder_decoded_lo_35}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_71 = &_decoder_decoded_T_70; // @[pla.scala 98:74]
  wire [9:0] decoder_decoded_lo_36 = {decoder_decoded_andMatrixInput_8_16,decoder_decoded_andMatrixInput_9_14,
    decoder_decoded_andMatrixInput_10_13,decoder_decoded_andMatrixInput_11_12,decoder_decoded_andMatrixInput_7,
    decoder_decoded_andMatrixInput_8_1,decoder_decoded_andMatrixInput_9_5,decoder_decoded_andMatrixInput_12_1,
    decoder_decoded_andMatrixInput_17,decoder_decoded_andMatrixInput_14_11}; // @[Cat.scala 31:58]
  wire [20:0] _decoder_decoded_T_72 = {decoder_decoded_andMatrixInput_0,decoder_decoded_andMatrixInput_1,
    decoder_decoded_andMatrixInput_2_1,decoder_decoded_andMatrixInput_3_1,decoder_decoded_andMatrixInput_4_1,
    decoder_decoded_andMatrixInput_3,decoder_decoded_hi_lo_32,decoder_decoded_lo_36}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_T_73 = &_decoder_decoded_T_72; // @[pla.scala 98:74]
  wire [8:0] _decoder_decoded_orMatrixOutputs_T = {_decoder_decoded_T_1,_decoder_decoded_T_3,_decoder_decoded_T_37,
    _decoder_decoded_T_39,_decoder_decoded_T_43,_decoder_decoded_T_47,_decoder_decoded_T_51,_decoder_decoded_T_53,
    _decoder_decoded_T_55}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_1 = |_decoder_decoded_orMatrixOutputs_T; // @[pla.scala 114:39]
  wire  _decoder_decoded_orMatrixOutputs_T_2 = |_decoder_decoded_T_47; // @[pla.scala 114:39]
  wire  _decoder_decoded_orMatrixOutputs_T_3 = |_decoder_decoded_T_21; // @[pla.scala 114:39]
  wire [2:0] _decoder_decoded_orMatrixOutputs_T_4 = {_decoder_decoded_T_1,_decoder_decoded_T_5,_decoder_decoded_T_7}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_5 = |_decoder_decoded_orMatrixOutputs_T_4; // @[pla.scala 114:39]
  wire [3:0] _decoder_decoded_orMatrixOutputs_T_6 = {_decoder_decoded_T_27,_decoder_decoded_T_29,_decoder_decoded_T_41,
    _decoder_decoded_T_45}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_7 = |_decoder_decoded_orMatrixOutputs_T_6; // @[pla.scala 114:39]
  wire [4:0] _decoder_decoded_orMatrixOutputs_T_8 = {_decoder_decoded_T_13,_decoder_decoded_T_51,_decoder_decoded_T_53,
    _decoder_decoded_T_57,_decoder_decoded_T_65}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_9 = |_decoder_decoded_orMatrixOutputs_T_8; // @[pla.scala 114:39]
  wire [1:0] _decoder_decoded_orMatrixOutputs_T_10 = {_decoder_decoded_T_61,_decoder_decoded_T_73}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_11 = |_decoder_decoded_orMatrixOutputs_T_10; // @[pla.scala 114:39]
  wire [4:0] decoder_decoded_orMatrixOutputs_lo_3 = {_decoder_decoded_T_45,_decoder_decoded_T_49,_decoder_decoded_T_63,
    _decoder_decoded_T_71,_decoder_decoded_T_73}; // @[Cat.scala 31:58]
  wire [10:0] _decoder_decoded_orMatrixOutputs_T_12 = {_decoder_decoded_T_15,_decoder_decoded_T_17,_decoder_decoded_T_19
    ,_decoder_decoded_T_31,_decoder_decoded_T_33,_decoder_decoded_T_35,decoder_decoded_orMatrixOutputs_lo_3}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_13 = |_decoder_decoded_orMatrixOutputs_T_12; // @[pla.scala 114:39]
  wire [5:0] decoder_decoded_orMatrixOutputs_lo_4 = {_decoder_decoded_T_41,_decoder_decoded_T_49,_decoder_decoded_T_59,
    _decoder_decoded_T_67,_decoder_decoded_T_69,_decoder_decoded_T_71}; // @[Cat.scala 31:58]
  wire [11:0] _decoder_decoded_orMatrixOutputs_T_14 = {_decoder_decoded_T_13,_decoder_decoded_T_17,_decoder_decoded_T_19
    ,_decoder_decoded_T_31,_decoder_decoded_T_33,_decoder_decoded_T_35,decoder_decoded_orMatrixOutputs_lo_4}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_15 = |_decoder_decoded_orMatrixOutputs_T_14; // @[pla.scala 114:39]
  wire  _decoder_decoded_orMatrixOutputs_T_16 = |_decoder_decoded_T_7; // @[pla.scala 114:39]
  wire  _decoder_decoded_orMatrixOutputs_T_17 = |_decoder_decoded_T_13; // @[pla.scala 114:39]
  wire  _decoder_decoded_orMatrixOutputs_T_18 = |_decoder_decoded_T_1; // @[pla.scala 114:39]
  wire [5:0] _decoder_decoded_orMatrixOutputs_T_19 = {_decoder_decoded_T_1,_decoder_decoded_T_3,_decoder_decoded_T_13,
    _decoder_decoded_T_23,_decoder_decoded_T_25,_decoder_decoded_T_27}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_20 = |_decoder_decoded_orMatrixOutputs_T_19; // @[pla.scala 114:39]
  wire [9:0] _decoder_decoded_orMatrixOutputs_T_21 = {_decoder_decoded_T_1,_decoder_decoded_T_3,_decoder_decoded_T_23,
    _decoder_decoded_T_25,_decoder_decoded_T_27,_decoder_decoded_T_39,_decoder_decoded_T_43,_decoder_decoded_T_47,
    _decoder_decoded_T_57,_decoder_decoded_T_65}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_22 = |_decoder_decoded_orMatrixOutputs_T_21; // @[pla.scala 114:39]
  wire [9:0] _decoder_decoded_orMatrixOutputs_T_23 = {_decoder_decoded_T_1,_decoder_decoded_T_3,_decoder_decoded_T_11,
    _decoder_decoded_T_27,_decoder_decoded_T_29,_decoder_decoded_T_41,_decoder_decoded_T_45,_decoder_decoded_T_47,
    _decoder_decoded_T_61,_decoder_decoded_T_73}; // @[Cat.scala 31:58]
  wire  _decoder_decoded_orMatrixOutputs_T_24 = |_decoder_decoded_orMatrixOutputs_T_23; // @[pla.scala 114:39]
  wire  _decoder_decoded_orMatrixOutputs_T_25 = |_decoder_decoded_T_9; // @[pla.scala 114:39]
  wire [8:0] decoder_decoded_orMatrixOutputs_lo_8 = {1'h0,_decoder_decoded_orMatrixOutputs_T_13,
    _decoder_decoded_orMatrixOutputs_T_11,_decoder_decoded_orMatrixOutputs_T_9,_decoder_decoded_orMatrixOutputs_T_7,
    _decoder_decoded_orMatrixOutputs_T_5,_decoder_decoded_orMatrixOutputs_T_3,_decoder_decoded_orMatrixOutputs_T_2,
    _decoder_decoded_orMatrixOutputs_T_1}; // @[Cat.scala 31:58]
  wire [17:0] decoder_decoded_orMatrixOutputs = {_decoder_decoded_orMatrixOutputs_T_25,
    _decoder_decoded_orMatrixOutputs_T_24,_decoder_decoded_orMatrixOutputs_T_22,_decoder_decoded_orMatrixOutputs_T_20,
    _decoder_decoded_orMatrixOutputs_T_18,_decoder_decoded_orMatrixOutputs_T_17,_decoder_decoded_orMatrixOutputs_T_16,1'h0
    ,_decoder_decoded_orMatrixOutputs_T_15,decoder_decoded_orMatrixOutputs_lo_8}; // @[Cat.scala 31:58]
  wire [8:0] decoder_decoded_invMatrixOutputs_lo = {decoder_decoded_orMatrixOutputs[8],decoder_decoded_orMatrixOutputs[7
    ],decoder_decoded_orMatrixOutputs[6],decoder_decoded_orMatrixOutputs[5],decoder_decoded_orMatrixOutputs[4],
    decoder_decoded_orMatrixOutputs[3],decoder_decoded_orMatrixOutputs[2],decoder_decoded_orMatrixOutputs[1],
    decoder_decoded_orMatrixOutputs[0]}; // @[Cat.scala 31:58]
  wire [17:0] decoder_decoded_invMatrixOutputs = {decoder_decoded_orMatrixOutputs[17],decoder_decoded_orMatrixOutputs[16
    ],decoder_decoded_orMatrixOutputs[15],decoder_decoded_orMatrixOutputs[14],decoder_decoded_orMatrixOutputs[13],
    decoder_decoded_orMatrixOutputs[12],decoder_decoded_orMatrixOutputs[11],decoder_decoded_orMatrixOutputs[10],
    decoder_decoded_orMatrixOutputs[9],decoder_decoded_invMatrixOutputs_lo}; // @[Cat.scala 31:58]
  assign io_sigs_wen = decoder_decoded_invMatrixOutputs[16]; // @[Decode.scala 50:77]
  assign io_sigs_ren1 = decoder_decoded_invMatrixOutputs[15]; // @[Decode.scala 50:77]
  assign io_sigs_ren2 = decoder_decoded_invMatrixOutputs[14]; // @[Decode.scala 50:77]
  assign io_sigs_ren3 = decoder_decoded_invMatrixOutputs[13]; // @[Decode.scala 50:77]
  assign io_sigs_swap12 = decoder_decoded_invMatrixOutputs[12]; // @[Decode.scala 50:77]
  assign io_sigs_swap23 = decoder_decoded_invMatrixOutputs[11]; // @[Decode.scala 50:77]
  assign io_sigs_typeTagIn = decoder_decoded_invMatrixOutputs[10:9]; // @[Decode.scala 50:77]
  assign io_sigs_typeTagOut = decoder_decoded_invMatrixOutputs[8:7]; // @[Decode.scala 50:77]
  assign io_sigs_fromint = decoder_decoded_invMatrixOutputs[6]; // @[Decode.scala 50:77]
  assign io_sigs_toint = decoder_decoded_invMatrixOutputs[5]; // @[Decode.scala 50:77]
  assign io_sigs_fastpipe = decoder_decoded_invMatrixOutputs[4]; // @[Decode.scala 50:77]
  assign io_sigs_fma = decoder_decoded_invMatrixOutputs[3]; // @[Decode.scala 50:77]
  assign io_sigs_div = decoder_decoded_invMatrixOutputs[2]; // @[Decode.scala 50:77]
  assign io_sigs_sqrt = decoder_decoded_invMatrixOutputs[1]; // @[Decode.scala 50:77]
  assign io_sigs_wflags = decoder_decoded_invMatrixOutputs[0]; // @[Decode.scala 50:77]
endmodule
