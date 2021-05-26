//（共阴编码）
//显示－－HGFE,DCBA－－编码
//0     －－0011,1111－－0x3F;
//1     －－0000,0110－－0x06;
//2     －－0101,1011－－0x5B;
//3     －－0100,1111－－0x4F;
//4     －－0110,0110－－0x66;
//5     －－0110,1101－－0x6D;
//6     －－0111,1101－－0x7D;
//7     －－0000,0111－－0x07;
//8     －－0111,1111－－0x7F;
//9     －－0110,1111－－0x6F;

#include "iom16v.h"
unsigned char num[10]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,
                          0x80,0x90};  //共阳极
unsigned char num1[11]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,
                          0x6F,0x80};  //共阴极
void io_init(void)
{DDRC=0XFF;
 PORTC=0XFF;
 DDRD=0XFF;
 PORTD=0X00;
 DDRA=0X00; 
 PORTA=0XFF;
}
void delay(unsigned int i)
{unsigned int a,b,c,d,e,f,g,h,k,l,m,o,p,q,r,s,t,u;
  for(a=0;a<i;a++)
    for(b=0;b;b++) ;

}        
void main(void)
{ signed char i,j=0;
io_init();
while(1)
   { if ((PINA & (1 << PA6)) == 0) { 
                                   for(j=9;j>=0;j--)
	                                {
									 for(i=9;i>=0;i--)
									    {PORTC=num1[j];
									     PORTD=num1[i];
										 delay(20000);
										 } 								         delay(10000);

	                                   }
                                   }
     if ((PINA & (1 << PA7)) == 0) {
	                       for(j=0;j<=9;j++)
	                                {
									 for(i=0;i<=9;i++)
									    {PORTC=num1[j];
									     PORTD=num1[i];
										 delay(20000);
										 } 								         delay(10000);
                                      }
	                                 }
	 if ((PINA & (1 << PA5)) == 0) {
	                      for(j=0;j<=9;j++)
	                                {
									 for(i=1;i<=9;i+=2)
									    {PORTC=num1[j];
									     PORTD=num1[i];
										 delay(20000);
										 } 								         delay(10000);

	                                 }
                                   }						   
		
	if ((PINA & (1 << PA4)) == 0) {
	                   for(j=0;j<=9;j++)
	                                {
									 for(i=0;i<=9;i+=2)
									    {PORTC=num1[j];
									     PORTD=num1[i];
										 delay(20000);
										 } 								         delay(10000);

	                                 }
                                   }
	  if ((PINA & (1 << PA3)) == 0) {
	                     
	                                 PORTC=num1[10];
									 delay(30000); 
									 PORTC=0X00; 
									 PORTD=num1[10];
								     delay(30000); 
	                                 // 清空数码管
                                     PORTD=0X00;
									 PORTC=num1[10];
									 delay(30000); 
									  PORTC=0X00; 
									   delay(30000); 
									 PORTD=num1[10];
								     delay(30000); 
									 
                                   }
					   
   PORTC=0X00; // 清空数码管
   PORTD=0X00;
  }
}
