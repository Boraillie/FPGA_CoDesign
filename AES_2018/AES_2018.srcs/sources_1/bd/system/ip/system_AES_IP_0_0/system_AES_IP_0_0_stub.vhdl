-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon Nov  5 11:46:42 2018
-- Host        : Cyril-Laptop running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Documents/Cours/EMSE/3A/Embedded_Systems/FPGA_CoDesign/Projet_AES_2018/AES_2018/AES_2018.srcs/sources_1/bd/system/ip/system_AES_IP_0_0/system_AES_IP_0_0_stub.vhdl
-- Design      : system_AES_IP_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity system_AES_IP_0_0 is
  Port ( 
    aes_on : out STD_LOGIC;
    s_aes_axi_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_aes_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_aes_axi_awvalid : in STD_LOGIC;
    s_aes_axi_awready : out STD_LOGIC;
    s_aes_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_aes_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_aes_axi_wvalid : in STD_LOGIC;
    s_aes_axi_wready : out STD_LOGIC;
    s_aes_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_aes_axi_bvalid : out STD_LOGIC;
    s_aes_axi_bready : in STD_LOGIC;
    s_aes_axi_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_aes_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_aes_axi_arvalid : in STD_LOGIC;
    s_aes_axi_arready : out STD_LOGIC;
    s_aes_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_aes_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_aes_axi_rvalid : out STD_LOGIC;
    s_aes_axi_rready : in STD_LOGIC;
    s_aes_axi_aclk : in STD_LOGIC;
    s_aes_axi_aresetn : in STD_LOGIC
  );

end system_AES_IP_0_0;

architecture stub of system_AES_IP_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aes_on,s_aes_axi_awaddr[5:0],s_aes_axi_awprot[2:0],s_aes_axi_awvalid,s_aes_axi_awready,s_aes_axi_wdata[31:0],s_aes_axi_wstrb[3:0],s_aes_axi_wvalid,s_aes_axi_wready,s_aes_axi_bresp[1:0],s_aes_axi_bvalid,s_aes_axi_bready,s_aes_axi_araddr[5:0],s_aes_axi_arprot[2:0],s_aes_axi_arvalid,s_aes_axi_arready,s_aes_axi_rdata[31:0],s_aes_axi_rresp[1:0],s_aes_axi_rvalid,s_aes_axi_rready,s_aes_axi_aclk,s_aes_axi_aresetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "AES_IP_v1_0,Vivado 2018.2";
begin
end;
