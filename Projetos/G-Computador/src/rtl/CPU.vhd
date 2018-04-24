-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: CPU.vhd
-- date: 4/4/2017

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CPU is
  port(
    clock:       in  STD_LOGIC;                        -- sinal de clock para CPU
    reset:       in  STD_LOGIC;                        -- reinicia toda a CPU (inclusive o Program Counter)
    inM:         in  STD_LOGIC_VECTOR(15 downto 0);    -- dados lidos da memória RAM
    instruction: in  STD_LOGIC_VECTOR(15 downto 0);    -- instrução (dados) vindos da memória ROM
    outM:        out STD_LOGIC_VECTOR(15 downto 0);    -- dados para gravar na memória RAM
    writeM:      out STD_LOGIC;                        -- faz a memória RAM gravar dados da entrada
    addressM:    out STD_LOGIC_VECTOR(14 downto 0);    -- envia endereço para a memória RAM
    pcout:       out STD_LOGIC_VECTOR(14 downto 0)     -- endereço para ser enviado a memória ROM
    );
end entity;

architecture arch of CPU is

  component Mux16 is
    port (
      a:   in  STD_LOGIC_VECTOR(15 downto 0);
      b:   in  STD_LOGIC_VECTOR(15 downto 0);
      sel: in  STD_LOGIC;
      q:   out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ALU is
    port (
      x,y:   in STD_LOGIC_VECTOR(15 downto 0);
      zx:    in STD_LOGIC;
      nx:    in STD_LOGIC;
      zy:    in STD_LOGIC;
      ny:    in STD_LOGIC;
      f:     in STD_LOGIC;
      no:    in STD_LOGIC;
      zr:    out STD_LOGIC;
      ng:    out STD_LOGIC;
      saida: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component Register16 is
    port(
      clock:   in std_logic;
      input:   in STD_LOGIC_VECTOR(15 downto 0);
      load:    in std_logic;
      output: out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component pc is
    port(
      clock     : in  STD_LOGIC;
      increment : in  STD_LOGIC;
      load      : in  STD_LOGIC;
      reset     : in  STD_LOGIC;
      input     : in  STD_LOGIC_VECTOR(15 downto 0);
      output    : out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

  component ControlUnit is
    port(
      instruction                 : in STD_LOGIC_VECTOR(15 downto 0);
      zr,ng                       : in STD_LOGIC;
      muxALUI_A                   : out STD_LOGIC;
      muxAM_ALU                   : out STD_LOGIC;
      muxSD_ALU                   : out STD_LOGIC;                     -- mux que seleciona entre reg. S
      zx, nx, zy, ny, f, no       : out STD_LOGIC;
      loadA, loadD, loadS, loadM, loadPC : out STD_LOGIC
      );
  end component;

  signal s_muxALUI_A: STD_LOGIC;
  signal s_muxAM_ALU: STD_LOGIC;
  signal s_muxSD_ALU: STD_LOGIC;
  signal s_zx: STD_LOGIC;
  signal s_nx: STD_LOGIC;
  signal s_zy: STD_LOGIC;
  signal s_ny: STD_LOGIC;
  signal s_f: STD_LOGIC;
  signal s_no: STD_LOGIC;
  signal s_loadA: STD_LOGIC;
  signal s_loadD: STD_LOGIC;
  signal s_loadS: STD_LOGIC;
  signal s_loadPC: STD_LOGIC;

  signal s_zr: std_logic := '0';
  signal s_ng: std_logic := '0';
  signal s_muxALUI_Aout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxAM_ALUout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_muxSDout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regAout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regDout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_regSout: STD_LOGIC_VECTOR(15 downto 0);
  signal s_ALUout: STD_LOGIC_VECTOR(15 downto 0);

  signal s_pcout: STD_LOGIC_VECTOR(15 downto 0);

begin
	muxALUI : Mux16 port map (
		a => s_ALUout,
		b => instruction,
		sel => s_muxALUI_A,
		q => s_muxALUI_Aout
		);

	muxAM : Mux16 port map (
		a => s_regAout,
		b => inM,
		sel => s_muxAM_ALU,
		q => s_muxAM_ALUout
		);

	muxSD : Mux16 port map (
		a => s_regSout,
		b => s_regDout,
		sel => s_muxSD_ALU,
		q => s_muxSDout
		);

	Aregister : Register16 port map (
		clock => clock,
		input => s_muxALUI_Aout,
		load => s_loadA,
		output => s_regAout
		);

	Sregister : Register16 port map (
		clock => clock,
		input => s_ALUout,
		load => s_loadS,
		output => s_regSout
		);

	Dregister : Register16 port map (
		clock => clock,
		input => s_ALUout,
		load => s_loadD,
		output => s_regDout
		);

	ALUS : ALU port map (
		x => s_muxSDout,
		y => s_muxAM_ALUout,
		zx => s_zx,
		nx => s_nx,
		zy => s_zy,
		ny => s_ny,
		f => s_f,
		no => s_no,
		zr => s_zr,
		ng => s_ng,
		saida => s_ALUout
		);

	pcs : pc port map (
		clock => clock,
		increment => '1',
		load => s_loadPC,
		reset => reset,
		input => s_regAout,
		output => s_pcout
		);

	ControlUnitS : ControlUnit port map (
		instruction => instruction,
		zr => s_zr,
		ng => s_ng,
		muxALUI_A => s_muxALUI_A,
		muxAM_ALU => s_muxAM_ALU,
		muxSD_ALU => s_muxSD_ALU,
		zx => s_zx,
		nx => s_nx,
		zy => s_zy,
		ny => s_ny, 
		f => s_f,
		no => s_no,
		loadA => s_loadA, 
		loadD => s_loadD, 
		loadS => s_loadS,
		loadM => writeM, 
		loadPC => s_loadPC
		);

	outM <= s_ALUout;
	addressM <= s_regAout (14 downto 0);
	pcout <= s_pcout (14 downto 0);



end architecture;