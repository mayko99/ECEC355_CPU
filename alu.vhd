library ieee;
use IEEE.std_logic_1164.all;

entity ALU is
generic(n:natural:=32);
port(a,b:in std_logic_vector(n-1 downto 0);
	  Oper:in std_logic_vector(3 downto 0);
	  Result:buffer std_logic_vector(n-1 downto 0);
	  Zero,Overflow:buffer std_logic);
 end ALU;
