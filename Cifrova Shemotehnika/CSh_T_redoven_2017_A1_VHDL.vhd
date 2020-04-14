-- REDOVEN 2017 A1
-- parallel register, N bit, sinhronen po zaden front
-- nisko nivo na LOAD
library ieee;
use ieee.std_logic_1164.all;
entity REG_T is
	generic(
			N:integer:=15
			);
	port(
		DATA_IN: in std_logic_vector(N-1 downto 0);
		DATA_OUT: out std_logic_vector(N-1 downto 0);
		clk: in std_logic;
		LOAD: in std_logic;		
		);
end REG_T;

architecture arch of REG_T is
begin
	process(clk, LOAD)
	begin
		if (LOAD = '0') then
			if (clk'event AND clk='0') then
				DATA_OUT <= DATA_IN after 12ns;
			end if;
		end if;
		
	end process;
end arch;