#include <iom16v.h>
#include <macros.h>
unsigned char num[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,
                          0x7F,0x6F};  //共阴极
void io_init(void)
{DDRA=0XFF; //设置为输出
 PORTA=0X00; //初始值为不显示
 DDRB=0XFF; //设置为输出
 PORTB=0XFF; //初始值为不显示
 DDRA=0X00; //设置为输入
 PORTA=0XFF;
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
{ unsigned char min=0,sec=0,disp[4];
  
   unsigned char statuskey=0;
   io_init();
while(1)
 {   
 
    for(min=0;min<60;min++)
	    for(sec=0;sec<60;sec++)
		   {   disp[0]=sec%10;
               disp[1]=sec/10;
               disp[2]=min%10;
               disp[3]=min/10;
               display(disp);
			
			 if((PIND&(1<<PD0))==0)
	      {
		    for(min=0;min<60;min++)
	           for(sec=0;sec<60;sec++)
		    {   disp[0]=sec%10;
               disp[1]=sec/10;
               disp[2]=min%10;
               disp[3]=min/10;
               display(disp);
			  if((PIND&(1<<PD1))==0)
	      {
		    while(1)
		    {   disp[0]=sec%10;
               disp[1]=sec/10;
               disp[2]=min%10;
               disp[3]=min/10;
               display(disp);
			 }
			 if((PIND&(1<<PD2))==0)
	       {
		    for(min=min;min<60;min++)
	           for(sec=sec;sec<60;sec++)
		     {   disp[0]=sec%10;
               disp[1]=sec/10;
               disp[2]=min%10;
               disp[3]=min/10;
               display(disp);
			  }
			  }
		      }
		    }
		   } 
		   
		   
		}
    
        /* 
    if((PINC&(1<<PC1))==0)
	      {if(result>0)
		       result=result-1;
		   else result=0;
            		  
		  }  
     if((PINC&(1<<PC2))==0)
	      {if(statuskey!=1)
		    {result=1;
			 delay(200);
			 statuskey=1;
			 }
           else
		    {result=result*2;
			 }   
	     	  
		  }
		if((PINC&(1<<PC3))==0)
	      {if(statuskey!=2)
		    {result=9998;
			 delay(200);
			 statuskey=2;
			 }
           else
		    {result=result/2;
			 }   
	     	  
		    }
		if((PINC&(1<<PC4))==0)
	      {if(statuskey!=3)
		    {result=1;
			 delay(200);
			 statuskey=3;
			 }
           else
		    {result=result+2;
			 }   
	     	  
		    }
		 if((PINC&(1<<PC5))==0)
	      {if(statuskey!=4)
		    {result=2;
			 delay(200);
			 statuskey=4;
			 }
           else
		    {result=result+2;
			 }   
	     	  
		    }
			
		  if((PINC&(1<<PC6))==0)
	      {
		    for(result=0;result<10;result++)
			 {
			     disp[0]=result%10;
                 disp[1]=result/10%10;
                 disp[2]=result/100%10;
                 disp[3]=result/1000;
                 display(disp);
				 delay(200);
			  }
			 for(result=9;result>1;result--)
			 {
			     disp[0]=result%10;
                 disp[1]=result/10%10;
                 disp[2]=result/100%10;
                 disp[3]=result/1000;
                 display(disp);
				 delay(200);
			  }
		     }
			 if((PINC&(1<<PC7))==0)
	       {
		    result=0;
			   
		    }

   disp[0]=result%10;
   disp[1]=result/10%10;
   disp[2]=result/100%10;
   disp[3]=result/1000;
   display(disp);*/
   }
   
}
