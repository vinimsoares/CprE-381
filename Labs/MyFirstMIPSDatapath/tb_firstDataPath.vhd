library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_firstDataPath is
    generic (gCLK_HPER : time := 50 ns);
end tb_firstDataPath;


architecture mixed of tb_firstDataPath is

    constant cCLK_PER : time := gCLK_HPER * 2;

    component firstDataPath
    port(i_CLK,i_RST,i_WE : in std_logic; --Clock, Reset, Write Enable
         i_D : in std_logic_vector(31 downto 0); --Data
         ALUSrc : in std_logic; --ALU Source
         i_nAdd_Sub : in std_logic; --Add or Subtract
         i_IMM : in std_logic_vector(31 downto 0); --Immediate Value
         i_read1,i_read2,i_write : in std_logic_vector(4 downto 0); --both reads set the registers to be used in the ALU
         o_Dataout: out std_logic_vector(31 downto 0);--outputs of the regiterfile
         o_rtOutput: out std_logic_vector(31 downto 0)); --output of the read2
    end component;

    signal s_CLK, s_RST, s_WE: std_logic;
    signal s_D, s_IMM: std_logic_vector(31 downto 0);
    signal s_read1,s_read2,s_write: std_logic_vector(4 downto 0);
    signal s_Dataout: std_logic_vector(31 downto 0);
    signal s_rtOutput: std_logic_vector(31 downto 0);
    signal s_ALUSrc, s_nAdd_Sub: std_logic;

    begin

        DUT0: firstDataPath
        port map(i_CLK => s_CLK,
                 i_RST => s_RST,
                 i_WE => s_WE,
                 i_D => s_D,
                 ALUSrc => s_ALUSrc,
                 i_nAdd_Sub => s_nAdd_Sub,
                 i_IMM => s_IMM,
                 i_read1 => s_read1,
                 i_read2 => s_read2,
                 i_write => s_write,
                 o_Dataout => s_Dataout,
                 o_rtOutput => s_rtOutput);

        P_CLK: process
        begin
            s_CLK <= '0';
            wait for gCLK_HPER;
            s_CLK <= '1';
            wait for gCLK_HPER;
        end process;

        P_TEST_CASES: process
        begin
            
            s_WE <= '0';
            s_RST <= '1';
            s_D <= x"00000000";
            s_ALUSrc <= '0';
            s_nAdd_Sub <= '0';
            s_IMM <= x"00000000";
            s_read1 <= "00000";
            s_read2 <= "00000";
            s_write <= "00000";
            wait for cCLK_PER;


            s_WE <= '1';
            s_RST <= '0';
            s_IMM <= x"00000001";
            s_ALUSrc <= '1';
            s_read1 <= "00000";
            s_read2 <= "00001";
            s_write <= "00001";
            wait for cCLK_PER;

            s_IMM <= x"00000002";
            s_ALUSrc <= '1';
            s_read1 <= "00000";
            s_read2 <= "00010";
            s_write <= "00010";
            wait for cCLK_PER;

            s_IMM <= x"00000003";
            s_ALUSrc <= '1';
            s_read1 <= "00000";
            s_read2 <= "00011";
            s_write <= "00011";
            wait for cCLK_PER;

            s_IMM <= x"00000004";
            s_read1 <= "00000";
            s_read2 <= "00100";
            s_write <= "00100";
            wait for cCLK_PER;

            s_IMM <= x"00000005";
            s_read1 <= "00000";
            s_read2 <= "00101";
            s_write <= "00101";
            wait for cCLK_PER;

            s_IMM <= x"00000006";
            s_read1 <= "00000";
            s_read2 <= "00110";
            s_write <= "00110";
            wait for cCLK_PER;

            s_IMM <= x"00000007";
            s_read1 <= "00000";
            s_read2 <= "00111";
            s_write <= "00111";
            wait for cCLK_PER;

            s_IMM <= x"00000008";
            s_read1 <= "00000";
            s_read2 <= "01000";
            s_write <= "01000";
            wait for cCLK_PER;

            s_IMM <= x"00000009";
            s_read1 <= "00000";
            s_read2 <= "01001";
            s_write <= "01001";
            wait for cCLK_PER;

            s_IMM <= x"0000000A";
            s_read1 <= "00000";
            s_read2 <= "01010";
            s_write <= "01010";
            wait for cCLK_PER;

            s_ALUSrc <= '0';
            s_read1 <= "00001";
            s_read2 <= "00010";
            s_write <= "01011";
            wait for cCLK_PER;

            s_read1 <= "01011";
            s_read2 <= "00011";
            s_write <= "01100";
            s_nAdd_Sub <= '1';
            wait for cCLK_PER;

            s_nAdd_Sub <= '0';
            s_read1 <= "01100";
            s_read2 <= "00100";
            s_write <= "01101";
            wait for cCLK_PER;

            s_nAdd_Sub <= '1';
            s_read1 <= "01101";
            s_read2 <= "00101";
            s_write <= "01110";
            wait for cCLK_PER;

            s_nAdd_Sub <= '0';
            s_read1 <= "01110";
            s_read2 <= "00110";
            s_write <= "01111";
            wait for cCLK_PER;


            s_nAdd_Sub <= '1';
            s_read1 <= "01111";
            s_read2 <= "00111";
            s_write <= "10000";
            wait for cCLK_PER;

            s_nAdd_Sub <= '0';
            s_read1 <= "10000";
            s_read2 <= "01000";
            s_write <= "10001"; --17
            wait for cCLK_PER;

            s_nAdd_Sub <= '1';
            s_read1 <= "10001";
            s_read2 <= "01001";
            s_write <= "10010";--18
            wait for cCLK_PER;

            s_nAdd_Sub <= '0';
            s_read1 <= "10010";
            s_read2 <= "01010";
            s_write <= "10011";--19
            wait for cCLK_PER;

            s_ALUSrc <= '1';
            s_read1 <= "00000";--00
            s_write <= "10100"; --20
            s_IMM <= x"FFFFFFDD";-- (-35)
            wait for cCLK_PER;

            s_ALUSrc <= '0';
            s_read1 <= "10011";
            s_read2 <= "10100";
            s_write <= "10101";
            wait for cCLK_PER;

            wait;





            





        end process;


end mixed;