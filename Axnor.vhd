library ieee;
use ieee.std_logic_1164.all;

entity Axnor is
    generic
    (
        size: Integer := 4
    );

    port
    (

        x:      in std_logic_vector(3 downto 0);
        y:      in std_logic_vector(3 downto 0);
        aaxnor:   out std_logic_vector(3 downto 0)
       
    );

end entity;
architecture behavioral of Axnor is
   
    signal si_xnor: std_logic_vector(size - 1 downto 0); 

begin 
	
        op_of_xnor: for i in 0 to 3 generate
        si_xnor(i) <= not (x(i) xor y(i));
        end generate;

    aaxnor<=si_xnor;

end architecture;