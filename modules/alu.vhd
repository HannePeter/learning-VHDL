library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;    -- is needed for and_reduce()


entity alu is
    generic (
        n: integer := 8
    );
    port (
        a, b    : in  std_logic_vector(n-1 downto 0);   -- Data inputs
        s       : in  std_logic_vector(1 downto 0);     -- ALU control
        y       : out std_logic_vector(n-1 downto 0);   -- Data output
        flag_N  : out std_logic;                        -- FLAG negative result
        flag_Z  : out std_logic;                        -- FLAG result is zero
        flag_C  : out std_logic;                        -- FLAG carry
        flag_V  : out std_logic                         -- FLAG overflow
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

    signal r_b_inv   : std_logic_vector(n-1 downto 0);
    signal r_in_b    : std_logic_vector(n-1 downto 0);
    signal r_sum     : std_logic_vector(n-1 downto 0);
    signal r_carry   : std_logic;
    signal r_and     : std_logic_vector(n-1 downto 0);
    signal r_or      : std_logic_vector(n-1 downto 0);
    signal r_out_inv : std_logic_vector(n-1 downto 0);
    signal r_out     : std_logic_vector(n-1 downto 0);

begin

----Signals:
    r_b_inv   <= not b;
    r_and     <= a and b;
    r_or      <= a or b;
    r_out_inv <= not r_out;
    y         <= r_out;

----Main components
    mux2_0 : mux2
    generic map (
        n => n
    )
    port map (
        x0 => b,
        x1 => r_b_inv,
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
        sum   => r_sum,
        out_c => r_carry
    );

    mux4_0 : mux4
    generic map (
        n => n
    )
    port map (
        x0 => r_sum,
        x1 => r_sum,
        x2 => r_and,
        x3 => r_or,
        s  => s,
        y  => r_out
    );

----Flags
    flag_N <= r_out(n-1);
    --flag_Z <= and r_out_inv;                                                  -- should work with VHDL2008, but doesnt in quartus prime
    flag_Z <= and_reduce(r_out_inv);
    flag_C <= not s(1) and r_carry;
    flag_V <= not s(1) and (a(n-1) xnor b(n-1)) and (r_out(n-1) xor a(n-1));    -- arithmetic AND same op sign AND different sum sign

end;

