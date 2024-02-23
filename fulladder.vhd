library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port
	(
		x, y, cin:  in std_logic;
		sum, cout: out std_logic
	);
end entity;

architecture behavioral of fulladder is

	
begin
	sum <= x xor y xor cin;
	cout <= (x and y) or (y and cin) or (x and cin);
	
end architecture;
