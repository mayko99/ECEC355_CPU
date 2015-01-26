library ieee;
use IEEE.std_logic_1164.all;

entity ShiftLeft2 is
port(x:in std_logic_vector(31 downto 0);
	y:out std_logic_vector(31 downto 0));
end ShiftLeft2;

architecture beh of ShiftLeft2 is

	begin
		process (x)
			begin
				for i in 29 downto 0 loop
					y(i+2) <= x(i);
				end loop;

			y(0) <= '0';
			y(1) <= '0';
		end process;

end beh;

--sll

--Shift left 2 with sign-extended value as input. A branch instruction contains an offset in instructions, not bytes. 
--This offset needs to be added to the PC+4 value, which is a byte address. 
--Thus, we need to convert the instruction offset to a byte offset. 
--This is accomplished by left shifting the value by 2 since each instruction is 4 bytes in length. 