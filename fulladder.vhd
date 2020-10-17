library ieee;
use ieee.std_logic_1164.all;


entity fulladder is
    port (
        a, b, in_c : in  std_logic;
        s, out_c   : out std_logic
    );
end;


architecture struct of fulladder is

    signal p, g : std_logic;

begin

    p <= a xor b;
    g <= a and b;

    s <= p xor in_c;
    out_c <= g or (p and in_c);

end;
