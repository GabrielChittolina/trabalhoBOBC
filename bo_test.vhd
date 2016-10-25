LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bloco_operacional_test is
end entity bloco_operacional_test;

architecture bloco_operacional_test_arch of bloco_operacional_test is

  component bloco_operacional is
    port(
      resetar, somar, CK : in std_logic;
      valor : in std_logic_vector(7 downto 0);
      overflow : out std_logic;
      resultado : out std_logic_vector(7 downto 0)
    );
  end component bloco_operacional;

  signal resetar, somar, CK, overflow : std_logic;
  signal valor, resultado : std_logic_vector(7 downto 0);

begin

  CK <= '1',
  '0' after 1 ns,
  '1' after 2 ns,
  '0' after 3 ns,
  '1' after 4 ns,
  '0' after 5 ns,
  '1' after 6 ns,
  '0' after 7 ns,
  '1' after 8 ns,
  '0' after 9 ns,
  '1' after 10 ns,
  '0' after 11 ns,
  '1' after 12 ns,
  '0' after 13 ns,
  '1' after 14 ns,
  '0' after 15 ns,
  '1' after 16 ns,
  '0' after 17 ns,
  '1' after 18 ns,
  '0' after 19 ns;

  resetar <= '1',
  '0' after 1 ns,
  '1' after 12 ns;

  somar <= '0',
  '1' after 2 ns;

  valor <= "00000000",
  "00001000" after 2 ns,
  "00001111" after 4 ns,
  "00000000" after 6 ns,
  "10000000" after 8 ns;

  x0: bloco_operacional port map (resetar, somar, CK, valor, overflow, resultado);

end architecture;
