library IEEE;
use IEEE.std_logic_1164.all;


entity FLIP_FLOP_T is
    port(
        clk: in std_logic;
        t: in std_logic;
        ebl,rst: in std_logic;
        q,nq: out std_logic
    );
end FLIP_FLOP_T;

architecture Behavioral of FLIP_FLOP_T is

signal qa: std_logic:='0';

begin
--FLIP_FLOP T

-- Q	T	Q t+1
-- 0	0	 
-- 0	1	1
-- 1	0	1
-- 1	1	0

-- con reloj

    process (clk,t)
    begin
        if rising_edge(clk) and ebl='1' then
         
            if qa='0'
            qa<=t;
            else
            qa<=not t;
            end if;
        elsif rising_edge(clk) and ebl='1' and rst='1' then 
        qa<='0';
     end if;
    end process;

    q<=qa;
    nq<=not qa;

    end architecture;
