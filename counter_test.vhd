library ieee;
use ieee.std_logic_1164.all;

entity counter_test is
	end counter_test;
	
architecture test of counter_test is

signal enable, x_in, t_clock, a_out, b_out : std_logic:='0';

--entity to test 
component JK_counter
				port(CLK, X, E : in std_logic;
				A, B : out std_logic);
	end component;	

begin 

counter : JK_counter port map(t_clock, x_in, enable, a_out, b_out);

--change clock with period 20 ns
t_clock<= not t_clock after 10 ns;

--"test cases" 

x_in <= '1', '0' after  100 ns, '1' after 400 ns;
enable <= '1', '0' after 45 ns, '1' after 105 ns, '0' after 165 ns, '1' after 185 ns;

end test;
