CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega16  -l -g -MLongJump -MHasMul -MEnhanced 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x4000 -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:30 -beeprom:0.512 -fihx_coff -S2
FILES = pwm_led.o 

TES11_PARC:	$(FILES)
	$(CC) -o TES11_PARC $(LFLAGS) @TES11_PARC.lk   -lcatmega
pwm_led.o: C:\iccv7avr\include\iom16v.h C:\iccv7avr\include\macros.h C:\iccv7avr\include\AVRdef.h
pwm_led.o:	pwm_led.c
	$(CC) -c $(CFLAGS) pwm_led.c
