
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2a1 is
    Port ( 
        IA : in STD_LOGIC;
        IB : in STD_LOGIC;
        S : in STD_LOGIC;
        Y : out STD_LOGIC
    );
 end mux2a1;

architecture arch_mux21 of mux2a1 is
    begin
        
    Y <= IA WHEN S='0'
    ELSE IB;

end arch_mux21;