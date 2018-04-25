-- Elementos de Sistemas
-- developed by Luciano Soares
-- 1 tb_ControlUnit.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_ControlUnit is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_ControlUnit is


  component ControlUnit is
      port(
        instruction                 : in STD_LOGIC_VECTOR(15 downto 0);  -- instrução para executar
        zr,ng                       : in STD_LOGIC;                      -- valores zr(se zero) e ng(se negativo) da ALU
        muxALUI_A                   : out STD_LOGIC;                     -- mux que seleciona entre instrução e ALU para reg. A
        muxAM_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. A e Mem. RAM para ALU
        muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S
        zx, nx, zy, ny, f, no       : out STD_LOGIC;                     -- sinais de controle da ALU
        loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC                      -- sinais de load do reg. A, reg. D, Mem. RAM e Program Counter
        );
  end component;

	signal clk : std_logic := '0';
  signal instruction                 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  signal zr,ng                       : STD_LOGIC := '0';
  signal muxALUI_A                   : STD_LOGIC := '0';
  signal muxAM_ALU                   : STD_LOGIC := '0';
  signal muxSD_ALU                   : STD_LOGIC := '0';
  signal zx, nx, zy, ny, f, no       : STD_LOGIC := '0';
  signal loadA, loadD, loadS, loadM, loadPC : STD_LOGIC := '0';

begin

	uCU: ControlUnit port map(instruction, zr, ng, muxALUI_A, muxAM_ALU, muxSD_ALU, zx, nx, zy, ny, f, no, loadA, loadD, loadS, loadM, loadPC);

	clk <= not clk after 100 ps;

  main : process
    begin
    test_runner_setup(runner, runner_cfg);

		-- Teste: A instruction
    instruction <= '0' & "111111111111111";
    wait until clk = '1';
		assert(loadA = '1' and loadD = '0' and loadM = '0' and loadPC = '0' and muxALUI_A = '1')
      report "Falha em leaw 0xFFFF, %A" severity error;

		-- leaw %5, %A
    instruction <= '0' & "111111111111111";
    wait until clk = '1';
		assert(loadA = '1' and loadD = '0' and loadM = '0' and loadPC = '0' and muxALUI_A = '1')
      report "Falha em leaw 5, %A" severity error;

    -----------------------------------------------
    -- Zero na saida da ALU gravando
    ----------------------------------------------
    -- mov 0 -> D
    instruction <= '1' & "00" & "101010" & "0010" & "000";
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '1' and loadS = '0' and loadM  = '0' and  loadPC = '0' and
           zx = '1' and nx = '0' and zy = '1' and ny = '0' and f = '1' and no = '0')
      report " **Falha** mov %0, %D " severity error;

    -- mov S -> A
    instruction <= '1' & "01" & "001100" & "1000" & "000";
    wait until clk = '1';
    assert(loadA  = '1' and loadD  = '0' and loadS = '0' and loadM  = '0' and  loadPC = '0' and
           muxALUI_A = '0' and
           zx = '0' and nx = '0' and zy = '1' and ny = '1' and f = '0' and no = '0')
      report " **Falha** mov %S, %A " severity error;

    -- mov (%A) -> D
    instruction <= '1' & "10" & "110000" & "0010" & "000";
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '1' and loadS = '0' and loadM  = '0' and  loadPC = '0' and
           zx = '1' and nx = '1' and zy = '0' and ny = '0' and f = '0' and no = '0')
      report " **Falha** mov (%A), %D " severity error;

    -- mov 0 -> (A)
    instruction <= '1' & "00" & "101010" & "0001" & "000";
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '0' and loadS = '0' and loadM  = '1' and  loadPC = '0' and
           zx = '1' and nx = '0' and zy = '1' and ny = '0' and f = '1' and no = '0')
      report " **Falha** mov %0, %(A) " severity error;

    -----------------------------------------------
    -- ULA mem
    ----------------------------------------------
    -- mov $0, %D, %S, %A
    instruction <= '1' & "00" & "111111" & "1110" & "000";
    wait until clk = '1';
    assert(loadA  = '1' and loadD  = '1' and loadS = '1' and loadM  = '0' and  loadPC = '0' and
           zx = '1' and nx = '1' and zy = '1' and ny = '1' and f = '1' and no = '1')
      report " **Falha** mov %0, %D, %S, %A " severity error;

    -- add %S, %A -> %D
    instruction <= '1' & "01" & "000010" & "0010" & "000";
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '1' and loadS = '0' and loadM  = '0' and  loadPC = '0' and
           zx = '0' and nx = '0' and zy = '0' and ny = '0' and f = '1' and no = '0')
      report " **Falha** add %S, %A, %D " severity error;

    -- subw %S, (%A) -> %S
    instruction <= '1' & "11" & "010011" & "0100" & "000";
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '0' and loadS = '1' and loadM  = '0' and  loadPC = '0' and
           zx = '0' and nx = '1' and zy = '0' and ny = '0' and f = '1' and no = '1')
      report " **Falha** subw %S, %D " severity error;

    -----------------------------------------------
    -- JMP
    ----------------------------------------------
    -- JMP
    instruction <= '1' & "00" & "000000" & "0000" & "111";
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '0' and loadS = '0' and loadM  = '0' and  loadPC = '1')
      report " **Falha** em jmp " severity error;

    -- jne %D 
    instruction <= '1' & "00" & "001100" & "0000" & "101";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '0' and loadS = '0' and loadM  = '0' and  loadPC = '1')
      report " **Falha** em jne %D" severity error;

    -- jne %D Falso
    instruction <= '0' & "00" & "001100" & "0000" & "101";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(loadA  = '1' and loadD  = '0' and loadS = '0' and loadM  = '0' and  loadPC = '0')
      report " **Falha** em jne %D" severity error;

    -- jne %D : salta nao
    instruction <= '1' & "00" & "001100" & "0000" & "101";
    zr <= '1';  ng <= '0';
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '0' and loadS = '0' and loadM  = '0' and  loadPC = '0' and
           zx = '0' and nx = '0' and zy = '1' and ny = '1' and f = '0' and no = '0')
      report " **Falha** em jne %D" severity error;

    -- jge %D : Nao salta
    instruction <= '1' & "00" & "001100" & "0000" & "001";
    zr <= '0';  ng <= '1';
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '0' and loadS = '0' and loadM  = '0' and  loadPC = '0' and
           zx = '0' and nx = '0' and zy = '1' and ny = '1' and f = '0' and no = '0')
      report " **Falha** em jge %D falso" severity error;

    -- jge %S :  salta
    instruction <= '1' & "01" & "001100" & "0000" & "001";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(loadA  = '0' and loadD  = '0' and loadS = '0' and loadM  = '0' and  loadPC = '1' and
           zx = '0' and nx = '0' and zy = '1' and ny = '1' and f = '0' and no = '0')
      report " **Falha** em jge %D" severity error;



    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
