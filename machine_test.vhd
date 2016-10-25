LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity machine_test is
end entity machine_test;

architecture machine_test_arch of machine_test is

  component machine is
    port (
      iniciar, reset, CK : in std_logic;
      valor : in std_logic_vector(7 downto 0);
      overflow, pronto : out std_logic;
      resultado : out std_logic_vector(7 downto 0)
    );
  end component machine;

  signal iniciar, reset, CK, overflow, pronto : std_logic;
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
  '0' after 19 ns,
  '1' after 20 ns,
  '0' after 21 ns,
  '1' after 22 ns,
  '0' after 23 ns;

  reset <= '1',
  '0' after 1 ns,
  '1' after 6 ns,
  '0' after 7 ns;

  iniciar <= '0',
  '1' after 2 ns,
  '0' after 3 ns,
  '1' after 6 ns;

  valor <= "00000000",
  "00001111" after 4 ns,
  "00000001" after 10 ns,
  "10000000" after 12 ns,
  "00001100" after 14 ns,
  "00010100" after 16 ns;

  x0 : machine port map (iniciar, reset, CK, valor, overflow, pronto, resultado);

end architecture machine_test_arch;
