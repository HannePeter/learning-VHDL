library ieee;
use ieee.std_logic_1164.all;


entity unsigned_comparator is
    generic (
        n: integer := 8
    );
    port (
        a, b    : in  std_logic_vector(n-1 downto 0);
        eq      : out std_logic;
        lt      : out std_logic;
        gt      : out std_logic
    );
end;


architecture struct of unsigned_comparator is
begin

    eq  <= '1' when (a = b) else '0';
    lt  <= '1' when (a < b) else '0';
    gt  <= '1' when (a > b) else '0';

end;
