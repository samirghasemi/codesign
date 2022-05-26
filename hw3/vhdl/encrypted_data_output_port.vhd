library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity encrypted_data_output_port is
port(
   data:in std_logic_vector(31 downto 0);
   RST : in std_logic;
   CLK : in std_logic

);
end encrypted_data_output_port;


--signal declaration
architecture RTL of encrypted_data_output_port is
begin
   -- VHDL view of ipblock
end RTL;
