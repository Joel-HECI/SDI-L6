library IEEE;
use IEEE.std_logic_1164.all;


entity FLIP_FLOP_NOR is
    port(
        clk: in std_logic;
        r,s: in std_logic;
        q,nq: out std_logic
    );
end FLIP_FLOP_NOR;

architecture Behavioral of FLIP_FLOP_NOR is

signal qa: std_logic:='0';
signal nqa: std_logic:='1';

begin
--FLIP_FLOP NOR

-- NOR			
-- R	S	Q	Q'
-- 0	0	Memory
-- 0	1	1	0
-- 1	0	0	1
-- 1	1	Unknown	

-- Sin reloj
    -- q<= "01" WHEN rs="10" ELSE
    --     "10" WHEN rs="01" ELSE
    --     q WHEN rs="00";

    -- qo<=q;


    qa<= r nor nqa;
    nqa<= s nor qa;

    q<=qa;
    nq<=nqa;
-- con reloj

    -- process (clk)
    -- begin
    --     if rising_edge(clk) then
            
    --         if rs="01" then 
    --         q<="10";
    --     elsif rs="10" then
    --         q<="01";
    --     elsif rs="00" then
    --         q<=q;
    --     end if;
    --         end if;
    -- end process;
    -- qo<=q;

    end architecture;
