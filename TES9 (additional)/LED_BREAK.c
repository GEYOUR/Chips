#include<iom16v.h>
#include<macros.h>
unsigned char num[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

char state=0;
void ioit(void)
{DDRA=0xFF;
 PORTA=0x00;
 DDRB=0xFF;
 PORTB=0x00;
 DDRD=0x00;
 PORTD=0xFF;
}
void int_init(void)
{  CLI();
   GICR|=0xC0;
   MCUCR=0x0F;
   GIFR=0xC0;
   SEI();
}
void delay(unsigned int i)
{ unsigned int j;
  while(--i)
    { for(j=0;j<=100;j++)
	    ;
	}
}
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
void main(void)
{signed char a,i,j=0;
 signed char k=9;
 signed char b=3;
 ioit();
 int_init();
 while(1)
 {
  
   switch(state)
   {case 1: 
           PORTB=~(1<<a);
   		   PORTA=num[j];
           delay(1000);
		   	 if(j<9) j++;
		     else 
			    {j=0;
		        if(a<3) a++;
			    else a=0;}
		     break;
		 
    case 2:
	       PORTB=~(1<<b);
		   PORTA=num[k];
	       delay(1000);
		   if(k>0) k--;
		   else
		      { k=9;
		        if(b>0) b--;
			    else b=3;}
		   break;
    default:break;
   }
 }
}