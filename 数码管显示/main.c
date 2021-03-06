/************************************************
文件：main.c
用途：
注意：内部8M晶振
************************************************/

#include "config.h"
volatile unsigned int min=0,sec=0; state=0;
extern unsigned char point;
extern unsigned char point_pos;
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

#pragma interrupt_handler timer1_ovf_isr:15
void timer1_ovf_isr(void)
{
 TCNT1H = 0x8F; //reload counter high value
 TCNT1L = 0x81; //reload counter low value
 sec++;
 if(sec>=60) {sec=0;
              min++;
			  if(min>=60) min=0;
			  }
}
#pragma interrupt_handler int0:2
void int0(void)
{
 sec--;
 // state=1;
}

void init_devices(void)
{
 CLI(); //disable all interrupts
 timer1_init();
  if(state==1) TIMSK = 0x00; //timer interrupt sources
      else TIMSK = 0x04;    
  SEI(); //re-enable interrupts
}
void disptime(void)
{    if(sec%2==0) //偶数次灯亮
          point=1;
	 else point=0; //奇数次灯灭
     point_pos=2;
	 Seg7_Led_Buf[3]=min/10;
 	 Seg7_Led_Buf[2]=min%10;
 	 Seg7_Led_Buf[1]=sec/10;
 	 Seg7_Led_Buf[0]=sec%10;
	 Seg7_Led_Update();
}
void main(void)
{
 init_devices(); 
 HC_595_init();
 while(1)
 	{
		 disptime();
		 CLI(); //disable all interrupts
         if(state==1) TIMSK = 0x00; //timer interrupt sources
            else TIMSK = 0x04;    
         SEI(); //re-enable interrupts
		 
		if((PIND&(1<<PD0))==0)
		      {state=1;
			   }
	    if((PIND&(1<<PD1))==0)
		      {state=0;
			   }
	    if((PIND&(1<<PD2))==0)
		     {
			   if(state==1)sec++;
			   
			   
			   }
	}
}