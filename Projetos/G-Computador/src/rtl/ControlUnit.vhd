-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: ControlUnit.vhd
-- date: 4/4/2017

-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity ControlUnit is
    port(
		instruction                 : in STD_LOGIC_VECTOR(15 downto 0);  -- instrução para executar
		zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
		muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre instrução e ALU para reg. A
		muxAM_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
		muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S e reg. D
		zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
		loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC               -- sinais de load do reg. A, reg. D,
                                                                     -- Mem. RAM e Program Counter
    );
end entity;

architecture arch of ControlUnit is

signal b15 : std_logic;
begin
b15 <= instruction(15);

-- Sinais de controle
zx <= b15 and instruction(12);
nx <= b15 and instruction(11);
zy <= b15 and instruction(10);
ny <= b15 and instruction(9);
f <= b15 and instruction(8);
no <= b15 and instruction(7);
-- Definindo seletores dos mux
muxALUI_A <= not b15;
muxAM_ALU <= b15 and instruction(14);
muxSD_ALU <= b15 and not instruction(13);
-- Definindo instrucoes ao load
loadA <= (b15 and instruction(6)) or (not instruction(15));
loadS <= b15 and instruction(5);
loadD <= b15 and instruction(4);
loadM <= b15 and instruction(3);
-- Carrega comandos no PC
loadPC <= ((instruction(2) and ng) or 
		(instruction(1) and zr) or 
		(instruction(0) and (not zr) and (not ng))) and 
		instruction(15);



end architecture;
