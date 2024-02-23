library ieee;
use ieee.std_logic_1164.all;

entity ALU is
    generic
    (
        size: Integer := 4
    );

    port
    (
        x:      in std_logic_vector(3 downto 0);
        y:      in std_logic_vector(3 downto 0);
        sum:    out std_logic_vector(3 downto 0)
       
    );

end entity;

architecture behavioral of ALU is
    component fulladder is
        port
        (
            x, y, cin:             in std_logic;
            cout, sum:       out std_logic 
        );
    end component;

    signal si_carry: std_logic_vector(size downto 0);
    signal si_sum: std_logic_vector(size - 1 downto 0);
    --signal c: std_logic_vector(size - 1 downto 0); 

begin 
	

adder_generator: for i in 0 to size - 1 generate
    adder_portmap: fulladder port map
    (
        x => x(i),
        y => y(i),
        cin => si_carry(i),
        sum => si_sum(i),
        cout => si_carry(i + 1)
    );
end generate;
   
    si_carry(0) <= '0';
	sum        <= si_sum;
	--cout       <= si_carry(size);
    

end architecture;