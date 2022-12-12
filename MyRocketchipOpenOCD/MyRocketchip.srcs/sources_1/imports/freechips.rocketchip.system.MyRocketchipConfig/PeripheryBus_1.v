module PeripheryBus_1(
  input         auto_coupler_to_bootrom_fragmenter_out_a_ready,
  output        auto_coupler_to_bootrom_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_source,
  output [16:0] auto_coupler_to_bootrom_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_mask,
  output        auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_bootrom_fragmenter_out_d_ready,
  input         auto_coupler_to_bootrom_fragmenter_out_d_valid,
  input  [1:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_bootrom_fragmenter_out_d_bits_data,
  input         auto_coupler_to_debug_fragmenter_out_a_ready,
  output        auto_coupler_to_debug_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_debug_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_debug_fragmenter_out_a_bits_source,
  output [11:0] auto_coupler_to_debug_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_debug_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_debug_fragmenter_out_a_bits_data,
  output        auto_coupler_to_debug_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_debug_fragmenter_out_d_ready,
  input         auto_coupler_to_debug_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_debug_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_debug_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_debug_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_debug_fragmenter_out_d_bits_data,
  input         auto_coupler_to_clint_fragmenter_out_a_ready,
  output        auto_coupler_to_clint_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_clint_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_clint_fragmenter_out_a_bits_source,
  output [25:0] auto_coupler_to_clint_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_clint_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_clint_fragmenter_out_a_bits_data,
  output        auto_coupler_to_clint_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_clint_fragmenter_out_d_ready,
  input         auto_coupler_to_clint_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_clint_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_clint_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_clint_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_clint_fragmenter_out_d_bits_data,
  input         auto_coupler_to_plic_fragmenter_out_a_ready,
  output        auto_coupler_to_plic_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_opcode,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_plic_fragmenter_out_a_bits_size,
  output [8:0]  auto_coupler_to_plic_fragmenter_out_a_bits_source,
  output [27:0] auto_coupler_to_plic_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_plic_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_plic_fragmenter_out_a_bits_data,
  output        auto_coupler_to_plic_fragmenter_out_a_bits_corrupt,
  output        auto_coupler_to_plic_fragmenter_out_d_ready,
  input         auto_coupler_to_plic_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_plic_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_plic_fragmenter_out_d_bits_size,
  input  [8:0]  auto_coupler_to_plic_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_plic_fragmenter_out_d_bits_data,
  output        auto_fixedClockNode_out_2_clock,
  output        auto_fixedClockNode_out_2_reset,
  output        auto_fixedClockNode_out_0_clock,
  output        auto_fixedClockNode_out_0_reset,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset,
  output        auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock,
  output        auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset,
  output        auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
  input  [2:0]  auto_bus_xing_in_a_bits_param,
  input  [3:0]  auto_bus_xing_in_a_bits_size,
  input  [4:0]  auto_bus_xing_in_a_bits_source,
  input  [27:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
  input         auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [3:0]  auto_bus_xing_in_d_bits_size,
  output [4:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
  output        auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt,
  output        clock,
  output        reset
);
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_clock;
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_reset;
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock;
  wire  subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset;
  wire  subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_clock;
  wire  subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_reset;
  wire  subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_clock;
  wire  subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_reset;
  wire  clockGroup_auto_in_member_subsystem_cbus_0_clock;
  wire  clockGroup_auto_in_member_subsystem_cbus_0_reset;
  wire  clockGroup_auto_out_clock;
  wire  clockGroup_auto_out_reset;
  wire  fixedClockNode_auto_in_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_in_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_3_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_3_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_1_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_1_reset; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_0_clock; // @[ClockGroup.scala 106:107]
  wire  fixedClockNode_auto_out_0_reset; // @[ClockGroup.scala 106:107]
  wire  fixer_clock; // @[PeripheryBus.scala 47:33]
  wire  fixer_reset; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_a_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_a_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_a_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_a_bits_param; // @[PeripheryBus.scala 47:33]
  wire [3:0] fixer_auto_in_a_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_in_a_bits_source; // @[PeripheryBus.scala 47:33]
  wire [27:0] fixer_auto_in_a_bits_address; // @[PeripheryBus.scala 47:33]
  wire [7:0] fixer_auto_in_a_bits_mask; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_in_a_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_a_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_in_d_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [1:0] fixer_auto_in_d_bits_param; // @[PeripheryBus.scala 47:33]
  wire [3:0] fixer_auto_in_d_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_in_d_bits_source; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_sink; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_denied; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_in_d_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_in_d_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_a_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_a_bits_param; // @[PeripheryBus.scala 47:33]
  wire [3:0] fixer_auto_out_a_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_out_a_bits_source; // @[PeripheryBus.scala 47:33]
  wire [27:0] fixer_auto_out_a_bits_address; // @[PeripheryBus.scala 47:33]
  wire [7:0] fixer_auto_out_a_bits_mask; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_out_a_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_a_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_ready; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_valid; // @[PeripheryBus.scala 47:33]
  wire [2:0] fixer_auto_out_d_bits_opcode; // @[PeripheryBus.scala 47:33]
  wire [1:0] fixer_auto_out_d_bits_param; // @[PeripheryBus.scala 47:33]
  wire [3:0] fixer_auto_out_d_bits_size; // @[PeripheryBus.scala 47:33]
  wire [4:0] fixer_auto_out_d_bits_source; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_sink; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_denied; // @[PeripheryBus.scala 47:33]
  wire [63:0] fixer_auto_out_d_bits_data; // @[PeripheryBus.scala 47:33]
  wire  fixer_auto_out_d_bits_corrupt; // @[PeripheryBus.scala 47:33]
  wire  in_xbar_auto_in_a_ready;
  wire  in_xbar_auto_in_a_valid;
  wire [2:0] in_xbar_auto_in_a_bits_opcode;
  wire [2:0] in_xbar_auto_in_a_bits_param;
  wire [3:0] in_xbar_auto_in_a_bits_size;
  wire [4:0] in_xbar_auto_in_a_bits_source;
  wire [27:0] in_xbar_auto_in_a_bits_address;
  wire [7:0] in_xbar_auto_in_a_bits_mask;
  wire [63:0] in_xbar_auto_in_a_bits_data;
  wire  in_xbar_auto_in_a_bits_corrupt;
  wire  in_xbar_auto_in_d_ready;
  wire  in_xbar_auto_in_d_valid;
  wire [2:0] in_xbar_auto_in_d_bits_opcode;
  wire [1:0] in_xbar_auto_in_d_bits_param;
  wire [3:0] in_xbar_auto_in_d_bits_size;
  wire [4:0] in_xbar_auto_in_d_bits_source;
  wire  in_xbar_auto_in_d_bits_sink;
  wire  in_xbar_auto_in_d_bits_denied;
  wire [63:0] in_xbar_auto_in_d_bits_data;
  wire  in_xbar_auto_in_d_bits_corrupt;
  wire  in_xbar_auto_out_a_ready;
  wire  in_xbar_auto_out_a_valid;
  wire [2:0] in_xbar_auto_out_a_bits_opcode;
  wire [2:0] in_xbar_auto_out_a_bits_param;
  wire [3:0] in_xbar_auto_out_a_bits_size;
  wire [4:0] in_xbar_auto_out_a_bits_source;
  wire [27:0] in_xbar_auto_out_a_bits_address;
  wire [7:0] in_xbar_auto_out_a_bits_mask;
  wire [63:0] in_xbar_auto_out_a_bits_data;
  wire  in_xbar_auto_out_a_bits_corrupt;
  wire  in_xbar_auto_out_d_ready;
  wire  in_xbar_auto_out_d_valid;
  wire [2:0] in_xbar_auto_out_d_bits_opcode;
  wire [1:0] in_xbar_auto_out_d_bits_param;
  wire [3:0] in_xbar_auto_out_d_bits_size;
  wire [4:0] in_xbar_auto_out_d_bits_source;
  wire  in_xbar_auto_out_d_bits_sink;
  wire  in_xbar_auto_out_d_bits_denied;
  wire [63:0] in_xbar_auto_out_d_bits_data;
  wire  in_xbar_auto_out_d_bits_corrupt;
  wire  out_xbar_clock; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_reset; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [3:0] out_xbar_auto_in_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_in_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [27:0] out_xbar_auto_in_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_in_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_in_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_in_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_in_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [3:0] out_xbar_auto_in_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_in_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_in_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_in_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_4_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [16:0] out_xbar_auto_out_4_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_4_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_4_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_4_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_4_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_4_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_3_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [11:0] out_xbar_auto_out_3_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_3_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_3_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_3_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_3_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_3_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_3_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_2_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [25:0] out_xbar_auto_out_2_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_2_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_2_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_2_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_2_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_2_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_2_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_1_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [27:0] out_xbar_auto_out_1_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_1_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_1_a_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_1_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_1_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_1_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_1_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_a_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_a_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_a_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_a_bits_param; // @[PeripheryBus.scala 50:30]
  wire [3:0] out_xbar_auto_out_0_a_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_0_a_bits_source; // @[PeripheryBus.scala 50:30]
  wire [13:0] out_xbar_auto_out_0_a_bits_address; // @[PeripheryBus.scala 50:30]
  wire [7:0] out_xbar_auto_out_0_a_bits_mask; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_a_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_ready; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_valid; // @[PeripheryBus.scala 50:30]
  wire [2:0] out_xbar_auto_out_0_d_bits_opcode; // @[PeripheryBus.scala 50:30]
  wire [1:0] out_xbar_auto_out_0_d_bits_param; // @[PeripheryBus.scala 50:30]
  wire [3:0] out_xbar_auto_out_0_d_bits_size; // @[PeripheryBus.scala 50:30]
  wire [4:0] out_xbar_auto_out_0_d_bits_source; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_bits_sink; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_bits_denied; // @[PeripheryBus.scala 50:30]
  wire [63:0] out_xbar_auto_out_0_d_bits_data; // @[PeripheryBus.scala 50:30]
  wire  out_xbar_auto_out_0_d_bits_corrupt; // @[PeripheryBus.scala 50:30]
  wire  buffer_clock; // @[Buffer.scala 68:28]
  wire  buffer_reset; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [27:0] buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [27:0] buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [4:0] buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  atomics_clock; // @[AtomicAutomata.scala 283:29]
  wire  atomics_reset; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_a_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_a_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_a_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_a_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [3:0] atomics_auto_in_a_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_in_a_bits_source; // @[AtomicAutomata.scala 283:29]
  wire [27:0] atomics_auto_in_a_bits_address; // @[AtomicAutomata.scala 283:29]
  wire [7:0] atomics_auto_in_a_bits_mask; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_in_a_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_a_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_in_d_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [1:0] atomics_auto_in_d_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [3:0] atomics_auto_in_d_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_in_d_bits_source; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_sink; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_denied; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_in_d_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_in_d_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_a_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_a_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [3:0] atomics_auto_out_a_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_out_a_bits_source; // @[AtomicAutomata.scala 283:29]
  wire [27:0] atomics_auto_out_a_bits_address; // @[AtomicAutomata.scala 283:29]
  wire [7:0] atomics_auto_out_a_bits_mask; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_out_a_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_a_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_ready; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_valid; // @[AtomicAutomata.scala 283:29]
  wire [2:0] atomics_auto_out_d_bits_opcode; // @[AtomicAutomata.scala 283:29]
  wire [1:0] atomics_auto_out_d_bits_param; // @[AtomicAutomata.scala 283:29]
  wire [3:0] atomics_auto_out_d_bits_size; // @[AtomicAutomata.scala 283:29]
  wire [4:0] atomics_auto_out_d_bits_source; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_sink; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_denied; // @[AtomicAutomata.scala 283:29]
  wire [63:0] atomics_auto_out_d_bits_data; // @[AtomicAutomata.scala 283:29]
  wire  atomics_auto_out_d_bits_corrupt; // @[AtomicAutomata.scala 283:29]
  wire  wrapped_error_device_clock; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_reset; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_a_ready; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] wrapped_error_device_auto_buffer_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] wrapped_error_device_auto_buffer_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] wrapped_error_device_auto_buffer_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [13:0] wrapped_error_device_auto_buffer_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] wrapped_error_device_auto_buffer_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_ready; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] wrapped_error_device_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] wrapped_error_device_auto_buffer_in_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] wrapped_error_device_auto_buffer_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] wrapped_error_device_auto_buffer_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] wrapped_error_device_auto_buffer_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  wrapped_error_device_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  buffer_1_auto_in_a_ready;
  wire  buffer_1_auto_in_a_valid;
  wire [2:0] buffer_1_auto_in_a_bits_opcode;
  wire [2:0] buffer_1_auto_in_a_bits_param;
  wire [3:0] buffer_1_auto_in_a_bits_size;
  wire [4:0] buffer_1_auto_in_a_bits_source;
  wire [27:0] buffer_1_auto_in_a_bits_address;
  wire [7:0] buffer_1_auto_in_a_bits_mask;
  wire [63:0] buffer_1_auto_in_a_bits_data;
  wire  buffer_1_auto_in_a_bits_corrupt;
  wire  buffer_1_auto_in_d_ready;
  wire  buffer_1_auto_in_d_valid;
  wire [2:0] buffer_1_auto_in_d_bits_opcode;
  wire [1:0] buffer_1_auto_in_d_bits_param;
  wire [3:0] buffer_1_auto_in_d_bits_size;
  wire [4:0] buffer_1_auto_in_d_bits_source;
  wire  buffer_1_auto_in_d_bits_sink;
  wire  buffer_1_auto_in_d_bits_denied;
  wire [63:0] buffer_1_auto_in_d_bits_data;
  wire  buffer_1_auto_in_d_bits_corrupt;
  wire  buffer_1_auto_out_a_ready;
  wire  buffer_1_auto_out_a_valid;
  wire [2:0] buffer_1_auto_out_a_bits_opcode;
  wire [2:0] buffer_1_auto_out_a_bits_param;
  wire [3:0] buffer_1_auto_out_a_bits_size;
  wire [4:0] buffer_1_auto_out_a_bits_source;
  wire [27:0] buffer_1_auto_out_a_bits_address;
  wire [7:0] buffer_1_auto_out_a_bits_mask;
  wire [63:0] buffer_1_auto_out_a_bits_data;
  wire  buffer_1_auto_out_a_bits_corrupt;
  wire  buffer_1_auto_out_d_ready;
  wire  buffer_1_auto_out_d_valid;
  wire [2:0] buffer_1_auto_out_d_bits_opcode;
  wire [1:0] buffer_1_auto_out_d_bits_param;
  wire [3:0] buffer_1_auto_out_d_bits_size;
  wire [4:0] buffer_1_auto_out_d_bits_source;
  wire  buffer_1_auto_out_d_bits_sink;
  wire  buffer_1_auto_out_d_bits_denied;
  wire [63:0] buffer_1_auto_out_d_bits_data;
  wire  buffer_1_auto_out_d_bits_corrupt;
  wire  coupler_to_plic_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_plic_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_plic_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [27:0] coupler_to_plic_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_plic_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_plic_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_plic_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_plic_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [27:0] coupler_to_plic_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_plic_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_plic_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_plic_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_plic_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_plic_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_clint_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_clint_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [25:0] coupler_to_clint_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_clint_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_clint_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_clint_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_clint_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [25:0] coupler_to_clint_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_clint_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_clint_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_clint_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_clint_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_clint_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_debug_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_debug_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [11:0] coupler_to_debug_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_debug_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_debug_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_debug_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_debug_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [11:0] coupler_to_debug_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_debug_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_tl_in_a_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_debug_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_debug_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_debug_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_debug_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_clock; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_reset; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [16:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bootrom_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_fragmenter_out_d_valid; // @[LazyModule.scala 432:27]
  wire [1:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [8:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bootrom_auto_fragmenter_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_a_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_param; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_a_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bootrom_auto_tl_in_a_bits_source; // @[LazyModule.scala 432:27]
  wire [16:0] coupler_to_bootrom_auto_tl_in_a_bits_address; // @[LazyModule.scala 432:27]
  wire [7:0] coupler_to_bootrom_auto_tl_in_a_bits_mask; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_d_ready; // @[LazyModule.scala 432:27]
  wire  coupler_to_bootrom_auto_tl_in_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] coupler_to_bootrom_auto_tl_in_d_bits_size; // @[LazyModule.scala 432:27]
  wire [4:0] coupler_to_bootrom_auto_tl_in_d_bits_source; // @[LazyModule.scala 432:27]
  wire [63:0] coupler_to_bootrom_auto_tl_in_d_bits_data; // @[LazyModule.scala 432:27]
  FixedClockBroadcast_3 fixedClockNode ( // @[ClockGroup.scala 106:107]
    .auto_in_clock(fixedClockNode_auto_in_clock),
    .auto_in_reset(fixedClockNode_auto_in_reset),
    .auto_out_3_clock(fixedClockNode_auto_out_3_clock),
    .auto_out_3_reset(fixedClockNode_auto_out_3_reset),
    .auto_out_1_clock(fixedClockNode_auto_out_1_clock),
    .auto_out_1_reset(fixedClockNode_auto_out_1_reset),
    .auto_out_0_clock(fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset(fixedClockNode_auto_out_0_reset)
  );
  TLFIFOFixer_3 fixer ( // @[PeripheryBus.scala 47:33]
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_a_ready(fixer_auto_in_a_ready),
    .auto_in_a_valid(fixer_auto_in_a_valid),
    .auto_in_a_bits_opcode(fixer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fixer_auto_in_a_bits_param),
    .auto_in_a_bits_size(fixer_auto_in_a_bits_size),
    .auto_in_a_bits_source(fixer_auto_in_a_bits_source),
    .auto_in_a_bits_address(fixer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fixer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fixer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fixer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fixer_auto_in_d_ready),
    .auto_in_d_valid(fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode(fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fixer_auto_in_d_bits_param),
    .auto_in_d_bits_size(fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source(fixer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fixer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fixer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fixer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fixer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fixer_auto_out_a_ready),
    .auto_out_a_valid(fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode(fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fixer_auto_out_a_bits_param),
    .auto_out_a_bits_size(fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source(fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address(fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fixer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fixer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fixer_auto_out_d_ready),
    .auto_out_d_valid(fixer_auto_out_d_valid),
    .auto_out_d_bits_opcode(fixer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fixer_auto_out_d_bits_param),
    .auto_out_d_bits_size(fixer_auto_out_d_bits_size),
    .auto_out_d_bits_source(fixer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fixer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fixer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fixer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fixer_auto_out_d_bits_corrupt)
  );
  TLXbar_5 out_xbar ( // @[PeripheryBus.scala 50:30]
    .clock(out_xbar_clock),
    .reset(out_xbar_reset),
    .auto_in_a_ready(out_xbar_auto_in_a_ready),
    .auto_in_a_valid(out_xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(out_xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(out_xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(out_xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(out_xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(out_xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(out_xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(out_xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(out_xbar_auto_in_a_bits_corrupt),
    .auto_in_d_ready(out_xbar_auto_in_d_ready),
    .auto_in_d_valid(out_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(out_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(out_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(out_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(out_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink(out_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(out_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(out_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(out_xbar_auto_in_d_bits_corrupt),
    .auto_out_4_a_ready(out_xbar_auto_out_4_a_ready),
    .auto_out_4_a_valid(out_xbar_auto_out_4_a_valid),
    .auto_out_4_a_bits_opcode(out_xbar_auto_out_4_a_bits_opcode),
    .auto_out_4_a_bits_param(out_xbar_auto_out_4_a_bits_param),
    .auto_out_4_a_bits_size(out_xbar_auto_out_4_a_bits_size),
    .auto_out_4_a_bits_source(out_xbar_auto_out_4_a_bits_source),
    .auto_out_4_a_bits_address(out_xbar_auto_out_4_a_bits_address),
    .auto_out_4_a_bits_mask(out_xbar_auto_out_4_a_bits_mask),
    .auto_out_4_a_bits_corrupt(out_xbar_auto_out_4_a_bits_corrupt),
    .auto_out_4_d_ready(out_xbar_auto_out_4_d_ready),
    .auto_out_4_d_valid(out_xbar_auto_out_4_d_valid),
    .auto_out_4_d_bits_size(out_xbar_auto_out_4_d_bits_size),
    .auto_out_4_d_bits_source(out_xbar_auto_out_4_d_bits_source),
    .auto_out_4_d_bits_data(out_xbar_auto_out_4_d_bits_data),
    .auto_out_3_a_ready(out_xbar_auto_out_3_a_ready),
    .auto_out_3_a_valid(out_xbar_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode(out_xbar_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param(out_xbar_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size(out_xbar_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source(out_xbar_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address(out_xbar_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask(out_xbar_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data(out_xbar_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt(out_xbar_auto_out_3_a_bits_corrupt),
    .auto_out_3_d_ready(out_xbar_auto_out_3_d_ready),
    .auto_out_3_d_valid(out_xbar_auto_out_3_d_valid),
    .auto_out_3_d_bits_opcode(out_xbar_auto_out_3_d_bits_opcode),
    .auto_out_3_d_bits_size(out_xbar_auto_out_3_d_bits_size),
    .auto_out_3_d_bits_source(out_xbar_auto_out_3_d_bits_source),
    .auto_out_3_d_bits_data(out_xbar_auto_out_3_d_bits_data),
    .auto_out_2_a_ready(out_xbar_auto_out_2_a_ready),
    .auto_out_2_a_valid(out_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode(out_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param(out_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size(out_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source(out_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address(out_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask(out_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data(out_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt(out_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_d_ready(out_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid(out_xbar_auto_out_2_d_valid),
    .auto_out_2_d_bits_opcode(out_xbar_auto_out_2_d_bits_opcode),
    .auto_out_2_d_bits_size(out_xbar_auto_out_2_d_bits_size),
    .auto_out_2_d_bits_source(out_xbar_auto_out_2_d_bits_source),
    .auto_out_2_d_bits_data(out_xbar_auto_out_2_d_bits_data),
    .auto_out_1_a_ready(out_xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(out_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(out_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(out_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(out_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(out_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(out_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(out_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data(out_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt(out_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready(out_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(out_xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(out_xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_size(out_xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(out_xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_data(out_xbar_auto_out_1_d_bits_data),
    .auto_out_0_a_ready(out_xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(out_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(out_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(out_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(out_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(out_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(out_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(out_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_corrupt(out_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(out_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(out_xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(out_xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(out_xbar_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(out_xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(out_xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(out_xbar_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(out_xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(out_xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(out_xbar_auto_out_0_d_bits_corrupt)
  );
  TLBuffer_4 buffer ( // @[Buffer.scala 68:28]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  TLAtomicAutomata_1 atomics ( // @[AtomicAutomata.scala 283:29]
    .clock(atomics_clock),
    .reset(atomics_reset),
    .auto_in_a_ready(atomics_auto_in_a_ready),
    .auto_in_a_valid(atomics_auto_in_a_valid),
    .auto_in_a_bits_opcode(atomics_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(atomics_auto_in_a_bits_param),
    .auto_in_a_bits_size(atomics_auto_in_a_bits_size),
    .auto_in_a_bits_source(atomics_auto_in_a_bits_source),
    .auto_in_a_bits_address(atomics_auto_in_a_bits_address),
    .auto_in_a_bits_mask(atomics_auto_in_a_bits_mask),
    .auto_in_a_bits_data(atomics_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(atomics_auto_in_a_bits_corrupt),
    .auto_in_d_ready(atomics_auto_in_d_ready),
    .auto_in_d_valid(atomics_auto_in_d_valid),
    .auto_in_d_bits_opcode(atomics_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(atomics_auto_in_d_bits_param),
    .auto_in_d_bits_size(atomics_auto_in_d_bits_size),
    .auto_in_d_bits_source(atomics_auto_in_d_bits_source),
    .auto_in_d_bits_sink(atomics_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(atomics_auto_in_d_bits_denied),
    .auto_in_d_bits_data(atomics_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(atomics_auto_in_d_bits_corrupt),
    .auto_out_a_ready(atomics_auto_out_a_ready),
    .auto_out_a_valid(atomics_auto_out_a_valid),
    .auto_out_a_bits_opcode(atomics_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(atomics_auto_out_a_bits_param),
    .auto_out_a_bits_size(atomics_auto_out_a_bits_size),
    .auto_out_a_bits_source(atomics_auto_out_a_bits_source),
    .auto_out_a_bits_address(atomics_auto_out_a_bits_address),
    .auto_out_a_bits_mask(atomics_auto_out_a_bits_mask),
    .auto_out_a_bits_data(atomics_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(atomics_auto_out_a_bits_corrupt),
    .auto_out_d_ready(atomics_auto_out_d_ready),
    .auto_out_d_valid(atomics_auto_out_d_valid),
    .auto_out_d_bits_opcode(atomics_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(atomics_auto_out_d_bits_param),
    .auto_out_d_bits_size(atomics_auto_out_d_bits_size),
    .auto_out_d_bits_source(atomics_auto_out_d_bits_source),
    .auto_out_d_bits_sink(atomics_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(atomics_auto_out_d_bits_denied),
    .auto_out_d_bits_data(atomics_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(atomics_auto_out_d_bits_corrupt)
  );
  ErrorDeviceWrapper wrapped_error_device ( // @[LazyModule.scala 432:27]
    .clock(wrapped_error_device_clock),
    .reset(wrapped_error_device_reset),
    .auto_buffer_in_a_ready(wrapped_error_device_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(wrapped_error_device_auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(wrapped_error_device_auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_param(wrapped_error_device_auto_buffer_in_a_bits_param),
    .auto_buffer_in_a_bits_size(wrapped_error_device_auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(wrapped_error_device_auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(wrapped_error_device_auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(wrapped_error_device_auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_corrupt(wrapped_error_device_auto_buffer_in_a_bits_corrupt),
    .auto_buffer_in_d_ready(wrapped_error_device_auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(wrapped_error_device_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(wrapped_error_device_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(wrapped_error_device_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(wrapped_error_device_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(wrapped_error_device_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink(wrapped_error_device_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied(wrapped_error_device_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(wrapped_error_device_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(wrapped_error_device_auto_buffer_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_7 coupler_to_plic ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_plic_clock),
    .reset(coupler_to_plic_reset),
    .auto_fragmenter_out_a_ready(coupler_to_plic_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_plic_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_plic_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_plic_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_plic_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_plic_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_plic_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_plic_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_plic_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_plic_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_plic_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_plic_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_plic_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_plic_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_plic_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_plic_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_plic_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_plic_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_plic_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_plic_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_plic_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_plic_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_plic_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_plic_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_plic_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_plic_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_plic_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_plic_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_plic_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_plic_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_plic_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_plic_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_8 coupler_to_clint ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_clint_clock),
    .reset(coupler_to_clint_reset),
    .auto_fragmenter_out_a_ready(coupler_to_clint_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_clint_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_clint_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_clint_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_clint_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_clint_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_clint_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_clint_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_clint_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_clint_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_clint_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_clint_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_clint_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_clint_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_clint_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_clint_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_clint_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_clint_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_clint_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_clint_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_clint_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_clint_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_clint_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_clint_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_clint_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_clint_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_clint_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_clint_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_clint_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_clint_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_clint_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_clint_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_9 coupler_to_debug ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_debug_clock),
    .reset(coupler_to_debug_reset),
    .auto_fragmenter_out_a_ready(coupler_to_debug_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_debug_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_debug_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_debug_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_debug_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_debug_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_debug_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_debug_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data(coupler_to_debug_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_debug_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_debug_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_debug_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode(coupler_to_debug_auto_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size(coupler_to_debug_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_debug_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_debug_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_debug_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_debug_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_debug_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_debug_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_debug_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_debug_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_debug_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_debug_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(coupler_to_debug_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(coupler_to_debug_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_debug_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_debug_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(coupler_to_debug_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(coupler_to_debug_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_debug_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_debug_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_11 coupler_to_bootrom ( // @[LazyModule.scala 432:27]
    .clock(coupler_to_bootrom_clock),
    .reset(coupler_to_bootrom_reset),
    .auto_fragmenter_out_a_ready(coupler_to_bootrom_auto_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid(coupler_to_bootrom_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode(coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param(coupler_to_bootrom_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size(coupler_to_bootrom_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source(coupler_to_bootrom_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address(coupler_to_bootrom_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask(coupler_to_bootrom_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_corrupt(coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready(coupler_to_bootrom_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid(coupler_to_bootrom_auto_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_size(coupler_to_bootrom_auto_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source(coupler_to_bootrom_auto_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data(coupler_to_bootrom_auto_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready(coupler_to_bootrom_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(coupler_to_bootrom_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(coupler_to_bootrom_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(coupler_to_bootrom_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(coupler_to_bootrom_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(coupler_to_bootrom_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(coupler_to_bootrom_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(coupler_to_bootrom_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_corrupt(coupler_to_bootrom_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(coupler_to_bootrom_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(coupler_to_bootrom_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_size(coupler_to_bootrom_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(coupler_to_bootrom_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(coupler_to_bootrom_auto_tl_in_d_bits_data)
  );
  assign subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_clock =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_reset =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_clock =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_reset =
    subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clockGroup_auto_out_clock = clockGroup_auto_in_member_subsystem_cbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clockGroup_auto_out_reset = clockGroup_auto_in_member_subsystem_cbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_in_a_ready = in_xbar_auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign in_xbar_auto_in_d_valid = in_xbar_auto_out_d_valid; // @[ReadyValidCancel.scala 21:38]
  assign in_xbar_auto_in_d_bits_opcode = in_xbar_auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign in_xbar_auto_in_d_bits_param = in_xbar_auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign in_xbar_auto_in_d_bits_size = in_xbar_auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign in_xbar_auto_in_d_bits_source = in_xbar_auto_out_d_bits_source; // @[Xbar.scala 228:69]
  assign in_xbar_auto_in_d_bits_sink = in_xbar_auto_out_d_bits_sink; // @[Xbar.scala 323:53]
  assign in_xbar_auto_in_d_bits_denied = in_xbar_auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign in_xbar_auto_in_d_bits_data = in_xbar_auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign in_xbar_auto_in_d_bits_corrupt = in_xbar_auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign in_xbar_auto_out_a_valid = in_xbar_auto_in_a_valid; // @[ReadyValidCancel.scala 21:38]
  assign in_xbar_auto_out_a_bits_opcode = in_xbar_auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_out_a_bits_param = in_xbar_auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_out_a_bits_size = in_xbar_auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_out_a_bits_source = in_xbar_auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign in_xbar_auto_out_a_bits_address = in_xbar_auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_out_a_bits_mask = in_xbar_auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_out_a_bits_data = in_xbar_auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_out_a_bits_corrupt = in_xbar_auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_xbar_auto_out_d_ready = in_xbar_auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_ready = buffer_1_auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_valid = buffer_1_auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_opcode = buffer_1_auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_param = buffer_1_auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_size = buffer_1_auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_source = buffer_1_auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_sink = buffer_1_auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_denied = buffer_1_auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_data = buffer_1_auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_in_d_bits_corrupt = buffer_1_auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_a_valid = buffer_1_auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_opcode = buffer_1_auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_param = buffer_1_auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_size = buffer_1_auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_source = buffer_1_auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_address = buffer_1_auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_mask = buffer_1_auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_data = buffer_1_auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_bits_corrupt = buffer_1_auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_d_ready = buffer_1_auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_coupler_to_bootrom_fragmenter_out_a_valid = coupler_to_bootrom_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode = coupler_to_bootrom_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_param = coupler_to_bootrom_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_size = coupler_to_bootrom_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_source = coupler_to_bootrom_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_address = coupler_to_bootrom_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_mask = coupler_to_bootrom_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt = coupler_to_bootrom_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_bootrom_fragmenter_out_d_ready = coupler_to_bootrom_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_valid = coupler_to_debug_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_opcode = coupler_to_debug_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_param = coupler_to_debug_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_size = coupler_to_debug_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_source = coupler_to_debug_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_address = coupler_to_debug_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_mask = coupler_to_debug_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_data = coupler_to_debug_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_a_bits_corrupt = coupler_to_debug_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_debug_fragmenter_out_d_ready = coupler_to_debug_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_valid = coupler_to_clint_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_opcode = coupler_to_clint_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_param = coupler_to_clint_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_size = coupler_to_clint_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_source = coupler_to_clint_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_address = coupler_to_clint_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_mask = coupler_to_clint_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_data = coupler_to_clint_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_a_bits_corrupt = coupler_to_clint_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_clint_fragmenter_out_d_ready = coupler_to_clint_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_valid = coupler_to_plic_auto_fragmenter_out_a_valid; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_opcode = coupler_to_plic_auto_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_param = coupler_to_plic_auto_fragmenter_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_size = coupler_to_plic_auto_fragmenter_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_source = coupler_to_plic_auto_fragmenter_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_address = coupler_to_plic_auto_fragmenter_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_mask = coupler_to_plic_auto_fragmenter_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_data = coupler_to_plic_auto_fragmenter_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_a_bits_corrupt = coupler_to_plic_auto_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 311:12]
  assign auto_coupler_to_plic_fragmenter_out_d_ready = coupler_to_plic_auto_fragmenter_out_d_ready; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_2_clock = fixedClockNode_auto_out_3_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_2_reset = fixedClockNode_auto_out_3_reset; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_0_clock = fixedClockNode_auto_out_1_clock; // @[LazyModule.scala 311:12]
  assign auto_fixedClockNode_out_0_reset = fixedClockNode_auto_out_1_reset; // @[LazyModule.scala 311:12]
  assign auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock =
    subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_clock; // @[LazyModule.scala 311:12]
  assign auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset =
    subsystem_cbus_clock_groups_auto_out_1_member_subsystem_pbus_0_reset; // @[LazyModule.scala 311:12]
  assign auto_bus_xing_in_a_ready = buffer_1_auto_in_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_valid = buffer_1_auto_in_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_opcode = buffer_1_auto_in_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_param = buffer_1_auto_in_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_size = buffer_1_auto_in_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_source = buffer_1_auto_in_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_sink = buffer_1_auto_in_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_denied = buffer_1_auto_in_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_data = buffer_1_auto_in_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign auto_bus_xing_in_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_clock =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock; // @[LazyModule.scala 309:16]
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_1_reset =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset; // @[LazyModule.scala 309:16]
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_clock =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_cbus_clock_groups_auto_in_member_subsystem_cbus_0_reset =
    auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset; // @[LazyModule.scala 309:16]
  assign clockGroup_auto_in_member_subsystem_cbus_0_clock =
    subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_clock; // @[LazyModule.scala 298:16]
  assign clockGroup_auto_in_member_subsystem_cbus_0_reset =
    subsystem_cbus_clock_groups_auto_out_0_member_subsystem_cbus_0_reset; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_clock = clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign fixedClockNode_auto_in_reset = clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
  assign fixer_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign fixer_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign fixer_auto_in_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign fixer_auto_in_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign fixer_auto_out_a_ready = out_xbar_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_valid = out_xbar_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_opcode = out_xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_param = out_xbar_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_size = out_xbar_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_source = out_xbar_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_sink = out_xbar_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_denied = out_xbar_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_data = out_xbar_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign fixer_auto_out_d_bits_corrupt = out_xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_in_a_valid = buffer_1_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_param = buffer_1_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_size = buffer_1_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_source = buffer_1_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_address = buffer_1_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_mask = buffer_1_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_data = buffer_1_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_in_d_ready = buffer_1_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign in_xbar_auto_out_a_ready = atomics_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_valid = atomics_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_opcode = atomics_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_param = atomics_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_size = atomics_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_source = atomics_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_sink = atomics_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_denied = atomics_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_data = atomics_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign in_xbar_auto_out_d_bits_corrupt = atomics_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign out_xbar_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign out_xbar_auto_in_a_valid = fixer_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_opcode = fixer_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_param = fixer_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_size = fixer_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_source = fixer_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_address = fixer_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_mask = fixer_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_data = fixer_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_a_bits_corrupt = fixer_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_in_d_ready = fixer_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_a_ready = coupler_to_bootrom_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_valid = coupler_to_bootrom_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_size = coupler_to_bootrom_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_source = coupler_to_bootrom_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_4_d_bits_data = coupler_to_bootrom_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_a_ready = coupler_to_debug_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_valid = coupler_to_debug_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_opcode = coupler_to_debug_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_size = coupler_to_debug_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_source = coupler_to_debug_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_3_d_bits_data = coupler_to_debug_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_a_ready = coupler_to_clint_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_valid = coupler_to_clint_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_opcode = coupler_to_clint_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_size = coupler_to_clint_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_source = coupler_to_clint_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_2_d_bits_data = coupler_to_clint_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_a_ready = coupler_to_plic_auto_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_valid = coupler_to_plic_auto_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_opcode = coupler_to_plic_auto_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_size = coupler_to_plic_auto_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_source = coupler_to_plic_auto_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_1_d_bits_data = coupler_to_plic_auto_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_a_ready = wrapped_error_device_auto_buffer_in_a_ready; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_valid = wrapped_error_device_auto_buffer_in_d_valid; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_opcode = wrapped_error_device_auto_buffer_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_param = wrapped_error_device_auto_buffer_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_size = wrapped_error_device_auto_buffer_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_source = wrapped_error_device_auto_buffer_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_sink = wrapped_error_device_auto_buffer_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_denied = wrapped_error_device_auto_buffer_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_data = wrapped_error_device_auto_buffer_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign out_xbar_auto_out_0_d_bits_corrupt = wrapped_error_device_auto_buffer_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign buffer_auto_in_a_valid = atomics_auto_out_a_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_opcode = atomics_auto_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_param = atomics_auto_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_size = atomics_auto_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_source = atomics_auto_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_address = atomics_auto_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_mask = atomics_auto_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_data = atomics_auto_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_a_bits_corrupt = atomics_auto_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign buffer_auto_in_d_ready = atomics_auto_out_d_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_a_ready = fixer_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_valid = fixer_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_opcode = fixer_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_param = fixer_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_size = fixer_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_source = fixer_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_sink = fixer_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_denied = fixer_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_data = fixer_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_auto_out_d_bits_corrupt = fixer_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign atomics_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign atomics_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign atomics_auto_in_a_valid = in_xbar_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_opcode = in_xbar_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_param = in_xbar_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_size = in_xbar_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_source = in_xbar_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_address = in_xbar_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_mask = in_xbar_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_data = in_xbar_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_a_bits_corrupt = in_xbar_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign atomics_auto_in_d_ready = in_xbar_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign atomics_auto_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign atomics_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign wrapped_error_device_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign wrapped_error_device_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign wrapped_error_device_auto_buffer_in_a_valid = out_xbar_auto_out_0_a_valid; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_opcode = out_xbar_auto_out_0_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_param = out_xbar_auto_out_0_a_bits_param; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_size = out_xbar_auto_out_0_a_bits_size; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_source = out_xbar_auto_out_0_a_bits_source; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_address = out_xbar_auto_out_0_a_bits_address; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_mask = out_xbar_auto_out_0_a_bits_mask; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_a_bits_corrupt = out_xbar_auto_out_0_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign wrapped_error_device_auto_buffer_in_d_ready = out_xbar_auto_out_0_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_valid = auto_bus_xing_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_opcode = auto_bus_xing_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_param = auto_bus_xing_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_size = auto_bus_xing_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_source = auto_bus_xing_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_address = auto_bus_xing_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_mask = auto_bus_xing_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_data = auto_bus_xing_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_bits_corrupt = auto_bus_xing_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_d_ready = auto_bus_xing_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_out_a_ready = in_xbar_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_valid = in_xbar_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_opcode = in_xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_param = in_xbar_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_size = in_xbar_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_source = in_xbar_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_sink = in_xbar_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_denied = in_xbar_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_data = in_xbar_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign buffer_1_auto_out_d_bits_corrupt = in_xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign coupler_to_plic_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_plic_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_plic_auto_fragmenter_out_a_ready = auto_coupler_to_plic_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_valid = auto_coupler_to_plic_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_plic_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_size = auto_coupler_to_plic_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_source = auto_coupler_to_plic_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_fragmenter_out_d_bits_data = auto_coupler_to_plic_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_plic_auto_tl_in_a_valid = out_xbar_auto_out_1_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_opcode = out_xbar_auto_out_1_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_param = out_xbar_auto_out_1_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_size = out_xbar_auto_out_1_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_source = out_xbar_auto_out_1_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_address = out_xbar_auto_out_1_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_mask = out_xbar_auto_out_1_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_data = out_xbar_auto_out_1_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_1_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_plic_auto_tl_in_d_ready = out_xbar_auto_out_1_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_clint_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_clint_auto_fragmenter_out_a_ready = auto_coupler_to_clint_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_valid = auto_coupler_to_clint_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_clint_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_size = auto_coupler_to_clint_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_source = auto_coupler_to_clint_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_fragmenter_out_d_bits_data = auto_coupler_to_clint_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_clint_auto_tl_in_a_valid = out_xbar_auto_out_2_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_opcode = out_xbar_auto_out_2_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_param = out_xbar_auto_out_2_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_size = out_xbar_auto_out_2_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_source = out_xbar_auto_out_2_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_address = out_xbar_auto_out_2_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_mask = out_xbar_auto_out_2_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_data = out_xbar_auto_out_2_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_2_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_clint_auto_tl_in_d_ready = out_xbar_auto_out_2_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_debug_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_debug_auto_fragmenter_out_a_ready = auto_coupler_to_debug_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_valid = auto_coupler_to_debug_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_opcode = auto_coupler_to_debug_fragmenter_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_size = auto_coupler_to_debug_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_source = auto_coupler_to_debug_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_fragmenter_out_d_bits_data = auto_coupler_to_debug_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_debug_auto_tl_in_a_valid = out_xbar_auto_out_3_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_opcode = out_xbar_auto_out_3_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_param = out_xbar_auto_out_3_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_size = out_xbar_auto_out_3_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_source = out_xbar_auto_out_3_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_address = out_xbar_auto_out_3_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_mask = out_xbar_auto_out_3_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_data = out_xbar_auto_out_3_a_bits_data; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_3_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_debug_auto_tl_in_d_ready = out_xbar_auto_out_3_d_ready; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_clock = fixedClockNode_auto_out_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bootrom_reset = fixedClockNode_auto_out_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign coupler_to_bootrom_auto_fragmenter_out_a_ready = auto_coupler_to_bootrom_fragmenter_out_a_ready; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_valid = auto_coupler_to_bootrom_fragmenter_out_d_valid; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_size = auto_coupler_to_bootrom_fragmenter_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_source = auto_coupler_to_bootrom_fragmenter_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_fragmenter_out_d_bits_data = auto_coupler_to_bootrom_fragmenter_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign coupler_to_bootrom_auto_tl_in_a_valid = out_xbar_auto_out_4_a_valid; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_opcode = out_xbar_auto_out_4_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_param = out_xbar_auto_out_4_a_bits_param; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_size = out_xbar_auto_out_4_a_bits_size; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_source = out_xbar_auto_out_4_a_bits_source; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_address = out_xbar_auto_out_4_a_bits_address; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_mask = out_xbar_auto_out_4_a_bits_mask; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_a_bits_corrupt = out_xbar_auto_out_4_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign coupler_to_bootrom_auto_tl_in_d_ready = out_xbar_auto_out_4_d_ready; // @[LazyModule.scala 298:16]
endmodule
