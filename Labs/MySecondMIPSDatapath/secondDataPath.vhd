library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity secondDataPath is
    port(i_CLK,i_RST, i_WE , i_ALUSrc: in STD_LOGIC;
         i_s1,i_s2,i_write : in STD_LOGIC_VECTOR(4 downto 0);
         i_memSel,i_extension, i_nAdd_Sub,i_memWE: in STD_LOGIC;
         i_IMM : in STD_LOGIC_VECTOR(15 downto 0);
         o_data: out STD_LOGIC_VECTOR(31 downto 0));
end secondDataPath;

architecture vini of secondDataPath is 

component regfile is
    port(i_CLK,i_RST,i_WE : in std_logic;
         i_D : in std_logic_vector(31 downto 0);
         i_read1,i_read2,i_write : in std_logic_vector(4 downto 0);
         o_R0,o_R1 : out std_logic_vector(31 downto 0));
end component;


component AdderAndSub is
    port(i_S0,i_S1  : in std_logic_vector(31 downto 0);
         i_Cin      : in std_logic;
         i_nAdd_Sub : in std_logic;
         o_Sum      : out std_logic_vector(31 downto 0);
         o_Cout     : out std_logic);
end component;



    component mem is
        generic(DATA_WIDTH : integer := 32;
                ADDR_WIDTH : integer := 10);
        port(clk : in std_logic;
             addr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
             data : in std_logic_vector(DATA_WIDTH-1 downto 0);
             we : in std_logic;
             q : out std_logic_vector(DATA_WIDTH-1 downto 0));
    end component;


    component bitExtender is 
        port(i: in std_logic_vector(15 downto 0);
             i_S : in std_logic; 
             o: out std_logic_vector(31 downto 0));
    end component;

    component mux2t1_N is
        port(i_S : in std_logic;
             i_D0,i_D1 : in std_logic_vector(31 downto 0);
             o_O : out std_logic_vector(31 downto 0));
    end component;

    signal s_data : std_logic_vector(31 downto 0);
    signal s_memSel,s_extension, s_addnsub : std_logic;
    signal s_CLK, s_RST, s_WE, s_memWE : std_logic;
    signal s_outputofALU, s_outputofExtnder, s_rtValue,s_DataoutofMem : std_logic_vector(31 downto 0);
    signal s_R0,s_R1 : std_logic_vector(31 downto 0);
    signal mux_output : std_logic_vector(31 downto 0);


begin

    
    g_regfile : regfile port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>i_WE,i_D=>s_data,i_read1=>i_s1,i_read2=>i_s2,i_write=>i_write,o_R0=>s_R0,o_R1=>s_R1);
    
    g_bitExtender : bitExtender port map(i=>i_IMM,i_S=>i_extension,o=>s_outputofExtnder);

    g_mux2t1_N : mux2t1_N port map(i_S=>i_ALUSrc,i_D0=>s_R1,i_D1=>s_outputofExtnder,o_O=>mux_output); --Mux for ALU Source
    --Register File

    g_AdderAndSub : AdderAndSub port map(i_S0=>s_R0,i_S1=>mux_output,i_Cin=>'0',i_nAdd_Sub=>i_nAdd_Sub,o_Sum=>s_outputofALU,o_Cout=>open);

    dmem: mem port map(clk => i_CLK, addr => s_outputofALU(11 downto 2), data => s_R1, we => i_memWE, q => s_DataoutofMem);

    g_mux2t1_N2 : mux2t1_N port map(i_S=>i_memSel,i_D0=>s_outputofALU,i_D1=>s_DataoutofMem,o_O=>s_data); --Mux for ALU Source

    o_data <= s_data;


  

end vini; -- vini
