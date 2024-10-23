library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bitExtender is
    generic(gCLK_HPER : time := 50 ns);
end tb_bitExtender;


architecture mixed of tb_bitExtender is

    constant cCLK_PER : time := gCLK_HPER * 2;

    component bitExtender is 
        port(i: in std_logic_vector(15 downto 0);
             i_S : in std_logic; 
             o: out std_logic_vector(31 downto 0));
    end component;

    signal s_i: std_logic_vector(15 downto 0);
    signal s_S, s_CLK: std_logic;
    signal s_o: std_logic_vector(31 downto 0);

    begin

    DUT0: bitExtender
    port map(i => s_i,
             i_S => s_S,
             o => s_o);

    P_CLK: process
    begin 
        s_CLK <= '0';
        wait for gCLK_HPER;
        s_CLK <= '1';
        wait for gCLK_HPER;
    end process;

        
    P_TEST_CASES: process
    begin

        s_S <= '0';
        s_i <= x"FFFF";
        wait for cCLK_PER;


        s_S <= '1';
        s_i <= x"FFFF";
        wait for cCLK_PER;

        s_S <= '0';
        s_i <= x"0000";
        wait for cCLK_PER;

        s_S <= '1';
        s_i <= x"0000";
        wait for cCLK_PER;

    end process;

end mixed;
