library IEEE;
use IEEE.std_logic_1164.all;


entity FLIP_FLOP is
    port(
        clk: in std_logic;
        rs: in std_logic_vector(1 downto 0);
        qo: out std_logic_vector(1 downto 0)
        
    );
end FLIP_FLOP;

architecture Behavioral of FLIP_FLOP is

signal q: std_logic_vector(1 downto 0):="00";

begin
--FLIP_FLOP NAND

-- NAND			
-- R	S	Q	Q'
-- 0	0	Unknown	
-- 0	1	0	1
-- 1	0	1	0
-- 1	1	Memory

-- Sin reloj
    -- q<= "01" WHEN rs="01" ELSE
    --     "10" WHEN rs="10" ELSE
    --     q WHEN rs="11";

    -- qo<=q;

-- con reloj

    process (clk)
    begin
        if rising_edge(clk) then
            
            if rs="01" then 
            q<="01";
        elsif rs="10" then
            q<="10";
        elsif rs="11" then
            q<=q;
        end if;
            end if;
    end process;
    qo<=q;

    end architecture;
