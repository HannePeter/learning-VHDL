library ieee;
use ieee.std_logic_1164.all;


entity gray_counter is
    port (
        clk, reset : in  std_logic;
        y          : out std_logic_vector(2 downto 0)
    );
end;


architecture fsm of gray_counter is

    signal state     : std_logic_vector(2 downto 0);
    signal nextstate : std_logic_vector(2 downto 0);

begin

    process(clk, reset)
    begin
        if (reset = '0') then
            state <= "000";
        elsif rising_edge(clk) then
            state <= nextstate;
        end if;
    end process;

    process(state)
    begin
        case (state) is
            when "000" =>  nextstate <= "001";
            when "001" =>  nextstate <= "011";
            when "011" =>  nextstate <= "010";
            when "010" =>  nextstate <= "110";
            when "110" =>  nextstate <= "111";
            when "111" =>  nextstate <= "101";
            when "101" =>  nextstate <= "100";
            when "100" =>  nextstate <= "000";
            when others => nextstate <= "000";
        end case;
    end process;

    y <= state;

end;
