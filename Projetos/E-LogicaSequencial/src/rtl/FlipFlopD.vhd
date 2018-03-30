library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopD is
	port(
		clock:  in std_logic;
		d:      in std_logic;
		clear:  in std_logic;
		preset: in std_logic;
		q:     out std_logic := '0'
	);
end entity;

architecture arch of FlipFlopD is
begin

	process (clock,preset,clear) begin
		if (clear = '1') then     -- zera a saída do flip flop
			q<='0';
		elsif (preset='1') then   -- coloca um na saída
			q<='1';
		elsif (rising_edge(CLOCK)) then    -- verifica se o processo foi de borda de subida
			q<=d;						   -- se for, atribui novo sinal, se não for, mantem sinal anterior
	end if;

end process;

end architecture;
