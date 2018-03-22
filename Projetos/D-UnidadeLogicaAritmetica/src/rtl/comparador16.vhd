-- Elementos de Sistemas
-- by Luciano Soares
-- comparador16.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparador16 is
   port(
	     a    : in STD_LOGIC_VECTOR(15 downto 0); --entrada
       zr   : out STD_LOGIC; --saida quando a é 0
       ng   : out STD_LOGIC --saida quando a é negativa
   );
end comparador16;
--inicia a arquitetura
architecture rtl of comparador16 is

begin
	--setta a saida zr como 1 quando a é 0 e 0 quando não for
	zr <= '1' when a = "0000000000000000" else '0';
	--seta a saida ng como 1 quando a é negativo e 0 quando não for
	ng <= '1' when a(15) = '1' else '0';
	
--finaliza a arquitetura
end architecture;
