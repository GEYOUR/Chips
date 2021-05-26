
#include<iom128v.h>
#include"1602.h"
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define uchar unsigned char 
#define uint unsigned int 

uchar count[2];
uchar title[]={"Number is:"};
uchar all[16];

void io_init(void)
{DDRA=0xFF;
 PORTA=0xFF;
 DDRC=0xFF;
 PORTC=0xFF;
 DDRD=0x00;
 PORTD=0xFF;
}
void delay_ms(uint temp)
{ uint a;
  uchar b;
  for(a=0;a<temp;a++)
    for(b=1;b;b++);
}
void disp(uint i)
{   uchar k;
    sprintf(count,"%d",i);
	strcpy(all,title);
	strcat(all,count);
	k=strlen(all);
	WriteChar(1,0,k,all);
}
void main(void)
{ signed char i=0;
  io_init();
  LcdInit();
  disp(0);
  while(1)
  { if((PIND&(1<<PD0))==0)
     {if(i<9) {i++;
	           disp(i);
			   delay_ms(2000);
			   }
	 }
	 if((PIND&(1<<PD1))==0)
	 {if(i>0) {i--;
	           disp(i);
			   delay_ms(2000);
			   }
	  }
	  if((PIND&(1<<PD2))==0)
{i=0;
 disp(i);
 delay_ms(2000);
 }
 
      if((PIND&(1<<PD3))==0)
 {for(i=1;i<10;i+=2)
	{ disp(i);
     delay_ms(2000);
	} 
 }
 
     if((PIND&(1<<PD4))==0)
    {for(i=8;i>0;i-=2)
	  { disp(i);
       delay_ms(2000);
	  } 
     }
	}
}
