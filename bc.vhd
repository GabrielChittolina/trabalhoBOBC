entity trabalho2 is
	port(inicio, CK, reset : in bit;
			pronto, overflow : out bit);
end entity trabalho2;


architecture trabalho2_arch of trabalho2_arch is

	type estados is (ini, sum, pronto);
	signal est : estados;
	signal number : bit_vector(7 downto 0);
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
				--somar
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

end architecture trabalho2_arch;
