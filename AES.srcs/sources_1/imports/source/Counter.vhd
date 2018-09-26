library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.crypt_pack.all;

entity Counter is
port(	reset_i : in std_logic;
	enable_i : in std_logic;
	clock_i : in std_logic;
	count_o : out bit4);
end entity Counter;

architecture Counter_arch of Counter is
signal counter_s : bit4;
begin
	P0 : process(clock_i, reset_i, enable_i)
	begin
		if (reset_i = '0') then
			counter_s <= X"0";
		elsif (clock_i'event and clock_i = '1') then
			if (enable_i = '1') then
				counter_s <= counter_s + 1;
			end if;
		end if;
	end process P0;

	count_o <= counter_s;

end architecture Counter_arch;

