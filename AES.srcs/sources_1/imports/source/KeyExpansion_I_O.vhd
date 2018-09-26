library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.crypt_pack.all;

entity KeyExpansion_I_O is
    Port ( key_i : in  bit128;
	   clock_i : in std_logic;
	   reset_i : in std_logic;
	   start_i : in std_logic;
	   round_i : in bit4;
	   end_o : out std_logic;
           expansion_key_o : out bit128);
end KeyExpansion_I_O;

architecture KeyExpansion_I_O_arch of KeyExpansion_I_O is
type state is array (0 to 3) of column_state;
type key_memory is array(0 to 10) of bit128;

component KeyExpansion
port(	key_i : in  bit128;
	rcon_i : in bit8;
        expansion_key_o : out bit128);
end component;

component KeyExpansion_FSM
port(	reset_i : in std_logic;
	start_i : in std_logic;
	clock_i : in std_logic;
	counter_i : in bit4;
	end_o : out std_logic;
	enable_o : out std_logic;
	reset_counter_o : out std_logic);
end component;

component Counter
port(	reset_i : in std_logic;
	enable_i : in std_logic;
	clock_i : in std_logic;
	count_o : out bit4);
end component;

signal KeyMemory_s : key_memory;
signal Counter_s : bit4;
signal Enable_s : std_logic;
signal ResetCounter_s : std_logic;
signal KeyState_s : bit128;
signal ExpansionKeyState_s : bit128;
signal rcon_s : bit8;
begin
	rcon_s <= Rcon(conv_integer(Counter_s));
	expansion_key_o <= KeyMemory_s(conv_integer(round_i));
	U0 : Counter
	port map (
		reset_i => ResetCounter_s,
		enable_i => Enable_s, 
		clock_i => clock_i,
		count_o => Counter_s);

	U1: KeyExpansion_FSM
	port map (
		reset_i => reset_i,
		start_i => start_i,
		clock_i => clock_i,
		counter_i => Counter_s,
		end_o => end_o,
		enable_o => Enable_s,
		reset_counter_o => ResetCounter_s);

	U2 : KeyExpansion
	port map (
		key_i => KeyState_s,
		rcon_i => rcon_s,
		expansion_key_o => ExpansionKeyState_s);

	P0 : process(Counter_s, Enable_s, Key_i, ExpansionKeyState_s, Clock_i)
	begin
		if (Clock_i'event and Clock_i = '1') then
			if (Enable_s = '1') then
				if (Counter_s = X"0") then 
					KeyMemory_s(0) <= Key_i;
				end if;
				if (Counter_s /= X"A") then
					KeyMemory_s(conv_integer(Counter_s)+1) <= ExpansionKeyState_s;
				end if;
			end if;
		end if;
	end process P0;

	P1 : process(Counter_s, Key_i, KeyMemory_s)
	begin
		if (Counter_s = X"0") then
			KeyState_s <= Key_i;
		else
			KeyState_s <= KeyMemory_s(conv_integer(Counter_s));
		end if;
	end process P1;

end architecture KeyExpansion_I_O_arch;

