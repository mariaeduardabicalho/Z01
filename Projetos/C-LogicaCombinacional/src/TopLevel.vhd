--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br 
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de 
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		a : in std_logic;
		b : in std_logic;
		c : in std_logic;

		q : out std_logic);
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is
begin
 
	q <= not a or (b and c);

end rtl;
