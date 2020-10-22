library ieee;
use ieee.std_logic_1164.all;


entity mux4 is
    generic (
        n: integer := 8
    );
    port (
        x0, x1, x2, x3  : in  std_logic_vector(n-1 downto 0);
        s               : in  std_logic_vector(1 downto 0);
        y               : out std_logic_vector(n-1 downto 0)
    );
end;


architecture bahave of mux4 is
begin

    with s select
        y <= x0 when "00",
             x1 when "01",
             x2 when "10",
             x3 when others;

end;
