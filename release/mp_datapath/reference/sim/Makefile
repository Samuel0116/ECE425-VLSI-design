SHELL=/bin/bash -o pipefail
.SHELLFLAGS += -e

HDL_SRCS := $(shell find $(PWD)/../hdl -name '*.sv')
HVL_SRCS := $(shell find $(PWD)/../hvl -name '*.sv' -o -name '*.v')
SRCS := $(HDL_SRCS) $(HVL_SRCS)

export VCS_ARCH_OVERRIDE=linux
VCS_FLAGS= -licqueue -full64 -lca -sverilog +lint=none -timescale=1ps/1ps -debug_acc+all -kdb -suppress=LCA_FEATURES_ENABLED +define+ECE411_NO_ROI +define+ECE411_NO_SPIKE_DPI +define+ECE411_NO_FLOAT

vcs/tb: $(SRCS)
	mkdir -p vcs
	cd vcs && vcs $(SRCS) $(VCS_FLAGS) -l compile.log -top tb -o tb

.PHONY: run_tb
run_tb: vcs/tb
	mkdir -p spike
	/usr/bin/python3 ../bin/generate_memory_file.py -1 $(PROG)
	rm -f sim/dump.fsdb
	cd vcs && ./tb -l simulation.log -exitstatus -suppress=ASLR_DETECTED_INFO

.PHONY: verdi
verdi:
	mkdir -p verdi
	cd verdi && timeout $(ECE425_GUI_TIMEOUT) $(VERDI_HOME)/bin/verdi -ssf $(PWD)/vcs/dump.fsdb

.PHONY: clean
clean:
	rm -rf bin spike vcs verdi
