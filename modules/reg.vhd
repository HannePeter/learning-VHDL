library ieee;
use ieee.std_logic_1164.all;


entity reg is
    generic (
       n : integer := 8 
    );
    port (
        clk      : in  std_logic;
        reset_n  : in  std_logic;
        enable   : in  std_logic;
        in_data  : in  std_logic_vector(n-1 downto 0);
        out_data : out std_logic_vector(n-1 downto 0)
    );
end;


architecture behave of reg is

    signal r_temp   : std_logic_vector(n-1 downto 0);

begin

    process(clk, reset_n)                   -- first (input) FF, loaded with pos clk edge
    begin
        if (reset_n = '0') then
            r_temp <= (others => '0');
        elsif rising_edge(clk) then
            if (enable = '1') then
                r_temp <= in_data;
            end if;
        end if;
    end process;

    process(clk, reset_n)                   -- second (output) FF, loaded with neg clk edge
    begin
        if (reset_n = '0') then
            out_data <= (others => '0');
        elsif falling_edge(clk) then
            out_data <= r_temp;
        end if;
    end process;

end;
