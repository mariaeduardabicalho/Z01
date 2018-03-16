library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BarrelShifter8 is
	port (
			a:    in  STD_LOGIC_VECTOR(7 downto 0);   -- input vector
			dir:  in  std_logic;                       -- 0=>left 1=>right
			size: in  STD_LOGIC_VECTOR(2 downto 0);    -- shift amount
			q:    out STD_LOGIC_VECTOR(7 downto 0));  -- output vector (shifted)
end entity;
architecture Barrel of BarrelShifter8 is
begin
	q <= a when (size = "000") else
		   a(0) & a(7 downto 1) when (dir = '1' and size = "001") else
		   a(1 downto 0) & a(7 downto 2) when (dir = '1' and size = "010") else
	     a(2 downto 0) & a(7 downto 3) when (dir = '1' and size = "011") else
	     a(3 downto 0) & a(7 downto 4) when (dir = '1' and size = "100") else
		   a(6 downto 0) & a(7)  when (dir = '0' and size = "001") else
		   a(5 downto 0) & a(7 downto 6) when (dir = '0' and size = "010") else
	     a(4 downto 0) & a(7 downto 5) when (dir = '0' and size = "011") else
       a(3 downto 0) & a(7 downto 4) when (dir = '0' and size = "100");
end Barrel;
