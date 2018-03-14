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
		SW0      : in  std_logic_vector(9 downto 0);
		SW1		: in std_logic_vector(9 downto 0);
		SW2		: in std_logic_vector(9 downto 0);
		LEDR     : out std_logic_vector(9 downto 0)
	);
		
end entity;

----------------------------
-- Implementacao do bloco -- 
----------------------------
architecture rtl of TopLevel is
--sub-module(half adder) is declared as a component before the keyword "begin".
	component And16
		port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;

	component Or16
		port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;
	
	component Not16
		port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
	end component;
--------------
-- signals
--------------
signal s1,c1,c2 : std_logic:='0';
---------------
-- implementacao
---------------
begin
	NOT1 : Not16 portmap (
			 a => SW0,
			 q => s1
			 );

	AND1 : And16 portmap (
          a => SW1,
          b => SW2,
          q => c1
        );
		
	OR1 : Or16 portmap (
          a => s1,
          b => c1,
          q => LEDR(0)
        );
 q <= LEDR(0);
end rtl;
