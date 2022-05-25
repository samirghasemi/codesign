library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity ppp_in is
port(
   data:out std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic

);
end ppp_in;


--signal declaration
architecture RTL of ppp_in is
begin
   -- VHDL view of ipblock
end RTL;
