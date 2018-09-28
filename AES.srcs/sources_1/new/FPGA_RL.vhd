----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.09.2018 15:45:29
-- Design Name: 
-- Module Name: FPGA_RL - FPGA_RL_arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
library work;
use work.crypt_pack.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FPGA_RL is
    Port ( clock_i : in STD_LOGIC;
           reset_i : in STD_LOGIC;
           start_i : in STD_LOGIC;
           sel_i : in STD_LOGIC_VECTOR (3 downto 0);
           data_o : out STD_LOGIC_VECTOR (7 downto 0);
           aes_on_o : out STD_LOGIC);
end FPGA_RL;

architecture FPGA_RL_arch of FPGA_RL is
component AES
    Port ( clock_i : in std_logic;
	reset_i : in std_logic;
	start_i : in std_logic;
	key_i : in  bit128;
    data_i : in bit128;
	data_o : out bit128;
	aes_on_o : out std_logic);
end component;
component MUX
    Port ( data_i : in STD_LOGIC_VECTOR(127 downto 0);
           sel_i : in STD_LOGIC_VECTOR(3 downto 0);
           data_o : out STD_LOGIC_VECTOR(7 downto 0));
end component;
component clk_wiz_0
    Port (  clk_in1 : in STD_LOGIC;
            clk_out1 : in STD_LOGIC;
end component;

signal data_i_s : STD_LOGIC_VECTOR(127 downto 0);
signal data_o_s : STD_LOGIC_VECTOR(127 downto 0);
signal key_s : bit128;
signal clk_s : STD_LOGIC;


begin
    -- affectation des constantes
    data_i_s <= X"526573746f20656e2076696c6c65203f";
    key_s <= X"2b7e151628aed2a6abf7158809cf4f3c";

    --port mapping
    U0 : AES
	port map( key_i => key_s,
	   clock_i => clk_s,
	   reset_i => reset_i,
	   start_i => start_i,
	   data_i => data_i_s,
	   data_o => data_o_s,
	   aes_on_o => aes_on_o);

    U1 : MUX
	port map( data_i => data_o_s,
              sel_i => sel_i,
              data_o => data_o);

    U2 : clk_wiz_0
	port map( clk_in1 => clock_i,
              clk_out1 => clk_s);
end FPGA_RL_arch;
