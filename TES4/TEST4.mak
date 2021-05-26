CC = iccavr
CFLAGS =  -IC:\icc\include\ -e -DATMEGA  -l -g -Mavr_enhanced -Wf-use_elpm 
ASFLAGS = $(CFLAGS)  -Wa-g
LFLAGS =  -LC:\icc\lib\ -g -ucrtatmega.o -bfunc_lit:0x8c.0x20000 -dram_end:0x105f -bdata:0x100.0x105f -dhwstk_size:30 -beeprom:1.4096 -fihx_coff -S2
FILES = delay.o hc595.o main.o spi.o 

test4:	$(FILES)
	$(CC) -o test4 $(LFLAGS) @test4.lk   -lcatmega
delay.o:	C:\DOCUME~1\Administrator\桌面\test4\delay.c
	$(CC) -c $(CFLAGS) C:\DOCUME~1\Administrator\桌面\test4\delay.c
hc595.o: C:\DOCUME~1\Administrator\桌面\test4/config.h C:/icc/include/iom128v.h C:/icc/include/macros.h C:\DOCUME~1\Administrator\桌面\test4/delay.h C:\DOCUME~1\Administrator\桌面\test4/spi.h C:\DOCUME~1\Administrator\桌面\test4/hc595.h
hc595.o:	C:\DOCUME~1\Administrator\桌面\test4\hc595.c
	$(CC) -c $(CFLAGS) C:\DOCUME~1\Administrator\桌面\test4\hc595.c
main.o: C:\DOCUME~1\Administrator\桌面\test4/config.h C:/icc/include/iom128v.h C:/icc/include/macros.h C:\DOCUME~1\Administrator\桌面\test4/delay.h C:\DOCUME~1\Administrator\桌面\test4/spi.h C:\DOCUME~1\Administrator\桌面\test4/hc595.h
main.o:	C:\DOCUME~1\Administrator\桌面\test4\main.c
	$(CC) -c $(CFLAGS) C:\DOCUME~1\Administrator\桌面\test4\main.c
spi.o: C:\DOCUME~1\Administrator\桌面\test4/config.h C:/icc/include/iom128v.h C:/icc/include/macros.h C:\DOCUME~1\Administrator\桌面\test4/delay.h C:\DOCUME~1\Administrator\桌面\test4/spi.h C:\DOCUME~1\Administrator\桌面\test4/hc595.h
spi.o:	C:\DOCUME~1\Administrator\桌面\test4\spi.c
	$(CC) -c $(CFLAGS) C:\DOCUME~1\Administrator\桌面\test4\spi.c
