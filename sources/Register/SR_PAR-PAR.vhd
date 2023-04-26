library IEEE;
use IEEE.std_logic_1164.all;

entity SR_PAR_PAR is

port (r : in std_logic;
      clk : in std_logic;
      d : in std_logic_vector(3 downto 0);
      q : out std_logic_vector(3 downto 0));

end entity;

architecture Behavioral of SR_PAR_PAR is

    q3: entity work.FLIP_FLOP_D port map (
        d => d(3),
        clk => clk,
        ebl=> '1',
        rst => r,
        q => q(3),
        nq=> open
        );
    q2: entity work.FLIP_FLOP_D port map (
        d => d(2),
        clk => clk,
        ebl=> '1',
        rst => r,
        q => q(2),
        nq=> open
        );
    q1: entity work.FLIP_FLOP_D port map (
        d => d(1),
        clk => clk,
        ebl=> '1',
        rst => r,
        q => q(1),
        nq=> open
        );
    q0: entity work.FLIP_FLOP_D port map (
        d => d(0),
        clk => clk,
        ebl=> '1',
        rst => r,
        q => q(0),
        nq=> open
        );
    begin
    end architecture;