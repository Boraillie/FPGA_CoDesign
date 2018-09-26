----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.09.2018 15:29:19
-- Design Name: 
-- Module Name: MUX - MUX_arch
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
    Port ( data_i : in STD_LOGIC_VECTOR(127 downto 0);
           sel_i : in STD_LOGIC_VECTOR(3 downto 0);
           data_o : out STD_LOGIC_VECTOR(7 downto 0));
end MUX;

architecture MUX_arch of MUX is

begin


  data_o <= data_i(7 downto 0) when sel_i = "0000" else
            data_i(15 downto 8) when sel_i = "0001" else
            data_i(23 downto 16) when sel_i = "0010" else
            data_i(31 downto 24) when sel_i = "0011" else
            data_i(39 downto 32) when sel_i = "0100" else
            data_i(47 downto 40) when sel_i = "0101" else
            data_i(55 downto 48) when sel_i = "0110" else
            data_i(63 downto 56) when sel_i = "0111" else
            data_i(71 downto 64) when sel_i = "1000" else
            data_i(79 downto 72) when sel_i = "1001" else
            data_i(87 downto 80) when sel_i = "1010" else
            data_i(95 downto 88) when sel_i = "1011" else
            data_i(103 downto 96) when sel_i = "1100" else
            data_i(111 downto 104) when sel_i = "1101" else
            data_i(119 downto 112) when sel_i = "1110" else
            data_i(127 downto 120) when sel_i = "1111" else 
            "XXXXXXXX";


end MUX_arch;
