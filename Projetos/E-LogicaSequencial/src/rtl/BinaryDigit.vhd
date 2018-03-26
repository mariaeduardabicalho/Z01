-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity BinaryDigit is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture arch of BinaryDigit is
	component Mux2Way
		port(
		a,b,sel: in STD_LOGIC;
		q: out STD_LOGIC
	);
	end component;
	component FlipFlopD
		port (
		clock, d, clear, preset: in STD_LOGIC;
		q:out STD_LOGIC
	);
	end	component;

signal s1, s2: std_logic;

begin 

	c1: Mux2Way port map(s2, input, load, s1);
	c2: FlipFlopD port map(clock, s1, '0','0',s2);
	output <= s2;

end	architecture;