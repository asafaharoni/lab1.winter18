LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

ENTITY addr_counter IS
GENERIC ( COUNT_SIZE		: INTEGER := 3);
PORT (
			CLK_IN			:	IN	STD_LOGIC;	
			resetN			:	IN	STD_LOGIC;
			en					: 	in  std_logic ;
			en1				: 	in  std_logic ;
			addr				: 	out std_logic_vector(COUNT_SIZE - 1 downto 0)
		);

END addr_counter;


	
architecture addr_counter_arch of 		addr_counter is
constant count_limit : std_logic_vector(COUNT_SIZE - 1 downto 0) := ( others => '1'); -- max value 
begin
	process(CLK_IN, resetN)
		variable ticks : std_logic_vector(COUNT_SIZE - 1 downto 0);
		begin
			if resetN = '0' then
				ticks := conv_std_logic_vector(0, COUNT_SIZE);
			elsif rising_edge(CLK_IN) and en = '1' and en1 = '1' then
				ticks := ticks + 1;
			end if;
			addr <= ticks;
	end process;
end addr_counter_arch ;