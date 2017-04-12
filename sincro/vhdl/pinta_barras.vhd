--------------------------------------------------------------------------------
-- Felipe Machado Sanchez
-- Departameto de Tecnologia Electronica
-- Universidad Rey Juan Carlos
-- http://gtebim.es/~fmachado
--
-- Pinta barras para la XUPV2P

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library WORK;
use WORK.VGA_PKG.ALL; 

entity pinta_barras is
  Port (
    -- In ports
    visible      : in std_logic;
    col          : in unsigned(10-1 downto 0);
    fila         : in unsigned(10-1 downto 0);
    -- Out ports
    rojo         : out std_logic_vector(c_nb_red-1 downto 0);
    verde        : out std_logic_vector(c_nb_green-1 downto 0);
    azul         : out std_logic_vector(c_nb_blue-1 downto 0)
  );
end pinta_barras;

architecture behavioral of pinta_barras is

  constant c_bar_width : natural := 64;

begin

  P_pinta: Process (visible, col, fila)
  begin
    rojo   <= (others=>'0');
    verde  <= (others=>'0');
    azul   <= (others=>'0');
    if visible = '1' then
      -- una linea blanca en los bordes
      if col = 0 OR col = c_pxl_visible -1 OR
        fila=0 OR fila= c_line_visible -1 then
        rojo   <= (others=>'1');
        verde  <= (others=>'1');
        azul   <= (others=>'1');
      elsif fila >= 256 and fila < 256 + c_bar_width then 
        -- esto solo tiene sentido para la XUPV2P
        rojo   <= std_logic_vector(col(c_nb_red-1 downto 0));
        verde  <= std_logic_vector(col(c_nb_green-1 downto 0));
        azul   <= std_logic_vector(col(c_nb_blue-1 downto 0));
        if col >= 256 then
          rojo   <= std_logic_vector(col(c_nb_red-1 downto 0));
          verde  <= std_logic_vector(resize(255-col(7 downto 0),c_nb_green));
          azul   <= (others=>'0');
        end if;
        if col >= 512 then -- rayas horizontales
          rojo   <= (others=>not(fila(0))); 
          verde  <= (others=>not(fila(0))); 
          azul   <= (others=>not(fila(0))); 
        end if;
      elsif fila >= 256+c_bar_width and fila < 256 + 2*c_bar_width then 
        rojo   <= std_logic_vector(resize(255 - col(7 downto 0),c_nb_red));
        verde  <= std_logic_vector(resize(255 - col(7 downto 0),c_nb_green));
        azul   <= std_logic_vector(resize(255 - col(7 downto 0),c_nb_blue));
        if col >= 256 then
          rojo  <=std_logic_vector(resize(255 - col(7 downto 0),c_nb_red)); 
          verde <=(others=>'0');
          azul  <= std_logic_vector(col(c_nb_blue-1 downto 0));
        end if;
        if col >= 512 then  -- puntos
          rojo   <= (others=>col(0) xor fila(0));
          verde  <= (others=>col(0) xor fila(0));
          azul   <= (others=>col(0) xor fila(0));
        end if;
      elsif col/c_bar_width = 0 then
        -- columna 0 sera blanca, columna 1 negra, ...
        rojo   <= (others=>not(col(0))); 
        verde  <= (others=>not(col(0))); 
        azul   <= (others=>not(col(0))); 
      elsif col/c_bar_width = 1 then
        --blanco
        rojo   <= (others=>'1');
        verde  <= (others=>'1');
        azul   <= (others=>'1');
      elsif col/c_bar_width = 2 then
        --amarillo
        rojo   <= (others=>'1');
        verde  <= (others=>'1');
        azul   <= (others=>'0');
      elsif col/c_bar_width = 3 then
        --cian
        rojo   <= (others=>'0');
        verde  <= (others=>'1');
        azul   <= (others=>'1');
      elsif col/c_bar_width = 4 then
        --verde
        rojo   <= (others=>'0');
        verde  <= (others=>'1');
        azul   <= (others=>'0');
      elsif col/c_bar_width = 5 then
        --magenta
        rojo   <= (others=>'1');
        verde  <= (others=>'0');
        azul   <= (others=>'1');
      elsif col/c_bar_width = 6 then
        --rojo
        rojo   <= (others=>'1');
        verde  <= (others=>'0');
        azul   <= (others=>'0');
      elsif col/c_bar_width = 7 then
        --azul
        rojo   <= (others=>'0');
        verde  <= (others=>'0');
        azul   <= (others=>'1');
      elsif col/c_bar_width = 8 then
        --negro
        rojo   <= (others=>'0');
        verde  <= (others=>'0');
        azul   <= (others=>'0');
      else
        -- columna 639 sera blanca, 638 negra, ...
        rojo   <= (others=>col(0)); 
        verde  <= (others=>col(0)); 
        azul   <= (others=>col(0)); 
      end if;
    end if;
  end process;
  
  
end Behavioral;

