// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Oct 15 15:31:34 2018
// Host        : Cyril-Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/Documents/Cours/EMSE/3A/Embedded_Systems/FPGA_CoDesign/Projet_AES_2018/AES_2018/AES_2018.srcs/sources_1/bd/system/ip/system_AES_IP_0_0/system_AES_IP_0_0_stub.v
// Design      : system_AES_IP_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "AES_IP_v1_0,Vivado 2018.2" *)
module system_AES_IP_0_0(aes_on, s_aes_axi_awaddr, s_aes_axi_awprot, 
  s_aes_axi_awvalid, s_aes_axi_awready, s_aes_axi_wdata, s_aes_axi_wstrb, s_aes_axi_wvalid, 
  s_aes_axi_wready, s_aes_axi_bresp, s_aes_axi_bvalid, s_aes_axi_bready, s_aes_axi_araddr, 
  s_aes_axi_arprot, s_aes_axi_arvalid, s_aes_axi_arready, s_aes_axi_rdata, s_aes_axi_rresp, 
  s_aes_axi_rvalid, s_aes_axi_rready, s_aes_axi_aclk, s_aes_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="aes_on,s_aes_axi_awaddr[5:0],s_aes_axi_awprot[2:0],s_aes_axi_awvalid,s_aes_axi_awready,s_aes_axi_wdata[31:0],s_aes_axi_wstrb[3:0],s_aes_axi_wvalid,s_aes_axi_wready,s_aes_axi_bresp[1:0],s_aes_axi_bvalid,s_aes_axi_bready,s_aes_axi_araddr[5:0],s_aes_axi_arprot[2:0],s_aes_axi_arvalid,s_aes_axi_arready,s_aes_axi_rdata[31:0],s_aes_axi_rresp[1:0],s_aes_axi_rvalid,s_aes_axi_rready,s_aes_axi_aclk,s_aes_axi_aresetn" */;
  output aes_on;
  input [5:0]s_aes_axi_awaddr;
  input [2:0]s_aes_axi_awprot;
  input s_aes_axi_awvalid;
  output s_aes_axi_awready;
  input [31:0]s_aes_axi_wdata;
  input [3:0]s_aes_axi_wstrb;
  input s_aes_axi_wvalid;
  output s_aes_axi_wready;
  output [1:0]s_aes_axi_bresp;
  output s_aes_axi_bvalid;
  input s_aes_axi_bready;
  input [5:0]s_aes_axi_araddr;
  input [2:0]s_aes_axi_arprot;
  input s_aes_axi_arvalid;
  output s_aes_axi_arready;
  output [31:0]s_aes_axi_rdata;
  output [1:0]s_aes_axi_rresp;
  output s_aes_axi_rvalid;
  input s_aes_axi_rready;
  input s_aes_axi_aclk;
  input s_aes_axi_aresetn;
endmodule
