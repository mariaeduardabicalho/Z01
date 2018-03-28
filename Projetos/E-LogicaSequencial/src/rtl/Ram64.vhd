-- Elementos de Sistemas
-- by Luciano Soares
-- Ram64.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram64 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 5 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Ram64 is

component Ram8 is   -- inserindo ram8
    port(
  		clock:   in  STD_LOGIC;
  		load:    in  STD_LOGIC;
  		input:   in  STD_LOGIC_VECTOR(15 downto 0);
  		address: in  STD_LOGIC_VECTOR( 2 downto 0);
  		output:  out STD_LOGIC_VECTOR(15 downto 0)
  	);
  end component;


component Mux8Way16 is --inserindo Mux8Way16
		port(
			a,b,c,d,e,f,g,h: in STD_LOGIC_VECTOR(15 downto 0);
			sel: in STD_LOGIC_VECTOR(2 downto 0);
			q: out STD_LOGIC_VECTOR(15 downto 0)
		);
	end component;

component DMux8Way is --inserindo DMux8Way
		port(
			a: in STD_LOGIC;
			sel: in STD_LOGIC_VECTOR(2 downto 0);
			q0,q1,q2,q3,q4,q5,q6,q7: out STD_LOGIC 
		);
	end component;



signal  l0,l1,l2,l3,l4,l5,l6,l7: std_logic:='0';  --variaveis do load de cada ram8
signal  o0,o1,o2,o3,o4,o5,o6,o7: STD_LOGIC_VECTOR(15 downto 0); --variaveis do output de cada ram8

begin

		dmux: DMux8Way port map(load, address(5 downto 3), l0, l1, l2, l3, l4, l5, l6, l7);  -- dmux determina para qual ram8 vai o load de acordo com o address

		-- cada ram8 recebe uma saida do dmux, sendo que uma delas contem o input load
		r0: Ram8 port map(clock, l0, input, address(2 downto 0), o0);
		r1: Ram8 port map(clock, l1, input, address(2 downto 0), o1);
		r2: Ram8 port map(clock, l2, input, address(2 downto 0), o2);
		r3: Ram8 port map(clock, l3, input, address(2 downto 0), o3);
		r4: Ram8 port map(clock, l4, input, address(2 downto 0), o4);
		r5: Ram8 port map(clock, l5, input, address(2 downto 0), o5);
		r6: Ram8 port map(clock, l6, input, address(2 downto 0), o6);
		r7: Ram8 port map(clock, l7, input, address(2 downto 0), o7);

		mux: Mux8Way16 port map(o0, o1, o2, o3, o4, o5, o6, o7, address(5 downto 3), output);  -- mux recebe as variaveis de saida de cada ram e de acordo com o address determina como output uma dessas variaveis de saida de um ram8

end architecture;