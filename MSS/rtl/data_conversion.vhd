library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

entity data_conversion is
	port(
		resetN, clk_in : in std_logic;
		mux : in std_logic_vector(2 downto 0);
		data_in : in std_logic_vector(15 downto 0);
		data_out : out std_logic_vector(15 downto 0));
		
end data_conversion;

architecture arc_data_conversion of data_conversion is
--type state_type is (bypass, half_way, invert, full_wave, quan_2, quan_11, half, fifty);
constant size : integer := 16;


begin
	process(resetN, CLK_IN)
		variable data : std_logic_vector(size - 1 downto 0);
--		variable state : state_type;
		begin
			if resetN = '0' then
				data := conv_std_logic_vector(0, size);
			elsif rising_edge(CLK_IN) then
				case mux is
					when "000" =>  --
						data := data_in;
					when "001" =>
						if data_in < conv_std_logic_vector(0, size) then
							data := conv_std_logic_vector(0, size);
						else
							data := data_in;
						end if;
					when "010" =>
						data := conv_std_logic_vector(0, size) - data_in;
					when "011" =>
						if data_in < conv_std_logic_vector(0, size) then
							data := conv_std_logic_vector(0, size) - data_in;
						else 
							data := data_in;
						end if;
					when "100" =>
						data := data_in and "1111111111111100";
					when "101" =>
						data := data_in and "1111100000000000";
					when "110" =>
						data := conv_std_logic_vector(conv_integer(data_in) / 2, size);
					when "111" =>
						data := conv_std_logic_vector((conv_integer(data_in) * 3)/ 2, size);
				end case;
						
					
					
			end if;
			data_out <= data;
	end process;
end arc_data_conversion;
