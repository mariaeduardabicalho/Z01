-------------------------------------------------------------------
-- Elementos de Sistemas
-------------------------------------------------------------------
-- Luciano Pereira
-------------------------------------------------------------------
-- Descricao :
-- Entidade central do desenvolvimento do computador
-------------------------------------------------------------------
-- Historico:
--  29/11/2016 : Criacao do projeto
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Computador is

   PORT(
        -- Sistema
        CLOCK_50     : IN    STD_LOGIC;
        RESET_N      : IN    STD_LOGIC;

        -- LED e Chaves I/OS
        LEDR         : OUT   STD_LOGIC_VECTOR(9 DOWNTO 0);
        SW           : IN    STD_LOGIC_VECTOR(9 DOWNTO 0);

        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	      -- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC;
        LCD_ON       : OUT   STD_LOGIC	-- liga e desliga o LCD
       );
end entity;


ARCHITECTURE logic OF Computador IS

	component CPU is
		 port(
			  clock       :	in  STD_LOGIC;
			  inM         : in  STD_LOGIC_VECTOR(15 downto 0);
			  instruction : in  STD_LOGIC_VECTOR(15 downto 0);
			  reset       : in  STD_LOGIC;
			  outM        : out STD_LOGIC_VECTOR(15 downto 0);
			  writeM      : out STD_LOGIC;
			  addressM    : out STD_LOGIC_VECTOR(14 downto 0);
			  pcout       : out STD_LOGIC_VECTOR(14 downto 0)
	  );
	end component;

	component ROM32K IS
		port(
			address	  : IN STD_LOGIC_VECTOR (14 DOWNTO 0);
			clock	    : IN STD_LOGIC  := '1';
			q		      : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
		);
	END component;

	component MemoryIO is
		PORT(
			  -- Sistema
        CLK_SLOW : IN  STD_LOGIC;
        CLK_FAST : IN  STD_LOGIC;
			  RST      : IN  STD_LOGIC;

			  -- RAM 16K
			  ADDRESS		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
			  INPUT			: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
			  LOAD			: IN STD_LOGIC ;
			  OUTPUT	    : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);

			  -- LCD EXTERNAL I/OS
			  LCD_CS_N     : OUT   STD_LOGIC;
			  LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
			  LCD_RD_N     : OUT   STD_LOGIC;
			  LCD_RESET_N  : OUT   STD_LOGIC;
			  LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
			  LCD_WR_N     : OUT   STD_LOGIC;
			  LCD_ON       : OUT   STD_LOGIC;
			  LCD_INIT_OK  : OUT   STD_LOGIC;

			  SW  : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			  LED : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
			 );
	end component;

	component PLL is
		port (
			refclk   : in  std_logic := 'X'; -- clk
			rst      : in  std_logic := 'X'; -- reset
			outclk_0 : out std_logic;        -- clk
			outclk_1 : out std_logic;        -- clk
			locked   : out std_logic         -- export
		);
  end component;


  SIGNAL INPUT        : STD_LOGIC_VECTOR(15 downto 0) := "1111111111111111";
  SIGNAL ADDRESS      : STD_LOGIC_VECTOR(14 downto 0) := (others => '0') ; -- meio 00100101101010
  SIGNAL LOAD         : STD_LOGIC := '0';
  SIGNAL LCD_INIT_OK  : STD_LOGIC;

  SIGNAL CLK_FAST           : STD_LOGIC;
  SIGNAL CLK_SLOW           : STD_LOGIC;
  SIGNAL RST_CPU, RST_MEM   : STD_LOGIC := '1';
  SIGNAL RESET              : STD_LOGIC;
  SIGNAL PLL_LOCKED         : STD_LOGIC;

  SIGNAL OUTPUT_RAM   : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL INSTRUCTION  : STD_LOGIC_VECTOR(15 downto 0);
  SIGNAL PC			      : STD_LOGIC_VECTOR(14 downto 0);


BEGIN

	PLL_inst : PLL PORT map (
    refclk   => CLOCK_50,
    rst      => RESET,
    outclk_0 => CLK_FAST,
    outclk_1 => CLK_SLOW,
    locked   => PLL_LOCKED
     );


  -- Resets
  RST_CPU <= RESET or (not LCD_INIT_OK) or (not PLL_LOCKED); -- REINICIA CPU
	RST_MEM <= RESET or (not PLL_LOCKED);                      -- REINICIA MemoryIO
	RESET   <= NOT RESET_N;

  -- LCD on
  LCD_ON <= '1';

end logic;
