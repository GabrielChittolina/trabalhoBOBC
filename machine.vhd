LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity machine is
  port (
    iniciar, reset, CK : in std_logic;
    valor : in std_logic_vector(7 downto 0);
    overflow, pronto : out std_logic;
    resultado : out std_logic_vector(7 downto 0)
  );
end entity;

architecture machine_arch of machine is

  component bloco_controle is
    port(
      iniciar, CK, reset: in std_logic;
      pronto, somar, resetar: out std_logic
    );
  end component bloco_controle;

  component bloco_operacional is
    port(
      resetar, somar, CK : in std_logic;
      valor : in std_logic_vector(7 downto 0);
      overflow : out std_logic;
      resultado : out std_logic_vector(7 downto 0)
    );
  end component bloco_operacional;

  signal resetar, somar : std_logic;

begin

  x0 : bloco_controle port map    (iniciar, CK, reset, pronto, somar, resetar);
  x1 : bloco_operacional port map (resetar, somar, CK, valor, overflow, resultado);

end architecture machine_arch;
