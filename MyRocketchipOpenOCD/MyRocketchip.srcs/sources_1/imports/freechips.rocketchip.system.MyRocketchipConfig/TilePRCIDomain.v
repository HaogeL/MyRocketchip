module TilePRCIDomain(
  input         auto_intsink_in_sync_0,
  input         auto_tile_reset_domain_tile_hartid_in,
  output        auto_int_out_clock_xing_out_2_sync_0,
  output        auto_int_out_clock_xing_out_1_sync_0,
  output        auto_int_out_clock_xing_out_0_sync_0,
  input         auto_int_in_clock_xing_in_2_sync_0,
  input         auto_int_in_clock_xing_in_1_sync_0,
  input         auto_int_in_clock_xing_in_0_sync_0,
  input         auto_int_in_clock_xing_in_0_sync_1,
  input         auto_tl_master_clock_xing_out_a_ready,
  output        auto_tl_master_clock_xing_out_a_valid,
  output [2:0]  auto_tl_master_clock_xing_out_a_bits_opcode,
  output [2:0]  auto_tl_master_clock_xing_out_a_bits_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_bits_size,
  output [1:0]  auto_tl_master_clock_xing_out_a_bits_source,
  output [31:0] auto_tl_master_clock_xing_out_a_bits_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_bits_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_bits_data,
  output        auto_tl_master_clock_xing_out_a_bits_corrupt,
  output        auto_tl_master_clock_xing_out_b_ready,
  input         auto_tl_master_clock_xing_out_b_valid,
  input  [1:0]  auto_tl_master_clock_xing_out_b_bits_param,
  input  [31:0] auto_tl_master_clock_xing_out_b_bits_address,
  input         auto_tl_master_clock_xing_out_c_ready,
  output        auto_tl_master_clock_xing_out_c_valid,
  output [2:0]  auto_tl_master_clock_xing_out_c_bits_opcode,
  output [2:0]  auto_tl_master_clock_xing_out_c_bits_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_bits_size,
  output [1:0]  auto_tl_master_clock_xing_out_c_bits_source,
  output [31:0] auto_tl_master_clock_xing_out_c_bits_address,
  output [63:0] auto_tl_master_clock_xing_out_c_bits_data,
  output        auto_tl_master_clock_xing_out_c_bits_corrupt,
  output        auto_tl_master_clock_xing_out_d_ready,
  input         auto_tl_master_clock_xing_out_d_valid,
  input  [2:0]  auto_tl_master_clock_xing_out_d_bits_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_bits_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_bits_size,
  input  [1:0]  auto_tl_master_clock_xing_out_d_bits_source,
  input  [1:0]  auto_tl_master_clock_xing_out_d_bits_sink,
  input         auto_tl_master_clock_xing_out_d_bits_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_bits_data,
  input         auto_tl_master_clock_xing_out_d_bits_corrupt,
  output        auto_tl_master_clock_xing_out_e_valid,
  output [1:0]  auto_tl_master_clock_xing_out_e_bits_sink,
  input         auto_tap_clock_in_clock,
  input         auto_tap_clock_in_reset
);
  wire  tile_reset_domain_auto_tile_wfi_out_0;
  wire  tile_reset_domain_auto_tile_int_local_in_3_0;
  wire  tile_reset_domain_auto_tile_int_local_in_2_0;
  wire  tile_reset_domain_auto_tile_int_local_in_1_0;
  wire  tile_reset_domain_auto_tile_int_local_in_1_1;
  wire  tile_reset_domain_auto_tile_int_local_in_0_0;
  wire  tile_reset_domain_auto_tile_hartid_in;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_a_ready;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_a_valid;
  wire [2:0] tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_opcode;
  wire [2:0] tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_param;
  wire [3:0] tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_size;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_source;
  wire [31:0] tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_address;
  wire [7:0] tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_mask;
  wire [63:0] tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_data;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_b_ready;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_b_valid;
  wire [2:0] tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_opcode;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_param;
  wire [3:0] tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_size;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_source;
  wire [31:0] tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_address;
  wire [7:0] tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_mask;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_corrupt;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_c_ready;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_c_valid;
  wire [2:0] tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_opcode;
  wire [2:0] tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_param;
  wire [3:0] tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_size;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_source;
  wire [31:0] tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_address;
  wire [63:0] tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_data;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_d_ready;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_d_valid;
  wire [2:0] tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_opcode;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_param;
  wire [3:0] tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_size;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_source;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_sink;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_denied;
  wire [63:0] tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_data;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_corrupt;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_e_ready;
  wire  tile_reset_domain_auto_tile_tl_other_masters_out_e_valid;
  wire [1:0] tile_reset_domain_auto_tile_tl_other_masters_out_e_bits_sink;
  wire  tile_reset_domain_auto_clock_in_clock;
  wire  tile_reset_domain_auto_clock_in_reset;
  wire  tile_reset_domain_tile_clock; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_reset; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_wfi_out_0; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_int_local_in_3_0; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_int_local_in_2_0; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_int_local_in_1_0; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_int_local_in_1_1; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_int_local_in_0_0; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_hartid_in; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_a_ready; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_a_valid; // @[HasTiles.scala 252:53]
  wire [2:0] tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_opcode; // @[HasTiles.scala 252:53]
  wire [2:0] tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_param; // @[HasTiles.scala 252:53]
  wire [3:0] tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_size; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_source; // @[HasTiles.scala 252:53]
  wire [31:0] tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_address; // @[HasTiles.scala 252:53]
  wire [7:0] tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_mask; // @[HasTiles.scala 252:53]
  wire [63:0] tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_data; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_b_ready; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_b_valid; // @[HasTiles.scala 252:53]
  wire [2:0] tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_opcode; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_param; // @[HasTiles.scala 252:53]
  wire [3:0] tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_size; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_source; // @[HasTiles.scala 252:53]
  wire [31:0] tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_address; // @[HasTiles.scala 252:53]
  wire [7:0] tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_mask; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_corrupt; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_c_ready; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_c_valid; // @[HasTiles.scala 252:53]
  wire [2:0] tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_opcode; // @[HasTiles.scala 252:53]
  wire [2:0] tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_param; // @[HasTiles.scala 252:53]
  wire [3:0] tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_size; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_source; // @[HasTiles.scala 252:53]
  wire [31:0] tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_address; // @[HasTiles.scala 252:53]
  wire [63:0] tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_data; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_d_ready; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_d_valid; // @[HasTiles.scala 252:53]
  wire [2:0] tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_opcode; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_param; // @[HasTiles.scala 252:53]
  wire [3:0] tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_size; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_source; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_sink; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_denied; // @[HasTiles.scala 252:53]
  wire [63:0] tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_data; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_corrupt; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_e_ready; // @[HasTiles.scala 252:53]
  wire  tile_reset_domain_tile_auto_tl_other_masters_out_e_valid; // @[HasTiles.scala 252:53]
  wire [1:0] tile_reset_domain_tile_auto_tl_other_masters_out_e_bits_sink; // @[HasTiles.scala 252:53]
  wire  clockNode_auto_in_clock;
  wire  clockNode_auto_in_reset;
  wire  clockNode_auto_out_clock;
  wire  clockNode_auto_out_reset;
  wire  buffer_auto_in_a_ready;
  wire  buffer_auto_in_a_valid;
  wire [2:0] buffer_auto_in_a_bits_opcode;
  wire [2:0] buffer_auto_in_a_bits_param;
  wire [3:0] buffer_auto_in_a_bits_size;
  wire [1:0] buffer_auto_in_a_bits_source;
  wire [31:0] buffer_auto_in_a_bits_address;
  wire [7:0] buffer_auto_in_a_bits_mask;
  wire [63:0] buffer_auto_in_a_bits_data;
  wire  buffer_auto_in_b_ready;
  wire  buffer_auto_in_b_valid;
  wire [2:0] buffer_auto_in_b_bits_opcode;
  wire [1:0] buffer_auto_in_b_bits_param;
  wire [3:0] buffer_auto_in_b_bits_size;
  wire [1:0] buffer_auto_in_b_bits_source;
  wire [31:0] buffer_auto_in_b_bits_address;
  wire [7:0] buffer_auto_in_b_bits_mask;
  wire  buffer_auto_in_b_bits_corrupt;
  wire  buffer_auto_in_c_ready;
  wire  buffer_auto_in_c_valid;
  wire [2:0] buffer_auto_in_c_bits_opcode;
  wire [2:0] buffer_auto_in_c_bits_param;
  wire [3:0] buffer_auto_in_c_bits_size;
  wire [1:0] buffer_auto_in_c_bits_source;
  wire [31:0] buffer_auto_in_c_bits_address;
  wire [63:0] buffer_auto_in_c_bits_data;
  wire  buffer_auto_in_d_ready;
  wire  buffer_auto_in_d_valid;
  wire [2:0] buffer_auto_in_d_bits_opcode;
  wire [1:0] buffer_auto_in_d_bits_param;
  wire [3:0] buffer_auto_in_d_bits_size;
  wire [1:0] buffer_auto_in_d_bits_source;
  wire [1:0] buffer_auto_in_d_bits_sink;
  wire  buffer_auto_in_d_bits_denied;
  wire [63:0] buffer_auto_in_d_bits_data;
  wire  buffer_auto_in_d_bits_corrupt;
  wire  buffer_auto_in_e_ready;
  wire  buffer_auto_in_e_valid;
  wire [1:0] buffer_auto_in_e_bits_sink;
  wire  buffer_auto_out_a_ready;
  wire  buffer_auto_out_a_valid;
  wire [2:0] buffer_auto_out_a_bits_opcode;
  wire [2:0] buffer_auto_out_a_bits_param;
  wire [3:0] buffer_auto_out_a_bits_size;
  wire [1:0] buffer_auto_out_a_bits_source;
  wire [31:0] buffer_auto_out_a_bits_address;
  wire [7:0] buffer_auto_out_a_bits_mask;
  wire [63:0] buffer_auto_out_a_bits_data;
  wire  buffer_auto_out_b_ready;
  wire  buffer_auto_out_b_valid;
  wire [2:0] buffer_auto_out_b_bits_opcode;
  wire [1:0] buffer_auto_out_b_bits_param;
  wire [3:0] buffer_auto_out_b_bits_size;
  wire [1:0] buffer_auto_out_b_bits_source;
  wire [31:0] buffer_auto_out_b_bits_address;
  wire [7:0] buffer_auto_out_b_bits_mask;
  wire  buffer_auto_out_b_bits_corrupt;
  wire  buffer_auto_out_c_ready;
  wire  buffer_auto_out_c_valid;
  wire [2:0] buffer_auto_out_c_bits_opcode;
  wire [2:0] buffer_auto_out_c_bits_param;
  wire [3:0] buffer_auto_out_c_bits_size;
  wire [1:0] buffer_auto_out_c_bits_source;
  wire [31:0] buffer_auto_out_c_bits_address;
  wire [63:0] buffer_auto_out_c_bits_data;
  wire  buffer_auto_out_d_ready;
  wire  buffer_auto_out_d_valid;
  wire [2:0] buffer_auto_out_d_bits_opcode;
  wire [1:0] buffer_auto_out_d_bits_param;
  wire [3:0] buffer_auto_out_d_bits_size;
  wire [1:0] buffer_auto_out_d_bits_source;
  wire [1:0] buffer_auto_out_d_bits_sink;
  wire  buffer_auto_out_d_bits_denied;
  wire [63:0] buffer_auto_out_d_bits_data;
  wire  buffer_auto_out_d_bits_corrupt;
  wire  buffer_auto_out_e_ready;
  wire  buffer_auto_out_e_valid;
  wire [1:0] buffer_auto_out_e_bits_sink;
  wire  buffer_1_clock; // @[Buffer.scala 68:28]
  wire  buffer_1_reset; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_a_bits_size; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_in_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_in_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_b_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_b_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_b_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_b_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_b_bits_size; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_b_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_in_b_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_in_b_bits_mask; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_b_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_c_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_c_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_c_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_c_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_c_bits_size; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_c_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_in_c_bits_address; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_c_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_in_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_in_d_bits_size; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_in_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_e_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_in_e_valid; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_in_e_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_a_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_a_bits_size; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_a_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_out_a_bits_address; // @[Buffer.scala 68:28]
  wire [7:0] buffer_1_auto_out_a_bits_mask; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_a_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_a_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_b_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_b_valid; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_b_bits_param; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_out_b_bits_address; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_c_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_c_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_c_bits_opcode; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_c_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_c_bits_size; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_c_bits_source; // @[Buffer.scala 68:28]
  wire [31:0] buffer_1_auto_out_c_bits_address; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_c_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_c_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_ready; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_valid; // @[Buffer.scala 68:28]
  wire [2:0] buffer_1_auto_out_d_bits_opcode; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_param; // @[Buffer.scala 68:28]
  wire [3:0] buffer_1_auto_out_d_bits_size; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_source; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_d_bits_sink; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_denied; // @[Buffer.scala 68:28]
  wire [63:0] buffer_1_auto_out_d_bits_data; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_d_bits_corrupt; // @[Buffer.scala 68:28]
  wire  buffer_1_auto_out_e_valid; // @[Buffer.scala 68:28]
  wire [1:0] buffer_1_auto_out_e_bits_sink; // @[Buffer.scala 68:28]
  wire  intsink_clock; // @[Crossing.scala 74:29]
  wire  intsink_auto_in_sync_0; // @[Crossing.scala 74:29]
  wire  intsink_auto_out_0; // @[Crossing.scala 74:29]
  wire  intsink_1_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_in_sync_1; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_1_auto_out_1; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_2_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_in_sync_0; // @[Crossing.scala 94:29]
  wire  intsink_3_auto_out_0; // @[Crossing.scala 94:29]
  wire  intsource_1_clock; // @[Crossing.scala 26:31]
  wire  intsource_1_reset; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_1_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_2_clock; // @[Crossing.scala 26:31]
  wire  intsource_2_reset; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_2_auto_out_sync_0; // @[Crossing.scala 26:31]
  wire  intsource_3_clock; // @[Crossing.scala 26:31]
  wire  intsource_3_reset; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_in_0; // @[Crossing.scala 26:31]
  wire  intsource_3_auto_out_sync_0; // @[Crossing.scala 26:31]
  RocketTile tile_reset_domain_tile ( // @[HasTiles.scala 252:53]
    .clock(tile_reset_domain_tile_clock),
    .reset(tile_reset_domain_tile_reset),
    .auto_wfi_out_0(tile_reset_domain_tile_auto_wfi_out_0),
    .auto_int_local_in_3_0(tile_reset_domain_tile_auto_int_local_in_3_0),
    .auto_int_local_in_2_0(tile_reset_domain_tile_auto_int_local_in_2_0),
    .auto_int_local_in_1_0(tile_reset_domain_tile_auto_int_local_in_1_0),
    .auto_int_local_in_1_1(tile_reset_domain_tile_auto_int_local_in_1_1),
    .auto_int_local_in_0_0(tile_reset_domain_tile_auto_int_local_in_0_0),
    .auto_hartid_in(tile_reset_domain_tile_auto_hartid_in),
    .auto_tl_other_masters_out_a_ready(tile_reset_domain_tile_auto_tl_other_masters_out_a_ready),
    .auto_tl_other_masters_out_a_valid(tile_reset_domain_tile_auto_tl_other_masters_out_a_valid),
    .auto_tl_other_masters_out_a_bits_opcode(tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_opcode),
    .auto_tl_other_masters_out_a_bits_param(tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_param),
    .auto_tl_other_masters_out_a_bits_size(tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_size),
    .auto_tl_other_masters_out_a_bits_source(tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_source),
    .auto_tl_other_masters_out_a_bits_address(tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_address),
    .auto_tl_other_masters_out_a_bits_mask(tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_mask),
    .auto_tl_other_masters_out_a_bits_data(tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_data),
    .auto_tl_other_masters_out_b_ready(tile_reset_domain_tile_auto_tl_other_masters_out_b_ready),
    .auto_tl_other_masters_out_b_valid(tile_reset_domain_tile_auto_tl_other_masters_out_b_valid),
    .auto_tl_other_masters_out_b_bits_opcode(tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_opcode),
    .auto_tl_other_masters_out_b_bits_param(tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_param),
    .auto_tl_other_masters_out_b_bits_size(tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_size),
    .auto_tl_other_masters_out_b_bits_source(tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_source),
    .auto_tl_other_masters_out_b_bits_address(tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_address),
    .auto_tl_other_masters_out_b_bits_mask(tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_mask),
    .auto_tl_other_masters_out_b_bits_corrupt(tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_corrupt),
    .auto_tl_other_masters_out_c_ready(tile_reset_domain_tile_auto_tl_other_masters_out_c_ready),
    .auto_tl_other_masters_out_c_valid(tile_reset_domain_tile_auto_tl_other_masters_out_c_valid),
    .auto_tl_other_masters_out_c_bits_opcode(tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_opcode),
    .auto_tl_other_masters_out_c_bits_param(tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_param),
    .auto_tl_other_masters_out_c_bits_size(tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_size),
    .auto_tl_other_masters_out_c_bits_source(tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_source),
    .auto_tl_other_masters_out_c_bits_address(tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_address),
    .auto_tl_other_masters_out_c_bits_data(tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_data),
    .auto_tl_other_masters_out_d_ready(tile_reset_domain_tile_auto_tl_other_masters_out_d_ready),
    .auto_tl_other_masters_out_d_valid(tile_reset_domain_tile_auto_tl_other_masters_out_d_valid),
    .auto_tl_other_masters_out_d_bits_opcode(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_opcode),
    .auto_tl_other_masters_out_d_bits_param(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_param),
    .auto_tl_other_masters_out_d_bits_size(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_size),
    .auto_tl_other_masters_out_d_bits_source(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_source),
    .auto_tl_other_masters_out_d_bits_sink(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_sink),
    .auto_tl_other_masters_out_d_bits_denied(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_denied),
    .auto_tl_other_masters_out_d_bits_data(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_data),
    .auto_tl_other_masters_out_d_bits_corrupt(tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_corrupt),
    .auto_tl_other_masters_out_e_ready(tile_reset_domain_tile_auto_tl_other_masters_out_e_ready),
    .auto_tl_other_masters_out_e_valid(tile_reset_domain_tile_auto_tl_other_masters_out_e_valid),
    .auto_tl_other_masters_out_e_bits_sink(tile_reset_domain_tile_auto_tl_other_masters_out_e_bits_sink)
  );
  TLBuffer_9 buffer_1 ( // @[Buffer.scala 68:28]
    .clock(buffer_1_clock),
    .reset(buffer_1_reset),
    .auto_in_a_ready(buffer_1_auto_in_a_ready),
    .auto_in_a_valid(buffer_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_1_auto_in_a_bits_data),
    .auto_in_b_ready(buffer_1_auto_in_b_ready),
    .auto_in_b_valid(buffer_1_auto_in_b_valid),
    .auto_in_b_bits_opcode(buffer_1_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(buffer_1_auto_in_b_bits_param),
    .auto_in_b_bits_size(buffer_1_auto_in_b_bits_size),
    .auto_in_b_bits_source(buffer_1_auto_in_b_bits_source),
    .auto_in_b_bits_address(buffer_1_auto_in_b_bits_address),
    .auto_in_b_bits_mask(buffer_1_auto_in_b_bits_mask),
    .auto_in_b_bits_corrupt(buffer_1_auto_in_b_bits_corrupt),
    .auto_in_c_ready(buffer_1_auto_in_c_ready),
    .auto_in_c_valid(buffer_1_auto_in_c_valid),
    .auto_in_c_bits_opcode(buffer_1_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(buffer_1_auto_in_c_bits_param),
    .auto_in_c_bits_size(buffer_1_auto_in_c_bits_size),
    .auto_in_c_bits_source(buffer_1_auto_in_c_bits_source),
    .auto_in_c_bits_address(buffer_1_auto_in_c_bits_address),
    .auto_in_c_bits_data(buffer_1_auto_in_c_bits_data),
    .auto_in_d_ready(buffer_1_auto_in_d_ready),
    .auto_in_d_valid(buffer_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_1_auto_in_d_bits_corrupt),
    .auto_in_e_ready(buffer_1_auto_in_e_ready),
    .auto_in_e_valid(buffer_1_auto_in_e_valid),
    .auto_in_e_bits_sink(buffer_1_auto_in_e_bits_sink),
    .auto_out_a_ready(buffer_1_auto_out_a_ready),
    .auto_out_a_valid(buffer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_1_auto_out_a_bits_corrupt),
    .auto_out_b_ready(buffer_1_auto_out_b_ready),
    .auto_out_b_valid(buffer_1_auto_out_b_valid),
    .auto_out_b_bits_param(buffer_1_auto_out_b_bits_param),
    .auto_out_b_bits_address(buffer_1_auto_out_b_bits_address),
    .auto_out_c_ready(buffer_1_auto_out_c_ready),
    .auto_out_c_valid(buffer_1_auto_out_c_valid),
    .auto_out_c_bits_opcode(buffer_1_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(buffer_1_auto_out_c_bits_param),
    .auto_out_c_bits_size(buffer_1_auto_out_c_bits_size),
    .auto_out_c_bits_source(buffer_1_auto_out_c_bits_source),
    .auto_out_c_bits_address(buffer_1_auto_out_c_bits_address),
    .auto_out_c_bits_data(buffer_1_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(buffer_1_auto_out_c_bits_corrupt),
    .auto_out_d_ready(buffer_1_auto_out_d_ready),
    .auto_out_d_valid(buffer_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_1_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_1_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_1_auto_out_d_bits_corrupt),
    .auto_out_e_valid(buffer_1_auto_out_e_valid),
    .auto_out_e_bits_sink(buffer_1_auto_out_e_bits_sink)
  );
  IntSyncAsyncCrossingSink_1 intsink ( // @[Crossing.scala 74:29]
    .clock(intsink_clock),
    .auto_in_sync_0(intsink_auto_in_sync_0),
    .auto_out_0(intsink_auto_out_0)
  );
  IntSyncSyncCrossingSink intsink_1 ( // @[Crossing.scala 94:29]
    .auto_in_sync_0(intsink_1_auto_in_sync_0),
    .auto_in_sync_1(intsink_1_auto_in_sync_1),
    .auto_out_0(intsink_1_auto_out_0),
    .auto_out_1(intsink_1_auto_out_1)
  );
  IntSyncSyncCrossingSink_1 intsink_2 ( // @[Crossing.scala 94:29]
    .auto_in_sync_0(intsink_2_auto_in_sync_0),
    .auto_out_0(intsink_2_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_3 ( // @[Crossing.scala 94:29]
    .auto_in_sync_0(intsink_3_auto_in_sync_0),
    .auto_out_0(intsink_3_auto_out_0)
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
  IntSyncCrossingSource_1 intsource_3 ( // @[Crossing.scala 26:31]
    .clock(intsource_3_clock),
    .reset(intsource_3_reset),
    .auto_in_0(intsource_3_auto_in_0),
    .auto_out_sync_0(intsource_3_auto_out_sync_0)
  );
  assign tile_reset_domain_auto_tile_wfi_out_0 = tile_reset_domain_tile_auto_wfi_out_0; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_valid =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_valid; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_opcode =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_opcode; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_param =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_param; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_size =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_size; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_source =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_source; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_address =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_address; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_mask =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_mask; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_data =
    tile_reset_domain_tile_auto_tl_other_masters_out_a_bits_data; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_ready =
    tile_reset_domain_tile_auto_tl_other_masters_out_b_ready; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_valid =
    tile_reset_domain_tile_auto_tl_other_masters_out_c_valid; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_opcode =
    tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_opcode; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_param =
    tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_param; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_size =
    tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_size; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_source =
    tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_source; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_address =
    tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_address; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_data =
    tile_reset_domain_tile_auto_tl_other_masters_out_c_bits_data; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_ready =
    tile_reset_domain_tile_auto_tl_other_masters_out_d_ready; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_e_valid =
    tile_reset_domain_tile_auto_tl_other_masters_out_e_valid; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_e_bits_sink =
    tile_reset_domain_tile_auto_tl_other_masters_out_e_bits_sink; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_clock = tile_reset_domain_auto_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign tile_reset_domain_tile_reset = tile_reset_domain_auto_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign tile_reset_domain_tile_auto_int_local_in_3_0 = tile_reset_domain_auto_tile_int_local_in_3_0; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_tile_auto_int_local_in_2_0 = tile_reset_domain_auto_tile_int_local_in_2_0; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_tile_auto_int_local_in_1_0 = tile_reset_domain_auto_tile_int_local_in_1_0; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_tile_auto_int_local_in_1_1 = tile_reset_domain_auto_tile_int_local_in_1_1; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_tile_auto_int_local_in_0_0 = tile_reset_domain_auto_tile_int_local_in_0_0; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_tile_auto_hartid_in = tile_reset_domain_auto_tile_hartid_in; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_a_ready =
    tile_reset_domain_auto_tile_tl_other_masters_out_a_ready; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_valid =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_valid; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_opcode =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_opcode; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_param =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_param; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_size =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_size; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_source =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_source; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_address =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_address; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_mask =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_mask; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_b_bits_corrupt =
    tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_corrupt; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_c_ready =
    tile_reset_domain_auto_tile_tl_other_masters_out_c_ready; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_valid =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_valid; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_opcode =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_opcode; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_param =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_param; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_size =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_size; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_source =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_source; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_sink =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_sink; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_denied =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_denied; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_data =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_data; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_d_bits_corrupt =
    tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_corrupt; // @[LazyModule.scala 311:12]
  assign tile_reset_domain_tile_auto_tl_other_masters_out_e_ready =
    tile_reset_domain_auto_tile_tl_other_masters_out_e_ready; // @[LazyModule.scala 311:12]
  assign clockNode_auto_out_clock = clockNode_auto_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clockNode_auto_out_reset = clockNode_auto_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_ready = buffer_auto_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_valid = buffer_auto_out_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_bits_opcode = buffer_auto_out_b_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_bits_param = buffer_auto_out_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_bits_size = buffer_auto_out_b_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_bits_source = buffer_auto_out_b_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_bits_address = buffer_auto_out_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_bits_mask = buffer_auto_out_b_bits_mask; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_b_bits_corrupt = buffer_auto_out_b_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_c_ready = buffer_auto_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_valid = buffer_auto_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_opcode = buffer_auto_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_param = buffer_auto_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_size = buffer_auto_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_source = buffer_auto_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_sink = buffer_auto_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_denied = buffer_auto_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_data = buffer_auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_d_bits_corrupt = buffer_auto_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_in_e_ready = buffer_auto_out_e_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_auto_out_a_valid = buffer_auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_bits_opcode = buffer_auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_bits_param = buffer_auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_bits_size = buffer_auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_bits_source = buffer_auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_bits_address = buffer_auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_bits_mask = buffer_auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_a_bits_data = buffer_auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_b_ready = buffer_auto_in_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_c_valid = buffer_auto_in_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_c_bits_opcode = buffer_auto_in_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_c_bits_param = buffer_auto_in_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_c_bits_size = buffer_auto_in_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_c_bits_source = buffer_auto_in_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_c_bits_address = buffer_auto_in_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_c_bits_data = buffer_auto_in_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_d_ready = buffer_auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_e_valid = buffer_auto_in_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_out_e_bits_sink = buffer_auto_in_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign auto_int_out_clock_xing_out_2_sync_0 = intsource_3_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_int_out_clock_xing_out_1_sync_0 = intsource_2_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_int_out_clock_xing_out_0_sync_0 = intsource_1_auto_out_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_valid = buffer_1_auto_out_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_opcode = buffer_1_auto_out_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_param = buffer_1_auto_out_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_size = buffer_1_auto_out_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_source = buffer_1_auto_out_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_address = buffer_1_auto_out_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_mask = buffer_1_auto_out_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_data = buffer_1_auto_out_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_a_bits_corrupt = buffer_1_auto_out_a_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_b_ready = buffer_1_auto_out_b_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_valid = buffer_1_auto_out_c_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_opcode = buffer_1_auto_out_c_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_param = buffer_1_auto_out_c_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_size = buffer_1_auto_out_c_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_source = buffer_1_auto_out_c_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_address = buffer_1_auto_out_c_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_data = buffer_1_auto_out_c_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_c_bits_corrupt = buffer_1_auto_out_c_bits_corrupt; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_d_ready = buffer_1_auto_out_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_e_valid = buffer_1_auto_out_e_valid; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign auto_tl_master_clock_xing_out_e_bits_sink = buffer_1_auto_out_e_bits_sink; // @[Nodes.scala 1210:84 LazyModule.scala 296:16]
  assign tile_reset_domain_auto_tile_int_local_in_3_0 = intsink_3_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_tile_int_local_in_2_0 = intsink_2_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_tile_int_local_in_1_0 = intsink_1_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_tile_int_local_in_1_1 = intsink_1_auto_out_1; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_tile_int_local_in_0_0 = intsink_auto_out_0; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_tile_hartid_in = auto_tile_reset_domain_tile_hartid_in; // @[LazyModule.scala 309:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_a_ready = buffer_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_valid = buffer_auto_in_b_valid; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_opcode = buffer_auto_in_b_bits_opcode; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_param = buffer_auto_in_b_bits_param; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_size = buffer_auto_in_b_bits_size; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_source = buffer_auto_in_b_bits_source; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_address = buffer_auto_in_b_bits_address; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_mask = buffer_auto_in_b_bits_mask; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_b_bits_corrupt = buffer_auto_in_b_bits_corrupt; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_c_ready = buffer_auto_in_c_ready; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_valid = buffer_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_param = buffer_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_size = buffer_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_source = buffer_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_sink = buffer_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_denied = buffer_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_data = buffer_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_tile_tl_other_masters_out_e_ready = buffer_auto_in_e_ready; // @[LazyModule.scala 298:16]
  assign tile_reset_domain_auto_clock_in_clock = clockNode_auto_out_clock; // @[LazyModule.scala 296:16]
  assign tile_reset_domain_auto_clock_in_reset = clockNode_auto_out_reset; // @[LazyModule.scala 296:16]
  assign clockNode_auto_in_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign clockNode_auto_in_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_auto_in_a_valid = tile_reset_domain_auto_tile_tl_other_masters_out_a_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_opcode = tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_param = tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_size = tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_source = tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_address = tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_mask = tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_a_bits_data = tile_reset_domain_auto_tile_tl_other_masters_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_b_ready = tile_reset_domain_auto_tile_tl_other_masters_out_b_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_valid = tile_reset_domain_auto_tile_tl_other_masters_out_c_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_opcode = tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_param = tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_size = tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_source = tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_address = tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_c_bits_data = tile_reset_domain_auto_tile_tl_other_masters_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_d_ready = tile_reset_domain_auto_tile_tl_other_masters_out_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_e_valid = tile_reset_domain_auto_tile_tl_other_masters_out_e_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_in_e_bits_sink = tile_reset_domain_auto_tile_tl_other_masters_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_a_ready = buffer_1_auto_in_a_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_valid = buffer_1_auto_in_b_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_opcode = buffer_1_auto_in_b_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_param = buffer_1_auto_in_b_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_size = buffer_1_auto_in_b_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_source = buffer_1_auto_in_b_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_address = buffer_1_auto_in_b_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_mask = buffer_1_auto_in_b_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_b_bits_corrupt = buffer_1_auto_in_b_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_c_ready = buffer_1_auto_in_c_ready; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_valid = buffer_1_auto_in_d_valid; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_opcode = buffer_1_auto_in_d_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_param = buffer_1_auto_in_d_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_size = buffer_1_auto_in_d_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_source = buffer_1_auto_in_d_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_sink = buffer_1_auto_in_d_bits_sink; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_denied = buffer_1_auto_in_d_bits_denied; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_data = buffer_1_auto_in_d_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_d_bits_corrupt = buffer_1_auto_in_d_bits_corrupt; // @[LazyModule.scala 298:16]
  assign buffer_auto_out_e_ready = buffer_1_auto_in_e_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign buffer_1_auto_in_a_valid = buffer_auto_out_a_valid; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_param = buffer_auto_out_a_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_size = buffer_auto_out_a_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_source = buffer_auto_out_a_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_address = buffer_auto_out_a_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_a_bits_data = buffer_auto_out_a_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_b_ready = buffer_auto_out_b_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_valid = buffer_auto_out_c_valid; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_opcode = buffer_auto_out_c_bits_opcode; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_param = buffer_auto_out_c_bits_param; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_size = buffer_auto_out_c_bits_size; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_source = buffer_auto_out_c_bits_source; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_address = buffer_auto_out_c_bits_address; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_c_bits_data = buffer_auto_out_c_bits_data; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_d_ready = buffer_auto_out_d_ready; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_e_valid = buffer_auto_out_e_valid; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_in_e_bits_sink = buffer_auto_out_e_bits_sink; // @[LazyModule.scala 298:16]
  assign buffer_1_auto_out_a_ready = auto_tl_master_clock_xing_out_a_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_valid = auto_tl_master_clock_xing_out_b_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_param = auto_tl_master_clock_xing_out_b_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_b_bits_address = auto_tl_master_clock_xing_out_b_bits_address; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_c_ready = auto_tl_master_clock_xing_out_c_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_valid = auto_tl_master_clock_xing_out_d_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_opcode = auto_tl_master_clock_xing_out_d_bits_opcode; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_param = auto_tl_master_clock_xing_out_d_bits_param; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_size = auto_tl_master_clock_xing_out_d_bits_size; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_source = auto_tl_master_clock_xing_out_d_bits_source; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_sink = auto_tl_master_clock_xing_out_d_bits_sink; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_denied = auto_tl_master_clock_xing_out_d_bits_denied; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_data = auto_tl_master_clock_xing_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign buffer_1_auto_out_d_bits_corrupt = auto_tl_master_clock_xing_out_d_bits_corrupt; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign intsink_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_auto_in_sync_0 = auto_intsink_in_sync_0; // @[LazyModule.scala 309:16]
  assign intsink_1_auto_in_sync_0 = auto_int_in_clock_xing_in_0_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_1_auto_in_sync_1 = auto_int_in_clock_xing_in_0_sync_1; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_2_auto_in_sync_0 = auto_int_in_clock_xing_in_1_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsink_3_auto_in_sync_0 = auto_int_in_clock_xing_in_2_sync_0; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_1_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_1_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_1_auto_in_0 = 1'h0; // @[LazyModule.scala 298:16]
  assign intsource_2_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_2_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_2_auto_in_0 = tile_reset_domain_auto_tile_wfi_out_0; // @[LazyModule.scala 298:16]
  assign intsource_3_clock = auto_tap_clock_in_clock; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_3_reset = auto_tap_clock_in_reset; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign intsource_3_auto_in_0 = 1'h0; // @[LazyModule.scala 298:16]
endmodule
