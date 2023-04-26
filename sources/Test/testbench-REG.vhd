library IEEE;
use IEEE.std_logic_1164.all;

entity testbench_REG is
end entity;

architecture Behavioral of testbench_REG is
    
    signal clk: std_logic := '0';
    signal rst: std_logic := '0';
    signal s: std_logic := '0';
    signal clk_period: time := 2 sec;
    signal q_PISO: std_logic;
    signal d_in: std_logic_vector(3 downto 0);
    signal q_out: std_logic_vector(3 downto 0);

    begin
        SP_PISO: entity work.SR_PAR_SER port map(
            s => s,
            r => rst,
            clk => clk,
            d => d_in,
            q => q_out
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

        process
        begin

            d_in <= "1111";
            rst <= '0';
            s <= '1';

            wait for 2 sec;
            rst <= '1';
            assert false report "Test Done." severity note;
            wait;

            end process;
    end architecture;
