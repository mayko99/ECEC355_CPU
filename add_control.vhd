Library ieee;
Use ieee.std_logic_1164.all, work.p1_pack.all;
Entity control is
  port (go, ck, reset, done : in std_logic;
        sel : out sh_reg_sel;
        en : out std_logic);
end control;

architecture behav of control is -- declare enumeration type
type state is (idle, loading, shifting); -- internal state called n_s (next state)
signal n_s : state;
begin 
process(ck)
begin
  if ck = '1' and ck'event then -- ck rising edge fence
    if reset = '1' then n_s <= idle; else -- reset fence
      Case n_s is
    when idle =>
      -- assign control signals
      en <= '1'; -- serial_adder: no reset
      sel <= no_op; -- sh_reg's: no operation
      -- State Transition
      if go = '1' then n_s <= loading;
      end if;
    when loading =>
      -- assign control signals
      en <= '0'; -- serial_adder: reset
      sel <= load; -- sh_reg's: load
      -- state transition
      n_s <= shifting;
    when shifting =>
      -- assign control signals and state transition
      en <= '1'; -- serial_adder: no reset
      sel <= shift; -- sh_reg's: shift
      -- State Transition
      if done = '1' then n_s <= idle;
      end if;
    end case;
  end if;
end if;
end process;
end behav;