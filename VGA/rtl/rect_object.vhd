library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.std_logic_unsigned.all;
--use ieee.numeric_std.all;
--use ieee.std_logic_arith.all;
-- Alex Grinshpun April 2017
-- Dudy Nov 13 2017


entity rect_object is
port 	(
		--////////////////////	Clock Input	 	////////////////////	
	   	CLK  		: in std_logic;
		RESETn		: in std_logic;
		oCoord_X	: in integer;
		oCoord_Y	: in integer;
		drawing_request	: out std_logic ;
		mVGA_RGB 	: out std_logic_vector(7 downto 0) 
	);
end rect_object;

architecture behav of rect_object is 
	constant size : integer := 100;
	begin

	
process ( oCoord_X,oCoord_y )
   begin
		mVGA_RGB	<=  "11100011";
	if RESETn = '0' then
	    mVGA_RGB	<=  (others => '0') ; 	
		drawing_request	<=  '0' ;

	elsif rising_edge(CLK) then
		if (OCoord_X < size + size and
			OCoord_X > size and
			OCoord_Y < size + size and
			OCoord_Y > size) then 
			drawing_request	<= '1';
		else
			drawing_request <= '0';
		end if;
	end if;

  end process;

		
end behav;		
		