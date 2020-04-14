-- REDOVEN 2017 B2
-- deshifrator 3->6 s ENABLE (EN) aktivno visoko nivo, 15ns zakusnenie
library ieee;
use ieee.std_logic_1164.all;
entity DEC_M is
	port(
		IN_A: in std_logic_vector(2 downto 0);
		OUT_A: out std_logic_vector(5 downto 0);
		EN: in std_logic;		
		);
end DEC_S;

architecture arch of DEC_M is
begin
	process(EN, IN_A)
	begin
		if (EN = '1') then
			case IN_A is
				when "000" => OUT_A <= "111110" after 15ns; -- izhodite sa
				when "001" => OUT_A <= "111101" after 15ns; -- aktivno nisko
				when "010" => OUT_A <= "111011" after 15ns; -- nivo
				when "011" => OUT_A <= "110111" after 15ns;
				when "100" => OUT_A <= "101111" after 15ns;
				when "101" => OUT_A <= "011111" after 15ns;
				when others => OUT_A <= "111111";
			end case;
		else OUT_A <= "111111";
		end if;
	end process;
end arch;