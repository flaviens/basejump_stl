
// bsg_rp_clk_gen_fine_delay_tuner
// fine-tuned sub-gate granularity of delay tuning
//
// o is delayed signal, non-inverted
//

module bsg_rp_dly_line_fine_delay_tuner
  (input i
   , input we_i
   , input async_reset_neg_i
   , input [1:0] sel_i
   , output o
   , output buf_o
   );

   wire [1:0] sel_r;

   // if wen, capture the select line shortly after a transition
   // from 1 to 0 of the input i

   // synopsys rp_group (bsg_clk_gen_fdt)
   // synopsys rp_fill (0 0 UX)

   wire [3:0] ft;
   wire       i_inv;

   // synopsys rp_fill (0 0 UX)

   // synopsys rp_orient ({N FS} I2_1)
   CKND3BWP I2_1 (.I(ft[1]),.ZN());
   // synopsys rp_orient ({N FS} I3_1)
   CKND3BWP I3_1 (.I(ft[2]),.ZN());
   // synopsys rp_orient ({N FS} I3_2)
   CKND4BWP I3_2 (.I(ft[2]),.ZN());
   // synopsys rp_orient ({N FS} I4_1)
   CKND3BWP I4_1 (.I(ft[3]),.ZN());
   // synopsys rp_orient ({N FS} I4_2)
   CKND4BWP I4_2 (.I(ft[3]),.ZN());
   // synopsys rp_orient ({N FS} I4_3)
   CKND4BWP I4_3 (.I(ft[3]),.ZN());

   // same driver with different caps and thus different transition times
   // synopsys rp_fill (1 0 UX)
   CKND4BWP I0 (.I(i), .ZN(i_inv));     // decouple load of FDT from previous stage; also makes this inverting
   CKND2BWP I1 (.I(i_inv), .ZN(ft[0]));
   CKND2BWP I2 (.I(i_inv), .ZN(ft[1]));
   CKND2BWP I3 (.I(i_inv), .ZN(ft[2]));
   CKND2BWP I4 (.I(i_inv), .ZN(ft[3]));

   // flops catch on positive edge of inverted clock

   // synopsys rp_fill (2 0 UX)
   DFCND4BWP DFFR1 (.D(sel_i[0]),.CP(we_i), .Q (sel_r[0]), .QN(), .CDN(async_reset_neg_i));

   MUX4ND4BWP M2 (.I0(ft[3]), .I1(ft[2]), .I2(ft[1]), .I3(ft[0])
              ,.S0(sel_r[0]), .S1(sel_r[1])
              ,.ZN(o)
              );

   // capture on positive edge
   DFCND4BWP DFFR2 (.D(sel_i[1]),.CP(we_i), .Q (sel_r[1]), .QN(), .CDN(async_reset_neg_i));

   // synopsys rp_fill (3 2 UX)

   CKBD8BWP ICLK (.I(o),        .Z(buf_o) );

   // synopsys rp_endgroup(bsg_clk_gen_fdt)

endmodule

`BSG_ABSTRACT_MODULE(bsg_rp_dly_line_fine_delay_tuner)
