module ExampleRocketSystem(
  input         clock,
  input         reset,
  input         mem_axi4_0_aw_ready,
  output        mem_axi4_0_aw_valid,
  output [3:0]  mem_axi4_0_aw_bits_id,
  output [31:0] mem_axi4_0_aw_bits_addr,
  output [7:0]  mem_axi4_0_aw_bits_len,
  output [2:0]  mem_axi4_0_aw_bits_size,
  output [1:0]  mem_axi4_0_aw_bits_burst,
  output        mem_axi4_0_aw_bits_lock,
  output [3:0]  mem_axi4_0_aw_bits_cache,
  output [2:0]  mem_axi4_0_aw_bits_prot,
  output [3:0]  mem_axi4_0_aw_bits_qos,
  input         mem_axi4_0_w_ready,
  output        mem_axi4_0_w_valid,
  output [63:0] mem_axi4_0_w_bits_data,
  output [7:0]  mem_axi4_0_w_bits_strb,
  output        mem_axi4_0_w_bits_last,
  output        mem_axi4_0_b_ready,
  input         mem_axi4_0_b_valid,
  input  [3:0]  mem_axi4_0_b_bits_id,
  input  [1:0]  mem_axi4_0_b_bits_resp,
  input         mem_axi4_0_ar_ready,
  output        mem_axi4_0_ar_valid,
  output [3:0]  mem_axi4_0_ar_bits_id,
  output [31:0] mem_axi4_0_ar_bits_addr,
  output [7:0]  mem_axi4_0_ar_bits_len,
  output [2:0]  mem_axi4_0_ar_bits_size,
  output [1:0]  mem_axi4_0_ar_bits_burst,
  output        mem_axi4_0_ar_bits_lock,
  output [3:0]  mem_axi4_0_ar_bits_cache,
  output [2:0]  mem_axi4_0_ar_bits_prot,
  output [3:0]  mem_axi4_0_ar_bits_qos,
  output        mem_axi4_0_r_ready,
  input         mem_axi4_0_r_valid,
  input  [3:0]  mem_axi4_0_r_bits_id,
  input  [63:0] mem_axi4_0_r_bits_data,
  input  [1:0]  mem_axi4_0_r_bits_resp,
  input         mem_axi4_0_r_bits_last,
  input         mmio_axi4_0_aw_ready,
  output        mmio_axi4_0_aw_valid,
  output [3:0]  mmio_axi4_0_aw_bits_id,
  output [30:0] mmio_axi4_0_aw_bits_addr,
  output [7:0]  mmio_axi4_0_aw_bits_len,
  output [2:0]  mmio_axi4_0_aw_bits_size,
  output [1:0]  mmio_axi4_0_aw_bits_burst,
  output        mmio_axi4_0_aw_bits_lock,
  output [3:0]  mmio_axi4_0_aw_bits_cache,
  output [2:0]  mmio_axi4_0_aw_bits_prot,
  output [3:0]  mmio_axi4_0_aw_bits_qos,
  input         mmio_axi4_0_w_ready,
  output        mmio_axi4_0_w_valid,
  output [63:0] mmio_axi4_0_w_bits_data,
  output [7:0]  mmio_axi4_0_w_bits_strb,
  output        mmio_axi4_0_w_bits_last,
  output        mmio_axi4_0_b_ready,
  input         mmio_axi4_0_b_valid,
  input  [3:0]  mmio_axi4_0_b_bits_id,
  input  [1:0]  mmio_axi4_0_b_bits_resp,
  input         mmio_axi4_0_ar_ready,
  output        mmio_axi4_0_ar_valid,
  output [3:0]  mmio_axi4_0_ar_bits_id,
  output [30:0] mmio_axi4_0_ar_bits_addr,
  output [7:0]  mmio_axi4_0_ar_bits_len,
  output [2:0]  mmio_axi4_0_ar_bits_size,
  output [1:0]  mmio_axi4_0_ar_bits_burst,
  output        mmio_axi4_0_ar_bits_lock,
  output [3:0]  mmio_axi4_0_ar_bits_cache,
  output [2:0]  mmio_axi4_0_ar_bits_prot,
  output [3:0]  mmio_axi4_0_ar_bits_qos,
  output        mmio_axi4_0_r_ready,
  input         mmio_axi4_0_r_valid,
  input  [3:0]  mmio_axi4_0_r_bits_id,
  input  [63:0] mmio_axi4_0_r_bits_data,
  input  [1:0]  mmio_axi4_0_r_bits_resp,
  input         mmio_axi4_0_r_bits_last,
  output        l2_frontend_bus_axi4_0_aw_ready,
  input         l2_frontend_bus_axi4_0_aw_valid,
  input  [7:0]  l2_frontend_bus_axi4_0_aw_bits_id,
  input  [31:0] l2_frontend_bus_axi4_0_aw_bits_addr,
  input  [7:0]  l2_frontend_bus_axi4_0_aw_bits_len,
  input  [2:0]  l2_frontend_bus_axi4_0_aw_bits_size,
  input  [1:0]  l2_frontend_bus_axi4_0_aw_bits_burst,
  input         l2_frontend_bus_axi4_0_aw_bits_lock,
  input  [3:0]  l2_frontend_bus_axi4_0_aw_bits_cache,
  input  [2:0]  l2_frontend_bus_axi4_0_aw_bits_prot,
  input  [3:0]  l2_frontend_bus_axi4_0_aw_bits_qos,
  output        l2_frontend_bus_axi4_0_w_ready,
  input         l2_frontend_bus_axi4_0_w_valid,
  input  [63:0] l2_frontend_bus_axi4_0_w_bits_data,
  input  [7:0]  l2_frontend_bus_axi4_0_w_bits_strb,
  input         l2_frontend_bus_axi4_0_w_bits_last,
  input         l2_frontend_bus_axi4_0_b_ready,
  output        l2_frontend_bus_axi4_0_b_valid,
  output [7:0]  l2_frontend_bus_axi4_0_b_bits_id,
  output [1:0]  l2_frontend_bus_axi4_0_b_bits_resp,
  output        l2_frontend_bus_axi4_0_ar_ready,
  input         l2_frontend_bus_axi4_0_ar_valid,
  input  [7:0]  l2_frontend_bus_axi4_0_ar_bits_id,
  input  [31:0] l2_frontend_bus_axi4_0_ar_bits_addr,
  input  [7:0]  l2_frontend_bus_axi4_0_ar_bits_len,
  input  [2:0]  l2_frontend_bus_axi4_0_ar_bits_size,
  input  [1:0]  l2_frontend_bus_axi4_0_ar_bits_burst,
  input         l2_frontend_bus_axi4_0_ar_bits_lock,
  input  [3:0]  l2_frontend_bus_axi4_0_ar_bits_cache,
  input  [2:0]  l2_frontend_bus_axi4_0_ar_bits_prot,
  input  [3:0]  l2_frontend_bus_axi4_0_ar_bits_qos,
  input         l2_frontend_bus_axi4_0_r_ready,
  output        l2_frontend_bus_axi4_0_r_valid,
  output [7:0]  l2_frontend_bus_axi4_0_r_bits_id,
  output [63:0] l2_frontend_bus_axi4_0_r_bits_data,
  output [1:0]  l2_frontend_bus_axi4_0_r_bits_resp,
  output        l2_frontend_bus_axi4_0_r_bits_last,
  input         resetctrl_hartIsInReset_0,
  input         debug_clock,
  input         debug_reset,
  input         debug_systemjtag_jtag_TCK,
  input         debug_systemjtag_jtag_TMS,
  input         debug_systemjtag_jtag_TDI,
  output        debug_systemjtag_jtag_TDO_data,
  output        debug_systemjtag_jtag_TDO_driven,
  input         debug_systemjtag_reset,
  input  [10:0] debug_systemjtag_mfr_id,
  input  [15:0] debug_systemjtag_part_number,
  input  [3:0]  debug_systemjtag_version,
  output        debug_ndreset,
  output        debug_dmactive,
  input         debug_dmactiveAck,
  input  [6:0]  interrupts
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  ibus_auto_int_bus_int_out_0;
  wire  ibus_auto_int_bus_int_out_1;
  wire  ibus_auto_int_bus_int_out_2;
  wire  ibus_auto_int_bus_int_out_3;
  wire  ibus_auto_int_bus_int_out_4;
  wire  ibus_auto_int_bus_int_out_5;
  wire  ibus_auto_int_bus_int_out_6;
  wire  ibus_auto_int_in_xing_in_sync_0;
  wire  ibus_auto_int_in_xing_in_sync_1;
  wire  ibus_auto_int_in_xing_in_sync_2;
  wire  ibus_auto_int_in_xing_in_sync_3;
  wire  ibus_auto_int_in_xing_in_sync_4;
  wire  ibus_auto_int_in_xing_in_sync_5;
  wire  ibus_auto_int_in_xing_in_sync_6;
  wire  ibus_auto_clock_in_clock;
  wire  ibus_int_bus_auto_int_in_0; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_in_1; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_in_2; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_in_3; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_in_4; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_in_5; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_in_6; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_out_0; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_out_1; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_out_2; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_out_3; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_out_4; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_out_5; // @[InterruptBus.scala 14:27]
  wire  ibus_int_bus_auto_int_out_6; // @[InterruptBus.scala 14:27]
  wire  ibus_intsink_clock; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_in_sync_0; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_in_sync_1; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_in_sync_2; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_in_sync_3; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_in_sync_4; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_in_sync_5; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_in_sync_6; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_out_0; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_out_1; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_out_2; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_out_3; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_out_4; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_out_5; // @[Crossing.scala 74:29]
  wire  ibus_intsink_auto_out_6; // @[Crossing.scala 74:29]
  wire  dummyClockGroupSourceNode_clock; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_reset; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_5_clock; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_5_reset; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_4_clock; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_4_reset; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_clock; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_reset; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_clock; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_reset; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_clock; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_reset; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_clock; // @[ClockGroup.scala 79:81]
  wire  dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_reset; // @[ClockGroup.scala 79:81]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id; // @[SystemBus.scala 24:26]
  wire [30:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id; // @[SystemBus.scala 24:26]
  wire [30:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_valid; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_param; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_address; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_valid; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size; // @[SystemBus.scala 24:26]
  wire [4:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_bufferable; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_modifiable; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_readalloc; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_writealloc; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_privileged; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_secure; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_fetch; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size; // @[SystemBus.scala 24:26]
  wire [4:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size; // @[SystemBus.scala 24:26]
  wire [4:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source; // @[SystemBus.scala 24:26]
  wire [31:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size; // @[SystemBus.scala 24:26]
  wire [4:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source; // @[SystemBus.scala 24:26]
  wire [27:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address; // @[SystemBus.scala 24:26]
  wire [7:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid; // @[SystemBus.scala 24:26]
  wire [2:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode; // @[SystemBus.scala 24:26]
  wire [1:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param; // @[SystemBus.scala 24:26]
  wire [3:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size; // @[SystemBus.scala 24:26]
  wire [4:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied; // @[SystemBus.scala 24:26]
  wire [63:0] subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_fixedClockNode_out_1_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_fixedClockNode_out_1_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_fixedClockNode_out_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock; // @[SystemBus.scala 24:26]
  wire  subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset; // @[SystemBus.scala 24:26]
  wire  subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_pbus_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id;
  wire [31:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst;
  wire [3:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_cache;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_prot;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid;
  wire [63:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id;
  wire [31:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst;
  wire [3:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_cache;
  wire [2:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_prot;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid;
  wire [7:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id;
  wire [63:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data;
  wire [1:0] subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp;
  wire  subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last;
  wire  subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_auto_bus_xing_out_a_ready;
  wire  subsystem_fbus_auto_bus_xing_out_a_valid;
  wire [2:0] subsystem_fbus_auto_bus_xing_out_a_bits_opcode;
  wire [2:0] subsystem_fbus_auto_bus_xing_out_a_bits_param;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_a_bits_size;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_a_bits_source;
  wire [31:0] subsystem_fbus_auto_bus_xing_out_a_bits_address;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_fetch;
  wire [7:0] subsystem_fbus_auto_bus_xing_out_a_bits_mask;
  wire [63:0] subsystem_fbus_auto_bus_xing_out_a_bits_data;
  wire  subsystem_fbus_auto_bus_xing_out_a_bits_corrupt;
  wire  subsystem_fbus_auto_bus_xing_out_d_ready;
  wire  subsystem_fbus_auto_bus_xing_out_d_valid;
  wire [2:0] subsystem_fbus_auto_bus_xing_out_d_bits_opcode;
  wire [1:0] subsystem_fbus_auto_bus_xing_out_d_bits_param;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_d_bits_size;
  wire [3:0] subsystem_fbus_auto_bus_xing_out_d_bits_source;
  wire [1:0] subsystem_fbus_auto_bus_xing_out_d_bits_sink;
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_denied;
  wire [63:0] subsystem_fbus_auto_bus_xing_out_d_bits_data;
  wire  subsystem_fbus_auto_bus_xing_out_d_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_clock;
  wire  subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_reset;
  wire  subsystem_fbus_clockGroup_auto_out_clock;
  wire  subsystem_fbus_clockGroup_auto_out_reset;
  wire  subsystem_fbus_fixedClockNode_auto_in_clock;
  wire  subsystem_fbus_fixedClockNode_auto_in_reset;
  wire  subsystem_fbus_fixedClockNode_auto_out_clock;
  wire  subsystem_fbus_fixedClockNode_auto_out_reset;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_opcode;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_source;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_address;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_fetch;
  wire [7:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_mask;
  wire [63:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_opcode;
  wire [1:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_source;
  wire [1:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_sink;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_denied;
  wire [63:0] subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_opcode;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_source;
  wire [31:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_address;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_bufferable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_modifiable;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_readalloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_writealloc;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_privileged;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_secure;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_fetch;
  wire [7:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_mask;
  wire [63:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_corrupt;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_ready;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_valid;
  wire [2:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_opcode;
  wire [1:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_param;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_size;
  wire [3:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_source;
  wire [1:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_sink;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_denied;
  wire [63:0] subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_data;
  wire  subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_corrupt;
  wire  subsystem_fbus_buffer_clock; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_reset; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] subsystem_fbus_buffer_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] subsystem_fbus_buffer_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] subsystem_fbus_buffer_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_bufferable; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_modifiable; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_readalloc; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_writealloc; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_privileged; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_secure; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_fetch; // @[Buffer.scala 68:28]
  wire [7:0] subsystem_fbus_buffer_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] subsystem_fbus_buffer_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] subsystem_fbus_buffer_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] subsystem_fbus_buffer_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] subsystem_fbus_buffer_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] subsystem_fbus_buffer_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] subsystem_fbus_buffer_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] subsystem_fbus_buffer_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] subsystem_fbus_buffer_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_bufferable; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_modifiable; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_readalloc; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_writealloc; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_privileged; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_secure; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_fetch; // @[Buffer.scala 68:28]
  wire [7:0] subsystem_fbus_buffer_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] subsystem_fbus_buffer_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] subsystem_fbus_buffer_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] subsystem_fbus_buffer_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [3:0] subsystem_fbus_buffer_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] subsystem_fbus_buffer_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] subsystem_fbus_buffer_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_buffer_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_clock; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_reset; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_ready; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_valid; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_id; // @[LazyModule.scala 432:27]
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_addr; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_len; // @[LazyModule.scala 432:27]
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_size; // @[LazyModule.scala 432:27]
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_burst; // @[LazyModule.scala 432:27]
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_cache; // @[LazyModule.scala 432:27]
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_prot; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_ready; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_valid; // @[LazyModule.scala 432:27]
  wire [63:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_data; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_strb; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_last; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_ready; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_valid; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_id; // @[LazyModule.scala 432:27]
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_resp; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_ready; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_valid; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_id; // @[LazyModule.scala 432:27]
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_addr; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_len; // @[LazyModule.scala 432:27]
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_size; // @[LazyModule.scala 432:27]
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_burst; // @[LazyModule.scala 432:27]
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_cache; // @[LazyModule.scala 432:27]
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_prot; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_ready; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_valid; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_id; // @[LazyModule.scala 432:27]
  wire [63:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_data; // @[LazyModule.scala 432:27]
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_resp; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_last; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_ready; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_valid; // @[LazyModule.scala 432:27]
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 432:27]
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_source; // @[LazyModule.scala 432:27]
  wire [31:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_address; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_privileged; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_secure; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_fetch; // @[LazyModule.scala 432:27]
  wire [7:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_mask; // @[LazyModule.scala 432:27]
  wire [63:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_data; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_ready; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_valid; // @[LazyModule.scala 432:27]
  wire [2:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_opcode; // @[LazyModule.scala 432:27]
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_param; // @[LazyModule.scala 432:27]
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_size; // @[LazyModule.scala 432:27]
  wire [3:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_source; // @[LazyModule.scala 432:27]
  wire [1:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_sink; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_denied; // @[LazyModule.scala 432:27]
  wire [63:0] subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_data; // @[LazyModule.scala 432:27]
  wire  subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_corrupt; // @[LazyModule.scala 432:27]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [16:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [11:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [25:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [27:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [8:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_2_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_2_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_fixedClockNode_out_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_a_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_a_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_bus_xing_in_a_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_bus_xing_in_a_bits_param; // @[PeripheryBus.scala 31:26]
  wire [3:0] subsystem_cbus_auto_bus_xing_in_a_bits_size; // @[PeripheryBus.scala 31:26]
  wire [4:0] subsystem_cbus_auto_bus_xing_in_a_bits_source; // @[PeripheryBus.scala 31:26]
  wire [27:0] subsystem_cbus_auto_bus_xing_in_a_bits_address; // @[PeripheryBus.scala 31:26]
  wire [7:0] subsystem_cbus_auto_bus_xing_in_a_bits_mask; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_bus_xing_in_a_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_a_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_ready; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_valid; // @[PeripheryBus.scala 31:26]
  wire [2:0] subsystem_cbus_auto_bus_xing_in_d_bits_opcode; // @[PeripheryBus.scala 31:26]
  wire [1:0] subsystem_cbus_auto_bus_xing_in_d_bits_param; // @[PeripheryBus.scala 31:26]
  wire [3:0] subsystem_cbus_auto_bus_xing_in_d_bits_size; // @[PeripheryBus.scala 31:26]
  wire [4:0] subsystem_cbus_auto_bus_xing_in_d_bits_source; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_sink; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_denied; // @[PeripheryBus.scala 31:26]
  wire [63:0] subsystem_cbus_auto_bus_xing_in_d_bits_data; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_auto_bus_xing_in_d_bits_corrupt; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_clock; // @[PeripheryBus.scala 31:26]
  wire  subsystem_cbus_reset; // @[PeripheryBus.scala 31:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id; // @[MemoryBus.scala 25:26]
  wire [31:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id; // @[MemoryBus.scala 25:26]
  wire [31:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid; // @[MemoryBus.scala 25:26]
  wire [3:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data; // @[MemoryBus.scala 25:26]
  wire [1:0] subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_valid; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_a_bits_opcode; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_a_bits_param; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_a_bits_size; // @[MemoryBus.scala 25:26]
  wire [6:0] subsystem_mbus_auto_bus_xing_in_a_bits_source; // @[MemoryBus.scala 25:26]
  wire [31:0] subsystem_mbus_auto_bus_xing_in_a_bits_address; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_bufferable; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_modifiable; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_readalloc; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_writealloc; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_privileged; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_secure; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_fetch; // @[MemoryBus.scala 25:26]
  wire [7:0] subsystem_mbus_auto_bus_xing_in_a_bits_mask; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_bus_xing_in_a_bits_data; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_ready; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_valid; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_d_bits_opcode; // @[MemoryBus.scala 25:26]
  wire [2:0] subsystem_mbus_auto_bus_xing_in_d_bits_size; // @[MemoryBus.scala 25:26]
  wire [6:0] subsystem_mbus_auto_bus_xing_in_d_bits_source; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_bits_denied; // @[MemoryBus.scala 25:26]
  wire [63:0] subsystem_mbus_auto_bus_xing_in_d_bits_data; // @[MemoryBus.scala 25:26]
  wire  subsystem_mbus_auto_bus_xing_in_d_bits_corrupt; // @[MemoryBus.scala 25:26]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size; // @[BankedL2Params.scala 47:31]
  wire [6:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_bufferable; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_modifiable; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_readalloc; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_writealloc; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_privileged; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_secure; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_fetch; // @[BankedL2Params.scala 47:31]
  wire [7:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size; // @[BankedL2Params.scala 47:31]
  wire [6:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_size; // @[BankedL2Params.scala 47:31]
  wire [4:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_source; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_address; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_bufferable; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_modifiable; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_readalloc; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_writealloc; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_privileged; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_secure; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_fetch; // @[BankedL2Params.scala 47:31]
  wire [7:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_mask; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_b_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_c_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_size; // @[BankedL2Params.scala 47:31]
  wire [4:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_source; // @[BankedL2Params.scala 47:31]
  wire [31:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_address; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_ready; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param; // @[BankedL2Params.scala 47:31]
  wire [2:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size; // @[BankedL2Params.scala 47:31]
  wire [4:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied; // @[BankedL2Params.scala 47:31]
  wire [63:0] subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_coherent_jbar_in_e_valid; // @[BankedL2Params.scala 47:31]
  wire [1:0] subsystem_l2_wrapper_auto_coherent_jbar_in_e_bits_sink; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_clock; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_reset; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_clock; // @[BankedL2Params.scala 47:31]
  wire  subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_reset; // @[BankedL2Params.scala 47:31]
  wire  tile_prci_domain_auto_intsink_in_sync_0; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tile_reset_domain_tile_hartid_in; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_ready; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_valid; // @[HasTiles.scala 251:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode; // @[HasTiles.scala 251:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param; // @[HasTiles.scala 251:38]
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size; // @[HasTiles.scala 251:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source; // @[HasTiles.scala 251:38]
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address; // @[HasTiles.scala 251:38]
  wire [7:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask; // @[HasTiles.scala 251:38]
  wire [63:0] tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_b_ready; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_b_valid; // @[HasTiles.scala 251:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_param; // @[HasTiles.scala 251:38]
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_address; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_ready; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_valid; // @[HasTiles.scala 251:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode; // @[HasTiles.scala 251:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param; // @[HasTiles.scala 251:38]
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size; // @[HasTiles.scala 251:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source; // @[HasTiles.scala 251:38]
  wire [31:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address; // @[HasTiles.scala 251:38]
  wire [63:0] tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_ready; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_valid; // @[HasTiles.scala 251:38]
  wire [2:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode; // @[HasTiles.scala 251:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param; // @[HasTiles.scala 251:38]
  wire [3:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size; // @[HasTiles.scala 251:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source; // @[HasTiles.scala 251:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied; // @[HasTiles.scala 251:38]
  wire [63:0] tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tl_master_clock_xing_out_e_valid; // @[HasTiles.scala 251:38]
  wire [1:0] tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tap_clock_in_clock; // @[HasTiles.scala 251:38]
  wire  tile_prci_domain_auto_tap_clock_in_reset; // @[HasTiles.scala 251:38]
  wire  plicDomainWrapper_auto_plic_int_in_0; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_in_1; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_in_2; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_in_3; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_in_4; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_in_5; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_in_6; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_out_1_0; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_int_out_0_0; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_in_a_ready; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_in_a_valid; // @[Plic.scala 358:39]
  wire [2:0] plicDomainWrapper_auto_plic_in_a_bits_opcode; // @[Plic.scala 358:39]
  wire [2:0] plicDomainWrapper_auto_plic_in_a_bits_param; // @[Plic.scala 358:39]
  wire [1:0] plicDomainWrapper_auto_plic_in_a_bits_size; // @[Plic.scala 358:39]
  wire [8:0] plicDomainWrapper_auto_plic_in_a_bits_source; // @[Plic.scala 358:39]
  wire [27:0] plicDomainWrapper_auto_plic_in_a_bits_address; // @[Plic.scala 358:39]
  wire [7:0] plicDomainWrapper_auto_plic_in_a_bits_mask; // @[Plic.scala 358:39]
  wire [63:0] plicDomainWrapper_auto_plic_in_a_bits_data; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_in_a_bits_corrupt; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_in_d_ready; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_plic_in_d_valid; // @[Plic.scala 358:39]
  wire [2:0] plicDomainWrapper_auto_plic_in_d_bits_opcode; // @[Plic.scala 358:39]
  wire [1:0] plicDomainWrapper_auto_plic_in_d_bits_size; // @[Plic.scala 358:39]
  wire [8:0] plicDomainWrapper_auto_plic_in_d_bits_source; // @[Plic.scala 358:39]
  wire [63:0] plicDomainWrapper_auto_plic_in_d_bits_data; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_clock_in_clock; // @[Plic.scala 358:39]
  wire  plicDomainWrapper_auto_clock_in_reset; // @[Plic.scala 358:39]
  wire  clint_clock; // @[CLINT.scala 105:27]
  wire  clint_reset; // @[CLINT.scala 105:27]
  wire  clint_auto_int_out_0; // @[CLINT.scala 105:27]
  wire  clint_auto_int_out_1; // @[CLINT.scala 105:27]
  wire  clint_auto_in_a_ready; // @[CLINT.scala 105:27]
  wire  clint_auto_in_a_valid; // @[CLINT.scala 105:27]
  wire [2:0] clint_auto_in_a_bits_opcode; // @[CLINT.scala 105:27]
  wire [2:0] clint_auto_in_a_bits_param; // @[CLINT.scala 105:27]
  wire [1:0] clint_auto_in_a_bits_size; // @[CLINT.scala 105:27]
  wire [8:0] clint_auto_in_a_bits_source; // @[CLINT.scala 105:27]
  wire [25:0] clint_auto_in_a_bits_address; // @[CLINT.scala 105:27]
  wire [7:0] clint_auto_in_a_bits_mask; // @[CLINT.scala 105:27]
  wire [63:0] clint_auto_in_a_bits_data; // @[CLINT.scala 105:27]
  wire  clint_auto_in_a_bits_corrupt; // @[CLINT.scala 105:27]
  wire  clint_auto_in_d_ready; // @[CLINT.scala 105:27]
  wire  clint_auto_in_d_valid; // @[CLINT.scala 105:27]
  wire [2:0] clint_auto_in_d_bits_opcode; // @[CLINT.scala 105:27]
  wire [1:0] clint_auto_in_d_bits_size; // @[CLINT.scala 105:27]
  wire [8:0] clint_auto_in_d_bits_source; // @[CLINT.scala 105:27]
  wire [63:0] clint_auto_in_d_bits_data; // @[CLINT.scala 105:27]
  wire  clint_io_rtcTick; // @[CLINT.scala 105:27]
  wire  tlDM_auto_dmInner_dmInner_tl_in_a_ready; // @[Periphery.scala 83:26]
  wire  tlDM_auto_dmInner_dmInner_tl_in_a_valid; // @[Periphery.scala 83:26]
  wire [2:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_opcode; // @[Periphery.scala 83:26]
  wire [2:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_param; // @[Periphery.scala 83:26]
  wire [1:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_size; // @[Periphery.scala 83:26]
  wire [8:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_source; // @[Periphery.scala 83:26]
  wire [11:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_address; // @[Periphery.scala 83:26]
  wire [7:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_mask; // @[Periphery.scala 83:26]
  wire [63:0] tlDM_auto_dmInner_dmInner_tl_in_a_bits_data; // @[Periphery.scala 83:26]
  wire  tlDM_auto_dmInner_dmInner_tl_in_a_bits_corrupt; // @[Periphery.scala 83:26]
  wire  tlDM_auto_dmInner_dmInner_tl_in_d_ready; // @[Periphery.scala 83:26]
  wire  tlDM_auto_dmInner_dmInner_tl_in_d_valid; // @[Periphery.scala 83:26]
  wire [2:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode; // @[Periphery.scala 83:26]
  wire [1:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_size; // @[Periphery.scala 83:26]
  wire [8:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_source; // @[Periphery.scala 83:26]
  wire [63:0] tlDM_auto_dmInner_dmInner_tl_in_d_bits_data; // @[Periphery.scala 83:26]
  wire  tlDM_auto_dmOuter_intsource_out_sync_0; // @[Periphery.scala 83:26]
  wire  tlDM_io_debug_clock; // @[Periphery.scala 83:26]
  wire  tlDM_io_debug_reset; // @[Periphery.scala 83:26]
  wire  tlDM_io_ctrl_ndreset; // @[Periphery.scala 83:26]
  wire  tlDM_io_ctrl_dmactive; // @[Periphery.scala 83:26]
  wire  tlDM_io_ctrl_dmactiveAck; // @[Periphery.scala 83:26]
  wire  tlDM_io_dmi_dmi_req_ready; // @[Periphery.scala 83:26]
  wire  tlDM_io_dmi_dmi_req_valid; // @[Periphery.scala 83:26]
  wire [6:0] tlDM_io_dmi_dmi_req_bits_addr; // @[Periphery.scala 83:26]
  wire [31:0] tlDM_io_dmi_dmi_req_bits_data; // @[Periphery.scala 83:26]
  wire [1:0] tlDM_io_dmi_dmi_req_bits_op; // @[Periphery.scala 83:26]
  wire  tlDM_io_dmi_dmi_resp_ready; // @[Periphery.scala 83:26]
  wire  tlDM_io_dmi_dmi_resp_valid; // @[Periphery.scala 83:26]
  wire [31:0] tlDM_io_dmi_dmi_resp_bits_data; // @[Periphery.scala 83:26]
  wire [1:0] tlDM_io_dmi_dmi_resp_bits_resp; // @[Periphery.scala 83:26]
  wire  tlDM_io_dmi_dmiClock; // @[Periphery.scala 83:26]
  wire  tlDM_io_dmi_dmiReset; // @[Periphery.scala 83:26]
  wire  tlDM_io_hartIsInReset_0; // @[Periphery.scala 83:26]
  wire  tileHartIdNexusNode_auto_out; // @[HasTiles.scala 158:39]
  wire  intsource_clock; // @[Crossing.scala 26:31]
  wire  intsource_reset; // @[Crossing.scala 26:31]
  wire  intsource_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_auto_in_1; // @[Crossing.scala 26:31]
  wire  intsource_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_auto_out_sync_1; // @[Crossing.scala 26:31]
  wire  intsource_1_clock; // @[Crossing.scala 26:31]
  wire  intsource_1_reset; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_2_clock; // @[Crossing.scala 26:31]
  wire  intsource_2_reset; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsink_1_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsource_3_clock; // @[Crossing.scala 26:31]
  wire  intsource_3_reset; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_1; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_2; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_3; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_4; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_5; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_6; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_1; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_2; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_3; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_4; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_5; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_6; // @[Crossing.scala 26:31]
  wire  bootROMDomainWrapper_auto_bootrom_in_a_ready; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_a_valid; // @[BootROM.scala 70:42]
  wire [2:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode; // @[BootROM.scala 70:42]
  wire [2:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_param; // @[BootROM.scala 70:42]
  wire [1:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_size; // @[BootROM.scala 70:42]
  wire [8:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_source; // @[BootROM.scala 70:42]
  wire [16:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_address; // @[BootROM.scala 70:42]
  wire [7:0] bootROMDomainWrapper_auto_bootrom_in_a_bits_mask; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_d_ready; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_bootrom_in_d_valid; // @[BootROM.scala 70:42]
  wire [1:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_size; // @[BootROM.scala 70:42]
  wire [8:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_source; // @[BootROM.scala 70:42]
  wire [63:0] bootROMDomainWrapper_auto_bootrom_in_d_bits_data; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_clock_in_clock; // @[BootROM.scala 70:42]
  wire  bootROMDomainWrapper_auto_clock_in_reset; // @[BootROM.scala 70:42]
  wire  dtm_io_jtag_clock; // @[Periphery.scala 158:21]
  wire  dtm_io_jtag_reset; // @[Periphery.scala 158:21]
  wire  dtm_io_dmi_req_ready; // @[Periphery.scala 158:21]
  wire  dtm_io_dmi_req_valid; // @[Periphery.scala 158:21]
  wire [6:0] dtm_io_dmi_req_bits_addr; // @[Periphery.scala 158:21]
  wire [31:0] dtm_io_dmi_req_bits_data; // @[Periphery.scala 158:21]
  wire [1:0] dtm_io_dmi_req_bits_op; // @[Periphery.scala 158:21]
  wire  dtm_io_dmi_resp_ready; // @[Periphery.scala 158:21]
  wire  dtm_io_dmi_resp_valid; // @[Periphery.scala 158:21]
  wire [31:0] dtm_io_dmi_resp_bits_data; // @[Periphery.scala 158:21]
  wire [1:0] dtm_io_dmi_resp_bits_resp; // @[Periphery.scala 158:21]
  wire  dtm_io_jtag_TMS; // @[Periphery.scala 158:21]
  wire  dtm_io_jtag_TDI; // @[Periphery.scala 158:21]
  wire  dtm_io_jtag_TDO_data; // @[Periphery.scala 158:21]
  wire  dtm_io_jtag_TDO_driven; // @[Periphery.scala 158:21]
  wire [10:0] dtm_io_jtag_mfr_id; // @[Periphery.scala 158:21]
  wire [15:0] dtm_io_jtag_part_number; // @[Periphery.scala 158:21]
  wire [3:0] dtm_io_jtag_version; // @[Periphery.scala 158:21]
  reg [6:0] int_rtc_tick_value; // @[Counter.scala 62:40]
  wire  int_rtc_tick_wrap_wrap = int_rtc_tick_value == 7'h63; // @[Counter.scala 74:24]
  wire [6:0] _int_rtc_tick_wrap_value_T_1 = int_rtc_tick_value + 7'h1; // @[Counter.scala 78:24]
  IntXbar ibus_int_bus ( // @[InterruptBus.scala 14:27]
    .auto_int_in_0(ibus_int_bus_auto_int_in_0),
    .auto_int_in_1(ibus_int_bus_auto_int_in_1),
    .auto_int_in_2(ibus_int_bus_auto_int_in_2),
    .auto_int_in_3(ibus_int_bus_auto_int_in_3),
    .auto_int_in_4(ibus_int_bus_auto_int_in_4),
    .auto_int_in_5(ibus_int_bus_auto_int_in_5),
    .auto_int_in_6(ibus_int_bus_auto_int_in_6),
    .auto_int_out_0(ibus_int_bus_auto_int_out_0),
    .auto_int_out_1(ibus_int_bus_auto_int_out_1),
    .auto_int_out_2(ibus_int_bus_auto_int_out_2),
    .auto_int_out_3(ibus_int_bus_auto_int_out_3),
    .auto_int_out_4(ibus_int_bus_auto_int_out_4),
    .auto_int_out_5(ibus_int_bus_auto_int_out_5),
    .auto_int_out_6(ibus_int_bus_auto_int_out_6)
  );
  IntSyncAsyncCrossingSink ibus_intsink ( // @[Crossing.scala 74:29]
    .clock(ibus_intsink_clock),
    .auto_in_sync_0(ibus_intsink_auto_in_sync_0),
    .auto_in_sync_1(ibus_intsink_auto_in_sync_1),
    .auto_in_sync_2(ibus_intsink_auto_in_sync_2),
    .auto_in_sync_3(ibus_intsink_auto_in_sync_3),
    .auto_in_sync_4(ibus_intsink_auto_in_sync_4),
    .auto_in_sync_5(ibus_intsink_auto_in_sync_5),
    .auto_in_sync_6(ibus_intsink_auto_in_sync_6),
    .auto_out_0(ibus_intsink_auto_out_0),
    .auto_out_1(ibus_intsink_auto_out_1),
    .auto_out_2(ibus_intsink_auto_out_2),
    .auto_out_3(ibus_intsink_auto_out_3),
    .auto_out_4(ibus_intsink_auto_out_4),
    .auto_out_5(ibus_intsink_auto_out_5),
    .auto_out_6(ibus_intsink_auto_out_6)
  );
  SimpleClockGroupSource dummyClockGroupSourceNode ( // @[ClockGroup.scala 79:81]
    .clock(dummyClockGroupSourceNode_clock),
    .reset(dummyClockGroupSourceNode_reset),
    .auto_out_member_subsystem_sbus_5_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_5_clock),
    .auto_out_member_subsystem_sbus_5_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_5_reset),
    .auto_out_member_subsystem_sbus_4_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_4_clock),
    .auto_out_member_subsystem_sbus_4_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_4_reset),
    .auto_out_member_subsystem_sbus_3_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_clock),
    .auto_out_member_subsystem_sbus_3_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_reset),
    .auto_out_member_subsystem_sbus_2_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_clock),
    .auto_out_member_subsystem_sbus_2_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_reset),
    .auto_out_member_subsystem_sbus_1_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_clock),
    .auto_out_member_subsystem_sbus_1_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_reset),
    .auto_out_member_subsystem_sbus_0_clock(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_clock),
    .auto_out_member_subsystem_sbus_0_reset(dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_reset)
  );
  SystemBus subsystem_sbus ( // @[SystemBus.scala 24:26]
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp),
    .auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last(
      subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_ready(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_ready),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data),
    .auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt),
    .auto_coupler_from_tile_tl_master_clock_xing_in_b_ready(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_ready),
    .auto_coupler_from_tile_tl_master_clock_xing_in_b_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_param(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_param),
    .auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_address(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_address),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_ready(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_ready),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data),
    .auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_ready(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_ready),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data),
    .auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_coupler_from_tile_tl_master_clock_xing_in_e_valid(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_valid),
    .auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink(
      subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_bufferable(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_bufferable),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_modifiable(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_modifiable),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_readalloc(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_readalloc),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_writealloc(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_writealloc),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_privileged(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_privileged),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_secure(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_secure),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_fetch(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_fetch),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt(
      subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt(
      subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt),
    .auto_fixedClockNode_out_1_clock(subsystem_sbus_auto_fixedClockNode_out_1_clock),
    .auto_fixedClockNode_out_1_reset(subsystem_sbus_auto_fixedClockNode_out_1_reset),
    .auto_fixedClockNode_out_0_clock(subsystem_sbus_auto_fixedClockNode_out_0_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset),
    .auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_clock),
    .auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_reset),
    .auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_clock),
    .auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_reset),
    .auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock),
    .auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock),
    .auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset(
      subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset)
  );
  PeripheryBus subsystem_pbus ( // @[PeripheryBus.scala 31:26]
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock(
      subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset(
      subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .clock(subsystem_pbus_clock),
    .reset(subsystem_pbus_reset)
  );
  TLBuffer_2 subsystem_fbus_buffer ( // @[Buffer.scala 68:28]
    .clock(subsystem_fbus_buffer_clock),
    .reset(subsystem_fbus_buffer_reset),
    .auto_in_a_ready(subsystem_fbus_buffer_auto_in_a_ready),
    .auto_in_a_valid(subsystem_fbus_buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(subsystem_fbus_buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(subsystem_fbus_buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(subsystem_fbus_buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(subsystem_fbus_buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(subsystem_fbus_buffer_auto_in_a_bits_address),
    .auto_in_a_bits_user_amba_prot_bufferable(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_bufferable),
    .auto_in_a_bits_user_amba_prot_modifiable(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_modifiable),
    .auto_in_a_bits_user_amba_prot_readalloc(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_readalloc),
    .auto_in_a_bits_user_amba_prot_writealloc(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_writealloc),
    .auto_in_a_bits_user_amba_prot_privileged(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_privileged),
    .auto_in_a_bits_user_amba_prot_secure(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_secure),
    .auto_in_a_bits_user_amba_prot_fetch(subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_fetch),
    .auto_in_a_bits_mask(subsystem_fbus_buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(subsystem_fbus_buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(subsystem_fbus_buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(subsystem_fbus_buffer_auto_in_d_ready),
    .auto_in_d_valid(subsystem_fbus_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(subsystem_fbus_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(subsystem_fbus_buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(subsystem_fbus_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(subsystem_fbus_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(subsystem_fbus_buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(subsystem_fbus_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(subsystem_fbus_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(subsystem_fbus_buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(subsystem_fbus_buffer_auto_out_a_ready),
    .auto_out_a_valid(subsystem_fbus_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(subsystem_fbus_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(subsystem_fbus_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(subsystem_fbus_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(subsystem_fbus_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(subsystem_fbus_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_user_amba_prot_bufferable(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_bufferable),
    .auto_out_a_bits_user_amba_prot_modifiable(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_modifiable),
    .auto_out_a_bits_user_amba_prot_readalloc(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_readalloc),
    .auto_out_a_bits_user_amba_prot_writealloc(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_writealloc),
    .auto_out_a_bits_user_amba_prot_privileged(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_privileged),
    .auto_out_a_bits_user_amba_prot_secure(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_secure),
    .auto_out_a_bits_user_amba_prot_fetch(subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_fetch),
    .auto_out_a_bits_mask(subsystem_fbus_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(subsystem_fbus_buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(subsystem_fbus_buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(subsystem_fbus_buffer_auto_out_d_ready),
    .auto_out_d_valid(subsystem_fbus_buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(subsystem_fbus_buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(subsystem_fbus_buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(subsystem_fbus_buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(subsystem_fbus_buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(subsystem_fbus_buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(subsystem_fbus_buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(subsystem_fbus_buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(subsystem_fbus_buffer_auto_out_d_bits_corrupt)
  );
  TLInterconnectCoupler_5 subsystem_fbus_coupler_from_port_named_slave_port_axi4 ( // @[LazyModule.scala 432:27]
    .clock(subsystem_fbus_coupler_from_port_named_slave_port_axi4_clock),
    .reset(subsystem_fbus_coupler_from_port_named_slave_port_axi4_reset),
    .auto_axi4index_in_aw_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_ready),
    .auto_axi4index_in_aw_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_valid),
    .auto_axi4index_in_aw_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_id),
    .auto_axi4index_in_aw_bits_addr(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_addr),
    .auto_axi4index_in_aw_bits_len(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_len)
      ,
    .auto_axi4index_in_aw_bits_size(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_size),
    .auto_axi4index_in_aw_bits_burst(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_burst),
    .auto_axi4index_in_aw_bits_cache(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_cache),
    .auto_axi4index_in_aw_bits_prot(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_prot),
    .auto_axi4index_in_w_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_ready),
    .auto_axi4index_in_w_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_valid),
    .auto_axi4index_in_w_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_data)
      ,
    .auto_axi4index_in_w_bits_strb(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_strb)
      ,
    .auto_axi4index_in_w_bits_last(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_last)
      ,
    .auto_axi4index_in_b_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_ready),
    .auto_axi4index_in_b_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_valid),
    .auto_axi4index_in_b_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_id),
    .auto_axi4index_in_b_bits_resp(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_resp)
      ,
    .auto_axi4index_in_ar_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_ready),
    .auto_axi4index_in_ar_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_valid),
    .auto_axi4index_in_ar_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_id),
    .auto_axi4index_in_ar_bits_addr(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_addr),
    .auto_axi4index_in_ar_bits_len(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_len)
      ,
    .auto_axi4index_in_ar_bits_size(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_size),
    .auto_axi4index_in_ar_bits_burst(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_burst),
    .auto_axi4index_in_ar_bits_cache(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_cache),
    .auto_axi4index_in_ar_bits_prot(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_prot),
    .auto_axi4index_in_r_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_ready),
    .auto_axi4index_in_r_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_valid),
    .auto_axi4index_in_r_bits_id(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_id),
    .auto_axi4index_in_r_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_data)
      ,
    .auto_axi4index_in_r_bits_resp(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_resp)
      ,
    .auto_axi4index_in_r_bits_last(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_last)
      ,
    .auto_tl_out_a_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_ready),
    .auto_tl_out_a_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_user_amba_prot_bufferable(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable),
    .auto_tl_out_a_bits_user_amba_prot_modifiable(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable),
    .auto_tl_out_a_bits_user_amba_prot_readalloc(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc),
    .auto_tl_out_a_bits_user_amba_prot_writealloc(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc),
    .auto_tl_out_a_bits_user_amba_prot_privileged(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_privileged),
    .auto_tl_out_a_bits_user_amba_prot_secure(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_secure),
    .auto_tl_out_a_bits_user_amba_prot_fetch(
      subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_fetch),
    .auto_tl_out_a_bits_mask(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_d_ready(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_ready),
    .auto_tl_out_d_valid(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_valid),
    .auto_tl_out_d_bits_opcode(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_opcode),
    .auto_tl_out_d_bits_param(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_param),
    .auto_tl_out_d_bits_size(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_size),
    .auto_tl_out_d_bits_source(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_source),
    .auto_tl_out_d_bits_sink(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_sink),
    .auto_tl_out_d_bits_denied(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_denied),
    .auto_tl_out_d_bits_data(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_data),
    .auto_tl_out_d_bits_corrupt(subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_corrupt)
  );
  PeripheryBus_1 subsystem_cbus ( // @[PeripheryBus.scala 31:26]
    .auto_coupler_to_bootrom_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready),
    .auto_coupler_to_bootrom_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_param(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_size(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_mask(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_bootrom_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready),
    .auto_coupler_to_bootrom_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_size(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_data(
      subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready),
    .auto_coupler_to_debug_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid),
    .auto_coupler_to_debug_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param)
      ,
    .auto_coupler_to_debug_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size),
    .auto_coupler_to_debug_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source),
    .auto_coupler_to_debug_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address),
    .auto_coupler_to_debug_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask),
    .auto_coupler_to_debug_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_debug_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready),
    .auto_coupler_to_debug_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid),
    .auto_coupler_to_debug_fragmenter_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size),
    .auto_coupler_to_debug_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source),
    .auto_coupler_to_debug_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready),
    .auto_coupler_to_clint_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid),
    .auto_coupler_to_clint_fragmenter_out_a_bits_opcode(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param)
      ,
    .auto_coupler_to_clint_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size),
    .auto_coupler_to_clint_fragmenter_out_a_bits_source(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source),
    .auto_coupler_to_clint_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address),
    .auto_coupler_to_clint_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask),
    .auto_coupler_to_clint_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_clint_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready),
    .auto_coupler_to_clint_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid),
    .auto_coupler_to_clint_fragmenter_out_d_bits_opcode(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size),
    .auto_coupler_to_clint_fragmenter_out_d_bits_source(
      subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source),
    .auto_coupler_to_clint_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_ready(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready),
    .auto_coupler_to_plic_fragmenter_out_a_valid(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid),
    .auto_coupler_to_plic_fragmenter_out_a_bits_opcode(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode)
      ,
    .auto_coupler_to_plic_fragmenter_out_a_bits_param(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param),
    .auto_coupler_to_plic_fragmenter_out_a_bits_size(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size),
    .auto_coupler_to_plic_fragmenter_out_a_bits_source(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source)
      ,
    .auto_coupler_to_plic_fragmenter_out_a_bits_address(
      subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address),
    .auto_coupler_to_plic_fragmenter_out_a_bits_mask(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask),
    .auto_coupler_to_plic_fragmenter_out_a_bits_data(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_bits_corrupt(
      subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_plic_fragmenter_out_d_ready(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready),
    .auto_coupler_to_plic_fragmenter_out_d_valid(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid),
    .auto_coupler_to_plic_fragmenter_out_d_bits_opcode(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode)
      ,
    .auto_coupler_to_plic_fragmenter_out_d_bits_size(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size),
    .auto_coupler_to_plic_fragmenter_out_d_bits_source(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source)
      ,
    .auto_coupler_to_plic_fragmenter_out_d_bits_data(subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data),
    .auto_fixedClockNode_out_2_clock(subsystem_cbus_auto_fixedClockNode_out_2_clock),
    .auto_fixedClockNode_out_2_reset(subsystem_cbus_auto_fixedClockNode_out_2_reset),
    .auto_fixedClockNode_out_0_clock(subsystem_cbus_auto_fixedClockNode_out_0_clock),
    .auto_fixedClockNode_out_0_reset(subsystem_cbus_auto_fixedClockNode_out_0_reset),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset),
    .auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock),
    .auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset(
      subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset),
    .auto_bus_xing_in_a_ready(subsystem_cbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(subsystem_cbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(subsystem_cbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(subsystem_cbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(subsystem_cbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(subsystem_cbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(subsystem_cbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_mask(subsystem_cbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(subsystem_cbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt(subsystem_cbus_auto_bus_xing_in_a_bits_corrupt),
    .auto_bus_xing_in_d_ready(subsystem_cbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(subsystem_cbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(subsystem_cbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param(subsystem_cbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size(subsystem_cbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(subsystem_cbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink(subsystem_cbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied(subsystem_cbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(subsystem_cbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(subsystem_cbus_auto_bus_xing_in_d_bits_corrupt),
    .clock(subsystem_cbus_clock),
    .reset(subsystem_cbus_reset)
  );
  MemoryBus subsystem_mbus ( // @[MemoryBus.scala 25:26]
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp),
    .auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last(
      subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock(
      subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset(
      subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset),
    .auto_bus_xing_in_a_ready(subsystem_mbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid(subsystem_mbus_auto_bus_xing_in_a_valid),
    .auto_bus_xing_in_a_bits_opcode(subsystem_mbus_auto_bus_xing_in_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param(subsystem_mbus_auto_bus_xing_in_a_bits_param),
    .auto_bus_xing_in_a_bits_size(subsystem_mbus_auto_bus_xing_in_a_bits_size),
    .auto_bus_xing_in_a_bits_source(subsystem_mbus_auto_bus_xing_in_a_bits_source),
    .auto_bus_xing_in_a_bits_address(subsystem_mbus_auto_bus_xing_in_a_bits_address),
    .auto_bus_xing_in_a_bits_user_amba_prot_bufferable(subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_bufferable)
      ,
    .auto_bus_xing_in_a_bits_user_amba_prot_modifiable(subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_modifiable)
      ,
    .auto_bus_xing_in_a_bits_user_amba_prot_readalloc(subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_readalloc),
    .auto_bus_xing_in_a_bits_user_amba_prot_writealloc(subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_writealloc)
      ,
    .auto_bus_xing_in_a_bits_user_amba_prot_privileged(subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_privileged)
      ,
    .auto_bus_xing_in_a_bits_user_amba_prot_secure(subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_secure),
    .auto_bus_xing_in_a_bits_user_amba_prot_fetch(subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_fetch),
    .auto_bus_xing_in_a_bits_mask(subsystem_mbus_auto_bus_xing_in_a_bits_mask),
    .auto_bus_xing_in_a_bits_data(subsystem_mbus_auto_bus_xing_in_a_bits_data),
    .auto_bus_xing_in_d_ready(subsystem_mbus_auto_bus_xing_in_d_ready),
    .auto_bus_xing_in_d_valid(subsystem_mbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode(subsystem_mbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_size(subsystem_mbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source(subsystem_mbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_denied(subsystem_mbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data(subsystem_mbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt(subsystem_mbus_auto_bus_xing_in_d_bits_corrupt)
  );
  CoherenceManagerWrapper subsystem_l2_wrapper ( // @[BankedL2Params.scala 47:31]
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_bufferable(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_bufferable),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_modifiable(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_modifiable),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_readalloc(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_readalloc),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_writealloc(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_writealloc),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_privileged(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_privileged),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_secure(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_secure),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_fetch(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_fetch),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt(
      subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt),
    .auto_coherent_jbar_in_a_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready),
    .auto_coherent_jbar_in_a_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_a_valid),
    .auto_coherent_jbar_in_a_bits_opcode(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_opcode),
    .auto_coherent_jbar_in_a_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_param),
    .auto_coherent_jbar_in_a_bits_size(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_size),
    .auto_coherent_jbar_in_a_bits_source(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_source),
    .auto_coherent_jbar_in_a_bits_address(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_address),
    .auto_coherent_jbar_in_a_bits_user_amba_prot_bufferable(
      subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_bufferable),
    .auto_coherent_jbar_in_a_bits_user_amba_prot_modifiable(
      subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_modifiable),
    .auto_coherent_jbar_in_a_bits_user_amba_prot_readalloc(
      subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_readalloc),
    .auto_coherent_jbar_in_a_bits_user_amba_prot_writealloc(
      subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_writealloc),
    .auto_coherent_jbar_in_a_bits_user_amba_prot_privileged(
      subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_privileged),
    .auto_coherent_jbar_in_a_bits_user_amba_prot_secure(
      subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_secure),
    .auto_coherent_jbar_in_a_bits_user_amba_prot_fetch(
      subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_fetch),
    .auto_coherent_jbar_in_a_bits_mask(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_mask),
    .auto_coherent_jbar_in_a_bits_data(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_data),
    .auto_coherent_jbar_in_a_bits_corrupt(subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_corrupt),
    .auto_coherent_jbar_in_b_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_b_ready),
    .auto_coherent_jbar_in_b_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid),
    .auto_coherent_jbar_in_b_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param),
    .auto_coherent_jbar_in_b_bits_address(subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address),
    .auto_coherent_jbar_in_c_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready),
    .auto_coherent_jbar_in_c_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_c_valid),
    .auto_coherent_jbar_in_c_bits_opcode(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_opcode),
    .auto_coherent_jbar_in_c_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_param),
    .auto_coherent_jbar_in_c_bits_size(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_size),
    .auto_coherent_jbar_in_c_bits_source(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_source),
    .auto_coherent_jbar_in_c_bits_address(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_address),
    .auto_coherent_jbar_in_c_bits_data(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_data),
    .auto_coherent_jbar_in_c_bits_corrupt(subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_corrupt),
    .auto_coherent_jbar_in_d_ready(subsystem_l2_wrapper_auto_coherent_jbar_in_d_ready),
    .auto_coherent_jbar_in_d_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid),
    .auto_coherent_jbar_in_d_bits_opcode(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode),
    .auto_coherent_jbar_in_d_bits_param(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param),
    .auto_coherent_jbar_in_d_bits_size(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size),
    .auto_coherent_jbar_in_d_bits_source(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source),
    .auto_coherent_jbar_in_d_bits_sink(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink),
    .auto_coherent_jbar_in_d_bits_denied(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied),
    .auto_coherent_jbar_in_d_bits_data(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data),
    .auto_coherent_jbar_in_d_bits_corrupt(subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt),
    .auto_coherent_jbar_in_e_valid(subsystem_l2_wrapper_auto_coherent_jbar_in_e_valid),
    .auto_coherent_jbar_in_e_bits_sink(subsystem_l2_wrapper_auto_coherent_jbar_in_e_bits_sink),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_clock(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_clock),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_reset(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_reset),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset),
    .auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_clock(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_clock),
    .auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_reset(
      subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_reset)
  );
  TilePRCIDomain tile_prci_domain ( // @[HasTiles.scala 251:38]
    .auto_intsink_in_sync_0(tile_prci_domain_auto_intsink_in_sync_0),
    .auto_tile_reset_domain_tile_hartid_in(tile_prci_domain_auto_tile_reset_domain_tile_hartid_in),
    .auto_int_out_clock_xing_out_2_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0),
    .auto_int_out_clock_xing_out_1_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0),
    .auto_int_out_clock_xing_out_0_sync_0(tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0),
    .auto_int_in_clock_xing_in_2_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0),
    .auto_int_in_clock_xing_in_1_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0),
    .auto_int_in_clock_xing_in_0_sync_0(tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0),
    .auto_int_in_clock_xing_in_0_sync_1(tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1),
    .auto_tl_master_clock_xing_out_a_ready(tile_prci_domain_auto_tl_master_clock_xing_out_a_ready),
    .auto_tl_master_clock_xing_out_a_valid(tile_prci_domain_auto_tl_master_clock_xing_out_a_valid),
    .auto_tl_master_clock_xing_out_a_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode),
    .auto_tl_master_clock_xing_out_a_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param),
    .auto_tl_master_clock_xing_out_a_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size),
    .auto_tl_master_clock_xing_out_a_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source),
    .auto_tl_master_clock_xing_out_a_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address),
    .auto_tl_master_clock_xing_out_a_bits_mask(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask),
    .auto_tl_master_clock_xing_out_a_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data),
    .auto_tl_master_clock_xing_out_a_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt),
    .auto_tl_master_clock_xing_out_b_ready(tile_prci_domain_auto_tl_master_clock_xing_out_b_ready),
    .auto_tl_master_clock_xing_out_b_valid(tile_prci_domain_auto_tl_master_clock_xing_out_b_valid),
    .auto_tl_master_clock_xing_out_b_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_param),
    .auto_tl_master_clock_xing_out_b_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_address),
    .auto_tl_master_clock_xing_out_c_ready(tile_prci_domain_auto_tl_master_clock_xing_out_c_ready),
    .auto_tl_master_clock_xing_out_c_valid(tile_prci_domain_auto_tl_master_clock_xing_out_c_valid),
    .auto_tl_master_clock_xing_out_c_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode),
    .auto_tl_master_clock_xing_out_c_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param),
    .auto_tl_master_clock_xing_out_c_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size),
    .auto_tl_master_clock_xing_out_c_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source),
    .auto_tl_master_clock_xing_out_c_bits_address(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address),
    .auto_tl_master_clock_xing_out_c_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data),
    .auto_tl_master_clock_xing_out_c_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt),
    .auto_tl_master_clock_xing_out_d_ready(tile_prci_domain_auto_tl_master_clock_xing_out_d_ready),
    .auto_tl_master_clock_xing_out_d_valid(tile_prci_domain_auto_tl_master_clock_xing_out_d_valid),
    .auto_tl_master_clock_xing_out_d_bits_opcode(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode),
    .auto_tl_master_clock_xing_out_d_bits_param(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param),
    .auto_tl_master_clock_xing_out_d_bits_size(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size),
    .auto_tl_master_clock_xing_out_d_bits_source(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source),
    .auto_tl_master_clock_xing_out_d_bits_sink(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink),
    .auto_tl_master_clock_xing_out_d_bits_denied(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied),
    .auto_tl_master_clock_xing_out_d_bits_data(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data),
    .auto_tl_master_clock_xing_out_d_bits_corrupt(tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt),
    .auto_tl_master_clock_xing_out_e_valid(tile_prci_domain_auto_tl_master_clock_xing_out_e_valid),
    .auto_tl_master_clock_xing_out_e_bits_sink(tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink),
    .auto_tap_clock_in_clock(tile_prci_domain_auto_tap_clock_in_clock),
    .auto_tap_clock_in_reset(tile_prci_domain_auto_tap_clock_in_reset)
  );
  ClockSinkDomain plicDomainWrapper ( // @[Plic.scala 358:39]
    .auto_plic_int_in_0(plicDomainWrapper_auto_plic_int_in_0),
    .auto_plic_int_in_1(plicDomainWrapper_auto_plic_int_in_1),
    .auto_plic_int_in_2(plicDomainWrapper_auto_plic_int_in_2),
    .auto_plic_int_in_3(plicDomainWrapper_auto_plic_int_in_3),
    .auto_plic_int_in_4(plicDomainWrapper_auto_plic_int_in_4),
    .auto_plic_int_in_5(plicDomainWrapper_auto_plic_int_in_5),
    .auto_plic_int_in_6(plicDomainWrapper_auto_plic_int_in_6),
    .auto_plic_int_out_1_0(plicDomainWrapper_auto_plic_int_out_1_0),
    .auto_plic_int_out_0_0(plicDomainWrapper_auto_plic_int_out_0_0),
    .auto_plic_in_a_ready(plicDomainWrapper_auto_plic_in_a_ready),
    .auto_plic_in_a_valid(plicDomainWrapper_auto_plic_in_a_valid),
    .auto_plic_in_a_bits_opcode(plicDomainWrapper_auto_plic_in_a_bits_opcode),
    .auto_plic_in_a_bits_param(plicDomainWrapper_auto_plic_in_a_bits_param),
    .auto_plic_in_a_bits_size(plicDomainWrapper_auto_plic_in_a_bits_size),
    .auto_plic_in_a_bits_source(plicDomainWrapper_auto_plic_in_a_bits_source),
    .auto_plic_in_a_bits_address(plicDomainWrapper_auto_plic_in_a_bits_address),
    .auto_plic_in_a_bits_mask(plicDomainWrapper_auto_plic_in_a_bits_mask),
    .auto_plic_in_a_bits_data(plicDomainWrapper_auto_plic_in_a_bits_data),
    .auto_plic_in_a_bits_corrupt(plicDomainWrapper_auto_plic_in_a_bits_corrupt),
    .auto_plic_in_d_ready(plicDomainWrapper_auto_plic_in_d_ready),
    .auto_plic_in_d_valid(plicDomainWrapper_auto_plic_in_d_valid),
    .auto_plic_in_d_bits_opcode(plicDomainWrapper_auto_plic_in_d_bits_opcode),
    .auto_plic_in_d_bits_size(plicDomainWrapper_auto_plic_in_d_bits_size),
    .auto_plic_in_d_bits_source(plicDomainWrapper_auto_plic_in_d_bits_source),
    .auto_plic_in_d_bits_data(plicDomainWrapper_auto_plic_in_d_bits_data),
    .auto_clock_in_clock(plicDomainWrapper_auto_clock_in_clock),
    .auto_clock_in_reset(plicDomainWrapper_auto_clock_in_reset)
  );
  CLINT clint ( // @[CLINT.scala 105:27]
    .clock(clint_clock),
    .reset(clint_reset),
    .auto_int_out_0(clint_auto_int_out_0),
    .auto_int_out_1(clint_auto_int_out_1),
    .auto_in_a_ready(clint_auto_in_a_ready),
    .auto_in_a_valid(clint_auto_in_a_valid),
    .auto_in_a_bits_opcode(clint_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(clint_auto_in_a_bits_param),
    .auto_in_a_bits_size(clint_auto_in_a_bits_size),
    .auto_in_a_bits_source(clint_auto_in_a_bits_source),
    .auto_in_a_bits_address(clint_auto_in_a_bits_address),
    .auto_in_a_bits_mask(clint_auto_in_a_bits_mask),
    .auto_in_a_bits_data(clint_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(clint_auto_in_a_bits_corrupt),
    .auto_in_d_ready(clint_auto_in_d_ready),
    .auto_in_d_valid(clint_auto_in_d_valid),
    .auto_in_d_bits_opcode(clint_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(clint_auto_in_d_bits_size),
    .auto_in_d_bits_source(clint_auto_in_d_bits_source),
    .auto_in_d_bits_data(clint_auto_in_d_bits_data),
    .io_rtcTick(clint_io_rtcTick)
  );
  TLDebugModule tlDM ( // @[Periphery.scala 83:26]
    .auto_dmInner_dmInner_tl_in_a_ready(tlDM_auto_dmInner_dmInner_tl_in_a_ready),
    .auto_dmInner_dmInner_tl_in_a_valid(tlDM_auto_dmInner_dmInner_tl_in_a_valid),
    .auto_dmInner_dmInner_tl_in_a_bits_opcode(tlDM_auto_dmInner_dmInner_tl_in_a_bits_opcode),
    .auto_dmInner_dmInner_tl_in_a_bits_param(tlDM_auto_dmInner_dmInner_tl_in_a_bits_param),
    .auto_dmInner_dmInner_tl_in_a_bits_size(tlDM_auto_dmInner_dmInner_tl_in_a_bits_size),
    .auto_dmInner_dmInner_tl_in_a_bits_source(tlDM_auto_dmInner_dmInner_tl_in_a_bits_source),
    .auto_dmInner_dmInner_tl_in_a_bits_address(tlDM_auto_dmInner_dmInner_tl_in_a_bits_address),
    .auto_dmInner_dmInner_tl_in_a_bits_mask(tlDM_auto_dmInner_dmInner_tl_in_a_bits_mask),
    .auto_dmInner_dmInner_tl_in_a_bits_data(tlDM_auto_dmInner_dmInner_tl_in_a_bits_data),
    .auto_dmInner_dmInner_tl_in_a_bits_corrupt(tlDM_auto_dmInner_dmInner_tl_in_a_bits_corrupt),
    .auto_dmInner_dmInner_tl_in_d_ready(tlDM_auto_dmInner_dmInner_tl_in_d_ready),
    .auto_dmInner_dmInner_tl_in_d_valid(tlDM_auto_dmInner_dmInner_tl_in_d_valid),
    .auto_dmInner_dmInner_tl_in_d_bits_opcode(tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode),
    .auto_dmInner_dmInner_tl_in_d_bits_size(tlDM_auto_dmInner_dmInner_tl_in_d_bits_size),
    .auto_dmInner_dmInner_tl_in_d_bits_source(tlDM_auto_dmInner_dmInner_tl_in_d_bits_source),
    .auto_dmInner_dmInner_tl_in_d_bits_data(tlDM_auto_dmInner_dmInner_tl_in_d_bits_data),
    .auto_dmOuter_intsource_out_sync_0(tlDM_auto_dmOuter_intsource_out_sync_0),
    .io_debug_clock(tlDM_io_debug_clock),
    .io_debug_reset(tlDM_io_debug_reset),
    .io_ctrl_ndreset(tlDM_io_ctrl_ndreset),
    .io_ctrl_dmactive(tlDM_io_ctrl_dmactive),
    .io_ctrl_dmactiveAck(tlDM_io_ctrl_dmactiveAck),
    .io_dmi_dmi_req_ready(tlDM_io_dmi_dmi_req_ready),
    .io_dmi_dmi_req_valid(tlDM_io_dmi_dmi_req_valid),
    .io_dmi_dmi_req_bits_addr(tlDM_io_dmi_dmi_req_bits_addr),
    .io_dmi_dmi_req_bits_data(tlDM_io_dmi_dmi_req_bits_data),
    .io_dmi_dmi_req_bits_op(tlDM_io_dmi_dmi_req_bits_op),
    .io_dmi_dmi_resp_ready(tlDM_io_dmi_dmi_resp_ready),
    .io_dmi_dmi_resp_valid(tlDM_io_dmi_dmi_resp_valid),
    .io_dmi_dmi_resp_bits_data(tlDM_io_dmi_dmi_resp_bits_data),
    .io_dmi_dmi_resp_bits_resp(tlDM_io_dmi_dmi_resp_bits_resp),
    .io_dmi_dmiClock(tlDM_io_dmi_dmiClock),
    .io_dmi_dmiReset(tlDM_io_dmi_dmiReset),
    .io_hartIsInReset_0(tlDM_io_hartIsInReset_0)
  );
  BundleBridgeNexus_15 tileHartIdNexusNode ( // @[HasTiles.scala 158:39]
    .auto_out(tileHartIdNexusNode_auto_out)
  );
  IntSyncCrossingSource_5 intsource ( // @[Crossing.scala 26:31]
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_in_1(intsource_auto_in_1),
    .auto_out_sync_0(intsource_auto_out_sync_0),
    .auto_out_sync_1(intsource_auto_out_sync_1)
  );
  IntSyncCrossingSource_1 intsource_1 ( // @[Crossing.scala 26:31]
    .clock(intsource_1_clock),
    .reset(intsource_1_reset),
    .auto_in_0(intsource_1_auto_in_0),
    .auto_out_sync_0(intsource_1_auto_out_sync_0)
  );
  IntSyncCrossingSource_1 intsource_2 ( // @[Crossing.scala 26:31]
    .clock(intsource_2_clock),
    .reset(intsource_2_reset),
    .auto_in_0(intsource_2_auto_in_0),
    .auto_out_sync_0(intsource_2_auto_out_sync_0)
  );
  IntSyncSyncCrossingSink_1 intsink_1 ( // @[Crossing.scala 94:29]
    .auto_in_sync_0(intsink_1_auto_in_sync_0),
    .auto_out_0(intsink_1_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_2 ( // @[Crossing.scala 94:29]
    .auto_in_sync_0(intsink_2_auto_in_sync_0),
    .auto_out_0(intsink_2_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_3 ( // @[Crossing.scala 94:29]
    .auto_in_sync_0(intsink_3_auto_in_sync_0),
    .auto_out_0(intsink_3_auto_out_0)
  );
  IntSyncCrossingSource_8 intsource_3 ( // @[Crossing.scala 26:31]
    .clock(intsource_3_clock),
    .reset(intsource_3_reset),
    .auto_in_0(intsource_3_auto_in_0),
    .auto_in_1(intsource_3_auto_in_1),
    .auto_in_2(intsource_3_auto_in_2),
    .auto_in_3(intsource_3_auto_in_3),
    .auto_in_4(intsource_3_auto_in_4),
    .auto_in_5(intsource_3_auto_in_5),
    .auto_in_6(intsource_3_auto_in_6),
    .auto_out_sync_0(intsource_3_auto_out_sync_0),
    .auto_out_sync_1(intsource_3_auto_out_sync_1),
    .auto_out_sync_2(intsource_3_auto_out_sync_2),
    .auto_out_sync_3(intsource_3_auto_out_sync_3),
    .auto_out_sync_4(intsource_3_auto_out_sync_4),
    .auto_out_sync_5(intsource_3_auto_out_sync_5),
    .auto_out_sync_6(intsource_3_auto_out_sync_6)
  );
  ClockSinkDomain_1 bootROMDomainWrapper ( // @[BootROM.scala 70:42]
    .auto_bootrom_in_a_ready(bootROMDomainWrapper_auto_bootrom_in_a_ready),
    .auto_bootrom_in_a_valid(bootROMDomainWrapper_auto_bootrom_in_a_valid),
    .auto_bootrom_in_a_bits_opcode(bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode),
    .auto_bootrom_in_a_bits_param(bootROMDomainWrapper_auto_bootrom_in_a_bits_param),
    .auto_bootrom_in_a_bits_size(bootROMDomainWrapper_auto_bootrom_in_a_bits_size),
    .auto_bootrom_in_a_bits_source(bootROMDomainWrapper_auto_bootrom_in_a_bits_source),
    .auto_bootrom_in_a_bits_address(bootROMDomainWrapper_auto_bootrom_in_a_bits_address),
    .auto_bootrom_in_a_bits_mask(bootROMDomainWrapper_auto_bootrom_in_a_bits_mask),
    .auto_bootrom_in_a_bits_corrupt(bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt),
    .auto_bootrom_in_d_ready(bootROMDomainWrapper_auto_bootrom_in_d_ready),
    .auto_bootrom_in_d_valid(bootROMDomainWrapper_auto_bootrom_in_d_valid),
    .auto_bootrom_in_d_bits_size(bootROMDomainWrapper_auto_bootrom_in_d_bits_size),
    .auto_bootrom_in_d_bits_source(bootROMDomainWrapper_auto_bootrom_in_d_bits_source),
    .auto_bootrom_in_d_bits_data(bootROMDomainWrapper_auto_bootrom_in_d_bits_data),
    .auto_clock_in_clock(bootROMDomainWrapper_auto_clock_in_clock),
    .auto_clock_in_reset(bootROMDomainWrapper_auto_clock_in_reset)
  );
  DebugTransportModuleJTAG dtm ( // @[Periphery.scala 158:21]
    .io_jtag_clock(dtm_io_jtag_clock),
    .io_jtag_reset(dtm_io_jtag_reset),
    .io_dmi_req_ready(dtm_io_dmi_req_ready),
    .io_dmi_req_valid(dtm_io_dmi_req_valid),
    .io_dmi_req_bits_addr(dtm_io_dmi_req_bits_addr),
    .io_dmi_req_bits_data(dtm_io_dmi_req_bits_data),
    .io_dmi_req_bits_op(dtm_io_dmi_req_bits_op),
    .io_dmi_resp_ready(dtm_io_dmi_resp_ready),
    .io_dmi_resp_valid(dtm_io_dmi_resp_valid),
    .io_dmi_resp_bits_data(dtm_io_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp(dtm_io_dmi_resp_bits_resp),
    .io_jtag_TMS(dtm_io_jtag_TMS),
    .io_jtag_TDI(dtm_io_jtag_TDI),
    .io_jtag_TDO_data(dtm_io_jtag_TDO_data),
    .io_jtag_TDO_driven(dtm_io_jtag_TDO_driven),
    .io_jtag_mfr_id(dtm_io_jtag_mfr_id),
    .io_jtag_part_number(dtm_io_jtag_part_number),
    .io_jtag_version(dtm_io_jtag_version)
  );
  assign ibus_auto_int_bus_int_out_0 = ibus_int_bus_auto_int_out_0; // @[LazyModule.scala 311:12]
  assign ibus_auto_int_bus_int_out_1 = ibus_int_bus_auto_int_out_1; // @[LazyModule.scala 311:12]
  assign ibus_auto_int_bus_int_out_2 = ibus_int_bus_auto_int_out_2; // @[LazyModule.scala 311:12]
  assign ibus_auto_int_bus_int_out_3 = ibus_int_bus_auto_int_out_3; // @[LazyModule.scala 311:12]
  assign ibus_auto_int_bus_int_out_4 = ibus_int_bus_auto_int_out_4; // @[LazyModule.scala 311:12]
  assign ibus_auto_int_bus_int_out_5 = ibus_int_bus_auto_int_out_5; // @[LazyModule.scala 311:12]
  assign ibus_auto_int_bus_int_out_6 = ibus_int_bus_auto_int_out_6; // @[LazyModule.scala 311:12]
  assign ibus_int_bus_auto_int_in_0 = ibus_intsink_auto_out_0; // @[LazyModule.scala 296:16]
  assign ibus_int_bus_auto_int_in_1 = ibus_intsink_auto_out_1; // @[LazyModule.scala 296:16]
  assign ibus_int_bus_auto_int_in_2 = ibus_intsink_auto_out_2; // @[LazyModule.scala 296:16]
  assign ibus_int_bus_auto_int_in_3 = ibus_intsink_auto_out_3; // @[LazyModule.scala 296:16]
  assign ibus_int_bus_auto_int_in_4 = ibus_intsink_auto_out_4; // @[LazyModule.scala 296:16]
  assign ibus_int_bus_auto_int_in_5 = ibus_intsink_auto_out_5; // @[LazyModule.scala 296:16]
  assign ibus_int_bus_auto_int_in_6 = ibus_intsink_auto_out_6; // @[LazyModule.scala 296:16]
  assign ibus_intsink_clock = ibus_auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign ibus_intsink_auto_in_sync_0 = ibus_auto_int_in_xing_in_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign ibus_intsink_auto_in_sync_1 = ibus_auto_int_in_xing_in_sync_1; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign ibus_intsink_auto_in_sync_2 = ibus_auto_int_in_xing_in_sync_2; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign ibus_intsink_auto_in_sync_3 = ibus_auto_int_in_xing_in_sync_3; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign ibus_intsink_auto_in_sync_4 = ibus_auto_int_in_xing_in_sync_4; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign ibus_intsink_auto_in_sync_5 = ibus_auto_int_in_xing_in_sync_5; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign ibus_intsink_auto_in_sync_6 = ibus_auto_int_in_xing_in_sync_6; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_clockGroup_auto_out_clock = subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_clockGroup_auto_out_reset = subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_fixedClockNode_auto_out_clock = subsystem_fbus_fixedClockNode_auto_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_fixedClockNode_auto_out_reset = subsystem_fbus_fixedClockNode_auto_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_ready = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_valid = subsystem_fbus_subsystem_fbus_xbar_auto_out_d_valid; // @[ReadyValidCancel.scala 21:38]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_opcode =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_param =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_size =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_source =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_source; // @[Xbar.scala 228:69]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_sink =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_sink; // @[Xbar.scala 323:53]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_denied =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_data =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_corrupt =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_valid = subsystem_fbus_subsystem_fbus_xbar_auto_in_a_valid; // @[ReadyValidCancel.scala 21:38]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_opcode =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_param =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_size =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_source =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_source; // @[Xbar.scala 237:55]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_address =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_bufferable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_modifiable; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_readalloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_writealloc; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_privileged =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_privileged; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_secure =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_secure; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_fetch =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_fetch; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_mask =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_data =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_corrupt =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_ready = subsystem_fbus_subsystem_fbus_xbar_auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_ready; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_ready; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_valid; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_id; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_bits_resp; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_ready; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_valid; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_id; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_data; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_resp; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_bits_last; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_auto_bus_xing_out_a_valid = subsystem_fbus_buffer_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_opcode = subsystem_fbus_buffer_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_param = subsystem_fbus_buffer_auto_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_size = subsystem_fbus_buffer_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_source = subsystem_fbus_buffer_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_address = subsystem_fbus_buffer_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_bufferable; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_modifiable; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_readalloc; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_writealloc; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_privileged =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_privileged; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_secure =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_secure; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_fetch =
    subsystem_fbus_buffer_auto_out_a_bits_user_amba_prot_fetch; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_mask = subsystem_fbus_buffer_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_data = subsystem_fbus_buffer_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_a_bits_corrupt = subsystem_fbus_buffer_auto_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_ready = subsystem_fbus_buffer_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_clock =
    subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_subsystem_fbus_clock_groups_auto_in_member_subsystem_fbus_0_reset =
    subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_clock =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_clock; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_clockGroup_auto_in_member_subsystem_fbus_0_reset =
    subsystem_fbus_subsystem_fbus_clock_groups_auto_out_member_subsystem_fbus_0_reset; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_fixedClockNode_auto_in_clock = subsystem_fbus_clockGroup_auto_out_clock; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_fixedClockNode_auto_in_reset = subsystem_fbus_clockGroup_auto_out_reset; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_valid =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_opcode =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_param =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_size =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_source =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_address =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_bufferable; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_modifiable; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_readalloc; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_writealloc; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_privileged =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_privileged; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_secure =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_secure; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_user_amba_prot_fetch =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_user_amba_prot_fetch; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_mask =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_data =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_a_bits_corrupt =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_in_d_ready =
    subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_a_ready = subsystem_fbus_buffer_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_valid = subsystem_fbus_buffer_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_opcode = subsystem_fbus_buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_param = subsystem_fbus_buffer_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_size = subsystem_fbus_buffer_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_source = subsystem_fbus_buffer_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_sink = subsystem_fbus_buffer_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_denied = subsystem_fbus_buffer_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_data = subsystem_fbus_buffer_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_subsystem_fbus_xbar_auto_out_d_bits_corrupt = subsystem_fbus_buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_clock = subsystem_fbus_fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_buffer_reset = subsystem_fbus_fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_buffer_auto_in_a_valid = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_opcode = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_param = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_size = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_source = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_address = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_bufferable; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_modifiable; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_readalloc; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_writealloc; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_privileged =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_privileged; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_secure =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_secure; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_user_amba_prot_fetch =
    subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_user_amba_prot_fetch; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_mask = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_data = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_a_bits_corrupt = subsystem_fbus_subsystem_fbus_xbar_auto_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_in_d_ready = subsystem_fbus_subsystem_fbus_xbar_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_buffer_auto_out_a_ready = subsystem_fbus_auto_bus_xing_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_valid = subsystem_fbus_auto_bus_xing_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_opcode = subsystem_fbus_auto_bus_xing_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_param = subsystem_fbus_auto_bus_xing_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_size = subsystem_fbus_auto_bus_xing_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_source = subsystem_fbus_auto_bus_xing_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_sink = subsystem_fbus_auto_bus_xing_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_denied = subsystem_fbus_auto_bus_xing_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_data = subsystem_fbus_auto_bus_xing_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_buffer_auto_out_d_bits_corrupt = subsystem_fbus_auto_bus_xing_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_clock = subsystem_fbus_fixedClockNode_auto_out_clock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_reset = subsystem_fbus_fixedClockNode_auto_out_reset; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_addr =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_len =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_size =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_burst =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_cache =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_cache; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_aw_bits_prot =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_prot; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_data =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_strb =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_w_bits_last =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_b_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_addr =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_len =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_size =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_burst =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_cache =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_cache; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_ar_bits_prot =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_prot; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_axi4index_in_r_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready; // @[LazyModule.scala 309:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_a_ready =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_a_ready; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_valid =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_valid; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_opcode =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_param =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_size =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_source =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_sink =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_denied =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_data =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_coupler_from_port_named_slave_port_axi4_auto_tl_out_d_bits_corrupt =
    subsystem_fbus_subsystem_fbus_xbar_auto_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign mem_axi4_0_aw_valid = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_id =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_addr =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_len =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_size =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_burst =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_lock =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_cache =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_prot =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_aw_bits_qos =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_valid = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_bits_data =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_bits_strb =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_w_bits_last =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_bits_last; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_b_ready = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_valid = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_id =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_addr =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_len =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_size =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_burst =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_lock =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_cache =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_prot =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_ar_bits_qos =
    subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mem_axi4_0_r_ready = subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_valid = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_id = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_addr = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_len = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_size = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_burst = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_lock = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_cache = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_prot = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_aw_bits_qos = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_w_valid = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_w_bits_data = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_w_bits_strb = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_w_bits_last = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_bits_last; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_b_ready = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_valid = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_id = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_addr = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_len = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_size = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_burst = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_lock = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_lock; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_cache = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_prot = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_ar_bits_qos = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_bits_qos; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign mmio_axi4_0_r_ready = subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign l2_frontend_bus_axi4_0_aw_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_w_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_b_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_b_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_b_bits_resp =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_ar_ready =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_ready; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_r_valid =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_valid; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_r_bits_id =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_r_bits_data =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_r_bits_resp =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign l2_frontend_bus_axi4_0_r_bits_last =
    subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_bits_last; // @[Nodes.scala 1207:84 LazyModule.scala 298:16]
  assign debug_systemjtag_jtag_TDO_data = dtm_io_jtag_TDO_data; // @[Periphery.scala 159:17]
  assign debug_systemjtag_jtag_TDO_driven = dtm_io_jtag_TDO_driven; // @[Periphery.scala 159:17]
  assign debug_ndreset = tlDM_io_ctrl_ndreset; // @[Periphery.scala 143:19]
  assign debug_dmactive = tlDM_io_ctrl_dmactive; // @[Periphery.scala 144:20]
  assign ibus_auto_int_in_xing_in_sync_0 = intsource_3_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_int_in_xing_in_sync_1 = intsource_3_auto_out_sync_1; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_int_in_xing_in_sync_2 = intsource_3_auto_out_sync_2; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_int_in_xing_in_sync_3 = intsource_3_auto_out_sync_3; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_int_in_xing_in_sync_4 = intsource_3_auto_out_sync_4; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_int_in_xing_in_sync_5 = intsource_3_auto_out_sync_5; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_int_in_xing_in_sync_6 = intsource_3_auto_out_sync_6; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign ibus_auto_clock_in_clock = subsystem_sbus_auto_fixedClockNode_out_0_clock; // @[LazyModule.scala 296:16]
  assign dummyClockGroupSourceNode_clock = clock;
  assign dummyClockGroupSourceNode_reset = reset;
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_aw_ready = mmio_axi4_0_aw_ready; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_w_ready = mmio_axi4_0_w_ready; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_valid = mmio_axi4_0_b_valid; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_id = mmio_axi4_0_b_bits_id; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_b_bits_resp = mmio_axi4_0_b_bits_resp; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_ar_ready = mmio_axi4_0_ar_ready; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_valid = mmio_axi4_0_r_valid; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_id = mmio_axi4_0_r_bits_id; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_data = mmio_axi4_0_r_bits_data; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_resp = mmio_axi4_0_r_bits_resp; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_to_port_named_mmio_port_axi4_axi4buf_out_r_bits_last = mmio_axi4_0_r_bits_last; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_opcode =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_param =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_size =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_source =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_address =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_mask =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_data =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_bits_corrupt =
    tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_ready =
    tile_prci_domain_auto_tl_master_clock_xing_out_b_ready; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_opcode =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_param =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_size =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_source =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_address =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_data =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_bits_corrupt =
    tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_ready =
    tile_prci_domain_auto_tl_master_clock_xing_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_valid =
    tile_prci_domain_auto_tl_master_clock_xing_out_e_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_e_bits_sink =
    tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready =
    subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address =
    subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready =
    subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt =
    subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid =
    subsystem_fbus_auto_bus_xing_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode =
    subsystem_fbus_auto_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param =
    subsystem_fbus_auto_bus_xing_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size =
    subsystem_fbus_auto_bus_xing_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source =
    subsystem_fbus_auto_bus_xing_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address =
    subsystem_fbus_auto_bus_xing_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_bufferable =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_bufferable; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_modifiable =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_modifiable; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_readalloc =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_readalloc; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_writealloc =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_writealloc; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_privileged =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_privileged; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_secure =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_secure; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_user_amba_prot_fetch =
    subsystem_fbus_auto_bus_xing_out_a_bits_user_amba_prot_fetch; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask =
    subsystem_fbus_auto_bus_xing_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data =
    subsystem_fbus_auto_bus_xing_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt =
    subsystem_fbus_auto_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready =
    subsystem_fbus_auto_bus_xing_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready =
    subsystem_cbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid =
    subsystem_cbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode =
    subsystem_cbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param =
    subsystem_cbus_auto_bus_xing_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size =
    subsystem_cbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source =
    subsystem_cbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink =
    subsystem_cbus_auto_bus_xing_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied =
    subsystem_cbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data =
    subsystem_cbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt =
    subsystem_cbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_5_clock; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_5_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_5_reset; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_4_clock; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_4_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_4_reset; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_clock; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_3_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_3_reset; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_clock; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_2_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_2_reset; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_clock; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_1_reset; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_clock; // @[LazyModule.scala 298:16]
  assign subsystem_sbus_auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset =
    dummyClockGroupSourceNode_auto_out_member_subsystem_sbus_0_reset; // @[LazyModule.scala 298:16]
  assign subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock =
    subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_clock; // @[LazyModule.scala 296:16]
  assign subsystem_pbus_auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset =
    subsystem_cbus_auto_subsystem_cbus_clock_groups_out_member_subsystem_pbus_0_reset; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_valid =
    l2_frontend_bus_axi4_0_aw_valid; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_id =
    l2_frontend_bus_axi4_0_aw_bits_id; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_addr =
    l2_frontend_bus_axi4_0_aw_bits_addr; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_len =
    l2_frontend_bus_axi4_0_aw_bits_len; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_size =
    l2_frontend_bus_axi4_0_aw_bits_size; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_burst =
    l2_frontend_bus_axi4_0_aw_bits_burst; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_cache =
    l2_frontend_bus_axi4_0_aw_bits_cache; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_aw_bits_prot =
    l2_frontend_bus_axi4_0_aw_bits_prot; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_valid =
    l2_frontend_bus_axi4_0_w_valid; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_data =
    l2_frontend_bus_axi4_0_w_bits_data; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_strb =
    l2_frontend_bus_axi4_0_w_bits_strb; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_w_bits_last =
    l2_frontend_bus_axi4_0_w_bits_last; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_b_ready =
    l2_frontend_bus_axi4_0_b_ready; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_valid =
    l2_frontend_bus_axi4_0_ar_valid; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_id =
    l2_frontend_bus_axi4_0_ar_bits_id; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_addr =
    l2_frontend_bus_axi4_0_ar_bits_addr; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_len =
    l2_frontend_bus_axi4_0_ar_bits_len; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_size =
    l2_frontend_bus_axi4_0_ar_bits_size; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_burst =
    l2_frontend_bus_axi4_0_ar_bits_burst; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_cache =
    l2_frontend_bus_axi4_0_ar_bits_cache; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_ar_bits_prot =
    l2_frontend_bus_axi4_0_ar_bits_prot; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_coupler_from_port_named_slave_port_axi4_axi4index_in_r_ready =
    l2_frontend_bus_axi4_0_r_ready; // @[Nodes.scala 1207:84 1630:60]
  assign subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_clock; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_auto_subsystem_fbus_clock_groups_in_member_subsystem_fbus_0_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_1_member_subsystem_fbus_0_reset; // @[LazyModule.scala 298:16]
  assign subsystem_fbus_auto_bus_xing_out_a_ready =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_valid =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_opcode =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_param =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_size =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_source =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_sink =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_denied =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_data =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_fbus_auto_bus_xing_out_d_bits_corrupt =
    subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_ready = bootROMDomainWrapper_auto_bootrom_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_valid = bootROMDomainWrapper_auto_bootrom_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_size =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_source =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_bits_data =
    bootROMDomainWrapper_auto_bootrom_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_ready = tlDM_auto_dmInner_dmInner_tl_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_valid = tlDM_auto_dmInner_dmInner_tl_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_opcode =
    tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_size = tlDM_auto_dmInner_dmInner_tl_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_source =
    tlDM_auto_dmInner_dmInner_tl_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_bits_data = tlDM_auto_dmInner_dmInner_tl_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_ready = clint_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_valid = clint_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_opcode = clint_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_size = clint_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_source = clint_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_bits_data = clint_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_ready = plicDomainWrapper_auto_plic_in_a_ready; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_valid = plicDomainWrapper_auto_plic_in_d_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_opcode = plicDomainWrapper_auto_plic_in_d_bits_opcode
    ; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_size = plicDomainWrapper_auto_plic_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_source = plicDomainWrapper_auto_plic_in_d_bits_source
    ; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_bits_data = plicDomainWrapper_auto_plic_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_clock; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_1_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_1_reset; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_clock; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_0_member_subsystem_cbus_0_reset; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_opcode =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_param =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_size =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_source =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_address =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_mask =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_data =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_a_bits_corrupt =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_cbus_auto_bus_xing_in_d_ready =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready; // @[LazyModule.scala 298:16]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_aw_ready = mem_axi4_0_aw_ready; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_w_ready = mem_axi4_0_w_ready; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_valid = mem_axi4_0_b_valid; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_id = mem_axi4_0_b_bits_id; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_b_bits_resp =
    mem_axi4_0_b_bits_resp; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_ar_ready = mem_axi4_0_ar_ready; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_valid = mem_axi4_0_r_valid; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_id = mem_axi4_0_r_bits_id; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_data =
    mem_axi4_0_r_bits_data; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_resp =
    mem_axi4_0_r_bits_resp; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_coupler_to_memory_controller_port_named_axi4_axi4yank_out_r_bits_last =
    mem_axi4_0_r_bits_last; // @[Nodes.scala 1210:84 1694:56]
  assign subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock =
    subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_clock; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset =
    subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_out_member_subsystem_mbus_0_reset; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_valid =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_opcode =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_param =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_size =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_source =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_address =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_bufferable =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_bufferable; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_modifiable =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_modifiable; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_readalloc =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_readalloc; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_writealloc =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_writealloc; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_privileged =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_privileged; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_secure =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_secure; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_user_amba_prot_fetch =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_user_amba_prot_fetch; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_mask =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_a_bits_data =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_mbus_auto_bus_xing_in_d_ready =
    subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready =
    subsystem_mbus_auto_bus_xing_in_a_ready; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid =
    subsystem_mbus_auto_bus_xing_in_d_valid; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode =
    subsystem_mbus_auto_bus_xing_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size =
    subsystem_mbus_auto_bus_xing_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source =
    subsystem_mbus_auto_bus_xing_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied =
    subsystem_mbus_auto_bus_xing_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data =
    subsystem_mbus_auto_bus_xing_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt =
    subsystem_mbus_auto_bus_xing_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_opcode =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_param =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_size =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_source =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_address =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_bufferable =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_bufferable; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_modifiable =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_modifiable; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_readalloc =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_readalloc; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_writealloc =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_writealloc; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_privileged =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_privileged; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_secure =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_secure; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_user_amba_prot_fetch =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_user_amba_prot_fetch; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_mask =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_data =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_a_bits_corrupt =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_b_ready =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_opcode =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_param =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_size =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_source =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_address =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_data =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_c_bits_corrupt =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_d_ready =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_e_valid =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_coherent_jbar_in_e_bits_sink =
    subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_clock; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_1_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_1_reset; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_clock; // @[LazyModule.scala 298:16]
  assign subsystem_l2_wrapper_auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset =
    subsystem_sbus_auto_subsystem_sbus_clock_groups_out_2_member_subsystem_l2_0_reset; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_intsink_in_sync_0 = tlDM_auto_dmOuter_intsource_out_sync_0; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tile_reset_domain_tile_hartid_in = tileHartIdNexusNode_auto_out; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_2_sync_0 = intsource_2_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_1_sync_0 = intsource_1_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_0_sync_0 = intsource_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_int_in_clock_xing_in_0_sync_1 = intsource_auto_out_sync_1; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_a_ready =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_a_ready; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_valid =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_valid; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_param =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_param; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_b_bits_address =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_b_bits_address; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_c_ready =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_c_ready; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_valid =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_valid; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_opcode =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_opcode; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_param =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_param; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_size =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_size; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_source =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_source; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_sink =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_sink; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_denied =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_denied; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_data =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_data; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tl_master_clock_xing_out_d_bits_corrupt =
    subsystem_sbus_auto_coupler_from_tile_tl_master_clock_xing_in_d_bits_corrupt; // @[LazyModule.scala 296:16]
  assign tile_prci_domain_auto_tap_clock_in_clock = subsystem_sbus_auto_fixedClockNode_out_1_clock; // @[LazyModule.scala 298:16]
  assign tile_prci_domain_auto_tap_clock_in_reset = subsystem_sbus_auto_fixedClockNode_out_1_reset; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_0 = ibus_auto_int_bus_int_out_0; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_1 = ibus_auto_int_bus_int_out_1; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_2 = ibus_auto_int_bus_int_out_2; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_3 = ibus_auto_int_bus_int_out_3; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_4 = ibus_auto_int_bus_int_out_4; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_5 = ibus_auto_int_bus_int_out_5; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_int_in_6 = ibus_auto_int_bus_int_out_6; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_valid = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_opcode = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode
    ; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_param = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_size = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_source = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source
    ; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_mask = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_data = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_plic_in_d_ready = subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_clock_in_clock = subsystem_cbus_auto_fixedClockNode_out_0_clock; // @[LazyModule.scala 298:16]
  assign plicDomainWrapper_auto_clock_in_reset = subsystem_cbus_auto_fixedClockNode_out_0_reset; // @[LazyModule.scala 298:16]
  assign clint_clock = subsystem_cbus_clock; // @[CLINT.scala 110:26]
  assign clint_reset = subsystem_cbus_reset; // @[CLINT.scala 111:26]
  assign clint_auto_in_a_valid = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_opcode = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_param = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_size = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_source = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_address = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_mask = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_data = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign clint_auto_in_a_bits_corrupt = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign clint_auto_in_d_ready = subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign clint_io_rtcTick = int_rtc_tick_value == 7'h63; // @[Counter.scala 74:24]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_valid = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_opcode =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_param = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param
    ; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_size = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_source =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_mask = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_data = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign tlDM_auto_dmInner_dmInner_tl_in_d_ready = subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign tlDM_io_debug_clock = debug_clock; // @[Periphery.scala 141:38]
  assign tlDM_io_debug_reset = debug_reset; // @[Periphery.scala 140:38]
  assign tlDM_io_ctrl_dmactiveAck = debug_dmactiveAck; // @[Periphery.scala 145:43]
  assign tlDM_io_dmi_dmi_req_valid = dtm_io_dmi_req_valid; // @[Periphery.scala 171:40]
  assign tlDM_io_dmi_dmi_req_bits_addr = dtm_io_dmi_req_bits_addr; // @[Periphery.scala 171:40]
  assign tlDM_io_dmi_dmi_req_bits_data = dtm_io_dmi_req_bits_data; // @[Periphery.scala 171:40]
  assign tlDM_io_dmi_dmi_req_bits_op = dtm_io_dmi_req_bits_op; // @[Periphery.scala 171:40]
  assign tlDM_io_dmi_dmi_resp_ready = dtm_io_dmi_resp_ready; // @[Periphery.scala 171:40]
  assign tlDM_io_dmi_dmiClock = debug_systemjtag_jtag_TCK; // @[Periphery.scala 172:45]
  assign tlDM_io_dmi_dmiReset = debug_systemjtag_reset; // @[Periphery.scala 173:45]
  assign tlDM_io_hartIsInReset_0 = resetctrl_hartIsInReset_0; // @[Periphery.scala 110:40]
  assign intsource_clock = clock;
  assign intsource_reset = reset;
  assign intsource_auto_in_0 = clint_auto_int_out_0; // @[LazyModule.scala 298:16]
  assign intsource_auto_in_1 = clint_auto_int_out_1; // @[LazyModule.scala 298:16]
  assign intsource_1_clock = clock;
  assign intsource_1_reset = reset;
  assign intsource_1_auto_in_0 = plicDomainWrapper_auto_plic_int_out_0_0; // @[LazyModule.scala 298:16]
  assign intsource_2_clock = clock;
  assign intsource_2_reset = reset;
  assign intsource_2_auto_in_0 = plicDomainWrapper_auto_plic_int_out_1_0; // @[LazyModule.scala 298:16]
  assign intsink_1_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_0_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign intsink_2_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_1_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign intsink_3_auto_in_sync_0 = tile_prci_domain_auto_int_out_clock_xing_out_2_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign intsource_3_clock = clock;
  assign intsource_3_reset = reset;
  assign intsource_3_auto_in_0 = interrupts[0]; // @[InterruptBus.scala 77:97]
  assign intsource_3_auto_in_1 = interrupts[1]; // @[InterruptBus.scala 77:97]
  assign intsource_3_auto_in_2 = interrupts[2]; // @[InterruptBus.scala 77:97]
  assign intsource_3_auto_in_3 = interrupts[3]; // @[InterruptBus.scala 77:97]
  assign intsource_3_auto_in_4 = interrupts[4]; // @[InterruptBus.scala 77:97]
  assign intsource_3_auto_in_5 = interrupts[5]; // @[InterruptBus.scala 77:97]
  assign intsource_3_auto_in_6 = interrupts[6]; // @[InterruptBus.scala 77:97]
  assign bootROMDomainWrapper_auto_bootrom_in_a_valid = subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_opcode =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_param =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_size =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_source =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_address =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_mask =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_a_bits_corrupt =
    subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_bootrom_in_d_ready = subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_clock_in_clock = subsystem_cbus_auto_fixedClockNode_out_2_clock; // @[LazyModule.scala 298:16]
  assign bootROMDomainWrapper_auto_clock_in_reset = subsystem_cbus_auto_fixedClockNode_out_2_reset; // @[LazyModule.scala 298:16]
  assign dtm_io_jtag_clock = debug_systemjtag_jtag_TCK; // @[Periphery.scala 163:24]
  assign dtm_io_jtag_reset = debug_systemjtag_reset; // @[Periphery.scala 164:24]
  assign dtm_io_dmi_req_ready = tlDM_io_dmi_dmi_req_ready; // @[Periphery.scala 171:40]
  assign dtm_io_dmi_resp_valid = tlDM_io_dmi_dmi_resp_valid; // @[Periphery.scala 171:40]
  assign dtm_io_dmi_resp_bits_data = tlDM_io_dmi_dmi_resp_bits_data; // @[Periphery.scala 171:40]
  assign dtm_io_dmi_resp_bits_resp = tlDM_io_dmi_dmi_resp_bits_resp; // @[Periphery.scala 171:40]
  assign dtm_io_jtag_TMS = debug_systemjtag_jtag_TMS; // @[Periphery.scala 159:17]
  assign dtm_io_jtag_TDI = debug_systemjtag_jtag_TDI; // @[Periphery.scala 159:17]
  assign dtm_io_jtag_mfr_id = debug_systemjtag_mfr_id; // @[Periphery.scala 165:24]
  assign dtm_io_jtag_part_number = debug_systemjtag_part_number; // @[Periphery.scala 166:29]
  assign dtm_io_jtag_version = debug_systemjtag_version; // @[Periphery.scala 167:25]
  always @(posedge subsystem_pbus_clock) begin
    if (subsystem_pbus_reset) begin // @[Counter.scala 62:40]
      int_rtc_tick_value <= 7'h0; // @[Counter.scala 62:40]
    end else if (int_rtc_tick_wrap_wrap) begin // @[Counter.scala 88:20]
      int_rtc_tick_value <= 7'h0; // @[Counter.scala 88:28]
    end else begin
      int_rtc_tick_value <= _int_rtc_tick_wrap_value_T_1; // @[Counter.scala 78:15]
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
  int_rtc_tick_value = _RAND_0[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
