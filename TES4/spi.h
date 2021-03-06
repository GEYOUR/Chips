/************************************************
文件：spi.h
用途：
注意：内部8M晶振
************************************************/
#ifndef __spi_H__
#define __spi_H__

#define SS 0
#define SCK 1
#define MOSI 2
#define MISO 3

#define SS_H() PORTB|=(1<<SS)
#define SS_L() PORTB&=~(1<<SS)

extern void spi_init(void);
extern void SPI_MasterTransmit(char Data);

#endif