
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity serial_add is 
  generic ( N : natural := 8 );
  port (
    signal a, b, clk, en  : in  std_logic;
    signal s              : out std_logic_vector(N-1 downto 0);
    signal cout, done     : out std_logic
  );
end serial_add;


architecture behavioral of serial_add is
  signal state, carry, sum : std_logic;
  signal temp              : std_logic_vector(N-1 downto 0);
begin

  trans_and_count :process( clk, en )
    variable counter : integer := 0;
  begin
    if en = '0' then
      state <= '0';
      counter := 0;
      temp <= (others => '0');
      done <= '0';
    elsif clk = '1' and clk'event then
      if counter < N then
        done <= '0';
        state <= carry;
        counter := counter + 1;
        temp( N-1 ) <= sum;
        for i in N-2 downto 0 loop 
          temp(i) <= temp(i+1);
        end loop;
      else
        done <= '1';
      end if;
    end if;
  end process trans_and_count;
  
  cout <= state;
  
  output :process( a, b, state )
  begin
    sum <= a xor b xor state;
    carry <= ( a and b ) or ( a and state ) or ( b and state );
  end process output;
  
  s <= temp;

end behavioral;












