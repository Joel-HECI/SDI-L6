library IEEE;
use IEEE.std_logic_1164.all;

entity DIV_FREQ is
    port(
        clk : in std_logic;
        clk_16K : out std_logic;
        clk_1K : out std_logic;
        clk_250: out std_logic;
        clk_125: out std_logic;
    );
end DIV_FREQ;

architecture Behavioral of DIV_FREQ is
begin
    div_16K: entity work.DIV_16K port map(
        clk=>clk, 
        clk_o=>clk_16K);

    div_1K: entity work.DIV_1K port map(
        clk=>clk,
        clk_o=>clk_1K);
    
    div_250: entity work.DIV_250 port map(
        clk=>clk,
        clk_o=>clk_250);
    
    div_125: entity work.DIV_125 port map(
        clk=>clk,
        clk_o=>clk_125);
    end architecture;