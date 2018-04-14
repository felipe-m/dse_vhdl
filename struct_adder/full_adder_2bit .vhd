library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_2b is
    Port ( A    : in  std_logic_vector(1 downto 0);
           B    : in  std_logic_vector(1 downto 0);
           Ci   : in  std_logic;
           S    : out std_logic_vector(1 downto 0);
           Co   : out std_logic);
end full_adder_2b;

architecture gate of full_adder_2b is
  signal xorAB : std_logic_vector(1 downto 0);
  signal Co_0  : std_logic;
begin

  -- sumador bit 0
  xorAB(0) <= A(0) xor B(0);
  S(0)     <= xorAB(0) xor Ci;
  Co_0     <= (A(0) and B(0)) or (Ci and xorAB(0)); 

  -- sumador bit 1
  xorAB(1) <= A(1) xor B(1);
  S(1)     <= xorAB(1) xor Co_0;
  Co       <= (A(1) and B(1)) or (Co_0 and xorAB(1)); 

end gate;

