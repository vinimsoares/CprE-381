library IEEE;
use IEEE.std_logic_1164.all;

entity tb_adderAndSub is
    generic(gCLK_HPER   : time := 10 ns);
end tb_adderAndSub;

architecture mixed of tb_adderAndSub is

component adderAndSub is 
    generic(N:  integer := 32);
    port(i_S0,i_S1  : in std_logic_vector(N-1 downto 0);
         i_Cin      : in std_logic;
         i_nAdd_Sub : in std_logic;
         o_Sum      : out std_logic_vector(N-1 downto 0);
         o_Cout     : out std_logic);
end component;

signal CLK, reset   : std_logic := '0';

constant N : integer := 32;

signal s_S0 : std_logic_vector(N-1 downto 0);
signal s_S1 : std_logic_vector(N-1 downto 0);
signal s_Sum : std_logic_vector(N-1 downto 0);
signal s_Cin : std_logic := '0';
signal s_nAdd_Sub : std_logic := '0';
signal s_Cout : std_logic := '0';

begin 

DUT0: adderAndSub
port map(i_S0=>s_S0,i_S1=>s_S1,i_Cin=>s_Cin,i_nAdd_Sub=>s_nAdd_Sub,o_Sum=>s_Sum,o_Cout=>s_Cout);

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
    s_S0 <= x"00000002";
    s_S1 <= x"00000001";
    s_Cin <= '0';
    s_nAdd_Sub <= '1';
    wait for gCLK_HPER*2;

    s_S0 <= x"00000002";
    s_S1 <= x"00000001";
    s_Cin <= '0';
    s_nAdd_Sub <= '0';
    wait for gCLK_HPER*2;

    s_S0 <= x"00000002";
    s_S1 <= x"00000001";
    s_Cin <= '1';
    s_nAdd_Sub <= '0';
    wait for gCLK_HPER*2;

    s_S0 <= x"FFFFFFFF";
    s_S1 <= x"FFFFFFFF";
    s_nAdd_Sub <= '1';
    s_Cin <= '0';
    wait for gCLK_HPER*2;

    s_S0 <= x"FFFFFFFF";
    s_S1 <= x"FFFFFFFF";
    s_nAdd_Sub <= '0';
    s_Cin <= '1';
    wait for gCLK_HPER*2;

    s_S0 <= x"FFFFFFFF";
    s_S1 <= x"FFFFFFFF";
    s_nAdd_Sub <= '0';
    s_Cin <= '0';
    wait for gCLK_HPER*2;



end process;

end mixed;