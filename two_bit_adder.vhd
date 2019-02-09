-- from exercise 3.34

library ieee;
use ieee.std_logic_1164.all;



entity two_bit_adder is
    port(   a, b        : in  std_logic_vector(1 downto 0);
            c           : in  std_logic;
            s           : out std_logic_vector(1 downto 0);
            clk 	    : in std_logic);
end;


            
architecture mix of two_bit_adder is

    signal in_buffer  : std_logic_vector(4 downto 0);
    signal out_buffer : std_logic_vector(1 downto 0);
    signal c_connection : std_logic;
    signal c_out        : std_logic;
    
    component fulladder is
        port(   a, b, cin : in  std_logic;
                s, cout   : out std_logic);
    end component;

begin

    adder1: fulladder
    port map ( a    => in_buffer(1),
               b    => in_buffer(2),
               cin  => in_buffer(0),
               s    => out_buffer(0),
               cout => c_connection);
    
    adder2: fulladder
    port map ( a    => in_buffer(3),
               b    => in_buffer(4),
               cin  => c_connection,
               s    => out_buffer(1),
               cout => c_out);
    
    process(clk)
    begin
    
        if rising_edge(clk) then
            in_buffer(0) <= c;
            in_buffer(1) <= a(0);
            in_buffer(2) <= b(0);
            in_buffer(3) <= a(1);
            in_buffer(4) <= b(1);
            
            s <= out_buffer;
        end if;
        
    end process;
                        
end;