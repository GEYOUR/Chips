#include<iom16v.h>
#include<stdio.h>
unsigned char Table_of_Digits[]=
{
	0x00,0x3e,0x41,0x41,0x41,0x3e,0x00,0x00,
	0x00,0x00,0x00,0x21,0x7f,0x01,0x00,0x00,
	0x00,0x27,0x45,0x45,0x45,0x39,0x00,0x00,
	0x00,0x22,0x49,0x49,0x49,0x36,0x00,0x00,
	0x00,0x0c,0x14,0x24,0x7f,0x04,0x00,0x00,
	0x00,0x72,0x51,0x51,0x51,0x4e,0x00,0x00,
	0x00,0x3e,0x49,0x49,0x49,0x26,0x00,0x00,
	0x00,0x40,0x40,0x40,0x4f,0x70,0x00,0x00,
	0x00,0x36,0x49,0x49,0x49,0x36,0x00,0x00,
	0x00,0x32,0x49,0x49,0x49,0x3e,0x00,0x00
};
unsigned char row[]=
{
	0b10000000,0b01000000,
	0b00100000,0b00010000,
	0b00001000,0b00000100,
	0b00000010,0b00000001
};

void init(void)
{
	DDRC=0xFF;
	PORTC=0xFF;
	DDRD=0xFF;
	PORTD=0XFF;
	DDRA=0x00;
	PORTA=0XFF;
}

void disp(unsigned char i)
{
	unsigned char j;
	for(j=0;j<8;j++)
	{PORTC=Table_of_Digits[j+i*8];
     PORTD=~row[j];
	 }
}

void main(void)
{
	unsigned char i=9;
	unsigned char a=0;
	unsigned char key=0;
	unsigned int time=0;
	init();
	while(1)
	{      
		//for(i=9;i>0;i--)
		
		 while((i==9)&(key==0))
		   {for(i=9;i>0;i--)
			    for(time=0;time<=2000;time++)
			      {disp(i);}
			   
			  
			  //if(i>3){break;}
			// if(i=1)
			 // {continue;}
			   // if((PINA&(1<<PA0))==0)
                 // {key=1;}
			 }
			 
		 if((PINA&(1<<PA0))==0)
		    {key=1;
			  if(i<9){i++;}
			  else{i=0;}
			  }
		  if((PINA&(1<<PA1))==0)
		    {
			  if(i>0){i--;}
			  else{i=9;}
			  }  
		if((PINA&(1<<PA2))==0)
		    {
			  for(i=0;i<=9;i++)
			    for(time=0;time<=2000;time++)
			      {disp(i);}
			  }  
		if((PINA&(1<<PA3))==0)
		    {
			  i=0;
			  }  
		 if((PINA&(1<<PA4))==0)
		    {
			  i=20;
			  }
		 a=i; 
	     if((PINA&(1<<PA5))==0)
		    {
			  i=a;
			  }
		   
		 if((PINA&(1<<PA6))==0)
		    {
			  i=a;
			  } 
		for(time=0;time<=2000;time++)
			     {disp(i);}
	}
	
}