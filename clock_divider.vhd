library ieee;
use ieee.std_logic_1164.all;


entity clock_divider is
    port (
        in_clk  : in  std_logic;
        out_clk : out std_logic
    );
end;


architecture synth of clock_divider is

    constant c_end : integer range 0 to 25000000 := 25000000;
    signal r_clock : std_logic;

begin

    process(in_clk)

        variable v_counter : integer := 0;

    begin

        if rising_edge(in_clk) then
            if (v_counter < c_end) then
                v_counter := v_counter + 1;
            else
                v_counter := 0;
                r_clock <= not r_clock;
            end if;
        end if;

    end process;

    out_clk <= r_clock;

end;
