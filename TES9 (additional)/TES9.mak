CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega16  -l -g -MLongJump -MHasMul -MEnhanced 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x4000 -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:30 -beeprom:0.512 -fihx_coff -S2
FILES = LED_BREAK.o 

TES9:	$(FILES)
	$(CC) -o TES9 $(LFLAGS) @TES9.lk   -lcatmega
LED_BREAK.o: C:\iccv7avr\include\iom16v.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h
LED_BREAK.o:	..\TES9(A~1\LED_BREAK.c
	$(CC) -c $(CFLAGS) ..\TES9(A~1\LED_BREAK.c
