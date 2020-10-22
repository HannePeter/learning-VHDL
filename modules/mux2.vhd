library ieee;
use ieee.std_logic_1164.all;


entity mux2 is
    generic (
        n: integer := 8
    );
    port (
        x0, x1  : in  std_logic_vector(n-1 downto 0);
        s       : in  std_logic;
        y       : out std_logic_vector(n-1 downto 0)
    );
end;


architecture struct of mux2 is
begin

    y <= x0 when s = '0' else x1;

end;
