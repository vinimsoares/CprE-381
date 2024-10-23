xlibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile is
    port(i_CLK,i_RST,i_WE : in STD_LOGIC;
         i_D : in STD_LOGIC_VECTOR(31 downto 0);
         i_read1,i_read2,i_write : in STD_LOGIC_VECTOR(4 downto 0);
         o_R0,o_R1 : out STD_LOGIC_VECTOR(31 downto 0));
end regfile;

architecture mixed of regfile is

    component register_n is
        generic(N : integer := 32);
        port(i_CLK,i_RST,i_WE : in STD_LOGIC;
             i_D : in STD_LOGIC_VECTOR(N-1 downto 0);
             o_Q : out STD_LOGIC_VECTOR(N-1 downto 0));
    end component;

    component decoder5to32 is
        port(i_D : in STD_LOGIC_VECTOR(4 downto 0);
             i_WE : in STD_LOGIC;
             o_Q : out STD_LOGIC_VECTOR(31 downto 0));
    end component;

    component mux32t1 is
        port(i_SEL : in STD_LOGIC_VECTOR(4 downto 0);
             i_D0,i_D1,i_D2,i_D3,i_D4,i_D5,i_D6,i_D7,i_D8,i_D9,i_D10,i_D11,i_D12,i_D13,i_D14,i_D15,i_D16,i_D17,i_D18,i_D19,i_D20,i_D21,i_D22,i_D23,i_D24,i_D25,i_D26,i_D27,i_D28,i_D29,i_D30,i_D31 : in STD_LOGIC_VECTOR(31 downto 0);
             o_Q : out STD_LOGIC_VECTOR(31 downto 0));

    end component;

    signal s_write : STD_LOGIC_VECTOR(31 downto 0);
    signal s_regout0,s_regout1,s_regout2, s_regout3, s_regout4, s_regout5, s_regout6, s_regout7, s_regout8, s_regout9, s_regout10, s_regout11, s_regout12, s_regout13, s_regout14, s_regout15, s_regout16, s_regout17, s_regout18, s_regout19, s_regout20, s_regout21, s_regout22, s_regout23, s_regout24, s_regout25, s_regout26, s_regout27, s_regout28, s_regout29, s_regout30, s_regout31 : STD_LOGIC_VECTOR(31 downto 0);
   

    begin
    g_Decoder : decoder5to32 port map(i_D=> i_write,i_WE=>i_WE,o_Q=> s_write);
     --Hard coded register $zero to 0
    g_reg0 : register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>'0',i_D=>x"00000000",o_Q=> s_regout0);

    g_reg1: register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(1),i_D=>i_D,o_Q=>s_regout1);
    g_reg2: register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(2),i_D=>i_D,o_Q=>s_regout2);
    g_reg3 :register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(3),i_D=>i_D,o_Q=>s_regout3);
    g_reg4: register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(4),i_D=>i_D,o_Q=>s_regout4);
    g_reg5: register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(5),i_D=>i_D,o_Q=>s_regout5);
    g_reg6: register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(6),i_D=>i_D,o_Q=>s_regout6);
    g_reg7: register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(7),i_D=>i_D,o_Q=>s_regout7);
    g_reg8: register_n port map(i_CLK=>i_CLK,i_RST=>i_RST,i_WE=>s_write(8),i_D=>i_D,o_Q=>s_regout8);
    g_reg9: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(9), i_D=>i_D, o_Q=>s_regout9);
    g_reg10: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(10), i_D=>i_D, o_Q=>s_regout10);
    g_reg11: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(11), i_D=>i_D, o_Q=>s_regout11);
    g_reg12: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(12), i_D=>i_D, o_Q=>s_regout12);
    g_reg13: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(13), i_D=>i_D, o_Q=>s_regout13);
    g_reg14: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(14), i_D=>i_D, o_Q=>s_regout14);
    g_reg15: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(15), i_D=>i_D, o_Q=>s_regout15);
    g_reg16: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(16), i_D=>i_D, o_Q=>s_regout16);
    g_reg17: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(17), i_D=>i_D, o_Q=>s_regout17);
    g_reg18: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(18), i_D=>i_D, o_Q=>s_regout18);
    g_reg19: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(19), i_D=>i_D, o_Q=>s_regout19);
    g_reg20: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(20), i_D=>i_D, o_Q=>s_regout20);
    g_reg21: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(21), i_D=>i_D, o_Q=>s_regout21);
    g_reg22: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(22), i_D=>i_D, o_Q=>s_regout22);
    g_reg23: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(23), i_D=>i_D, o_Q=>s_regout23);
    g_reg24: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(24), i_D=>i_D, o_Q=>s_regout24);
    g_reg25: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(25), i_D=>i_D, o_Q=>s_regout25);
    g_reg26: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(26), i_D=>i_D, o_Q=>s_regout26);
    g_reg27: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(27), i_D=>i_D, o_Q=>s_regout27);
    g_reg28: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(28), i_D=>i_D, o_Q=>s_regout28);
    g_reg29: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(29), i_D=>i_D, o_Q=>s_regout29);
    g_reg30: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(30), i_D=>i_D, o_Q=>s_regout30);
    g_reg31: register_n port map(i_CLK=>i_CLK, i_RST=>i_RST, i_WE=>s_write(31), i_D=>i_D, o_Q=>s_regout31);
 


    g_mux0: mux32t1 port map(i_SEL=>i_read1,i_D0=>s_regout0,i_D1=>s_regout1,i_D2=>s_regout2,i_D3=>s_regout3,i_D4=>s_regout4,i_D5=>s_regout5,i_D6=>s_regout6,i_D7=>s_regout7,i_D8=>s_regout8,i_D9=>s_regout9,i_D10=>s_regout10,i_D11=>s_regout11,i_D12=>s_regout12,i_D13=>s_regout13,i_D14=>s_regout14,i_D15=>s_regout15,i_D16=>s_regout16,i_D17=>s_regout17,i_D18=>s_regout18,i_D19=>s_regout19,i_D20=>s_regout20,i_D21=>s_regout21,i_D22=>s_regout22,i_D23=>s_regout23,i_D24=>s_regout24,i_D25=>s_regout25,i_D26=>s_regout26,i_D27=>s_regout27,i_D28=>s_regout28,i_D29=>s_regout29,i_D30=>s_regout30,i_D31=>s_regout31,o_Q=>o_R0);
    g_mux1: mux32t1 port map(i_SEL=>i_read2,i_D0=>s_regout0,i_D1=>s_regout1,i_D2=>s_regout2,i_D3=>s_regout3,i_D4=>s_regout4,i_D5=>s_regout5,i_D6=>s_regout6,i_D7=>s_regout7,i_D8=>s_regout8,i_D9=>s_regout9,i_D10=>s_regout10,i_D11=>s_regout11,i_D12=>s_regout12,i_D13=>s_regout13,i_D14=>s_regout14,i_D15=>s_regout15,i_D16=>s_regout16,i_D17=>s_regout17,i_D18=>s_regout18,i_D19=>s_regout19,i_D20=>s_regout20,i_D21=>s_regout21,i_D22=>s_regout22,i_D23=>s_regout23,i_D24=>s_regout24,i_D25=>s_regout25,i_D26=>s_regout26,i_D27=>s_regout27,i_D28=>s_regout28,i_D29=>s_regout29,i_D30=>s_regout30,i_D31=>s_regout31,o_Q=>o_R1);






end mixed;
