SHELL=/bin/bash -o pipefail
.SHELLFLAGS += -e

NET_SRC := $(shell find $(PWD)/../ihnl -name "netlist")
HVL_SRC := $(PWD)/mos.sv $(PWD)/tb.sv
SRCS    := $(NET_SRC) $(HVL_SRC)

export VCS_ARCH_OVERRIDE=linux
VCS_FLAGS= -licqueue -full64 -lca -sverilog +lint=none -timescale=1ps/1ps -debug_acc+all -kdb -suppress=LCA_FEATURES_ENABLED

vcs/tb: $(SRCS)
	mkdir -p vcs
	sed -i -E 's/cds_globals.vss_/1'"'"'b0/g' $(NET_SRC)
	sed -i -E 's/cds_globals.vdd_/1'"'"'b1/g' $(NET_SRC)
	cd vcs && vcs $(SRCS) $(VCS_FLAGS) -l compile.log -top tb -o tb

.PHONY: run_tb
run_tb: vcs/tb
	cd vcs && ./tb -l simulation.log -exitstatus -suppress=ASLR_DETECTED_INFO

.PHONY: verdi
verdi:
	mkdir -p verdi
	cd verdi && timeout $(ECE425_GUI_TIMEOUT) $(VERDI_HOME)/bin/verdi -ssf $(PWD)/vcs/dump.fsdb

.PHONY: clean
clean:
	rm -rf vcs verdi
