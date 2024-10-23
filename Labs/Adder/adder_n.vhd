-----------------------------------------------
--Vincius Malaman Soares
--Iowa State University
--Sep, 2024
-----------------------------------------------
-- N-bit adder

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;

entity adder_n is
    generic(N: integer := 32);
    port(i_S0,i_S1  : in std_logic_vector(N-1 downto 0);
         i_Cin      : in std_logic;
         o_Sum      : out std_logic_vector(N-1 downto 0);
         o_Cout     : out std_logic);
end adder_n;

architecture structure of adder_n is
    --declared in my_adder.vhd
component my_adder is  
    port(i_S0,i_S1,i_Cin	: in std_logic;
    o_Sum,o_Cout	: out std_logic);
end component;

signal i_Carry  : std_logic_vector(N downto 0);


begin
    i_Carry(0)<= i_Cin;
    G_Nbit_ADDER: for i in 0 to N-1 generate
        ADDER: my_adder port map(
            i_S0=>i_S0(i),
            i_S1=>i_S1(i),
            i_Cin=>i_Carry(i),
            o_Sum=>o_Sum(i),
            o_Cout=>i_Carry(i+1));
        
end generate G_Nbit_ADDER;

o_Cout <= i_Carry(32);

end structure;