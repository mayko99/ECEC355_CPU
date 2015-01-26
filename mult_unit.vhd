library IEEE;
use IEEE.STD_LOGIC_1164.ALL,
IEEE.STD_LOGIC_arith.ALL,IEEE.STD_LOGIC_unsigned.ALL;
Entity mult_unit is
port( x, y: in   std_logic_vector(3 downto 0);
         z: out  std_logic_vector(3 downto 0)
       );
end mult_unit;
architecture concurrent of mult_unit is
begin
process(x, y)
begin
z <= x+y;
end process;
end concurrent;


