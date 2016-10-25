LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bloco_controle_test is
end entity bloco_controle_test;

architecture bloco_controle_test_arch of bloco_controle_test is

  component bloco_controle is
    port(iniciar, CK, reset: in std_logic;
  		pronto, somar, resetar: out std_logic);
  end component bloco_controle;

  signal iniciar, CK, reset, pronto, somar, resetar : std_logic;

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

  iniciar <= '0',
  '1' after 1 ns;

  reset <= '0',
  '1' after 6 ns,
  '0' after 8 ns;

  x0 : bloco_controle port map (iniciar, CK, reset, pronto, somar, resetar);

end architecture bloco_controle_test_arch;
