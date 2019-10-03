
# --------------------------------------------------------
# Default target - create executable file
# --------------------------------------------------------
#

all: $(ELF)

# --------------------------------------------------------
# Create BSP from *.sopcinfo file
# --------------------------------------------------------
#

BSP_SETTINGS = $(BSP_DIR)/settings.bsp

$(BSP_SETTINGS): $(SOPCINFO_FILE) $(BSP_CFG_TCL)
	nios2-bsp $(BSP_TYPE) $(BSP_DIR) $(SOPCINFO_FILE)
ifdef BSP_CFG_TCL
	nios2-bsp-update-settings --settings $@ \
		--bsp-dir $(BSP_DIR) --script $(BSP_CFG_TCL)
endif

# --------------------------------------------------------
# Generate application makefile
# --------------------------------------------------------
#

ifdef INC_DIRS
APP_INC_DIR_OPT = $(foreach i, $(INC_DIRS),--inc-dir $i)
endif

ifdef SRC_DIRS
APP_SRC_DIR_OPT = $(foreach i, $(SRC_DIRS),--src-dir $i)
endif

ifdef SRC_FILES
APP_SRC_OPT = --src-files $(SRC_FILES)
endif

$(APP_DIR)/Makefile: $(BSP_SETTINGS)
	rm -f $@
	nios2-app-generate-makefile.exe --bsp-dir $(BSP_DIR) \
		--app-dir $(APP_DIR) \
		--elf-name ../$(ELF) \
		$(APP_SRC_DIR_OPT) \
		$(APP_INC_DIR_OPT) \
		$(APP_SRC_OPT)


# --------------------------------------------------------
# Application Makefile targets
# --------------------------------------------------------
#

# Build executable file (build all - bsp, libs, application)
.PHONY: $(ELF)
$(ELF): $(APP_DIR)/Makefile
	make -C $(APP_DIR) all

elf: $(ELF)

# Build BSP only
.PHONY: bsp
bsp: $(APP_DIR)/Makefile
	make -C $(APP_DIR) bsp

# Build libraries and BSP
.PHONY: libs
libs: $(APP_DIR)/Makefile
	make -C $(APP_DIR) libs

# Clean only application
.PHONY: clean
clean:
	make -C $(APP_DIR) clean

# Clean all - bsp, libs, application
.PHONY: clean_all
clean_all:
	make -C $(APP_DIR) clean_all

# --------------------------------------------------------
# Clear current build dir
# --------------------------------------------------------
#

rmall: clean_all
	rm -rf $(APP_DIR)
	rm -rf $(BSP_DIR)
