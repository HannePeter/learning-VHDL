library ieee;
use ieee.std_logic_1164.all;


entity jk_flipflop is
    port (
        clk  : in  std_logic;
        j, k : in  std_logic;
        q    : out std_logic
    );
end;


architecture behave of jk_flipflop is

    signal r_out    : std_logic;

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (j = '1' and k = '0') then
                r_out <= '1';
            elsif (j = '0' and k = '1') then
                r_out <= '0';
            elsif (j = '1' and k = '1') then
                r_out <= not r_out;
            end if;
        end if;
    end process;

    q <= r_out;

end;
