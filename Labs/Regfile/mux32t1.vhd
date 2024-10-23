library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux32t1 is
    port(i_SEL : in STD_LOGIC_VECTOR(4 downto 0);
         i_D0,i_D1,i_D2,i_D3,i_D4,i_D5,i_D6,i_D7,i_D8,i_D9,i_D10,i_D11,i_D12,i_D13,i_D14,i_D15,i_D16,i_D17,i_D18,i_D19,i_D20,i_D21,i_D22,i_D23,i_D24,i_D25,i_D26,i_D27,i_D28,i_D29,i_D30,i_D31 : in STD_LOGIC_VECTOR(31 downto 0);
         o_Q   : out STD_LOGIC_VECTOR(31 downto 0));
end mux32t1;

architecture mixed of mux32t1 is
begin

    with i_SEL SELECT
        o_Q <= i_D0 when "00000",
               i_D1 when "00001",
               i_D2 when "00010",
               i_D3 when "00011",
               i_D4 when "00100",
               i_D5 when "00101",
               i_D6 when "00110",
               i_D7 when "00111",
               i_D8 when "01000",
               i_D9 when "01001",
               i_D10 when "01010",
               i_D11 when "01011",
               i_D12 when "01100",
               i_D13 when "01101",
               i_D14 when "01110",
               i_D15 when "01111",
               i_D16 when "10000",
               i_D17 when "10001",
               i_D18 when "10010",
               i_D19 when "10011",
               i_D20 when "10100",
               i_D21 when "10101",
               i_D22 when "10110",
               i_D23 when "10111",
               i_D24 when "11000",
               i_D25 when "11001",
               i_D26 when "11010",
               i_D27 when "11011",
               i_D28 when "11100",
               i_D29 when "11101",
               i_D30 when "11110",
               i_D31 when "11111",
                x"00000000" when others;

end mixed;

    