#include<iom128v.h>
#include<macros.h>
#pragma interrupt_handler ext_int0_isr:2
#pragma interrupt_handler ext_int1_isr:3
#pragma interrupt_handler ext_int2_isr:4
#pragma interrupt_handler ext_int3_isr:5
#define uint unsigned int
void int_init(void)
{
	CLI();
	EIMSK=0x0F;
	EICRA=0xFF;
	SEI();
}
void delay_nms(uint n)
{
	uint i=0,j=0;
	for(i=0;i<n;i++)
		for(j=0;j<1140;j++)
			;
}
void ext_int0_isr(void)
{   uint a=7;
	
	while(1)
	{
	int_init();
	PORTA=~(1<<a);
	a=a-2;
	PORTG|=(1<<4);
	delay_nms(300);
	PORTG&=~(1<<4);
	delay_nms(300);
	PORTG|=(1<<4);
	delay_nms(300);
	PORTG&=~(1<<4);
	delay_nms(300);
	PORTG|=(1<<4);
	delay_nms(300);
	PORTG&=~(1<<4);
	delay_nms(300);
	if(a==-1)
	   {a=7;}
	}
}
void ext_int1_isr(void)
{
    uint a=0;
	
	while(1)
   {
   for(a=0;a<8;a+=2)
   { int_init();
	
    PORTA=~(1<<a);
	
	PORTG|=(1<<4);
	delay_nms(300);
	PORTG&=~(1<<4);
	delay_nms(300);
	PORTG|=(1<<4);
	delay_nms(300);
	PORTG&=~(1<<4);
	delay_nms(300);
	PORTG|=(1<<4);
	delay_nms(300);
	PORTG&=~(1<<4);
	delay_nms(300);
	  }
	 }
}
void ext_int2_isr(void)
{
   uint a=0;
	uint c=0;
	while(1)
   {
   for(a=0;a<8;a++)
   { int_init();
	for(c=0;c<6;c++)
	 { PORTA=~(1<<a);
	  delay_nms(200);
	  PORTA=0XFF;
	  delay_nms(200);
	  
	  }
	
	  PORTG|=(1<<4);
	  delay_nms(300);
	  PORTG&=~(1<<4);
	  delay_nms(300);
	  PORTG|=(1<<4);
	  delay_nms(300);
	  PORTG&=~(1<<4);
	  delay_nms(300);
     
	}
  }
  
  
}
void ext_int3_isr(void)
{

  PORTA=0XFF;
  PORTG|=(1<<4);
	  delay_nms(300);
	  PORTG&=~(1<<4);
	  delay_nms(300);
	  PORTG|=(1<<4);
	  delay_nms(300);
	  PORTG&=~(1<<4);
	  delay_nms(300);
	  while(1){;}
}

void io_init(void)
{
 DDRA=0XFF; 
 PORTA=0XFF; 
 DDRG=0XFF; 
 PORTG=0XFF;
 DDRE=0XFF; 
 PORTE=0XFF;
 DDRD=0XF0;
 PORTD=0XFF;
}
void main(void)
{
	int_init();
	io_init();
	PORTG&=~(1<<4);
	while(1)
	{
		PORTA|=BIT(0);
		delay_nms(300);
		PORTA&=~BIT(0);
		delay_nms(300);
		
	}
}






