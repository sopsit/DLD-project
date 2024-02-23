library ieee;
use ieee.std_logic_1164.all;

entity Anor is
    generic
    (
        size: Integer := 4
    );

    port
    (

        x:      in std_logic_vector(3 downto 0);
        y:      in std_logic_vector(3 downto 0);
        aanor:   out std_logic_vector(3 downto 0)
       
         
    );

end entity;
architecture behavioral of Anor is
   
    signal si_nor: std_logic_vector(size - 1 downto 0); 

    begin
       
	    op_of_nor: for i in 0 to 3 generate
        si_nor(i) <= not(x(i) or y(i));
	    end generate;

    aanor<=si_nor;

end architecture;