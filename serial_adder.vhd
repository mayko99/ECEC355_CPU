
library ieee;
use ieee.std_logic_1164.all;

ENTITY serial_adder IS
  Generic(n : natural := 8);
PORT ( 
	SIGNAL a , b , clk, en : IN std_logic ;
	SIGNAL s : OUT std_logic_vector (N-1 DOWNTO 0);
	SIGNAL cout, done :OUT std_logic );
END serial_adder;

ARCHITECTURE behav OF serial_adder IS
   SIGNAL state , carry, sum : std_logic ;
   SIGNAL temp : std_logic_vector (N-1 DOWNTO 0) ;
        
BEGIN
trans_and_count :PROCESS ( clk , en )
   VARIABLE counter : INTEGER := 0;
   BEGIN
        IF (en = '0') THEN  -- reset.
            state <= '0';
            counter := 0;
            temp <= (others => '0');
            done <= '0';
        ELSIF clk = '1' and clk'event THEN
            IF (counter < N) THEN -- move to next bit
				done <= '0';
                state <= carry;
                counter := counter + 1;
                temp(N-1) <= sum;
                FOR i IN N-2 DOWNTO 0 LOOP
                    temp(i) <= temp(i+1);
                END LOOP;
            ELSE             -- the addition is done.
                done <= '1';
            END IF;
        END IF ;
   END PROCESS trans_and_count;
   -- wire state (storage for carry synch with ck) to Port cout
   cout <= state;

   output : PROCESS ( a , b , state )
   BEGIN
        sum <= a XOR b XOR state;   
        carry <= (a AND b) OR (a AND state) OR (b AND state);
   END PROCESS output;


   s <= temp; --wire to output

END behav;