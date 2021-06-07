# 判断当前操作系统，使用不容的删除工具
ifeq ($(shell uname), Linux) 
RM = rm
else
RM = del
endif

# 编译工具的选择，适合多平台的交叉编译选择
ifeq ($(TOOL), 0)
TOOL=arm-none-linux-gnueabi-
else
TOOL=
endif

# 是否为调试版本，为调试版本则需要在编译中指定-g参数
ifeq ($(type), REALSE)
CFLAGS = -O3 -Wall -Werror
else 
CFLAGS = -g -O0 -Wall -Werror
endif

CC = $(TOOL)gcc $(CFLAGS)

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
	$(RM) -rf $(OBJDIR)/*.* $(BINDIR) main/main main/main.exe a.out
help:
	@echo "*********************************** help ************************************"
	@echo "*                                                                           *"
	@echo "*                            Option Description                             *"
	@echo "*                                                                           *"
	@echo "*  make TOOL=0 OR make                                                      *"
	@echo "*     The tool used to specify compilation, When tool=0, the compile tool is*"
	@echo "*     a cross-compile toolchain 'arm-none-linux-gnueabi-gcc', GCC is used by*"
	@echo "*     default.                                                              *"
	@echo "*  make TYPE=REALSE OR  make                                                *"
	@echo "*     Used to specify the type of the build target, Optional parameters are *"
	@echo "*     'DEBUG' and 'REALSE', If no parameters are specified, The debug type  *"
	@echo "*     is the default.                                                       *"
	@echo "*  make test                                                                *"
	@echo "*      Run the generated executable program directly and print the output of*"
	@echo "*      the program directly to the terminal.                                *"
	@echo "*  make debug                                                               *"
	@echo "*      Run the debugger and debug through GDB.                              *"
	@echo "*                                                                           *"
	@echo "*********************************** help ************************************"