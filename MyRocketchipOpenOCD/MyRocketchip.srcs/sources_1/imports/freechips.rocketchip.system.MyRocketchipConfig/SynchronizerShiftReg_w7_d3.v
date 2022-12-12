module SynchronizerShiftReg_w7_d3(
  input        clock,
  input  [6:0] io_d,
  output [6:0] io_q
);
  wire  output_chain_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_1_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_1_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_1_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_2_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_2_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_2_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_3_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_3_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_3_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_4_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_4_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_4_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_5_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_5_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_5_io_q; // @[ShiftReg.scala 45:23]
  wire  output_chain_6_clock; // @[ShiftReg.scala 45:23]
  wire  output_chain_6_io_d; // @[ShiftReg.scala 45:23]
  wire  output_chain_6_io_q; // @[ShiftReg.scala 45:23]
  wire  output_2 = output_chain_2_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire  output_1 = output_chain_1_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire  output_0 = output_chain_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire [2:0] io_q_lo = {output_2,output_1,output_0}; // @[Cat.scala 31:58]
  wire  output_4 = output_chain_4_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire  output_3 = output_chain_3_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire  output_6 = output_chain_6_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire  output_5 = output_chain_5_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire [3:0] io_q_hi = {output_6,output_5,output_4,output_3}; // @[Cat.scala 31:58]
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_clock),
    .io_d(output_chain_io_d),
    .io_q(output_chain_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_1 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_1_clock),
    .io_d(output_chain_1_io_d),
    .io_q(output_chain_1_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_2 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_2_clock),
    .io_d(output_chain_2_io_d),
    .io_q(output_chain_2_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_3 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_3_clock),
    .io_d(output_chain_3_io_d),
    .io_q(output_chain_3_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_4 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_4_clock),
    .io_d(output_chain_4_io_d),
    .io_q(output_chain_4_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_5 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_5_clock),
    .io_d(output_chain_5_io_d),
    .io_q(output_chain_5_io_q)
  );
  NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_6 ( // @[ShiftReg.scala 45:23]
    .clock(output_chain_6_clock),
    .io_d(output_chain_6_io_d),
    .io_q(output_chain_6_io_q)
  );
  assign io_q = {io_q_hi,io_q_lo}; // @[Cat.scala 31:58]
  assign output_chain_clock = clock;
  assign output_chain_io_d = io_d[0]; // @[SynchronizerReg.scala 173:39]
  assign output_chain_1_clock = clock;
  assign output_chain_1_io_d = io_d[1]; // @[SynchronizerReg.scala 173:39]
  assign output_chain_2_clock = clock;
  assign output_chain_2_io_d = io_d[2]; // @[SynchronizerReg.scala 173:39]
  assign output_chain_3_clock = clock;
  assign output_chain_3_io_d = io_d[3]; // @[SynchronizerReg.scala 173:39]
  assign output_chain_4_clock = clock;
  assign output_chain_4_io_d = io_d[4]; // @[SynchronizerReg.scala 173:39]
  assign output_chain_5_clock = clock;
  assign output_chain_5_io_d = io_d[5]; // @[SynchronizerReg.scala 173:39]
  assign output_chain_6_clock = clock;
  assign output_chain_6_io_d = io_d[6]; // @[SynchronizerReg.scala 173:39]
endmodule
