-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

  component Inc16
		port(
    a   :  in STD_LOGIC_VECTOR(15 downto 0);
    q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
	end component;

  component Register16
    port(
    clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0)
  );
  end component;

  component Mux16
		port(
    a:   in  STD_LOGIC_VECTOR(15 downto 0);
    b:   in  STD_LOGIC_VECTOR(15 downto 0);
    sel: in  STD_LOGIC;
    q:   out STD_LOGIC_VECTOR(15 downto 0)
	);
	end component;

signal s1, s2, v1, v2, v3: STD_LOGIC_VECTOR(15 downto 0);
signal e1: STD_LOGIC;

begin
-- If para modoificar o selecionador do mux , e a segunda entrada para que funcione para o reset e para o input
process (reset,input, v2) begin
  if reset = '1' then
    e1<= '1';
    v2<= "0000000000000000";
  else  
    e1<= load;
    v2<= input;
  end if;
end process;
--utilizacao do incrementador
  c2: Inc16 port map(v1,s2);
-- incrementar somente quando o increment tiver em 1
  v3 <= s2 when increment = '1' else
        v1;
-- utilizacao do  registrador, recebe ou output do mux ou o do inc
  c1: Register16 port map(clock,v3,'1',s1);

--mux recebe do register e (ou o input ou 0) e eh selecionado pelo reset e pelo load
  c3: Mux16 port map(s1, v2, e1, v1);
  output <= v1;

end architecture;
