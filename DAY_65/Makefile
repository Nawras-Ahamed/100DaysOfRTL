DAY  = DAY_65
TIME = $$(date +'%Y%m%d-%H%M%S')
DUMP = dump

TOOLCMD = iverilog -o sim.vvp -Wall -Winfloop -Wno-timescale -gno-shared-loop-index -g2012

compile: clean
	$(TOOLCMD) -o $(DAY) $(DAY).sv

sim: clean
	$(TOOLCMD) -o $(DAY) $(DAY).sv $(DAY)_tb.sv
	vvp $(DAY)
	gtkwave dump.vcd

build: clean
	touch synth.ys
	echo "read_verilog $(DAY).sv" >> synth.ys
	echo "synth -top $(DAY)" >> synth.ys
	echo "proc; opt; techmap; opt" >> synth.ys
	echo "write_verilog -noattr synth.v" >> synth.ys
	echo "dfflibmap -liberty /home/nawras/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib" >> synth.ys
	echo "abc -liberty /home/nawras/sky130RTLDesignAndSynthesisWorkshop/lib/sky130_fd_sc_hd__tt_025C_1v80.lib -script +strash;scorr;ifraig;retime,{D};strash;dch,-f;map,-M,1,{D}" >> synth.ys
	echo "clean" >> synth.ys
	echo "show -prefix $(DAY) -colors $(TIME)" >> synth.ys

synth: build
	yosys synth.ys

clean:
	rm -rf $(DAY).vvp synth.ys synth.v $(DAY).dot $(DAY).dot.pid $(DUMP).vcd slpp_all

