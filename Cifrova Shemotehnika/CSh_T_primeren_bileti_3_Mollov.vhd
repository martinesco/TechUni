-- PRIMEREN OT MOLLOV 3
-- D trigger s asinhronen RESET(aktivno nisko) i rabota po zaden front
library ieee;
use ieee.std_logic_1164.all;
entity D_trig is
	port(
		rst: in std_logic;
		clk: in std_logic;
		D_IN: in std_logic;
		D_OUT: out std_logic;
		);
end D_trig;

architecture behav of D_trig is
begin
	process(clk, rst)
	begin
		if rst = '0' then D_OUT <= '0'; -- aktivno nisko nivo
		elsif (clk'event AND clk='0') then -- zaden front
		D_OUT =< D_IN;
		end if;
	end process;
end behav;