	.module spi.c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\����\test4\spi.c
	.dbfunc e spi_init _spi_init fV
	.even
_spi_init::
	.dbline -1
	.dbline 17
; /************************************************
; �ļ���spi.c
; ��;��SPI����
; ************************************************/
; #include "config.h"
; /*************************************************************************
; ** ��������: spi_init(void)
; ** ��������: SPI��ʼ��
; ** �䡡��: 
; ** ���	 : 
; ** ȫ�ֱ���: ��
; ** ����ģ��: 
; ** ˵����
; ** ע�⣺
; **************************************************************************/
; void spi_init(void)
; {
	.dbline 18
;  	 DDRB |= (1<<MOSI)|(1<<SCK)|(1<<SS);//����MOSI��SCK���
	in R24,0x17
	ori R24,7
	out 0x17,R24
	.dbline 19
;  	 SPCR = (1<<SPE)|(1<<MSTR)|(1<<SPR0)|(1<<SPR1);//ʹ��SPI������ģʽ
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
; ** ��������: SPI_MasterTransmit(char Data)
; ** ��������: SPI������������
; ** �䡡��: Data ��Ҫͨ��SPI���������
; ** ���	 : 
; ** ȫ�ֱ���: ��
; ** ����ģ��: 
; ** ˵����
; ** ע�⣺
; **************************************************************************/
; void SPI_MasterTransmit(char Data)
; {
	.dbline 34
;  	 /* �������ݴ��� */
;  	 SPDR = Data;
	out 0xf,R16
L3:
	.dbline 37
L4:
	.dbline 36
;  	 /* �ȴ�������� */
;  	 while(!(SPSR & (1<<SPIF)))
	sbis 0xe,7
	rjmp L3
	.dbline -2
L2:
	.dbline 0 ; func end
	ret
	.dbsym r Data 16 c
	.dbend
