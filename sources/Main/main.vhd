library IEEE;
use IEEE.std_logic_1164.all;

entity main is
    port(
        --I/O R2
        s0: in std_logic;
        --I/O U1
        s1: in std_logic;
        --I/O W5
        clk: in std_logic;
        -- I/O T1
        rst: in std_logic;
        --I/O W3
        clk_o: out std_logic;
        --I/O L1 P1 N3 P3
        q_out: out std_logic_vector(3 downto 0);
        --I/O W2 R3 T2 T3
        d_PISO_in: in std_logic_vector(3 downto 0);
        --I/O W17 w16 v16 v17
        q_reg_out: out std_logic_vector(3 downto 0);
        clk_16khz: out std_logic;
        clk_1khz: out std_logic;
        clk_250hz: out std_logic;
        clk_125hz: out std_logic;

        q_reg_out: out std_logic_vector(3 downto 0)
    );
end entity;

architecture Behavioral of main is

    signal clk_05hz : std_logic := '0';
    signal q_as_out, q_des_out: std_logic_vector(3 downto 0);
    signal d_PIPO_in, d_SIPO_in: std_logic;
    signal d_PISO_in: std_logic_vector(3 downto 0);
    signal q_reg_PISO,q_reg_SIPO, q_reg_PIPO : std_logic_vector(3 downto 0);
    begin

    mux: entity work.mux2a1 port map(
        s => s0,
        IA => q_as_out,
        IB => q_des_out,
        y => q_out
    );

    mux2: entity work.mux4a1 port map(
        s => s0,
        IA => q_reg_PISO,
        IB => q_reg_SIPO,
        IC=> q_reg_PIPO,
        ID=> open,
        y => q_reg_out
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

    reg_PISO: entity work.SR_PAR_SER port map (
        clk => clk_05hz,
        s=>s1,
        r => rst,
        d => d_PISO_in,
        q => q_reg_PISO
    );

    reg_SIPO: entity work.SR_PAR_SER port map (
        clk => clk_05hz,
        s=>s1,
        r => rst,
        d => d_SIPO_in,
        q => q_reg_SIPO
    );

    reg_PIPO: entity work.SR_PAR_SER port map (
        clk => clk_05hz,
        s=>s1,
        r => rst,
        d => d_PIPO_in,
        q => q_reg_PIPO
    );
    end architecture; 

