library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use work.all;

entity TesteDisplay is

   PORT(
        -- Sistema
        CLOCK_50     : IN  STD_LOGIC;
        RESET_N      : IN  STD_LOGIC;

        -- IO
        LEDR         : OUT STD_LOGIC_VECTOR(10 downto 0);

        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC;
        LCD_ON       : OUT   STD_LOGIC
       );
end entity;


ARCHITECTURE logic OF TesteDisplay IS

component Screen is
   PORT(
		INPUT        : IN STD_LOGIC_VECTOR(15 downto 0);
		LOAD         : IN  STD_LOGIC;
		ADDRESS      : IN STD_LOGIC_VECTOR(13 downto 0);
        LCD_INIT_OK  : OUT STD_LOGIC;
		--OUTPUT : OUT STD_LOGIC_VECTOR(15 downto 0);

        -- Sistema
        CLK_FAST : IN  STD_LOGIC;
        CLK_SLOW : IN  STD_LOGIC;

        RST : IN  STD_LOGIC;
        -- LCD EXTERNAL I/OS
        LCD_CS_N     : OUT   STD_LOGIC;
        LCD_D        : INOUT STD_LOGIC_VECTOR(15 downto 0);
        LCD_RD_N     : OUT   STD_LOGIC;
        LCD_RESET_N  : OUT   STD_LOGIC;
        LCD_RS       : OUT   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
        LCD_WR_N     : OUT   STD_LOGIC
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
	end component PLL;



SIGNAL INPUT    : STD_LOGIC_VECTOR(15 downto 0) := "1111111111111111";
SIGNAL ADDRESS  : STD_LOGIC_VECTOR(13 downto 0) := "00000000000000";  -- meio 00100101101010
SIGNAL LOAD     : STD_LOGIC := '0';
SIGNAL LCD_INIT_OK : STD_LOGIC;
SIGNAL CLK_SLOW    : STD_LOGIC;
SIGNAL CLK_FAST   : STD_LOGIC;
SIGNAL RESET       : STD_LOGIC := '0';

BEGIN

DISPLAY: Screen  port map (
     INPUT       => INPUT,
		 LOAD        => LOAD,
		 ADDRESS     => ADDRESS,
     LCD_INIT_OK => LCD_INIT_OK,
		 CLK_FAST    => CLK_FAST,
		 CLK_SLOW    => CLK_SLOW,
		 RST         => RESET,
		 LCD_CS_N 	 => LCD_CS_N ,
		 LCD_D 		   => LCD_D,
		 LCD_RD_N 	 => LCD_RD_N,
		 LCD_RESET_N => LCD_RESET_N,
		 LCD_RS 	   => LCD_RS,
		 LCD_WR_N 	 => LCD_WR_N
		);

	PLL_inst : PLL PORT MAP (
        refclk   => CLOCK_50,
        rst      => '0',
        outclk_0 => CLK_FAST,
        outclk_1 => CLK_SLOW,
        locked   => OPEN
     );

process (CLK_SLOW)
variable enrola : integer := 0;
variable enrola2 : integer := 0;

begin
    if(rising_edge(CLK_SLOW)) then
        if(RESET = '1') then
            enrola  := 0;
            enrola2 := 0;
            ADDRESS <= (others => '0');
            LEDR    <= (others => '0');
        else
            if(enrola > 500) then

                    if(to_integer(unsigned( ADDRESS )) < 4800) then
                        LOAD    <= not LOAD;
                        INPUT   <= "1111111111111111";
                        ADDRESS <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned( ADDRESS )) + 1, 14));
                    else
                        LEDR <= (others => '1');
                        LOAD <= '0';
                    end if;
                    enrola2 := 0;
            end if;
            if (LCD_INIT_OK = '1') then
                enrola := enrola + 1;
            end if;
        end if;
    end if;
END PROCESS;

RESET <= not RESET_N;
LCD_ON <= '1';

END logic;
