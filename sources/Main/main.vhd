library IEEE;
use IEEE.std_logic_1164.all;

entity main is
    port(
        --I/O R2 T1
        s: in std_logic;
        --I/O W5
        clk: in std_logic;
        --I/O W3
        clk_o: out std_logic;
        --I/O L1 P1 N3 P3
        q_out: out std_logic_vector(3 downto 0)
    );
end entity;

architecture Behavioral of main is

    signal clk_05hz : std_logic := '0';
    signal q_as_out, q_des_out: std_logic_vector(3 downto 0);
    begin

    mux: entity work.mux port map(
        s => s,
        a => q_as_out,
        b => q_des_out,
        y => q_out
    );

    div05hz: entity work.div_freq port map(
        clk => clk,
        clk_out => clk_05hz
    );

    clk_o<= clk_05hz;
-- P3 Contadores Asíncronos

    cont_as: entity work.CONTADOR_AS port map(
        clk => clk_05hz,
        q_out => q_as_out
    );

    cont_des: entity work.CONTADOR_DES port map(
        clk => clk_05hz,
        q_out => q_des_out
    );
-- P4 Divisores de frecuencia
-- P5 Registros

    end architecture; 

