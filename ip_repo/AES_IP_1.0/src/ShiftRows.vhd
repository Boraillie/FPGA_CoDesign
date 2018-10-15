library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.crypt_pack.all;

entity ShiftRows is
port( data_i : in type_state;
      data_o : out type_state);
end entity ShiftRows;

architecture ShiftRows_arch of ShiftRows is
begin 
	Pr : for i in 0 to 3 generate
		Pc : for j in 0 to 3 generate
			data_o(i)(j) <= data_i(i)((j+i) mod 4);
		end generate;
	end generate;
end architecture ShiftRows_arch;


