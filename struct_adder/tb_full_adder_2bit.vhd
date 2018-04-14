--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_full_adder_2bit is
END tb_full_adder_2bit;
 
ARCHITECTURE tb OF tb_full_adder_2bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder_2b
    Port ( A    : in  std_logic_vector(1 downto 0);
           B    : in  std_logic_vector(1 downto 0);
           Ci   : in  std_logic;
           S    : out std_logic_vector(1 downto 0);
           Co   : out std_logic);
    END COMPONENT;
    

   --Inputs
   signal  A    : std_logic_vector(1 downto 0);
   signal  B    : std_logic_vector(1 downto 0);
   signal  Ci   : std_logic;

 	--Outputs
   signal S : std_logic_vector(1 downto 0);
   signal Co : std_logic;
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder_2b PORT MAP (
          A => A,
          B => B,
          Ci => Ci,
          S => S,
          Co => Co
        );


   -- Stimulus process
   stim_proc: process
   begin		
      A  <= "00";
      B  <= "00";
      Ci <= '0';
      wait for 10 ns;
      A  <= "00";
      B  <= "01";
      Ci <= '0';
      wait for 10 ns;
      A  <= "00";
      B  <= "10";
      Ci <= '0';
      wait for 10 ns;
      A  <= "00";
      B  <= "11";
      Ci <= '0';
      wait for 10 ns;
      A  <= "00";
      B  <= "00";
      Ci <= '1';
      wait for 10 ns;
      A  <= "00";
      B  <= "01";
      Ci <= '1';
      wait for 10 ns;
      A  <= "00";
      B  <= "10";
      Ci <= '1';
      wait for 10 ns;
      A  <= "00";
      B  <= "11";
      Ci <= '1';
      wait for 10 ns;
      A  <= "01";
      B  <= "00";
      Ci <= '0';
      wait for 10 ns;
      A  <= "01";
      B  <= "01";
      Ci <= '0';
      wait for 10 ns;
      A  <= "01";
      B  <= "10";
      Ci <= '0';
      wait for 10 ns;
      A  <= "01";
      B  <= "11";
      Ci <= '0';
      wait for 10 ns;
      A  <= "01";
      B  <= "00";
      Ci <= '1';
      wait for 10 ns;
      A  <= "01";
      B  <= "01";
      Ci <= '1';
      wait for 10 ns;
      A  <= "01";
      B  <= "10";
      Ci <= '1';
      wait for 10 ns;
      A  <= "01";
      B  <= "11";
      Ci <= '1';
      wait for 10 ns;
      A  <= "10";
      B  <= "00";
      Ci <= '0';
      wait for 10 ns;
      A  <= "10";
      B  <= "01";
      Ci <= '0';
      wait for 10 ns;
      A  <= "10";
      B  <= "10";
      Ci <= '0';
      wait for 10 ns;
      A  <= "10";
      B  <= "11";
      Ci <= '0';
      wait for 10 ns;
      A  <= "10";
      B  <= "00";
      Ci <= '1';
      wait for 10 ns;
      A  <= "10";
      B  <= "01";
      Ci <= '1';
      wait for 10 ns;
      A  <= "10";
      B  <= "10";
      Ci <= '1';
      wait for 10 ns;
      A  <= "10";
      B  <= "11";
      Ci <= '1';
      wait for 10 ns;
      A  <= "11";
      B  <= "00";
      Ci <= '0';
      wait for 10 ns;
      A  <= "11";
      B  <= "01";
      Ci <= '0';
      wait for 10 ns;
      A  <= "11";
      B  <= "10";
      Ci <= '0';
      wait for 10 ns;
      A  <= "11";
      B  <= "11";
      Ci <= '0';
      wait for 10 ns;
      A  <= "11";
      B  <= "00";
      Ci <= '1';
      wait for 10 ns;
      A  <= "11";
      B  <= "01";
      Ci <= '1';
      wait for 10 ns;
      A  <= "11";
      B  <= "10";
      Ci <= '1';
      wait for 10 ns;
      A  <= "11";
      B  <= "11";
      Ci <= '1';
      wait for 10 ns;

      wait for 10 ns;
      wait;
   end process;

END;
