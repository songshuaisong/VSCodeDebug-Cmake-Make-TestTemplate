ifeq ($(t), 0)
TOOL=arm-none-linux-gnueabi-
else
TOOL=
endif
 
CC = $(TOOL)gcc
CFLAGS = -g -O -Wall Werror
 
OBJ := add.o sub.o mul.o dev.o main.o
TOPDIR := $(PWD)
OBJDIR := $(TOPDIR)/obj
BINDIR := $(TOPDIR)/bin
BIN := main
LIB := -L$(TOPDIR)/lib -lpattern 

SUBDIR := add sub mul dev main obj
OBJHEAD := $(TOPDIR)/add/add.h $(TOPDIR)/sub/sub.h \
		$(TOPDIR)/mul/mul.h $(TOPDIR)/dev/dev.h $(TOPDIR)/inc/funlyComment.h
OBJLINK := --std=c99
 
export CC TOPDIR OBJDIR BINDIR BIN LIB OBJLINK OBJ 
 
all:CHECKDIR $(SUBDIR)
	@echo "*****************************************************************************"
	@echo "*                                                                           *"
	@echo "*                 Congratulations! Compile completed!!!                     *"
	@echo "*       Executable file name is : $(BIN)    "
	@echo "*  Executable file in directory : $(BINDIR)"
	@echo "*                                                                           *"
	@echo "*****************************************************************************"
CHECKDIR:
	@echo "*****************************************************************************"
	@echo "*                                                                           *"
	@echo "* Create subfolders:                                                        *"
	mkdir -p $(SUBDIR) 
	mkdir -p $(BINDIR)
	@echo "*                                                                           *"
	@echo "*               Successful Creation of subfolders!                          *"
	@echo "*                                                                           *"
	@echo "*****************************************************************************"
$(SUBDIR):RUN
	make -C $@
	@echo "*****************************************************************************"
RUN:
	@echo "*****************************************************************************"
	@echo "*                                                                           *"
	@echo "* All subdirectories are:                                                   *"
	@echo "*    "$(SUBDIR)
	@echo "* All links are:                                                            *"
	@echo "*    "$(OBJLINK)
	@echo "*                                                                           *"
	@echo "*****************************************************************************"
	@echo "*                                                                           *"
	@echo "*                            begin Compile                                  *"
	@echo "*                                                                           *"
	@echo "*****************************************************************************"
# 生成僞目標
.PHONY:test
test:
	LD_LIBRARY_PATH=$(TOPDIR)/lib $(TOPDIR)/bin/main
.PHONY:debug
debug:
	LD_LIBRARY_PATH=$(TOPDIR)/lib gdb $(TOPDIR)/bin/main

.PHONY:clean
clean:
	rm -rf $(OBJDIR)/*.o $(BINDIR) main/main a.out
help:
	@echo "*********************************** help ************************************"
	@echo "*                                                                           *"
	@echo "*                            Option Description                             *"
	@echo "*                                                                           *"
	@echo "*********************************** help ************************************"