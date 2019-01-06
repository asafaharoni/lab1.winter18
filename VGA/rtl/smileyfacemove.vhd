library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- Alex Grinshpun March 24 2017 
-- Dudy Nov 13 2017


entity smileyfacemove is
port 	(
		CLK				: in std_logic; --						//	27 MHz
		RESETn			: in std_logic; --			//	50 MHz
		timer_done		: in std_logic;
		enable 			: in std_logic;
		upKey, downKey, rightKey, leftKey : in std_logic;
		ObjectStartX	: out integer ;
		ObjectStartY	: out integer
		
	);
end smileyfacemove;

architecture behav of smileyfacemove is 

constant StartX : integer := 580;   -- starting point
constant StartY : integer := 385;   
constant step : integer := 1;   


signal ObjectStartX_t : integer range 0 to 640;  --vga screen size 
signal ObjectStartY_t : integer range 0 to 480;
begin


		process ( RESETn,CLK)
		begin
		  if RESETn = '0' then
				ObjectStartX_t	<= StartX;
				ObjectStartY_t	<= StartY ;
		elsif rising_edge(CLK) and enable = '1' then
			if timer_done = '1' then
				if upKey = '1' and downKey = '0' then
					ObjectStartY_t <= ObjectStartY_t - step;
				elsif downKey = '1' and upKey = '0'  then
					ObjectStartY_t <= ObjectStartY_t + step;
				end if;
				if leftKey = '1' and rightKey = '0' then
					ObjectStartX_t <= ObjectStartX_t - step;
				elsif rightKey = '1' and leftKey = '0' then
					ObjectStartX_t <= ObjectStartX_t + step;
				end if;
			end if;			
		end if;
		end process ;
ObjectStartX	<= ObjectStartX_t;		-- copy to outputs 	
ObjectStartY	<= ObjectStartY_t;	


end behav;