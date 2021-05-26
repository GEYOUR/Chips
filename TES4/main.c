/************************************************
�ļ���main.c
��;��
ע�⣺�ڲ�8M����
************************************************/

#include "config.h"
volatile unsigned int countnum=0; 

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
 countnum++;
 if(countnum>9999) countnum=0;

}

void init_devices(void)
{
 CLI(); //disable all interrupts
 timer1_init();
 TIMSK = 0x04; //timer interrupt sources
 SEI(); //re-enable interrupts
}
void io_init(void)
{DDRD=0x00;
 PORTD=0xFF;
}
void main(void)
{ unsigned int i=0;
  unsigned char statuskey=0;//״̬�������ж��Ƿ��л�K3��K4���������ֵ
  init_devices(); 
  HC_595_init();
  io_init();
  while(1)
 	{  if((PIND&(1<<PD0))==0)
	      {if(statuskey!=0)
		  
		    {i=0;
			 delay_nms(200);
		     statuskey=0;}
		   else
		      {if(i<9999)
			     
				    {i++;
					 delay_nms(200);
					 statuskey=0;
					 }
				  
				  }
			     }
		  
		       
		 if((PIND&(1<<PD1))==0)
		        {if(statuskey!=0)
				    {statuskey=0;}
				  {if(i>0)
				     {i--;
					  statuskey=0;
					  delay_nms(200);
					  delay_nms(200);
					  }
				    } 
					 
				  }
				  
		   if((PIND&(1<<PD2))==0)//K3
		        { if((statuskey==0)|(statuskey==2))
				    {i=1;
					 delay_nms(200);
					 statuskey=1;
					 }
				  else 
			      {
				   
				   if(i<9999)
			       {i=i+2;
				    statuskey=1;
				    delay_nms(200);
				    delay_nms(200);
				    }
				   }
				 }
				 
			  if((PIND&(1<<PD3))==0)
		        {  if((statuskey==0)|(statuskey==1))
				    {i=2;
					 delay_nms(200);
					 statuskey=2;
					 }
				  else
			       {
				   if(i<8192)
				   {i=i*2;
				  delay_nms(200);
				  delay_nms(200);
				    }
				    }
				   
				   }
			if((PIND&(1<<PD4))==0)
				  {
				   statuskey=0;
				   i=0;
				   }
				   
				
			   
		  Seg7_Led_display(i);  
				  
		 
	  }
  }

