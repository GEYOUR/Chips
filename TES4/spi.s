	.module spi.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\spi.c
	.dbfunc e spi_init _spi_init fV
	.even
_spi_init::
	.dbline -1
	.dbline 17
; /************************************************
; 文件：spi.c
; 用途：SPI驱动
; ************************************************/
; #include "config.h"
; /*************************************************************************
; ** 函数名称: spi_init(void)
; ** 功能描述: SPI初始化
; ** 输　入: 
; ** 输出	 : 
; ** 全局变量: 无
; ** 调用模块: 
; ** 说明：
; ** 注意：
; **************************************************************************/
; void spi_init(void)
; {
	.dbline 18
;  	 DDRB |= (1<<MOSI)|(1<<SCK)|(1<<SS);//设置MOSI，SCK输出
	in R24,0x17
	ori R24,7
	out 0x17,R24
	.dbline 19
;  	 SPCR = (1<<SPE)|(1<<MSTR)|(1<<SPR0)|(1<<SPR1);//使能SPI，主机模式
	ldi R24,83
	out 0xd,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e SPI_MasterTransmit _SPI_MasterTransmit fV
;           Data -> R16
	.even
_SPI_MasterTransmit::
	.dbline -1
	.dbline 32
; }
; /*************************************************************************
; ** 函数名称: SPI_MasterTransmit(char Data)
; ** 功能描述: SPI主机发送数据
; ** 输　入: Data 需要通过SPI传输的数据
; ** 输出	 : 
; ** 全局变量: 无
; ** 调用模块: 
; ** 说明：
; ** 注意：
; **************************************************************************/
; void SPI_MasterTransmit(char Data)
; {
	.dbline 34
;  	 /* 启动数据传输 */
;  	 SPDR = Data;
	out 0xf,R16
L3:
	.dbline 37
L4:
	.dbline 36
;  	 /* 等待传输结束 */
;  	 while(!(SPSR & (1<<SPIF)))
	sbis 0xe,7
	rjmp L3
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbsym r Data 16 c
	.dbend
