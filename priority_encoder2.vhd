library ieee;
use ieee.std_logic_1164.all;


entity priority_encoder2 is
    port (
        x    : in  std_logic_vector(7 downto 0);
        y, z : out std_logic_vector(2 downto 0);
        none : out std_logic
    );
end;


architecture synth of priority_encoder2 is
begin

    process(all)
    begin
        case? x is
            when "00000000" => y <= "000"; none <= '1';
            when "00000001" => y <= "000"; none <= '0';
            when "0000001-" => y <= "001"; none <= '0';
            when "000001--" => y <= "010"; none <= '0';
            when "00001---" => y <= "011"; none <= '0';
            when "0001----" => y <= "100"; none <= '0';
            when "001-----" => y <= "101"; none <= '0';
            when "01------" => y <= "110"; none <= '0';
            when "1-------" => y <= "111"; none <= '0';
            when others     => y <= "000"; none <= '0';
        end case?;

        case? x is
            when "00000011" => z <= "000";
            when "00000101" => z <= "000";
            when "00001001" => z <= "000";
            when "00010001" => z <= "000";
            when "00100001" => z <= "000";
            when "01000001" => z <= "000";
            when "10000001" => z <= "000";
            when "0000011-" => z <= "001";
            when "0000101-" => z <= "001";
            when "0001001-" => z <= "001";
            when "0010001-" => z <= "001";
            when "0100001-" => z <= "001";
            when "1000001-" => z <= "001";
            when "000011--" => z <= "010";
            when "000101--" => z <= "010";
            when "001001--" => z <= "010";
            when "010001--" => z <= "010";
            when "100001--" => z <= "010";
            when "00011---" => z <= "011";
            when "00101---" => z <= "011";
            when "01001---" => z <= "011";
            when "10001---" => z <= "011";
            when "0011----" => z <= "100";
            when "0101----" => z <= "100";
            when "1001----" => z <= "100";
            when "011-----" => z <= "101";
            when "101-----" => z <= "101";
            when "11------" => z <= "110";
            when others     => z <= "000";
        end case?;
    end process;

end;
