 library ieee ;
use ieee.std_logic_1164.all ;

entity LEFT_SHIFT is
port ( resetN : in std_logic ;
		clk : in std_logic ;
		din : in std_logic_vector (8 downto 0);
		make : in std_logic ;
		break : in std_logic ;
		key_code : in std_logic_vector(7 downto 0);
		dout : out std_logic );
end LEFT_SHIFT;

architecture behavior of LEFT_SHIFT is
   constant shift_code : std_logic_Vector := "001011000"; 
	signal out_led: std_logic;
   type state is (LightOff, --initial state
				LightOn, DownOn, DownOff);
begin
	dout <= out_led;
	
	process ( resetN , clk)
		variable present_state : state;
	begin
		if resetN = '0' then
			out_led <= '0';
			present_state := LightOff;
		elsif rising_edge(clk) then
			if (din(7 downto 0) = key_code) then 
				case present_state is
					when LightOff =>
						if make = '1' then
							out_led <= '1';
							present_state := DownOn;
						end if;
					when LightOn =>
						if make = '1' then
							out_led <= '0';
							present_state := DownOff;
						end if;
					when DownOn =>
						if break = '1' then
							present_state := LightOn;
						end if;
					when DownOff =>
						if break = '1' then
							present_state := LightOff;
						end if;
				end case;
			end if;
		end if;
end process;

end architecture;