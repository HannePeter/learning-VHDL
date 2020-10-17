library ieee;
use ieee.std_logic_1164.all;


entity xor4 is
    port (
        x : in  std_logic_vector(3 downto 0);
        y : out std_logic
    );
end;


architecture struct of xor4 is
begin

    y <= x(3) xor x(2) xor x(1) xor x(0);
    
end;
