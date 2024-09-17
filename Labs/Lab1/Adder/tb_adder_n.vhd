-------------------------------------------------
--Vinicius Malaman Soares
--Iowa State University
--Sep, 2024
-------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;

entity tb_adder_n is   
    generic(gCLK_HPER   : time := 10 ns);
end tb_adder_n;

architecture mixed of tb_adder_n is

component adder_n is 
    generic(N:  integer := 32);
    port(i_S0,i_S1  : in std_logic_vector(N-1 downto 0);
         i_Cin      : in std_logic;
         o_Sum      : out std_logic_vector(N-1 downto 0);
         o_Cout     : out std_logic);
end component;

signal CLK, reset   : std_logic := '0';

constant N : integer := 32;

signal s_S0 : std_logic_vector(N-1 downto 0);
signal s_S1 : std_logic_vector(N-1 downto 0);
signal s_Sum : std_logic_vector(N-1 downto 0);
signal s_Cin : std_logic := '0';
signal s_Cout : std_logic := '0';

begin  
    DUT0: adder_n
    port map(i_S0=>s_S0,i_S1=>s_S1,i_Cin=>s_Cin,o_Sum=>s_Sum,o_Cout=>s_Cout);

    P_CLK: process
    begin
        CLK<='1';
        wait for gCLK_HPER;
        CLK<= '0';
        wait for gCLK_HPER;
    end process;

    P_RST: process
    begin 
        reset<='0';
        wait for gCLK_HPER/2;
        reset<='1';
        wait for gCLK_HPER*2;
        reset <= '0';
        wait;
    end process;

    P_TEST_CASES: process
    begin
        s_S0 <= x"0000000F";
        s_S1 <= x"0000000F";
        s_Cin <= '0';
        wait for gCLK_HPER*2;

        s_S0 <= x"11111111";
        s_S1 <= x"11111111";
        s_Cin <= '0';
        wait for gCLK_HPER*2;

        s_S0 <= x"AF5789CD";
        s_S1 <= x"12A45CD8";
        s_Cin <= '1';
        wait for gCLK_HPER*2;

        s_S0 <= x"F0000000";
        s_S1 <= x"F0000001";
        s_Cin <= '1';
        wait for gCLK_HPER*2;

        s_S0 <= x"FFFFFFFF";
        s_S1 <= x"FFFFFFFF";
        s_Cin <= '1';
        wait for gCLK_HPER*2;


    end process;
    
end mixed;