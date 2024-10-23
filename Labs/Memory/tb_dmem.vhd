library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_dmem is

    generic(gCLK_HPER : time := 50 ns);
end tb_dmem;

architecture mixed of tb_dmem is

    constant cCLK_PER : time := gCLK_HPER * 2;


    signal s_CLK, s_RST, s_WE : std_logic;
    signal s_ADDR : std_logic_vector(9 downto 0);
    signal s_DATA : std_logic_vector(31 downto 0);
    signal s_Q : std_logic_vector(31 downto 0);
   

    begin

    dmem: entity work.mem
    generic map(DATA_WIDTH => 32, ADDR_WIDTH => 10)
    port map(clk => s_CLK, addr => s_ADDR, data => s_DATA, we => s_WE, q => s_Q);

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
    s_DATA <= x"00000000";
    s_ADDR <= "0000000000";
    wait for cCLK_PER;
    
    s_RST <= '0';
    s_ADDR <= "0000000000";
    wait for cCLK_PER;

    s_ADDR <= "0000000001";
    wait for cCLK_PER;

    s_ADDR <= "0000000010";
    wait for cCLK_PER;

    s_ADDR <= "0000000011";
    wait for cCLK_PER;

    s_ADDR <= "0000000100";
    wait for cCLK_PER;

    s_ADDR <= "0000000101";
    wait for cCLK_PER;

    s_ADDR <= "0000000110";
    wait for cCLK_PER;

    s_ADDR <= "0000000111";
    wait for cCLK_PER;

    s_ADDR <= "0000001000";
    wait for cCLK_PER;

    s_ADDR <= "0000001001";
    wait for cCLK_PER;

    s_ADDR <= "0000000000";
    wait for cCLK_PER;
    s_DATA <= s_Q;
    s_WE <= '1';
    s_ADDR <= "0100000000";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000000001";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100000001";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000000010";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100000010";
    wait for cCLK_PER;
    
    s_WE <= '0';
    s_ADDR <= "0000000011";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100000011";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000000100";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100000100";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000000101";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100000101";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000000110";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100000110";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000000111";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100000111";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000001000";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100001000";
    wait for cCLK_PER;

    s_WE <= '0';
    s_ADDR <= "0000001001";
    wait for cCLK_PER;
    s_WE <= '1';
    s_DATA <= s_Q;
    s_ADDR <= "0100001001";
    wait for cCLK_PER;




    wait;
    end process;


 end architecture mixed;

