library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity fifo is
    generic (
        word_width  : integer := 8;
        addr_width  : integer := 8   -- fifo length = 2^addr_width
    );
    port (
        clk         : in  std_logic;
        in_data     : in  std_logic_vector(word_width-1 downto 0);
        wr          : in  std_logic;
        rd          : in  std_logic;
        out_data    : out std_logic_vector(word_width-1 downto 0);
        empty       : out std_logic;
        full        : out std_logic
    );
end;


architecture behave of fifo is

--    type mem is array(0 to (2**addr_width)-1) of unsigned(word_width-1 downto 0);
--    signal r_memory : mem;
    type mem is array(0 to (2**addr_width)-1) of std_logic_vector(word_width-1 downto 0);
    signal r_memory : mem := (others => (others => '0'));

    signal r_wrptr  : unsigned(addr_width-1 downto 0) := (others => '0');
    signal r_rdptr  : unsigned(addr_width-1 downto 0) := (others => '0');
    signal r_full   : std_logic;
    signal r_empty  : std_logic;

begin

    process(clk)
    begin
--        wait until rising_edge(clk);
        if rising_edge(clk) then
            if (wr = '1' and r_full = '0') then
--                r_memory(to_integer(r_wrptr)) <= unsigned(in_data);
                r_memory(to_integer(r_wrptr)) <= in_data;
                r_wrptr <= r_wrptr + 1;
            end if;

            if (rd  = '1' and r_empty = '0') then
--                out_data <= std_logic_vector(r_memory(to_integer(r_rdptr)));
                out_data <= r_memory(to_integer(r_rdptr));
                r_rdptr <= r_rdptr + 1;
            end if;
        end if;

    end process;

    r_full  <= '1' when r_rdptr = r_wrptr + 1 else '0';
    r_empty <= '1' when r_rdptr = r_wrptr     else '0';
    full <= r_full;
    empty <= r_empty;

end;

