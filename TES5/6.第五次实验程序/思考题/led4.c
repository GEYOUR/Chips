#include <iom16v.h>
#include <macros.h>
unsigned char num[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,
                          0x7F,0x6F};  //共阴极
void io_init(void)
{DDRA=0XFF; //设置为输出
 PORTA=0X00; //初始值为不显示
 DDRB=0XFF; //设置为输出
 PORTB=0XFF; //初始值为不显示
 DDRD=0X00; //设置为输入
 PORTB=0XFF; //上拉电阻

}
void delay(unsigned int i)
{  unsigned j;
   while(--i)
      { for(j=1;j<=100;j++)  
            ;
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
{ unsigned char min=0,sec=0,disp[4],state=0;
io_init();
while(1)
   {   
		
		if ((PIND & (1 << PD2))==0) 
		        { state=3;
				}
   
       for (min=0;min<60;min++)
          { 
            
		   for(sec=0;sec<60;sec++)
		     { if ((PIND & (1 << PD0))==0) 
		        { sec=0;
				  min=0;
				}
			   if ((PIND & (1 << PD1))==0) 
		        { while(1)
				   { if ((PIND & (1 << PD2))==0) break;
				    disp[0]=sec%10;
			        disp[1]=sec/10;
			        disp[2]=min%10;
			        disp[3]=min/10;
			        display(disp);
					}
				}
			   disp[0]=sec%10;
			   disp[1]=sec/10;
			   disp[2]=min%10;
			   disp[3]=min/10;
			   display(disp);
			  }
			
           } 	 
         
	  }
	   
}
