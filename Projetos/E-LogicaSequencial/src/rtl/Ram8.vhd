-- Elementos de Sistemas
-- by Luciano Soares
-- Ram8.vhd

Library ieee; 
use ieee.std_logic_1164.all;
  
entity Ram8 is
	port(
		clock:   in  STD_LOGIC;
		input:   in  STD_LOGIC_VECTOR(15 downto 0);
		load:    in  STD_LOGIC;
		address: in  STD_LOGIC_VECTOR( 2 downto 0);
		output:  out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Ram8 is

  component Mux8Way16 is  -- inserindo mux8way16
    port(
	    a:   in  STD_LOGIC_VECTOR(15 downto 0);
	    b:   in  STD_LOGIC_VECTOR(15 downto 0);
	    c:   in  STD_LOGIC_VECTOR(15 downto 0);
	    d:   in  STD_LOGIC_VECTOR(15 downto 0);
	    e:   in  STD_LOGIC_VECTOR(15 downto 0);
	    f:   in  STD_LOGIC_VECTOR(15 downto 0);
	    g:   in  STD_LOGIC_VECTOR(15 downto 0);
	    h:   in  STD_LOGIC_VECTOR(15 downto 0);
	    sel: in  STD_LOGIC_VECTOR(2 downto 0);
	    q:   out STD_LOGIC_VECTOR(15 downto 0));
  end component;


  component DMux8Way is  --inserindo dmux8way
    port(
		a:   in  STD_LOGIC;
		sel: in  STD_LOGIC_VECTOR(2 downto 0);
		q0:  out STD_LOGIC;
		q1:  out STD_LOGIC;
		q2:  out STD_LOGIC;
		q3:  out STD_LOGIC;
		q4:  out STD_LOGIC;
		q5:  out STD_LOGIC;
		q6:  out STD_LOGIC;
		q7:  out STD_LOGIC
		);

  end component;


 component Register16 is   -- inserindo register16
    port(
    	clock:   in STD_LOGIC;
		input:   in STD_LOGIC_VECTOR(15 downto 0);
		load:    in STD_LOGIC;
		output: out STD_LOGIC_VECTOR(15 downto 0));
  end component;

signal x0, x1, x2, x3, x4, x5, x6, x7: STD_LOGIC_VECTOR(15 downto 0);  -- variaveis usadas para o output de cada register16
signal r0, r1, r2, r3, r4, r5, r6, r7: std_logic;  -- variaveis usadas para passar o load para cada register16


begin

	dmux: DMux8Way port map(         -- dmux8way define para qual register o load (a) vai de acordo com o address (sel)
		a => load,
		sel => address,
		q0 => r0,
		q1 => r1,
		q2 => r2,
		q3 => r3,
		q4 => r4,
		q5 => r5,
		q6 => r6,
		q7 => r7 
		
	);  

-- atribuindo os outputs e inputs a cada register, sendo que apenas o register que receber o load pelas variaveis r[0-7], vai sofrer alteracao

	reg1: Register16 port map(
		clock => clock,
		input => input,
		load => r0,
		output => x0
	);

	reg2: Register16 port map(
		clock => clock,
		input => input,
		load => r1,
		output => x1
	);

	reg3: Register16 port map(
		clock => clock,
		input => input,
		load => r2,
		output => x2
	);

	reg4: Register16 port map(
		clock => clock,
		input => input,
		load => r3,
		output => x3
	);

	reg5: Register16 port map(
		clock => clock,
		input => input,
		load => r4,
		output => x4
	);

	reg6: Register16 port map(
		clock => clock,
		input => input,
		load => r5,
		output => x5
	);

	reg7: Register16 port map(
		clock => clock,
		input => input,
		load => r6,
		output => x6
	);

	reg8: Register16 port map(
		clock => clock,
		input => input,
		load => r7,
		output => x7
	);
--


	mux: Mux8Way16 port map(  -- mux recebe a saida de cada register16 e de acordo com o address, libera determina como output alguma dessas variaveis recebidas dos registers
		a => x0,
		b => x1,
		c => x2,
		d => x3,
		e => x4,
		f => x5,
		g => x6,
		h => x7,
		sel => address,
		q => output
	);


	end rtl;