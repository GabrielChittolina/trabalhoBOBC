entity bloco_controle is
	port(inicio, CK, reset : in bit;
		pronto, somar: out bit);
end entity bloco_controle;


architecture bloco_controle_arch of bloco_controle_arch is

	type estados is (ini, sum, pronto);
	signal est : estados;
	signal counter : bit_vector(1 downto 0);

begin

	process(CK, reset) is
	begin
		if(reset = 1) then
			est <= ini;
		elsif CK'event and CK = '1' then

			if est = ini then
				if inicio = '1' then
					counter <= "00";
					est <= sum;
				end if;
			elsif est = sum then
				if counter = "00" then
					coutner <= "01";
				elsif counter = "01" then
					counter <= "10";
				elsif counter = "10" then
					counter <= "11";
				else
					est <= pronto;
				end if;
			else
				est <= ini;
			end if;

		end if;
	end process;

	if est = pronto then
		pronto <= '1';
	else
		pronto <= '0';
	end if;

	if est = sum then
		somar <= '1';
	else
		somar <= '0';
	end if;

end architecture bloco_controle_arch;
