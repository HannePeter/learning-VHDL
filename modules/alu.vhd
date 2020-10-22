library ieee;
use ieee.std_logic_1164.all;


entity alu is
    generic (
        n: integer := 4
    );
    port (
        a, b    : in  std_logic_vector(n-1 downto 0);
        s       : in  std_logic_vector(1 downto 0);
        y       : out std_logic_vector(n-1 downto 0)
    );
end;


architecture struct of alu is

    component adder
        generic (
            n: integer := 8
        );
        port (
            a, b    : in  std_logic_vector(n-1 downto 0);
            in_c    : in  std_logic;
            sum     : out std_logic_vector(n-1 downto 0);
            out_c   : out std_logic
        );
    end component;

    component mux2
        generic (
            n: integer := 8
        );
        port (
            x0, x1  : in  std_logic_vector(n-1 downto 0);
            s       : in  std_logic;
            y       : out std_logic_vector(n-1 downto 0)
        );
    end component;

    component mux4
        generic (
            n: integer := 8
        );
        port (
            x0, x1, x2, x3  : in  std_logic_vector(n-1 downto 0);
            s               : in  std_logic_vector(1 downto 0);
            y               : out std_logic_vector(n-1 downto 0)
        );
    end component;

    signal r_inv_b   : std_logic_vector(n-1 downto 0);
    signal r_in_b    : std_logic_vector(n-1 downto 0);
    signal r_out_add : std_logic_vector(n-1 downto 0);
    signal r_and     : std_logic_vector(n-1 downto 0);
    signal r_or      : std_logic_vector(n-1 downto 0);

begin

    r_inv_b <= not b;
    r_and   <= a and b;
    r_or    <= a or b;

    mux2_0 : mux2
    generic map (
        n => n
    )
    port map (
        x0 => b,
        x1 => r_inv_b,
        s  => s(0),
        y  => r_in_b
    );

    adder_0 : adder
    generic map (
        n => n
    )
    port map (
        a     => a,
        b     => r_in_b,
        in_c  => s(0),
        sum   => r_out_add,
        out_c => open
    );

    mux4_0 : mux4
    generic map (
        n => n
    )
    port map (
        x0 => r_out_add,
        x1 => r_out_add,
        x2 => r_and,
        x3 => r_or,
        s  => s,
        y  => y
    );

end;

