CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega16  -l -g -MLongJump -MHasMul -MEnhanced 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x4000 -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:30 -beeprom:0.512 -fihx_coff -S2
FILES = leddisp.o 

TES7:	$(FILES)
	$(CC) -o TES7 $(LFLAGS) @TES7.lk   -lcatmega
leddisp.o: C:\iccv7avr\include\iom16v.h C:\iccv7avr\include\stdio.h C:\iccv7avr\include\stdarg.h C:\iccv7avr\include\_const.h
leddisp.o:	leddisp.c
	$(CC) -c $(CFLAGS) leddisp.c
