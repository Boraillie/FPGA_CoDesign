library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.crypt_pack.all;

entity SubBytes is
port( data_i : in type_state;
      data_o : out type_state);
end entity SubBytes;

architecture SubBytes_arch of SubBytes is
component SBOX
port( Sbox_in : in bit8;
      Sbox_out : out bit8);
end component;
begin 
	Pc : for i in 0 to 3 generate
		Pr : for j in 0 to 3 generate
			U0 : SBOX
			port map(
				SBox_in => data_i(i)(j),
				SBox_out => data_o(i)(j));
		end generate;
	end generate;
end architecture SubBytes_arch;
