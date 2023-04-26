ghdl -i ./FLIP-FLOPS/FLIP-FLOP_NAND.vhd ./FLIP-FLOPS/FLIP-FLOP_D.vhd ./FLIP-FLOPS/FLIP-FLOP_T.vhd ./FLIP-FLOPS/FLIP-FLOP_JK.vhd div_freq.vhd ./Test/testbench-FPS.vhd && ghdl -m testbench_FPS && ghdl -r testbench_FPS --vcd=./Dumps/FPS-dump.vcd

ghdl -i ./FLIP-FLOPS/FLIP-FLOP_D.vhd ./Contadores/Contador_AS.vhd ./Contadores/Contador_DES.vhd ./Test/testbench-CONT.vhd && ghdl -m testbench_CONT && ghdl -r testbench_CONT --vcd=./Dumps/CONT-dump.vcd

ghdl -i ./FLIP-FLOPS/FLIP-FLOP_D.vhd ./Divisores/DIV_16K.vhd ./Test/testbench-DIV.vhd && ghdl -m testbench_DIV && ghdl -r testbench_DIV --vcd=./Dumps/DIV-dump.vcd

ghdl -i ./FLIP-FLOPS/FLIP-FLOP_D.vhd mux2a1.vhd ./Register/SR_PAR-SER.vhd ./Test/testbench-REG.vhd && ghdl -m testbench_REG && ghdl -r testbench_REG --vcd=./Dumps/REG-dump.vcd
