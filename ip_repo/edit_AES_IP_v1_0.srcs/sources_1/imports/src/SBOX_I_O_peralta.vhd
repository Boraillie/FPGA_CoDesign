library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.crypt_pack.all;

entity SBOX is
  port(
    Sbox_in  : in  bit8;
    Sbox_out : out bit8);
end entity SBOX;

-- Jan 18 +  09
-- Straight-line program for AES sbox 
-- Joan Boyar) and Rene Peralta
  
-- input is X0 + ..,X7  
-- output is S0 +  ...,S7
-- arithmetic is over GF2

architecture SBOX_peralta_arch of SBOX is
-- 113 gates
-- 8 inputs
-- U0 U1 U2 U3 U4 U5 U6 U7 
-- 8 outputs
-- S3 S7 S0 S6 S4 S1 S2 S5 
signal t : std_logic_vector(45 downto 0);
signal tc : std_logic_vector(26 downto 1);
signal y : std_logic_vector(21 downto 1);
signal z : std_logic_vector(17 downto 0);
signal U : std_logic_vector(0 to 7);
signal S : std_logic_vector(0 to 7);
begin
  U(0) <= Sbox_in(7);
  U(1) <= Sbox_in(6);
  U(2) <= Sbox_in(5);
  U(3) <= Sbox_in(4);
  U(4) <= Sbox_in(3);
  U(5) <= Sbox_in(2);
  U(6) <= Sbox_in(1);
  U(7) <= Sbox_in(0);

y(14) <= U(3) xor U(5);
y(13) <= U(0) xor U(6);
y(9) <= U(0) xor U(3);
y(8) <= U(0) xor U(5);
t(0) <= U(1) xor U(2);
y(1) <= t(0) xor U(7);
y(4) <= y(1) xor U(3);
y(12) <= y(13) xor y(14);
y(2) <= y(1) xor U(0);
y(5) <= y(1) xor U(6);
y(3) <= y(5) xor y(8);
t(1) <= U(4) xor y(12);
y(15) <= t(1) xor U(5);
y(20) <= t(1) xor U(1);
y(6) <= y(15) xor U(7);
y(10) <= y(15) xor t(0);
y(11) <= y(20) xor y(9);
y(7) <= U(7) xor y(11);
y(17) <= y(10) xor y(11);
y(19) <= y(10) xor y(8);
y(16) <= t(0) xor y(11);
y(21) <= y(13) xor y(16);
y(18) <= U(0) xor y(16);
t(2) <= y(12) and y(15);
t(3) <= y(3) and y(6);
t(4) <= t(3) xor t(2);
t(5) <= y(4) and U(7);
t(6) <= t(5) xor t(2);
t(7) <= y(13) and y(16);
t(8) <= y(5) and y(1);
t(9) <= t(8) xor t(7);
t(10) <= y(2) and y(7);
t(11) <= t(10) xor t(7);
t(12) <= y(9) and y(11);
t(13) <= y(14) and y(17);
t(14) <= t(13) xor t(12);
t(15) <= y(8) and y(10);
t(16) <= t(15) xor t(12);
t(17) <= t(4) xor y(20);
t(18) <= t(6) xor t(16);
t(19) <= t(9) xor t(14);
t(20) <= t(11) xor t(16);
t(21) <= t(17) xor t(14);
t(22) <= t(18) xor y(19);
t(23) <= t(19) xor y(21);
t(24) <= t(20) xor y(18);
t(25) <= t(21) xor t(22);
t(26) <= t(21) and t(23);
t(27) <= t(24) xor t(26);
t(28) <= t(25) and t(27);
t(29) <= t(28) xor t(22);
t(30) <= t(23) xor t(24);
t(31) <= t(22) xor t(26);
t(32) <= t(31) and t(30);
t(33) <= t(32) xor t(24);
t(34) <= t(23) xor t(33);
t(35) <= t(27) xor t(33);
t(36) <= t(24) and t(35);
t(37) <= t(36) xor t(34);
t(38) <= t(27) xor t(36);
t(39) <= t(29) and t(38);
t(40) <= t(25) xor t(39);
t(41) <= t(40) xor t(37);
t(42) <= t(29) xor t(33);
t(43) <= t(29) xor t(40);
t(44) <= t(33) xor t(37);
t(45) <= t(42) xor t(41);
z(0) <= t(44) and y(15);
z(1) <= t(37) and y(6);
z(2) <= t(33) and U(7);
z(3) <= t(43) and y(16);
z(4) <= t(40) and y(1);
z(5) <= t(29) and y(7);
z(6) <= t(42) and y(11);
z(7) <= t(45) and y(17);
z(8) <= t(41) and y(10);
z(9) <= t(44) and y(12);
z(10) <= t(37) and y(3);
z(11) <= t(33) and y(4);
z(12) <= t(43) and y(13);
z(13) <= t(40) and y(5);
z(14) <= t(29) and y(2);
z(15) <= t(42) and y(9);
z(16) <= t(45) and y(14);
z(17) <= t(41) and y(8);
tc(1) <= z(15) xor z(16);
tc(2) <= z(10) xor tc(1);
tc(3) <= z(9) xor tc(2);
tc(4) <= z(0) xor z(2);
tc(5) <= z(1) xor z(0);
tc(6) <= z(3) xor z(4);
tc(7) <= z(12) xor tc(4);
tc(8) <= z(7) xor tc(6);
tc(9) <= z(8) xor tc(7);
tc(10) <= tc(8) xor tc(9);
tc(11) <= tc(6) xor tc(5);
tc(12) <= z(3) xor z(5);
tc(13) <= z(13) xor tc(1);
tc(14) <= tc(4) xor tc(12);
S(3) <= tc(3) xor tc(11);
tc(16) <= z(6) xor tc(8);
tc(17) <= z(14) xor tc(10);
tc(18) <= tc(13) xor tc(14);
S(7) <= z(12) xnor tc(18);
tc(20) <= z(15) xor tc(16);
tc(21) <= tc(2) xor z(11);
S(0) <= tc(3) xor tc(16);
S(6) <= tc(10) xnor tc(18);
S(4) <= tc(14) xor S(3);
S(1) <= S(3) xnor tc(16);
tc(26) <= tc(17) xor tc(20);
S(2) <= tc(26) xnor z(17);
S(5) <= tc(21) xor tc(17);
  Sbox_out(0) <= S(7);
  Sbox_out(1) <= S(6);
  Sbox_out(2) <= S(5);
  Sbox_out(3) <= S(4);
  Sbox_out(4) <= S(3);
  Sbox_out(5) <= S(2);
  Sbox_out(6) <= S(1);
  Sbox_out(7) <= S(0);
end architecture SBOX_peralta_arch;

