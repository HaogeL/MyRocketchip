/* verilator lint_off UNOPTFLAT */

module EICG_wrapper(
  output out,
  input en,
  input test_en,
  input in
);
BUFGCE #(
  .CE_TYPE("SYNC"),               // ASYNC, HARDSYNC, SYNC
  .IS_CE_INVERTED(1'b0),          // Programmable inversion on CE
  .IS_I_INVERTED(1'b0),           // Programmable inversion on I
  .SIM_DEVICE("ULTRASCALE_PLUS")  // ULTRASCALE, ULTRASCALE_PLUS
)
BUFGCE_inst (
  .O(out),   // 1-bit output: Buffer
  .CE(en || test_en), // 1-bit input: Buffer enable
  .I(in)    // 1-bit input: Buffer
);


//  reg en_latched /*verilator clock_enable*/;

//  always @(*) begin
//     if (!in) begin
//        en_latched = en || test_en;
//     end
//  end

//  assign out = en_latched && in;

endmodule
