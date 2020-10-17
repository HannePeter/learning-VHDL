library ieee;
use ieee.std_logic_1164.all;


entity two_bit_adder is
    port (
        a, b    : in  std_logic_vector(1 downto 0);
        in_c    : in  std_logic;
        s       : out std_logic_vector(1 downto 0);
        out_c   : out std_logic;
        clk     : in  std_logic
    );
end;


architecture mix of two_bit_adder is

    component fulladder is
        port (
            a, b, in_c : in  std_logic;
            s, out_c   : out std_logic
        );
    end component;

    signal in_buffer    : std_logic_vector(4 downto 0);
    signal out_buffer   : std_logic_vector(2 downto 0);
    signal c_connect    : std_logic;

begin

    adder1: fulladder
    port map (
        a       => in_buffer(1),
        b       => in_buffer(2),
        in_c    => in_buffer(0),
        s       => out_buffer(0),
        out_c   => c_connect
    );

    adder2: fulladder
    port map (
        a       => in_buffer(3),
        b       => in_buffer(4),
        in_c    => c_connect,
        s       => out_buffer(1),
        out_c   => out_buffer(2)
    );

    process(clk)
    begin
        if rising_edge(clk) then
            in_buffer(0) <= in_c;
            in_buffer(1) <= a(0);
            in_buffer(2) <= b(0);
            in_buffer(3) <= a(1);
            in_buffer(4) <= b(1);

            s       <= out_buffer(1 downto 0);
            out_c   <= out_buffer(2);
        end if;
    end process;

end;
