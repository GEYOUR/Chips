CC = iccavr
LIB = ilibw
CFLAGS =  -e -D__ICC_VERSION=722 -DATMega16  -l -g -MLongJump -MHasMul -MEnhanced 
ASFLAGS = $(CFLAGS) 
LFLAGS =  -g -e:0x4000 -ucrtatmega.o -bfunc_lit:0x54.0x4000 -dram_end:0x45f -bdata:0x60.0x45f -dhwstk_size:30 -beeprom:0.512 -fihx_coff -S2
FILES = dingshijishuQi.o 

JISHIQI:	$(FILES)
	$(CC) -o JISHIQI $(LFLAGS) @JISHIQI.lk   -lcatmega
dingshijishuQi.o: D:\App_Gallery\IC\include\iom16v.h D:\App_Gallery\IC\include\macros.h D:\App_Gallery\IC\include\AVRdef.h
dingshijishuQi.o:	dingshijishuQi.c
	$(CC) -c $(CFLAGS) dingshijishuQi.c
