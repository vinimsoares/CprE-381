library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity firstDataPath is
    port(i_CLK,i_RST,i_WE : in std_logic; --Clock, Reset, Write Enable
         i_D : in std_logic_vector(31 downto 0); --Data
         ALUSrc : in std_logic; --ALU Source
         i_nAdd_Sub : in std_logic; --Add or Subtract
         i_IMM : in std_logic_vector(31 downto 0); --Immediate Value
         i_read1,i_read2,i_write : in std_logic_vector(4 downto 0); --Read and Write Registers
         o_Dataout: out std_logic_vector(31 downto 0);--outputs of the regiterfile
         o_rtOutput: out std_logic_vector(31 downto 0)); --output of the read2

end firstDataPath;


architecture structural of firstDataPath is

    component regfile is
        port(i_CLK,i_RST,i_WE : in std_logic;
             i_D : in std_logic_vector(31 downto 0);
             i_read1,i_read2,i_write : in std_logic_vector(4 downto 0);
             o_R0,o_R1 : out std_logic_vector(31 downto 0));
    end component;

    component mux2t1_N is
        port(i_S : in std_logic;
             i_D0,i_D1 : in std_logic_vector(31 downto 0);
             o_O : out std_logic_vector(31 downto 0));
    end component;

    component AdderAndSub is
        port(i_S0,i_S1  : in std_logic_vector(31 downto 0);
             i_Cin      : in std_logic;
             i_nAdd_Sub : in std_logic;
             o_Sum      : out std_logic_vector(31 downto 0);
             o_Cout     : out std_logic);
    end component;

        signal mux_output : std_logic_vector(31 downto 0);
        signal s_R0,s_R1 : std_logic_vector(31 downto 0);
        signal s_Datain : std_logic_vector(31 downto 0);

    begin
    
    g_regfile : regfile port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>i_WE,i_D=>s_Datain,i_read1=>i_read1,i_read2=>i_read2,i_write=>i_write,o_R0=>s_R0,o_R1=>s_R1);
    g_mux2t1_N : mux2t1_N port map(i_S=>ALUSrc,i_D0=>s_R1,i_D1=>i_IMM,o_O=>mux_output); --Mux for ALU Source
    --Register File

    g_AdderAndSub : AdderAndSub port map(i_S0=>s_R0,i_S1=>mux_output,i_Cin=>'0',i_nAdd_Sub=>i_nAdd_Sub,o_Sum=>s_Datain,o_Cout=>open);
    o_Dataout <= s_Datain;
    o_rtOutput <= s_R1;



end structural ; -- structural