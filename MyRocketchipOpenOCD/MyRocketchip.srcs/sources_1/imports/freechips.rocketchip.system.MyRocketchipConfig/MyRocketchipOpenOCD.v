module MyRocketchipOpenOCD(
  input         clock,
  input         reset,
  input  [6:0]  io_interrupts,
  input         M_AXI_MEM_AWREADY,
  output        M_AXI_MEM_AWVALID,
  output [3:0]  M_AXI_MEM_AWID,
  output [31:0] M_AXI_MEM_AWADDR,
  output [7:0]  M_AXI_MEM_AWLEN,
  output [2:0]  M_AXI_MEM_AWSIZE,
  output [1:0]  M_AXI_MEM_AWBURST,
  output        M_AXI_MEM_AWLOCK,
  output [3:0]  M_AXI_MEM_AWCACHE,
  output [2:0]  M_AXI_MEM_AWPROT,
  output [3:0]  M_AXI_MEM_AWQOS,
  input         M_AXI_MEM_WREADY,
  output        M_AXI_MEM_WVALID,
  output [63:0] M_AXI_MEM_WDATA,
  output [7:0]  M_AXI_MEM_WSTRB,
  output        M_AXI_MEM_WLAST,
  output        M_AXI_MEM_BREADY,
  input         M_AXI_MEM_BVALID,
  input  [3:0]  M_AXI_MEM_BID,
  input  [1:0]  M_AXI_MEM_BRESP,
  input         M_AXI_MEM_ARREADY,
  output        M_AXI_MEM_ARVALID,
  output [3:0]  M_AXI_MEM_ARID,
  output [31:0] M_AXI_MEM_ARADDR,
  output [7:0]  M_AXI_MEM_ARLEN,
  output [2:0]  M_AXI_MEM_ARSIZE,
  output [1:0]  M_AXI_MEM_ARBURST,
  output        M_AXI_MEM_ARLOCK,
  output [3:0]  M_AXI_MEM_ARCACHE,
  output [2:0]  M_AXI_MEM_ARPROT,
  output [3:0]  M_AXI_MEM_ARQOS,
  output        M_AXI_MEM_RREADY,
  input         M_AXI_MEM_RVALID,
  input  [3:0]  M_AXI_MEM_RID,
  input  [63:0] M_AXI_MEM_RDATA,
  input  [1:0]  M_AXI_MEM_RRESP,
  input         M_AXI_MEM_RLAST,
  input         M_AXI_MMIO_AWREADY,
  output        M_AXI_MMIO_AWVALID,
  output [3:0]  M_AXI_MMIO_AWID,
  output [30:0] M_AXI_MMIO_AWADDR,
  output [7:0]  M_AXI_MMIO_AWLEN,
  output [2:0]  M_AXI_MMIO_AWSIZE,
  output [1:0]  M_AXI_MMIO_AWBURST,
  output        M_AXI_MMIO_AWLOCK,
  output [3:0]  M_AXI_MMIO_AWCACHE,
  output [2:0]  M_AXI_MMIO_AWPROT,
  output [3:0]  M_AXI_MMIO_AWQOS,
  input         M_AXI_MMIO_WREADY,
  output        M_AXI_MMIO_WVALID,
  output [63:0] M_AXI_MMIO_WDATA,
  output [7:0]  M_AXI_MMIO_WSTRB,
  output        M_AXI_MMIO_WLAST,
  output        M_AXI_MMIO_BREADY,
  input         M_AXI_MMIO_BVALID,
  input  [3:0]  M_AXI_MMIO_BID,
  input  [1:0]  M_AXI_MMIO_BRESP,
  input         M_AXI_MMIO_ARREADY,
  output        M_AXI_MMIO_ARVALID,
  output [3:0]  M_AXI_MMIO_ARID,
  output [30:0] M_AXI_MMIO_ARADDR,
  output [7:0]  M_AXI_MMIO_ARLEN,
  output [2:0]  M_AXI_MMIO_ARSIZE,
  output [1:0]  M_AXI_MMIO_ARBURST,
  output        M_AXI_MMIO_ARLOCK,
  output [3:0]  M_AXI_MMIO_ARCACHE,
  output [2:0]  M_AXI_MMIO_ARPROT,
  output [3:0]  M_AXI_MMIO_ARQOS,
  output        M_AXI_MMIO_RREADY,
  input         M_AXI_MMIO_RVALID,
  input  [3:0]  M_AXI_MMIO_RID,
  input  [63:0] M_AXI_MMIO_RDATA,
  input  [1:0]  M_AXI_MMIO_RRESP,
  input         M_AXI_MMIO_RLAST,
  output        M_AXI_FRONTBUS_AWREADY,
  input         M_AXI_FRONTBUS_AWVALID,
  input  [7:0]  M_AXI_FRONTBUS_AWID,
  input  [31:0] M_AXI_FRONTBUS_AWADDR,
  input  [7:0]  M_AXI_FRONTBUS_AWLEN,
  input  [2:0]  M_AXI_FRONTBUS_AWSIZE,
  input  [1:0]  M_AXI_FRONTBUS_AWBURST,
  input         M_AXI_FRONTBUS_AWLOCK,
  input  [3:0]  M_AXI_FRONTBUS_AWCACHE,
  input  [2:0]  M_AXI_FRONTBUS_AWPROT,
  input  [3:0]  M_AXI_FRONTBUS_AWQOS,
  output        M_AXI_FRONTBUS_WREADY,
  input         M_AXI_FRONTBUS_WVALID,
  input  [63:0] M_AXI_FRONTBUS_WDATA,
  input  [7:0]  M_AXI_FRONTBUS_WSTRB,
  input         M_AXI_FRONTBUS_WLAST,
  input         M_AXI_FRONTBUS_BREADY,
  output        M_AXI_FRONTBUS_BVALID,
  output [7:0]  M_AXI_FRONTBUS_BID,
  output [1:0]  M_AXI_FRONTBUS_BRESP,
  output        M_AXI_FRONTBUS_ARREADY,
  input         M_AXI_FRONTBUS_ARVALID,
  input  [7:0]  M_AXI_FRONTBUS_ARID,
  input  [31:0] M_AXI_FRONTBUS_ARADDR,
  input  [7:0]  M_AXI_FRONTBUS_ARLEN,
  input  [2:0]  M_AXI_FRONTBUS_ARSIZE,
  input  [1:0]  M_AXI_FRONTBUS_ARBURST,
  input         M_AXI_FRONTBUS_ARLOCK,
  input  [3:0]  M_AXI_FRONTBUS_ARCACHE,
  input  [2:0]  M_AXI_FRONTBUS_ARPROT,
  input  [3:0]  M_AXI_FRONTBUS_ARQOS,
  input         M_AXI_FRONTBUS_RREADY,
  output        M_AXI_FRONTBUS_RVALID,
  output [7:0]  M_AXI_FRONTBUS_RID,
  output [63:0] M_AXI_FRONTBUS_RDATA,
  output [1:0]  M_AXI_FRONTBUS_RRESP,
  output        M_AXI_FRONTBUS_RLAST
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  LazyRocketchipOri_clock; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_reset; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_aw_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_aw_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_aw_bits_id; // @[MyRocketchip.scala 60:28]
  wire [31:0] LazyRocketchipOri_mem_axi4_0_aw_bits_addr; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_mem_axi4_0_aw_bits_len; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mem_axi4_0_aw_bits_size; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mem_axi4_0_aw_bits_burst; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_aw_bits_lock; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_aw_bits_cache; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mem_axi4_0_aw_bits_prot; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_aw_bits_qos; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_w_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_w_valid; // @[MyRocketchip.scala 60:28]
  wire [63:0] LazyRocketchipOri_mem_axi4_0_w_bits_data; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_mem_axi4_0_w_bits_strb; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_w_bits_last; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_b_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_b_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_b_bits_id; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mem_axi4_0_b_bits_resp; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_ar_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_ar_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_ar_bits_id; // @[MyRocketchip.scala 60:28]
  wire [31:0] LazyRocketchipOri_mem_axi4_0_ar_bits_addr; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_mem_axi4_0_ar_bits_len; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mem_axi4_0_ar_bits_size; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mem_axi4_0_ar_bits_burst; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_ar_bits_lock; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_ar_bits_cache; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mem_axi4_0_ar_bits_prot; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_ar_bits_qos; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_r_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_r_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mem_axi4_0_r_bits_id; // @[MyRocketchip.scala 60:28]
  wire [63:0] LazyRocketchipOri_mem_axi4_0_r_bits_data; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mem_axi4_0_r_bits_resp; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mem_axi4_0_r_bits_last; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_aw_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_aw_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_id; // @[MyRocketchip.scala 60:28]
  wire [30:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_addr; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_len; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_size; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_burst; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_aw_bits_lock; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_cache; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_prot; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_aw_bits_qos; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_w_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_w_valid; // @[MyRocketchip.scala 60:28]
  wire [63:0] LazyRocketchipOri_mmio_axi4_0_w_bits_data; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_mmio_axi4_0_w_bits_strb; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_w_bits_last; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_b_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_b_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_b_bits_id; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mmio_axi4_0_b_bits_resp; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_ar_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_ar_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_id; // @[MyRocketchip.scala 60:28]
  wire [30:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_addr; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_len; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_size; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_burst; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_ar_bits_lock; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_cache; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_prot; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_ar_bits_qos; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_r_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_r_valid; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_mmio_axi4_0_r_bits_id; // @[MyRocketchip.scala 60:28]
  wire [63:0] LazyRocketchipOri_mmio_axi4_0_r_bits_data; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_mmio_axi4_0_r_bits_resp; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_mmio_axi4_0_r_bits_last; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_valid; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_id; // @[MyRocketchip.scala 60:28]
  wire [31:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_addr; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_len; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_size; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_burst; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_lock; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_cache; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_prot; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_qos; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_w_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_w_valid; // @[MyRocketchip.scala 60:28]
  wire [63:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_data; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_strb; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_last; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_b_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_b_valid; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_b_bits_id; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_b_bits_resp; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_valid; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_id; // @[MyRocketchip.scala 60:28]
  wire [31:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_addr; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_len; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_size; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_burst; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_lock; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_cache; // @[MyRocketchip.scala 60:28]
  wire [2:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_prot; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_qos; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_r_ready; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_r_valid; // @[MyRocketchip.scala 60:28]
  wire [7:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_id; // @[MyRocketchip.scala 60:28]
  wire [63:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_data; // @[MyRocketchip.scala 60:28]
  wire [1:0] LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_resp; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_last; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_resetctrl_hartIsInReset_0; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_clock; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_reset; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_systemjtag_jtag_TCK; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_systemjtag_jtag_TMS; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_systemjtag_jtag_TDI; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_systemjtag_jtag_TDO_data; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_systemjtag_jtag_TDO_driven; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_systemjtag_reset; // @[MyRocketchip.scala 60:28]
  wire [10:0] LazyRocketchipOri_debug_systemjtag_mfr_id; // @[MyRocketchip.scala 60:28]
  wire [15:0] LazyRocketchipOri_debug_systemjtag_part_number; // @[MyRocketchip.scala 60:28]
  wire [3:0] LazyRocketchipOri_debug_systemjtag_version; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_ndreset; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_dmactive; // @[MyRocketchip.scala 60:28]
  wire  LazyRocketchipOri_debug_dmactiveAck; // @[MyRocketchip.scala 60:28]
  wire [6:0] LazyRocketchipOri_interrupts; // @[MyRocketchip.scala 60:28]
  wire  inst_jtag_tunnel_jtag_tck; // @[Bscane2Jtag.scala 9:34]
  wire  inst_jtag_tunnel_jtag_tms; // @[Bscane2Jtag.scala 9:34]
  wire  inst_jtag_tunnel_jtag_tdi; // @[Bscane2Jtag.scala 9:34]
  wire  inst_jtag_tunnel_jtag_tdo; // @[Bscane2Jtag.scala 9:34]
  wire  inst_jtag_tunnel_jtag_tdo_en; // @[Bscane2Jtag.scala 9:34]
  wire  debug_reset_syncd_debug_reset_sync_clock; // @[ShiftReg.scala 45:23]
  wire  debug_reset_syncd_debug_reset_sync_reset; // @[ShiftReg.scala 45:23]
  wire  debug_reset_syncd_debug_reset_sync_io_d; // @[ShiftReg.scala 45:23]
  wire  debug_reset_syncd_debug_reset_sync_io_q; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_clock; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_reset; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_io_d; // @[ShiftReg.scala 45:23]
  wire  dmactiveAck_dmactiveAck_io_q; // @[ShiftReg.scala 45:23]
  wire  gated_clock_debug_clock_gate_in; // @[ClockGate.scala 36:20]
  wire  gated_clock_debug_clock_gate_test_en; // @[ClockGate.scala 36:20]
  wire  gated_clock_debug_clock_gate_en; // @[ClockGate.scala 36:20]
  wire  gated_clock_debug_clock_gate_out; // @[ClockGate.scala 36:20]
  wire  _debug_reset_syncd_WIRE = debug_reset_syncd_debug_reset_sync_io_q; // @[ShiftReg.scala 48:{24,24}]
  wire  _T = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 294:38]
  reg  clock_en; // @[Periphery.scala 296:29]
  ExampleRocketSystem LazyRocketchipOri ( // @[MyRocketchip.scala 60:28]
    .clock(LazyRocketchipOri_clock),
    .reset(LazyRocketchipOri_reset),
    .mem_axi4_0_aw_ready(LazyRocketchipOri_mem_axi4_0_aw_ready),
    .mem_axi4_0_aw_valid(LazyRocketchipOri_mem_axi4_0_aw_valid),
    .mem_axi4_0_aw_bits_id(LazyRocketchipOri_mem_axi4_0_aw_bits_id),
    .mem_axi4_0_aw_bits_addr(LazyRocketchipOri_mem_axi4_0_aw_bits_addr),
    .mem_axi4_0_aw_bits_len(LazyRocketchipOri_mem_axi4_0_aw_bits_len),
    .mem_axi4_0_aw_bits_size(LazyRocketchipOri_mem_axi4_0_aw_bits_size),
    .mem_axi4_0_aw_bits_burst(LazyRocketchipOri_mem_axi4_0_aw_bits_burst),
    .mem_axi4_0_aw_bits_lock(LazyRocketchipOri_mem_axi4_0_aw_bits_lock),
    .mem_axi4_0_aw_bits_cache(LazyRocketchipOri_mem_axi4_0_aw_bits_cache),
    .mem_axi4_0_aw_bits_prot(LazyRocketchipOri_mem_axi4_0_aw_bits_prot),
    .mem_axi4_0_aw_bits_qos(LazyRocketchipOri_mem_axi4_0_aw_bits_qos),
    .mem_axi4_0_w_ready(LazyRocketchipOri_mem_axi4_0_w_ready),
    .mem_axi4_0_w_valid(LazyRocketchipOri_mem_axi4_0_w_valid),
    .mem_axi4_0_w_bits_data(LazyRocketchipOri_mem_axi4_0_w_bits_data),
    .mem_axi4_0_w_bits_strb(LazyRocketchipOri_mem_axi4_0_w_bits_strb),
    .mem_axi4_0_w_bits_last(LazyRocketchipOri_mem_axi4_0_w_bits_last),
    .mem_axi4_0_b_ready(LazyRocketchipOri_mem_axi4_0_b_ready),
    .mem_axi4_0_b_valid(LazyRocketchipOri_mem_axi4_0_b_valid),
    .mem_axi4_0_b_bits_id(LazyRocketchipOri_mem_axi4_0_b_bits_id),
    .mem_axi4_0_b_bits_resp(LazyRocketchipOri_mem_axi4_0_b_bits_resp),
    .mem_axi4_0_ar_ready(LazyRocketchipOri_mem_axi4_0_ar_ready),
    .mem_axi4_0_ar_valid(LazyRocketchipOri_mem_axi4_0_ar_valid),
    .mem_axi4_0_ar_bits_id(LazyRocketchipOri_mem_axi4_0_ar_bits_id),
    .mem_axi4_0_ar_bits_addr(LazyRocketchipOri_mem_axi4_0_ar_bits_addr),
    .mem_axi4_0_ar_bits_len(LazyRocketchipOri_mem_axi4_0_ar_bits_len),
    .mem_axi4_0_ar_bits_size(LazyRocketchipOri_mem_axi4_0_ar_bits_size),
    .mem_axi4_0_ar_bits_burst(LazyRocketchipOri_mem_axi4_0_ar_bits_burst),
    .mem_axi4_0_ar_bits_lock(LazyRocketchipOri_mem_axi4_0_ar_bits_lock),
    .mem_axi4_0_ar_bits_cache(LazyRocketchipOri_mem_axi4_0_ar_bits_cache),
    .mem_axi4_0_ar_bits_prot(LazyRocketchipOri_mem_axi4_0_ar_bits_prot),
    .mem_axi4_0_ar_bits_qos(LazyRocketchipOri_mem_axi4_0_ar_bits_qos),
    .mem_axi4_0_r_ready(LazyRocketchipOri_mem_axi4_0_r_ready),
    .mem_axi4_0_r_valid(LazyRocketchipOri_mem_axi4_0_r_valid),
    .mem_axi4_0_r_bits_id(LazyRocketchipOri_mem_axi4_0_r_bits_id),
    .mem_axi4_0_r_bits_data(LazyRocketchipOri_mem_axi4_0_r_bits_data),
    .mem_axi4_0_r_bits_resp(LazyRocketchipOri_mem_axi4_0_r_bits_resp),
    .mem_axi4_0_r_bits_last(LazyRocketchipOri_mem_axi4_0_r_bits_last),
    .mmio_axi4_0_aw_ready(LazyRocketchipOri_mmio_axi4_0_aw_ready),
    .mmio_axi4_0_aw_valid(LazyRocketchipOri_mmio_axi4_0_aw_valid),
    .mmio_axi4_0_aw_bits_id(LazyRocketchipOri_mmio_axi4_0_aw_bits_id),
    .mmio_axi4_0_aw_bits_addr(LazyRocketchipOri_mmio_axi4_0_aw_bits_addr),
    .mmio_axi4_0_aw_bits_len(LazyRocketchipOri_mmio_axi4_0_aw_bits_len),
    .mmio_axi4_0_aw_bits_size(LazyRocketchipOri_mmio_axi4_0_aw_bits_size),
    .mmio_axi4_0_aw_bits_burst(LazyRocketchipOri_mmio_axi4_0_aw_bits_burst),
    .mmio_axi4_0_aw_bits_lock(LazyRocketchipOri_mmio_axi4_0_aw_bits_lock),
    .mmio_axi4_0_aw_bits_cache(LazyRocketchipOri_mmio_axi4_0_aw_bits_cache),
    .mmio_axi4_0_aw_bits_prot(LazyRocketchipOri_mmio_axi4_0_aw_bits_prot),
    .mmio_axi4_0_aw_bits_qos(LazyRocketchipOri_mmio_axi4_0_aw_bits_qos),
    .mmio_axi4_0_w_ready(LazyRocketchipOri_mmio_axi4_0_w_ready),
    .mmio_axi4_0_w_valid(LazyRocketchipOri_mmio_axi4_0_w_valid),
    .mmio_axi4_0_w_bits_data(LazyRocketchipOri_mmio_axi4_0_w_bits_data),
    .mmio_axi4_0_w_bits_strb(LazyRocketchipOri_mmio_axi4_0_w_bits_strb),
    .mmio_axi4_0_w_bits_last(LazyRocketchipOri_mmio_axi4_0_w_bits_last),
    .mmio_axi4_0_b_ready(LazyRocketchipOri_mmio_axi4_0_b_ready),
    .mmio_axi4_0_b_valid(LazyRocketchipOri_mmio_axi4_0_b_valid),
    .mmio_axi4_0_b_bits_id(LazyRocketchipOri_mmio_axi4_0_b_bits_id),
    .mmio_axi4_0_b_bits_resp(LazyRocketchipOri_mmio_axi4_0_b_bits_resp),
    .mmio_axi4_0_ar_ready(LazyRocketchipOri_mmio_axi4_0_ar_ready),
    .mmio_axi4_0_ar_valid(LazyRocketchipOri_mmio_axi4_0_ar_valid),
    .mmio_axi4_0_ar_bits_id(LazyRocketchipOri_mmio_axi4_0_ar_bits_id),
    .mmio_axi4_0_ar_bits_addr(LazyRocketchipOri_mmio_axi4_0_ar_bits_addr),
    .mmio_axi4_0_ar_bits_len(LazyRocketchipOri_mmio_axi4_0_ar_bits_len),
    .mmio_axi4_0_ar_bits_size(LazyRocketchipOri_mmio_axi4_0_ar_bits_size),
    .mmio_axi4_0_ar_bits_burst(LazyRocketchipOri_mmio_axi4_0_ar_bits_burst),
    .mmio_axi4_0_ar_bits_lock(LazyRocketchipOri_mmio_axi4_0_ar_bits_lock),
    .mmio_axi4_0_ar_bits_cache(LazyRocketchipOri_mmio_axi4_0_ar_bits_cache),
    .mmio_axi4_0_ar_bits_prot(LazyRocketchipOri_mmio_axi4_0_ar_bits_prot),
    .mmio_axi4_0_ar_bits_qos(LazyRocketchipOri_mmio_axi4_0_ar_bits_qos),
    .mmio_axi4_0_r_ready(LazyRocketchipOri_mmio_axi4_0_r_ready),
    .mmio_axi4_0_r_valid(LazyRocketchipOri_mmio_axi4_0_r_valid),
    .mmio_axi4_0_r_bits_id(LazyRocketchipOri_mmio_axi4_0_r_bits_id),
    .mmio_axi4_0_r_bits_data(LazyRocketchipOri_mmio_axi4_0_r_bits_data),
    .mmio_axi4_0_r_bits_resp(LazyRocketchipOri_mmio_axi4_0_r_bits_resp),
    .mmio_axi4_0_r_bits_last(LazyRocketchipOri_mmio_axi4_0_r_bits_last),
    .l2_frontend_bus_axi4_0_aw_ready(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_ready),
    .l2_frontend_bus_axi4_0_aw_valid(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_valid),
    .l2_frontend_bus_axi4_0_aw_bits_id(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_id),
    .l2_frontend_bus_axi4_0_aw_bits_addr(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_addr),
    .l2_frontend_bus_axi4_0_aw_bits_len(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_len),
    .l2_frontend_bus_axi4_0_aw_bits_size(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_size),
    .l2_frontend_bus_axi4_0_aw_bits_burst(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_burst),
    .l2_frontend_bus_axi4_0_aw_bits_lock(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_lock),
    .l2_frontend_bus_axi4_0_aw_bits_cache(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_cache),
    .l2_frontend_bus_axi4_0_aw_bits_prot(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_prot),
    .l2_frontend_bus_axi4_0_aw_bits_qos(LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_qos),
    .l2_frontend_bus_axi4_0_w_ready(LazyRocketchipOri_l2_frontend_bus_axi4_0_w_ready),
    .l2_frontend_bus_axi4_0_w_valid(LazyRocketchipOri_l2_frontend_bus_axi4_0_w_valid),
    .l2_frontend_bus_axi4_0_w_bits_data(LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_data),
    .l2_frontend_bus_axi4_0_w_bits_strb(LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_strb),
    .l2_frontend_bus_axi4_0_w_bits_last(LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_last),
    .l2_frontend_bus_axi4_0_b_ready(LazyRocketchipOri_l2_frontend_bus_axi4_0_b_ready),
    .l2_frontend_bus_axi4_0_b_valid(LazyRocketchipOri_l2_frontend_bus_axi4_0_b_valid),
    .l2_frontend_bus_axi4_0_b_bits_id(LazyRocketchipOri_l2_frontend_bus_axi4_0_b_bits_id),
    .l2_frontend_bus_axi4_0_b_bits_resp(LazyRocketchipOri_l2_frontend_bus_axi4_0_b_bits_resp),
    .l2_frontend_bus_axi4_0_ar_ready(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_ready),
    .l2_frontend_bus_axi4_0_ar_valid(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_valid),
    .l2_frontend_bus_axi4_0_ar_bits_id(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_id),
    .l2_frontend_bus_axi4_0_ar_bits_addr(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_addr),
    .l2_frontend_bus_axi4_0_ar_bits_len(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_len),
    .l2_frontend_bus_axi4_0_ar_bits_size(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_size),
    .l2_frontend_bus_axi4_0_ar_bits_burst(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_burst),
    .l2_frontend_bus_axi4_0_ar_bits_lock(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_lock),
    .l2_frontend_bus_axi4_0_ar_bits_cache(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_cache),
    .l2_frontend_bus_axi4_0_ar_bits_prot(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_prot),
    .l2_frontend_bus_axi4_0_ar_bits_qos(LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_qos),
    .l2_frontend_bus_axi4_0_r_ready(LazyRocketchipOri_l2_frontend_bus_axi4_0_r_ready),
    .l2_frontend_bus_axi4_0_r_valid(LazyRocketchipOri_l2_frontend_bus_axi4_0_r_valid),
    .l2_frontend_bus_axi4_0_r_bits_id(LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_id),
    .l2_frontend_bus_axi4_0_r_bits_data(LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_data),
    .l2_frontend_bus_axi4_0_r_bits_resp(LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_resp),
    .l2_frontend_bus_axi4_0_r_bits_last(LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_last),
    .resetctrl_hartIsInReset_0(LazyRocketchipOri_resetctrl_hartIsInReset_0),
    .debug_clock(LazyRocketchipOri_debug_clock),
    .debug_reset(LazyRocketchipOri_debug_reset),
    .debug_systemjtag_jtag_TCK(LazyRocketchipOri_debug_systemjtag_jtag_TCK),
    .debug_systemjtag_jtag_TMS(LazyRocketchipOri_debug_systemjtag_jtag_TMS),
    .debug_systemjtag_jtag_TDI(LazyRocketchipOri_debug_systemjtag_jtag_TDI),
    .debug_systemjtag_jtag_TDO_data(LazyRocketchipOri_debug_systemjtag_jtag_TDO_data),
    .debug_systemjtag_jtag_TDO_driven(LazyRocketchipOri_debug_systemjtag_jtag_TDO_driven),
    .debug_systemjtag_reset(LazyRocketchipOri_debug_systemjtag_reset),
    .debug_systemjtag_mfr_id(LazyRocketchipOri_debug_systemjtag_mfr_id),
    .debug_systemjtag_part_number(LazyRocketchipOri_debug_systemjtag_part_number),
    .debug_systemjtag_version(LazyRocketchipOri_debug_systemjtag_version),
    .debug_ndreset(LazyRocketchipOri_debug_ndreset),
    .debug_dmactive(LazyRocketchipOri_debug_dmactive),
    .debug_dmactiveAck(LazyRocketchipOri_debug_dmactiveAck),
    .interrupts(LazyRocketchipOri_interrupts)
  );
  JTAGTUNNEL inst_jtag_tunnel ( // @[Bscane2Jtag.scala 9:34]
    .jtag_tck(inst_jtag_tunnel_jtag_tck),
    .jtag_tms(inst_jtag_tunnel_jtag_tms),
    .jtag_tdi(inst_jtag_tunnel_jtag_tdi),
    .jtag_tdo(inst_jtag_tunnel_jtag_tdo),
    .jtag_tdo_en(inst_jtag_tunnel_jtag_tdo_en)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0_16 debug_reset_syncd_debug_reset_sync ( // @[ShiftReg.scala 45:23]
    .clock(debug_reset_syncd_debug_reset_sync_clock),
    .reset(debug_reset_syncd_debug_reset_sync_reset),
    .io_d(debug_reset_syncd_debug_reset_sync_io_d),
    .io_q(debug_reset_syncd_debug_reset_sync_io_q)
  );
  ResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAck ( // @[ShiftReg.scala 45:23]
    .clock(dmactiveAck_dmactiveAck_clock),
    .reset(dmactiveAck_dmactiveAck_reset),
    .io_d(dmactiveAck_dmactiveAck_io_d),
    .io_q(dmactiveAck_dmactiveAck_io_q)
  );
  EICG_wrapper gated_clock_debug_clock_gate ( // @[ClockGate.scala 36:20]
    .in(gated_clock_debug_clock_gate_in),
    .test_en(gated_clock_debug_clock_gate_test_en),
    .en(gated_clock_debug_clock_gate_en),
    .out(gated_clock_debug_clock_gate_out)
  );
  assign M_AXI_MEM_AWVALID = LazyRocketchipOri_mem_axi4_0_aw_valid; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWID = LazyRocketchipOri_mem_axi4_0_aw_bits_id; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWADDR = LazyRocketchipOri_mem_axi4_0_aw_bits_addr; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWLEN = LazyRocketchipOri_mem_axi4_0_aw_bits_len; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWSIZE = LazyRocketchipOri_mem_axi4_0_aw_bits_size; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWBURST = LazyRocketchipOri_mem_axi4_0_aw_bits_burst; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWLOCK = LazyRocketchipOri_mem_axi4_0_aw_bits_lock; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWCACHE = LazyRocketchipOri_mem_axi4_0_aw_bits_cache; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWPROT = LazyRocketchipOri_mem_axi4_0_aw_bits_prot; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_AWQOS = LazyRocketchipOri_mem_axi4_0_aw_bits_qos; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_WVALID = LazyRocketchipOri_mem_axi4_0_w_valid; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_WDATA = LazyRocketchipOri_mem_axi4_0_w_bits_data; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_WSTRB = LazyRocketchipOri_mem_axi4_0_w_bits_strb; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_WLAST = LazyRocketchipOri_mem_axi4_0_w_bits_last; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_BREADY = LazyRocketchipOri_mem_axi4_0_b_ready; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARVALID = LazyRocketchipOri_mem_axi4_0_ar_valid; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARID = LazyRocketchipOri_mem_axi4_0_ar_bits_id; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARADDR = LazyRocketchipOri_mem_axi4_0_ar_bits_addr; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARLEN = LazyRocketchipOri_mem_axi4_0_ar_bits_len; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARSIZE = LazyRocketchipOri_mem_axi4_0_ar_bits_size; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARBURST = LazyRocketchipOri_mem_axi4_0_ar_bits_burst; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARLOCK = LazyRocketchipOri_mem_axi4_0_ar_bits_lock; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARCACHE = LazyRocketchipOri_mem_axi4_0_ar_bits_cache; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARPROT = LazyRocketchipOri_mem_axi4_0_ar_bits_prot; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_ARQOS = LazyRocketchipOri_mem_axi4_0_ar_bits_qos; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MEM_RREADY = LazyRocketchipOri_mem_axi4_0_r_ready; // @[MyRocketchip.scala 94:15]
  assign M_AXI_MMIO_AWVALID = LazyRocketchipOri_mmio_axi4_0_aw_valid; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWID = LazyRocketchipOri_mmio_axi4_0_aw_bits_id; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWADDR = LazyRocketchipOri_mmio_axi4_0_aw_bits_addr; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWLEN = LazyRocketchipOri_mmio_axi4_0_aw_bits_len; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWSIZE = LazyRocketchipOri_mmio_axi4_0_aw_bits_size; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWBURST = LazyRocketchipOri_mmio_axi4_0_aw_bits_burst; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWLOCK = LazyRocketchipOri_mmio_axi4_0_aw_bits_lock; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWCACHE = LazyRocketchipOri_mmio_axi4_0_aw_bits_cache; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWPROT = LazyRocketchipOri_mmio_axi4_0_aw_bits_prot; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_AWQOS = LazyRocketchipOri_mmio_axi4_0_aw_bits_qos; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_WVALID = LazyRocketchipOri_mmio_axi4_0_w_valid; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_WDATA = LazyRocketchipOri_mmio_axi4_0_w_bits_data; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_WSTRB = LazyRocketchipOri_mmio_axi4_0_w_bits_strb; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_WLAST = LazyRocketchipOri_mmio_axi4_0_w_bits_last; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_BREADY = LazyRocketchipOri_mmio_axi4_0_b_ready; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARVALID = LazyRocketchipOri_mmio_axi4_0_ar_valid; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARID = LazyRocketchipOri_mmio_axi4_0_ar_bits_id; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARADDR = LazyRocketchipOri_mmio_axi4_0_ar_bits_addr; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARLEN = LazyRocketchipOri_mmio_axi4_0_ar_bits_len; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARSIZE = LazyRocketchipOri_mmio_axi4_0_ar_bits_size; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARBURST = LazyRocketchipOri_mmio_axi4_0_ar_bits_burst; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARLOCK = LazyRocketchipOri_mmio_axi4_0_ar_bits_lock; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARCACHE = LazyRocketchipOri_mmio_axi4_0_ar_bits_cache; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARPROT = LazyRocketchipOri_mmio_axi4_0_ar_bits_prot; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_ARQOS = LazyRocketchipOri_mmio_axi4_0_ar_bits_qos; // @[MyRocketchip.scala 95:16]
  assign M_AXI_MMIO_RREADY = LazyRocketchipOri_mmio_axi4_0_r_ready; // @[MyRocketchip.scala 95:16]
  assign M_AXI_FRONTBUS_AWREADY = LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_ready; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_WREADY = LazyRocketchipOri_l2_frontend_bus_axi4_0_w_ready; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_BVALID = LazyRocketchipOri_l2_frontend_bus_axi4_0_b_valid; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_BID = LazyRocketchipOri_l2_frontend_bus_axi4_0_b_bits_id; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_BRESP = LazyRocketchipOri_l2_frontend_bus_axi4_0_b_bits_resp; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_ARREADY = LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_ready; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_RVALID = LazyRocketchipOri_l2_frontend_bus_axi4_0_r_valid; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_RID = LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_id; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_RDATA = LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_data; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_RRESP = LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_resp; // @[MyRocketchip.scala 97:49]
  assign M_AXI_FRONTBUS_RLAST = LazyRocketchipOri_l2_frontend_bus_axi4_0_r_bits_last; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_clock = clock;
  assign LazyRocketchipOri_reset = reset | LazyRocketchipOri_debug_ndreset; // @[MyRocketchip.scala 84:33]
  assign LazyRocketchipOri_mem_axi4_0_aw_ready = M_AXI_MEM_AWREADY; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_w_ready = M_AXI_MEM_WREADY; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_b_valid = M_AXI_MEM_BVALID; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_b_bits_id = M_AXI_MEM_BID; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_b_bits_resp = M_AXI_MEM_BRESP; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_ar_ready = M_AXI_MEM_ARREADY; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_r_valid = M_AXI_MEM_RVALID; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_r_bits_id = M_AXI_MEM_RID; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_r_bits_data = M_AXI_MEM_RDATA; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_r_bits_resp = M_AXI_MEM_RRESP; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mem_axi4_0_r_bits_last = M_AXI_MEM_RLAST; // @[MyRocketchip.scala 94:15]
  assign LazyRocketchipOri_mmio_axi4_0_aw_ready = M_AXI_MMIO_AWREADY; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_w_ready = M_AXI_MMIO_WREADY; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_b_valid = M_AXI_MMIO_BVALID; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_b_bits_id = M_AXI_MMIO_BID; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_b_bits_resp = M_AXI_MMIO_BRESP; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_ar_ready = M_AXI_MMIO_ARREADY; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_r_valid = M_AXI_MMIO_RVALID; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_r_bits_id = M_AXI_MMIO_RID; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_r_bits_data = M_AXI_MMIO_RDATA; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_r_bits_resp = M_AXI_MMIO_RRESP; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_mmio_axi4_0_r_bits_last = M_AXI_MMIO_RLAST; // @[MyRocketchip.scala 95:16]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_valid = M_AXI_FRONTBUS_AWVALID; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_id = M_AXI_FRONTBUS_AWID; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_addr = M_AXI_FRONTBUS_AWADDR; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_len = M_AXI_FRONTBUS_AWLEN; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_size = M_AXI_FRONTBUS_AWSIZE; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_burst = M_AXI_FRONTBUS_AWBURST; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_lock = M_AXI_FRONTBUS_AWLOCK; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_cache = M_AXI_FRONTBUS_AWCACHE; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_prot = M_AXI_FRONTBUS_AWPROT; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_aw_bits_qos = M_AXI_FRONTBUS_AWQOS; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_w_valid = M_AXI_FRONTBUS_WVALID; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_data = M_AXI_FRONTBUS_WDATA; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_strb = M_AXI_FRONTBUS_WSTRB; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_w_bits_last = M_AXI_FRONTBUS_WLAST; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_b_ready = M_AXI_FRONTBUS_BREADY; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_valid = M_AXI_FRONTBUS_ARVALID; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_id = M_AXI_FRONTBUS_ARID; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_addr = M_AXI_FRONTBUS_ARADDR; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_len = M_AXI_FRONTBUS_ARLEN; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_size = M_AXI_FRONTBUS_ARSIZE; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_burst = M_AXI_FRONTBUS_ARBURST; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_lock = M_AXI_FRONTBUS_ARLOCK; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_cache = M_AXI_FRONTBUS_ARCACHE; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_prot = M_AXI_FRONTBUS_ARPROT; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_ar_bits_qos = M_AXI_FRONTBUS_ARQOS; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_l2_frontend_bus_axi4_0_r_ready = M_AXI_FRONTBUS_RREADY; // @[MyRocketchip.scala 97:49]
  assign LazyRocketchipOri_resetctrl_hartIsInReset_0 = reset | LazyRocketchipOri_debug_ndreset; // @[MyRocketchip.scala 84:33]
  assign LazyRocketchipOri_debug_clock = gated_clock_debug_clock_gate_out; // @[Periphery.scala 300:19]
  assign LazyRocketchipOri_debug_reset = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 288:40]
  assign LazyRocketchipOri_debug_systemjtag_jtag_TCK = inst_jtag_tunnel_jtag_tck; // @[Bscane2Jtag.scala 10:13]
  assign LazyRocketchipOri_debug_systemjtag_jtag_TMS = inst_jtag_tunnel_jtag_tms; // @[Bscane2Jtag.scala 11:13]
  assign LazyRocketchipOri_debug_systemjtag_jtag_TDI = inst_jtag_tunnel_jtag_tdi; // @[Bscane2Jtag.scala 12:13]
  assign LazyRocketchipOri_debug_systemjtag_reset = reset; // @[MyRocketchip.scala 80:29]
  assign LazyRocketchipOri_debug_systemjtag_mfr_id = 11'h489; // @[MyRocketchip.scala 75:21]
  assign LazyRocketchipOri_debug_systemjtag_part_number = 16'h0; // @[MyRocketchip.scala 76:26]
  assign LazyRocketchipOri_debug_systemjtag_version = 4'h0; // @[MyRocketchip.scala 77:22]
  assign LazyRocketchipOri_debug_dmactiveAck = dmactiveAck_dmactiveAck_io_q; // @[ShiftReg.scala 48:{24,24}]
  assign LazyRocketchipOri_interrupts = io_interrupts; // @[MyRocketchip.scala 96:28]
  assign inst_jtag_tunnel_jtag_tdo = LazyRocketchipOri_debug_systemjtag_jtag_TDO_data; // @[Bscane2Jtag.scala 13:31]
  assign inst_jtag_tunnel_jtag_tdo_en = LazyRocketchipOri_debug_systemjtag_jtag_TDO_driven; // @[Bscane2Jtag.scala 14:34]
  assign debug_reset_syncd_debug_reset_sync_clock = clock;
  assign debug_reset_syncd_debug_reset_sync_reset = LazyRocketchipOri_debug_systemjtag_reset; // @[Periphery.scala 279:38]
  assign debug_reset_syncd_debug_reset_sync_io_d = 1'h1; // @[ShiftReg.scala 47:16]
  assign dmactiveAck_dmactiveAck_clock = clock;
  assign dmactiveAck_dmactiveAck_reset = ~_debug_reset_syncd_WIRE; // @[Periphery.scala 294:38]
  assign dmactiveAck_dmactiveAck_io_d = LazyRocketchipOri_debug_dmactive; // @[ShiftReg.scala 47:16]
  assign gated_clock_debug_clock_gate_in = clock; // @[ClockGate.scala 40:14]
  assign gated_clock_debug_clock_gate_test_en = 1'h0; // @[ClockGate.scala 41:19]
  assign gated_clock_debug_clock_gate_en = clock_en; // @[ClockGate.scala 42:14]
  always @(posedge clock or posedge _T) begin
    if (_T) begin // @[ShiftReg.scala 48:{24,24}]
      clock_en <= 1'h1;
    end else begin
      clock_en <= dmactiveAck_dmactiveAck_io_q;
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
  clock_en = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T) begin
    clock_en = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
