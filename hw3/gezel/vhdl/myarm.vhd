library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity myarm is
port(
   RST : in std_logic;
   CLK : in std_logic

);
end myarm;


--signal declaration
architecture RTL of myarm is
begin
   -- VHDL view of ipblock
end RTL;
