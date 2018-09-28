// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Fri Sep 28 13:40:55 2018
// Host        : Cyril-Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {d:/Documents/Cours/EMSE/3A/Embedded
//               Systems/FPGA_CoDesign/AES/AES.srcs/sources_1/ip/clk_vip_0/clk_vip_0_stub.v}
// Design      : clk_vip_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "clk_vip_v1_0_1_top,Vivado 2018.2" *)
module clk_vip_0(clk_in, clk_out)
/* synthesis syn_black_box black_box_pad_pin="clk_in,clk_out" */;
  input clk_in;
  output clk_out;
endmodule
