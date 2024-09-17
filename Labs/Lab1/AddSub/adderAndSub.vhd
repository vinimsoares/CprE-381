library IEEE;
use IEEE.std_logic_1164.all;

entity adderAndSub is 
    generic(N: integer := 32);
    port(i_S0,i_S1  : in std_logic_vector(N-1 downto 0);
         i_Cin      : in std_logic;
         i_nAdd_Sub : in std_logic;
         o_Sum      : out std_logic_vector(N-1 downto 0);
         o_Cout     : out std_logic);
end adderAndSub;

architecture structure of adderAndSub is

    component adder_n is
        generic(N: integer := 32);
        port(i_S0,i_S1  : in std_logic_vector(N-1 downto 0);
             i_Cin      : in std_logic;
             o_Sum      : out std_logic_vector(N-1 downto 0);
             o_Cout     : out std_logic);
    end component;
    --declared in /Lab1/mux2t1_N.vhd
    component mux2t1_N is
        generic(N : integer := 32);
        port(i_S          : in std_logic;
             i_D0         : in std_logic_vector(N-1 downto 0);
             i_D1         : in std_logic_vector(N-1 downto 0);
             o_O          : out std_logic_vector(N-1 downto 0));
    end component;

    component onescomp_n is
        generic(N : integer := 32);
        port(i_I    : in std_logic_vector(N-1 downto 0);
             o_O    : out std_logic_vector(N-1 downto 0));
    end component;
    signal s_onesComp_to_Mux1: std_logic_vector(N-1 downto 0);
    signal s_resultFromMux1: std_logic_vector(N-1 downto 0);
    signal s_Cin_select: std_logic;

    begin

    
    g_ONESCOMP_S1: onescomp_n
    port map(i_I=>i_S1, o_O=>s_onesComp_to_Mux1);
    
    g_Mux_S1: mux2t1_N
    port map(i_S=>i_nAdd_Sub, i_D0=>i_S1, i_D1=>s_onesComp_to_Mux1, o_O=>s_resultFromMux1);

    s_Cin_select <= i_nAdd_Sub when(i_nAdd_Sub = '1') else i_Cin;
    

    g_ADDER: adder_n
    port map(i_S0=>i_S0, i_S1=>s_resultFromMux1, i_Cin=>s_Cin_select, o_Sum=>o_Sum, o_Cout=>o_Cout);

    end structure;


