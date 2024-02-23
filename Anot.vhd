library ieee;
use ieee.std_logic_1164.all;

entity Anot is
    generic
    (
        size: Integer := 4
    );

    port
    (

        v:      in std_logic_vector(3 downto 0);
        aanot:   out std_logic_vector(3 downto 0)
              
    );

end entity;
architecture behavioral of Anot is
   
    signal si_not: std_logic_vector(size - 1 downto 0); 

begin 
   
        
	    op_of_not: for i in 0 to 3 generate
        si_not(i) <= v(i) xor '1';
        end generate;

    aanot<=si_not;

end architecture;