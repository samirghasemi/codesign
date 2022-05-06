library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity filter is
port(
   a:in std_logic_vector(7 downto 0);
   r:out std_logic_vector(15 downto 0);
   RST : in std_logic;
   CLK : in std_logic

);
end filter;


--signal declaration
architecture RTL of filter is
signal i:std_logic_vector(7 downto 0);
signal i_wire:std_logic_vector(7 downto 0);
signal acc:std_logic_vector(7 downto 0);
signal acc_wire:std_logic_vector(7 downto 0);
signal mul:std_logic_vector(7 downto 0);
signal mul_wire:std_logic_vector(7 downto 0);
signal taps0:std_logic_vector(7 downto 0);
signal taps0_wire:std_logic_vector(7 downto 0);
signal taps1:std_logic_vector(7 downto 0);
signal taps1_wire:std_logic_vector(7 downto 0);
signal taps2:std_logic_vector(7 downto 0);
signal taps2_wire:std_logic_vector(7 downto 0);
signal taps3:std_logic_vector(7 downto 0);
signal taps3_wire:std_logic_vector(7 downto 0);
signal taps4:std_logic_vector(7 downto 0);
signal taps4_wire:std_logic_vector(7 downto 0);
signal temp:std_logic_vector(7 downto 0);
signal temp_wire:std_logic_vector(7 downto 0);
signal sig_0:std_logic;
signal sig_1:std_logic;
signal sig_2:std_logic;
signal sig_3:std_logic;
signal sig_4:std_logic_vector(7 downto 0);
signal sig_5:std_logic_vector(7 downto 0);
signal sig_6:std_logic_vector(7 downto 0);
signal sig_7:std_logic_vector(15 downto 0);
signal sig_8:std_logic_vector(7 downto 0);
signal sig_9:std_logic_vector(7 downto 0);
signal r_int:std_logic_vector(15 downto 0);
signal sig_10:std_logic;


--lookup table declaration
Type rom_table_0 is Array (Natural range <>) of std_logic_vector(7 downto 0);
constant c : rom_table_0 := (B"11111111",B"00000101",B"00001010",B"00000101",
	B"11111111");
type STATE_TYPE is (s0,s1,s2,s3,s4,s5);
signal STATE:STATE_TYPE;
type CONTROL is (alwaysinit
, alwaysmaketaps
, alwaysmultiplier
, alwaysdone
, alwaysaccumulator
, alwaysmult
);
signal cmd : CONTROL;


begin
--register updates
dpREG: process (CLK,RST)
   begin
      if (RST = '1') then
         i <= (others=>'0');
         acc <= (others=>'0');
         mul <= (others=>'0');
         taps0 <= (others=>'0');
         taps1 <= (others=>'0');
         taps2 <= (others=>'0');
         taps3 <= (others=>'0');
         taps4 <= (others=>'0');
         temp <= (others=>'0');
      elsif CLK' event and CLK = '1' then
         i <= i_wire;
         acc <= acc_wire;
         mul <= mul_wire;
         taps0 <= taps0_wire;
         taps1 <= taps1_wire;
         taps2 <= taps2_wire;
         taps3 <= taps3_wire;
         taps4 <= taps4_wire;
         temp <= temp_wire;

      end if;
   end process dpREG;


