library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.crypt_pack.all;


entity KeyExpansion is
    Port ( key_i : in  bit128;
	       rcon_i : in bit8;
           expansion_key_o : out bit128);
end KeyExpansion;

architecture KeyExpansion_arch of KeyExpansion is
type state is array (0 to 3) of column_state;

component SBOX
port(	Sbox_in  : in  bit8;
	Sbox_out : out bit8);
end component;

signal Wi : state;
signal Wo : state;
signal Wrotword : column_state;
signal Wsubword : column_state;
signal rcon : column_state;
begin
	rcon(0) <= rcon_i;
	rcon(1) <= X"00";
	rcon(2) <= X"00";
	rcon(3) <= X"00";
	
	-- Wi = key_state
	U0: for i in 0 to 3 generate
		U0_1: for j in 0 to 3 generate
			Wi(i)(j) <= key_i(127-32*i-8*j downto 120-32*i-8*j);
		end generate;
	end generate;

	U1: for i in 0 to 3 generate
		Wrotword(i) <= Wi(3)((i+1) mod 4);
	end generate;

	U2: for i in 0 to 3 generate
		U2x : SBOX 
		  port map (
		      Sbox_in => Wrotword(i), 
		      Sbox_out => Wsubword(i));
	end generate;

	Wo(0) <= Wi(0) xor Wsubword xor rcon;
	U3: for i in 1 to 3 generate
		Wo(i) <= Wo(i-1) xor Wi(i);
	end generate;
	
	-- expansion_key_state = Wo
	U4: for i in 0 to 3 generate
		U4_1: for j in 0 to 3 generate
			expansion_key_o(127-32*i-8*j downto 120-32*i-8*j) <= Wo(i)(j);
		end generate;
	end generate;
end architecture KeyExpansion_arch;
