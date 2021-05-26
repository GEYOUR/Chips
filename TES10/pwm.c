#include <iom16v.h>
#include <macros.h>

void io_init(void)   
{   DDRA=0x00;   
    PORTA=0xFF; 
    DDRD=0xFF; 
    PORTD=0xFF; 
}
///////////////////////////////////////////////
void pwm_init(void) 
{  TCCR1A|=(1<<WGM11)|(1<<WGM10)|(1<<COM1A1)|(1<<COM1B1);  
 TCCR1B|=(1<<CS11)|(1<<CS10); 
 TCNT1=0;
}
//////////////////////////////////////////////
void int_init(void) {
	CLI();			 /*关全局中断*/
    GICR|=0xE0;      //INT0,IN1,2中断允许
    MCUCSR=0x40;      //INT2上升沿触发
    GIFR=0xE0;    //清除掉INT0,IN1,2中断标志位
	SEI();			 /*全局中断允许*/
}

/////////////////
void delay(unsigned int i)
{  unsigned j;
   while(--i)
      { for(j=1;j<=100;j++)  
            ;
		}
}
//////////////////////
#pragma interrupt_handler Int2:19
void Int2(void)
{ int speed=0;
}
/////////////////////////////////////////////////////
void main(void)
{ int speed=0;
  io_init();
  int_init();   
  pwm_init();    
  OCR1A = speed;  
  OCR1B= speed;
  while(1)
   {   
    if ((PINA & (1 << PA0)) == 0)
       {   speed=100;    
          
           OCR1A=speed;       
           OCR1B=speed;      
           PORTD=(1<<PD0)|(1<<PD2);	
           
        }

if ((PINA & (1 << PA1)) == 0) 
  {
     speed=100;
     OCR1A=speed;  
     OCR1B=speed;
      PORTD=(1<<PD1)|(1<<PD3);
		
			
  }
	
if ((PINA & (1 << PA2)) == 0)
    {
         if(speed<1000)        
               
                speed=speed+200;
         else 
                  speed=1000;
	  OCR1A=speed;     
	  OCR1B=speed;
          delay(200); 
         
	}

if ((PINA & (1 << PA3)) == 0) 
  {    if(speed>100) 
      
	             speed=speed-200;
        else 
                    speed=100;
	  OCR1A=speed;     
	  OCR1B=speed;
	delay(200); 
     
 }
	
if ((PINA & (1 << PA4)) == 0) 
{      PORTD=(1<<PD0)|(1<<PD3);	
      
}
if ((PINA & (1 << PA5)) == 0) 
 {     PORTD=(1<<PD1)|(1<<PD2);	
    
  }
   }
}

	