--combinational logics
dpCMB: process (i,acc,mul,taps0,taps1,taps2,taps3,taps4,temp,sig_0
,sig_1,sig_2,sig_3,sig_4,sig_5,sig_6,sig_7,sig_8,sig_9,r_int
,a,cmd,STATE)
   begin
      i_wire <= i;
      acc_wire <= acc;
      mul_wire <= mul;
      taps0_wire <= taps0;
      taps1_wire <= taps1;
      taps2_wire <= taps2;
      taps3_wire <= taps3;
      taps4_wire <= taps4;
      temp_wire <= temp;
      sig_0 <= '0';
      sig_1 <= '0';
      sig_2 <= '0';
      sig_3 <= '0';
      sig_4 <= (others=>'0');
      sig_5 <= (others=>'0');
      sig_6 <= (others=>'0');
      sig_7 <= (others=>'0');
      sig_8 <= (others=>'0');
      sig_9 <= (others=>'0');
      r_int <= (others=>'0');
      r <= (others=>'0');



      case cmd is
         when alwaysinit =>
            r <= r_int;
            r_int <= conv_std_logic_vector(signed(acc),16);
            taps0_wire <= conv_std_logic_vector(1,8);
            taps1_wire <= conv_std_logic_vector(2,8);
            taps2_wire <= conv_std_logic_vector(3,8);
            taps3_wire <= conv_std_logic_vector(4,8);
            taps4_wire <= conv_std_logic_vector(5,8);
            i_wire <= conv_std_logic_vector(0,8);
            acc_wire <= conv_std_logic_vector(0,8);
         when alwaysmaketaps =>
            r <= r_int;
            r_int <= conv_std_logic_vector(signed(acc),16);
            taps4_wire <= a;
            taps3_wire <= taps4;
            taps2_wire <= taps3;
            taps1_wire <= taps2;
            taps0_wire <= taps1;
            mul_wire <= conv_std_logic_vector(0,8);
         when alwaysmultiplier =>
            r <= r_int;
            r_int <= conv_std_logic_vector(signed(acc),16);
            if (signed(i) = 0) then
               sig_0 <= '1';
            else
               sig_0 <= '0';
            end if;
            if (signed(i) = 1) then
               sig_1 <= '1';
            else
               sig_1 <= '0';
            end if;
            if (signed(i) = 2) then
               sig_2 <= '1';
            else
               sig_2 <= '0';
            end if;
            if (signed(i) = 3) then
               sig_3 <= '1';
            else
               sig_3 <= '0';
            end if;
            if (sig_3 = '1') then
               sig_4 <= taps3;
            else
               sig_4 <= taps4;
            end if;
            if (sig_0 = '1') then
               sig_5 <= taps0;
            elsif (sig_1 = '1') then
               sig_5 <= taps1;
            elsif (sig_2 = '1') then
               sig_5 <= taps2;
            else
               sig_5 <= sig_4;
            end if;
            temp_wire <= sig_5;
         when alwaysdone =>
            r <= r_int;
            r_int <= conv_std_logic_vector(signed(acc),16);
         when alwaysaccumulator =>
            r <= r_int;
            r_int <= conv_std_logic_vector(signed(acc),16);
            sig_9 <= signed(mul) + signed(acc);
            acc_wire <= sig_9;
         when alwaysmult =>
            r <= r_int;
            r_int <= conv_std_logic_vector(signed(acc),16);
            sig_6 <= c(conv_integer(unsigned(i)));
            sig_7 <= signed(temp) * signed(sig_6);
            sig_8 <= signed(i) + signed(conv_std_logic_vector(1,8));
            mul_wire <= sig_7(7 downto 0);
            i_wire <= sig_8;
         when others=>
      end case;
   end process dpCMB;


--controller reg
fsmREG: process (CLK,RST)
   begin
      if (RST = '1') then
         STATE <= s0;
      elsif CLK' event and CLK = '1' then
         STATE <= STATE;
         case STATE is
            when s0 => 
                    STATE <= s1;
            when s1 => 
                    STATE <= s2;
            when s2 => 
               if (sig_10 = '1') then
                       STATE <= s5;
               else
                       STATE <= s4;
               end if;
            when s3 => 
                    STATE <= s2;
            when s4 => 
                    STATE <= s0;
            when s5 => 
                    STATE <= s3;
            when others=>
         end case;
      end if;
   end process fsmREG;


--controller cmb
fsmCMB: process (i,acc,mul,taps0,taps1,taps2,taps3,taps4,temp,sig_0
,sig_1,sig_2,sig_3,sig_4,sig_5,sig_6,sig_7,sig_8,sig_9,r_int
,sig_10,a,cmd,STATE)
   begin
   sig_10 <= '0';
   if (signed(i) < 5) then
      sig_10 <= '1';
   else
      sig_10 <= '0';
   end if;
   cmd <= alwaysinit;
   case STATE is
      when s0 => 
              cmd <= alwaysinit;
      when s1 => 
              cmd <= alwaysmaketaps;
      when s2 => 
         if (sig_10 = '1') then
                 cmd <= alwaysmultiplier;
         else
                 cmd <= alwaysdone;
         end if;
      when s3 => 
              cmd <= alwaysaccumulator;
      when s4 => 
              cmd <= alwaysinit;
      when s5 => 
              cmd <= alwaysmult;
      when others=>
      end case;
end process fsmCMB;
end RTL;
