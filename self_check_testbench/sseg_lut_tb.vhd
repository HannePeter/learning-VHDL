library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;


entity sseg_lut_tb is                           -- leere entity
end;


architecture simulation of sseg_lut_tb is

    component sseg_lut
        port (  SW   : in  std_logic_vector(3 downto 0);
                HEX0 : out std_logic_vector(6 downto 0));
    end component;
    
    signal x          : std_logic_vector(3 downto 0);
    signal y          : std_logic_vector(6 downto 0);
    signal y_expected : std_logic_vector(6 downto 0);
    signal clk, reset : std_logic;

begin

    dut: sseg_lut
    port map (x, y);                            -- instantiate device under test
    
    process
    begin
        clk <= '1'; wait for 5 ns;              -- clock
        clk <= '0'; wait for 5 ns;
    end process;
    
    process                                     -- reset at start
    begin
        reset <= '1'; wait for 27 ns;
        reset <= '0'; wait;
    end process;
    
    process                                     -- run tests
        file tv: text;
        variable L: line;
        variable vector_in:  std_logic_vector(3 downto 0);
        variable dummy:      character;
        variable vector_out: std_logic_vector(6 downto 0);
        variable vectornum: integer := 0;
        variable errors:    integer := 0;
    begin
    
        FILE_OPEN(tv, "example.tv", READ_MODE);
        
        while not endfile(tv) loop
        
            wait until rising_edge(clk);        -- change vecotor on rising edge
            readline(tv, L);
            read(L, vector_in);
            read(L, dummy);
            read(L, vector_out);
            x          <= vector_in  after 1 ns;
            y_expected <= vector_out after 1 ns;
            
            wait until falling_edge(clk);       -- check results on falling edge
            if (y /= y_expected) then
                report "Error: Test #" & integer'image(vectornum);
                errors := errors+1;
            end if;
            
            vectornum := vectornum+1;
            
        end loop;
        wait for 5 ns;
        
        if (errors = 0) then                    -- summarize result at end of simulation
            report "NO ERRORS -- " &
                   integer'image(vectornum) &
                   " tests completed successfully."
                   severity failure;
        else
            report integer'image(vectornum) &
                   " tests completed, errors = " &
                   integer'image(errors)
                   severity failure;
        end if;

    end process;
end;
