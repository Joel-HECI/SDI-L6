library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_CONT is
end entity;

architecture Behavioral of testbench_CONT is
    
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal q_AS:   std_logic_vector(3 downto 0);
    signal q_DES:   std_logic_vector(3 downto 0);

    constant clk_period: time := 2 sec;

    begin

    Cont_as: entity work.CONTADOR_AS port map(
        clk_in => clk,
        reset => rst,
        
        q=> q_AS
    );

    Cont_des: entity work.CONTADOR_DES port map(
        clk_in => clk,
        reset => rst,
        
        q=> q_DES
    );


        CLK_PROC : process
        begin
        wait for clk_period / 2;
        if clk = '1' then
            clk <= '0';
        else
            clk <= '1';
        end if;
        end process;

       
        end architecture;