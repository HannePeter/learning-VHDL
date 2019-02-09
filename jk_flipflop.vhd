library ieee;
use ieee.std_logic_1164.all;

entity jk_flipflop is
    port(   clk  : in  std_logic;
            j, k : in  std_logic;
            q    : inout std_logic);
end;

architecture synth of jk_flipflop is

    signal jk : bit_vector(1 downto 0);
    
begin

    jk <= j & k;

    process(clk)
    begin
    
        if rising_edge(clk) then
            case jk is
                when "10"   => q <= '1';
                when "01"   => q <= '0';
                when "11"   => q <= not q;
                when others =>
            end case;
        end if;
        
    end process;
    
end;