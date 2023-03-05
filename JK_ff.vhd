library ieee;
use ieee.std_logic_1164.all;

entity JK_ff is 
	port(J, K, CLR, PR, CLOCK : in std_logic;
			Q, Q_bar : out std_logic);
	end JK_ff;
	
architecture internal_details of JK_ff is

signal Q_int : std_logic :='0';

begin

	
	process(CLOCK, PR, CLR)
	begin 			
		if (PR='0' and CLR='1') then
			Q<='1' ;
		elsif (CLR='0' and PR='1') then
			Q<='0' ;
		elsif(CLOCK'event and CLOCK='1') then
			if (J xor K ) = '1' then
				Q_int <= J ;
			elsif(J and K) = '1' then
				Q_int <= not Q_int;
			end if;
		elsif (CLOCK'event and CLOCK = '0') then
			Q_bar<= not Q_int;
			Q<=Q_int;
		end if;
	end process;

end internal_details;