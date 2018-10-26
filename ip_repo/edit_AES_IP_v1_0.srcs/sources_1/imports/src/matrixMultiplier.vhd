library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.crypt_pack.all;

entity matrixMultiplier is
port(   data_i : in column_state;
        data_o : out column_state);
end matrixMultiplier;

architecture matrixMultiplier_arch of matrixMultiplier is
signal data2_s : column_state;
signal data3_s : column_state;
begin
	F0 : for i in 0 to 3 generate
		data2_s(i) <= (data_i(i)(6 downto 0) & '0') xor "00011011" when data_i(i)(7) = '1'  else data_i(i)(6 downto 0) & '0';
	end generate;

	F1: for i in 0 to 3 generate
		data3_s(i) <= data2_s(i) xor data_i(i);
	end generate;

	data_o(0) <= data2_s(0) xor data3_s(1) xor data_i(2) xor data_i(3);
	data_o(1) <= data_i(0) xor data2_s(1) xor data3_s(2) xor data_i(3);
	data_o(2) <= data_i(0) xor data_i(1) xor data2_s(2) xor data3_s(3);
	data_o(3) <= data3_s(0) xor data_i(1) xor data_i(2) xor data2_s(3);
end architecture matrixMultiplier_arch;

