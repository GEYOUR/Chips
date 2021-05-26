#include<iom16v.h>
#include<macros.h>
unsigned char num[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
int jishu=0;
unsigned char min=0,sec=0,disp[4];




void ioit(void)
{DDRA=0xFF;
 PORTA=0x00;
 DDRB=0xFF;
 PORTB=0x00;
}
void int_init(void)
{  CLI();
   TCNT1=0x00;
   TCCR1B |= (1<<WGM12);
   TCCR1B |= (1<<CS12);
   OCR1A=625;
   TIMSK |= (1<<OCIE1A)
   SEI();
}

#pragma interrupt_handler Int_TCCR1:7
void Int_TCCR1(void)
{ jishu++;
if(jishu==100)
  {if(sec>=59)
     {sec=0;
	   if(min>=59) min=0;
	   else min++;
	  }
	else {
	      sec++;
	      }
      jishu=0;
   }
}
void delay(unsigned int i)
{ unsigned int j;
  while(--i)
    { for(j=1;j<=100;j++);
	}
}
void display(unsigned char disp[4])
{ unsigned char i,j;
  for(i=0;i<40;i++)
    for(j=0;j<4;j++)
	   { PORTB=~(1<<j);
	     if(j==2)
		    PORTA=num[disp[j]]|BIT(7);
		 else PORTA=num[disp[j]];
		      delay(5);	
		}
}
void main(void)
{
 ioit();
 int_init();
 while(1)     
 {             
  if((PIND&(1<<PD0))==0)
   {sec=0;min=0;} 
               disp[0]=sec%10;
               disp[1]=sec/10;
               disp[2]=min%10;
               disp[3]=min/10;
			   display(disp);
 }
}