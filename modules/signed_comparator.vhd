library ieee;
use ieee.std_logic_1164.all;


entity signed_comparator is
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


architecture behave of signed_comparator is
begin

    process(all)

        variable v_eq : std_logic;
        variable v_lt : std_logic;
        variable v_gt : std_logic;

    begin

        v_eq := '0';
        v_gt := '0';
        v_lt := '0';

        if (a(n-1) = '0') and (b(n-1) = '1') then
            v_gt := '1';
        elsif (a(n-1) = '1') and (b(n-1) = '0') then
            v_lt := '1';
        else
            if (a < b) then
                v_lt := '1';
            elsif (a > b) then
                v_gt := '1';
            else
                v_eq := '1';
            end if;
        end if;

        eq <= v_eq;
        lt <= v_lt;
        gt <= v_gt;

    end process;

end;
