library ieee;
use ieee.std_logic_1164.all;

entity decoder2_4 is
    port(   s : in std_logic_vector(1 downto 0);
            y0, y1, y2, y3 : out std_logic);
end;

architecture dataflow of decoder2_4 is
begin

    y0 <= not s(1) and not s(0);
    y1 <= not s(1) and s(0);
    y2 <= s(1) and not s(0);
    y3 <= s(1) and s(0);
    
end;