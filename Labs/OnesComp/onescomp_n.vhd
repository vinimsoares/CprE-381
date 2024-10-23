-----------------------------------------------
--Vinicius Malaman Soares
--Iowa State University
--Sep,2024
-----------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
entity onescomp_n is
	generic(N : integer := 32);
	port(i_I	: in std_logic_vector(N-1 downto 0);
	     o_O	: out std_logic_vector(N-1 downto 0));
end onescomp_n;

architecture structural of onescomp_n is
	--Declared in the file invg.vhd
component invg is
	port(i_A	:in std_logic;
	     o_F	:out std_logic);
end component;

begin
G_ONESCOMP_N: for i in 0 to N-1 generate
	ONES: invg port MAP(i_A =>i_I(i),o_F=>o_O(i));
end generate G_ONESCOMP_N;


end structural;
