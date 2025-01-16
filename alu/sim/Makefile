SHELL=/bin/bash -o pipefail
.SHELLFLAGS += -e

HDL_SRCS  := $(shell find $(PWD)/../hdl -name '*.sv')
HVL_SRCS  := $(shell find $(PWD)/../hvl -name '*.sv' -o -name '*.v')
SRCS      := $(PKG_SRCS) $(HDL_SRCS) $(HVL_SRCS) $(SRAM_SRCS) $(DW_IP)

export VCS_ARCH_OVERRIDE=linux

# VCS_FLAGS:
# -full64               : Enables 64-bit mode for the VCS simulator.
# -lca                  : Enables Low Cost Access licensing.
# -sverilog             : Enables support for SystemVerilog.
# -timescale=1ns/1ns    : Sets the timescale for the simulation to 1 nanosecond per time unit.
# -debug_acc+all        : Enables all debug access capabilities.
# -kdb                  : Enables the use of the KDB debugger.
# -debug_access+all     : Enables all debug access capabilities.
# -suppress=LCA_FEATURES_ENABLED : Suppresses warnings related to LCA features.
# +incdir+$(DW)/sim_ver : Adds the specified directory to the list of directories to be searched for include files.
# +define+DW_SUPPRESS_WARN : Defines the macro DW_SUPPRESS_WARN to suppress specific warnings.
VCS_FLAGS= -full64 -lca -sverilog -timescale=1ns/1ns -debug_acc+all -kdb -debug_access+all -suppress=LCA_FEATURES_ENABLED +incdir+$(DW)/sim_ver +define+DW_SUPPRESS_WARN

sim/top_tb: $(SRCS) $(HDRS)
	mkdir -p sim
	cd sim && vcs $(SRCS) $(VCS_FLAGS) -msg_config=../vcs_warn.config -l compile.log -top top_tb -o top_tb
	@bash check_compile_error.sh

.PHONY: run_top_tb
run_top_tb: sim/top_tb
	rm -f sim/dump.fsdb
	cd sim && ./top_tb -l simulation.log
	@bash check_sim_error.sh

.PHONY: verdi
verdi:
	mkdir -p verdi
	cd verdi && $(VERDI_HOME)/bin/verdi -ssf $(PWD)/sim/dump.fsdb

.PHONY: clean
clean:
	rm -rf bin sim verdi