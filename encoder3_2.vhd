library ieee;
use ieee.std_logic_1164.all;


entity encoder3_2 is
    port (
        s : in  std_logic_vector(2 downto 0);
        y : out std_logic_vector(1 downto 0)
    );
end;


architecture behave of encoder3_2 is
begin

    process(all)
    begin
        case s is
            when "001"  => y <= "01";
            when "010"  => y <= "10";
            when "100"  => y <= "11";
            when others => y <= "00";
        end case;
    end process;

end;
