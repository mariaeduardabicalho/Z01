library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux4Way is
	port( a, b, c, d : in STD_LOGIC;
			sel: in std_logic_vector(1 downto 0);
			q : out STD_LOGIC);
end entity;

architecture Behavioral of Mux4way is
begin
	q <= a when (sel = "00") else
		 b when (sel = "01") else
		 c when (sel = "10") else
		 d when (sel = "11");

end Behavioral;