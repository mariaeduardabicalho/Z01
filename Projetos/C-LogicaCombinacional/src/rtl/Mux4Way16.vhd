library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;
architecture pep of Mux4Way16 is
begin
process (a,b,c,d,sel) is
begin
  if (sel(0) ='0' and sel(1) = '0') then
      q <= a;
  elsif (sel(0) ='1' and sel(1) = '0') then
      q <= b;
  elsif (sel(0) ='0' and sel(1) = '1') then
      q <= c;
  else
      q <= d;
  end if;
  
end process;
end pep;
