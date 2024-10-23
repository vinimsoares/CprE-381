library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_secondDataPath is
    generic (gCLK_HPER : time := 50 ns);
end tb_secondDataPath;


architecture testbench of tb_secondDataPath is

    constant cCLK_PER : time := gCLK_HPER * 2;

    component secondDataPath
    port(i_CLK,i_RST, i_WE : in std_logic;
         i_s1,i_s2,i_write : in std_logic_vector(4 downto 0);
         i_memSel,i_extension, i_ALUSrc, i_nAdd_Sub,i_memWE: in std_logic;
         i_IMM : in std_logic_vector(15 downto 0);
         o_data: out std_logic_vector(31 downto 0));
    end component;

    signal s_CLK, s_RST, s_WE: std_logic;
    signal s_s1,s_s2,s_write: std_logic_vector(4 downto 0);
    signal s_dataIn: std_logic_vector(31 downto 0);
    signal s_memSel,s_extension, s_ALUSrc, s_nAdd_Sub, s_memWE: std_logic;
    signal s_IMM: std_logic_vector(15 downto 0);

begin

    DUT: secondDataPath
    port map(i_CLK => s_CLK,
             i_RST => s_RST,
             i_WE => s_WE,
             i_s1 => s_s1,
             i_s2 => s_s2,
             i_write => s_write,
             i_memSel => s_memSel,
             i_extension => s_extension,
             i_ALUSrc => s_ALUSrc,
             i_nAdd_Sub => s_nAdd_Sub,
             i_memWE => s_memWE,
             i_IMM => s_IMM,
             o_data => s_dataIn);

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
        s_s1 <= "00000";
        s_s2 <= "00000";
        s_write <= "00000";
        s_memSel <= '0';
        s_extension <= '0';
        s_ALUSrc <= '0';
        s_nAdd_Sub <= '0';
        s_memWE <= '0';
        s_IMM <= x"0000";
        wait for cCLK_PER;

        s_WE <= '1';
        s_RST <= '0';
        s_s1 <= "00000";
        s_write <= "11001";
        s_ALUSrc <= '1';
        s_IMM <= x"0000";
        wait for cCLK_PER;

        s_WE <= '1';
        s_write <= "11010";
        s_IMM <= x"0100";--256
        wait for cCLK_PER;--addi $26, $0, 256

        s_WE <= '1';
        s_s1 <= "11001";--$25 base address
        s_IMM <= x"0000";--offset
        s_write <= "00001";--$1
        s_s2 <= "00000";--rt
        s_memSel <= '1';
        wait for cCLK_PER;--lw $1, 0($25)


        --we use the same base address
        s_IMM <= x"0004";--offset
        s_write <= "00010";--$2
        wait for cCLK_PER;--lw $2, 4($25)

        s_s1 <= "00001";--$1 as first argument
        s_s2 <= "00010";--$2 as second argument
        s_write <= "00001";--write to $1
        s_IMM <= x"0000";--imm to 0
        s_ALUSrc <= '0';--use value from s2
        s_memSel <= '0';--save the value from the ALU
        wait for cCLK_PER;--add $1, $1, $2

        s_WE <= '0';
        s_memWE <= '1';
        s_s1 <= "11010";--$26 as first argument
        s_s2 <= "00001";--$1 as second argument
        s_memSel <= '1';--show the output of the memory
        wait for cCLK_PER;--sw $1, 0($26)

        s_ALUSrc <= '1';
        s_WE <= '1';
        s_memWE <= '0';
        s_s1 <= "11001";--$25 as base address
        s_write <= "00010";--$2
        s_IMM <= x"0008";--offset
        wait for cCLK_PER;--lw $2, 8($25)

        s_s1 <= "00001";--$1 as first argument
        s_s2 <= "00010";--$2 as second argument
        s_write <= "00001";--write to $1
        s_IMM <= x"0000";--imm to 0
        s_ALUSrc <= '0';--use value from s2
        s_memSel <= '0';--save the value from the ALU
        wait for cCLK_PER;--add $1, $1, $2

        s_ALUSrc <= '1';
        s_WE <= '0';
        s_memWE <= '1';
        s_s1 <= "11010";--$26 as first argument
        s_s2 <= "00001";--$1 as second argument
        s_memSel <= '1';--show the output of the memory
        s_IMM <= x"0004";--offset
        wait for cCLK_PER;--sw $1, 4($26)

        s_WE <= '1';
        s_memWE <= '0';
        s_s1 <= "11001";--$25 as base address
        s_write <= "00010";--$1
        s_IMM <= x"000C";--offset
        wait for cCLK_PER;--lw $2, 12($25)

        s_s1 <= "00001";--$1 as first argument
        s_s2 <= "00010";--$2 as second argument
        s_write <= "00001";--write to $1
        s_IMM <= x"0000";--imm to 0
        s_ALUSrc <= '0';--use value from s2
        s_memSel <= '0';--save the value from the ALU
        wait for cCLK_PER;--add $1, $1, $2

        s_ALUSrc <= '1';
        s_WE <= '0';
        s_memWE <= '1';
        s_s1 <= "11010";--$26 as first argument
        s_s2 <= "00001";--$1 as second argument
        s_memSel <= '1';--show the output of the memory
        s_IMM <= x"0008";--offset
        wait for cCLK_PER;--sw $1, 8($26)

        s_WE <= '1';
        s_memWE <= '0';
        s_s1 <= "11001";--$25 as base address
        s_write <= "00010";--$2
        s_IMM <= x"0010";--offset
        wait for cCLK_PER;--lw $2, 16($25)

        s_s1 <= "00001";--$1 as first argument
        s_s2 <= "00010";--$2 as second argument
        s_write <= "00001";--write to $1
        s_IMM <= x"0000";--imm to 0
        s_ALUSrc <= '0';--use value from s2
        s_memSel <= '0';--save the value from the ALU
        wait for cCLK_PER;--add $1, $1, $2

        s_ALUSrc <= '1';
        s_WE <= '0';
        s_memWE <= '1';
        s_s1 <= "11010";--$26 as first argument
        s_s2 <= "00001";--$1 as second argument
        s_memSel <= '1';--show the output of the memory
        s_IMM <= x"000C";--offset
        wait for cCLK_PER;--sw $1, 12($26)

        s_WE <= '1';
        s_memWE <= '0';
        s_s1 <= "11001";--$25 as base address
        s_write <= "00010";--$2
        s_IMM <= x"0014";--offset
        wait for cCLK_PER;--lw $2, 20($25)

        s_s1 <= "00001";--$1 as first argument
        s_s2 <= "00010";--$2 as second argument
        s_write <= "00001";--write to $1
        s_IMM <= x"0000";--imm to 0
        s_ALUSrc <= '0';--use value from s2
        s_memSel <= '0';--save the value from the ALU
        wait for cCLK_PER;--add $1, $1, $2

        s_ALUSrc <= '1';
        s_WE <= '0';
        s_memWE <= '1';
        s_s1 <= "11010";--$26 as first argument
        s_s2 <= "00001";--$1 as second argument
        s_memSel <= '1';--show the output of the memory
        s_IMM <= x"0010";--offset
        wait for cCLK_PER;--sw $1, 16($26)

        s_WE <= '1';
        s_memWE <= '0';
        s_s1 <= "11001";--$25 as base address
        s_write <= "00010";--$2
        s_IMM <= x"0018";--offset
        wait for cCLK_PER;--lw $2, 24($25)

        s_s1 <= "00001";--$1 as first argument
        s_s2 <= "00010";--$2 as second argument
        s_write <= "00001";--write to $1
        s_IMM <= x"0000";--imm to 0
        s_ALUSrc <= '0';--use value from s2
        s_memSel <= '0';--save the value from the ALU
        wait for cCLK_PER;--add $1, $1, $2

        s_ALUSrc <= '1';
        s_WE <= '1';
        s_memWE <= '0';
        s_s1 <="00000";
        s_IMM <= x"0200";
        s_write <= "11011";
        wait for cCLK_PER;--addi $27, $0, 512

        s_WE <= '0';
        s_memWE <= '1';
        s_s1 <= "11011";--$27 as first argument
        s_s2 <= "00001";--$1 as second argument
        s_memSel <= '1';--show the output of the memory
        s_IMM <= x"FFFC";--offset
        wait for cCLK_PER;--sw $1, -4($27)
        
        


       end process;

end testbench;