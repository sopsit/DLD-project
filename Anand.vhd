library ieee;
use ieee.std_logic_1164.all;

entity Anand is
    generic
    (
        size: Integer := 4
    );

    port
    (

        x:      in std_logic_vector(3 downto 0);
        y:      in std_logic_vector(3 downto 0);
        aanand:   out std_logic_vector(3 downto 0)
       
         
    );

end entity;
architecture behavioral of Anand is
   
    signal si_nand: std_logic_vector(size - 1 downto 0); 

    begin
       
	    op_of_nand: for i in 0 to 3 generate
        si_nand(i) <= not(x(i) and y(i));
	    end generate;

        aanand<=si_nand;

end architecture;