#include <iom16v.h>
#include <macros.h>
char state=0; //全局开关变量
/*端口初始化函数*/
void io_init(void)
{DDRA=0xFF; //设置为输出
 PORTA=0x00;
 DDRB=0xFF; //设置为输出
 PORTB=0x00;
 DDRD=0x00; //设置为输入
 PORTD=0xFF;
}
/*中断初始化函数*/
void int_init(void) {
	CLI();			 /*关全局中断*/
    GICR|=0xC0;      //INT0,IN1中断允许
    MCUCR=0x0A;      //INT0,IN1下降沿触发
    GIFR=0xC0;    //清除掉INT0,IN1中断标志位
	SEI();			 /*全局中断允许*/
}
void delay(unsigned int i) //延时函数
{  
   while(--i)
      { 
            ;
		}
}
/*外部中断INT0，下降沿触发*/
#pragma interrupt_handler Int0: 2 
//中断程序，外部中断0，向量号为2
void Int0(void) {
unsigned int i;
i = 1000;			/*防按键颤动代码*/
while (i--) {
				if ((PIND & (1 << PD2)) != 0) {	/*按键是否为低电平*/
						return ;
									}
						}
													
			state=1;	/*设置为状态1*/
	      }
#pragma interrupt_handler Int1:3 
void Int1(void) {
       unsigned int i;
	   i = 1000;	
	   while (i --) {
	   if ((PIND & (1 << PD3)) != 0) {
	   return ;
             }
			} 
			
	  state=2;	/*设置为状态2*/
}
void blink(void) 
//一直闪烁，验证中断效果是否起作用
{PORTA=0x01;
 delay(100000);
 PORTA=0x00;
 delay(100000);
}
void main(void)
{ signed char j=0;
io_init();
int_init();
while(1)
{ switch(state)
{
case 1: PORTB=(1<<j);delay(10000);
if(j<7) j++;else j=0;
break;
case 2: PORTB=(1<<j);delay(10000);
if (j>0) j--;else j=7;
  break;
default: break;
}
blink(); //随便闪着玩，看有没有干扰
}
}