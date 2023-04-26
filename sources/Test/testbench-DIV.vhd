library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_DIV is
end entity;

architecture Behavioral of testbench_DIV is

    signal clk_16: std_logic;
    signal clk: std_logic:='0';
    constant clk_hz : integer := 100;
    constant clk_period : time := 1 sec/clk_hz;
    begin

    
    div_16: entity work.DIV_16K port map (

        clk=>clk,
        clk_o=>clk_16
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