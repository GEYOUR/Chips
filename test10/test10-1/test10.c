#include<iom128v.h>
#include <macros.h>
#include"1602.h"
#define uchar unsigned char
#define uint unsigned int
unsigned char countnum;
uchar minute[2];
uchar second[2];
uchar title[]={"Time is: "};
uchar min=0,sec=0;
char state=0;
void delay_nms(unsigned int n)
{
  unsigned int k=0,j=0;
  for(k=0;k<n;k++)
    for(j=0;j<1140;j++);
}

//////////////////////////////////////
void Beep(unsigned int H_time,unsigned int L_time)
{
   PORTG|=(1<<4);
   delay_nms(H_time);
   PORTG&=~(1<<4);
   delay_nms(L_time);
   
}
////////////////////////////////////////////////
void timer1_init(void)
{
 TCCR1B = 0x00; //stop
 TCNT1H = 0x8F; //setup
 TCNT1L = 0x81;
 OCR1AH = 0x70;
 OCR1AL = 0x7F;
 OCR1BH = 0x70;
 OCR1BL = 0x7F;
 OCR1CH = 0x70;
 OCR1CL = 0x7F;
 ICR1H  = 0x70;
 ICR1L  = 0x7F;
 TCCR1A = 0x00;
 TCCR1B = 0x04; //start Timer
}

/////////////////////////////////////////////////
#pragma interrupt_handler timer1_ovf_isr:15
void timer1_ovf_isr(void)
{
 TCNT1H = 0x8F; //reload counter high value
 TCNT1L = 0x81; //reload counter low value
 sec++;
 if(sec>=60){sec=0;
             min++;
			 if(min>=60)min=0;
             }
 countnum++;
 if(countnum>7) countnum=0;
                    
}
/////////////////////////////////////////////
#pragma interrupt_handler Int0:2
void Int0(void)
{ unsigned int i;
  i=1000;
  while(i--)
  {
    if((PIND&(1<<PD2))==0)
	{ return;
	}
  }
  state=1;
}
///////////////////////////////////////////
#pragma interrupt_handler Int1:3
void Int1(void)
{ unsigned int i;
  i=1000;
  while(i--)
  {if((PIND&(1<<PD3))==0)
  {return;
  }
  }
  state=2;
}
////////////////////////////////////////////////////
void io_init(void)
{DDRA=0xFF;
 PORTA=0x00;
 DDRC=0xFF;
 PORTC=0xFF;
 DDRD=0x00;
 PORTD=0xFF;
 DDRG|=(1<<4);
 PORTG&=~(1<<4);
}
////////////////////////////////////////////////
void disp(void)
{
 	 minute[1]=min/10+'0';
	 minute[0]=min%10+'0';
	 second[1]=sec/10+'0';
	 second[0]=sec%10+'0';
	 WriteChar(1,0,8,title);
	 WriteNum(1,9,minute[1]);
	 WriteNum(1,10,minute[0]);
	 if(sec%2==0)  WriteChar(1,11,1,":");
	 else          WriteChar(1,11,1," ");
	 WriteNum(1,12,second[1]);
	 WriteNum(1,13,second[0]);
	} 
////////////////////////////////////////////

 

void init_devices(void)
{
 CLI(); //disable all interrupts
 timer1_init();
 if(state==0)TIMSK = 0x04; //timer interrupt sources
 else        TIMSK = 0x00;
 SEI(); //re-enable interrupts
 DDRE|=(1<<2);//LED????HC573????
 PORTE|=(1<<2);
 DDRA=0xFF;
 PORTA=0x00;
}
////////////////////////////////////////////


void main(void)
{//signed char i=0;
 io_init();
 LcdInit();
 init_devices(); 
 
 while(1)
 	{
		// PORTA=~(1<<countnum);
		 disp();
		 if((PIND&(1<<PD0))==0)
		   state=1;
		 else if((PIND&(1<<PD1))==0)
		   {state=0;
		    Beep(1000,400);}
		 if((PIND&(1<<PD2))==0)
		   {Beep(300,100);
		      if(state==1) sec++;
		    
		     }
		   
		   
		   
		 if(state==0)TIMSK = 0x04; //timer interrupt sources
         else       TIMSK = 0x00;
	}
}