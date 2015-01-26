Library ieee; 
Use ieee.std_logic_1164.all, work.p1_pack.all; 
Entity sh_reg is 
Generic (n : natural := 4); -- specifiable parameter 
							-- (default to 4) 

Port (x : in std_logic_vector(n-1 downto 0); 
z : out std_logic; 
Sel : in sh_reg_sel; 
Ck : in std_logic); 
End sh_reg; 

Architecture behav of sh_reg is

--from solution, holds the input
signal temp : std_logic_vector (n-1 downto 0); 

begin

process(ck)
--process needs a begin as well
begin
if ck='1' and ck'event then
case sel is
	-- when for each state from sh_reg_sel
	--does nothing
	when no_op => null;
	
	--loads x into temp
	when load => temp <= x;
	
	--shift actually does the thing
	when shift =>
		for i in n-2 downto 0 loop 
			temp(i) <= temp (i+1); -- temp(i) refers to the 
									--i-th bit of temp 
 end loop; 	
end case;
--where is the if?
end if;
end process;

--"print" z from temp(0) , the right most bit of temp aka x
z <= temp(0);

end behav;