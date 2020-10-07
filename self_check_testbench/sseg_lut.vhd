library ieee;
use ieee.std_logic_1164.all;


entity sseg_lut is
    port (
        in_data     : in  std_logic_vector(3 downto 0);
        out_data    : out std_logic_vector(6 downto 0)
    );
end;


architecture lut of sseg_lut is
begin

    process(in_data)
    begin

        case in_data is
            when "0000" => out_data <= "1000000";   -- 0
            when "0001" => out_data <= "1111001";   -- 1
            when "0010" => out_data <= "0100100";   -- 2
            when "0011" => out_data <= "0110000";   -- 3
            when "0100" => out_data <= "0011001";   -- 4
            when "0101" => out_data <= "0010010";   -- 5
            when "0110" => out_data <= "0000010";   -- 6
            when "0111" => out_data <= "1111000";   -- 7
            when "1000" => out_data <= "0000000";   -- 8
            when "1001" => out_data <= "0010000";   -- 9
            when "1010" => out_data <= "0001000";   -- A
            when "1011" => out_data <= "0000011";   -- b
            when "1100" => out_data <= "1000110";   -- C
            when "1101" => out_data <= "0100001";   -- d
            when "1110" => out_data <= "0000110";   -- E
            when "1111" => out_data <= "0001110";   -- F
            when others => out_data <= "1111111";
        end case;

    end process;

end;
