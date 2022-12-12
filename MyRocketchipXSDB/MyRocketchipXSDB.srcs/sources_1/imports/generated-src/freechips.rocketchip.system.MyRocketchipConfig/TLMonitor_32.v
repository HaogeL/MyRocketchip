module TLMonitor_32(
  input        clock,
  input        reset,
  input        io_in_a_ready,
  input        io_in_a_valid,
  input  [2:0] io_in_a_bits_opcode,
  input  [8:0] io_in_a_bits_address,
  input        io_in_d_ready,
  input        io_in_d_valid,
  input  [2:0] io_in_d_bits_opcode,
  input  [1:0] io_in_d_bits_param,
  input  [1:0] io_in_d_bits_size,
  input        io_in_d_bits_source,
  input        io_in_d_bits_sink,
  input        io_in_d_bits_denied,
  input        io_in_d_bits_corrupt
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
`endif // RANDOMIZE_REG_INIT
  wire [31:0] plusarg_reader_out; // @[PlusArg.scala 80:11]
  wire [31:0] plusarg_reader_1_out; // @[PlusArg.scala 80:11]
  wire  _T_2 = ~reset; // @[Monitor.scala 42:11]
  wire [8:0] _is_aligned_T = io_in_a_bits_address & 9'h3; // @[Edges.scala 20:16]
  wire  is_aligned = _is_aligned_T == 9'h0; // @[Edges.scala 20:24]
  wire [9:0] _T_7 = {1'b0,$signed(io_in_a_bits_address)}; // @[Parameters.scala 137:49]
  wire  _T_15 = io_in_a_bits_opcode == 3'h6; // @[Monitor.scala 81:25]
  wire [9:0] _T_23 = $signed(_T_7) & -10'sh40; // @[Parameters.scala 137:52]
  wire  _T_24 = $signed(_T_23) == 10'sh0; // @[Parameters.scala 137:67]
  wire [8:0] _T_25 = io_in_a_bits_address ^ 9'h44; // @[Parameters.scala 137:31]
  wire [9:0] _T_26 = {1'b0,$signed(_T_25)}; // @[Parameters.scala 137:49]
  wire [9:0] _T_28 = $signed(_T_26) & -10'shc; // @[Parameters.scala 137:52]
  wire  _T_29 = $signed(_T_28) == 10'sh0; // @[Parameters.scala 137:67]
  wire [8:0] _T_30 = io_in_a_bits_address ^ 9'h58; // @[Parameters.scala 137:31]
  wire [9:0] _T_31 = {1'b0,$signed(_T_30)}; // @[Parameters.scala 137:49]
  wire [9:0] _T_33 = $signed(_T_31) & -10'sh8; // @[Parameters.scala 137:52]
  wire  _T_34 = $signed(_T_33) == 10'sh0; // @[Parameters.scala 137:67]
  wire [8:0] _T_35 = io_in_a_bits_address ^ 9'h60; // @[Parameters.scala 137:31]
  wire [9:0] _T_36 = {1'b0,$signed(_T_35)}; // @[Parameters.scala 137:49]
  wire [9:0] _T_38 = $signed(_T_36) & -10'sh20; // @[Parameters.scala 137:52]
  wire  _T_39 = $signed(_T_38) == 10'sh0; // @[Parameters.scala 137:67]
  wire [8:0] _T_40 = io_in_a_bits_address ^ 9'h80; // @[Parameters.scala 137:31]
  wire [9:0] _T_41 = {1'b0,$signed(_T_40)}; // @[Parameters.scala 137:49]
  wire [9:0] _T_43 = $signed(_T_41) & -10'sh80; // @[Parameters.scala 137:52]
  wire  _T_44 = $signed(_T_43) == 10'sh0; // @[Parameters.scala 137:67]
  wire [8:0] _T_45 = io_in_a_bits_address ^ 9'h100; // @[Parameters.scala 137:31]
  wire [9:0] _T_46 = {1'b0,$signed(_T_45)}; // @[Parameters.scala 137:49]
  wire [9:0] _T_48 = $signed(_T_46) & -10'sh100; // @[Parameters.scala 137:52]
  wire  _T_49 = $signed(_T_48) == 10'sh0; // @[Parameters.scala 137:67]
  wire  _T_54 = _T_24 | _T_29 | _T_34 | _T_39 | _T_44 | _T_49; // @[Parameters.scala 671:42]
  wire  _T_129 = io_in_a_bits_opcode == 3'h7; // @[Monitor.scala 92:25]
  wire  _T_247 = io_in_a_bits_opcode == 3'h4; // @[Monitor.scala 104:25]
  wire  _T_317 = io_in_a_bits_opcode == 3'h0; // @[Monitor.scala 114:25]
  wire  _T_381 = io_in_a_bits_opcode == 3'h1; // @[Monitor.scala 122:25]
  wire  _T_446 = io_in_a_bits_opcode == 3'h2; // @[Monitor.scala 130:25]
  wire  _T_506 = io_in_a_bits_opcode == 3'h3; // @[Monitor.scala 138:25]
  wire  _T_566 = io_in_a_bits_opcode == 3'h5; // @[Monitor.scala 146:25]
  wire  _T_630 = io_in_d_bits_opcode <= 3'h6; // @[Bundles.scala 42:24]
  wire  _source_ok_T_1 = ~io_in_d_bits_source; // @[Parameters.scala 46:9]
  wire  _T_634 = io_in_d_bits_opcode == 3'h6; // @[Monitor.scala 310:25]
  wire  _T_638 = io_in_d_bits_size >= 2'h2; // @[Monitor.scala 312:27]
  wire  _T_642 = io_in_d_bits_param == 2'h0; // @[Monitor.scala 313:28]
  wire  _T_646 = ~io_in_d_bits_corrupt; // @[Monitor.scala 314:15]
  wire  _T_650 = ~io_in_d_bits_denied; // @[Monitor.scala 315:15]
  wire  _T_654 = io_in_d_bits_opcode == 3'h4; // @[Monitor.scala 318:25]
  wire  _T_665 = io_in_d_bits_param <= 2'h2; // @[Bundles.scala 102:26]
  wire  _T_669 = io_in_d_bits_param != 2'h2; // @[Monitor.scala 323:28]
  wire  _T_682 = io_in_d_bits_opcode == 3'h5; // @[Monitor.scala 328:25]
  wire  _T_702 = _T_650 | io_in_d_bits_corrupt; // @[Monitor.scala 334:30]
  wire  _T_711 = io_in_d_bits_opcode == 3'h0; // @[Monitor.scala 338:25]
  wire  _T_728 = io_in_d_bits_opcode == 3'h1; // @[Monitor.scala 346:25]
  wire  _T_746 = io_in_d_bits_opcode == 3'h2; // @[Monitor.scala 354:25]
  wire  a_first_done = io_in_a_ready & io_in_a_valid; // @[Decoupled.scala 50:35]
  reg  a_first_counter; // @[Edges.scala 228:27]
  wire  a_first_counter1 = a_first_counter - 1'h1; // @[Edges.scala 229:28]
  wire  a_first = ~a_first_counter; // @[Edges.scala 230:25]
  reg [2:0] opcode; // @[Monitor.scala 384:22]
  reg [8:0] address; // @[Monitor.scala 388:22]
  wire  _T_776 = io_in_a_valid & ~a_first; // @[Monitor.scala 389:19]
  wire  _T_777 = io_in_a_bits_opcode == opcode; // @[Monitor.scala 390:32]
  wire  _T_793 = io_in_a_bits_address == address; // @[Monitor.scala 394:32]
  wire  d_first_done = io_in_d_ready & io_in_d_valid; // @[Decoupled.scala 50:35]
  reg  d_first_counter; // @[Edges.scala 228:27]
  wire  d_first_counter1 = d_first_counter - 1'h1; // @[Edges.scala 229:28]
  wire  d_first = ~d_first_counter; // @[Edges.scala 230:25]
  reg [2:0] opcode_1; // @[Monitor.scala 535:22]
  reg [1:0] param_1; // @[Monitor.scala 536:22]
  reg [1:0] size_1; // @[Monitor.scala 537:22]
  reg  source_1; // @[Monitor.scala 538:22]
  reg  sink; // @[Monitor.scala 539:22]
  reg  denied; // @[Monitor.scala 540:22]
  wire  _T_800 = io_in_d_valid & ~d_first; // @[Monitor.scala 541:19]
  wire  _T_801 = io_in_d_bits_opcode == opcode_1; // @[Monitor.scala 542:29]
  wire  _T_805 = io_in_d_bits_param == param_1; // @[Monitor.scala 543:29]
  wire  _T_809 = io_in_d_bits_size == size_1; // @[Monitor.scala 544:29]
  wire  _T_813 = io_in_d_bits_source == source_1; // @[Monitor.scala 545:29]
  wire  _T_817 = io_in_d_bits_sink == sink; // @[Monitor.scala 546:29]
  wire  _T_821 = io_in_d_bits_denied == denied; // @[Monitor.scala 547:29]
  reg  inflight; // @[Monitor.scala 611:27]
  reg [3:0] inflight_opcodes; // @[Monitor.scala 613:35]
  reg [3:0] inflight_sizes; // @[Monitor.scala 615:33]
  reg  a_first_counter_1; // @[Edges.scala 228:27]
  wire  a_first_counter1_1 = a_first_counter_1 - 1'h1; // @[Edges.scala 229:28]
  wire  a_first_1 = ~a_first_counter_1; // @[Edges.scala 230:25]
  reg  d_first_counter_1; // @[Edges.scala 228:27]
  wire  d_first_counter1_1 = d_first_counter_1 - 1'h1; // @[Edges.scala 229:28]
  wire  d_first_1 = ~d_first_counter_1; // @[Edges.scala 230:25]
  wire [2:0] _GEN_71 = {io_in_d_bits_source, 2'h0}; // @[Monitor.scala 634:69]
  wire [3:0] _a_opcode_lookup_T = {{1'd0}, _GEN_71}; // @[Monitor.scala 634:69]
  wire [3:0] _a_opcode_lookup_T_1 = inflight_opcodes >> _a_opcode_lookup_T; // @[Monitor.scala 634:44]
  wire [15:0] _a_opcode_lookup_T_5 = 16'h10 - 16'h1; // @[Monitor.scala 609:57]
  wire [15:0] _GEN_72 = {{12'd0}, _a_opcode_lookup_T_1}; // @[Monitor.scala 634:97]
  wire [15:0] _a_opcode_lookup_T_6 = _GEN_72 & _a_opcode_lookup_T_5; // @[Monitor.scala 634:97]
  wire [15:0] _a_opcode_lookup_T_7 = {{1'd0}, _a_opcode_lookup_T_6[15:1]}; // @[Monitor.scala 634:152]
  wire [3:0] _a_size_lookup_T_1 = inflight_sizes >> _a_opcode_lookup_T; // @[Monitor.scala 638:40]
  wire [15:0] _GEN_75 = {{12'd0}, _a_size_lookup_T_1}; // @[Monitor.scala 638:91]
  wire [15:0] _a_size_lookup_T_6 = _GEN_75 & _a_opcode_lookup_T_5; // @[Monitor.scala 638:91]
  wire [15:0] _a_size_lookup_T_7 = {{1'd0}, _a_size_lookup_T_6[15:1]}; // @[Monitor.scala 638:144]
  wire  _T_827 = io_in_a_valid & a_first_1; // @[Monitor.scala 648:26]
  wire [1:0] _GEN_15 = io_in_a_valid & a_first_1 ? 2'h1 : 2'h0; // @[Monitor.scala 648:71 649:22]
  wire  _T_830 = a_first_done & a_first_1; // @[Monitor.scala 652:27]
  wire [3:0] _a_opcodes_set_interm_T = {io_in_a_bits_opcode, 1'h0}; // @[Monitor.scala 654:53]
  wire [3:0] _a_opcodes_set_interm_T_1 = _a_opcodes_set_interm_T | 4'h1; // @[Monitor.scala 654:61]
  wire [3:0] a_opcodes_set_interm = a_first_done & a_first_1 ? _a_opcodes_set_interm_T_1 : 4'h0; // @[Monitor.scala 652:72 654:28]
  wire [18:0] _a_opcodes_set_T_1 = {{15'd0}, a_opcodes_set_interm}; // @[Monitor.scala 656:54]
  wire [2:0] a_sizes_set_interm = a_first_done & a_first_1 ? 3'h5 : 3'h0; // @[Monitor.scala 652:72 655:28]
  wire [17:0] _a_sizes_set_T_1 = {{15'd0}, a_sizes_set_interm}; // @[Monitor.scala 657:52]
  wire  _T_834 = ~inflight; // @[Monitor.scala 658:17]
  wire [1:0] _GEN_16 = a_first_done & a_first_1 ? 2'h1 : 2'h0; // @[Monitor.scala 652:72 653:28]
  wire [18:0] _GEN_19 = a_first_done & a_first_1 ? _a_opcodes_set_T_1 : 19'h0; // @[Monitor.scala 652:72 656:28]
  wire [17:0] _GEN_20 = a_first_done & a_first_1 ? _a_sizes_set_T_1 : 18'h0; // @[Monitor.scala 652:72 657:28]
  wire  _T_838 = io_in_d_valid & d_first_1; // @[Monitor.scala 671:26]
  wire  _T_840 = ~_T_634; // @[Monitor.scala 671:74]
  wire  _T_841 = io_in_d_valid & d_first_1 & ~_T_634; // @[Monitor.scala 671:71]
  wire [1:0] _d_clr_wo_ready_T = 2'h1 << io_in_d_bits_source; // @[OneHot.scala 57:35]
  wire [1:0] _GEN_21 = io_in_d_valid & d_first_1 & ~_T_634 ? _d_clr_wo_ready_T : 2'h0; // @[Monitor.scala 671:90 672:22]
  wire [30:0] _GEN_0 = {{15'd0}, _a_opcode_lookup_T_5}; // @[Monitor.scala 677:76]
  wire [30:0] _d_opcodes_clr_T_5 = _GEN_0 << _a_opcode_lookup_T; // @[Monitor.scala 677:76]
  wire [1:0] _GEN_22 = d_first_done & d_first_1 & _T_840 ? _d_clr_wo_ready_T : 2'h0; // @[Monitor.scala 675:91 676:21]
  wire [30:0] _GEN_23 = d_first_done & d_first_1 & _T_840 ? _d_opcodes_clr_T_5 : 31'h0; // @[Monitor.scala 675:91 677:21]
  wire  same_cycle_resp = _T_827 & _source_ok_T_1; // @[Monitor.scala 681:88]
  wire  _T_853 = inflight >> io_in_d_bits_source | same_cycle_resp; // @[Monitor.scala 682:49]
  wire [2:0] _GEN_27 = 3'h2 == io_in_a_bits_opcode ? 3'h1 : 3'h0; // @[Monitor.scala 685:{38,38}]
  wire [2:0] _GEN_28 = 3'h3 == io_in_a_bits_opcode ? 3'h1 : _GEN_27; // @[Monitor.scala 685:{38,38}]
  wire [2:0] _GEN_29 = 3'h4 == io_in_a_bits_opcode ? 3'h1 : _GEN_28; // @[Monitor.scala 685:{38,38}]
  wire [2:0] _GEN_30 = 3'h5 == io_in_a_bits_opcode ? 3'h2 : _GEN_29; // @[Monitor.scala 685:{38,38}]
  wire [2:0] _GEN_31 = 3'h6 == io_in_a_bits_opcode ? 3'h4 : _GEN_30; // @[Monitor.scala 685:{38,38}]
  wire [2:0] _GEN_32 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_31; // @[Monitor.scala 685:{38,38}]
  wire [2:0] _GEN_39 = 3'h6 == io_in_a_bits_opcode ? 3'h5 : _GEN_30; // @[Monitor.scala 686:{39,39}]
  wire [2:0] _GEN_40 = 3'h7 == io_in_a_bits_opcode ? 3'h4 : _GEN_39; // @[Monitor.scala 686:{39,39}]
  wire  _T_858 = io_in_d_bits_opcode == _GEN_40; // @[Monitor.scala 686:39]
  wire  _T_859 = io_in_d_bits_opcode == _GEN_32 | _T_858; // @[Monitor.scala 685:77]
  wire  _T_863 = 2'h2 == io_in_d_bits_size; // @[Monitor.scala 687:36]
  wire [3:0] a_opcode_lookup = _a_opcode_lookup_T_7[3:0];
  wire [2:0] _GEN_43 = 3'h2 == a_opcode_lookup[2:0] ? 3'h1 : 3'h0; // @[Monitor.scala 689:{38,38}]
  wire [2:0] _GEN_44 = 3'h3 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_43; // @[Monitor.scala 689:{38,38}]
  wire [2:0] _GEN_45 = 3'h4 == a_opcode_lookup[2:0] ? 3'h1 : _GEN_44; // @[Monitor.scala 689:{38,38}]
  wire [2:0] _GEN_46 = 3'h5 == a_opcode_lookup[2:0] ? 3'h2 : _GEN_45; // @[Monitor.scala 689:{38,38}]
  wire [2:0] _GEN_47 = 3'h6 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_46; // @[Monitor.scala 689:{38,38}]
  wire [2:0] _GEN_48 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_47; // @[Monitor.scala 689:{38,38}]
  wire [2:0] _GEN_55 = 3'h6 == a_opcode_lookup[2:0] ? 3'h5 : _GEN_46; // @[Monitor.scala 690:{38,38}]
  wire [2:0] _GEN_56 = 3'h7 == a_opcode_lookup[2:0] ? 3'h4 : _GEN_55; // @[Monitor.scala 690:{38,38}]
  wire  _T_870 = io_in_d_bits_opcode == _GEN_56; // @[Monitor.scala 690:38]
  wire  _T_871 = io_in_d_bits_opcode == _GEN_48 | _T_870; // @[Monitor.scala 689:72]
  wire [3:0] a_size_lookup = _a_size_lookup_T_7[3:0];
  wire [3:0] _GEN_79 = {{2'd0}, io_in_d_bits_size}; // @[Monitor.scala 691:36]
  wire  _T_875 = _GEN_79 == a_size_lookup; // @[Monitor.scala 691:36]
  wire  _T_885 = _T_838 & a_first_1 & io_in_a_valid & _source_ok_T_1 & _T_840; // @[Monitor.scala 694:116]
  wire  _T_887 = ~io_in_d_ready | io_in_a_ready; // @[Monitor.scala 695:32]
  wire  a_set_wo_ready = _GEN_15[0];
  wire  d_clr_wo_ready = _GEN_21[0];
  wire  _T_894 = a_set_wo_ready != d_clr_wo_ready | ~(|a_set_wo_ready); // @[Monitor.scala 699:48]
  wire  a_set = _GEN_16[0];
  wire  d_clr = _GEN_22[0];
  wire [3:0] a_opcodes_set = _GEN_19[3:0];
  wire [3:0] _inflight_opcodes_T = inflight_opcodes | a_opcodes_set; // @[Monitor.scala 703:43]
  wire [3:0] d_opcodes_clr = _GEN_23[3:0];
  wire [3:0] _inflight_opcodes_T_1 = ~d_opcodes_clr; // @[Monitor.scala 703:62]
  wire [3:0] a_sizes_set = _GEN_20[3:0];
  wire [3:0] _inflight_sizes_T = inflight_sizes | a_sizes_set; // @[Monitor.scala 704:39]
  reg [31:0] watchdog; // @[Monitor.scala 706:27]
  wire  _T_903 = ~(|inflight) | plusarg_reader_out == 32'h0 | watchdog < plusarg_reader_out; // @[Monitor.scala 709:47]
  wire [31:0] _watchdog_T_1 = watchdog + 32'h1; // @[Monitor.scala 711:26]
  reg [3:0] inflight_sizes_1; // @[Monitor.scala 725:35]
  reg  d_first_counter_2; // @[Edges.scala 228:27]
  wire  d_first_counter1_2 = d_first_counter_2 - 1'h1; // @[Edges.scala 229:28]
  wire  d_first_2 = ~d_first_counter_2; // @[Edges.scala 230:25]
  wire [3:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _a_opcode_lookup_T; // @[Monitor.scala 747:42]
  wire [15:0] _GEN_84 = {{12'd0}, _c_size_lookup_T_1}; // @[Monitor.scala 747:93]
  wire [15:0] _c_size_lookup_T_6 = _GEN_84 & _a_opcode_lookup_T_5; // @[Monitor.scala 747:93]
  wire [15:0] _c_size_lookup_T_7 = {{1'd0}, _c_size_lookup_T_6[15:1]}; // @[Monitor.scala 747:146]
  wire  _T_929 = io_in_d_valid & d_first_2 & _T_634; // @[Monitor.scala 779:71]
  wire [30:0] _GEN_68 = d_first_done & d_first_2 & _T_634 ? _d_opcodes_clr_T_5 : 31'h0; // @[Monitor.scala 783:90 785:21]
  wire  _T_937 = 1'h0 >> io_in_d_bits_source; // @[Monitor.scala 791:25]
  wire [3:0] c_size_lookup = _c_size_lookup_T_7[3:0];
  wire  _T_947 = _GEN_79 == c_size_lookup; // @[Monitor.scala 795:36]
  wire [3:0] d_opcodes_clr_1 = _GEN_68[3:0];
  wire [3:0] _inflight_opcodes_T_4 = ~d_opcodes_clr_1; // @[Monitor.scala 810:62]
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0), .WIDTH(32)) plusarg_reader ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_out)
  );
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0), .WIDTH(32)) plusarg_reader_1 ( // @[PlusArg.scala 80:11]
    .out(plusarg_reader_1_out)
  );
  always @(posedge clock) begin
    if (a_first_done & a_first) begin // @[Monitor.scala 396:32]
      opcode <= io_in_a_bits_opcode; // @[Monitor.scala 397:15]
    end
    if (a_first_done & a_first) begin // @[Monitor.scala 396:32]
      address <= io_in_a_bits_address; // @[Monitor.scala 401:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      opcode_1 <= io_in_d_bits_opcode; // @[Monitor.scala 550:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      param_1 <= io_in_d_bits_param; // @[Monitor.scala 551:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      size_1 <= io_in_d_bits_size; // @[Monitor.scala 552:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      source_1 <= io_in_d_bits_source; // @[Monitor.scala 553:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      sink <= io_in_d_bits_sink; // @[Monitor.scala 554:15]
    end
    if (d_first_done & d_first) begin // @[Monitor.scala 549:32]
      denied <= io_in_d_bits_denied; // @[Monitor.scala 555:15]
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_15 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_15 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_15 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_15 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_15 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_15 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_129 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_129 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_129 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_129 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_129 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_129 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_129 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_129 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_54 & (io_in_a_valid & _T_247 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_247 & ~reset & ~_T_54) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_247 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_247 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Get address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_54 & (io_in_a_valid & _T_317 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~reset & ~_T_54) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_317 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_317 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutFull address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_381 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_381 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_381 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_381 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel PutPartial address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_446 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_446 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_446 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_446 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_506 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_506 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_506 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_506 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Logical address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_a_valid & _T_566 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_566 & ~reset) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~is_aligned & (io_in_a_valid & _T_566 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_a_valid & _T_566 & ~reset & ~is_aligned) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel Hint address not aligned to size (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_630 & (io_in_d_valid & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_2 & ~_T_630) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel has invalid opcode (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_source_ok_T_1 & (io_in_d_valid & _T_634 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_634 & _T_2 & ~_source_ok_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_638 & (io_in_d_valid & _T_634 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_634 & _T_2 & ~_T_638) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_642 & (io_in_d_valid & _T_634 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_634 & _T_2 & ~_T_642) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_646 & (io_in_d_valid & _T_634 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_634 & _T_2 & ~_T_646) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is corrupt (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_650 & (io_in_d_valid & _T_634 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_634 & _T_2 & ~_T_650) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel ReleaseAck is denied (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_source_ok_T_1 & (io_in_d_valid & _T_654 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2 & ~_source_ok_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid source ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid sink ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_638 & (io_in_d_valid & _T_654 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2 & ~_T_638) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant smaller than a beat (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_665 & (io_in_d_valid & _T_654 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2 & ~_T_665) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries invalid cap param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_669 & (io_in_d_valid & _T_654 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2 & ~_T_669) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant carries toN param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_646 & (io_in_d_valid & _T_654 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2 & ~_T_646) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant is corrupt (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_650 & (io_in_d_valid & _T_654 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_654 & _T_2 & ~_T_650) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel Grant is denied (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_source_ok_T_1 & (io_in_d_valid & _T_682 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2 & ~_source_ok_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid source ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_638 & (io_in_d_valid & _T_682 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2 & ~_T_638) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData smaller than a beat (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_665 & (io_in_d_valid & _T_682 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2 & ~_T_665) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries invalid cap param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_669 & (io_in_d_valid & _T_682 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2 & ~_T_669) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData carries toN param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_702 & (io_in_d_valid & _T_682 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2 & ~_T_702) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_650 & (io_in_d_valid & _T_682 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_682 & _T_2 & ~_T_650) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel GrantData is denied (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_source_ok_T_1 & (io_in_d_valid & _T_711 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_711 & _T_2 & ~_source_ok_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_642 & (io_in_d_valid & _T_711 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_711 & _T_2 & ~_T_642) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck carries invalid param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_646 & (io_in_d_valid & _T_711 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_711 & _T_2 & ~_T_646) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck is corrupt (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_650 & (io_in_d_valid & _T_711 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_711 & _T_2 & ~_T_650) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAck is denied (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_source_ok_T_1 & (io_in_d_valid & _T_728 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_728 & _T_2 & ~_source_ok_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_642 & (io_in_d_valid & _T_728 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_728 & _T_2 & ~_T_642) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData carries invalid param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_702 & (io_in_d_valid & _T_728 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_728 & _T_2 & ~_T_702) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_650 & (io_in_d_valid & _T_728 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_728 & _T_2 & ~_T_650) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel AccessAckData is denied (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_source_ok_T_1 & (io_in_d_valid & _T_746 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_746 & _T_2 & ~_source_ok_T_1) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid source ID (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_642 & (io_in_d_valid & _T_746 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_746 & _T_2 & ~_T_642) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck carries invalid param (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_646 & (io_in_d_valid & _T_746 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_746 & _T_2 & ~_T_646) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck is corrupt (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_650 & (io_in_d_valid & _T_746 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_746 & _T_2 & ~_T_650) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel HintAck is denied (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_777 & (_T_776 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_776 & ~reset & ~_T_777) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel opcode changed within multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_793 & (_T_776 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_776 & ~reset & ~_T_793) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel address changed with multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_801 & (_T_800 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_800 & _T_2 & ~_T_801) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel opcode changed within multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_805 & (_T_800 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_800 & _T_2 & ~_T_805) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel param changed within multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_809 & (_T_800 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_800 & _T_2 & ~_T_809) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel size changed within multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_813 & (_T_800 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_800 & _T_2 & ~_T_813) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel source changed within multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_817 & (_T_800 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_800 & _T_2 & ~_T_817) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel sink changed with multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_821 & (_T_800 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_800 & _T_2 & ~_T_821) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel denied changed with multibeat operation (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_834 & (_T_830 & ~reset)) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_830 & ~reset & ~_T_834) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' channel re-used a source ID (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_853 & (_T_841 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_841 & _T_2 & ~_T_853) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_859 & (_T_841 & same_cycle_resp & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_841 & same_cycle_resp & _T_2 & ~_T_859) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_863 & (_T_841 & same_cycle_resp & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_841 & same_cycle_resp & _T_2 & ~_T_863) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_871 & (_T_841 & ~same_cycle_resp & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_841 & ~same_cycle_resp & _T_2 & ~_T_871) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper opcode response (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_875 & (_T_841 & ~same_cycle_resp & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_841 & ~same_cycle_resp & _T_2 & ~_T_875) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_887 & (_T_885 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_885 & _T_2 & ~_T_887) begin
          $fwrite(32'h80000002,"Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n"); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_894 & _T_2) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2 & ~_T_894) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_903 & ~reset) begin
          $fatal; // @[Monitor.scala 42:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~_T_903) begin
          $fwrite(32'h80000002,
            "Assertion failed: TileLink timeout expired (connected at Debug.scala:652:46)\n    at Monitor.scala:42 assert(cond, message)\n"
            ); // @[Monitor.scala 42:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_937 & (_T_929 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_929 & _T_2 & ~_T_937) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel acknowledged for nothing inflight (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~_T_947 & (_T_929 & _T_2)) begin
          $fatal; // @[Monitor.scala 49:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_929 & _T_2 & ~_T_947) begin
          $fwrite(32'h80000002,
            "Assertion failed: 'D' channel contains improper response size (connected at Debug.scala:652:46)\n    at Monitor.scala:49 assert(cond, message)\n"
            ); // @[Monitor.scala 49:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 234:17]
      a_first_counter <= 1'h0; // @[Edges.scala 235:21]
    end else if (a_first_done) begin // @[Edges.scala 228:27]
      if (a_first) begin
        a_first_counter <= 1'h0;
      end else begin
        a_first_counter <= a_first_counter1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 234:17]
      d_first_counter <= 1'h0; // @[Edges.scala 235:21]
    end else if (d_first_done) begin // @[Edges.scala 228:27]
      if (d_first) begin
        d_first_counter <= 1'h0;
      end else begin
        d_first_counter <= d_first_counter1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Monitor.scala 702:36]
      inflight <= 1'h0;
    end else begin
      inflight <= (inflight | a_set) & ~d_clr;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Monitor.scala 703:60]
      inflight_opcodes <= 4'h0;
    end else begin
      inflight_opcodes <= _inflight_opcodes_T & _inflight_opcodes_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Monitor.scala 704:54]
      inflight_sizes <= 4'h0;
    end else begin
      inflight_sizes <= _inflight_sizes_T & _inflight_opcodes_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 234:17]
      a_first_counter_1 <= 1'h0; // @[Edges.scala 235:21]
    end else if (a_first_done) begin // @[Edges.scala 228:27]
      if (a_first_1) begin
        a_first_counter_1 <= 1'h0;
      end else begin
        a_first_counter_1 <= a_first_counter1_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 234:17]
      d_first_counter_1 <= 1'h0; // @[Edges.scala 235:21]
    end else if (d_first_done) begin // @[Edges.scala 228:27]
      if (d_first_1) begin
        d_first_counter_1 <= 1'h0;
      end else begin
        d_first_counter_1 <= d_first_counter1_1;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Monitor.scala 712:47]
      watchdog <= 32'h0; // @[Monitor.scala 712:58]
    end else if (a_first_done | d_first_done) begin // @[Monitor.scala 711:14]
      watchdog <= 32'h0;
    end else begin
      watchdog <= _watchdog_T_1;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Monitor.scala 811:56]
      inflight_sizes_1 <= 4'h0;
    end else begin
      inflight_sizes_1 <= inflight_sizes_1 & _inflight_opcodes_T_4;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin // @[Edges.scala 234:17]
      d_first_counter_2 <= 1'h0; // @[Edges.scala 235:21]
    end else if (d_first_done) begin // @[Edges.scala 228:27]
      if (d_first_2) begin
        d_first_counter_2 <= 1'h0;
      end else begin
        d_first_counter_2 <= d_first_counter1_2;
      end
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
  a_first_counter = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  opcode = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  address = _RAND_2[8:0];
  _RAND_3 = {1{`RANDOM}};
  d_first_counter = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  opcode_1 = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  param_1 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  size_1 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  source_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  sink = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  denied = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  inflight = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  inflight_opcodes = _RAND_11[3:0];
  _RAND_12 = {1{`RANDOM}};
  inflight_sizes = _RAND_12[3:0];
  _RAND_13 = {1{`RANDOM}};
  a_first_counter_1 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  d_first_counter_1 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  watchdog = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  inflight_sizes_1 = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  d_first_counter_2 = _RAND_17[0:0];
`endif // RANDOMIZE_REG_INIT
  if (reset) begin
    a_first_counter = 1'h0;
  end
  if (reset) begin
    d_first_counter = 1'h0;
  end
  if (reset) begin
    inflight = 1'h0;
  end
  if (reset) begin
    inflight_opcodes = 4'h0;
  end
  if (reset) begin
    inflight_sizes = 4'h0;
  end
  if (reset) begin
    a_first_counter_1 = 1'h0;
  end
  if (reset) begin
    d_first_counter_1 = 1'h0;
  end
  if (reset) begin
    watchdog = 32'h0;
  end
  if (reset) begin
    inflight_sizes_1 = 4'h0;
  end
  if (reset) begin
    d_first_counter_2 = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
