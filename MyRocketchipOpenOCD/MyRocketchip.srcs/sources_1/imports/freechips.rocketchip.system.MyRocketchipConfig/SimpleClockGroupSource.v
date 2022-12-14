module SimpleClockGroupSource(
  input   clock,
  input   reset,
  output  auto_out_member_subsystem_sbus_5_clock,
  output  auto_out_member_subsystem_sbus_5_reset,
  output  auto_out_member_subsystem_sbus_4_clock,
  output  auto_out_member_subsystem_sbus_4_reset,
  output  auto_out_member_subsystem_sbus_3_clock,
  output  auto_out_member_subsystem_sbus_3_reset,
  output  auto_out_member_subsystem_sbus_2_clock,
  output  auto_out_member_subsystem_sbus_2_reset,
  output  auto_out_member_subsystem_sbus_1_clock,
  output  auto_out_member_subsystem_sbus_1_reset,
  output  auto_out_member_subsystem_sbus_0_clock,
  output  auto_out_member_subsystem_sbus_0_reset
);
  assign auto_out_member_subsystem_sbus_5_clock = clock; // @[Nodes.scala 1207:84 ClockGroup.scala 72:17]
  assign auto_out_member_subsystem_sbus_5_reset = reset; // @[Nodes.scala 1207:84 ClockGroup.scala 72:35]
  assign auto_out_member_subsystem_sbus_4_clock = clock; // @[Nodes.scala 1207:84 ClockGroup.scala 72:17]
  assign auto_out_member_subsystem_sbus_4_reset = reset; // @[Nodes.scala 1207:84 ClockGroup.scala 72:35]
  assign auto_out_member_subsystem_sbus_3_clock = clock; // @[Nodes.scala 1207:84 ClockGroup.scala 72:17]
  assign auto_out_member_subsystem_sbus_3_reset = reset; // @[Nodes.scala 1207:84 ClockGroup.scala 72:35]
  assign auto_out_member_subsystem_sbus_2_clock = clock; // @[Nodes.scala 1207:84 ClockGroup.scala 72:17]
  assign auto_out_member_subsystem_sbus_2_reset = reset; // @[Nodes.scala 1207:84 ClockGroup.scala 72:35]
  assign auto_out_member_subsystem_sbus_1_clock = clock; // @[Nodes.scala 1207:84 ClockGroup.scala 72:17]
  assign auto_out_member_subsystem_sbus_1_reset = reset; // @[Nodes.scala 1207:84 ClockGroup.scala 72:35]
  assign auto_out_member_subsystem_sbus_0_clock = clock; // @[Nodes.scala 1207:84 ClockGroup.scala 72:17]
  assign auto_out_member_subsystem_sbus_0_reset = reset; // @[Nodes.scala 1207:84 ClockGroup.scala 72:35]
endmodule
