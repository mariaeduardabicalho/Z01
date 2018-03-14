library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8Way16 is
	port ( 
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
end entity;

architecture pep of Mux8Way16 is
begin
process (a,b,c,d,e,f,g,h,sel) is
begin
q <= a when sel = "000";
q <= b when sel = "001";
q <= c when sel = "010";
q <= d when sel = "011";
q <= e when sel = "100";
q <= f when sel = "101";
q <= g when sel = "110";
q <= h when sel = "111";
end process;
end pep;
