library IEEE;
use IEEE.std_logic_1164.all;


entity testbench is
end testbench;

architecture Behavioral of testbench is

    signal q_out, rs_in: std_logic_vector(1 downto 0):="00";
    signal clk : std_logic:= '0';
    signal clk_out : std_logic;
    constant clk_hz : integer := 1;
    constant clk_period : time := 1 sec / clk_hz;

begin
    
    fp: entity work.FLIP_FLOP port map(
        
        clk=>clk,    
        rs=>rs_in,
        qo=>q_out
    );

    div: entity work.Divisor_frecuencia port map(
        Clk=>clk,
        CLK_o=>clk_out
    );
 
    CLK_PROC : process
begin
  wait for clk_period / 2;
  if clk = '1' then
    clk <= '0';
  else
    clk <= '1';
  end if;
end process;


    process
    begin
        wait for 499 ms;
        rs_in <= "01"; 
    wait for 1000 ms;
report "q: " & std_logic'image(q_out(1)) & std_logic'image(q_out(0));

rs_in <= "11"; 
wait for 1000 ms;
report "q: " & std_logic'image(q_out(1)) & std_logic'image(q_out(0));

rs_in <= "10"; 
wait for 1000 ms;
report "q: " & std_logic'image(q_out(1)) & std_logic'image(q_out(0));

rs_in <= "00"; 
wait for 1000 ms;
assert false report "Test Done." severity note;
    wait;

    end process;

    end Behavioral;