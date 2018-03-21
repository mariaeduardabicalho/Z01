-- Elementos de Sistemas
-- by Luciano Soares
-- FullAdder.vhd

-- Implementa Full Adder

Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of FullAdder is

	component HalfAdder
		port(
		a,b:         in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
	end component;

signal s1,c1,c2 : std_logic:='0' ;

begin
	HA1 : HalfAdder port map(
	a => a,
	b => b,
	soma => s1,
	vaium => c1
	);

	HA2 : HalfAdder port map(
	a => s1,
	b => c,
	soma => soma,
	vaium =>c2
	);
vaium <= c1 or c2;

end architecture;
