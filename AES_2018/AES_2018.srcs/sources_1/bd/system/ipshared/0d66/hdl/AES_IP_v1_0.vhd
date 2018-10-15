library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AES_IP_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S_AES_AXI
		C_S_AES_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AES_AXI_ADDR_WIDTH	: integer	:= 6
	);
	port (
		-- Users to add ports here
        aes_on : out std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S_AES_AXI
		s_aes_axi_aclk	: in std_logic;
		s_aes_axi_aresetn	: in std_logic;
		s_aes_axi_awaddr	: in std_logic_vector(C_S_AES_AXI_ADDR_WIDTH-1 downto 0);
		s_aes_axi_awprot	: in std_logic_vector(2 downto 0);
		s_aes_axi_awvalid	: in std_logic;
		s_aes_axi_awready	: out std_logic;
		s_aes_axi_wdata	: in std_logic_vector(C_S_AES_AXI_DATA_WIDTH-1 downto 0);
		s_aes_axi_wstrb	: in std_logic_vector((C_S_AES_AXI_DATA_WIDTH/8)-1 downto 0);
		s_aes_axi_wvalid	: in std_logic;
		s_aes_axi_wready	: out std_logic;
		s_aes_axi_bresp	: out std_logic_vector(1 downto 0);
		s_aes_axi_bvalid	: out std_logic;
		s_aes_axi_bready	: in std_logic;
		s_aes_axi_araddr	: in std_logic_vector(C_S_AES_AXI_ADDR_WIDTH-1 downto 0);
		s_aes_axi_arprot	: in std_logic_vector(2 downto 0);
		s_aes_axi_arvalid	: in std_logic;
		s_aes_axi_arready	: out std_logic;
		s_aes_axi_rdata	: out std_logic_vector(C_S_AES_AXI_DATA_WIDTH-1 downto 0);
		s_aes_axi_rresp	: out std_logic_vector(1 downto 0);
		s_aes_axi_rvalid	: out std_logic;
		s_aes_axi_rready	: in std_logic
	);
end AES_IP_v1_0;

architecture arch_imp of AES_IP_v1_0 is

	-- component declaration
	component AES_IP_v1_0_S_AES_AXI is
		generic (
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 6
		);
		port (
		
		
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic
		);
	end component AES_IP_v1_0_S_AES_AXI;

begin

-- Instantiation of Axi Bus Interface S_AES_AXI
AES_IP_v1_0_S_AES_AXI_inst : AES_IP_v1_0_S_AES_AXI
	generic map (
		C_S_AXI_DATA_WIDTH	=> C_S_AES_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S_AES_AXI_ADDR_WIDTH
	)
	port map (
		S_AXI_ACLK	=> s_aes_axi_aclk,
		S_AXI_ARESETN	=> s_aes_axi_aresetn,
		S_AXI_AWADDR	=> s_aes_axi_awaddr,
		S_AXI_AWPROT	=> s_aes_axi_awprot,
		S_AXI_AWVALID	=> s_aes_axi_awvalid,
		S_AXI_AWREADY	=> s_aes_axi_awready,
		S_AXI_WDATA	=> s_aes_axi_wdata,
		S_AXI_WSTRB	=> s_aes_axi_wstrb,
		S_AXI_WVALID	=> s_aes_axi_wvalid,
		S_AXI_WREADY	=> s_aes_axi_wready,
		S_AXI_BRESP	=> s_aes_axi_bresp,
		S_AXI_BVALID	=> s_aes_axi_bvalid,
		S_AXI_BREADY	=> s_aes_axi_bready,
		S_AXI_ARADDR	=> s_aes_axi_araddr,
		S_AXI_ARPROT	=> s_aes_axi_arprot,
		S_AXI_ARVALID	=> s_aes_axi_arvalid,
		S_AXI_ARREADY	=> s_aes_axi_arready,
		S_AXI_RDATA	=> s_aes_axi_rdata,
		S_AXI_RRESP	=> s_aes_axi_rresp,
		S_AXI_RVALID	=> s_aes_axi_rvalid,
		S_AXI_RREADY	=> s_aes_axi_rready
	);

	-- Add user logic here

	-- User logic ends

end arch_imp;
