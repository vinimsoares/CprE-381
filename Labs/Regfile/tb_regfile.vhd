library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_regfile is
    generic (gCLK_HPER : time := 50 ns);
end tb_regfile;


architecture mixed of tb_regfile is

    constant cCLK_PER : time := gCLK_HPER * 2;

    component regfile
    port(i_CLK,i_RST, i_WE : in STD_LOGIC;
         i_D : in STD_LOGIC_VECTOR(31 downto 0);
         i_read1,i_read2,i_write : in STD_LOGIC_VECTOR(4 downto 0);
         o_R0,o_R1 : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    signal s_CLK, s_WE: std_logic;
    signal s_RST: std_logic;
    signal s_D: std_logic_vector(31 downto 0);
    signal s_read1,s_read2,s_write: std_logic_vector(4 downto 0);
    signal s_R0,s_R1: std_logic_vector(31 downto 0);

    begin

        DUT0: regfile
        port map(i_CLK => s_CLK,
                 i_RST => s_RST,
                 i_WE => s_WE,
                 i_D => s_D,
                 i_read1 => s_read1,
                 i_read2 => s_read2,
                 i_write => s_write,
                 o_R0 => s_R0,
                 o_R1 => s_R1);

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
            s_read1 <= "00000";
            s_read2 <= "00000";
            s_write <= "00000";
            wait for cCLK_PER;

            s_WE <= '1';
            s_RST <= '0';
            s_D <= x"FFFFFFFF";
            s_read1 <= "11111";
            s_read2 <= "00000";
            s_write <= "11111";
            wait for cCLK_PER;

            s_WE <= '1';
            s_RST <= '0';
            s_D <= x"0A0A0A0A";
            s_read1 <= "00101";
            s_read2 <= "11111";
            s_write <= "00101";
            wait for cCLK_PER;

            s_WE <= '0';
            s_RST <= '0';
            s_D <= x"0A3A5D4C";
            s_read1 <= "00101";
            s_read2 <= "11111";
            s_write <= "11111";
            wait for cCLK_PER;

            s_WE <= '1';
            s_RST <= '0';
            s_D <= x"DEADBEEF";
            s_read1 <= "00101";
            s_read2 <= "11111";
            s_write <= "11111";
            wait for cCLK_PER;
            wait for cCLK_PER;

        end process;
    



end mixed ;