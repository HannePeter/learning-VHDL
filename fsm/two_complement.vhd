library ieee;
use ieee.std_logic_1164.all;


entity two_complement is
    port(   x, start : in  std_logic;
            y        : out std_logic;
            clk, reset : in std_logic);
end;

            
architecture fsm of two_complement is

    type state_t is (S0, S1, S2);
    signal state, nextstate : state_t;

begin

    process(clk, reset, start)
    begin
    
        if (reset = '0' or start = '0') then
            state <= S0;
        elsif rising_edge(clk) then
            state <= nextstate;
        end if;
        
    end process;

    process(state, x)
    begin
    
        case (state) is
            when s0 =>  if (x = '1') then
                            nextstate <= s2;
                        else
                            nextstate <= s0;
                        end if;
            when s1 =>  if (x = '1') then
                            nextstate <= s1;
                        else
                            nextstate <= s2;
                        end if;
            when s2 =>  if (x = '1') then
                            nextstate <= s1;
                        else
                            nextstate <= s2;
                        end if;
            when others => state <= s0;
        end case;
    
    end process;
    
    
    y <= '1' when (state = s2)
            else '0';
                        
end;
