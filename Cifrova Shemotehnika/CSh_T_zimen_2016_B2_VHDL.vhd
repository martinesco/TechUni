-- VARIANT B2_П, ZIMNA POPRAVKA 2017
-- D trigger s asinhronen RESET(aktivno visoko) i rabota po zaden front
library ieee;
use ieee.std_logic_1164.all;
entity FF_REP is
	port(
		RST: in std_logic;
		CLK_M: in std_logic;
		D_IN: in std_logic;
		Q_POS: out std_logic;
		Q_NEG: out std_logic;
		);
end FF_REP;

architecture behav of FF_REP is
begin
	process
	begin
		if RST = '0' then
			if (clk'event AND clk='0') then
				Q_POS <= D_IN after 4ns;
				Q_NEG <= NOT(D_IN) after 11ns;
			end if;
		end if;
		wait on CLK_M, RST;
	end process;
end behav;