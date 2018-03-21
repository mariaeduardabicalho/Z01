-- Elementos de Sistemas
-- by Luciano Soares
-- Ram512.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram512 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 8 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;
