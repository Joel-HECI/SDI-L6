library IEEE;
use IEEE.std_logic_1164.all;

entity SR_PAR_SER is

port (s, r : in std_logic;
      clk : in std_logic;
      d : in std_logic_vector(3 downto 0);
      q : out std_logic_vector(3 downto 0));

end entity;

architecture Behavioral of SR_PAR_SER is
    
    signal q_2, q_1, q_0 : std_logic;
    signal nq_2, nq_1, nq_0 : std_logic;
    signal m_2, m_1, m_0 : std_logic;
    
    begin

    q3: entity work.FLIP_FLOP_D
    port map(
        clk => clk,
        d => d(3),
        ebl => '1',
        rst => r,
        q => q_2,
        nq => nq_2
    ); 

    m2: entity work.mux2a1 port map(
        IA => d(2),
        IB => q_2,
        S => s,
        Y => m_2
    );

    q2: entity work.FLIP_FLOP_D port map(
        clk => clk,
        d => m_2,
        ebl => '1',
        rst => r,
        q => q_1,
        nq => nq_1
    );
    
    m1: entity work.mux2a1 port map(
        IA => d(1),
        IB => q_1,
        S => s,
        Y => m_1
    );

    q1: entity work.FLIP_FLOP_D port map(
        clk => clk,
        d => m_1,
        ebl => '1',
        rst => r,
        q => q_0,
        nq => nq_1
    );

    m0: entity work.mux2a1 port map(
        IA => d(0),
        IB => q_0,
        S => s,
        Y => m_0
    );

    q0: entity work.FLIP_FLOP_D port map(
        clk => clk,
        d => m_0,
        ebl => '1',
        rst => r,
        q => q(0),
        nq => nq_0
    );

    end architecture;