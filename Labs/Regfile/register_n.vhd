library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity register_n is
    generic(N : integer := 32);
    port(i_CLK,i_RST,i_WE : in STD_LOGIC;
         i_D : in STD_LOGIC_VECTOR(N-1 downto 0);
         o_Q : out STD_LOGIC_VECTOR(N-1 downto 0));
end register_n;

architecture mixed of register_n is

component dffg is
    port(i_CLK,i_RST,i_WE,i_D : in STD_LOGIC;
         o_Q : out STD_LOGIC);
end component;
signal s_D : STD_LOGIC_VECTOR(N-1 downto 0);--signal for the input of the flip flop
signal s_Q : STD_LOGIC_VECTOR(N-1 downto 0);--singal for the output

begin

    o_Q <= s_Q;

        with i_WE select
            s_D <= i_D when '1',--when write enable is high, the input of the flip flop is the input data
                   s_Q when others;--else keeep the same value
    
        process(i_CLK,i_RST)
        begin
            if(i_RST = '1') then --if reset is high, set all the outputs to 0
                s_Q <= (others => '0');
            elsif(rising_edge(i_CLK)) then
                s_Q <= s_D;
            end if;
        end process;
    
end mixed;