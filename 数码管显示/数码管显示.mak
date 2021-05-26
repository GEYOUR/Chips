CC = iccavr
LIB = ilibw
CFLAGS =  -ID:\icc\include\ -e -D__ICC_VERSION=722 -DATMega128  -l -g -MLongJump -MHasMul -MEnhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -LD:\icc\lib\ -g -e:0x20000 -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x10ff -bdata:0x100.0x10ff -dhwstk_size:16 -beeprom:0.4096 -fihx_coff -S2
FILES = delay.o hc595.o main.o spi.o 

数码管显示:	$(FILES)
	$(CC) -o 数码管显示 $(LFLAGS) @数码管显示.lk   -lcatm128
delay.o:
delay.o:	delay.c
	$(CC) -c $(CFLAGS) delay.c
hc595.o: .\config.h C:\iccv7avr\include\iom128v.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\delay.h .\spi.h .\hc595.h
hc595.o:	hc595.c
	$(CC) -c $(CFLAGS) hc595.c
main.o: .\config.h C:\iccv7avr\include\iom128v.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\delay.h .\spi.h .\hc595.h
main.o:	main.c
	$(CC) -c $(CFLAGS) main.c
spi.o: .\config.h C:\iccv7avr\include\iom128v.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h .\delay.h .\spi.h .\hc595.h
spi.o:	spi.c
	$(CC) -c $(CFLAGS) spi.c
