library IEEE;
use IEEE.std_logic_1164.all;

entity DIV_16K is
    port(
        clk : in std_logic;
        clk_o: out std_logic
    );
end DIV_16K;

architecture Behavioral of DIV_16K is

    signal clk_1 : std_logic;
    signal clk_2, nclk_2 : std_logic;
    
    begin
        

       
        ff_d0: entity work.FLIP_FLOP_D
            port map(
                clk => clk_1,
                d => nclk_2,
                ebl => '1',
                rst => '0',
                q => clk_2,
                nq => nclk_2
            );

            clk_1 <= clk;
            clk_o <= nclk_2;

    end architecture;