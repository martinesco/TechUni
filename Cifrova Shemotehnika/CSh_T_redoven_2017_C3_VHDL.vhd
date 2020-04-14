-- REDOVEN 2017 C3
-- deshifrator 3->5 s ENABLE (CS) aktivno nisko nivo, 8ns zakusnenie
-- Z sustoqnie pri neaktivni kombinacii
library ieee;
use ieee.std_logic_1164.all;
entity DEC_S is
	port(
		D_IN: in std_logic_vector(2 downto 0);
		D_OUT: out std_logic_vector(4 downto 0);
		CS: in std_logic;		
		);
end DEC_S;

architecture arch of DEC_S is
begin
	selector <= CS & D_IN; --slepva gi
	with selector select
		D_OUT <= "00000" when "1000" | "1001" | 
							  "1010" | "1011" |
							  "1100" | "1101" |
							  "1110" | "1111",
				 "00001" when "0000" after 8ns,
				 "00010" when "0001" after 8ns,
				 "00100" when "0010" after 8ns,
				 "01000" when "0011" after 8ns,
				 "10000" when "0100" after 8ns,
				 (others => 'Z') when others;
end arch;