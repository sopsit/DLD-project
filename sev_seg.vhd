library ieee;
use ieee.std_logic_1164.all; 

entity seg7 is
  port 
  (

        num : in std_logic_vector(3 downto 0); 
        leds : out std_logic_vector(1 to 7)
     
  ); 
end seg7;

  architecture behavioral of seg7 is 
    begin

      process (num)
      begin
          if (num= "0000")    then
            leds<= "1111110";

          elsif (num= "0001")  then
            leds<= "0110000";

          elsif (num= "0010") then
            leds<= "1101101";

          elsif (num= "0011")  then
            leds<= "1111001";

          elsif(num= "0100" ) then
            leds<= "0110011";

          elsif(num= "0101") then
            leds<= "1011011";

          elsif( num= "0110") then
            leds<= "1011111";

          elsif(num= "0111") then
            leds<= "1110000";

          elsif(num="1000") then
            leds<= "1111111";

          elsif(num= "1001") then
            leds<= "1111011";

          elsif(num="1010") then
            leds<= "1110111";

          elsif(num="1011") then--
            leds<= "0011111";

          elsif(num="1100") then
            leds<= "1001110";

          elsif( num="1101") then
            leds<= "0111101";

          elsif( num="1110") then
            leds<= "1001111";

          elsif( num="1111") then
            leds<= "1000111";
              
          else
          leds<="0000000";
          end if;
      end process;


    end architecture;
               
