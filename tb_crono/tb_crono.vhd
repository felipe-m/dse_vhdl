--------------------------------------------------------------------------------
-- Banco de pruebas de un cronometro que muestra los números en BCD
-- por un display de 7 segmentos multiplexando en el tiempo:
-- * Video de explicacion del cronometro: https://youtu.be/-k2lwyx0tdQ
-- * Video de simulacion del crononmetro: https://youtu.be/6VZPv3DTpR0
-- * Video de simulacion del cronómetro con errores:
--    https://youtu.be/u407H3Vef7c
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_crono IS
END tb_crono;
 
ARCHITECTURE behavior OF tb_crono IS 
 
    COMPONENT crono
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         SEG : OUT  std_logic_vector(6 downto 0);
         AN : OUT  std_logic_vector(3 downto 0);
         SEG_DT : OUT  std_logic
        );
    END COMPONENT;

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal SEG : std_logic_vector(6 downto 0);
   signal AN : std_logic_vector(3 downto 0);
   signal SEG_DT : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Unidad en pruebas (UUT: Unit Under Test)
   uut: crono PORT MAP (
          Clk => Clk,
          Reset => Reset,
          SEG => SEG,
          AN => AN,
          SEG_DT => SEG_DT
        );

   -- Generacion del reloj
   Clk_process :process
   begin
      Clk <= '0';
      wait for Clk_period/2;
      Clk <= '1';
      wait for Clk_period/2;
   end process;

   -- Reset
   stim_proc: process
   begin		
      Reset <= '0';
      wait for 32 ns;	
      Reset <= '1';
      wait for 42 ns;	
      Reset <= '0';
      wait;
   end process;

END;
