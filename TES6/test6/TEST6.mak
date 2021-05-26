CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega128  -l -g -MLongJump -MHasMul -MEnhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:30 -beeprom:0.4096 -fihx_coff -S2
FILES = 1602.o 

TEST6:	$(FILES)
	$(CC) -o TEST6 $(LFLAGS) @TEST6.lk   -lcatm128
1602.o: C:\iccv7avr\include\iom128v.h .\1602.h C:\iccv7avr\include\stdio.h C:\iccv7avr\include\stdarg.h C:\iccv7avr\include\_const.h C:\iccv7avr\include\stdlib.h C:\iccv7avr\include\limits.h C:\iccv7avr\include\string.h
1602.o:	1602.c
	$(CC) -c $(CFLAGS) 1602.c
