module IntSyncCrossingSource_8(
  input   clock,
  input   reset,
  input   auto_in_0,
  input   auto_in_1,
  input   auto_in_2,
  input   auto_in_3,
  input   auto_in_4,
  input   auto_in_5,
  input   auto_in_6,
  output  auto_out_sync_0,
  output  auto_out_sync_1,
  output  auto_out_sync_2,
  output  auto_out_sync_3,
  output  auto_out_sync_4,
  output  auto_out_sync_5,
  output  auto_out_sync_6
);
  wire  reg__clock; // @[AsyncResetReg.scala 89:21]
  wire  reg__reset; // @[AsyncResetReg.scala 89:21]
  wire [6:0] reg__io_d; // @[AsyncResetReg.scala 89:21]
  wire [6:0] reg__io_q; // @[AsyncResetReg.scala 89:21]
  wire [2:0] lo = {auto_in_2,auto_in_1,auto_in_0}; // @[Cat.scala 31:58]
  wire [3:0] hi = {auto_in_6,auto_in_5,auto_in_4,auto_in_3}; // @[Cat.scala 31:58]
  AsyncResetRegVec_w7_i0 reg_ ( // @[AsyncResetReg.scala 89:21]
    .clock(reg__clock),
    .reset(reg__reset),
    .io_d(reg__io_d),
    .io_q(reg__io_q)
  );
  assign auto_out_sync_0 = reg__io_q[0]; // @[Crossing.scala 41:52]
  assign auto_out_sync_1 = reg__io_q[1]; // @[Crossing.scala 41:52]
  assign auto_out_sync_2 = reg__io_q[2]; // @[Crossing.scala 41:52]
  assign auto_out_sync_3 = reg__io_q[3]; // @[Crossing.scala 41:52]
  assign auto_out_sync_4 = reg__io_q[4]; // @[Crossing.scala 41:52]
  assign auto_out_sync_5 = reg__io_q[5]; // @[Crossing.scala 41:52]
  assign auto_out_sync_6 = reg__io_q[6]; // @[Crossing.scala 41:52]
  assign reg__clock = clock;
  assign reg__reset = reset;
  assign reg__io_d = {hi,lo}; // @[Cat.scala 31:58]
endmodule
