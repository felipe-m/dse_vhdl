library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux7seg is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC;
           led : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (6 downto 0);
           -- la nexys 4 tiene 8 displays de 7 segmentos
           an  : out  STD_LOGIC_VECTOR (7 downto 0));
end mux7seg;

architecture Behavioral of mux7seg is

  signal Z : STD_LOGIC_VECTOR (3 downto 0);
  
begin

  Z <= A when S='1' else B;

  LED <= Z;

  AN <= "11111110"; -- Encendemos solo el primer display

  SEG <= "0000001" when Z="0000" else  -- 0: A,B,C,D,E,F
         "1001111" when Z="0001" else  -- 1: B,C
         "0010010" when Z="0010" else  -- 2: A,B,D,E,G
         "0000110" when Z="0011" else  -- 3: A,B,C,D,G
         "1001100" when Z="0100" else  -- 4: B,C,F,G
         "0100100" when Z="0101" else  -- 5: A,C,D,F,G
         "0100000" when Z="0110" else  -- 6: A,C,D,E,F,G
         "0001111" when Z="0111" else  -- 7: A,B,C
         "0000000" when Z="1000" else  -- 8: A,B,C,D,E,F,G
         "0001100" when Z="1001" else  -- 9: A,B,C,F,G
         "0001000" when Z="1010" else  -- A(10): A,B,C,E,F,G
         "1100000" when Z="1011" else  -- b(11): C,D,E,F,G
         "0110001" when Z="1100" else  -- C(12): A,D,E,F
         "1000010" when Z="1101" else  -- d(13): B,C,D,E,G
         "0110000" when Z="1110" else  -- E(14): A,D,E,F,G
         "0111000";  -- when Z="1111" else  -- F(15): A,E,F,G


end Behavioral;

