
// ## AUTOGENERATED; DO NOT MODIFY
// ## num_rows_p = 8
// ## num_cols_p = 8
// ## num_dly_p = 8


module bsg_rp_clk_gen_osc_v3
  (input async_reset_i
   , input trigger_i
   , input [63:0] ctl_one_hot_i
   , output clk_o
   );
  wire lobit;
  TIELBWP7T30P140ULVT T0 (.ZN(lobit));
  wire hibit;
  TIEHBWP7T30P140ULVT T1 (.Z(hibit));
  wire async_reset_neg;
  INVD1BWP7T30P140ULVT I0 (.ZN(async_reset_neg), .I(async_reset_i));
  wire fb_inv, fb, fb_dly, fb_rst;
  CKND1BWP7T30P140ULVT I1 (.ZN(fb_inv), .I(fb));
  CKND2D1BWP7T30P140ULVT N0 (.ZN(fb_rst), .A1(fb_inv), .A2(async_reset_neg));
  wire [8:0] n;
  assign n[0] = fb_rst;


    CKBD1BWP7T30P140ULVT B0 (.Z(n[1]), .I(n[0]));


    CKBD1BWP7T30P140ULVT B1 (.Z(n[2]), .I(n[1]));


    CKBD1BWP7T30P140ULVT B2 (.Z(n[3]), .I(n[2]));


    CKBD1BWP7T30P140ULVT B3 (.Z(n[4]), .I(n[3]));


    CKBD1BWP7T30P140ULVT B4 (.Z(n[5]), .I(n[4]));


    CKBD1BWP7T30P140ULVT B5 (.Z(n[6]), .I(n[5]));


    CKBD1BWP7T30P140ULVT B6 (.Z(n[7]), .I(n[6]));


    CKBD1BWP7T30P140ULVT B7 (.Z(n[8]), .I(n[7]));


  // Delay value ignored in synthesis
  assign #100 fb_dly = n[8];
  CKND1BWP7T30P140ULVT I2 (.ZN(clk_o), .I(fb_dly));
  wire fb_gate;
  CKND1BWP7T30P140ULVT I3 (.ZN(fb_gate), .I(fb_dly));
  wire gate_en_sync_1_r, gate_en_sync_2_r;
  DFQD1BWP7T30P140ULVT S1 (.D(trigger_i), .CP(fb_gate), .Q(gate_en_sync_1_r));
  DFQD1BWP7T30P140ULVT S2 (.D(gate_en_sync_1_r), .CP(fb_gate), .Q(gate_en_sync_2_r));
  wire fb_gated;
  CKLNQD20BWP7T30P140ULVT CG0 (.Q(fb_gated), .CP(fb_gate), .E(gate_en_sync_2_r), .TE(lobit));
  wire [8:0] fb_col;
  assign fb_col[0] = 1'b0;


      bsg_rp_clk_gen_osc_v3_col col_0
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[0])
        ,.ctl_one_hot_i(ctl_one_hot_i[7:0])
        ,.clk_o(fb_col[1])
        );


      bsg_rp_clk_gen_osc_v3_col col_1
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[1])
        ,.ctl_one_hot_i(ctl_one_hot_i[15:8])
        ,.clk_o(fb_col[2])
        );


      bsg_rp_clk_gen_osc_v3_col col_2
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[2])
        ,.ctl_one_hot_i(ctl_one_hot_i[23:16])
        ,.clk_o(fb_col[3])
        );


      bsg_rp_clk_gen_osc_v3_col col_3
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[3])
        ,.ctl_one_hot_i(ctl_one_hot_i[31:24])
        ,.clk_o(fb_col[4])
        );


      bsg_rp_clk_gen_osc_v3_col col_4
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[4])
        ,.ctl_one_hot_i(ctl_one_hot_i[39:32])
        ,.clk_o(fb_col[5])
        );


      bsg_rp_clk_gen_osc_v3_col col_5
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[5])
        ,.ctl_one_hot_i(ctl_one_hot_i[47:40])
        ,.clk_o(fb_col[6])
        );


      bsg_rp_clk_gen_osc_v3_col col_6
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[6])
        ,.ctl_one_hot_i(ctl_one_hot_i[55:48])
        ,.clk_o(fb_col[7])
        );


      bsg_rp_clk_gen_osc_v3_col col_7
       (.async_reset_i(async_reset_i)
        ,.clkgate_i(fb_gated)
        ,.clkdly_i(fb_dly)
        ,.clkfb_i(fb_col[7])
        ,.ctl_one_hot_i(ctl_one_hot_i[63:56])
        ,.clk_o(fb_col[8])
        );


  assign fb = fb_col[8];
endmodule
