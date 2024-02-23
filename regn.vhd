library ieee;
use ieee.std_logic_1164.all;

entity regn is

    port
    (

    r:              in std_logic_vector(3 downto 0);
    l,clk:          in std_logic;           
    q:              out std_logic_vector(3 downto 0)
    );

end regn;

architecture behavior of regn is
   begin

    process
    begin
        wait until clk'event and clk='1';
        if l='1' then
            q<=r;
        end if ;

    end process;
end behavior;