library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.crypt_pack.all;

entity FPGA_RL_tb is
end entity FPGA_RL_tb;

architecture FPGA_RL_tb_arch of FPGA_RL_tb is
component FPGA_RL
port(	clock_i : in std_logic;
	reset_i : in std_logic;
	start_i : in std_logic;
	sel_i : in bit4;
	data_o : out bit8;
	aes_on_o : out std_logic);
end component;

signal data_o_s : bit8;
signal aes_on_o_s : std_logic;
signal reset_i_s : std_logic;
signal clock_i_s : std_logic;
signal start_i_s : std_logic;
signal sel_i_s : bit4;

begin 
    sel_i_s <= X"0";

	DUT : FPGA_RL
	port map(
		clock_i => clock_i_s,
		reset_i => reset_i_s,
		start_i => start_i_s,
		sel_i => sel_i_s,
		data_o => data_o_s,
		aes_on_o => aes_on_o_s);

	P1 : process
	begin 
		reset_i_s <= '1';
		wait for 10 ns;
		reset_i_s <= '0';
		wait;
	end process P1;

	P2 : process
	begin 
		start_i_s <= '0';
		wait for 100 ns;
		start_i_s <= '1';
		wait for 120 ns;
		start_i_s <= '0';
		wait for 3000 ns;
		start_i_s <= '1';
		wait for 120 ns;
		start_i_s <= '0';
		wait;
	end process P2;

	Pclk : process
	begin 
		clock_i_s <= '0';
		wait for 50 ns;
		clock_i_s <= '1';
		wait for 50 ns;
	end process Pclk;

end architecture FPGA_RL_tb_arch;
