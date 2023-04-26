library IEEE;
use IEEE.std_logic_1164.all;

entity main is
    port(
        --I/O R2
        s: in std_logic;
        --I/O W5
        clk: in std_logic;
        -- I/O T1
        rst: in std_logic;
        --I/O W3
        clk_o: out std_logic;
        --I/O L1 P1 N3 P3
        q_out: out std_logic_vector(3 downto 0)

        clk_16khz: in std_logic
        clk_1khz: in std_logic
        clk_250hz: in std_logic
        clk_125: in std_logic
    );
end entity;

architecture Behavioral of main is

    signal clk_05hz : std_logic := '0';
    signal q_as_out, q_des_out: std_logic_vector(3 downto 0);
    begin

    mux: entity work.mux2a1 port map(
        s => s,
        IA => q_as_out,
        IB => q_des_out,
        y => q_out
    );

    div05hz: entity work.Divisor_frecuencia port map(
        Clk => clk,
        CLK_o => clk_05hz
    );

    clk_o<= clk_05hz;
-- P3 Contadores Asíncronos

    cont_as: entity work.CONTADOR_AS port map(
        clk_in => clk_05hz,
        reset=>rst,
        q => q_as_out
    );

    cont_des: entity work.CONTADOR_DES port map(
        clk_in => clk_05hz,
        reset=>rst,
        q => q_des_out
    );
-- P4 Divisores de frecuencia

    div_16: entity work.DIV_16K port map (

    clk=>clk,
    clk_o=>clk_16khz
    );

    div_1: entity work.DIV_1K port map (
        clk=>clk,
        clk_o=>clk_1khz
    );

    div_250: entity work.DIV_250 port map (
        clk=>clk,
        clk_o=>clk_250hz
    );

    div_125: entity work.DIV_125 port map (
        clk=>clk,
        clk_o=>clk_125hz
    );
    
-- P5 Registros

    end architecture; 

