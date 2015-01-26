library ieee;
use IEEE.std_logic_1164.all;

entity ShiftLeft2Jump is
port(x:in std_logic_vector(25 downto 0);
	y:in std_logic_vector(3 downto 0);
	z:out std_logic_vector(31 downto 0));
end ShiftLeft2Jump;

architecture beh of shiftLeft2Jump is
begin
	--y input is PC
--  COMPONENT pc
--    PORT(AddressOut:out std_logic_vector(31 downto 0));
--  END COMPONENT;

--PCPART : pc port map(
--addressOut(0-3) => y
--);

	process(x, y)
	

-- x input for shiftLeft2
--COMPONENT shiftLeft2
--	port(y:out std_logic_vector(31 downto 0));
--END COMPONENT;

--SL2PART : shiftLeft2 port map (
--y(5-31) => x
--);
	begin
--x taken from shiftLeft2
--shiftLeft2 component?

--z(30) <= '0';
--z(31) <= '0';

z <= y & x & '0' & '0';


--two empty bits at the end
		
end process;

end beh;
--****************all port mapping to be done in cpu module**********************
--The  jump  instruction  operates  by  replacing  the  lower  28  bits  of  the  PC  with  the lower 26 bits of the instruction shifted left by 2 bits. 
--This shift is accomplished  simply by concatenating 00 to the jump offset, as described in Chapter 2.
--32 bits -> first 4 of PC + last 26 of shiftLeft2 + 00