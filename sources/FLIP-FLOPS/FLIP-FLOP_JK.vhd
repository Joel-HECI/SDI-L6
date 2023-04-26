library IEEE;
use IEEE.std_logic_1164.all;


entity FLIP_FLOP_JK is
    port(
        clk: in std_logic;
        j,k: in std_logic;
        ebl,rst: in std_logic;
        q,nq: out std_logic
    );
end FLIP_FLOP_JK;

architecture Behavioral of FLIP_FLOP_JK is

signal qa: std_logic:='0';

begin
--FLIP_FLOP JK

-- CLK	Q	J	K	Q t+1
-- RE	0	0	0	0
-- RE	0	0	1	0
-- RE	0	1	0	1
-- RE	0	1	1	1
-- RE	1	0	0	1
-- RE	1	0	1	0
-- RE	1	1	0	1
-- RE	1	1	1	0	

-- con reloj

    process (clk,j,k,ebl,rst)
    begin
        if rising_edge(clk) and ebl='1' then

            if (qa='0' and j='0' and k='0') then
                qa<='0';      
            elsif (qa='0' and j='0' and k='1') then
                qa<='1';
            elsif (qa='0' and j='1' and k='0') then
                qa<='1';
            elsif (qa='0' and j='1' and k='1') then
                qa<='1';
            elsif (qa='1' and j='0' and k='0') then
                qa<='1';
            elsif (qa='1' and j='0' and k='1') then
                qa<='0';
            elsif (qa='1' and j='1' and k='0') then
                qa<='1';
            else
                qa<='0';
            end if;
            
        elsif rising_edge(clk) and ebl='1' and rst='1' then
            qa<='0';
     end if;
    end process;

    q<=qa;
    nq<=not qa;

    end architecture;
