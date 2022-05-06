library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity TB is
port(
   a:out std_logic_vector(7 downto 0);
   RST : in std_logic;
   CLK : in std_logic

);
end TB;


--signal declaration
architecture RTL of TB is
signal b:std_logic_vector(7 downto 0);
signal b_wire:std_logic_vector(7 downto 0);
signal sig_0:std_logic_vector(7 downto 0);
signal a_int:std_logic_vector(7 downto 0);


begin
--register updates
dpREG: process (CLK,RST)
   begin
      if (RST = '1') then
         b <= (others=>'0');
      elsif CLK' event and CLK = '1' then
         b <= b_wire;

      end if;
   end process dpREG;


--combinational logics
dpCMB: process (b,sig_0,a_int)
   begin
      b_wire <= b;
      sig_0 <= (others=>'0');
      a_int <= (others=>'0');
      a <= (others=>'0');

      sig_0 <= unsigned(b) + unsigned(conv_std_logic_vector(1,8));
      b_wire <= sig_0;
   end process dpCMB;
end RTL;
