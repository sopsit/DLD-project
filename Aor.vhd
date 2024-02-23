library ieee;
use ieee.std_logic_1164.all;

entity Aor is
    generic
    (
        size: Integer := 4
    );

    port
    (

        x:      in std_logic_vector(3 downto 0);
        y:      in std_logic_vector(3 downto 0);
        aaor:   out std_logic_vector(3 downto 0)
       
         
    );

end entity;
architecture behavioral of Aor is
   
    signal si_or: std_logic_vector(size - 1 downto 0); 

    begin
       
	    op_of_or: for i in 0 to 3 generate
        si_or(i) <= x(i) or y(i);
	    end generate;
    aaor<=si_or;

end architecture;