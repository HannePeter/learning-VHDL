library ieee;
use ieee.std_logic_1164.all;


entity traffic_light is
    port(   n_x0, n_x1 : in std_logic;
            green0, yellow0, red0, green1, yellow1, red1 : out std_logic;
            clk, reset : in std_logic);
end;

            
architecture fsm of traffic_light is

    type state_t is (S0, S1, S2, S3);
    signal state, nextstate : state_t;

begin

    process(clk, reset)
    begin
    
        if (reset = '0') then
            state <= S0;
        elsif rising_edge(clk) then
            state <= nextstate;
        end if;
        
    end process;
    
    process(all)
    begin
    
        case (state) is
            when S0 =>  if (n_x1 = '0') then
                            nextstate <= S1;
                        else
                            nextstate <= S0;
                        end if;
                        
            when S1 =>  nextstate <= S2;
                        
            when S2 =>  if (n_x0 = '0') then
                            nextstate <= S3;
                        else
                            nextstate <= S2;
                        end if;
                        
            when S3 =>  nextstate <= S0;
        end case;
    
    end process;
    
    red0    <= '1' when (state = S2) or (state = S3)
                else '0';
    red1    <= '1' when (state = S0) or (state = S1)
                else '0';
    yellow0 <= '1' when (state = S1) or (state = S3)
                else '0';
    yellow1 <= '1' when (state = S3) or (state = S1)
                else '0';
    green0  <= '1' when (state = S0)
                else '0';
    green1  <= '1' when (state = S2)
                else '0';
                        
end;
