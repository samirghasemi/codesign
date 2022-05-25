library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity rsaSystem is
port(
   RST : in std_logic;
   CLK : in std_logic

);
end rsaSystem;


--signal declaration
architecture RTL of rsaSystem is
signal res1:std_logic_vector(31 downto 0);
signal res1_wire:std_logic_vector(31 downto 0);
signal res2:std_logic_vector(31 downto 0);
signal res2_wire:std_logic_vector(31 downto 0);
signal req_sig:std_logic_vector(31 downto 0);
signal ack_sig:std_logic_vector(31 downto 0);
signal result1_sig:std_logic_vector(31 downto 0);
signal result2_sig:std_logic_vector(31 downto 0);
signal ppp_sig_in:std_logic_vector(31 downto 0);
signal qqq_sig_in:std_logic_vector(31 downto 0);
signal eee_sig_in:std_logic_vector(31 downto 0);
signal ddd_sig_in:std_logic_vector(31 downto 0);
signal msg_sig_in:std_logic_vector(31 downto 0);
signal current_request:std_logic;
signal current_request_wire:std_logic;
signal done_reg:std_logic;
signal done_reg_wire:std_logic;
signal modulo_reg:std_logic;
signal modulo_reg_wire:std_logic;
signal x:std_logic_vector(31 downto 0);
signal x_wire:std_logic_vector(31 downto 0);
signal y:std_logic_vector(31 downto 0);
signal y_wire:std_logic_vector(31 downto 0);
signal p:std_logic_vector(31 downto 0);
signal p_wire:std_logic_vector(31 downto 0);
signal q:std_logic_vector(31 downto 0);
signal q_wire:std_logic_vector(31 downto 0);
signal e:std_logic_vector(31 downto 0);
signal e_wire:std_logic_vector(31 downto 0);
signal d:std_logic_vector(31 downto 0);
signal d_wire:std_logic_vector(31 downto 0);
signal n:std_logic_vector(31 downto 0);
signal n_wire:std_logic_vector(31 downto 0);
signal z:std_logic_vector(31 downto 0);
signal z_wire:std_logic_vector(31 downto 0);
signal msg:std_logic_vector(31 downto 0);
signal msg_wire:std_logic_vector(31 downto 0);
signal cipher:std_logic_vector(31 downto 0);
signal cipher_wire:std_logic_vector(31 downto 0);
signal plaint:std_logic_vector(31 downto 0);
signal plaint_wire:std_logic_vector(31 downto 0);
signal sig_0:std_logic_vector(63 downto 0);
signal sig_1:std_logic_vector(31 downto 0);
signal sig_2:std_logic_vector(31 downto 0);
signal sig_3:std_logic_vector(63 downto 0);
signal sig_4:std_logic;
signal sig_5:std_logic;
signal sig_6:std_logic;
signal sig_7:std_logic;
signal sig_8:std_logic_vector(31 downto 0);
signal sig_9:std_logic;
signal sig_10:std_logic_vector(31 downto 0);
signal sig_11:std_logic_vector(31 downto 0);
signal sig_12:std_logic;
signal sig_13:std_logic_vector(31 downto 0);
signal sig_14:std_logic_vector(31 downto 0);
signal sig_15:std_logic;
signal sig_16:std_logic;
signal sig_17:std_logic_vector(31 downto 0);
signal sig_18:std_logic_vector(31 downto 0);
signal sig_19:std_logic_vector(63 downto 0);
signal sig_20:std_logic;
signal sig_21:std_logic;
signal sig_22:std_logic;
signal sig_23:std_logic_vector(31 downto 0);
signal sig_24:std_logic_vector(31 downto 0);
signal sig_25:std_logic;
signal sig_26:std_logic;
signal sig_27:std_logic_vector(31 downto 0);
signal sig_28:std_logic_vector(63 downto 0);
signal sig_29:std_logic_vector(31 downto 0);
signal sig_30:std_logic_vector(31 downto 0);
signal sig_31:std_logic;
signal sig_32:std_logic;
signal sig_33:std_logic_vector(63 downto 0);
signal sig_34:std_logic_vector(31 downto 0);
signal sig_35:std_logic;
signal sig_36:std_logic_vector(31 downto 0);
signal sig_37:std_logic_vector(31 downto 0);
signal sig_38:std_logic;
signal sig_39:std_logic;
signal sig_40:std_logic_vector(31 downto 0);
signal sig_41:std_logic;
signal sig_42:std_logic;
signal sig_43:std_logic_vector(63 downto 0);
signal sig_44:std_logic_vector(31 downto 0);
signal sig_45:std_logic;
signal sig_46:std_logic;


