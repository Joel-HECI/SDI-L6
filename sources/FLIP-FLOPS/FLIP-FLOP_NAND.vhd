library IEEE;
use IEEE.std_logic_1164.all;


entity FLIP_FLOP_NAND is
    port(
        clk: in std_logic;
        r,s: in std_logic;
        ebl,rst: in std_logic;
        q,nq: out std_logic
    );
end FLIP_FLOP_NAND;

architecture Behavioral of FLIP_FLOP_NAND is

    signal qa: std_logic;

begin
--FLIP_FLOP NAND

-- NAND			
-- R	S	Q	Q'
-- 0	0	Unknown	
-- 0	1	0	1
-- 1	0	1	0
-- 1	1	Memory

-- Sin reloj
process (r,s,ebl,rst)
begin
    if ebl='1' then
        if (r='0' and s='1') then
            qa<= '0';
            
        elsif (r='1' and s='0') then
            qa<= '1';
            
        elsif (r='1' and s='1') then
            qa<=qa;

        end if;
    elsif ebl='1' and rst='1' then
        qa<='0';
        
    end if;
end process;

q<=qa;
nq<=not qa;
-- con reloj

    -- process (clk,r,s,ebl,rst)
    -- begin
    --     if rising_edge(clk) and ebl='1' then
            
    --        if (r='0' and s='1') then
    --          qa<= '0';
        
    --        elsif (r='1' and s='0') then
    --          qa<= '1';
            
    --        elsif (r='1' and s='1') then
    --          qa<=qa;
    --         end if;
    --     elsif rising_edge(clk) and ebl='1' and rst='1' then
    --        qa<='0';
    --     end if;
    -- end process;

    -- qo<=qa;
    -- nqo<=not qa;

    end architecture;
