library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_BIT.ALL;


entity bitExtender is 
    port(i: in std_logic_vector(15 downto 0);
         i_S : in std_logic; -- select line, 0 for zero extension, 1 for sign extension
         o: out std_logic_vector(31 downto 0));
end bitExtender;


architecture mixed of bitExtender is

   
begin
    process(i, i_S)
    begin 
        if (i_S ='0' or (i_S='1' and i(15) = '0')) then  o <= (x"0000" & i);
        else o <= x"FFFF" & i;
        end if;

    end process;

end mixed ; 