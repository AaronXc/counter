library ieee;
use ieee.std_logic_1164.all;

entity JK_counter is 
	port(CLK, X, E : in std_logic;
		A, B : out std_logic);
end JK_counter;

architecture logic of JK_counter is 

--internal signals

signal lsb_j, lsb_k, msb_j, msb_k : std_logic :='0';
signal lsb, msb : std_logic :='0';
signal lsb_bar, msb_bar : std_logic :='0';
signal clr, pr : std_logic := '1';

	component JK_ff
			port(J, K, CLR, PR, CLOCK : in std_logic;
			Q, Q_bar : out std_logic);
		end component;

begin

lsb_ff : JK_ff port map(lsb_j, lsb_k,clr, pr, CLK, lsb, lsb_bar);
msb_ff : JK_ff port map(msb_j, msb_k, clr, pr, CLK, msb, msb_bar);
--CLOCK <= not CLOCK after 10 ns;

		msb_j <='1' when ((E ='1') and ((lsb='1') xnor (X='1'))) else '0';
		msb_k <='1' when ((E ='1') and ((lsb='1') xnor (X='1'))) else '0';
		lsb_j <= E;
		lsb_k <= E;
		A<=lsb;
		B<=msb;
		
end logic;