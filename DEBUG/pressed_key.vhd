 library ieee ;
use ieee.std_logic_1164.all ;

entity pressed_key is
port ( resetN : in std_logic ;
		clk : in std_logic ;
		din : in std_logic_vector (8 downto 0);
		make : in std_logic ;
		break : in std_logic ;
		key_code : in std_logic_vector(7 downto 0);
		dout : out std_logic );
end pressed_key;

architecture behavior of pressed_key is
	signal out_led: std_logic;
   type state is (IDLE, --initial state
				PRESSED);
begin
	dout <= out_led;
	
	process ( resetN , clk)
		variable present_state : state;
	begin
		if resetN = '0' then
			out_led <= '0';
			present_state := IDLE;
		elsif rising_edge(clk) then
			if (din(7 downto 0) = key_code) then 
				case present_state is
					when IDLE =>
						if make = '1' then
							out_led <= '1';
							present_state := PRESSED;
						end if;
					when PRESSED =>
						if break = '1' then
							out_led <= '0';
							present_state := IDLE;
						end if;
				end case;
			end if;
		end if;
end process;

end architecture;
