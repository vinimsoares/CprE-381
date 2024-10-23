library IEEE;
use IEEE.std_logic_1164.all;

entity tb_decoder5to32 is
    generic (gCLK_HPER : time := 50 ns);
end tb_decoder5to32;

architecture behavior of tb_decoder5to32 is

    -- Calculate the clock period as twice the half-period
    constant cCLK_PER : time := gCLK_HPER * 2;

    component decoder5to32
    port(i_D : in std_logic_vector(4 downto 0);
         i_WE : in std_logic;
         o_Q : out std_logic_vector(31 downto 0));
    end component;

    signal s_D : std_logic_vector(4 downto 0);
    signal s_Q : std_logic_vector(31 downto 0);
    signal s_CLK, s_WE: std_logic;

    begin 

    DUT0: decoder5to32
    port map(i_D => s_D, 
            i_WE => s_WE,
             o_Q => s_Q);
    
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
        s_D <= "01101";
        wait for cCLK_PER;
        s_WE <= '1';
        s_D <= "01010";
        wait for cCLK_PER;


        s_D <= "01001";
        wait for cCLK_PER;

        s_D <= "11111";
        wait for cCLK_PER;

       s_WE <= '0';
        s_D <= "00100";
        wait for cCLK_PER;

        s_WE <= '1';
        s_D <= "00101";
        wait for cCLK_PER;


    end process;

end behavior;


