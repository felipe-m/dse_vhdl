library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_2b_struct is
    Port ( A    : in  std_logic_vector(1 downto 0);
           B    : in  std_logic_vector(1 downto 0);
           Ci   : in  std_logic;
           S    : out std_logic_vector(1 downto 0);
           Co   : out std_logic);
end adder_2b_struct;

architecture structural of adder_2b_struct is
  signal Co_0  : std_logic;

  component full_adder
    port(
         A  : in  std_logic;
         B  : in  std_logic;
         Ci : in  std_logic;
         S  : out  std_logic;
         Co : out  std_logic
        );
    end component;

begin

  S0: full_adder
    port map (
        A  => A(0),
        B  => B(0),
        Ci => Ci,
        S  => S(0),
        Co => Co_0
     );

  S1: full_adder
    port map (
        A  => A(1),
        B  => B(1),
        Ci => Co_0,
        S  => S(1),
        Co => Co
     );

end structural;

