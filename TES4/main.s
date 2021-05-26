	.module main.c
	.area data(ram, con, rel)
_countnum::
	.blkb 2
	.area idata
	.word 0
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\main.c
	.dbsym e countnum _countnum i
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\main.c
	.dbfunc e timer1_init _timer1_init fV
	.even
_timer1_init::
	.dbline -1
	.dbline 11
; /************************************************
; 文件：main.c
; 用途：
; 注意：内部8M晶振
; ************************************************/
; 
; #include "config.h"
; volatile unsigned int countnum=0; 
; 
; void timer1_init(void) 
; {
	.dbline 12
;  TCCR1B = 0x00; //stop
	clr R2
	out 0x2e,R2
	.dbline 13
;  TCNT1H = 0x8F; //setup
	ldi R24,143
	out 0x2d,R24
	.dbline 14
;  TCNT1L = 0x81;
	ldi R24,129
	out 0x2c,R24
	.dbline 15
;  OCR1AH = 0x70;
	ldi R24,112
	out 0x2b,R24
	.dbline 16
;  OCR1AL = 0x7F;
	ldi R24,127
	out 0x2a,R24
	.dbline 17
;  OCR1BH = 0x70;
	ldi R24,112
	out 0x29,R24
	.dbline 18
;  OCR1BL = 0x7F;
	ldi R24,127
	out 0x28,R24
	.dbline 19
;  OCR1CH = 0x70;
	ldi R24,112
	sts 121,R24
	.dbline 20
;  OCR1CL = 0x7F;
	ldi R24,127
	sts 120,R24
	.dbline 21
;  ICR1H  = 0x70;
	ldi R24,112
	out 0x27,R24
	.dbline 22
;  ICR1L  = 0x7F;
	ldi R24,127
	out 0x26,R24
	.dbline 23
;  TCCR1A = 0x00;
	out 0x2f,R2
	.dbline 24
;  TCCR1B = 0x04; //start Timer
	ldi R24,4
	out 0x2e,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.area vector(rom, abs)
	.org 56
	jmp _timer1_ovf_isr
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\main.c
	.dbfunc e timer1_ovf_isr _timer1_ovf_isr fV
	.even
_timer1_ovf_isr::
	st -y,R2
	st -y,R3
	st -y,R24
	st -y,R25
	in R2,0x3f
	st -y,R2
	.dbline -1
	.dbline 29
	.dbline 30
	ldi R24,143
	out 0x2d,R24
	.dbline 31
	ldi R24,129
	out 0x2c,R24
	.dbline 32
	lds R24,_countnum
	lds R25,_countnum+1
	adiw R24,1
	sts _countnum+1,R25
	sts _countnum,R24
	.dbline 33
	ldi R24,9999
	ldi R25,39
	lds R2,_countnum
	lds R3,_countnum+1
	cp R24,R2
	cpc R25,R3
	brsh L3
	.dbline 33
	clr R2
	clr R3
	sts _countnum+1,R3
	sts _countnum,R2
L3:
	.dbline -2
L2:
	ld R2,y+
	out 0x3f,R2
	ld R25,y+
	ld R24,y+
	ld R3,y+
	ld R2,y+
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e init_devices _init_devices fV
	.even
_init_devices::
	.dbline -1
	.dbline 38
; }
; 
; #pragma interrupt_handler timer1_ovf_isr:15
; void timer1_ovf_isr(void)
; {
;  TCNT1H = 0x8F; //reload counter high value
;  TCNT1L = 0x81; //reload counter low value
;  countnum++;
;  if(countnum>9999) countnum=0;
; 
; }
; 
; void init_devices(void)
; {
	.dbline 39
;  CLI(); //disable all interrupts
	cli
	.dbline 40
;  timer1_init();
	xcall _timer1_init
	.dbline 41
;  TIMSK = 0x04; //timer interrupt sources
	ldi R24,4
	out 0x37,R24
	.dbline 42
;  SEI(); //re-enable interrupts
	sei
	.dbline -2
L5:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e io_init _io_init fV
	.even
_io_init::
	.dbline -1
	.dbline 45
; }
; void io_init(void)
; {DDRD=0x00;
	.dbline 45
	clr R2
	out 0x11,R2
	.dbline 46
;  PORTD=0xFF;
	ldi R24,255
	out 0x12,R24
	.dbline -2
L6:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e main _main fV
;              i -> R22,R23
;      statuskey -> R20
	.even
_main::
	.dbline -1
	.dbline 49
; }
; void main(void)
; { unsigned int i=0;
	.dbline 49
	clr R22
	clr R23
	.dbline 50
;   unsigned char statuskey=0;//状态，用于判断是否切换K3，K4，并赋予初值
	clr R20
	.dbline 51
;   init_devices(); 
	xcall _init_devices
	.dbline 52
;   HC_595_init();
	xcall _HC_595_init
	.dbline 53
;   io_init();
	xcall _io_init
	xjmp L9
L8:
	.dbline 55
;   while(1)
;  	{  if((PIND&(1<<PD0))==0)
	.dbline 55
	sbic 0x10,0
	rjmp L11
	.dbline 56
; 	      {if(statuskey!=0)
	.dbline 56
	tst R20
	breq L13
	.dbline 58
; 		  
; 		    {i=0;
	.dbline 58
	clr R22
	clr R23
	.dbline 59
; 			 delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 60
; 		     statuskey=0;}
	clr R20
	.dbline 60
	xjmp L14
L13:
	.dbline 62
; 		   else
; 		      {if(i<9999)
	.dbline 62
	cpi R22,15
	ldi R30,39
	cpc R23,R30
	brsh L15
	.dbline 64
; 			     
; 				    {i++;
	.dbline 64
	subi R22,255  ; offset = 1
	sbci R23,255
	.dbline 65
; 					 delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 66
; 					 statuskey=0;
	clr R20
	.dbline 67
; 					 }
L15:
	.dbline 69
; 				  
; 				  }
L14:
	.dbline 70
; 			     }
L11:
	.dbline 73
; 		  
; 		       
; 		 if((PIND&(1<<PD1))==0)
	sbic 0x10,1
	rjmp L17
	.dbline 74
; 		        {if(statuskey!=0)
	.dbline 74
	tst R20
	breq L19
	.dbline 75
; 				    {statuskey=0;}
	.dbline 75
	clr R20
	.dbline 75
L19:
	.dbline 76
; 				  {if(i>0)
	.dbline 76
	cpi R22,0
	cpc R22,R23
	breq L21
X0:
	.dbline 77
; 				     {i--;
	.dbline 77
	subi R22,1
	sbci R23,0
	.dbline 78
; 					  statuskey=0;
	clr R20
	.dbline 79
; 					  delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 80
; 					  delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 81
; 					  }
L21:
	.dbline 82
; 				    } 
	.dbline 84
; 					 
; 				  }
L17:
	.dbline 86
; 				  
; 		   if((PIND&(1<<PD2))==0)//K3
	sbic 0x10,2
	rjmp L23
	.dbline 87
; 		        { if((statuskey==0)|(statuskey==2))
	.dbline 87
	tst R20
	brne L27
	ldi R24,1
	ldi R25,0
	movw R12,R24
	xjmp L28
L27:
	clr R12
	clr R13
L28:
	cpi R20,2
	brne L29
	ldi R24,1
	ldi R25,0
	movw R10,R24
	xjmp L30
L29:
	clr R10
	clr R11
L30:
	movw R2,R12
	or R2,R10
	or R3,R11
	tst R2
	brne X1
	tst R3
	breq L25
X1:
	.dbline 88
; 				    {i=1;
	.dbline 88
	ldi R22,1
	ldi R23,0
	.dbline 89
; 					 delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 90
; 					 statuskey=1;
	ldi R20,1
	.dbline 91
; 					 }
	xjmp L26
L25:
	.dbline 93
; 				  else 
; 			      {
	.dbline 95
; 				   
; 				   if(i<9999)
	cpi R22,15
	ldi R30,39
	cpc R23,R30
	brsh L31
	.dbline 96
; 			       {i=i+2;
	.dbline 96
	subi R22,254  ; offset = 2
	sbci R23,255
	.dbline 97
; 				    statuskey=1;
	ldi R20,1
	.dbline 98
; 				    delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 99
; 				    delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 100
; 				    }
L31:
	.dbline 101
; 				   }
L26:
	.dbline 102
; 				 }
L23:
	.dbline 104
; 				 
; 			  if((PIND&(1<<PD3))==0)
	sbic 0x10,3
	rjmp L33
	.dbline 105
; 		        {  if((statuskey==0)|(statuskey==1))
	.dbline 105
	tst R20
	brne L37
	ldi R24,1
	ldi R25,0
	movw R12,R24
	xjmp L38
L37:
	clr R12
	clr R13
L38:
	cpi R20,1
	brne L39
	ldi R24,1
	ldi R25,0
	movw R10,R24
	xjmp L40
L39:
	clr R10
	clr R11
L40:
	movw R2,R12
	or R2,R10
	or R3,R11
	tst R2
	brne X2
	tst R3
	breq L35
X2:
	.dbline 106
; 				    {i=2;
	.dbline 106
	ldi R22,2
	ldi R23,0
	.dbline 107
; 					 delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 108
; 					 statuskey=2;
	ldi R20,2
	.dbline 109
; 					 }
	xjmp L36
L35:
	.dbline 111
; 				  else
; 			       {
	.dbline 112
; 				   if(i<8192)
	cpi R22,0
	ldi R30,32
	cpc R23,R30
	brsh L41
	.dbline 113
; 				   {i=i*2;
	.dbline 113
	ldi R16,2
	ldi R17,0
	movw R18,R22
	xcall empy16s
	movw R22,R16
	.dbline 114
; 				  delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 115
; 				  delay_nms(200);
	ldi R16,200
	ldi R17,0
	xcall _delay_nms
	.dbline 116
; 				    }
L41:
	.dbline 117
; 				    }
L36:
	.dbline 119
; 				   
; 				   }
L33:
	.dbline 120
; 			if((PIND&(1<<PD4))==0)
	sbic 0x10,4
	rjmp L43
	.dbline 121
; 				  {
	.dbline 122
; 				   statuskey=0;
	clr R20
	.dbline 123
; 				   i=0;
	clr R22
	clr R23
	.dbline 124
; 				   }
L43:
	.dbline 128
	movw R16,R22
	xcall _Seg7_Led_display
	.dbline 131
L9:
	.dbline 54
	xjmp L8
X3:
	.dbline -2
L7:
	.dbline 0 ; func end
	ret
	.dbsym r i 22 i
	.dbsym r statuskey 20 c
	.dbend
