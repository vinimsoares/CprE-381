------------------------------------------------
--Vinicius Malaman Soares
--Iowa State University
--Sep, 2024
------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mux2t1_dataflow is
	port(i_D0,i_D1,i_S	: in std_logic;
	     o_O	:out std_logic);
end mux2t1_dataflow;

architecture dataflow of mux2t1_dataflow is
begin
	o_O <= 	i_D0 when(i_S = '0') else
		i_D1;
end dataflow;	

