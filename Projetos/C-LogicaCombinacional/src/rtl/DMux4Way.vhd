library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux4Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC_VECTOR(1 downto 0);
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC;
			q2:  out STD_LOGIC;
			q3:  out STD_LOGIC);
end entity;

------------------------------------------------------
architecture rtl of DMux4Way is
begin

 q0 <= ((not sel(1)) and (not sel(0)) and a);
 q1 <= ((not sel(1)) and sel(0) and a);
 q2 <= (sel(1) and (not sel(0)) and a);
 q3 <= (sel(1) and sel(0) and a);

end rtl;
