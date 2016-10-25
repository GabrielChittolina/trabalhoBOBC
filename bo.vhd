LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bloco_operacional is
  port(
    resetar, somar, CK : in std_logic;
    valor : in std_logic_vector(7 downto 0);
    overflow : out std_logic;
    resultado : out std_logic_vector(7 downto 0)
  );
end entity bloco_operacional;

architecture bloco_operacional_arch of bloco_operacional is

  signal resultado2 : std_logic_vector(7 downto 0);

begin

  process(CK, resetar)
  begin
    if resetar = '1' then
      resultado2 <= "00000000";
      overflow <= '0';

    elsif CK'event and CK = '1' then
      if somar = '1' then
        if resultado2(7) = '1' and valor(7) = '1' then
          overflow <= '1';
        end if;
        resultado2 <= resultado2 + valor;
      end if;
    end if;

  end process;

  resultado <= resultado2;

end architecture bloco_operacional_arch;
