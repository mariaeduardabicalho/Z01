library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DMux2Way is
	port ( 
			a:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q0:  out STD_LOGIC;
			q1:  out STD_LOGIC);
end entity;
<<<<<<< HEAD
=======

architecture dmux2 of DMux2Way is

begin


q0 <= a and(not sel);
q1 <= a and sel;

end dmux2;
>>>>>>> 06f3d95dce78874a13468f90b615701b7df47da9
