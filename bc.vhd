LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bloco_controle is
	port(iniciar, CK, reset: in std_logic;
		pronto, somar, resetar: out std_logic);
end entity bloco_controle;

architecture bloco_controle_arch of bloco_controle is

	type estados is (ini, sum, prontoo);
	signal est : estados;
	signal counter : std_logic_vector(1 downto 0);

begin

	process(CK, reset) is
	begin
		if reset = '1' then
			est <= ini;
			pronto <= '0';
			somar <= '0';
			resetar <= '1';
		elsif CK'event and CK = '1' then

			if est = ini then
				if iniciar = '1' then
					counter <= "00";
					est <= sum;
					resetar <= '0';
					somar <= '1';
				end if;
			elsif est = sum then
				if counter = "00" then
					counter <= "01";
				elsif counter = "01" then
					counter <= "10";
				elsif counter = "10" then
					counter <= "11";
				else
					est <= prontoo;
					pronto <= '1';
					somar <= '0';
				end if;
			else --aqui ta no pronto
				est <= ini;
				pronto <= '0';
				resetar <= '1';
			end if;

		end if;
	end process;

--	process is
--	begin
--		if est = prontoo then
--			pronto <= '1';
--		else
--			pronto <= '0';
--		end if;
--
--		if est = sum then
--			somar <= '1';
--		else
--			somar <= '0';
--		end if;
--
--		if est = ini then
--			resetar <= '1';
--		else
--			resetar <= '0';
--		end if;
--	end process;

end architecture bloco_controle_arch;
