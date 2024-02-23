library ieee;
use ieee.std_logic_1164.all;

entity reg is

    port
    (

        data:             in std_logic_vector(3 downto 0);
        clk,reset:        in std_logic;
       -- rinExt:           in std_logic_vector(3 downto 0);
        done:             out std_logic;
        buswires:         inout std_logic_vector(3 downto 0)

    );

end entity;
architecture structural of reg is
    component ALU is
        port
        (
            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            sum:    out std_logic_vector(3 downto 0)
        );
        end component;
    component Anor is
        port
        (
            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            aanor:   out std_logic_vector(3 downto 0)  
        );
        end component;
    component Anot is
        port
        (
            v:      in std_logic_vector(3 downto 0);
            aanot:   out std_logic_vector(3 downto 0)
           
        );
        end component;
    component Aor is
        port
        (
            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            aaor:   out std_logic_vector(3 downto 0)
           
        );
        end component;
    component Axor is
        port
        (
            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            aaxor:   out std_logic_vector(3 downto 0)
            
        );
        end component;

    component Anand is
        port
        (

            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            aanand:   out std_logic_vector(3 downto 0) 

        );
        end component;
    component Aand is
        port
        (
    
            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            aaand:   out std_logic_vector(3 downto 0)
           
             
        );
        end component;
        component Axnor is
        port
        (
    
            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            aaxnor:   out std_logic_vector(3 downto 0)
           
        );
        end component;

        component sub is
        port
         (
            x:      in std_logic_vector(3 downto 0);
            y:      in std_logic_vector(3 downto 0);
            sum:    out std_logic_vector(3 downto 0)
       
         );
        end component;
    component regn is
            port
            (
                r:              in std_logic_vector(3 downto 0);
                l, clk:          in std_logic;           
                q:              out std_logic_vector(3 downto 0)
               
            );
        end component;
    component tristate is
            port
            (
                x:              in std_logic_vector(3 downto 0);
                e:              in std_logic ;         
                f:              out std_logic_vector(3 downto 0)
                
            );
        end component;
    component seg7 is
        port 
            (

                num : in std_logic_vector(3 downto 0); 
                leds : out std_logic_vector(1 to 7)
   
            );
        end component;

    type state_type is (s0, s1, s2 , s3 , s4, s5, s6, s7, s8, s9, s10,s11, s12, s13, s14, s15, s16, s17, s18, s19, s20);
    signal extern,rin1 , rin2, rin3, rin4 : std_logic;
    signal y: state_type;
    signal rrin, rout: std_logic_vector(4 downto 1);
    signal r1, r2, r3, temp, cont, cont_temp1,cont_temp2,cont_temp3, cont_temp4 , cont_temp5, cont_temp6, cont_temp7,cont_temp8, cont_temp9 :std_logic_vector(3 downto 0):="0000";
    signal sev_seg: std_logic_vector(7 downto 1);    

