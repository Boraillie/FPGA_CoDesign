library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.crypt_pack.all;

entity KeyExpansion_FSM is
port(	reset_i : in std_logic;
	start_i : in std_logic;
	clock_i : in std_logic;
	counter_i : in bit4;
	end_o : out std_logic;
	enable_o : out std_logic;
	reset_counter_o : out std_logic);
end entity KeyExpansion_FSM;

architecture KeyExpansion_FSM_arch of KeyExpansion_FSM is
type State is (INIT, COUNT, STOP);
signal CurrentState, NextState : State;
begin
	P0: process(reset_i, clock_i)
	begin
		if (reset_i = '0') then 
			CurrentState <= INIT;
		elsif (clock_i'event and clock_i = '1') then
			CurrentState <= NextState;
		end if;
	end process P0;

	P1: process(CurrentState, start_i, counter_i)
	begin
		case CurrentState is
			when INIT => 
				if (start_i = '1') then
					NextState <= COUNT;
				else 
					NextState <= INIT;
				end if;
			when COUNT =>
				if (counter_i = X"9") then
					NextState <= STOP;
				else
					NextState <= COUNT;
				end if;
			when STOP =>
				NextState <= STOP;
			when others =>
		end case;
	end process P1;

	P2: process(CurrentState)
	begin
		case CurrentState is
			when INIT => 
				end_o <= '0';
				enable_o <= '0';
				reset_counter_o <= '0';
			when COUNT =>
				end_o <= '0';
				enable_o <= '1';
				reset_counter_o <= '1';
			when STOP =>
				end_o <= '1';
				enable_o <= '0';
				reset_counter_o <= '1';
			when others =>
				end_o <= '0';
                enable_o <= '0';
                reset_counter_o <= '1';
		end case;
	end process P2;
end architecture KeyExpansion_FSM_arch;


