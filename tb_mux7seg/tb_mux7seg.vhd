library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_mux7seg is
end tb_mux7seg;

architecture tb of tb_mux7seg is

  component mux7seg
    Port (
      a : in  STD_LOGIC_VECTOR (3 downto 0);
      b : in  STD_LOGIC_VECTOR (3 downto 0);
      s : in  STD_LOGIC;
      led : out  STD_LOGIC_VECTOR (3 downto 0);
      seg : out  STD_LOGIC_VECTOR (6 downto 0);
      -- la nexys 4 tiene 8 displays de 7 segmentos
      an  : out  STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;

  signal a_sw, b_sw    : STD_LOGIC_VECTOR (3 downto 0);
  signal s_btn         : STD_LOGIC;
  signal led           : STD_LOGIC_VECTOR (3 downto 0);
  signal segmento      : STD_LOGIC_VECTOR (6 downto 0);
  signal anodo_display : STD_LOGIC_VECTOR (7 downto 0);

begin

  UnidadEnPruebas: mux7seg
    Port Map (
    -- puertos componente => senales del banco de pruebas
        a        => a_sw,
        b        => b_sw,
        s        => s_btn,
        led      => led,
        seg      => segmento,
        an       => anodo_display
    );

  -- Proceso que genera los estimulos en las entradas del mux7seg
  Estimulos: Process
  begin
    a_sw  <= "0001";
    b_sw  <= "1110";
    s_btn <= '0';
    wait for 50 ns;
    a_sw  <= "1001";
    b_sw  <= "0110";
    s_btn <= '1';
    wait for 50 ns;
    -- continua .....

    wait; 
  end process;

end tb;
