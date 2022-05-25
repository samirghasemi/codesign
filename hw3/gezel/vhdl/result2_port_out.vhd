library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity result2_port_out is
port(
   data:in std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic

);
end result2_port_out;


--signal declaration
architecture RTL of result2_port_out is
begin
   -- VHDL view of ipblock
end RTL;
