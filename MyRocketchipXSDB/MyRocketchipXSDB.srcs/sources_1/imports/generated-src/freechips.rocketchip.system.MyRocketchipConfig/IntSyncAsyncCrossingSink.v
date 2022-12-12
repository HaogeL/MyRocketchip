module IntSyncAsyncCrossingSink(
  input   clock,
  input   auto_in_sync_0,
  input   auto_in_sync_1,
  input   auto_in_sync_2,
  input   auto_in_sync_3,
  input   auto_in_sync_4,
  input   auto_in_sync_5,
  input   auto_in_sync_6,
  output  auto_out_0,
  output  auto_out_1,
  output  auto_out_2,
  output  auto_out_3,
  output  auto_out_4,
  output  auto_out_5,
  output  auto_out_6
);
  wire  chain_clock; // @[ShiftReg.scala 45:23]
  wire [6:0] chain_io_d; // @[ShiftReg.scala 45:23]
  wire [6:0] chain_io_q; // @[ShiftReg.scala 45:23]
  wire [2:0] chain_io_d_lo = {auto_in_sync_2,auto_in_sync_1,auto_in_sync_0}; // @[ShiftReg.scala 47:22]
  wire [3:0] chain_io_d_hi = {auto_in_sync_6,auto_in_sync_5,auto_in_sync_4,auto_in_sync_3}; // @[ShiftReg.scala 47:22]
  wire [6:0] _WIRE_1 = chain_io_q;
  SynchronizerShiftReg_w7_d3 chain ( // @[ShiftReg.scala 45:23]
    .clock(chain_clock),
    .io_d(chain_io_d),
    .io_q(chain_io_q)
  );
  assign auto_out_0 = _WIRE_1[0]; // @[ShiftReg.scala 48:24]
  assign auto_out_1 = _WIRE_1[1]; // @[ShiftReg.scala 48:24]
  assign auto_out_2 = _WIRE_1[2]; // @[ShiftReg.scala 48:24]
  assign auto_out_3 = _WIRE_1[3]; // @[ShiftReg.scala 48:24]
  assign auto_out_4 = _WIRE_1[4]; // @[ShiftReg.scala 48:24]
  assign auto_out_5 = _WIRE_1[5]; // @[ShiftReg.scala 48:24]
  assign auto_out_6 = _WIRE_1[6]; // @[ShiftReg.scala 48:24]
  assign chain_clock = clock;
  assign chain_io_d = {chain_io_d_hi,chain_io_d_lo}; // @[ShiftReg.scala 47:22]
endmodule
