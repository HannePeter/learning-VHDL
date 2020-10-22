library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        -- this works with quartus
--use ieee.numeric_std_unsigned.all;    -- this not (but should)


entity adder is
    generic (
        n: integer := 8
    );
    port (
        a, b    : in  std_logic_vector(n-1 downto 0);
        in_c    : in  std_logic;
        sum     : out std_logic_vector(n-1 downto 0);
        out_c   : out std_logic
    );
end;


architecture behave of adder is

    signal r_result : std_logic_vector(n downto 0);

begin

    r_result    <= ("0" & a) + ("0" & b) + in_c;
    sum         <= r_result(n-1 downto 0);
    out_c       <= r_result(n);

end;
