module PeripheryBus(
  input   auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock,
  input   auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset,
  output  clock,
  output  reset
);
  wire  subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_clock;
  wire  subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_reset;
  wire  subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_clock;
  wire  subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_reset;
  wire  clockGroup_auto_in_member_subsystem_pbus_0_clock;
  wire  clockGroup_auto_in_member_subsystem_pbus_0_reset;
  wire  clockGroup_auto_out_clock;
  wire  clockGroup_auto_out_reset;
  wire  fixedClockNode_auto_in_clock;
  wire  fixedClockNode_auto_in_reset;
  wire  fixedClockNode_auto_out_clock;
  wire  fixedClockNode_auto_out_reset;
  assign subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_clock =
    subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_reset =
    subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clockGroup_auto_out_clock = clockGroup_auto_in_member_subsystem_pbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clockGroup_auto_out_reset = clockGroup_auto_in_member_subsystem_pbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign fixedClockNode_auto_out_clock = fixedClockNode_auto_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign fixedClockNode_auto_out_reset = fixedClockNode_auto_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clock = fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign reset = fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_clock =
    auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_pbus_clock_groups_auto_in_member_subsystem_pbus_0_reset =
    auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_pbus_0_clock =
    subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_clock; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_pbus_0_reset =
    subsystem_pbus_clock_groups_auto_out_member_subsystem_pbus_0_reset; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
endmodule
