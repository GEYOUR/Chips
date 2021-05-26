#include <iom16v.h>
#include <macros.h>

void io_init(void)   
{   DDRA=0x00;   
    PORTA=0xFF;
	DDRD=0xFF; 
	PORTD=0xFF; 
    DDRB=0xFF; 
	PORTB=0xFF;
	
  
	
}
///////////////////////////////////////////////
void pwm_init(void) 
{  TCCR0|=(1<<WGM00)|(1<<COM01)|(1<<CS02);
   TCCR2|=(1<<WGM20)|(1<<COM21)|(1<<CS22);   


}
//////////////////////////////////////////////
void delay(unsigned int i)
{  unsigned j;
   while(--i)
      { for(j=1;j<=100;j++)  
            ;
		}
}

/////////////////

//////////////////////

/////////////////////////////////////////////////////
void main(void)
{ int speed=0;
  io_init();
 
  pwm_init();    
  OCR0 = speed;  
  OCR2= speed;
  while(1)
   {   
    if ((PINA & (1 << PA0)) == 0)
       {   speed=100;    
          
           OCR0=speed;       
           OCR2=speed;      
           PORTD=(1<<PD0)|(1<<PD2);	
           
        }

if ((PINA & (1 << PA1)) == 0) 
  {
     speed=25;
     OCR0=speed;  
     OCR2=speed;
      PORTD=(1<<PD1)|(1<<PD3);
		
			
  }
	
if ((PINA & (1 << PA2)) == 0)
    {
         if(speed<250)        
               
                speed=speed+25;
         else 
                  speed=250;
	  OCR0=speed;     
	  OCR2=speed;
          delay(200); 
         
	}

if ((PINA & (1 << PA3)) == 0) 
  {    if(speed>25) 
      
	             speed=speed-25;
        else 
                    speed=25;
	  OCR0=speed;     
	  OCR2=speed;
	delay(200); 
     
 }
	
if ((PINA & (1 << PA4)) == 0) 
{      PORTD=(1<<PD0)|(1<<PD3);	
      
}
if ((PINA & (1 << PA5)) == 0) 
 {     PORTD=(1<<PD1)|(1<<PD2);	
    
  }
 if ((PINA & (1 << PA6)) == 0) 
 {    speed=0;
      OCR0=speed;     
	  OCR2=speed;
    
  }
   
}
}
	