library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux32t1 is
    generic(gCLK_HPER : time := 50 ns);
end tb_mux32t1;

architecture mixed of tb_mux32t1 is

    constant cCLK_PER : time := gCLK_HPER * 2;

    component mux32t1
    port(i_SEL: in STD_LOGIC_VECTOR(4 downto 0);
         i_D0,i_D1,i_D2,i_D3,i_D4,i_D5,i_D6,i_D7,i_D8,i_D9,i_D10,i_D11,i_D12,i_D13,i_D14,i_D15,i_D16,i_D17,i_D18,i_D19,i_D20,i_D21,i_D22,i_D23,i_D24,i_D25,i_D26,i_D27,i_D28,i_D29,i_D30,i_D31 : in STD_LOGIC_VECTOR(31 downto 0);
         o_Q: out STD_LOGIC_VECTOR(31 downto 0));
    end component;
    
    signal s_SEL: STD_LOGIC_VECTOR(4 downto 0);
    signal s_D0,s_D1,s_D2,s_D3,s_D4,s_D5,s_D6,s_D7,s_D8,s_D9,s_D10,s_D11,s_D12,s_D13,s_D14,s_D15,s_D16,s_D17,s_D18,s_D19,s_D20,s_D21,s_D22,s_D23,s_D24,s_D25,s_D26,s_D27,s_D28,s_D29,s_D30,s_D31 : STD_LOGIC_VECTOR(31 downto 0);
    signal s_Q: STD_LOGIC_VECTOR(31 downto 0);
    signal s_CLK: STD_LOGIC;

begin

    DUT0: mux32t1
    port map(i_SEL => s_SEL,
             i_D0 => s_D0,
             i_D1 => s_D1,
             i_D2 => s_D2,
             i_D3 => s_D3,
             i_D4 => s_D4,
             i_D5 => s_D5,
             i_D6 => s_D6,
             i_D7 => s_D7,
             i_D8 => s_D8,
             i_D9 => s_D9,
             i_D10 => s_D10,
             i_D11 => s_D11,
             i_D12 => s_D12,
             i_D13 => s_D13,
             i_D14 => s_D14,
             i_D15 => s_D15,
             i_D16 => s_D16,
             i_D17 => s_D17,
             i_D18 => s_D18,
             i_D19 => s_D19,
             i_D20 => s_D20,
             i_D21 => s_D21,
             i_D22 => s_D22,
             i_D23 => s_D23,
             i_D24 => s_D24,
             i_D25 => s_D25,
             i_D26 => s_D26,
             i_D27 => s_D27,
             i_D28 => s_D28,
             i_D29 => s_D29,
             i_D30 => s_D30,
             i_D31 => s_D31,
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

        s_D0 <= x"FFFFFFFF";
        s_SEL <= "00000";
        wait for cCLK_PER;


        s_D1 <= x"00000CBA";
        s_SEL <= "00001";
        wait for cCLK_PER;

        s_D5 <= x"00000FBA";
        s_SEL <= "00101";
        wait for cCLK_PER;

        s_D25 <= x"05020FBA";
        s_SEL <= "11001";
        wait for cCLK_PER;

        s_D31 <= x"030B0FEA";
        s_SEL <= "11111";
        wait for cCLK_PER;


    end process;
             
    
    
    
end architecture mixed;