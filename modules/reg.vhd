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

    signal r_out    : std_logic_vector(n-1 downto 0);
    signal r_temp   : std_logic_vector(n-1 downto 0);

begin

    process(clk, reset_n)
    begin
        if (reset_n = '0') then
            r_out <= (others => '0');
            r_temp <= (others => '0');
        elsif rising_edge(clk) then
            if (enable = '1') then
                r_temp <= in_data;
            end if;
        elsif falling_edge(clk) then
            r_out <= r_temp;
        end if;
    end process;

    out_data <= r_out;

end;
