library ieee;
use ieee.std_logic_1164.all;



entity input is
    port(
            key1, key2, key3        : in  std_logic;
            sw_bus                  : out std_logic_vector(1 downto 0)
        );
end input;



architecture behave of input is

begin

    process(key1, key2, key3)
    begin

        if      (key3 = '0') then
            sw_bus <= "11";
        elsif   (key2 = '0') then
            sw_bus <= "10";
        elsif   (key1 = '0') then
            sw_bus <= "01";
        else
            sw_bus <= "00";
        end if;

    end process;

end behave;