--component map declaration
component ack_port_out
port(
   data:in std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component ddd_in
port(
   data:out std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component eee_in
port(
   data:out std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component msg_in
port(
   data:out std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component myarm
port(
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component ppp_in
port(
   data:out std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component qqq_in
port(
   data:out std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component req_port_in
port(
   data:out std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component result1_port_out
port(
   data:in std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component result2_port_out
port(
   data:in std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
type STATE_TYPE is (s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s26,s27);
signal STATE:STATE_TYPE;
type CONTROL is (alwayssetterack2
, alwaysack1
, alwayshelper0ack2
, alwaysinit1ack2
, alwayscalc1ack2
, alwayscheck1ack2
, alwaysincrement1ack2
, alwaysidleack2
, alwaysinit2ack2
, alwayscalc2ack2
, alwayscheck2ack2
, alwaysincrement2ack2
, alwaysinit3ack2
, alwaysencrypterack2
, alwaysmoduloLoopack2
, alwayssetCipherTextack2
, alwayssendEncryptedack2
, alwaysinit4ack2
, alwaysdecrypterack2
, alwayssetPlainTextack2
, alwaysack3sendDecrypted
, alwaysack3idle
);
signal cmd : CONTROL;


begin


--portmap
label_ack_port_out : ack_port_out port map (
      data => ack_sig,
      RST => RST,
      CLK => CLK
   );
label_ddd_in : ddd_in port map (
      data => ddd_sig_in,
      RST => RST,
      CLK => CLK
   );
label_eee_in : eee_in port map (
      data => eee_sig_in,
      RST => RST,
      CLK => CLK
   );
label_msg_in : msg_in port map (
      data => msg_sig_in,
      RST => RST,
      CLK => CLK
   );
label_myarm : myarm port map (
      RST => RST,
      CLK => CLK
   );
label_ppp_in : ppp_in port map (
      data => ppp_sig_in,
      RST => RST,
      CLK => CLK
   );
label_qqq_in : qqq_in port map (
      data => qqq_sig_in,
      RST => RST,
      CLK => CLK
   );
label_req_port_in : req_port_in port map (
      data => req_sig,
      RST => RST,
      CLK => CLK
   );
label_result1_port_out : result1_port_out port map (
      data => result1_sig,
      RST => RST,
      CLK => CLK
   );
label_result2_port_out : result2_port_out port map (
      data => result2_sig,
      RST => RST,
      CLK => CLK
   );
--register updates
dpREG: process (CLK,RST)
   begin
      if (RST = '1') then
         res1 <= (others=>'0');
         res2 <= (others=>'0');
         current_request <= '0';
         done_reg <= '0';
         modulo_reg <= '0';
         x <= (others=>'0');
         y <= (others=>'0');
         p <= (others=>'0');
         q <= (others=>'0');
         e <= (others=>'0');
         d <= (others=>'0');
         n <= (others=>'0');
         z <= (others=>'0');
         msg <= (others=>'0');
         cipher <= (others=>'0');
         plaint <= (others=>'0');
      elsif CLK' event and CLK = '1' then
         res1 <= res1_wire;
         res2 <= res2_wire;
         current_request <= current_request_wire;
         done_reg <= done_reg_wire;
         modulo_reg <= modulo_reg_wire;
         x <= x_wire;
         y <= y_wire;
         p <= p_wire;
         q <= q_wire;
         e <= e_wire;
         d <= d_wire;
         n <= n_wire;
         z <= z_wire;
         msg <= msg_wire;
         cipher <= cipher_wire;
         plaint <= plaint_wire;

      end if;
   end process dpREG;


--combinational logics
dpCMB: process (res1,res2,req_sig,ack_sig,result1_sig,result2_sig,ppp_sig_in,qqq_sig_in,eee_sig_in,ddd_sig_in
,msg_sig_in,current_request,done_reg,modulo_reg,x,y,p,q,e,d
,n,z,msg,cipher,plaint,sig_0,sig_1,sig_2,sig_3,sig_4
,sig_5,sig_6,sig_7,sig_8,sig_9,sig_10,sig_11,sig_12,sig_13,sig_14
,sig_15,sig_16,sig_17,sig_18,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24
,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34
,sig_35,sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44
,cmd,STATE)
   begin
      res1_wire <= res1;
      res2_wire <= res2;
      ack_sig <= (others=>'0');
      result1_sig <= (others=>'0');
      result2_sig <= (others=>'0');
      current_request_wire <= current_request;
      done_reg_wire <= done_reg;
      modulo_reg_wire <= modulo_reg;
      x_wire <= x;
      y_wire <= y;
      p_wire <= p;
      q_wire <= q;
      e_wire <= e;
      d_wire <= d;
      n_wire <= n;
      z_wire <= z;
      msg_wire <= msg;
      cipher_wire <= cipher;
      plaint_wire <= plaint;
      sig_0 <= (others=>'0');
      sig_1 <= (others=>'0');
      sig_2 <= (others=>'0');
      sig_3 <= (others=>'0');
      sig_4 <= '0';
      sig_5 <= '0';
      sig_6 <= '0';
      sig_7 <= '0';
      sig_8 <= (others=>'0');
      sig_9 <= '0';
      sig_10 <= (others=>'0');
      sig_11 <= (others=>'0');
      sig_12 <= '0';
      sig_13 <= (others=>'0');
      sig_14 <= (others=>'0');
      sig_15 <= '0';
      sig_16 <= '0';
      sig_17 <= (others=>'0');
      sig_18 <= (others=>'0');
      sig_19 <= (others=>'0');
      sig_20 <= '0';
      sig_21 <= '0';
      sig_22 <= '0';
      sig_23 <= (others=>'0');
      sig_24 <= (others=>'0');
      sig_25 <= '0';
      sig_26 <= '0';
      sig_27 <= (others=>'0');
      sig_28 <= (others=>'0');
      sig_29 <= (others=>'0');
      sig_30 <= (others=>'0');
      sig_31 <= '0';
      sig_32 <= '0';
      sig_33 <= (others=>'0');
      sig_34 <= (others=>'0');
      sig_35 <= '0';
      sig_36 <= (others=>'0');
      sig_37 <= (others=>'0');
      sig_38 <= '0';
      sig_39 <= '0';
      sig_40 <= (others=>'0');
      sig_41 <= '0';
      sig_42 <= '0';
      sig_43 <= (others=>'0');
      sig_44 <= (others=>'0');



      case cmd is
         when alwayssetterack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            p_wire <= ppp_sig_in;
            q_wire <= qqq_sig_in;
            e_wire <= eee_sig_in;
            d_wire <= ddd_sig_in;
            msg_wire <= msg_sig_in;
            done_reg_wire <= '0';
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysack1 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            ack_sig <= conv_std_logic_vector(1,32);
         when alwayshelper0ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            sig_0 <= unsigned(p) * unsigned(q);
            sig_1 <= unsigned(p) - unsigned(conv_std_logic_vector(1,32));
            sig_2 <= unsigned(q) - unsigned(conv_std_logic_vector(1,32));
            sig_3 <= unsigned(sig_1) * unsigned(sig_2);
            n_wire <= sig_0(31 downto 0);
            z_wire <= sig_3(31 downto 0);
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysinit1ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            x_wire <= e;
            y_wire <= z;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwayscalc1ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            if (unsigned(x) = 0) then
               sig_4 <= '1';
            else
               sig_4 <= '0';
            end if;
            if (unsigned(y) = 0) then
               sig_5 <= '1';
            else
               sig_5 <= '0';
            end if;
            sig_6 <= sig_4 or sig_5;
            if (unsigned(x) > unsigned(y)) then
               sig_7 <= '1';
            else
               sig_7 <= '0';
            end if;
            if (sig_7 = '1') then
               sig_8 <= x;
            else
               sig_8 <= y;
            end if;
            if (unsigned(x) > unsigned(y)) then
               sig_9 <= '1';
            else
               sig_9 <= '0';
            end if;
            sig_10 <= unsigned(x) - unsigned(y);
            if (sig_9 = '1') then
               sig_11 <= sig_10;
            else
               sig_11 <= x;
            end if;
            if (unsigned(y) >= unsigned(x)) then
               sig_12 <= '1';
            else
               sig_12 <= '0';
            end if;
            sig_13 <= unsigned(y) - unsigned(x);
            if (sig_12 = '1') then
               sig_14 <= sig_13;
            else
               sig_14 <= y;
            end if;
            done_reg_wire <= sig_6;
            res1_wire <= sig_8;
            x_wire <= sig_11;
            y_wire <= sig_14;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwayscheck1ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            if (unsigned(res1) = 1) then
               sig_15 <= '1';
            else
               sig_15 <= '0';
            end if;
            if (sig_15 = '1') then
               sig_16 <= '1';
            else
               sig_16 <= '0';
            end if;
            done_reg_wire <= sig_16;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysincrement1ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            sig_17 <= unsigned(e) + unsigned(conv_std_logic_vector(1,32));
            sig_18 <= unsigned(e) + unsigned(conv_std_logic_vector(1,32));
            x_wire <= sig_17;
            y_wire <= z;
            e_wire <= sig_18;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysidleack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysinit2ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            sig_19 <= unsigned(d) * unsigned(e);
            x_wire <= sig_19(31 downto 0);
            y_wire <= z;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwayscalc2ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            if (unsigned(x) < unsigned(y)) then
               sig_20 <= '1';
            else
               sig_20 <= '0';
            end if;
            if (sig_20 = '1') then
               sig_21 <= '1';
            else
               sig_21 <= '0';
            end if;
            if (unsigned(x) >= unsigned(y)) then
               sig_22 <= '1';
            else
               sig_22 <= '0';
            end if;
            sig_23 <= unsigned(x) - unsigned(y);
            if (sig_22 = '1') then
               sig_24 <= sig_23;
            else
               sig_24 <= x;
            end if;
            done_reg_wire <= sig_21;
            x_wire <= sig_24;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwayscheck2ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            if (unsigned(x) = 1) then
               sig_25 <= '1';
            else
               sig_25 <= '0';
            end if;
            if (sig_25 = '1') then
               sig_26 <= '1';
            else
               sig_26 <= '0';
            end if;
            done_reg_wire <= sig_26;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysincrement2ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            sig_27 <= unsigned(d) + unsigned(conv_std_logic_vector(1,32));
            sig_28 <= unsigned(sig_27) * unsigned(e);
            sig_29 <= unsigned(d) + unsigned(conv_std_logic_vector(1,32));
            x_wire <= sig_28(31 downto 0);
            y_wire <= z;
            d_wire <= sig_29;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysinit3ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            sig_30 <= unsigned(e) - unsigned(conv_std_logic_vector(1,32));
            x_wire <= conv_std_logic_vector(1,32);
            y_wire <= sig_30;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysencrypterack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            if (unsigned(y) = 0) then
               sig_31 <= '1';
            else
               sig_31 <= '0';
            end if;
            if (sig_31 = '1') then
               sig_32 <= '1';
            else
               sig_32 <= '0';
            end if;
            sig_33 <= unsigned(x) * unsigned(msg);
            sig_34 <= unsigned(y) - unsigned(conv_std_logic_vector(1,32));
            done_reg_wire <= sig_32;
            x_wire <= sig_33(31 downto 0);
            y_wire <= sig_34;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysmoduloLoopack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            if (unsigned(x) >= unsigned(n)) then
               sig_35 <= '1';
            else
               sig_35 <= '0';
            end if;
            sig_36 <= unsigned(x) - unsigned(n);
            if (sig_35 = '1') then
               sig_37 <= sig_36;
            else
               sig_37 <= x;
            end if;
            if (unsigned(x) > unsigned(n)) then
               sig_38 <= '1';
            else
               sig_38 <= '0';
            end if;
            if (sig_38 = '1') then
               sig_39 <= '0';
            else
               sig_39 <= '1';
            end if;
            x_wire <= sig_37;
            modulo_reg_wire <= sig_39;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwayssetCipherTextack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            cipher_wire <= x;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwayssendEncryptedack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            res1_wire <= cipher;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysinit4ack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            sig_40 <= unsigned(d) - unsigned(conv_std_logic_vector(1,32));
            x_wire <= conv_std_logic_vector(1,32);
            y_wire <= sig_40;
            modulo_reg_wire <= '0';
            done_reg_wire <= '0';
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysdecrypterack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            if (unsigned(y) = 0) then
               sig_41 <= '1';
            else
               sig_41 <= '0';
            end if;
            if (sig_41 = '1') then
               sig_42 <= '1';
            else
               sig_42 <= '0';
            end if;
            sig_43 <= unsigned(x) * unsigned(cipher);
            sig_44 <= unsigned(y) - unsigned(conv_std_logic_vector(1,32));
            done_reg_wire <= sig_42;
            x_wire <= sig_43(31 downto 0);
            y_wire <= sig_44;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwayssetPlainTextack2 =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            plaint_wire <= x;
            ack_sig <= conv_std_logic_vector(2,32);
         when alwaysack3sendDecrypted =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            ack_sig <= conv_std_logic_vector(3,32);
            res2_wire <= plaint;
         when alwaysack3idle =>
            result1_sig <= res1;
            result2_sig <= res2;
            current_request_wire <= req_sig(0 downto 0);
            ack_sig <= conv_std_logic_vector(3,32);
         when others=>
      end case;
   end process dpCMB;


--controller reg
fsmREG: process (CLK,RST)
   begin
      if (RST = '1') then
         STATE <= s1;
      elsif CLK' event and CLK = '1' then
         STATE <= STATE;
         case STATE is
            when s1 => 
               if (current_request = '1') then
                       STATE <= s3;
               else
                       STATE <= s1;
               end if;
            when s2 => 
            when s3 => 
                    STATE <= s5;
            when s4 => 
            when s5 => 
                    STATE <= s6;
            when s6 => 
                    STATE <= s7;
            when s7 => 
               if (done_reg = '1') then
                       STATE <= s8;
               else
                       STATE <= s7;
               end if;
            when s8 => 
               if (sig_45 = '1') then
                       STATE <= s6;
               else
                       STATE <= s10;
               end if;
            when s9 => 
            when s10 => 
                    STATE <= s11;
            when s11 => 
                    STATE <= s12;
            when s12 => 
               if (done_reg = '1') then
                       STATE <= s13;
               else
                       STATE <= s12;
               end if;
            when s13 => 
               if (sig_46 = '1') then
                       STATE <= s11;
               else
                       STATE <= s14;
               end if;
            when s14 => 
                    STATE <= s15;
            when s15 => 
                    STATE <= s16;
            when s16 => 
                    STATE <= s17;
            when s17 => 
                    STATE <= s18;
            when s18 => 
               if (modulo_reg = '1') then
                       STATE <= s19;
               else
                       STATE <= s17;
               end if;
            when s19 => 
               if (done_reg = '1') then
                       STATE <= s20;
               else
                       STATE <= s16;
               end if;
            when s20 => 
                    STATE <= s21;
            when s21 => 
                    STATE <= s22;
            when s22 => 
                    STATE <= s23;
            when s23 => 
                    STATE <= s24;
            when s24 => 
               if (modulo_reg = '1') then
                       STATE <= s25;
               else
                       STATE <= s23;
               end if;
            when s25 => 
               if (done_reg = '1') then
                       STATE <= s26;
               else
                       STATE <= s22;
               end if;
            when s26 => 
                    STATE <= s27;
            when s27 => 
                    STATE <= s27;
            when others=>
         end case;
      end if;
   end process fsmREG;


--controller cmb
fsmCMB: process (res1,res2,req_sig,ack_sig,result1_sig,result2_sig,ppp_sig_in,qqq_sig_in,eee_sig_in,ddd_sig_in
,msg_sig_in,current_request,done_reg,modulo_reg,x,y,p,q,e,d
,n,z,msg,cipher,plaint,sig_0,sig_1,sig_2,sig_3,sig_4
,sig_5,sig_6,sig_7,sig_8,sig_9,sig_10,sig_11,sig_12,sig_13,sig_14
,sig_15,sig_16,sig_17,sig_18,sig_19,sig_20,sig_21,sig_22,sig_23,sig_24
,sig_25,sig_26,sig_27,sig_28,sig_29,sig_30,sig_31,sig_32,sig_33,sig_34
,sig_35,sig_36,sig_37,sig_38,sig_39,sig_40,sig_41,sig_42,sig_43,sig_44
,sig_45,sig_46,cmd,STATE)
   begin
   sig_45 <= '0';
   sig_46 <= '0';
   sig_45 <=  not done_reg;
   sig_46 <=  not done_reg;
   cmd <= alwayssetterack2;
   case STATE is
      when s1 => 
         if (current_request = '1') then
                 cmd <= alwayssetterack2;
         else
                 cmd <= alwaysack1;
         end if;
      when s2 => 
      when s3 => 
              cmd <= alwayshelper0ack2;
      when s4 => 
      when s5 => 
              cmd <= alwaysinit1ack2;
      when s6 => 
              cmd <= alwayscalc1ack2;
      when s7 => 
         if (done_reg = '1') then
                 cmd <= alwayscheck1ack2;
         else
                 cmd <= alwayscalc1ack2;
         end if;
      when s8 => 
         if (sig_45 = '1') then
                 cmd <= alwaysincrement1ack2;
         else
                 cmd <= alwaysidleack2;
         end if;
      when s9 => 
      when s10 => 
              cmd <= alwaysinit2ack2;
      when s11 => 
              cmd <= alwayscalc2ack2;
      when s12 => 
         if (done_reg = '1') then
                 cmd <= alwayscheck2ack2;
         else
                 cmd <= alwayscalc2ack2;
         end if;
      when s13 => 
         if (sig_46 = '1') then
                 cmd <= alwaysincrement2ack2;
         else
                 cmd <= alwaysidleack2;
         end if;
      when s14 => 
              cmd <= alwaysidleack2;
      when s15 => 
              cmd <= alwaysinit3ack2;
      when s16 => 
              cmd <= alwaysencrypterack2;
      when s17 => 
              cmd <= alwaysmoduloLoopack2;
      when s18 => 
         if (modulo_reg = '1') then
                 cmd <= alwaysidleack2;
         else
                 cmd <= alwaysidleack2;
         end if;
      when s19 => 
         if (done_reg = '1') then
                 cmd <= alwayssetCipherTextack2;
         else
                 cmd <= alwaysidleack2;
         end if;
      when s20 => 
              cmd <= alwayssendEncryptedack2;
      when s21 => 
              cmd <= alwaysinit4ack2;
      when s22 => 
              cmd <= alwaysdecrypterack2;
      when s23 => 
              cmd <= alwaysmoduloLoopack2;
      when s24 => 
         if (modulo_reg = '1') then
                 cmd <= alwaysidleack2;
         else
                 cmd <= alwaysidleack2;
         end if;
      when s25 => 
         if (done_reg = '1') then
                 cmd <= alwayssetPlainTextack2;
         else
                 cmd <= alwaysidleack2;
         end if;
      when s26 => 
              cmd <= alwaysack3sendDecrypted;
      when s27 => 
              cmd <= alwaysack3idle;
      when others=>
      end case;
end process fsmCMB;
end RTL;
