library ieee;
use ieee.std_logic_1164.all;

entity clock is
    port(   clk_in  : in  std_logic;
            clk_out : out std_logic);
end;

architecture synth of clock is

    constant sec : integer range 0 to 50000000 := 50000000;
    signal new_clock : std_logic;
    
begin

    process(clk_in)
    
        variable counter : integer := 0;
        
    begin
    
        if rising_edge(clk_in) then
            if (counter < sec) then
                counter := counter + 1;
            else
                counter := 0;
                new_clock <= not new_clock;
            end if;
        end if;
        
    end process;
    
    clk_out <= new_clock;
    
end;