begin 
	
	process (reset, clk)
    begin 
        if reset='1' then
            
            y <= s0 ;
            done<='0';

        elsif (clk'EVENT AND clk='1') then 
        case y is
            when s0  =>
                y<=s1;
            when s1=>
                y<=s2;
            when s2=>
                y<=s3;
            when s3=>
                y<=s10;
            when s4=>
                y<=s5;
            when s5=>
                y<=s12;
            when s6=>
                y<=s7;
            when s7=>
                y<=s8;
            when s8=>
                y<=s9;
            when s9=>
                y<=s14;
            when s10=>
                y<=s4;   
            when s12=>
                y<=s6;
            when s14=>
                y<=s15;
            when s15=>
                y<=s11;
            when s11=>
                y<=s13;
            when s13=>
                y<=s16;
            when s16=>
                y<=s17;
            when s17=>
                y<=s18;
            when s18=>
                y<=s19;
            when s19=>
                y<=s20;
            when s20=>
                y<=s0;
            end case;
        end if;
                extern  <='1'    when y=s1                                                 else '0';
                rrin(1) <='1'    when y=s1  or y=s6     or y=s8     or y=s0                else '0';
                rrin(2) <='1'    when y=s2  or y=s4     or y=s0                            else '0';
                rrin(3) <='1'    when y=s10 or y=s12    or y=s7     or y=s14   or y=s0 or y=s16 or y=s20 else '0';
                rrin(4) <='1'    when y=s3  or y=s5     or y=s9     or y=s11               else '0';--s12: r2->bus
                rout(1) <='1'    when y=s3  or y=s5     or y=s7     or y=s9                else '0';--s3: r1->temp
                rout(2) <='1'    when y=s10 or y=s12    or y=s14    or y=s11   or y=s5     else '0';--s10: r2 ->bus
                rout(3) <='1'    when y=s4  or y=s6     or y=s8                            else '0';
                rout(4) <='1'    when y=s10 or y=s14                                       else '0';
                cont(0) <='1'    when y=s10                                         else '0';
                cont(1) <='1'    when y=s12                                         else '0'; 
                cont(2) <='1'    when y=s14                                         else '0';
                cont(3) <='1'    when y=s7                                          else '0';  
                done    <='1'    when y=s20                                         else '0'; 
                rin1  <=      rrin(1);
                rin2  <=      rrin(2);
                rin3  <=      rrin(3);
                rin4  <=      rrin(3);
        
    end process;
    
    -- instance registers
   -- num1: regn port map (buswires, rin1, clk, r1);
   -- num2: regn port map (buswires, rin2, clk, r2);
   -- num3: regn port map (buswires, rin3, clk, r3);
   -- num4: regn port map (buswires, rin4, clk,temp);

    -- instance tri state drivers
    --tri_for_ext: tristate port map (data, extern,buswires);
    --tri1:        tristate port map (r1, rout(1), buswires);
    --tri2:        tristate port map (r2, rout(2), buswires);
    --tri3:        tristate port map (r3, rout(3), buswires);
    --***********************
    --add   
    sum_reg:     ALU      port map (temp, buswires, cont_temp1);--cont 0->add, cont 1->or, cont2 ->xor, cont 3->not
    --sub
    sub_reg:     sub      port map (temp, buswires, cont_temp9);
    --or
    get_or:      Aor      port map (temp, buswires, cont_temp2);
    --xor
    get_xor:     Axor     port map (temp, buswires, cont_temp3);
    --not
    get_not:     Anot     port map (buswires, cont_temp4);
    --nor
    get_nor:     Anor     port map (temp, buswires, cont_temp5);
    --nand
    get_nand:    Anand    port map (temp, buswires, cont_temp6);
    --and
    get_and:     Aand     port map (temp, buswires, cont_temp7);
    --xnor
    get_xnor:    Axnor    port map (temp, buswires, cont_temp8);
    -- seven segment
    show_sev_seg:seg7     port map(temp, sev_seg);

        process (y, data, r1, r2 , r3)
        begin
            if (y=s0)    then
                buswires<="0000";
            elsif (y=s1)  then
                buswires<=data;
            elsif (y=s2) then
                buswires<="0011";
            elsif (y=s3)  then
                buswires<=r1;
            elsif(y=s4) then
                buswires<=r3;
            elsif(y=s5) then
                buswires<=r1;
            elsif(y=s6) then
                buswires<=r3;
            elsif(y=s7) then
                buswires<=r1;
            elsif(y=s8) then
                buswires<=r3;
            elsif(y=s9) then
                buswires<=r1;
            elsif(y=s10) then
                buswires<=r2;
            elsif(y=s11) then
                buswires<=r2;
            elsif(y=s12) then
                buswires<=r2;
            elsif(y=s14) then
                buswires<=r2;
            else
                buswires<=data;
            end if;
        end process;
        process (y, buswires, done)
        begin
            if(y=s0) then
                done<='0';
                r1<="0000";
                r2<="0000";
                r3<="0000";
                temp<="0000";
            elsif (y=s1) then
                r1<=buswires;
            elsif (y=s2) then
                r2<=buswires;
            elsif (y=s3) then
                temp<=buswires;   
            elsif(y=s4) then 
            r3<=cont_temp1;   
                r2<=buswires;
            elsif(y=s5) then
                temp<=buswires;
            elsif(y=s6) then
                r3<=cont_temp2;
                r1<=buswires;
            elsif(y=s7) then
                r3<=cont_temp4;
            elsif(y=s8) then
                r1<=buswires;
            elsif(y=s9) then
                temp<=buswires;
            elsif(y=s11) then
                r3<=cont_temp5;
                temp<=buswires;
            elsif(y=s12) then
                r3<=cont_temp2;
            elsif(y=s15) then
                r3<=cont_temp3;
            elsif(y=s16) then
                r3<=cont_temp5;
            elsif(y=s17) then
                r3<=cont_temp6;
            elsif(y=s18) then
                r3<=cont_temp7;
            elsif(y=s19) then
                r3<=cont_temp8;
            elsif(y=s20) then
                r3<=cont_temp9;  
                done<='1';              
            end if;
        end process;

    
    --temp5<=r3;
   -- r3<= cont_temp1 when cont(0)='1' else cont_temp2 when cont(1)='1' else cont_temp3 when cont(2)='1' else cont_temp4 when cont(3)='1' else temp5;
    
    


end architecture;