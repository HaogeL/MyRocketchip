module TLToAXI4_1(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input         auto_in_a_bits_user_amba_prot_bufferable,
  input         auto_in_a_bits_user_amba_prot_modifiable,
  input         auto_in_a_bits_user_amba_prot_readalloc,
  input         auto_in_a_bits_user_amba_prot_writealloc,
  input         auto_in_a_bits_user_amba_prot_privileged,
  input         auto_in_a_bits_user_amba_prot_secure,
  input         auto_in_a_bits_user_amba_prot_fetch,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [2:0]  auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output [6:0]  auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [1:0]  auto_out_aw_bits_burst,
  output        auto_out_aw_bits_lock,
  output [3:0]  auto_out_aw_bits_cache,
  output [2:0]  auto_out_aw_bits_prot,
  output [3:0]  auto_out_aw_bits_qos,
  output [3:0]  auto_out_aw_bits_echo_tl_state_size,
  output [6:0]  auto_out_aw_bits_echo_tl_state_source,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input  [6:0]  auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input  [3:0]  auto_out_b_bits_echo_tl_state_size,
  input  [6:0]  auto_out_b_bits_echo_tl_state_source,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output [6:0]  auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [1:0]  auto_out_ar_bits_burst,
  output        auto_out_ar_bits_lock,
  output [3:0]  auto_out_ar_bits_cache,
  output [2:0]  auto_out_ar_bits_prot,
  output [3:0]  auto_out_ar_bits_qos,
  output [3:0]  auto_out_ar_bits_echo_tl_state_size,
  output [6:0]  auto_out_ar_bits_echo_tl_state_source,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input  [6:0]  auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input  [3:0]  auto_out_r_bits_echo_tl_state_size,
  input  [6:0]  auto_out_r_bits_echo_tl_state_source,
  input         auto_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
  reg [31:0] _RAND_40;
  reg [31:0] _RAND_41;
  reg [31:0] _RAND_42;
  reg [31:0] _RAND_43;
  reg [31:0] _RAND_44;
  reg [31:0] _RAND_45;
  reg [31:0] _RAND_46;
  reg [31:0] _RAND_47;
  reg [31:0] _RAND_48;
  reg [31:0] _RAND_49;
  reg [31:0] _RAND_50;
  reg [31:0] _RAND_51;
  reg [31:0] _RAND_52;
  reg [31:0] _RAND_53;
  reg [31:0] _RAND_54;
  reg [31:0] _RAND_55;
  reg [31:0] _RAND_56;
  reg [31:0] _RAND_57;
  reg [31:0] _RAND_58;
  reg [31:0] _RAND_59;
  reg [31:0] _RAND_60;
  reg [31:0] _RAND_61;
  reg [31:0] _RAND_62;
  reg [31:0] _RAND_63;
  reg [31:0] _RAND_64;
  reg [31:0] _RAND_65;
  reg [31:0] _RAND_66;
  reg [31:0] _RAND_67;
  reg [31:0] _RAND_68;
  reg [31:0] _RAND_69;
  reg [31:0] _RAND_70;
  reg [31:0] _RAND_71;
  reg [31:0] _RAND_72;
  reg [31:0] _RAND_73;
  reg [31:0] _RAND_74;
  reg [31:0] _RAND_75;
  reg [31:0] _RAND_76;
  reg [31:0] _RAND_77;
  reg [31:0] _RAND_78;
  reg [31:0] _RAND_79;
  reg [31:0] _RAND_80;
  reg [31:0] _RAND_81;
  reg [31:0] _RAND_82;
  reg [31:0] _RAND_83;
  reg [31:0] _RAND_84;
  reg [31:0] _RAND_85;
  reg [31:0] _RAND_86;
  reg [31:0] _RAND_87;
  reg [31:0] _RAND_88;
  reg [31:0] _RAND_89;
  reg [31:0] _RAND_90;
  reg [31:0] _RAND_91;
  reg [31:0] _RAND_92;
  reg [31:0] _RAND_93;
  reg [31:0] _RAND_94;
  reg [31:0] _RAND_95;
  reg [31:0] _RAND_96;
  reg [31:0] _RAND_97;
  reg [31:0] _RAND_98;
  reg [31:0] _RAND_99;
  reg [31:0] _RAND_100;
  reg [31:0] _RAND_101;
  reg [31:0] _RAND_102;
  reg [31:0] _RAND_103;
  reg [31:0] _RAND_104;
  reg [31:0] _RAND_105;
  reg [31:0] _RAND_106;
  reg [31:0] _RAND_107;
  reg [31:0] _RAND_108;
  reg [31:0] _RAND_109;
  reg [31:0] _RAND_110;
  reg [31:0] _RAND_111;
  reg [31:0] _RAND_112;
  reg [31:0] _RAND_113;
  reg [31:0] _RAND_114;
  reg [31:0] _RAND_115;
  reg [31:0] _RAND_116;
  reg [31:0] _RAND_117;
  reg [31:0] _RAND_118;
  reg [31:0] _RAND_119;
  reg [31:0] _RAND_120;
  reg [31:0] _RAND_121;
  reg [31:0] _RAND_122;
  reg [31:0] _RAND_123;
  reg [31:0] _RAND_124;
  reg [31:0] _RAND_125;
  reg [31:0] _RAND_126;
  reg [31:0] _RAND_127;
  reg [31:0] _RAND_128;
  reg [31:0] _RAND_129;
  reg [31:0] _RAND_130;
  reg [31:0] _RAND_131;
  reg [31:0] _RAND_132;
  reg [31:0] _RAND_133;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock; // @[Nodes.scala 24:25]
  wire  monitor_reset; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_a_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_param; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_a_bits_size; // @[Nodes.scala 24:25]
  wire [6:0] monitor_io_in_a_bits_source; // @[Nodes.scala 24:25]
  wire [31:0] monitor_io_in_a_bits_address; // @[Nodes.scala 24:25]
  wire [7:0] monitor_io_in_a_bits_mask; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_ready; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_valid; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_opcode; // @[Nodes.scala 24:25]
  wire [2:0] monitor_io_in_d_bits_size; // @[Nodes.scala 24:25]
  wire [6:0] monitor_io_in_d_bits_source; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_denied; // @[Nodes.scala 24:25]
  wire  monitor_io_in_d_bits_corrupt; // @[Nodes.scala 24:25]
  wire  deq_clock; // @[Decoupled.scala 361:21]
  wire  deq_reset; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] deq_io_enq_bits_strb; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_bits_last; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] deq_io_deq_bits_strb; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_bits_last; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_clock; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_reset; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [6:0] queue_arw_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] queue_arw_deq_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] queue_arw_deq_io_enq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] queue_arw_deq_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [3:0] queue_arw_deq_io_enq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] queue_arw_deq_io_enq_bits_prot; // @[Decoupled.scala 361:21]
  wire [3:0] queue_arw_deq_io_enq_bits_echo_tl_state_size; // @[Decoupled.scala 361:21]
  wire [6:0] queue_arw_deq_io_enq_bits_echo_tl_state_source; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_io_enq_bits_wen; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [6:0] queue_arw_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] queue_arw_deq_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] queue_arw_deq_io_deq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] queue_arw_deq_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] queue_arw_deq_io_deq_bits_burst; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_io_deq_bits_lock; // @[Decoupled.scala 361:21]
  wire [3:0] queue_arw_deq_io_deq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] queue_arw_deq_io_deq_bits_prot; // @[Decoupled.scala 361:21]
  wire [3:0] queue_arw_deq_io_deq_bits_qos; // @[Decoupled.scala 361:21]
  wire [3:0] queue_arw_deq_io_deq_bits_echo_tl_state_size; // @[Decoupled.scala 361:21]
  wire [6:0] queue_arw_deq_io_deq_bits_echo_tl_state_source; // @[Decoupled.scala 361:21]
  wire  queue_arw_deq_io_deq_bits_wen; // @[Decoupled.scala 361:21]
  wire  a_isPut = ~auto_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  reg  count_128; // @[ToAXI4.scala 254:28]
  wire  idle_127 = ~count_128; // @[ToAXI4.scala 256:26]
  reg  count_127; // @[ToAXI4.scala 254:28]
  wire  idle_126 = ~count_127; // @[ToAXI4.scala 256:26]
  reg  count_126; // @[ToAXI4.scala 254:28]
  wire  idle_125 = ~count_126; // @[ToAXI4.scala 256:26]
  reg  count_125; // @[ToAXI4.scala 254:28]
  wire  idle_124 = ~count_125; // @[ToAXI4.scala 256:26]
  reg  count_124; // @[ToAXI4.scala 254:28]
  wire  idle_123 = ~count_124; // @[ToAXI4.scala 256:26]
  reg  count_123; // @[ToAXI4.scala 254:28]
  wire  idle_122 = ~count_123; // @[ToAXI4.scala 256:26]
  reg  count_122; // @[ToAXI4.scala 254:28]
  wire  idle_121 = ~count_122; // @[ToAXI4.scala 256:26]
  reg  count_121; // @[ToAXI4.scala 254:28]
  wire  idle_120 = ~count_121; // @[ToAXI4.scala 256:26]
  reg  count_120; // @[ToAXI4.scala 254:28]
  wire  idle_119 = ~count_120; // @[ToAXI4.scala 256:26]
  reg  count_119; // @[ToAXI4.scala 254:28]
  wire  idle_118 = ~count_119; // @[ToAXI4.scala 256:26]
  reg  count_118; // @[ToAXI4.scala 254:28]
  wire  idle_117 = ~count_118; // @[ToAXI4.scala 256:26]
  reg  count_117; // @[ToAXI4.scala 254:28]
  wire  idle_116 = ~count_117; // @[ToAXI4.scala 256:26]
  reg  count_116; // @[ToAXI4.scala 254:28]
  wire  idle_115 = ~count_116; // @[ToAXI4.scala 256:26]
  reg  count_115; // @[ToAXI4.scala 254:28]
  wire  idle_114 = ~count_115; // @[ToAXI4.scala 256:26]
  reg  count_114; // @[ToAXI4.scala 254:28]
  wire  idle_113 = ~count_114; // @[ToAXI4.scala 256:26]
  reg  count_113; // @[ToAXI4.scala 254:28]
  wire  idle_112 = ~count_113; // @[ToAXI4.scala 256:26]
  reg  count_112; // @[ToAXI4.scala 254:28]
  wire  idle_111 = ~count_112; // @[ToAXI4.scala 256:26]
  reg  count_111; // @[ToAXI4.scala 254:28]
  wire  idle_110 = ~count_111; // @[ToAXI4.scala 256:26]
  reg  count_110; // @[ToAXI4.scala 254:28]
  wire  idle_109 = ~count_110; // @[ToAXI4.scala 256:26]
  reg  count_109; // @[ToAXI4.scala 254:28]
  wire  idle_108 = ~count_109; // @[ToAXI4.scala 256:26]
  reg  count_108; // @[ToAXI4.scala 254:28]
  wire  idle_107 = ~count_108; // @[ToAXI4.scala 256:26]
  reg  count_107; // @[ToAXI4.scala 254:28]
  wire  idle_106 = ~count_107; // @[ToAXI4.scala 256:26]
  reg  count_106; // @[ToAXI4.scala 254:28]
  wire  idle_105 = ~count_106; // @[ToAXI4.scala 256:26]
  reg  count_105; // @[ToAXI4.scala 254:28]
  wire  idle_104 = ~count_105; // @[ToAXI4.scala 256:26]
  reg  count_104; // @[ToAXI4.scala 254:28]
  wire  idle_103 = ~count_104; // @[ToAXI4.scala 256:26]
  reg  count_103; // @[ToAXI4.scala 254:28]
  wire  idle_102 = ~count_103; // @[ToAXI4.scala 256:26]
  reg  count_102; // @[ToAXI4.scala 254:28]
  wire  idle_101 = ~count_102; // @[ToAXI4.scala 256:26]
  reg  count_101; // @[ToAXI4.scala 254:28]
  wire  idle_100 = ~count_101; // @[ToAXI4.scala 256:26]
  reg  count_100; // @[ToAXI4.scala 254:28]
  wire  idle_99 = ~count_100; // @[ToAXI4.scala 256:26]
  reg  count_99; // @[ToAXI4.scala 254:28]
  wire  idle_98 = ~count_99; // @[ToAXI4.scala 256:26]
  reg  count_98; // @[ToAXI4.scala 254:28]
  wire  idle_97 = ~count_98; // @[ToAXI4.scala 256:26]
  reg  count_97; // @[ToAXI4.scala 254:28]
  wire  idle_96 = ~count_97; // @[ToAXI4.scala 256:26]
  reg  count_96; // @[ToAXI4.scala 254:28]
  wire  idle_95 = ~count_96; // @[ToAXI4.scala 256:26]
  reg  count_95; // @[ToAXI4.scala 254:28]
  wire  idle_94 = ~count_95; // @[ToAXI4.scala 256:26]
  reg  count_94; // @[ToAXI4.scala 254:28]
  wire  idle_93 = ~count_94; // @[ToAXI4.scala 256:26]
  reg  count_93; // @[ToAXI4.scala 254:28]
  wire  idle_92 = ~count_93; // @[ToAXI4.scala 256:26]
  reg  count_92; // @[ToAXI4.scala 254:28]
  wire  idle_91 = ~count_92; // @[ToAXI4.scala 256:26]
  reg  count_91; // @[ToAXI4.scala 254:28]
  wire  idle_90 = ~count_91; // @[ToAXI4.scala 256:26]
  reg  count_90; // @[ToAXI4.scala 254:28]
  wire  idle_89 = ~count_90; // @[ToAXI4.scala 256:26]
  reg  count_89; // @[ToAXI4.scala 254:28]
  wire  idle_88 = ~count_89; // @[ToAXI4.scala 256:26]
  reg  count_88; // @[ToAXI4.scala 254:28]
  wire  idle_87 = ~count_88; // @[ToAXI4.scala 256:26]
  reg  count_87; // @[ToAXI4.scala 254:28]
  wire  idle_86 = ~count_87; // @[ToAXI4.scala 256:26]
  reg  count_86; // @[ToAXI4.scala 254:28]
  wire  idle_85 = ~count_86; // @[ToAXI4.scala 256:26]
  reg  count_85; // @[ToAXI4.scala 254:28]
  wire  idle_84 = ~count_85; // @[ToAXI4.scala 256:26]
  reg  count_84; // @[ToAXI4.scala 254:28]
  wire  idle_83 = ~count_84; // @[ToAXI4.scala 256:26]
  reg  count_83; // @[ToAXI4.scala 254:28]
  wire  idle_82 = ~count_83; // @[ToAXI4.scala 256:26]
  reg  count_82; // @[ToAXI4.scala 254:28]
  wire  idle_81 = ~count_82; // @[ToAXI4.scala 256:26]
  reg  count_81; // @[ToAXI4.scala 254:28]
  wire  idle_80 = ~count_81; // @[ToAXI4.scala 256:26]
  reg  count_80; // @[ToAXI4.scala 254:28]
  wire  idle_79 = ~count_80; // @[ToAXI4.scala 256:26]
  reg  count_79; // @[ToAXI4.scala 254:28]
  wire  idle_78 = ~count_79; // @[ToAXI4.scala 256:26]
  reg  count_78; // @[ToAXI4.scala 254:28]
  wire  idle_77 = ~count_78; // @[ToAXI4.scala 256:26]
  reg  count_77; // @[ToAXI4.scala 254:28]
  wire  idle_76 = ~count_77; // @[ToAXI4.scala 256:26]
  reg  count_76; // @[ToAXI4.scala 254:28]
  wire  idle_75 = ~count_76; // @[ToAXI4.scala 256:26]
  reg  count_75; // @[ToAXI4.scala 254:28]
  wire  idle_74 = ~count_75; // @[ToAXI4.scala 256:26]
  reg  count_74; // @[ToAXI4.scala 254:28]
  wire  idle_73 = ~count_74; // @[ToAXI4.scala 256:26]
  reg  count_73; // @[ToAXI4.scala 254:28]
  wire  idle_72 = ~count_73; // @[ToAXI4.scala 256:26]
  reg  count_72; // @[ToAXI4.scala 254:28]
  wire  idle_71 = ~count_72; // @[ToAXI4.scala 256:26]
  reg  count_71; // @[ToAXI4.scala 254:28]
  wire  idle_70 = ~count_71; // @[ToAXI4.scala 256:26]
  reg  count_70; // @[ToAXI4.scala 254:28]
  wire  idle_69 = ~count_70; // @[ToAXI4.scala 256:26]
  reg  count_69; // @[ToAXI4.scala 254:28]
  wire  idle_68 = ~count_69; // @[ToAXI4.scala 256:26]
  reg  count_68; // @[ToAXI4.scala 254:28]
  wire  idle_67 = ~count_68; // @[ToAXI4.scala 256:26]
  reg  count_67; // @[ToAXI4.scala 254:28]
  wire  idle_66 = ~count_67; // @[ToAXI4.scala 256:26]
  reg  count_66; // @[ToAXI4.scala 254:28]
  wire  idle_65 = ~count_66; // @[ToAXI4.scala 256:26]
  reg  count_65; // @[ToAXI4.scala 254:28]
  wire  idle_64 = ~count_65; // @[ToAXI4.scala 256:26]
  reg  count_64; // @[ToAXI4.scala 254:28]
  wire  idle_63 = ~count_64; // @[ToAXI4.scala 256:26]
  reg  count_63; // @[ToAXI4.scala 254:28]
  wire  idle_62 = ~count_63; // @[ToAXI4.scala 256:26]
  reg  count_62; // @[ToAXI4.scala 254:28]
  wire  idle_61 = ~count_62; // @[ToAXI4.scala 256:26]
  reg  count_61; // @[ToAXI4.scala 254:28]
  wire  idle_60 = ~count_61; // @[ToAXI4.scala 256:26]
  reg  count_60; // @[ToAXI4.scala 254:28]
  wire  idle_59 = ~count_60; // @[ToAXI4.scala 256:26]
  reg  count_59; // @[ToAXI4.scala 254:28]
  wire  idle_58 = ~count_59; // @[ToAXI4.scala 256:26]
  reg  count_58; // @[ToAXI4.scala 254:28]
  wire  idle_57 = ~count_58; // @[ToAXI4.scala 256:26]
  reg  count_57; // @[ToAXI4.scala 254:28]
  wire  idle_56 = ~count_57; // @[ToAXI4.scala 256:26]
  reg  count_56; // @[ToAXI4.scala 254:28]
  wire  idle_55 = ~count_56; // @[ToAXI4.scala 256:26]
  reg  count_55; // @[ToAXI4.scala 254:28]
  wire  idle_54 = ~count_55; // @[ToAXI4.scala 256:26]
  reg  count_54; // @[ToAXI4.scala 254:28]
  wire  idle_53 = ~count_54; // @[ToAXI4.scala 256:26]
  reg  count_53; // @[ToAXI4.scala 254:28]
  wire  idle_52 = ~count_53; // @[ToAXI4.scala 256:26]
  reg  count_52; // @[ToAXI4.scala 254:28]
  wire  idle_51 = ~count_52; // @[ToAXI4.scala 256:26]
  reg  count_51; // @[ToAXI4.scala 254:28]
  wire  idle_50 = ~count_51; // @[ToAXI4.scala 256:26]
  reg  count_50; // @[ToAXI4.scala 254:28]
  wire  idle_49 = ~count_50; // @[ToAXI4.scala 256:26]
  reg  count_49; // @[ToAXI4.scala 254:28]
  wire  idle_48 = ~count_49; // @[ToAXI4.scala 256:26]
  reg  count_48; // @[ToAXI4.scala 254:28]
  wire  idle_47 = ~count_48; // @[ToAXI4.scala 256:26]
  reg  count_47; // @[ToAXI4.scala 254:28]
  wire  idle_46 = ~count_47; // @[ToAXI4.scala 256:26]
  reg  count_46; // @[ToAXI4.scala 254:28]
  wire  idle_45 = ~count_46; // @[ToAXI4.scala 256:26]
  reg  count_45; // @[ToAXI4.scala 254:28]
  wire  idle_44 = ~count_45; // @[ToAXI4.scala 256:26]
  reg  count_44; // @[ToAXI4.scala 254:28]
  wire  idle_43 = ~count_44; // @[ToAXI4.scala 256:26]
  reg  count_43; // @[ToAXI4.scala 254:28]
  wire  idle_42 = ~count_43; // @[ToAXI4.scala 256:26]
  reg  count_42; // @[ToAXI4.scala 254:28]
  wire  idle_41 = ~count_42; // @[ToAXI4.scala 256:26]
  reg  count_41; // @[ToAXI4.scala 254:28]
  wire  idle_40 = ~count_41; // @[ToAXI4.scala 256:26]
  reg  count_40; // @[ToAXI4.scala 254:28]
  wire  idle_39 = ~count_40; // @[ToAXI4.scala 256:26]
  reg  count_39; // @[ToAXI4.scala 254:28]
  wire  idle_38 = ~count_39; // @[ToAXI4.scala 256:26]
  reg  count_38; // @[ToAXI4.scala 254:28]
  wire  idle_37 = ~count_38; // @[ToAXI4.scala 256:26]
  reg  count_37; // @[ToAXI4.scala 254:28]
  wire  idle_36 = ~count_37; // @[ToAXI4.scala 256:26]
  reg  count_36; // @[ToAXI4.scala 254:28]
  wire  idle_35 = ~count_36; // @[ToAXI4.scala 256:26]
  reg  count_35; // @[ToAXI4.scala 254:28]
  wire  idle_34 = ~count_35; // @[ToAXI4.scala 256:26]
  reg  count_34; // @[ToAXI4.scala 254:28]
  wire  idle_33 = ~count_34; // @[ToAXI4.scala 256:26]
  reg  count_33; // @[ToAXI4.scala 254:28]
  wire  idle_32 = ~count_33; // @[ToAXI4.scala 256:26]
  reg  count_32; // @[ToAXI4.scala 254:28]
  wire  idle_31 = ~count_32; // @[ToAXI4.scala 256:26]
  reg  count_31; // @[ToAXI4.scala 254:28]
  wire  idle_30 = ~count_31; // @[ToAXI4.scala 256:26]
  reg  count_30; // @[ToAXI4.scala 254:28]
  wire  idle_29 = ~count_30; // @[ToAXI4.scala 256:26]
  reg  count_29; // @[ToAXI4.scala 254:28]
  wire  idle_28 = ~count_29; // @[ToAXI4.scala 256:26]
  reg  count_28; // @[ToAXI4.scala 254:28]
  wire  idle_27 = ~count_28; // @[ToAXI4.scala 256:26]
  reg  count_27; // @[ToAXI4.scala 254:28]
  wire  idle_26 = ~count_27; // @[ToAXI4.scala 256:26]
  reg  count_26; // @[ToAXI4.scala 254:28]
  wire  idle_25 = ~count_26; // @[ToAXI4.scala 256:26]
  reg  count_25; // @[ToAXI4.scala 254:28]
  wire  idle_24 = ~count_25; // @[ToAXI4.scala 256:26]
  reg  count_24; // @[ToAXI4.scala 254:28]
  wire  idle_23 = ~count_24; // @[ToAXI4.scala 256:26]
  reg  count_23; // @[ToAXI4.scala 254:28]
  wire  idle_22 = ~count_23; // @[ToAXI4.scala 256:26]
  reg  count_22; // @[ToAXI4.scala 254:28]
  wire  idle_21 = ~count_22; // @[ToAXI4.scala 256:26]
  reg  count_21; // @[ToAXI4.scala 254:28]
  wire  idle_20 = ~count_21; // @[ToAXI4.scala 256:26]
  reg  count_20; // @[ToAXI4.scala 254:28]
  wire  idle_19 = ~count_20; // @[ToAXI4.scala 256:26]
  reg  count_19; // @[ToAXI4.scala 254:28]
  wire  idle_18 = ~count_19; // @[ToAXI4.scala 256:26]
  reg  count_18; // @[ToAXI4.scala 254:28]
  wire  idle_17 = ~count_18; // @[ToAXI4.scala 256:26]
  reg  count_17; // @[ToAXI4.scala 254:28]
  wire  idle_16 = ~count_17; // @[ToAXI4.scala 256:26]
  reg  count_16; // @[ToAXI4.scala 254:28]
  wire  idle_15 = ~count_16; // @[ToAXI4.scala 256:26]
  reg  count_15; // @[ToAXI4.scala 254:28]
  wire  idle_14 = ~count_15; // @[ToAXI4.scala 256:26]
  reg  count_14; // @[ToAXI4.scala 254:28]
  wire  idle_13 = ~count_14; // @[ToAXI4.scala 256:26]
  reg  count_13; // @[ToAXI4.scala 254:28]
  wire  idle_12 = ~count_13; // @[ToAXI4.scala 256:26]
  reg  count_12; // @[ToAXI4.scala 254:28]
  wire  idle_11 = ~count_12; // @[ToAXI4.scala 256:26]
  reg  count_11; // @[ToAXI4.scala 254:28]
  wire  idle_10 = ~count_11; // @[ToAXI4.scala 256:26]
  reg  count_10; // @[ToAXI4.scala 254:28]
  wire  idle_9 = ~count_10; // @[ToAXI4.scala 256:26]
  reg  count_9; // @[ToAXI4.scala 254:28]
  wire  idle_8 = ~count_9; // @[ToAXI4.scala 256:26]
  reg  count_8; // @[ToAXI4.scala 254:28]
  wire  idle_7 = ~count_8; // @[ToAXI4.scala 256:26]
  reg  count_7; // @[ToAXI4.scala 254:28]
  wire  idle_6 = ~count_7; // @[ToAXI4.scala 256:26]
  reg  count_6; // @[ToAXI4.scala 254:28]
  wire  idle_5 = ~count_6; // @[ToAXI4.scala 256:26]
  reg  count_5; // @[ToAXI4.scala 254:28]
  wire  idle_4 = ~count_5; // @[ToAXI4.scala 256:26]
  reg  count_4; // @[ToAXI4.scala 254:28]
  wire  idle_3 = ~count_4; // @[ToAXI4.scala 256:26]
  reg  count_3; // @[ToAXI4.scala 254:28]
  wire  idle_2 = ~count_3; // @[ToAXI4.scala 256:26]
  reg  count_2; // @[ToAXI4.scala 254:28]
  wire  idle_1 = ~count_2; // @[ToAXI4.scala 256:26]
  reg  count_1; // @[ToAXI4.scala 254:28]
  wire  idle = ~count_1; // @[ToAXI4.scala 256:26]
  wire  _GEN_131 = 7'h1 == auto_in_a_bits_source ? count_2 : count_1; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_132 = 7'h2 == auto_in_a_bits_source ? count_3 : _GEN_131; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_133 = 7'h3 == auto_in_a_bits_source ? count_4 : _GEN_132; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_134 = 7'h4 == auto_in_a_bits_source ? count_5 : _GEN_133; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_135 = 7'h5 == auto_in_a_bits_source ? count_6 : _GEN_134; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_136 = 7'h6 == auto_in_a_bits_source ? count_7 : _GEN_135; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_137 = 7'h7 == auto_in_a_bits_source ? count_8 : _GEN_136; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_138 = 7'h8 == auto_in_a_bits_source ? count_9 : _GEN_137; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_139 = 7'h9 == auto_in_a_bits_source ? count_10 : _GEN_138; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_140 = 7'ha == auto_in_a_bits_source ? count_11 : _GEN_139; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_141 = 7'hb == auto_in_a_bits_source ? count_12 : _GEN_140; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_142 = 7'hc == auto_in_a_bits_source ? count_13 : _GEN_141; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_143 = 7'hd == auto_in_a_bits_source ? count_14 : _GEN_142; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_144 = 7'he == auto_in_a_bits_source ? count_15 : _GEN_143; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_145 = 7'hf == auto_in_a_bits_source ? count_16 : _GEN_144; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_146 = 7'h10 == auto_in_a_bits_source ? count_17 : _GEN_145; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_147 = 7'h11 == auto_in_a_bits_source ? count_18 : _GEN_146; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_148 = 7'h12 == auto_in_a_bits_source ? count_19 : _GEN_147; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_149 = 7'h13 == auto_in_a_bits_source ? count_20 : _GEN_148; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_150 = 7'h14 == auto_in_a_bits_source ? count_21 : _GEN_149; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_151 = 7'h15 == auto_in_a_bits_source ? count_22 : _GEN_150; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_152 = 7'h16 == auto_in_a_bits_source ? count_23 : _GEN_151; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_153 = 7'h17 == auto_in_a_bits_source ? count_24 : _GEN_152; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_154 = 7'h18 == auto_in_a_bits_source ? count_25 : _GEN_153; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_155 = 7'h19 == auto_in_a_bits_source ? count_26 : _GEN_154; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_156 = 7'h1a == auto_in_a_bits_source ? count_27 : _GEN_155; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_157 = 7'h1b == auto_in_a_bits_source ? count_28 : _GEN_156; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_158 = 7'h1c == auto_in_a_bits_source ? count_29 : _GEN_157; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_159 = 7'h1d == auto_in_a_bits_source ? count_30 : _GEN_158; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_160 = 7'h1e == auto_in_a_bits_source ? count_31 : _GEN_159; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_161 = 7'h1f == auto_in_a_bits_source ? count_32 : _GEN_160; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_162 = 7'h20 == auto_in_a_bits_source ? count_33 : _GEN_161; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_163 = 7'h21 == auto_in_a_bits_source ? count_34 : _GEN_162; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_164 = 7'h22 == auto_in_a_bits_source ? count_35 : _GEN_163; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_165 = 7'h23 == auto_in_a_bits_source ? count_36 : _GEN_164; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_166 = 7'h24 == auto_in_a_bits_source ? count_37 : _GEN_165; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_167 = 7'h25 == auto_in_a_bits_source ? count_38 : _GEN_166; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_168 = 7'h26 == auto_in_a_bits_source ? count_39 : _GEN_167; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_169 = 7'h27 == auto_in_a_bits_source ? count_40 : _GEN_168; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_170 = 7'h28 == auto_in_a_bits_source ? count_41 : _GEN_169; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_171 = 7'h29 == auto_in_a_bits_source ? count_42 : _GEN_170; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_172 = 7'h2a == auto_in_a_bits_source ? count_43 : _GEN_171; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_173 = 7'h2b == auto_in_a_bits_source ? count_44 : _GEN_172; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_174 = 7'h2c == auto_in_a_bits_source ? count_45 : _GEN_173; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_175 = 7'h2d == auto_in_a_bits_source ? count_46 : _GEN_174; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_176 = 7'h2e == auto_in_a_bits_source ? count_47 : _GEN_175; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_177 = 7'h2f == auto_in_a_bits_source ? count_48 : _GEN_176; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_178 = 7'h30 == auto_in_a_bits_source ? count_49 : _GEN_177; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_179 = 7'h31 == auto_in_a_bits_source ? count_50 : _GEN_178; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_180 = 7'h32 == auto_in_a_bits_source ? count_51 : _GEN_179; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_181 = 7'h33 == auto_in_a_bits_source ? count_52 : _GEN_180; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_182 = 7'h34 == auto_in_a_bits_source ? count_53 : _GEN_181; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_183 = 7'h35 == auto_in_a_bits_source ? count_54 : _GEN_182; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_184 = 7'h36 == auto_in_a_bits_source ? count_55 : _GEN_183; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_185 = 7'h37 == auto_in_a_bits_source ? count_56 : _GEN_184; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_186 = 7'h38 == auto_in_a_bits_source ? count_57 : _GEN_185; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_187 = 7'h39 == auto_in_a_bits_source ? count_58 : _GEN_186; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_188 = 7'h3a == auto_in_a_bits_source ? count_59 : _GEN_187; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_189 = 7'h3b == auto_in_a_bits_source ? count_60 : _GEN_188; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_190 = 7'h3c == auto_in_a_bits_source ? count_61 : _GEN_189; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_191 = 7'h3d == auto_in_a_bits_source ? count_62 : _GEN_190; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_192 = 7'h3e == auto_in_a_bits_source ? count_63 : _GEN_191; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_193 = 7'h3f == auto_in_a_bits_source ? count_64 : _GEN_192; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_194 = 7'h40 == auto_in_a_bits_source ? count_65 : _GEN_193; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_195 = 7'h41 == auto_in_a_bits_source ? count_66 : _GEN_194; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_196 = 7'h42 == auto_in_a_bits_source ? count_67 : _GEN_195; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_197 = 7'h43 == auto_in_a_bits_source ? count_68 : _GEN_196; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_198 = 7'h44 == auto_in_a_bits_source ? count_69 : _GEN_197; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_199 = 7'h45 == auto_in_a_bits_source ? count_70 : _GEN_198; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_200 = 7'h46 == auto_in_a_bits_source ? count_71 : _GEN_199; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_201 = 7'h47 == auto_in_a_bits_source ? count_72 : _GEN_200; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_202 = 7'h48 == auto_in_a_bits_source ? count_73 : _GEN_201; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_203 = 7'h49 == auto_in_a_bits_source ? count_74 : _GEN_202; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_204 = 7'h4a == auto_in_a_bits_source ? count_75 : _GEN_203; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_205 = 7'h4b == auto_in_a_bits_source ? count_76 : _GEN_204; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_206 = 7'h4c == auto_in_a_bits_source ? count_77 : _GEN_205; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_207 = 7'h4d == auto_in_a_bits_source ? count_78 : _GEN_206; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_208 = 7'h4e == auto_in_a_bits_source ? count_79 : _GEN_207; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_209 = 7'h4f == auto_in_a_bits_source ? count_80 : _GEN_208; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_210 = 7'h50 == auto_in_a_bits_source ? count_81 : _GEN_209; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_211 = 7'h51 == auto_in_a_bits_source ? count_82 : _GEN_210; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_212 = 7'h52 == auto_in_a_bits_source ? count_83 : _GEN_211; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_213 = 7'h53 == auto_in_a_bits_source ? count_84 : _GEN_212; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_214 = 7'h54 == auto_in_a_bits_source ? count_85 : _GEN_213; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_215 = 7'h55 == auto_in_a_bits_source ? count_86 : _GEN_214; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_216 = 7'h56 == auto_in_a_bits_source ? count_87 : _GEN_215; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_217 = 7'h57 == auto_in_a_bits_source ? count_88 : _GEN_216; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_218 = 7'h58 == auto_in_a_bits_source ? count_89 : _GEN_217; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_219 = 7'h59 == auto_in_a_bits_source ? count_90 : _GEN_218; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_220 = 7'h5a == auto_in_a_bits_source ? count_91 : _GEN_219; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_221 = 7'h5b == auto_in_a_bits_source ? count_92 : _GEN_220; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_222 = 7'h5c == auto_in_a_bits_source ? count_93 : _GEN_221; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_223 = 7'h5d == auto_in_a_bits_source ? count_94 : _GEN_222; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_224 = 7'h5e == auto_in_a_bits_source ? count_95 : _GEN_223; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_225 = 7'h5f == auto_in_a_bits_source ? count_96 : _GEN_224; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_226 = 7'h60 == auto_in_a_bits_source ? count_97 : _GEN_225; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_227 = 7'h61 == auto_in_a_bits_source ? count_98 : _GEN_226; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_228 = 7'h62 == auto_in_a_bits_source ? count_99 : _GEN_227; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_229 = 7'h63 == auto_in_a_bits_source ? count_100 : _GEN_228; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_230 = 7'h64 == auto_in_a_bits_source ? count_101 : _GEN_229; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_231 = 7'h65 == auto_in_a_bits_source ? count_102 : _GEN_230; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_232 = 7'h66 == auto_in_a_bits_source ? count_103 : _GEN_231; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_233 = 7'h67 == auto_in_a_bits_source ? count_104 : _GEN_232; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_234 = 7'h68 == auto_in_a_bits_source ? count_105 : _GEN_233; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_235 = 7'h69 == auto_in_a_bits_source ? count_106 : _GEN_234; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_236 = 7'h6a == auto_in_a_bits_source ? count_107 : _GEN_235; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_237 = 7'h6b == auto_in_a_bits_source ? count_108 : _GEN_236; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_238 = 7'h6c == auto_in_a_bits_source ? count_109 : _GEN_237; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_239 = 7'h6d == auto_in_a_bits_source ? count_110 : _GEN_238; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_240 = 7'h6e == auto_in_a_bits_source ? count_111 : _GEN_239; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_241 = 7'h6f == auto_in_a_bits_source ? count_112 : _GEN_240; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_242 = 7'h70 == auto_in_a_bits_source ? count_113 : _GEN_241; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_243 = 7'h71 == auto_in_a_bits_source ? count_114 : _GEN_242; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_244 = 7'h72 == auto_in_a_bits_source ? count_115 : _GEN_243; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_245 = 7'h73 == auto_in_a_bits_source ? count_116 : _GEN_244; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_246 = 7'h74 == auto_in_a_bits_source ? count_117 : _GEN_245; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_247 = 7'h75 == auto_in_a_bits_source ? count_118 : _GEN_246; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_248 = 7'h76 == auto_in_a_bits_source ? count_119 : _GEN_247; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_249 = 7'h77 == auto_in_a_bits_source ? count_120 : _GEN_248; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_250 = 7'h78 == auto_in_a_bits_source ? count_121 : _GEN_249; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_251 = 7'h79 == auto_in_a_bits_source ? count_122 : _GEN_250; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_252 = 7'h7a == auto_in_a_bits_source ? count_123 : _GEN_251; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_253 = 7'h7b == auto_in_a_bits_source ? count_124 : _GEN_252; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_254 = 7'h7c == auto_in_a_bits_source ? count_125 : _GEN_253; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_255 = 7'h7d == auto_in_a_bits_source ? count_126 : _GEN_254; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_256 = 7'h7e == auto_in_a_bits_source ? count_127 : _GEN_255; // @[ToAXI4.scala 195:{49,49}]
  wire  _GEN_257 = 7'h7f == auto_in_a_bits_source ? count_128 : _GEN_256; // @[ToAXI4.scala 195:{49,49}]
  reg [2:0] counter; // @[Edges.scala 228:27]
  wire  a_first = counter == 3'h0; // @[Edges.scala 230:25]
  wire  stall = _GEN_257 & a_first; // @[ToAXI4.scala 195:49]
  wire  _bundleIn_0_a_ready_T = ~stall; // @[ToAXI4.scala 196:21]
  reg  doneAW; // @[ToAXI4.scala 161:30]
  wire  out_arw_ready = queue_arw_deq_io_enq_ready; // @[ToAXI4.scala 147:25 Decoupled.scala 365:17]
  wire  _bundleIn_0_a_ready_T_1 = doneAW | out_arw_ready; // @[ToAXI4.scala 196:52]
  wire  out_w_ready = deq_io_enq_ready; // @[ToAXI4.scala 148:23 Decoupled.scala 365:17]
  wire  _bundleIn_0_a_ready_T_3 = a_isPut ? (doneAW | out_arw_ready) & out_w_ready : out_arw_ready; // @[ToAXI4.scala 196:34]
  wire  bundleIn_0_a_ready = ~stall & _bundleIn_0_a_ready_T_3; // @[ToAXI4.scala 196:28]
  wire  _T = bundleIn_0_a_ready & auto_in_a_valid; // @[Decoupled.scala 50:35]
  wire [12:0] _beats1_decode_T_1 = 13'h3f << auto_in_a_bits_size; // @[package.scala 234:77]
  wire [5:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[5:0]; // @[package.scala 234:46]
  wire [2:0] beats1_decode = _beats1_decode_T_3[5:3]; // @[Edges.scala 219:59]
  wire [2:0] beats1 = a_isPut ? beats1_decode : 3'h0; // @[Edges.scala 220:14]
  wire [2:0] counter1 = counter - 3'h1; // @[Edges.scala 229:28]
  wire  a_last = counter == 3'h1 | beats1 == 3'h0; // @[Edges.scala 231:37]
  wire  queue_arw_bits_wen = queue_arw_deq_io_deq_bits_wen; // @[Decoupled.scala 401:19 402:14]
  wire  queue_arw_valid = queue_arw_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire [6:0] _GEN_3 = 7'h1 == auto_in_a_bits_source ? 7'h1 : 7'h0; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_4 = 7'h2 == auto_in_a_bits_source ? 7'h2 : _GEN_3; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_5 = 7'h3 == auto_in_a_bits_source ? 7'h3 : _GEN_4; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_6 = 7'h4 == auto_in_a_bits_source ? 7'h4 : _GEN_5; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_7 = 7'h5 == auto_in_a_bits_source ? 7'h5 : _GEN_6; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_8 = 7'h6 == auto_in_a_bits_source ? 7'h6 : _GEN_7; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_9 = 7'h7 == auto_in_a_bits_source ? 7'h7 : _GEN_8; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_10 = 7'h8 == auto_in_a_bits_source ? 7'h8 : _GEN_9; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_11 = 7'h9 == auto_in_a_bits_source ? 7'h9 : _GEN_10; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_12 = 7'ha == auto_in_a_bits_source ? 7'ha : _GEN_11; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_13 = 7'hb == auto_in_a_bits_source ? 7'hb : _GEN_12; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_14 = 7'hc == auto_in_a_bits_source ? 7'hc : _GEN_13; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_15 = 7'hd == auto_in_a_bits_source ? 7'hd : _GEN_14; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_16 = 7'he == auto_in_a_bits_source ? 7'he : _GEN_15; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_17 = 7'hf == auto_in_a_bits_source ? 7'hf : _GEN_16; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_18 = 7'h10 == auto_in_a_bits_source ? 7'h10 : _GEN_17; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_19 = 7'h11 == auto_in_a_bits_source ? 7'h11 : _GEN_18; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_20 = 7'h12 == auto_in_a_bits_source ? 7'h12 : _GEN_19; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_21 = 7'h13 == auto_in_a_bits_source ? 7'h13 : _GEN_20; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_22 = 7'h14 == auto_in_a_bits_source ? 7'h14 : _GEN_21; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_23 = 7'h15 == auto_in_a_bits_source ? 7'h15 : _GEN_22; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_24 = 7'h16 == auto_in_a_bits_source ? 7'h16 : _GEN_23; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_25 = 7'h17 == auto_in_a_bits_source ? 7'h17 : _GEN_24; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_26 = 7'h18 == auto_in_a_bits_source ? 7'h18 : _GEN_25; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_27 = 7'h19 == auto_in_a_bits_source ? 7'h19 : _GEN_26; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_28 = 7'h1a == auto_in_a_bits_source ? 7'h1a : _GEN_27; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_29 = 7'h1b == auto_in_a_bits_source ? 7'h1b : _GEN_28; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_30 = 7'h1c == auto_in_a_bits_source ? 7'h1c : _GEN_29; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_31 = 7'h1d == auto_in_a_bits_source ? 7'h1d : _GEN_30; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_32 = 7'h1e == auto_in_a_bits_source ? 7'h1e : _GEN_31; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_33 = 7'h1f == auto_in_a_bits_source ? 7'h1f : _GEN_32; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_34 = 7'h20 == auto_in_a_bits_source ? 7'h20 : _GEN_33; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_35 = 7'h21 == auto_in_a_bits_source ? 7'h21 : _GEN_34; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_36 = 7'h22 == auto_in_a_bits_source ? 7'h22 : _GEN_35; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_37 = 7'h23 == auto_in_a_bits_source ? 7'h23 : _GEN_36; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_38 = 7'h24 == auto_in_a_bits_source ? 7'h24 : _GEN_37; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_39 = 7'h25 == auto_in_a_bits_source ? 7'h25 : _GEN_38; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_40 = 7'h26 == auto_in_a_bits_source ? 7'h26 : _GEN_39; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_41 = 7'h27 == auto_in_a_bits_source ? 7'h27 : _GEN_40; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_42 = 7'h28 == auto_in_a_bits_source ? 7'h28 : _GEN_41; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_43 = 7'h29 == auto_in_a_bits_source ? 7'h29 : _GEN_42; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_44 = 7'h2a == auto_in_a_bits_source ? 7'h2a : _GEN_43; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_45 = 7'h2b == auto_in_a_bits_source ? 7'h2b : _GEN_44; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_46 = 7'h2c == auto_in_a_bits_source ? 7'h2c : _GEN_45; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_47 = 7'h2d == auto_in_a_bits_source ? 7'h2d : _GEN_46; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_48 = 7'h2e == auto_in_a_bits_source ? 7'h2e : _GEN_47; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_49 = 7'h2f == auto_in_a_bits_source ? 7'h2f : _GEN_48; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_50 = 7'h30 == auto_in_a_bits_source ? 7'h30 : _GEN_49; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_51 = 7'h31 == auto_in_a_bits_source ? 7'h31 : _GEN_50; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_52 = 7'h32 == auto_in_a_bits_source ? 7'h32 : _GEN_51; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_53 = 7'h33 == auto_in_a_bits_source ? 7'h33 : _GEN_52; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_54 = 7'h34 == auto_in_a_bits_source ? 7'h34 : _GEN_53; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_55 = 7'h35 == auto_in_a_bits_source ? 7'h35 : _GEN_54; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_56 = 7'h36 == auto_in_a_bits_source ? 7'h36 : _GEN_55; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_57 = 7'h37 == auto_in_a_bits_source ? 7'h37 : _GEN_56; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_58 = 7'h38 == auto_in_a_bits_source ? 7'h38 : _GEN_57; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_59 = 7'h39 == auto_in_a_bits_source ? 7'h39 : _GEN_58; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_60 = 7'h3a == auto_in_a_bits_source ? 7'h3a : _GEN_59; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_61 = 7'h3b == auto_in_a_bits_source ? 7'h3b : _GEN_60; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_62 = 7'h3c == auto_in_a_bits_source ? 7'h3c : _GEN_61; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_63 = 7'h3d == auto_in_a_bits_source ? 7'h3d : _GEN_62; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_64 = 7'h3e == auto_in_a_bits_source ? 7'h3e : _GEN_63; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_65 = 7'h3f == auto_in_a_bits_source ? 7'h3f : _GEN_64; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_66 = 7'h40 == auto_in_a_bits_source ? 7'h40 : _GEN_65; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_67 = 7'h41 == auto_in_a_bits_source ? 7'h41 : _GEN_66; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_68 = 7'h42 == auto_in_a_bits_source ? 7'h42 : _GEN_67; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_69 = 7'h43 == auto_in_a_bits_source ? 7'h43 : _GEN_68; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_70 = 7'h44 == auto_in_a_bits_source ? 7'h44 : _GEN_69; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_71 = 7'h45 == auto_in_a_bits_source ? 7'h45 : _GEN_70; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_72 = 7'h46 == auto_in_a_bits_source ? 7'h46 : _GEN_71; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_73 = 7'h47 == auto_in_a_bits_source ? 7'h47 : _GEN_72; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_74 = 7'h48 == auto_in_a_bits_source ? 7'h48 : _GEN_73; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_75 = 7'h49 == auto_in_a_bits_source ? 7'h49 : _GEN_74; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_76 = 7'h4a == auto_in_a_bits_source ? 7'h4a : _GEN_75; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_77 = 7'h4b == auto_in_a_bits_source ? 7'h4b : _GEN_76; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_78 = 7'h4c == auto_in_a_bits_source ? 7'h4c : _GEN_77; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_79 = 7'h4d == auto_in_a_bits_source ? 7'h4d : _GEN_78; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_80 = 7'h4e == auto_in_a_bits_source ? 7'h4e : _GEN_79; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_81 = 7'h4f == auto_in_a_bits_source ? 7'h4f : _GEN_80; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_82 = 7'h50 == auto_in_a_bits_source ? 7'h50 : _GEN_81; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_83 = 7'h51 == auto_in_a_bits_source ? 7'h51 : _GEN_82; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_84 = 7'h52 == auto_in_a_bits_source ? 7'h52 : _GEN_83; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_85 = 7'h53 == auto_in_a_bits_source ? 7'h53 : _GEN_84; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_86 = 7'h54 == auto_in_a_bits_source ? 7'h54 : _GEN_85; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_87 = 7'h55 == auto_in_a_bits_source ? 7'h55 : _GEN_86; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_88 = 7'h56 == auto_in_a_bits_source ? 7'h56 : _GEN_87; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_89 = 7'h57 == auto_in_a_bits_source ? 7'h57 : _GEN_88; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_90 = 7'h58 == auto_in_a_bits_source ? 7'h58 : _GEN_89; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_91 = 7'h59 == auto_in_a_bits_source ? 7'h59 : _GEN_90; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_92 = 7'h5a == auto_in_a_bits_source ? 7'h5a : _GEN_91; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_93 = 7'h5b == auto_in_a_bits_source ? 7'h5b : _GEN_92; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_94 = 7'h5c == auto_in_a_bits_source ? 7'h5c : _GEN_93; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_95 = 7'h5d == auto_in_a_bits_source ? 7'h5d : _GEN_94; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_96 = 7'h5e == auto_in_a_bits_source ? 7'h5e : _GEN_95; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_97 = 7'h5f == auto_in_a_bits_source ? 7'h5f : _GEN_96; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_98 = 7'h60 == auto_in_a_bits_source ? 7'h60 : _GEN_97; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_99 = 7'h61 == auto_in_a_bits_source ? 7'h61 : _GEN_98; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_100 = 7'h62 == auto_in_a_bits_source ? 7'h62 : _GEN_99; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_101 = 7'h63 == auto_in_a_bits_source ? 7'h63 : _GEN_100; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_102 = 7'h64 == auto_in_a_bits_source ? 7'h64 : _GEN_101; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_103 = 7'h65 == auto_in_a_bits_source ? 7'h65 : _GEN_102; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_104 = 7'h66 == auto_in_a_bits_source ? 7'h66 : _GEN_103; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_105 = 7'h67 == auto_in_a_bits_source ? 7'h67 : _GEN_104; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_106 = 7'h68 == auto_in_a_bits_source ? 7'h68 : _GEN_105; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_107 = 7'h69 == auto_in_a_bits_source ? 7'h69 : _GEN_106; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_108 = 7'h6a == auto_in_a_bits_source ? 7'h6a : _GEN_107; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_109 = 7'h6b == auto_in_a_bits_source ? 7'h6b : _GEN_108; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_110 = 7'h6c == auto_in_a_bits_source ? 7'h6c : _GEN_109; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_111 = 7'h6d == auto_in_a_bits_source ? 7'h6d : _GEN_110; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_112 = 7'h6e == auto_in_a_bits_source ? 7'h6e : _GEN_111; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_113 = 7'h6f == auto_in_a_bits_source ? 7'h6f : _GEN_112; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_114 = 7'h70 == auto_in_a_bits_source ? 7'h70 : _GEN_113; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_115 = 7'h71 == auto_in_a_bits_source ? 7'h71 : _GEN_114; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_116 = 7'h72 == auto_in_a_bits_source ? 7'h72 : _GEN_115; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_117 = 7'h73 == auto_in_a_bits_source ? 7'h73 : _GEN_116; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_118 = 7'h74 == auto_in_a_bits_source ? 7'h74 : _GEN_117; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_119 = 7'h75 == auto_in_a_bits_source ? 7'h75 : _GEN_118; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_120 = 7'h76 == auto_in_a_bits_source ? 7'h76 : _GEN_119; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_121 = 7'h77 == auto_in_a_bits_source ? 7'h77 : _GEN_120; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_122 = 7'h78 == auto_in_a_bits_source ? 7'h78 : _GEN_121; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_123 = 7'h79 == auto_in_a_bits_source ? 7'h79 : _GEN_122; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_124 = 7'h7a == auto_in_a_bits_source ? 7'h7a : _GEN_123; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_125 = 7'h7b == auto_in_a_bits_source ? 7'h7b : _GEN_124; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_126 = 7'h7c == auto_in_a_bits_source ? 7'h7c : _GEN_125; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_127 = 7'h7d == auto_in_a_bits_source ? 7'h7d : _GEN_126; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] _GEN_128 = 7'h7e == auto_in_a_bits_source ? 7'h7e : _GEN_127; // @[ToAXI4.scala 166:{17,17}]
  wire [6:0] out_arw_bits_id = 7'h7f == auto_in_a_bits_source ? 7'h7f : _GEN_128; // @[ToAXI4.scala 166:{17,17}]
  wire [17:0] _out_arw_bits_len_T_1 = 18'h7ff << auto_in_a_bits_size; // @[package.scala 234:77]
  wire [10:0] _out_arw_bits_len_T_3 = ~_out_arw_bits_len_T_1[10:0]; // @[package.scala 234:46]
  wire  prot_1 = ~auto_in_a_bits_user_amba_prot_secure; // @[ToAXI4.scala 185:20]
  wire [1:0] out_arw_bits_prot_hi = {auto_in_a_bits_user_amba_prot_fetch,prot_1}; // @[Cat.scala 31:58]
  wire [1:0] out_arw_bits_cache_lo = {auto_in_a_bits_user_amba_prot_modifiable,auto_in_a_bits_user_amba_prot_bufferable}
    ; // @[Cat.scala 31:58]
  wire [1:0] out_arw_bits_cache_hi = {auto_in_a_bits_user_amba_prot_writealloc,auto_in_a_bits_user_amba_prot_readalloc}; // @[Cat.scala 31:58]
  wire  _out_arw_valid_T_1 = _bundleIn_0_a_ready_T & auto_in_a_valid; // @[ToAXI4.scala 197:31]
  wire  _out_arw_valid_T_4 = a_isPut ? ~doneAW & out_w_ready : 1'h1; // @[ToAXI4.scala 197:51]
  wire  out_arw_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & _out_arw_valid_T_4; // @[ToAXI4.scala 197:45]
  reg  r_holds_d; // @[ToAXI4.scala 206:30]
  reg [2:0] b_delay; // @[ToAXI4.scala 209:24]
  wire  r_wins = auto_out_r_valid & b_delay != 3'h7 | r_holds_d; // @[ToAXI4.scala 215:57]
  wire  bundleOut_0_r_ready = auto_in_d_ready & r_wins; // @[ToAXI4.scala 217:33]
  wire  _T_2 = bundleOut_0_r_ready & auto_out_r_valid; // @[Decoupled.scala 50:35]
  wire  bundleOut_0_b_ready = auto_in_d_ready & ~r_wins; // @[ToAXI4.scala 218:33]
  wire [2:0] _b_delay_T_1 = b_delay + 3'h1; // @[ToAXI4.scala 211:28]
  wire  bundleIn_0_d_valid = r_wins ? auto_out_r_valid : auto_out_b_valid; // @[ToAXI4.scala 219:24]
  reg  r_first; // @[ToAXI4.scala 224:28]
  wire  _GEN_260 = _T_2 ? auto_out_r_bits_last : r_first; // @[ToAXI4.scala 225:27 224:28 225:37]
  wire  _r_denied_T = auto_out_r_bits_resp == 2'h3; // @[ToAXI4.scala 226:39]
  reg  r_denied_r; // @[Reg.scala 16:16]
  wire  _GEN_261 = r_first ? _r_denied_T : r_denied_r; // @[Reg.scala 16:16 17:{18,22}]
  wire  r_corrupt = auto_out_r_bits_resp != 2'h0; // @[ToAXI4.scala 227:39]
  wire  b_denied = auto_out_b_bits_resp != 2'h0; // @[ToAXI4.scala 228:39]
  wire  r_d_corrupt = r_corrupt | _GEN_261; // @[ToAXI4.scala 230:100]
  wire [2:0] r_d_size = auto_out_r_bits_echo_tl_state_size[2:0]; // @[Edges.scala 771:17 774:15]
  wire [2:0] b_d_size = auto_out_b_bits_echo_tl_state_size[2:0]; // @[Edges.scala 755:17 758:15]
  wire [127:0] _a_sel_T = 128'h1 << out_arw_bits_id; // @[OneHot.scala 64:12]
  wire  a_sel_0 = _a_sel_T[0]; // @[ToAXI4.scala 242:58]
  wire  a_sel_1 = _a_sel_T[1]; // @[ToAXI4.scala 242:58]
  wire  a_sel_2 = _a_sel_T[2]; // @[ToAXI4.scala 242:58]
  wire  a_sel_3 = _a_sel_T[3]; // @[ToAXI4.scala 242:58]
  wire  a_sel_4 = _a_sel_T[4]; // @[ToAXI4.scala 242:58]
  wire  a_sel_5 = _a_sel_T[5]; // @[ToAXI4.scala 242:58]
  wire  a_sel_6 = _a_sel_T[6]; // @[ToAXI4.scala 242:58]
  wire  a_sel_7 = _a_sel_T[7]; // @[ToAXI4.scala 242:58]
  wire  a_sel_8 = _a_sel_T[8]; // @[ToAXI4.scala 242:58]
  wire  a_sel_9 = _a_sel_T[9]; // @[ToAXI4.scala 242:58]
  wire  a_sel_10 = _a_sel_T[10]; // @[ToAXI4.scala 242:58]
  wire  a_sel_11 = _a_sel_T[11]; // @[ToAXI4.scala 242:58]
  wire  a_sel_12 = _a_sel_T[12]; // @[ToAXI4.scala 242:58]
  wire  a_sel_13 = _a_sel_T[13]; // @[ToAXI4.scala 242:58]
  wire  a_sel_14 = _a_sel_T[14]; // @[ToAXI4.scala 242:58]
  wire  a_sel_15 = _a_sel_T[15]; // @[ToAXI4.scala 242:58]
  wire  a_sel_16 = _a_sel_T[16]; // @[ToAXI4.scala 242:58]
  wire  a_sel_17 = _a_sel_T[17]; // @[ToAXI4.scala 242:58]
  wire  a_sel_18 = _a_sel_T[18]; // @[ToAXI4.scala 242:58]
  wire  a_sel_19 = _a_sel_T[19]; // @[ToAXI4.scala 242:58]
  wire  a_sel_20 = _a_sel_T[20]; // @[ToAXI4.scala 242:58]
  wire  a_sel_21 = _a_sel_T[21]; // @[ToAXI4.scala 242:58]
  wire  a_sel_22 = _a_sel_T[22]; // @[ToAXI4.scala 242:58]
  wire  a_sel_23 = _a_sel_T[23]; // @[ToAXI4.scala 242:58]
  wire  a_sel_24 = _a_sel_T[24]; // @[ToAXI4.scala 242:58]
  wire  a_sel_25 = _a_sel_T[25]; // @[ToAXI4.scala 242:58]
  wire  a_sel_26 = _a_sel_T[26]; // @[ToAXI4.scala 242:58]
  wire  a_sel_27 = _a_sel_T[27]; // @[ToAXI4.scala 242:58]
  wire  a_sel_28 = _a_sel_T[28]; // @[ToAXI4.scala 242:58]
  wire  a_sel_29 = _a_sel_T[29]; // @[ToAXI4.scala 242:58]
  wire  a_sel_30 = _a_sel_T[30]; // @[ToAXI4.scala 242:58]
  wire  a_sel_31 = _a_sel_T[31]; // @[ToAXI4.scala 242:58]
  wire  a_sel_32 = _a_sel_T[32]; // @[ToAXI4.scala 242:58]
  wire  a_sel_33 = _a_sel_T[33]; // @[ToAXI4.scala 242:58]
  wire  a_sel_34 = _a_sel_T[34]; // @[ToAXI4.scala 242:58]
  wire  a_sel_35 = _a_sel_T[35]; // @[ToAXI4.scala 242:58]
  wire  a_sel_36 = _a_sel_T[36]; // @[ToAXI4.scala 242:58]
  wire  a_sel_37 = _a_sel_T[37]; // @[ToAXI4.scala 242:58]
  wire  a_sel_38 = _a_sel_T[38]; // @[ToAXI4.scala 242:58]
  wire  a_sel_39 = _a_sel_T[39]; // @[ToAXI4.scala 242:58]
  wire  a_sel_40 = _a_sel_T[40]; // @[ToAXI4.scala 242:58]
  wire  a_sel_41 = _a_sel_T[41]; // @[ToAXI4.scala 242:58]
  wire  a_sel_42 = _a_sel_T[42]; // @[ToAXI4.scala 242:58]
  wire  a_sel_43 = _a_sel_T[43]; // @[ToAXI4.scala 242:58]
  wire  a_sel_44 = _a_sel_T[44]; // @[ToAXI4.scala 242:58]
  wire  a_sel_45 = _a_sel_T[45]; // @[ToAXI4.scala 242:58]
  wire  a_sel_46 = _a_sel_T[46]; // @[ToAXI4.scala 242:58]
  wire  a_sel_47 = _a_sel_T[47]; // @[ToAXI4.scala 242:58]
  wire  a_sel_48 = _a_sel_T[48]; // @[ToAXI4.scala 242:58]
  wire  a_sel_49 = _a_sel_T[49]; // @[ToAXI4.scala 242:58]
  wire  a_sel_50 = _a_sel_T[50]; // @[ToAXI4.scala 242:58]
  wire  a_sel_51 = _a_sel_T[51]; // @[ToAXI4.scala 242:58]
  wire  a_sel_52 = _a_sel_T[52]; // @[ToAXI4.scala 242:58]
  wire  a_sel_53 = _a_sel_T[53]; // @[ToAXI4.scala 242:58]
  wire  a_sel_54 = _a_sel_T[54]; // @[ToAXI4.scala 242:58]
  wire  a_sel_55 = _a_sel_T[55]; // @[ToAXI4.scala 242:58]
  wire  a_sel_56 = _a_sel_T[56]; // @[ToAXI4.scala 242:58]
  wire  a_sel_57 = _a_sel_T[57]; // @[ToAXI4.scala 242:58]
  wire  a_sel_58 = _a_sel_T[58]; // @[ToAXI4.scala 242:58]
  wire  a_sel_59 = _a_sel_T[59]; // @[ToAXI4.scala 242:58]
  wire  a_sel_60 = _a_sel_T[60]; // @[ToAXI4.scala 242:58]
  wire  a_sel_61 = _a_sel_T[61]; // @[ToAXI4.scala 242:58]
  wire  a_sel_62 = _a_sel_T[62]; // @[ToAXI4.scala 242:58]
  wire  a_sel_63 = _a_sel_T[63]; // @[ToAXI4.scala 242:58]
  wire  a_sel_64 = _a_sel_T[64]; // @[ToAXI4.scala 242:58]
  wire  a_sel_65 = _a_sel_T[65]; // @[ToAXI4.scala 242:58]
  wire  a_sel_66 = _a_sel_T[66]; // @[ToAXI4.scala 242:58]
  wire  a_sel_67 = _a_sel_T[67]; // @[ToAXI4.scala 242:58]
  wire  a_sel_68 = _a_sel_T[68]; // @[ToAXI4.scala 242:58]
  wire  a_sel_69 = _a_sel_T[69]; // @[ToAXI4.scala 242:58]
  wire  a_sel_70 = _a_sel_T[70]; // @[ToAXI4.scala 242:58]
  wire  a_sel_71 = _a_sel_T[71]; // @[ToAXI4.scala 242:58]
  wire  a_sel_72 = _a_sel_T[72]; // @[ToAXI4.scala 242:58]
  wire  a_sel_73 = _a_sel_T[73]; // @[ToAXI4.scala 242:58]
  wire  a_sel_74 = _a_sel_T[74]; // @[ToAXI4.scala 242:58]
  wire  a_sel_75 = _a_sel_T[75]; // @[ToAXI4.scala 242:58]
  wire  a_sel_76 = _a_sel_T[76]; // @[ToAXI4.scala 242:58]
  wire  a_sel_77 = _a_sel_T[77]; // @[ToAXI4.scala 242:58]
  wire  a_sel_78 = _a_sel_T[78]; // @[ToAXI4.scala 242:58]
  wire  a_sel_79 = _a_sel_T[79]; // @[ToAXI4.scala 242:58]
  wire  a_sel_80 = _a_sel_T[80]; // @[ToAXI4.scala 242:58]
  wire  a_sel_81 = _a_sel_T[81]; // @[ToAXI4.scala 242:58]
  wire  a_sel_82 = _a_sel_T[82]; // @[ToAXI4.scala 242:58]
  wire  a_sel_83 = _a_sel_T[83]; // @[ToAXI4.scala 242:58]
  wire  a_sel_84 = _a_sel_T[84]; // @[ToAXI4.scala 242:58]
  wire  a_sel_85 = _a_sel_T[85]; // @[ToAXI4.scala 242:58]
  wire  a_sel_86 = _a_sel_T[86]; // @[ToAXI4.scala 242:58]
  wire  a_sel_87 = _a_sel_T[87]; // @[ToAXI4.scala 242:58]
  wire  a_sel_88 = _a_sel_T[88]; // @[ToAXI4.scala 242:58]
  wire  a_sel_89 = _a_sel_T[89]; // @[ToAXI4.scala 242:58]
  wire  a_sel_90 = _a_sel_T[90]; // @[ToAXI4.scala 242:58]
  wire  a_sel_91 = _a_sel_T[91]; // @[ToAXI4.scala 242:58]
  wire  a_sel_92 = _a_sel_T[92]; // @[ToAXI4.scala 242:58]
  wire  a_sel_93 = _a_sel_T[93]; // @[ToAXI4.scala 242:58]
  wire  a_sel_94 = _a_sel_T[94]; // @[ToAXI4.scala 242:58]
  wire  a_sel_95 = _a_sel_T[95]; // @[ToAXI4.scala 242:58]
  wire  a_sel_96 = _a_sel_T[96]; // @[ToAXI4.scala 242:58]
  wire  a_sel_97 = _a_sel_T[97]; // @[ToAXI4.scala 242:58]
  wire  a_sel_98 = _a_sel_T[98]; // @[ToAXI4.scala 242:58]
  wire  a_sel_99 = _a_sel_T[99]; // @[ToAXI4.scala 242:58]
  wire  a_sel_100 = _a_sel_T[100]; // @[ToAXI4.scala 242:58]
  wire  a_sel_101 = _a_sel_T[101]; // @[ToAXI4.scala 242:58]
  wire  a_sel_102 = _a_sel_T[102]; // @[ToAXI4.scala 242:58]
  wire  a_sel_103 = _a_sel_T[103]; // @[ToAXI4.scala 242:58]
  wire  a_sel_104 = _a_sel_T[104]; // @[ToAXI4.scala 242:58]
  wire  a_sel_105 = _a_sel_T[105]; // @[ToAXI4.scala 242:58]
  wire  a_sel_106 = _a_sel_T[106]; // @[ToAXI4.scala 242:58]
  wire  a_sel_107 = _a_sel_T[107]; // @[ToAXI4.scala 242:58]
  wire  a_sel_108 = _a_sel_T[108]; // @[ToAXI4.scala 242:58]
  wire  a_sel_109 = _a_sel_T[109]; // @[ToAXI4.scala 242:58]
  wire  a_sel_110 = _a_sel_T[110]; // @[ToAXI4.scala 242:58]
  wire  a_sel_111 = _a_sel_T[111]; // @[ToAXI4.scala 242:58]
  wire  a_sel_112 = _a_sel_T[112]; // @[ToAXI4.scala 242:58]
  wire  a_sel_113 = _a_sel_T[113]; // @[ToAXI4.scala 242:58]
  wire  a_sel_114 = _a_sel_T[114]; // @[ToAXI4.scala 242:58]
  wire  a_sel_115 = _a_sel_T[115]; // @[ToAXI4.scala 242:58]
  wire  a_sel_116 = _a_sel_T[116]; // @[ToAXI4.scala 242:58]
  wire  a_sel_117 = _a_sel_T[117]; // @[ToAXI4.scala 242:58]
  wire  a_sel_118 = _a_sel_T[118]; // @[ToAXI4.scala 242:58]
  wire  a_sel_119 = _a_sel_T[119]; // @[ToAXI4.scala 242:58]
  wire  a_sel_120 = _a_sel_T[120]; // @[ToAXI4.scala 242:58]
  wire  a_sel_121 = _a_sel_T[121]; // @[ToAXI4.scala 242:58]
  wire  a_sel_122 = _a_sel_T[122]; // @[ToAXI4.scala 242:58]
  wire  a_sel_123 = _a_sel_T[123]; // @[ToAXI4.scala 242:58]
  wire  a_sel_124 = _a_sel_T[124]; // @[ToAXI4.scala 242:58]
  wire  a_sel_125 = _a_sel_T[125]; // @[ToAXI4.scala 242:58]
  wire  a_sel_126 = _a_sel_T[126]; // @[ToAXI4.scala 242:58]
  wire  a_sel_127 = _a_sel_T[127]; // @[ToAXI4.scala 242:58]
  wire [6:0] d_sel_shiftAmount = r_wins ? auto_out_r_bits_id : auto_out_b_bits_id; // @[ToAXI4.scala 243:31]
  wire [127:0] _d_sel_T_1 = 128'h1 << d_sel_shiftAmount; // @[OneHot.scala 64:12]
  wire  d_sel_0 = _d_sel_T_1[0]; // @[ToAXI4.scala 243:93]
  wire  d_sel_1 = _d_sel_T_1[1]; // @[ToAXI4.scala 243:93]
  wire  d_sel_2 = _d_sel_T_1[2]; // @[ToAXI4.scala 243:93]
  wire  d_sel_3 = _d_sel_T_1[3]; // @[ToAXI4.scala 243:93]
  wire  d_sel_4 = _d_sel_T_1[4]; // @[ToAXI4.scala 243:93]
  wire  d_sel_5 = _d_sel_T_1[5]; // @[ToAXI4.scala 243:93]
  wire  d_sel_6 = _d_sel_T_1[6]; // @[ToAXI4.scala 243:93]
  wire  d_sel_7 = _d_sel_T_1[7]; // @[ToAXI4.scala 243:93]
  wire  d_sel_8 = _d_sel_T_1[8]; // @[ToAXI4.scala 243:93]
  wire  d_sel_9 = _d_sel_T_1[9]; // @[ToAXI4.scala 243:93]
  wire  d_sel_10 = _d_sel_T_1[10]; // @[ToAXI4.scala 243:93]
  wire  d_sel_11 = _d_sel_T_1[11]; // @[ToAXI4.scala 243:93]
  wire  d_sel_12 = _d_sel_T_1[12]; // @[ToAXI4.scala 243:93]
  wire  d_sel_13 = _d_sel_T_1[13]; // @[ToAXI4.scala 243:93]
  wire  d_sel_14 = _d_sel_T_1[14]; // @[ToAXI4.scala 243:93]
  wire  d_sel_15 = _d_sel_T_1[15]; // @[ToAXI4.scala 243:93]
  wire  d_sel_16 = _d_sel_T_1[16]; // @[ToAXI4.scala 243:93]
  wire  d_sel_17 = _d_sel_T_1[17]; // @[ToAXI4.scala 243:93]
  wire  d_sel_18 = _d_sel_T_1[18]; // @[ToAXI4.scala 243:93]
  wire  d_sel_19 = _d_sel_T_1[19]; // @[ToAXI4.scala 243:93]
  wire  d_sel_20 = _d_sel_T_1[20]; // @[ToAXI4.scala 243:93]
  wire  d_sel_21 = _d_sel_T_1[21]; // @[ToAXI4.scala 243:93]
  wire  d_sel_22 = _d_sel_T_1[22]; // @[ToAXI4.scala 243:93]
  wire  d_sel_23 = _d_sel_T_1[23]; // @[ToAXI4.scala 243:93]
  wire  d_sel_24 = _d_sel_T_1[24]; // @[ToAXI4.scala 243:93]
  wire  d_sel_25 = _d_sel_T_1[25]; // @[ToAXI4.scala 243:93]
  wire  d_sel_26 = _d_sel_T_1[26]; // @[ToAXI4.scala 243:93]
  wire  d_sel_27 = _d_sel_T_1[27]; // @[ToAXI4.scala 243:93]
  wire  d_sel_28 = _d_sel_T_1[28]; // @[ToAXI4.scala 243:93]
  wire  d_sel_29 = _d_sel_T_1[29]; // @[ToAXI4.scala 243:93]
  wire  d_sel_30 = _d_sel_T_1[30]; // @[ToAXI4.scala 243:93]
  wire  d_sel_31 = _d_sel_T_1[31]; // @[ToAXI4.scala 243:93]
  wire  d_sel_32 = _d_sel_T_1[32]; // @[ToAXI4.scala 243:93]
  wire  d_sel_33 = _d_sel_T_1[33]; // @[ToAXI4.scala 243:93]
  wire  d_sel_34 = _d_sel_T_1[34]; // @[ToAXI4.scala 243:93]
  wire  d_sel_35 = _d_sel_T_1[35]; // @[ToAXI4.scala 243:93]
  wire  d_sel_36 = _d_sel_T_1[36]; // @[ToAXI4.scala 243:93]
  wire  d_sel_37 = _d_sel_T_1[37]; // @[ToAXI4.scala 243:93]
  wire  d_sel_38 = _d_sel_T_1[38]; // @[ToAXI4.scala 243:93]
  wire  d_sel_39 = _d_sel_T_1[39]; // @[ToAXI4.scala 243:93]
  wire  d_sel_40 = _d_sel_T_1[40]; // @[ToAXI4.scala 243:93]
  wire  d_sel_41 = _d_sel_T_1[41]; // @[ToAXI4.scala 243:93]
  wire  d_sel_42 = _d_sel_T_1[42]; // @[ToAXI4.scala 243:93]
  wire  d_sel_43 = _d_sel_T_1[43]; // @[ToAXI4.scala 243:93]
  wire  d_sel_44 = _d_sel_T_1[44]; // @[ToAXI4.scala 243:93]
  wire  d_sel_45 = _d_sel_T_1[45]; // @[ToAXI4.scala 243:93]
  wire  d_sel_46 = _d_sel_T_1[46]; // @[ToAXI4.scala 243:93]
  wire  d_sel_47 = _d_sel_T_1[47]; // @[ToAXI4.scala 243:93]
  wire  d_sel_48 = _d_sel_T_1[48]; // @[ToAXI4.scala 243:93]
  wire  d_sel_49 = _d_sel_T_1[49]; // @[ToAXI4.scala 243:93]
  wire  d_sel_50 = _d_sel_T_1[50]; // @[ToAXI4.scala 243:93]
  wire  d_sel_51 = _d_sel_T_1[51]; // @[ToAXI4.scala 243:93]
  wire  d_sel_52 = _d_sel_T_1[52]; // @[ToAXI4.scala 243:93]
  wire  d_sel_53 = _d_sel_T_1[53]; // @[ToAXI4.scala 243:93]
  wire  d_sel_54 = _d_sel_T_1[54]; // @[ToAXI4.scala 243:93]
  wire  d_sel_55 = _d_sel_T_1[55]; // @[ToAXI4.scala 243:93]
  wire  d_sel_56 = _d_sel_T_1[56]; // @[ToAXI4.scala 243:93]
  wire  d_sel_57 = _d_sel_T_1[57]; // @[ToAXI4.scala 243:93]
  wire  d_sel_58 = _d_sel_T_1[58]; // @[ToAXI4.scala 243:93]
  wire  d_sel_59 = _d_sel_T_1[59]; // @[ToAXI4.scala 243:93]
  wire  d_sel_60 = _d_sel_T_1[60]; // @[ToAXI4.scala 243:93]
  wire  d_sel_61 = _d_sel_T_1[61]; // @[ToAXI4.scala 243:93]
  wire  d_sel_62 = _d_sel_T_1[62]; // @[ToAXI4.scala 243:93]
  wire  d_sel_63 = _d_sel_T_1[63]; // @[ToAXI4.scala 243:93]
  wire  d_sel_64 = _d_sel_T_1[64]; // @[ToAXI4.scala 243:93]
  wire  d_sel_65 = _d_sel_T_1[65]; // @[ToAXI4.scala 243:93]
  wire  d_sel_66 = _d_sel_T_1[66]; // @[ToAXI4.scala 243:93]
  wire  d_sel_67 = _d_sel_T_1[67]; // @[ToAXI4.scala 243:93]
  wire  d_sel_68 = _d_sel_T_1[68]; // @[ToAXI4.scala 243:93]
  wire  d_sel_69 = _d_sel_T_1[69]; // @[ToAXI4.scala 243:93]
  wire  d_sel_70 = _d_sel_T_1[70]; // @[ToAXI4.scala 243:93]
  wire  d_sel_71 = _d_sel_T_1[71]; // @[ToAXI4.scala 243:93]
  wire  d_sel_72 = _d_sel_T_1[72]; // @[ToAXI4.scala 243:93]
  wire  d_sel_73 = _d_sel_T_1[73]; // @[ToAXI4.scala 243:93]
  wire  d_sel_74 = _d_sel_T_1[74]; // @[ToAXI4.scala 243:93]
  wire  d_sel_75 = _d_sel_T_1[75]; // @[ToAXI4.scala 243:93]
  wire  d_sel_76 = _d_sel_T_1[76]; // @[ToAXI4.scala 243:93]
  wire  d_sel_77 = _d_sel_T_1[77]; // @[ToAXI4.scala 243:93]
  wire  d_sel_78 = _d_sel_T_1[78]; // @[ToAXI4.scala 243:93]
  wire  d_sel_79 = _d_sel_T_1[79]; // @[ToAXI4.scala 243:93]
  wire  d_sel_80 = _d_sel_T_1[80]; // @[ToAXI4.scala 243:93]
  wire  d_sel_81 = _d_sel_T_1[81]; // @[ToAXI4.scala 243:93]
  wire  d_sel_82 = _d_sel_T_1[82]; // @[ToAXI4.scala 243:93]
  wire  d_sel_83 = _d_sel_T_1[83]; // @[ToAXI4.scala 243:93]
  wire  d_sel_84 = _d_sel_T_1[84]; // @[ToAXI4.scala 243:93]
  wire  d_sel_85 = _d_sel_T_1[85]; // @[ToAXI4.scala 243:93]
  wire  d_sel_86 = _d_sel_T_1[86]; // @[ToAXI4.scala 243:93]
  wire  d_sel_87 = _d_sel_T_1[87]; // @[ToAXI4.scala 243:93]
  wire  d_sel_88 = _d_sel_T_1[88]; // @[ToAXI4.scala 243:93]
  wire  d_sel_89 = _d_sel_T_1[89]; // @[ToAXI4.scala 243:93]
  wire  d_sel_90 = _d_sel_T_1[90]; // @[ToAXI4.scala 243:93]
  wire  d_sel_91 = _d_sel_T_1[91]; // @[ToAXI4.scala 243:93]
  wire  d_sel_92 = _d_sel_T_1[92]; // @[ToAXI4.scala 243:93]
  wire  d_sel_93 = _d_sel_T_1[93]; // @[ToAXI4.scala 243:93]
  wire  d_sel_94 = _d_sel_T_1[94]; // @[ToAXI4.scala 243:93]
  wire  d_sel_95 = _d_sel_T_1[95]; // @[ToAXI4.scala 243:93]
  wire  d_sel_96 = _d_sel_T_1[96]; // @[ToAXI4.scala 243:93]
  wire  d_sel_97 = _d_sel_T_1[97]; // @[ToAXI4.scala 243:93]
  wire  d_sel_98 = _d_sel_T_1[98]; // @[ToAXI4.scala 243:93]
  wire  d_sel_99 = _d_sel_T_1[99]; // @[ToAXI4.scala 243:93]
  wire  d_sel_100 = _d_sel_T_1[100]; // @[ToAXI4.scala 243:93]
  wire  d_sel_101 = _d_sel_T_1[101]; // @[ToAXI4.scala 243:93]
  wire  d_sel_102 = _d_sel_T_1[102]; // @[ToAXI4.scala 243:93]
  wire  d_sel_103 = _d_sel_T_1[103]; // @[ToAXI4.scala 243:93]
  wire  d_sel_104 = _d_sel_T_1[104]; // @[ToAXI4.scala 243:93]
  wire  d_sel_105 = _d_sel_T_1[105]; // @[ToAXI4.scala 243:93]
  wire  d_sel_106 = _d_sel_T_1[106]; // @[ToAXI4.scala 243:93]
  wire  d_sel_107 = _d_sel_T_1[107]; // @[ToAXI4.scala 243:93]
  wire  d_sel_108 = _d_sel_T_1[108]; // @[ToAXI4.scala 243:93]
  wire  d_sel_109 = _d_sel_T_1[109]; // @[ToAXI4.scala 243:93]
  wire  d_sel_110 = _d_sel_T_1[110]; // @[ToAXI4.scala 243:93]
  wire  d_sel_111 = _d_sel_T_1[111]; // @[ToAXI4.scala 243:93]
  wire  d_sel_112 = _d_sel_T_1[112]; // @[ToAXI4.scala 243:93]
  wire  d_sel_113 = _d_sel_T_1[113]; // @[ToAXI4.scala 243:93]
  wire  d_sel_114 = _d_sel_T_1[114]; // @[ToAXI4.scala 243:93]
  wire  d_sel_115 = _d_sel_T_1[115]; // @[ToAXI4.scala 243:93]
  wire  d_sel_116 = _d_sel_T_1[116]; // @[ToAXI4.scala 243:93]
  wire  d_sel_117 = _d_sel_T_1[117]; // @[ToAXI4.scala 243:93]
  wire  d_sel_118 = _d_sel_T_1[118]; // @[ToAXI4.scala 243:93]
  wire  d_sel_119 = _d_sel_T_1[119]; // @[ToAXI4.scala 243:93]
  wire  d_sel_120 = _d_sel_T_1[120]; // @[ToAXI4.scala 243:93]
  wire  d_sel_121 = _d_sel_T_1[121]; // @[ToAXI4.scala 243:93]
  wire  d_sel_122 = _d_sel_T_1[122]; // @[ToAXI4.scala 243:93]
  wire  d_sel_123 = _d_sel_T_1[123]; // @[ToAXI4.scala 243:93]
  wire  d_sel_124 = _d_sel_T_1[124]; // @[ToAXI4.scala 243:93]
  wire  d_sel_125 = _d_sel_T_1[125]; // @[ToAXI4.scala 243:93]
  wire  d_sel_126 = _d_sel_T_1[126]; // @[ToAXI4.scala 243:93]
  wire  d_sel_127 = _d_sel_T_1[127]; // @[ToAXI4.scala 243:93]
  wire  d_last = r_wins ? auto_out_r_bits_last : 1'h1; // @[ToAXI4.scala 244:23]
  wire  _inc_T = out_arw_ready & out_arw_valid; // @[Decoupled.scala 50:35]
  wire  inc = a_sel_0 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  _dec_T_1 = auto_in_d_ready & bundleIn_0_d_valid; // @[Decoupled.scala 50:35]
  wire  dec = d_sel_0 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_2 = count_1 + inc; // @[ToAXI4.scala 260:24]
  wire  _T_10 = ~reset; // @[ToAXI4.scala 262:16]
  wire  inc_1 = a_sel_1 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_1 = d_sel_1 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_6 = count_2 + inc_1; // @[ToAXI4.scala 260:24]
  wire  inc_2 = a_sel_2 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_2 = d_sel_2 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_10 = count_3 + inc_2; // @[ToAXI4.scala 260:24]
  wire  inc_3 = a_sel_3 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_3 = d_sel_3 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_14 = count_4 + inc_3; // @[ToAXI4.scala 260:24]
  wire  inc_4 = a_sel_4 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_4 = d_sel_4 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_18 = count_5 + inc_4; // @[ToAXI4.scala 260:24]
  wire  inc_5 = a_sel_5 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_5 = d_sel_5 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_22 = count_6 + inc_5; // @[ToAXI4.scala 260:24]
  wire  inc_6 = a_sel_6 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_6 = d_sel_6 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_26 = count_7 + inc_6; // @[ToAXI4.scala 260:24]
  wire  inc_7 = a_sel_7 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_7 = d_sel_7 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_30 = count_8 + inc_7; // @[ToAXI4.scala 260:24]
  wire  inc_8 = a_sel_8 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_8 = d_sel_8 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_34 = count_9 + inc_8; // @[ToAXI4.scala 260:24]
  wire  inc_9 = a_sel_9 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_9 = d_sel_9 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_38 = count_10 + inc_9; // @[ToAXI4.scala 260:24]
  wire  inc_10 = a_sel_10 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_10 = d_sel_10 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_42 = count_11 + inc_10; // @[ToAXI4.scala 260:24]
  wire  inc_11 = a_sel_11 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_11 = d_sel_11 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_46 = count_12 + inc_11; // @[ToAXI4.scala 260:24]
  wire  inc_12 = a_sel_12 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_12 = d_sel_12 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_50 = count_13 + inc_12; // @[ToAXI4.scala 260:24]
  wire  inc_13 = a_sel_13 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_13 = d_sel_13 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_54 = count_14 + inc_13; // @[ToAXI4.scala 260:24]
  wire  inc_14 = a_sel_14 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_14 = d_sel_14 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_58 = count_15 + inc_14; // @[ToAXI4.scala 260:24]
  wire  inc_15 = a_sel_15 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_15 = d_sel_15 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_62 = count_16 + inc_15; // @[ToAXI4.scala 260:24]
  wire  inc_16 = a_sel_16 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_16 = d_sel_16 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_66 = count_17 + inc_16; // @[ToAXI4.scala 260:24]
  wire  inc_17 = a_sel_17 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_17 = d_sel_17 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_70 = count_18 + inc_17; // @[ToAXI4.scala 260:24]
  wire  inc_18 = a_sel_18 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_18 = d_sel_18 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_74 = count_19 + inc_18; // @[ToAXI4.scala 260:24]
  wire  inc_19 = a_sel_19 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_19 = d_sel_19 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_78 = count_20 + inc_19; // @[ToAXI4.scala 260:24]
  wire  inc_20 = a_sel_20 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_20 = d_sel_20 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_82 = count_21 + inc_20; // @[ToAXI4.scala 260:24]
  wire  inc_21 = a_sel_21 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_21 = d_sel_21 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_86 = count_22 + inc_21; // @[ToAXI4.scala 260:24]
  wire  inc_22 = a_sel_22 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_22 = d_sel_22 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_90 = count_23 + inc_22; // @[ToAXI4.scala 260:24]
  wire  inc_23 = a_sel_23 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_23 = d_sel_23 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_94 = count_24 + inc_23; // @[ToAXI4.scala 260:24]
  wire  inc_24 = a_sel_24 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_24 = d_sel_24 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_98 = count_25 + inc_24; // @[ToAXI4.scala 260:24]
  wire  inc_25 = a_sel_25 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_25 = d_sel_25 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_102 = count_26 + inc_25; // @[ToAXI4.scala 260:24]
  wire  inc_26 = a_sel_26 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_26 = d_sel_26 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_106 = count_27 + inc_26; // @[ToAXI4.scala 260:24]
  wire  inc_27 = a_sel_27 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_27 = d_sel_27 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_110 = count_28 + inc_27; // @[ToAXI4.scala 260:24]
  wire  inc_28 = a_sel_28 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_28 = d_sel_28 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_114 = count_29 + inc_28; // @[ToAXI4.scala 260:24]
  wire  inc_29 = a_sel_29 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_29 = d_sel_29 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_118 = count_30 + inc_29; // @[ToAXI4.scala 260:24]
  wire  inc_30 = a_sel_30 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_30 = d_sel_30 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_122 = count_31 + inc_30; // @[ToAXI4.scala 260:24]
  wire  inc_31 = a_sel_31 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_31 = d_sel_31 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_126 = count_32 + inc_31; // @[ToAXI4.scala 260:24]
  wire  inc_32 = a_sel_32 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_32 = d_sel_32 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_130 = count_33 + inc_32; // @[ToAXI4.scala 260:24]
  wire  inc_33 = a_sel_33 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_33 = d_sel_33 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_134 = count_34 + inc_33; // @[ToAXI4.scala 260:24]
  wire  inc_34 = a_sel_34 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_34 = d_sel_34 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_138 = count_35 + inc_34; // @[ToAXI4.scala 260:24]
  wire  inc_35 = a_sel_35 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_35 = d_sel_35 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_142 = count_36 + inc_35; // @[ToAXI4.scala 260:24]
  wire  inc_36 = a_sel_36 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_36 = d_sel_36 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_146 = count_37 + inc_36; // @[ToAXI4.scala 260:24]
  wire  inc_37 = a_sel_37 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_37 = d_sel_37 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_150 = count_38 + inc_37; // @[ToAXI4.scala 260:24]
  wire  inc_38 = a_sel_38 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_38 = d_sel_38 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_154 = count_39 + inc_38; // @[ToAXI4.scala 260:24]
  wire  inc_39 = a_sel_39 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_39 = d_sel_39 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_158 = count_40 + inc_39; // @[ToAXI4.scala 260:24]
  wire  inc_40 = a_sel_40 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_40 = d_sel_40 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_162 = count_41 + inc_40; // @[ToAXI4.scala 260:24]
  wire  inc_41 = a_sel_41 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_41 = d_sel_41 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_166 = count_42 + inc_41; // @[ToAXI4.scala 260:24]
  wire  inc_42 = a_sel_42 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_42 = d_sel_42 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_170 = count_43 + inc_42; // @[ToAXI4.scala 260:24]
  wire  inc_43 = a_sel_43 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_43 = d_sel_43 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_174 = count_44 + inc_43; // @[ToAXI4.scala 260:24]
  wire  inc_44 = a_sel_44 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_44 = d_sel_44 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_178 = count_45 + inc_44; // @[ToAXI4.scala 260:24]
  wire  inc_45 = a_sel_45 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_45 = d_sel_45 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_182 = count_46 + inc_45; // @[ToAXI4.scala 260:24]
  wire  inc_46 = a_sel_46 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_46 = d_sel_46 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_186 = count_47 + inc_46; // @[ToAXI4.scala 260:24]
  wire  inc_47 = a_sel_47 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_47 = d_sel_47 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_190 = count_48 + inc_47; // @[ToAXI4.scala 260:24]
  wire  inc_48 = a_sel_48 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_48 = d_sel_48 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_194 = count_49 + inc_48; // @[ToAXI4.scala 260:24]
  wire  inc_49 = a_sel_49 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_49 = d_sel_49 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_198 = count_50 + inc_49; // @[ToAXI4.scala 260:24]
  wire  inc_50 = a_sel_50 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_50 = d_sel_50 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_202 = count_51 + inc_50; // @[ToAXI4.scala 260:24]
  wire  inc_51 = a_sel_51 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_51 = d_sel_51 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_206 = count_52 + inc_51; // @[ToAXI4.scala 260:24]
  wire  inc_52 = a_sel_52 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_52 = d_sel_52 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_210 = count_53 + inc_52; // @[ToAXI4.scala 260:24]
  wire  inc_53 = a_sel_53 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_53 = d_sel_53 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_214 = count_54 + inc_53; // @[ToAXI4.scala 260:24]
  wire  inc_54 = a_sel_54 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_54 = d_sel_54 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_218 = count_55 + inc_54; // @[ToAXI4.scala 260:24]
  wire  inc_55 = a_sel_55 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_55 = d_sel_55 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_222 = count_56 + inc_55; // @[ToAXI4.scala 260:24]
  wire  inc_56 = a_sel_56 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_56 = d_sel_56 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_226 = count_57 + inc_56; // @[ToAXI4.scala 260:24]
  wire  inc_57 = a_sel_57 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_57 = d_sel_57 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_230 = count_58 + inc_57; // @[ToAXI4.scala 260:24]
  wire  inc_58 = a_sel_58 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_58 = d_sel_58 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_234 = count_59 + inc_58; // @[ToAXI4.scala 260:24]
  wire  inc_59 = a_sel_59 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_59 = d_sel_59 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_238 = count_60 + inc_59; // @[ToAXI4.scala 260:24]
  wire  inc_60 = a_sel_60 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_60 = d_sel_60 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_242 = count_61 + inc_60; // @[ToAXI4.scala 260:24]
  wire  inc_61 = a_sel_61 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_61 = d_sel_61 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_246 = count_62 + inc_61; // @[ToAXI4.scala 260:24]
  wire  inc_62 = a_sel_62 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_62 = d_sel_62 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_250 = count_63 + inc_62; // @[ToAXI4.scala 260:24]
  wire  inc_63 = a_sel_63 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_63 = d_sel_63 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_254 = count_64 + inc_63; // @[ToAXI4.scala 260:24]
  wire  inc_64 = a_sel_64 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_64 = d_sel_64 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_258 = count_65 + inc_64; // @[ToAXI4.scala 260:24]
  wire  inc_65 = a_sel_65 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_65 = d_sel_65 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_262 = count_66 + inc_65; // @[ToAXI4.scala 260:24]
  wire  inc_66 = a_sel_66 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_66 = d_sel_66 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_266 = count_67 + inc_66; // @[ToAXI4.scala 260:24]
  wire  inc_67 = a_sel_67 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_67 = d_sel_67 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_270 = count_68 + inc_67; // @[ToAXI4.scala 260:24]
  wire  inc_68 = a_sel_68 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_68 = d_sel_68 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_274 = count_69 + inc_68; // @[ToAXI4.scala 260:24]
  wire  inc_69 = a_sel_69 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_69 = d_sel_69 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_278 = count_70 + inc_69; // @[ToAXI4.scala 260:24]
  wire  inc_70 = a_sel_70 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_70 = d_sel_70 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_282 = count_71 + inc_70; // @[ToAXI4.scala 260:24]
  wire  inc_71 = a_sel_71 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_71 = d_sel_71 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_286 = count_72 + inc_71; // @[ToAXI4.scala 260:24]
  wire  inc_72 = a_sel_72 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_72 = d_sel_72 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_290 = count_73 + inc_72; // @[ToAXI4.scala 260:24]
  wire  inc_73 = a_sel_73 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_73 = d_sel_73 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_294 = count_74 + inc_73; // @[ToAXI4.scala 260:24]
  wire  inc_74 = a_sel_74 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_74 = d_sel_74 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_298 = count_75 + inc_74; // @[ToAXI4.scala 260:24]
  wire  inc_75 = a_sel_75 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_75 = d_sel_75 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_302 = count_76 + inc_75; // @[ToAXI4.scala 260:24]
  wire  inc_76 = a_sel_76 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_76 = d_sel_76 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_306 = count_77 + inc_76; // @[ToAXI4.scala 260:24]
  wire  inc_77 = a_sel_77 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_77 = d_sel_77 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_310 = count_78 + inc_77; // @[ToAXI4.scala 260:24]
  wire  inc_78 = a_sel_78 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_78 = d_sel_78 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_314 = count_79 + inc_78; // @[ToAXI4.scala 260:24]
  wire  inc_79 = a_sel_79 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_79 = d_sel_79 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_318 = count_80 + inc_79; // @[ToAXI4.scala 260:24]
  wire  inc_80 = a_sel_80 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_80 = d_sel_80 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_322 = count_81 + inc_80; // @[ToAXI4.scala 260:24]
  wire  inc_81 = a_sel_81 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_81 = d_sel_81 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_326 = count_82 + inc_81; // @[ToAXI4.scala 260:24]
  wire  inc_82 = a_sel_82 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_82 = d_sel_82 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_330 = count_83 + inc_82; // @[ToAXI4.scala 260:24]
  wire  inc_83 = a_sel_83 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_83 = d_sel_83 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_334 = count_84 + inc_83; // @[ToAXI4.scala 260:24]
  wire  inc_84 = a_sel_84 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_84 = d_sel_84 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_338 = count_85 + inc_84; // @[ToAXI4.scala 260:24]
  wire  inc_85 = a_sel_85 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_85 = d_sel_85 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_342 = count_86 + inc_85; // @[ToAXI4.scala 260:24]
  wire  inc_86 = a_sel_86 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_86 = d_sel_86 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_346 = count_87 + inc_86; // @[ToAXI4.scala 260:24]
  wire  inc_87 = a_sel_87 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_87 = d_sel_87 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_350 = count_88 + inc_87; // @[ToAXI4.scala 260:24]
  wire  inc_88 = a_sel_88 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_88 = d_sel_88 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_354 = count_89 + inc_88; // @[ToAXI4.scala 260:24]
  wire  inc_89 = a_sel_89 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_89 = d_sel_89 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_358 = count_90 + inc_89; // @[ToAXI4.scala 260:24]
  wire  inc_90 = a_sel_90 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_90 = d_sel_90 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_362 = count_91 + inc_90; // @[ToAXI4.scala 260:24]
  wire  inc_91 = a_sel_91 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_91 = d_sel_91 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_366 = count_92 + inc_91; // @[ToAXI4.scala 260:24]
  wire  inc_92 = a_sel_92 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_92 = d_sel_92 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_370 = count_93 + inc_92; // @[ToAXI4.scala 260:24]
  wire  inc_93 = a_sel_93 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_93 = d_sel_93 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_374 = count_94 + inc_93; // @[ToAXI4.scala 260:24]
  wire  inc_94 = a_sel_94 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_94 = d_sel_94 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_378 = count_95 + inc_94; // @[ToAXI4.scala 260:24]
  wire  inc_95 = a_sel_95 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_95 = d_sel_95 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_382 = count_96 + inc_95; // @[ToAXI4.scala 260:24]
  wire  inc_96 = a_sel_96 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_96 = d_sel_96 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_386 = count_97 + inc_96; // @[ToAXI4.scala 260:24]
  wire  inc_97 = a_sel_97 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_97 = d_sel_97 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_390 = count_98 + inc_97; // @[ToAXI4.scala 260:24]
  wire  inc_98 = a_sel_98 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_98 = d_sel_98 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_394 = count_99 + inc_98; // @[ToAXI4.scala 260:24]
  wire  inc_99 = a_sel_99 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_99 = d_sel_99 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_398 = count_100 + inc_99; // @[ToAXI4.scala 260:24]
  wire  inc_100 = a_sel_100 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_100 = d_sel_100 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_402 = count_101 + inc_100; // @[ToAXI4.scala 260:24]
  wire  inc_101 = a_sel_101 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_101 = d_sel_101 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_406 = count_102 + inc_101; // @[ToAXI4.scala 260:24]
  wire  inc_102 = a_sel_102 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_102 = d_sel_102 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_410 = count_103 + inc_102; // @[ToAXI4.scala 260:24]
  wire  inc_103 = a_sel_103 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_103 = d_sel_103 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_414 = count_104 + inc_103; // @[ToAXI4.scala 260:24]
  wire  inc_104 = a_sel_104 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_104 = d_sel_104 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_418 = count_105 + inc_104; // @[ToAXI4.scala 260:24]
  wire  inc_105 = a_sel_105 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_105 = d_sel_105 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_422 = count_106 + inc_105; // @[ToAXI4.scala 260:24]
  wire  inc_106 = a_sel_106 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_106 = d_sel_106 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_426 = count_107 + inc_106; // @[ToAXI4.scala 260:24]
  wire  inc_107 = a_sel_107 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_107 = d_sel_107 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_430 = count_108 + inc_107; // @[ToAXI4.scala 260:24]
  wire  inc_108 = a_sel_108 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_108 = d_sel_108 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_434 = count_109 + inc_108; // @[ToAXI4.scala 260:24]
  wire  inc_109 = a_sel_109 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_109 = d_sel_109 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_438 = count_110 + inc_109; // @[ToAXI4.scala 260:24]
  wire  inc_110 = a_sel_110 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_110 = d_sel_110 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_442 = count_111 + inc_110; // @[ToAXI4.scala 260:24]
  wire  inc_111 = a_sel_111 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_111 = d_sel_111 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_446 = count_112 + inc_111; // @[ToAXI4.scala 260:24]
  wire  inc_112 = a_sel_112 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_112 = d_sel_112 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_450 = count_113 + inc_112; // @[ToAXI4.scala 260:24]
  wire  inc_113 = a_sel_113 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_113 = d_sel_113 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_454 = count_114 + inc_113; // @[ToAXI4.scala 260:24]
  wire  inc_114 = a_sel_114 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_114 = d_sel_114 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_458 = count_115 + inc_114; // @[ToAXI4.scala 260:24]
  wire  inc_115 = a_sel_115 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_115 = d_sel_115 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_462 = count_116 + inc_115; // @[ToAXI4.scala 260:24]
  wire  inc_116 = a_sel_116 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_116 = d_sel_116 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_466 = count_117 + inc_116; // @[ToAXI4.scala 260:24]
  wire  inc_117 = a_sel_117 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_117 = d_sel_117 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_470 = count_118 + inc_117; // @[ToAXI4.scala 260:24]
  wire  inc_118 = a_sel_118 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_118 = d_sel_118 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_474 = count_119 + inc_118; // @[ToAXI4.scala 260:24]
  wire  inc_119 = a_sel_119 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_119 = d_sel_119 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_478 = count_120 + inc_119; // @[ToAXI4.scala 260:24]
  wire  inc_120 = a_sel_120 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_120 = d_sel_120 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_482 = count_121 + inc_120; // @[ToAXI4.scala 260:24]
  wire  inc_121 = a_sel_121 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_121 = d_sel_121 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_486 = count_122 + inc_121; // @[ToAXI4.scala 260:24]
  wire  inc_122 = a_sel_122 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_122 = d_sel_122 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_490 = count_123 + inc_122; // @[ToAXI4.scala 260:24]
  wire  inc_123 = a_sel_123 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_123 = d_sel_123 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_494 = count_124 + inc_123; // @[ToAXI4.scala 260:24]
  wire  inc_124 = a_sel_124 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_124 = d_sel_124 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_498 = count_125 + inc_124; // @[ToAXI4.scala 260:24]
  wire  inc_125 = a_sel_125 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_125 = d_sel_125 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_502 = count_126 + inc_125; // @[ToAXI4.scala 260:24]
  wire  inc_126 = a_sel_126 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_126 = d_sel_126 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_506 = count_127 + inc_126; // @[ToAXI4.scala 260:24]
  wire  inc_127 = a_sel_127 & _inc_T; // @[ToAXI4.scala 258:22]
  wire  dec_127 = d_sel_127 & d_last & _dec_T_1; // @[ToAXI4.scala 259:32]
  wire  _count_T_510 = count_128 + inc_127; // @[ToAXI4.scala 260:24]
  TLMonitor_20 monitor ( // @[Nodes.scala 24:25]
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_io_in_a_bits_mask),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt)
  );
  Queue_10 deq ( // @[Decoupled.scala 361:21]
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_data(deq_io_enq_bits_data),
    .io_enq_bits_strb(deq_io_enq_bits_strb),
    .io_enq_bits_last(deq_io_enq_bits_last),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_data(deq_io_deq_bits_data),
    .io_deq_bits_strb(deq_io_deq_bits_strb),
    .io_deq_bits_last(deq_io_deq_bits_last)
  );
  Queue_27 queue_arw_deq ( // @[Decoupled.scala 361:21]
    .clock(queue_arw_deq_clock),
    .reset(queue_arw_deq_reset),
    .io_enq_ready(queue_arw_deq_io_enq_ready),
    .io_enq_valid(queue_arw_deq_io_enq_valid),
    .io_enq_bits_id(queue_arw_deq_io_enq_bits_id),
    .io_enq_bits_addr(queue_arw_deq_io_enq_bits_addr),
    .io_enq_bits_len(queue_arw_deq_io_enq_bits_len),
    .io_enq_bits_size(queue_arw_deq_io_enq_bits_size),
    .io_enq_bits_cache(queue_arw_deq_io_enq_bits_cache),
    .io_enq_bits_prot(queue_arw_deq_io_enq_bits_prot),
    .io_enq_bits_echo_tl_state_size(queue_arw_deq_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(queue_arw_deq_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_wen(queue_arw_deq_io_enq_bits_wen),
    .io_deq_ready(queue_arw_deq_io_deq_ready),
    .io_deq_valid(queue_arw_deq_io_deq_valid),
    .io_deq_bits_id(queue_arw_deq_io_deq_bits_id),
    .io_deq_bits_addr(queue_arw_deq_io_deq_bits_addr),
    .io_deq_bits_len(queue_arw_deq_io_deq_bits_len),
    .io_deq_bits_size(queue_arw_deq_io_deq_bits_size),
    .io_deq_bits_burst(queue_arw_deq_io_deq_bits_burst),
    .io_deq_bits_lock(queue_arw_deq_io_deq_bits_lock),
    .io_deq_bits_cache(queue_arw_deq_io_deq_bits_cache),
    .io_deq_bits_prot(queue_arw_deq_io_deq_bits_prot),
    .io_deq_bits_qos(queue_arw_deq_io_deq_bits_qos),
    .io_deq_bits_echo_tl_state_size(queue_arw_deq_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(queue_arw_deq_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_wen(queue_arw_deq_io_deq_bits_wen)
  );
  assign auto_in_a_ready = ~stall & _bundleIn_0_a_ready_T_3; // @[ToAXI4.scala 196:28]
  assign auto_in_d_valid = r_wins ? auto_out_r_valid : auto_out_b_valid; // @[ToAXI4.scala 219:24]
  assign auto_in_d_bits_opcode = r_wins ? 3'h1 : 3'h0; // @[ToAXI4.scala 237:23]
  assign auto_in_d_bits_size = r_wins ? r_d_size : b_d_size; // @[ToAXI4.scala 237:23]
  assign auto_in_d_bits_source = r_wins ? auto_out_r_bits_echo_tl_state_source : auto_out_b_bits_echo_tl_state_source; // @[ToAXI4.scala 237:23]
  assign auto_in_d_bits_denied = r_wins ? _GEN_261 : b_denied; // @[ToAXI4.scala 237:23]
  assign auto_in_d_bits_data = auto_out_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_d_bits_corrupt = r_wins & r_d_corrupt; // @[ToAXI4.scala 237:23]
  assign auto_out_aw_valid = queue_arw_valid & queue_arw_bits_wen; // @[ToAXI4.scala 156:39]
  assign auto_out_aw_bits_id = queue_arw_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_addr = queue_arw_deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_len = queue_arw_deq_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_size = queue_arw_deq_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_burst = queue_arw_deq_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_lock = queue_arw_deq_io_deq_bits_lock; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_cache = queue_arw_deq_io_deq_bits_cache; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_prot = queue_arw_deq_io_deq_bits_prot; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_qos = queue_arw_deq_io_deq_bits_qos; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_echo_tl_state_size = queue_arw_deq_io_deq_bits_echo_tl_state_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_echo_tl_state_source = queue_arw_deq_io_deq_bits_echo_tl_state_source; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_valid = deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_w_bits_data = deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_strb = deq_io_deq_bits_strb; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_last = deq_io_deq_bits_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_b_ready = auto_in_d_ready & ~r_wins; // @[ToAXI4.scala 218:33]
  assign auto_out_ar_valid = queue_arw_valid & ~queue_arw_bits_wen; // @[ToAXI4.scala 155:39]
  assign auto_out_ar_bits_id = queue_arw_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_addr = queue_arw_deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_len = queue_arw_deq_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_size = queue_arw_deq_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_burst = queue_arw_deq_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_lock = queue_arw_deq_io_deq_bits_lock; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_cache = queue_arw_deq_io_deq_bits_cache; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_prot = queue_arw_deq_io_deq_bits_prot; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_qos = queue_arw_deq_io_deq_bits_qos; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_echo_tl_state_size = queue_arw_deq_io_deq_bits_echo_tl_state_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_echo_tl_state_source = queue_arw_deq_io_deq_bits_echo_tl_state_source; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_r_ready = auto_in_d_ready & r_wins; // @[ToAXI4.scala 217:33]
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = ~stall & _bundleIn_0_a_ready_T_3; // @[ToAXI4.scala 196:28]
  assign monitor_io_in_a_valid = auto_in_a_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_ready = auto_in_d_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign monitor_io_in_d_valid = r_wins ? auto_out_r_valid : auto_out_b_valid; // @[ToAXI4.scala 219:24]
  assign monitor_io_in_d_bits_opcode = r_wins ? 3'h1 : 3'h0; // @[ToAXI4.scala 237:23]
  assign monitor_io_in_d_bits_size = r_wins ? r_d_size : b_d_size; // @[ToAXI4.scala 237:23]
  assign monitor_io_in_d_bits_source = r_wins ? auto_out_r_bits_echo_tl_state_source :
    auto_out_b_bits_echo_tl_state_source; // @[ToAXI4.scala 237:23]
  assign monitor_io_in_d_bits_denied = r_wins ? _GEN_261 : b_denied; // @[ToAXI4.scala 237:23]
  assign monitor_io_in_d_bits_corrupt = r_wins & r_d_corrupt; // @[ToAXI4.scala 237:23]
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = _out_arw_valid_T_1 & a_isPut & _bundleIn_0_a_ready_T_1; // @[ToAXI4.scala 199:54]
  assign deq_io_enq_bits_data = auto_in_a_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_strb = auto_in_a_bits_mask; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_last = counter == 3'h1 | beats1 == 3'h0; // @[Edges.scala 231:37]
  assign deq_io_deq_ready = auto_out_w_ready; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign queue_arw_deq_clock = clock;
  assign queue_arw_deq_reset = reset;
  assign queue_arw_deq_io_enq_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & _out_arw_valid_T_4; // @[ToAXI4.scala 197:45]
  assign queue_arw_deq_io_enq_bits_id = 7'h7f == auto_in_a_bits_source ? 7'h7f : _GEN_128; // @[ToAXI4.scala 166:{17,17}]
  assign queue_arw_deq_io_enq_bits_addr = auto_in_a_bits_address; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign queue_arw_deq_io_enq_bits_len = _out_arw_bits_len_T_3[10:3]; // @[ToAXI4.scala 168:84]
  assign queue_arw_deq_io_enq_bits_size = auto_in_a_bits_size >= 3'h3 ? 3'h3 : auto_in_a_bits_size; // @[ToAXI4.scala 169:23]
  assign queue_arw_deq_io_enq_bits_cache = {out_arw_bits_cache_hi,out_arw_bits_cache_lo}; // @[Cat.scala 31:58]
  assign queue_arw_deq_io_enq_bits_prot = {out_arw_bits_prot_hi,auto_in_a_bits_user_amba_prot_privileged}; // @[Cat.scala 31:58]
  assign queue_arw_deq_io_enq_bits_echo_tl_state_size = {{1'd0}, auto_in_a_bits_size}; // @[ToAXI4.scala 147:25 179:22]
  assign queue_arw_deq_io_enq_bits_echo_tl_state_source = auto_in_a_bits_source; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign queue_arw_deq_io_enq_bits_wen = ~auto_in_a_bits_opcode[2]; // @[Edges.scala 91:28]
  assign queue_arw_deq_io_deq_ready = queue_arw_bits_wen ? auto_out_aw_ready : auto_out_ar_ready; // @[ToAXI4.scala 157:29]
  always @(posedge clock) begin
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_128 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_128 <= _count_T_510 - dec_127; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_127 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_127 <= _count_T_506 - dec_126; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_126 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_126 <= _count_T_502 - dec_125; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_125 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_125 <= _count_T_498 - dec_124; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_124 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_124 <= _count_T_494 - dec_123; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_123 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_123 <= _count_T_490 - dec_122; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_122 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_122 <= _count_T_486 - dec_121; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_121 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_121 <= _count_T_482 - dec_120; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_120 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_120 <= _count_T_478 - dec_119; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_119 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_119 <= _count_T_474 - dec_118; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_118 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_118 <= _count_T_470 - dec_117; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_117 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_117 <= _count_T_466 - dec_116; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_116 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_116 <= _count_T_462 - dec_115; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_115 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_115 <= _count_T_458 - dec_114; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_114 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_114 <= _count_T_454 - dec_113; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_113 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_113 <= _count_T_450 - dec_112; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_112 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_112 <= _count_T_446 - dec_111; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_111 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_111 <= _count_T_442 - dec_110; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_110 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_110 <= _count_T_438 - dec_109; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_109 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_109 <= _count_T_434 - dec_108; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_108 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_108 <= _count_T_430 - dec_107; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_107 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_107 <= _count_T_426 - dec_106; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_106 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_106 <= _count_T_422 - dec_105; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_105 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_105 <= _count_T_418 - dec_104; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_104 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_104 <= _count_T_414 - dec_103; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_103 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_103 <= _count_T_410 - dec_102; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_102 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_102 <= _count_T_406 - dec_101; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_101 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_101 <= _count_T_402 - dec_100; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_100 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_100 <= _count_T_398 - dec_99; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_99 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_99 <= _count_T_394 - dec_98; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_98 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_98 <= _count_T_390 - dec_97; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_97 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_97 <= _count_T_386 - dec_96; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_96 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_96 <= _count_T_382 - dec_95; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_95 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_95 <= _count_T_378 - dec_94; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_94 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_94 <= _count_T_374 - dec_93; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_93 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_93 <= _count_T_370 - dec_92; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_92 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_92 <= _count_T_366 - dec_91; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_91 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_91 <= _count_T_362 - dec_90; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_90 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_90 <= _count_T_358 - dec_89; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_89 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_89 <= _count_T_354 - dec_88; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_88 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_88 <= _count_T_350 - dec_87; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_87 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_87 <= _count_T_346 - dec_86; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_86 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_86 <= _count_T_342 - dec_85; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_85 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_85 <= _count_T_338 - dec_84; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_84 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_84 <= _count_T_334 - dec_83; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_83 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_83 <= _count_T_330 - dec_82; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_82 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_82 <= _count_T_326 - dec_81; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_81 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_81 <= _count_T_322 - dec_80; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_80 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_80 <= _count_T_318 - dec_79; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_79 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_79 <= _count_T_314 - dec_78; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_78 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_78 <= _count_T_310 - dec_77; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_77 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_77 <= _count_T_306 - dec_76; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_76 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_76 <= _count_T_302 - dec_75; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_75 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_75 <= _count_T_298 - dec_74; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_74 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_74 <= _count_T_294 - dec_73; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_73 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_73 <= _count_T_290 - dec_72; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_72 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_72 <= _count_T_286 - dec_71; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_71 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_71 <= _count_T_282 - dec_70; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_70 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_70 <= _count_T_278 - dec_69; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_69 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_69 <= _count_T_274 - dec_68; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_68 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_68 <= _count_T_270 - dec_67; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_67 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_67 <= _count_T_266 - dec_66; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_66 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_66 <= _count_T_262 - dec_65; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_65 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_65 <= _count_T_258 - dec_64; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_64 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_64 <= _count_T_254 - dec_63; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_63 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_63 <= _count_T_250 - dec_62; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_62 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_62 <= _count_T_246 - dec_61; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_61 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_61 <= _count_T_242 - dec_60; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_60 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_60 <= _count_T_238 - dec_59; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_59 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_59 <= _count_T_234 - dec_58; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_58 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_58 <= _count_T_230 - dec_57; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_57 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_57 <= _count_T_226 - dec_56; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_56 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_56 <= _count_T_222 - dec_55; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_55 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_55 <= _count_T_218 - dec_54; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_54 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_54 <= _count_T_214 - dec_53; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_53 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_53 <= _count_T_210 - dec_52; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_52 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_52 <= _count_T_206 - dec_51; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_51 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_51 <= _count_T_202 - dec_50; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_50 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_50 <= _count_T_198 - dec_49; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_49 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_49 <= _count_T_194 - dec_48; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_48 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_48 <= _count_T_190 - dec_47; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_47 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_47 <= _count_T_186 - dec_46; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_46 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_46 <= _count_T_182 - dec_45; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_45 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_45 <= _count_T_178 - dec_44; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_44 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_44 <= _count_T_174 - dec_43; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_43 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_43 <= _count_T_170 - dec_42; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_42 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_42 <= _count_T_166 - dec_41; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_41 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_41 <= _count_T_162 - dec_40; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_40 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_40 <= _count_T_158 - dec_39; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_39 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_39 <= _count_T_154 - dec_38; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_38 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_38 <= _count_T_150 - dec_37; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_37 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_37 <= _count_T_146 - dec_36; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_36 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_36 <= _count_T_142 - dec_35; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_35 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_35 <= _count_T_138 - dec_34; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_34 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_34 <= _count_T_134 - dec_33; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_33 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_33 <= _count_T_130 - dec_32; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_32 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_32 <= _count_T_126 - dec_31; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_31 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_31 <= _count_T_122 - dec_30; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_30 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_30 <= _count_T_118 - dec_29; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_29 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_29 <= _count_T_114 - dec_28; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_28 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_28 <= _count_T_110 - dec_27; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_27 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_27 <= _count_T_106 - dec_26; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_26 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_26 <= _count_T_102 - dec_25; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_25 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_25 <= _count_T_98 - dec_24; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_24 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_24 <= _count_T_94 - dec_23; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_23 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_23 <= _count_T_90 - dec_22; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_22 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_22 <= _count_T_86 - dec_21; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_21 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_21 <= _count_T_82 - dec_20; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_20 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_20 <= _count_T_78 - dec_19; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_19 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_19 <= _count_T_74 - dec_18; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_18 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_18 <= _count_T_70 - dec_17; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_17 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_17 <= _count_T_66 - dec_16; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_16 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_16 <= _count_T_62 - dec_15; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_15 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_15 <= _count_T_58 - dec_14; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_14 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_14 <= _count_T_54 - dec_13; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_13 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_13 <= _count_T_50 - dec_12; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_12 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_12 <= _count_T_46 - dec_11; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_11 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_11 <= _count_T_42 - dec_10; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_10 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_10 <= _count_T_38 - dec_9; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_9 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_9 <= _count_T_34 - dec_8; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_8 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_8 <= _count_T_30 - dec_7; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_7 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_7 <= _count_T_26 - dec_6; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_6 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_6 <= _count_T_22 - dec_5; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_5 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_5 <= _count_T_18 - dec_4; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_4 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_4 <= _count_T_14 - dec_3; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_3 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_3 <= _count_T_10 - dec_2; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_2 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_2 <= _count_T_6 - dec_1; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[ToAXI4.scala 254:28]
      count_1 <= 1'h0; // @[ToAXI4.scala 254:28]
    end else begin
      count_1 <= _count_T_2 - dec; // @[ToAXI4.scala 260:15]
    end
    if (reset) begin // @[Edges.scala 228:27]
      counter <= 3'h0; // @[Edges.scala 228:27]
    end else if (_T) begin // @[Edges.scala 234:17]
      if (a_first) begin // @[Edges.scala 235:21]
        if (a_isPut) begin // @[Edges.scala 220:14]
          counter <= beats1_decode;
        end else begin
          counter <= 3'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin // @[ToAXI4.scala 161:30]
      doneAW <= 1'h0; // @[ToAXI4.scala 161:30]
    end else if (_T) begin // @[ToAXI4.scala 162:26]
      doneAW <= ~a_last; // @[ToAXI4.scala 162:35]
    end
    if (reset) begin // @[ToAXI4.scala 206:30]
      r_holds_d <= 1'h0; // @[ToAXI4.scala 206:30]
    end else if (_T_2) begin // @[ToAXI4.scala 207:27]
      r_holds_d <= ~auto_out_r_bits_last; // @[ToAXI4.scala 207:39]
    end
    if (auto_out_b_valid & ~bundleOut_0_b_ready) begin // @[ToAXI4.scala 210:42]
      b_delay <= _b_delay_T_1; // @[ToAXI4.scala 211:17]
    end else begin
      b_delay <= 3'h0; // @[ToAXI4.scala 213:17]
    end
    r_first <= reset | _GEN_260; // @[ToAXI4.scala 224:{28,28}]
    if (r_first) begin // @[Reg.scala 17:18]
      r_denied_r <= _r_denied_T; // @[Reg.scala 17:22]
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec | count_1) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec | count_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc | idle) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc | idle)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_1 | count_2) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_1 | count_2)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_1 | idle_1) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_1 | idle_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_2 | count_3) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_2 | count_3)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_2 | idle_2) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_2 | idle_2)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_3 | count_4) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_3 | count_4)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_3 | idle_3) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_3 | idle_3)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_4 | count_5) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_4 | count_5)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_4 | idle_4) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_4 | idle_4)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_5 | count_6) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_5 | count_6)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_5 | idle_5) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_5 | idle_5)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_6 | count_7) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_6 | count_7)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_6 | idle_6) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_6 | idle_6)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_7 | count_8) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_7 | count_8)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_7 | idle_7) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_7 | idle_7)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_8 | count_9) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_8 | count_9)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_8 | idle_8) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_8 | idle_8)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_9 | count_10) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_9 | count_10)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_9 | idle_9) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_9 | idle_9)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_10 | count_11) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_10 | count_11)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_10 | idle_10) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_10 | idle_10)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_11 | count_12) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_11 | count_12)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_11 | idle_11) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_11 | idle_11)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_12 | count_13) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_12 | count_13)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_12 | idle_12) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_12 | idle_12)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_13 | count_14) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_13 | count_14)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_13 | idle_13) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_13 | idle_13)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_14 | count_15) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_14 | count_15)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_14 | idle_14) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_14 | idle_14)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_15 | count_16) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_15 | count_16)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_15 | idle_15) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_15 | idle_15)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_16 | count_17) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_16 | count_17)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_16 | idle_16) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_16 | idle_16)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_17 | count_18) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_17 | count_18)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_17 | idle_17) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_17 | idle_17)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_18 | count_19) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_18 | count_19)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_18 | idle_18) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_18 | idle_18)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_19 | count_20) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_19 | count_20)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_19 | idle_19) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_19 | idle_19)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_20 | count_21) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_20 | count_21)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_20 | idle_20) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_20 | idle_20)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_21 | count_22) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_21 | count_22)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_21 | idle_21) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_21 | idle_21)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_22 | count_23) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_22 | count_23)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_22 | idle_22) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_22 | idle_22)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_23 | count_24) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_23 | count_24)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_23 | idle_23) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_23 | idle_23)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_24 | count_25) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_24 | count_25)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_24 | idle_24) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_24 | idle_24)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_25 | count_26) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_25 | count_26)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_25 | idle_25) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_25 | idle_25)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_26 | count_27) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_26 | count_27)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_26 | idle_26) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_26 | idle_26)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_27 | count_28) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_27 | count_28)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_27 | idle_27) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_27 | idle_27)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_28 | count_29) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_28 | count_29)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_28 | idle_28) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_28 | idle_28)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_29 | count_30) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_29 | count_30)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_29 | idle_29) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_29 | idle_29)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_30 | count_31) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_30 | count_31)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_30 | idle_30) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_30 | idle_30)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_31 | count_32) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_31 | count_32)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_31 | idle_31) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_31 | idle_31)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_32 | count_33) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_32 | count_33)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_32 | idle_32) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_32 | idle_32)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_33 | count_34) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_33 | count_34)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_33 | idle_33) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_33 | idle_33)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_34 | count_35) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_34 | count_35)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_34 | idle_34) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_34 | idle_34)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_35 | count_36) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_35 | count_36)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_35 | idle_35) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_35 | idle_35)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_36 | count_37) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_36 | count_37)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_36 | idle_36) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_36 | idle_36)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_37 | count_38) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_37 | count_38)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_37 | idle_37) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_37 | idle_37)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_38 | count_39) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_38 | count_39)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_38 | idle_38) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_38 | idle_38)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_39 | count_40) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_39 | count_40)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_39 | idle_39) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_39 | idle_39)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_40 | count_41) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_40 | count_41)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_40 | idle_40) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_40 | idle_40)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_41 | count_42) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_41 | count_42)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_41 | idle_41) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_41 | idle_41)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_42 | count_43) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_42 | count_43)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_42 | idle_42) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_42 | idle_42)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_43 | count_44) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_43 | count_44)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_43 | idle_43) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_43 | idle_43)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_44 | count_45) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_44 | count_45)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_44 | idle_44) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_44 | idle_44)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_45 | count_46) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_45 | count_46)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_45 | idle_45) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_45 | idle_45)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_46 | count_47) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_46 | count_47)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_46 | idle_46) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_46 | idle_46)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_47 | count_48) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_47 | count_48)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_47 | idle_47) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_47 | idle_47)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_48 | count_49) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_48 | count_49)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_48 | idle_48) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_48 | idle_48)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_49 | count_50) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_49 | count_50)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_49 | idle_49) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_49 | idle_49)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_50 | count_51) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_50 | count_51)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_50 | idle_50) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_50 | idle_50)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_51 | count_52) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_51 | count_52)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_51 | idle_51) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_51 | idle_51)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_52 | count_53) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_52 | count_53)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_52 | idle_52) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_52 | idle_52)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_53 | count_54) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_53 | count_54)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_53 | idle_53) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_53 | idle_53)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_54 | count_55) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_54 | count_55)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_54 | idle_54) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_54 | idle_54)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_55 | count_56) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_55 | count_56)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_55 | idle_55) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_55 | idle_55)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_56 | count_57) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_56 | count_57)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_56 | idle_56) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_56 | idle_56)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_57 | count_58) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_57 | count_58)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_57 | idle_57) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_57 | idle_57)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_58 | count_59) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_58 | count_59)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_58 | idle_58) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_58 | idle_58)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_59 | count_60) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_59 | count_60)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_59 | idle_59) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_59 | idle_59)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_60 | count_61) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_60 | count_61)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_60 | idle_60) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_60 | idle_60)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_61 | count_62) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_61 | count_62)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_61 | idle_61) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_61 | idle_61)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_62 | count_63) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_62 | count_63)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_62 | idle_62) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_62 | idle_62)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_63 | count_64) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_63 | count_64)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_63 | idle_63) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_63 | idle_63)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_64 | count_65) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_64 | count_65)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_64 | idle_64) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_64 | idle_64)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_65 | count_66) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_65 | count_66)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_65 | idle_65) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_65 | idle_65)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_66 | count_67) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_66 | count_67)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_66 | idle_66) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_66 | idle_66)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_67 | count_68) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_67 | count_68)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_67 | idle_67) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_67 | idle_67)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_68 | count_69) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_68 | count_69)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_68 | idle_68) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_68 | idle_68)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_69 | count_70) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_69 | count_70)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_69 | idle_69) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_69 | idle_69)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_70 | count_71) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_70 | count_71)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_70 | idle_70) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_70 | idle_70)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_71 | count_72) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_71 | count_72)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_71 | idle_71) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_71 | idle_71)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_72 | count_73) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_72 | count_73)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_72 | idle_72) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_72 | idle_72)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_73 | count_74) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_73 | count_74)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_73 | idle_73) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_73 | idle_73)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_74 | count_75) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_74 | count_75)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_74 | idle_74) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_74 | idle_74)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_75 | count_76) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_75 | count_76)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_75 | idle_75) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_75 | idle_75)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_76 | count_77) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_76 | count_77)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_76 | idle_76) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_76 | idle_76)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_77 | count_78) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_77 | count_78)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_77 | idle_77) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_77 | idle_77)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_78 | count_79) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_78 | count_79)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_78 | idle_78) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_78 | idle_78)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_79 | count_80) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_79 | count_80)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_79 | idle_79) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_79 | idle_79)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_80 | count_81) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_80 | count_81)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_80 | idle_80) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_80 | idle_80)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_81 | count_82) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_81 | count_82)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_81 | idle_81) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_81 | idle_81)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_82 | count_83) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_82 | count_83)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_82 | idle_82) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_82 | idle_82)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_83 | count_84) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_83 | count_84)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_83 | idle_83) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_83 | idle_83)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_84 | count_85) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_84 | count_85)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_84 | idle_84) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_84 | idle_84)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_85 | count_86) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_85 | count_86)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_85 | idle_85) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_85 | idle_85)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_86 | count_87) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_86 | count_87)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_86 | idle_86) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_86 | idle_86)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_87 | count_88) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_87 | count_88)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_87 | idle_87) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_87 | idle_87)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_88 | count_89) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_88 | count_89)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_88 | idle_88) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_88 | idle_88)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_89 | count_90) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_89 | count_90)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_89 | idle_89) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_89 | idle_89)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_90 | count_91) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_90 | count_91)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_90 | idle_90) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_90 | idle_90)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_91 | count_92) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_91 | count_92)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_91 | idle_91) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_91 | idle_91)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_92 | count_93) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_92 | count_93)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_92 | idle_92) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_92 | idle_92)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_93 | count_94) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_93 | count_94)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_93 | idle_93) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_93 | idle_93)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_94 | count_95) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_94 | count_95)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_94 | idle_94) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_94 | idle_94)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_95 | count_96) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_95 | count_96)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_95 | idle_95) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_95 | idle_95)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_96 | count_97) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_96 | count_97)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_96 | idle_96) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_96 | idle_96)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_97 | count_98) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_97 | count_98)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_97 | idle_97) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_97 | idle_97)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_98 | count_99) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_98 | count_99)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_98 | idle_98) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_98 | idle_98)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_99 | count_100) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_99 | count_100)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_99 | idle_99) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_99 | idle_99)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_100 | count_101) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_100 | count_101)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_100 | idle_100) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_100 | idle_100)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_101 | count_102) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_101 | count_102)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_101 | idle_101) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_101 | idle_101)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_102 | count_103) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_102 | count_103)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_102 | idle_102) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_102 | idle_102)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_103 | count_104) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_103 | count_104)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_103 | idle_103) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_103 | idle_103)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_104 | count_105) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_104 | count_105)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_104 | idle_104) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_104 | idle_104)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_105 | count_106) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_105 | count_106)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_105 | idle_105) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_105 | idle_105)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_106 | count_107) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_106 | count_107)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_106 | idle_106) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_106 | idle_106)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_107 | count_108) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_107 | count_108)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_107 | idle_107) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_107 | idle_107)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_108 | count_109) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_108 | count_109)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_108 | idle_108) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_108 | idle_108)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_109 | count_110) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_109 | count_110)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_109 | idle_109) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_109 | idle_109)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_110 | count_111) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_110 | count_111)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_110 | idle_110) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_110 | idle_110)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_111 | count_112) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_111 | count_112)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_111 | idle_111) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_111 | idle_111)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_112 | count_113) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_112 | count_113)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_112 | idle_112) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_112 | idle_112)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_113 | count_114) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_113 | count_114)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_113 | idle_113) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_113 | idle_113)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_114 | count_115) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_114 | count_115)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_114 | idle_114) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_114 | idle_114)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_115 | count_116) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_115 | count_116)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_115 | idle_115) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_115 | idle_115)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_116 | count_117) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_116 | count_117)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_116 | idle_116) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_116 | idle_116)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_117 | count_118) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_117 | count_118)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_117 | idle_117) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_117 | idle_117)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_118 | count_119) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_118 | count_119)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_118 | idle_118) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_118 | idle_118)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_119 | count_120) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_119 | count_120)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_119 | idle_119) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_119 | idle_119)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_120 | count_121) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_120 | count_121)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_120 | idle_120) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_120 | idle_120)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_121 | count_122) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_121 | count_122)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_121 | idle_121) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_121 | idle_121)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_122 | count_123) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_122 | count_123)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_122 | idle_122) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_122 | idle_122)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_123 | count_124) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_123 | count_124)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_123 | idle_123) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_123 | idle_123)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_124 | count_125) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_124 | count_125)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_124 | idle_124) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_124 | idle_124)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_125 | count_126) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_125 | count_126)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_125 | idle_125) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_125 | idle_125)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_126 | count_127) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_126 | count_127)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_126 | idle_126) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_126 | idle_126)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_127 | count_128) & ~reset) begin
          $fatal; // @[ToAXI4.scala 262:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~dec_127 | count_128)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n"); // @[ToAXI4.scala 262:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_127 | idle_127) & _T_10) begin
          $fatal; // @[ToAXI4.scala 263:16]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_10 & ~(~inc_127 | idle_127)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n"); // @[ToAXI4.scala 263:16]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  count_128 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  count_127 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  count_126 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  count_125 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  count_124 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  count_123 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  count_122 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  count_121 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  count_120 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  count_119 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  count_118 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  count_117 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  count_116 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  count_115 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  count_114 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  count_113 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  count_112 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  count_111 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  count_110 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  count_109 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  count_108 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  count_107 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  count_106 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  count_105 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  count_104 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  count_103 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  count_102 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  count_101 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  count_100 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  count_99 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  count_98 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  count_97 = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  count_96 = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  count_95 = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  count_94 = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  count_93 = _RAND_35[0:0];
  _RAND_36 = {1{`RANDOM}};
  count_92 = _RAND_36[0:0];
  _RAND_37 = {1{`RANDOM}};
  count_91 = _RAND_37[0:0];
  _RAND_38 = {1{`RANDOM}};
  count_90 = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  count_89 = _RAND_39[0:0];
  _RAND_40 = {1{`RANDOM}};
  count_88 = _RAND_40[0:0];
  _RAND_41 = {1{`RANDOM}};
  count_87 = _RAND_41[0:0];
  _RAND_42 = {1{`RANDOM}};
  count_86 = _RAND_42[0:0];
  _RAND_43 = {1{`RANDOM}};
  count_85 = _RAND_43[0:0];
  _RAND_44 = {1{`RANDOM}};
  count_84 = _RAND_44[0:0];
  _RAND_45 = {1{`RANDOM}};
  count_83 = _RAND_45[0:0];
  _RAND_46 = {1{`RANDOM}};
  count_82 = _RAND_46[0:0];
  _RAND_47 = {1{`RANDOM}};
  count_81 = _RAND_47[0:0];
  _RAND_48 = {1{`RANDOM}};
  count_80 = _RAND_48[0:0];
  _RAND_49 = {1{`RANDOM}};
  count_79 = _RAND_49[0:0];
  _RAND_50 = {1{`RANDOM}};
  count_78 = _RAND_50[0:0];
  _RAND_51 = {1{`RANDOM}};
  count_77 = _RAND_51[0:0];
  _RAND_52 = {1{`RANDOM}};
  count_76 = _RAND_52[0:0];
  _RAND_53 = {1{`RANDOM}};
  count_75 = _RAND_53[0:0];
  _RAND_54 = {1{`RANDOM}};
  count_74 = _RAND_54[0:0];
  _RAND_55 = {1{`RANDOM}};
  count_73 = _RAND_55[0:0];
  _RAND_56 = {1{`RANDOM}};
  count_72 = _RAND_56[0:0];
  _RAND_57 = {1{`RANDOM}};
  count_71 = _RAND_57[0:0];
  _RAND_58 = {1{`RANDOM}};
  count_70 = _RAND_58[0:0];
  _RAND_59 = {1{`RANDOM}};
  count_69 = _RAND_59[0:0];
  _RAND_60 = {1{`RANDOM}};
  count_68 = _RAND_60[0:0];
  _RAND_61 = {1{`RANDOM}};
  count_67 = _RAND_61[0:0];
  _RAND_62 = {1{`RANDOM}};
  count_66 = _RAND_62[0:0];
  _RAND_63 = {1{`RANDOM}};
  count_65 = _RAND_63[0:0];
  _RAND_64 = {1{`RANDOM}};
  count_64 = _RAND_64[0:0];
  _RAND_65 = {1{`RANDOM}};
  count_63 = _RAND_65[0:0];
  _RAND_66 = {1{`RANDOM}};
  count_62 = _RAND_66[0:0];
  _RAND_67 = {1{`RANDOM}};
  count_61 = _RAND_67[0:0];
  _RAND_68 = {1{`RANDOM}};
  count_60 = _RAND_68[0:0];
  _RAND_69 = {1{`RANDOM}};
  count_59 = _RAND_69[0:0];
  _RAND_70 = {1{`RANDOM}};
  count_58 = _RAND_70[0:0];
  _RAND_71 = {1{`RANDOM}};
  count_57 = _RAND_71[0:0];
  _RAND_72 = {1{`RANDOM}};
  count_56 = _RAND_72[0:0];
  _RAND_73 = {1{`RANDOM}};
  count_55 = _RAND_73[0:0];
  _RAND_74 = {1{`RANDOM}};
  count_54 = _RAND_74[0:0];
  _RAND_75 = {1{`RANDOM}};
  count_53 = _RAND_75[0:0];
  _RAND_76 = {1{`RANDOM}};
  count_52 = _RAND_76[0:0];
  _RAND_77 = {1{`RANDOM}};
  count_51 = _RAND_77[0:0];
  _RAND_78 = {1{`RANDOM}};
  count_50 = _RAND_78[0:0];
  _RAND_79 = {1{`RANDOM}};
  count_49 = _RAND_79[0:0];
  _RAND_80 = {1{`RANDOM}};
  count_48 = _RAND_80[0:0];
  _RAND_81 = {1{`RANDOM}};
  count_47 = _RAND_81[0:0];
  _RAND_82 = {1{`RANDOM}};
  count_46 = _RAND_82[0:0];
  _RAND_83 = {1{`RANDOM}};
  count_45 = _RAND_83[0:0];
  _RAND_84 = {1{`RANDOM}};
  count_44 = _RAND_84[0:0];
  _RAND_85 = {1{`RANDOM}};
  count_43 = _RAND_85[0:0];
  _RAND_86 = {1{`RANDOM}};
  count_42 = _RAND_86[0:0];
  _RAND_87 = {1{`RANDOM}};
  count_41 = _RAND_87[0:0];
  _RAND_88 = {1{`RANDOM}};
  count_40 = _RAND_88[0:0];
  _RAND_89 = {1{`RANDOM}};
  count_39 = _RAND_89[0:0];
  _RAND_90 = {1{`RANDOM}};
  count_38 = _RAND_90[0:0];
  _RAND_91 = {1{`RANDOM}};
  count_37 = _RAND_91[0:0];
  _RAND_92 = {1{`RANDOM}};
  count_36 = _RAND_92[0:0];
  _RAND_93 = {1{`RANDOM}};
  count_35 = _RAND_93[0:0];
  _RAND_94 = {1{`RANDOM}};
  count_34 = _RAND_94[0:0];
  _RAND_95 = {1{`RANDOM}};
  count_33 = _RAND_95[0:0];
  _RAND_96 = {1{`RANDOM}};
  count_32 = _RAND_96[0:0];
  _RAND_97 = {1{`RANDOM}};
  count_31 = _RAND_97[0:0];
  _RAND_98 = {1{`RANDOM}};
  count_30 = _RAND_98[0:0];
  _RAND_99 = {1{`RANDOM}};
  count_29 = _RAND_99[0:0];
  _RAND_100 = {1{`RANDOM}};
  count_28 = _RAND_100[0:0];
  _RAND_101 = {1{`RANDOM}};
  count_27 = _RAND_101[0:0];
  _RAND_102 = {1{`RANDOM}};
  count_26 = _RAND_102[0:0];
  _RAND_103 = {1{`RANDOM}};
  count_25 = _RAND_103[0:0];
  _RAND_104 = {1{`RANDOM}};
  count_24 = _RAND_104[0:0];
  _RAND_105 = {1{`RANDOM}};
  count_23 = _RAND_105[0:0];
  _RAND_106 = {1{`RANDOM}};
  count_22 = _RAND_106[0:0];
  _RAND_107 = {1{`RANDOM}};
  count_21 = _RAND_107[0:0];
  _RAND_108 = {1{`RANDOM}};
  count_20 = _RAND_108[0:0];
  _RAND_109 = {1{`RANDOM}};
  count_19 = _RAND_109[0:0];
  _RAND_110 = {1{`RANDOM}};
  count_18 = _RAND_110[0:0];
  _RAND_111 = {1{`RANDOM}};
  count_17 = _RAND_111[0:0];
  _RAND_112 = {1{`RANDOM}};
  count_16 = _RAND_112[0:0];
  _RAND_113 = {1{`RANDOM}};
  count_15 = _RAND_113[0:0];
  _RAND_114 = {1{`RANDOM}};
  count_14 = _RAND_114[0:0];
  _RAND_115 = {1{`RANDOM}};
  count_13 = _RAND_115[0:0];
  _RAND_116 = {1{`RANDOM}};
  count_12 = _RAND_116[0:0];
  _RAND_117 = {1{`RANDOM}};
  count_11 = _RAND_117[0:0];
  _RAND_118 = {1{`RANDOM}};
  count_10 = _RAND_118[0:0];
  _RAND_119 = {1{`RANDOM}};
  count_9 = _RAND_119[0:0];
  _RAND_120 = {1{`RANDOM}};
  count_8 = _RAND_120[0:0];
  _RAND_121 = {1{`RANDOM}};
  count_7 = _RAND_121[0:0];
  _RAND_122 = {1{`RANDOM}};
  count_6 = _RAND_122[0:0];
  _RAND_123 = {1{`RANDOM}};
  count_5 = _RAND_123[0:0];
  _RAND_124 = {1{`RANDOM}};
  count_4 = _RAND_124[0:0];
  _RAND_125 = {1{`RANDOM}};
  count_3 = _RAND_125[0:0];
  _RAND_126 = {1{`RANDOM}};
  count_2 = _RAND_126[0:0];
  _RAND_127 = {1{`RANDOM}};
  count_1 = _RAND_127[0:0];
  _RAND_128 = {1{`RANDOM}};
  counter = _RAND_128[2:0];
  _RAND_129 = {1{`RANDOM}};
  doneAW = _RAND_129[0:0];
  _RAND_130 = {1{`RANDOM}};
  r_holds_d = _RAND_130[0:0];
  _RAND_131 = {1{`RANDOM}};
  b_delay = _RAND_131[2:0];
  _RAND_132 = {1{`RANDOM}};
  r_first = _RAND_132[0:0];
  _RAND_133 = {1{`RANDOM}};
  r_denied_r = _RAND_133[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
