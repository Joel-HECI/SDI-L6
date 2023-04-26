library IEEE;
use IEEE.std_logic_1164.all;


entity testbench_FPS is
end testbench_FPS;

architecture Behavioral of testbench_FPS is

    signal q_out,nq_out, r_in,s_in: std_logic;
    signal d_in,qd_out,nqd_out: std_logic;
    signal t_in,qt_out,nqt_out: std_logic;
    signal j_in,k_in,qjk_out,nqjk_out: std_logic;
    
    signal clk : std_logic:= '0';
    signal clk_out : std_logic;
    constant clk_hz : integer := 100e6;
    constant clk_period : time := 2 sec;

begin
    
    fp: entity work.FLIP_FLOP_NAND port map(
        
        clk=>clk,    
        s=>s_in,
        r=>r_in,
        q=>q_out,
        ebl=> '1',
        rst=>'0',
        nq=>nq_out

    );

    fp_jk: entity work.FLIP_FLOP_JK port map(
        
        clk=>clk,    
        j=>j_in,
        k=>k_in,
        ebl=> '1',
        rst=>'0',
        q=>qjk_out,
        nq=>nqjk_out

    );

    fp_d: entity work.FLIP_FLOP_D port map(
        
        clk=>clk,    
        d=>d_in,
        q=>qd_out,
        ebl=> '1',
        rst=>'0',
        nq=>nqd_out

    );

    fp_t: entity work.FLIP_FLOP_T port map(
        
    clk=>clk,    
    t=>t_in,
    ebl=> '1',
    rst=>'0',
    q=>qt_out,
    nq=>nqt_out

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


    FF_T: process
    begin

        wait for 1000 ms;

        t_in<= '1';
        wait for 2000 ms;
        --report "q:" & std_logic'image(qt_out) & " nq:" & std_logic'image(nqt_out);

        t_in<= '0';
        wait for 2000 ms;
        --report "q:" & std_logic'image(qt_out) & " nq:" & std_logic'image(nqt_out);


        assert false report "Test Done." severity note;
        wait;

    end process;

    FF_D: process
    begin
  
        wait for 1000 ms;
        
        d_in<= '1';
        wait for 2000 ms;
        --report "q:" & std_logic'image(qd_out) & " nq:" & std_logic'image(nqd_out);
        
        d_in<= '0';
        wait for 2000 ms;
        --report "q:" & std_logic'image(qd_out) & " nq:" & std_logic'image(nqd_out);
        
        
        assert false report "Test Done." severity note;
            wait;
  
    end process;

    FF_JK: process
    begin
      
        wait for 1000 ms;

        j_in<= '0';
        k_in<= '0';
        wait for 2000 ms;
        --report "q:" & std_logic'image(qt_out) & " nq:" & std_logic'image(nqt_out);

        j_in<= '1';
        k_in<= '1';
        wait for 2000 ms;
        --report "q:" & std_logic'image(qt_out) & " nq:" & std_logic'image(nqt_out);
        j_in<= '0';
        k_in<= '1';
        wait for 2000 ms;
        j_in<= '1';
        k_in<= '0';
        wait for 2000 ms;

        assert false report "Test Done." severity note;
        wait;
      
    end process;

    end Behavioral;