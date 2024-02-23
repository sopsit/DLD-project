library ieee;
use ieee.std_logic_1164.all;

entity Aand is
    generic
    (
        size: Integer := 4
    );

    port
    (

        x:      in std_logic_vector(3 downto 0);
        y:      in std_logic_vector(3 downto 0);
        aaand:   out std_logic_vector(3 downto 0)
       
         
    );

end entity;
architecture behavioral of Aand is
   
    signal si_and: std_logic_vector(size - 1 downto 0); 

    begin
       
	    op_of_and: for i in 0 to 3 generate
        si_and(i) <= (x(i) and y(i));
	    end generate;

        aaand<=si_and;

end architecture;