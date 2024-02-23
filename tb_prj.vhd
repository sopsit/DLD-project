library ieee;
use ieee.std_logic_1164.all;

entity tb_prj is
end entity;

architecture behavior of tb_prj is

	component reg is
		port
    (

        data:             in std_logic_vector(3 downto 0);
        clk,reset:     	  in std_logic;
        --rinExt:           in std_logic_vector(3 downto 0);
        done:             out std_logic;
        buswires:         inout std_logic_vector(3 downto 0)

    );
	end component;
	signal 	clk_tb:   		std_logic ;
	signal 	reset_tb: 		std_logic:='0' ;
	signal 	data_tb: 		std_logic_vector(3 downto 0) :="0000";
	signal  done_tb: 		std_logic ;
	signal  buswires_tb:	std_logic_vector(3 downto 0) ;
	signal  rinExt_tb:		std_logic_vector(3 downto 0) ;
	constant cycle: time := 10 ns;
begin
	uut: reg port map (data_tb, clk_tb, reset_tb, done_tb, buswires_tb);
	process
	begin
		
		clk_tb<='0';
		wait for 5 ns;
		clk_tb<='1';
		wait for 5 ns;

	end process;

	data_tb <= "0101" after 10 ns;



	
end architecture;