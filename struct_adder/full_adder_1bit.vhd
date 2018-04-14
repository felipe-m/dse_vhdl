library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( A    : in  std_logic;
           B    : in  std_logic;
           Ci   : in  std_logic;
           S    : out std_logic;
           Co   : out std_logic);
end full_adder;

architecture gate of full_adder is
  signal xorAB : std_logic;
begin

  xorAB <= A xor B;
  S     <= xorAB xor Ci;
  Co    <= (A and B) or (Ci and xorAB); 

end gate;

