library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.crypt_pack.all;

entity MixColumns is
port( data_i : in type_state;
      enableMixColumns_i : in std_logic;
      data_o : out type_state);
end entity MixColumns;

architecture MixColumns_arch of MixColumns is
component matrixMultiplier
port(	data_i : in column_state;
	data_o : out column_state);
end component;
signal data_s : type_state;
begin
	F0 : for i in 0 to 3 generate
		U0 : matrixMultiplier 
		port map(
			data_i(0) => data_i(0)(i),
			data_i(1) => data_i(1)(i),
			data_i(2) => data_i(2)(i),
			data_i(3) => data_i(3)(i),
			data_o(0) => data_s(0)(i),
			data_o(1) => data_s(1)(i),
			data_o(2) => data_s(2)(i),
			data_o(3) => data_s(3)(i));
	end generate;

	data_o <= data_s when enableMixColumns_i = '1' else data_i;
end architecture MixColumns_arch;
