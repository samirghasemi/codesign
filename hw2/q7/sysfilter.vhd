library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library work;
use work.std_logic_arithext.all;


--datapath entity
entity sysfilter is
port(
   RST : in std_logic;
   CLK : in std_logic

);
end sysfilter;


--signal declaration
architecture RTL of sysfilter is
signal a:std_logic_vector(7 downto 0);
signal r:std_logic_vector(15 downto 0);


--component map declaration
component TB
port(
   a:out std_logic_vector(7 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;
component filter
port(
   a:in std_logic_vector(7 downto 0);
   r:out std_logic_vector(15 downto 0);
   RST : in std_logic;
   CLK : in std_logic
);
end component;


begin


--portmap
label_TB : TB port map (
      a => a,
      RST => RST,
      CLK => CLK
   );
label_filter : filter port map (
      a => a,
      r => r,
      RST => RST,
      CLK => CLK
   );
end RTL;
