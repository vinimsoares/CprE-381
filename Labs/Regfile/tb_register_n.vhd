library IEEE;
use IEEE.std_logic_1164.all;

entity tb_register_n is
  generic(gCLK_HPER   : time := 50 ns);
end tb_register_n;

architecture behavior of tb_register_n is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;


  component register_n 
  generic(N: integer := 32);
  port(i_CLK,i_RST,i_WE: in std_logic;
       i_D: in std_logic_vector(N-1 downto 0);
       o_Q: out std_logic_vector(N-1 downto 0));
  end component;
  constant N: integer := 32;
  signal s_CLK, s_RST, s_WE  : std_logic;
  signal s_D, s_Q : std_logic_vector(N-1 downto 0);

  begin 

    DUT: register_n
    port map(i_CLK => s_CLK, 
             i_RST => s_RST,
             i_WE  => s_WE,
             i_D   => s_D,
             o_Q   => s_Q);

    P_CLK: process
    begin
      s_CLK <= '0';
      wait for gCLK_HPER;
      s_CLK <= '1';
      wait for gCLK_HPER;
    end process;


    P_TEST_CASES: process
    begin

        s_RST <= '1';
        s_WE  <= '0';
        s_D   <= (others => '0');
        wait for cCLK_PER;

        s_RST <= '0';
        s_WE  <= '1';
        s_D   <= x"0000000F";
        wait for cCLK_PER;

        s_RST <= '0';
        s_WE  <= '1';
        s_D   <= x"00000FBA";
        wait for cCLK_PER;

        s_RST <= '0';
        s_WE  <= '0';
        s_D   <= x"000000E0";
        wait for cCLK_PER;

        s_RST <= '1';
        s_WE  <= '0';
        s_D   <= x"00000000";
        wait for cCLK_PER;

        s_RST <= '0';
        s_WE  <= '1';
        s_D   <= x"00000001";
        wait for cCLK_PER;
        
        wait;

end process;

end behavior;
