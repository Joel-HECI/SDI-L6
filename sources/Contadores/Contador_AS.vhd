library IEEE;
use IEEE.std_logic_1164.all;

entity CONTADOR_AS is
    port(
        clk_in, reset: in std_logic;

        q: out std_logic_vector(3 downto 0)
    );
end entity;

architecture CONTADOR_AS of CONTADOR_AS is
    
    signal q_out: std_logic_vector(3 downto 0);
    signal nq_out: std_logic_vector(3 downto 0);
    
    begin

    q3: entity work.FLIP_FLOP_D port map(
        clk => nq_out(2),
        ebl=> '1',
        rst => reset,
        d => nq_out(3),
        q => q_out(3),
        nq => nq_out(3)

    );

    q2: entity work.FLIP_FLOP_D port map(
        clk => nq_out(1),
        ebl=> '1',
        rst => reset,
        d => nq_out(2),
        q => q_out(2),
        nq => nq_out(2)
    );

    q1: entity work.FLIP_FLOP_D port map(
        clk => nq_out(0),
        ebl=> '1',
        rst => reset,
        d => nq_out(1),
        q => q_out(1),
        nq => nq_out(1)
    );

    q0: entity work.FLIP_FLOP_D port map(
        clk => clk_in,
        ebl=> '1',
        rst => reset,
        d => nq_out(0),
        q => q_out(0),
        nq => nq_out(0)
    );
    
    q <= q_out;

    end architecture;