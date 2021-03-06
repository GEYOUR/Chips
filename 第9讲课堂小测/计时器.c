#include<iom16v.h>
#include <macros.h>

int jishu=0; //全局变量，用于计算

#pragma interrupt_handler Int_TCCR0: 20
//定时器中断，注意中断向量号
void Int_TCCR0(void){ 
     jishu++; //计数器jishu加1
     if(jishu==1000)
       //当jishu=1000，表明1s时间到
       {
          PORTA =PORTA^0b00100000; 
                   //翻转PA5的电平信号
          jishu=0; //jishu清“0”，非常重要
       }
}
void main(void)
{ PORTA=0x00; //定义PA口输出
  DDRA=0xFF;
  TCCR0=0x0B; //CTC模式，系统频率64分频，OC0引脚断开
  TCNT0=0x00; 
  OCR0=0x3E; //1ms定时的比较值
  TIMSK=0x02; //T/C0比较匹配中断开放
  SEI();
  while(1)
      {   };
}
