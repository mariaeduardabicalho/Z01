-- Elementos de Sistemas
-- by Luciano Soares
-- Add16.vhd

-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Add16 is


component FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end component;

signal s1,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14 : std_logic:='0';


begin
-- fiz um full adder para cad bit, dessa forma somamos cada bit do a e do b com o carry da soma anterior(como se fosso uma conta que fazemos no papel)
fullader1 : FullAdder port map (  
						a => a(0),
						b => b(0),
						c => '0', -- primeiro nao possui carry
						vaium => s1,
						soma => q(0)
				);
fulladder2 : FullAdder port map(a(1),b => b(1),c => s1,vaium => c1,soma => q(1));
fulladder3 : FullAdder port map(
						a => a(2),
						b => b(2),
						c => c1,
						vaium => c2,
						soma => q(2)
					);
fulladder4 : FullAdder port map(
						a => a(3),
						b => b(3),
						c => c2,
						vaium => c3,
						soma => q(3)
					);
fulladder5 : FullAdder port map(
						a => a(4),
						b => b(4),
						c => c3,
						vaium => c4,
						soma => q(4)
					);
fulladder6 : FullAdder port map(
					  a => a(5),
						b => b(5),
						c => c4,
						vaium => c5,
						soma => q(5)
					);
fulladder7 : FullAdder port map(
						 a => a(6),
						 b => b(6),
						 c => c5,
						 vaium => c6,
						 soma => q(6)
					);
fulladder8 : FullAdder port map(
						 a => a(7),
						 b => b(7),
						 c => c6,
						 vaium => c7,
						 soma => q(7)
					 );
fulladder9 : FullAdder port map(
					 	 a => a(8),
					 	 b => b(8),
					 	 c => c7,
					 	 vaium =>c8,
					 	 soma => q(8)
					 );
fulladder10 : FullAdder port map(
					 	a => a(9),
					 	b => b(9),
					 	c => c8,
					 	vaium =>c9,
					 	soma => q(9)
					);
fulladder11 : FullAdder port map(
						 a => a(10),
						 b => b(10),
						 c => c9,
						 vaium =>c10,
				     soma => q(10)
					);
fulladder12 : FullAdder port map(
					   a => a(11),
					   b => b(11),
					   c => c10,
					   vaium =>c11,
						 soma => q(11)
					);
fulladder13 : FullAdder port map(
						a => a(12),
						b => b(12),
						c => c11,
						vaium =>c12,
					 soma => q(12)
					);
fulladder14 : FullAdder port map(
						a => a(13),
						b => b(13),
						c => c12,
						vaium =>c13,
					  soma => q(13)
					);
fulladder15 : FullAdder port map(
						a => a(14),
						b => b(14),
						c => c13,
						vaium =>c14,
						soma => q(14)
					 );
fulladder16 : FullAdder port map(
						 a => a(15),
					   b => b(15),
					   c => c14,
					   soma => q(15)
					 );


end architecture;
