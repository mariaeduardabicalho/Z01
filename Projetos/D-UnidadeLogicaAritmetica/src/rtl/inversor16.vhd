-- Elementos de Sistemas
-- by Luciano Soares
-- inversor16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use work.all;

entity inversor16 is
   port(z   : in STD_LOGIC;
	    a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
   );
end entity;

architecture rtl of inversor16 is
	component Not16
		port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

begin
  y <= a when z = '0'  -- quando o controle z = 0, a saida sera o proprio vetor

  else not a;  -- caso contrario, a saida sera o vetor de entrada invertido


end architecture;
