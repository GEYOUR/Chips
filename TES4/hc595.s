	.module hc595.c
	.area lit(rom, con, rel)
_Seg7_Data::
	.byte 63,6
	.byte 91,'O
	.byte 'f,'m
	.byte 125,7
	.byte 127,'o
	.byte 'w,124
	.byte 57,94
	.byte 'y,'q
	.byte 0
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\hc595.c
	.dbsym e Seg7_Data _Seg7_Data A[17:17]kc
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\hc595.c
_point::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\hc595.c
	.dbsym e point _point c
_point_pos::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\hc595.c
	.dbsym e point_pos _point_pos c
	.area text(rom, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\hc595.c
	.dbfunc e HC_595_init _HC_595_init fV
	.even
_HC_595_init::
	.dbline -1
	.dbline 22
; /************************************************
; 文件：hc595.c
; 用途：
; 注意：内部8M晶振
; ************************************************/
; #include "config.h"
; const unsigned char Seg7_Data[]={0x3F,0x06,0x5B,0x4F,0x66,             //0,1,2,3,4
;                                  0x6D,0x7D,0x07,0x7F,0x6F,             //5,6,7,8,9
; 						         0x77,0x7C,0x39,0x5E,0x79,0x71,0x00};              //a,b,c,d,e,f
; volatile unsigned char Seg7_Led_Buf[4],point=0,point_pos=0;						 //point是小数点标志1代表有小数点point_pos表示小数点位置
; /*************************************************************************
; ** 函数名称:HC595初始化
; ** 功能描述:
; ** 输　入:
; ** 输出	 :
; ** 全局变量:
; ** 调用模块:
; ** 说明：
; ** 注意：
; **************************************************************************/
; void HC_595_init(void)
; {
	.dbline 23
;  OE_DDR |= (1<<OE);
	sbi 0x14,7
	.dbline 24
;  OE_PORT &= (1<<OE);
	in R24,0x15
	andi R24,128
	out 0x15,R24
	.dbline 25
;  PORTB = 0x0F;
	ldi R24,15
	out 0x18,R24
	.dbline 26
;  spi_init();
	xcall _spi_init
	.dbline 27
;  Seg7_Led_Buf[0]=16;
	ldi R24,16
	sts _Seg7_Led_Buf,R24
	.dbline 28
;  Seg7_Led_Buf[1]=16;
	sts _Seg7_Led_Buf+1,R24
	.dbline 29
;  Seg7_Led_Buf[2]=16;
	sts _Seg7_Led_Buf+2,R24
	.dbline 30
;  Seg7_Led_Buf[3]=16;																			//16什么意思？
	sts _Seg7_Led_Buf+3,R24
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e HC_595_OUT _HC_595_OUT fV
;           data -> R20
	.even
_HC_595_OUT::
	xcall push_gset1
	mov R20,R16
	.dbline -1
	.dbline 43
; }
; /*************************************************************************
; ** 函数名称:HC595送数据
; ** 功能描述:
; ** 输　入:
; ** 输出	 :
; ** 全局变量:
; ** 调用模块: 
; ** 说明：
; ** 注意：
; **************************************************************************/
; void HC_595_OUT(unsigned char data)
; {
	.dbline 44
;  	 SS_L();
	cbi 0x18,0
	.dbline 45
; 	 SPI_MasterTransmit(data);
	mov R16,R20
	xcall _SPI_MasterTransmit
	.dbline 46
;  	 SS_H();
	sbi 0x18,0
	.dbline -2
L5:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r data 20 c
	.dbend
	.dbfunc e Seg7_Led_Update _Seg7_Led_Update fV
	.even
_Seg7_Led_Update::
	.dbline -1
	.dbline 59
; }
; /*************************************************************************
; ** 函数名称:HC595刷新显示
; ** 功能描述:
; ** 输　入:
; ** 输出	 :
; ** 全局变量:
; ** 调用模块: 
; ** 说明：
; ** 注意：
; **************************************************************************/
; void Seg7_Led_Update(void)
; {
	.dbline 60
;  HC_595_OUT(Seg7_Data[Seg7_Led_Buf[0]]); 
	ldi R24,<_Seg7_Data
	ldi R25,>_Seg7_Data
	lds R30,_Seg7_Led_Buf
	clr R31
	add R30,R24
	adc R31,R25
	elpm R16,Z
	xcall _HC_595_OUT
	.dbline 61
;  Seg7_Bit0_En(); 
	.dbline 61
	sbi 0x17,4
	.dbline 61
	sbi 0x18,4
	.dbline 61
	.dbline 61
	.dbline 62
;  delay_nus(60); 
	ldi R16,60
	ldi R17,0
	xcall _delay_nus
	.dbline 63
;  Seg7_Bit0_Dis();
	.dbline 63
	sbi 0x17,4
	.dbline 63
	cbi 0x18,4
	.dbline 63
	.dbline 63
	.dbline 65
;  
;  HC_595_OUT(Seg7_Data[Seg7_Led_Buf[1]]);
	ldi R24,<_Seg7_Data
	ldi R25,>_Seg7_Data
	lds R30,_Seg7_Led_Buf+1
	clr R31
	add R30,R24
	adc R31,R25
	elpm R16,Z
	xcall _HC_595_OUT
	.dbline 66
;  if((point==1)&&(point_pos==1))
	lds R24,_point
	cpi R24,1
	brne L8
	lds R24,_point_pos
	cpi R24,1
	brne L8
	.dbline 67
;  HC_595_OUT((Seg7_Data[Seg7_Led_Buf[1]])|(1<<dp));
	ldi R24,<_Seg7_Data
	ldi R25,>_Seg7_Data
	lds R30,_Seg7_Led_Buf+1
	clr R31
	add R30,R24
	adc R31,R25
	elpm R16,Z
	ori R16,128
	xcall _HC_595_OUT
L8:
	.dbline 68
;  Seg7_Bit1_En();
	.dbline 68
	sbi 0x17,5
	.dbline 68
	sbi 0x18,5
	.dbline 68
	.dbline 68
	.dbline 69
;  delay_nus(60);
	ldi R16,60
	ldi R17,0
	xcall _delay_nus
	.dbline 70
;  Seg7_Bit1_Dis();
	.dbline 70
	sbi 0x17,5
	.dbline 70
	cbi 0x18,5
	.dbline 70
	.dbline 70
	.dbline 72
;  
;  HC_595_OUT(Seg7_Data[Seg7_Led_Buf[2]]); 
	ldi R24,<_Seg7_Data
	ldi R25,>_Seg7_Data
	lds R30,_Seg7_Led_Buf+2
	clr R31
	add R30,R24
	adc R31,R25
	elpm R16,Z
	xcall _HC_595_OUT
	.dbline 73
;  if((point==1)&&(point_pos==2))
	lds R24,_point
	cpi R24,1
	brne L12
	lds R24,_point_pos
	cpi R24,2
	brne L12
	.dbline 74
;  HC_595_OUT((Seg7_Data[Seg7_Led_Buf[2]])|(1<<dp));
	ldi R24,<_Seg7_Data
	ldi R25,>_Seg7_Data
	lds R30,_Seg7_Led_Buf+2
	clr R31
	add R30,R24
	adc R31,R25
	elpm R16,Z
	ori R16,128
	xcall _HC_595_OUT
L12:
	.dbline 75
;  Seg7_Bit2_En();
	.dbline 75
	sbi 0x17,6
	.dbline 75
	sbi 0x18,6
	.dbline 75
	.dbline 75
	.dbline 76
;  delay_nus(60);
	ldi R16,60
	ldi R17,0
	xcall _delay_nus
	.dbline 77
;  Seg7_Bit2_Dis();
	.dbline 77
	sbi 0x17,6
	.dbline 77
	cbi 0x18,6
	.dbline 77
	.dbline 77
	.dbline 79
;  
;  HC_595_OUT(Seg7_Data[Seg7_Led_Buf[3]]);
	ldi R24,<_Seg7_Data
	ldi R25,>_Seg7_Data
	lds R30,_Seg7_Led_Buf+3
	clr R31
	add R30,R24
	adc R31,R25
	elpm R16,Z
	xcall _HC_595_OUT
	.dbline 80
;  if((point==1)&&(point_pos==3))
	lds R24,_point
	cpi R24,1
	brne L16
	lds R24,_point_pos
	cpi R24,3
	brne L16
	.dbline 81
;  HC_595_OUT((Seg7_Data[Seg7_Led_Buf[3]])|(1<<dp));
	ldi R24,<_Seg7_Data
	ldi R25,>_Seg7_Data
	lds R30,_Seg7_Led_Buf+3
	clr R31
	add R30,R24
	adc R31,R25
	elpm R16,Z
	ori R16,128
	xcall _HC_595_OUT
L16:
	.dbline 82
;  Seg7_Bit3_En();
	.dbline 82
	sbi 0x17,7
	.dbline 82
	sbi 0x18,7
	.dbline 82
	.dbline 82
	.dbline 83
;  delay_nus(60);
	ldi R16,60
	ldi R17,0
	xcall _delay_nus
	.dbline 84
;  Seg7_Bit3_Dis();
	.dbline 84
	sbi 0x17,7
	.dbline 84
	cbi 0x18,7
	.dbline 84
	.dbline 84
	.dbline -2
L6:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e Seg7_Led_display _Seg7_Led_display fV
;           data -> R20,R21
	.even
_Seg7_Led_display::
	xcall push_gset1
	movw R20,R16
	.dbline -1
	.dbline 97
; }
; /*************************************************************************
; ** 函数名称:Hc595显示整形数据
; ** 功能描述:
; ** 输　入:0~9999
; ** 输出	 :
; ** 全局变量:
; ** 调用模块: 
; ** 说明：
; ** 注意：
; **************************************************************************/
; void Seg7_Led_display(unsigned int data)
; {
	.dbline 98
;  if(data>9999) //错误处理,超出显示范围则全亮
	ldi R24,9999
	ldi R25,39
	cp R24,R20
	cpc R25,R21
	brsh L20
	.dbline 99
;  	{
	.dbline 100
; 	 HC_595_OUT(0xFF);
	ldi R16,255
	xcall _HC_595_OUT
	.dbline 101
; 	 Seg7_Bitselect_PORT|=((1<<Seg7_Bit0)|(1<<Seg7_Bit1)|(1<<Seg7_Bit2)|(1<<Seg7_Bit3));
	in R24,0x18
	ori R24,240
	out 0x18,R24
	.dbline 102
; 	}
	xjmp L21
L20:
	.dbline 103
;  else if(data>999)
	ldi R24,999
	ldi R25,3
	cp R24,R20
	cpc R25,R21
	brsh L22
	.dbline 104
;  	{
	.dbline 105
; 	 Seg7_Led_Buf[3]=data/1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall div16u
	sts _Seg7_Led_Buf+3,R16
	.dbline 106
;  	 Seg7_Led_Buf[2]=(data%1000)/100;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+2,R16
	.dbline 107
;  	 Seg7_Led_Buf[1]=(data%100)/10;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+1,R16
	.dbline 108
;  	 Seg7_Led_Buf[0]=data%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _Seg7_Led_Buf,R16
	.dbline 109
; 	 Seg7_Led_Update();
	xcall _Seg7_Led_Update
	.dbline 110
; 	}
	xjmp L23
L22:
	.dbline 111
;  else if(data>99)
	ldi R24,99
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brsh L27
	.dbline 112
;  	{
	.dbline 113
; 	 Seg7_Led_Buf[3]=16;																//16什么意思？
	ldi R24,16
	sts _Seg7_Led_Buf+3,R24
	.dbline 114
;  	 Seg7_Led_Buf[2]=(data%1000)/100;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+2,R16
	.dbline 115
;  	 Seg7_Led_Buf[1]=(data%100)/10;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+1,R16
	.dbline 116
;  	 Seg7_Led_Buf[0]=data%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _Seg7_Led_Buf,R16
	.dbline 117
; 	 Seg7_Led_Update();
	xcall _Seg7_Led_Update
	.dbline 118
; 	}
	xjmp L28
L27:
	.dbline 119
;  else if(data>9)
	ldi R24,9
	ldi R25,0
	cp R24,R20
	cpc R25,R21
	brsh L32
	.dbline 120
;  	{
	.dbline 121
; 	 Seg7_Led_Buf[3]=16;
	ldi R24,16
	sts _Seg7_Led_Buf+3,R24
	.dbline 122
;  	 Seg7_Led_Buf[2]=16;
	sts _Seg7_Led_Buf+2,R24
	.dbline 123
;  	 Seg7_Led_Buf[1]=(data%100)/10;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+1,R16
	.dbline 124
;  	 Seg7_Led_Buf[0]=data%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _Seg7_Led_Buf,R16
	.dbline 125
; 	 Seg7_Led_Update();
	xcall _Seg7_Led_Update
	.dbline 126
; 	}
	xjmp L33
L32:
	.dbline 128
;  else
;  	{
	.dbline 129
; 	 Seg7_Led_Buf[3]=16;
	ldi R24,16
	sts _Seg7_Led_Buf+3,R24
	.dbline 130
;  	 Seg7_Led_Buf[2]=16;
	sts _Seg7_Led_Buf+2,R24
	.dbline 131
;  	 Seg7_Led_Buf[1]=16;
	sts _Seg7_Led_Buf+1,R24
	.dbline 132
;  	 Seg7_Led_Buf[0]=data%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _Seg7_Led_Buf,R16
	.dbline 133
; 	 Seg7_Led_Update();
	xcall _Seg7_Led_Update
	.dbline 134
; 	}
L33:
L28:
L23:
L21:
	.dbline -2
L19:
	xcall pop_gset1
	.dbline 0 ; func end
	ret
	.dbsym r data 20 i
	.dbend
	.dbfunc e Seg7_Led_float _Seg7_Led_float fV
;           temp -> R20,R21
;           data -> y+8
	.even
_Seg7_Led_float::
	xcall push_arg4
	xcall push_gset2
	sbiw R28,4
	.dbline -1
	.dbline 147
; }
; /*************************************************************************
; ** 函数名称:HC595显示浮点数据
; ** 功能描述:
; ** 输　入:
; ** 输出	 :
; ** 全局变量:
; ** 调用模块: 
; ** 说明：
; ** 注意：
; **************************************************************************/
; void Seg7_Led_float(float data)
; {
	.dbline 154
;  unsigned int temp;
;  /*
;  重要说明:data+=0.00001;其中0.00001为容错值
;  解决float数据类型在计算机内部存储的误差问题，可以解决显示问题
;  但是会引入新的计算误差，如果精度要求大于0.00001建议更改容错值或者将此处注释掉 
;  */
;  data+=0.00001;
	movw R30,R28
	ldd R2,z+8
	ldd R3,z+9
	ldd R4,z+10
	ldd R5,z+11
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L41
	ldi R17,>L41
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall add32f
	movw R30,R28
	std z+8,R16
	std z+9,R17
	std z+10,R18
	std z+11,R19
	.dbline 155
;  point=1;
	ldi R24,1
	sts _point,R24
	.dbline 156
;  if(data>999) //错误处理,超出显示范围则全亮
	ldi R16,<L44
	ldi R17,>L44
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R30,R28
 ; stack offset 4
	ldd R2,z+12
	ldd R3,z+13
	ldd R4,z+14
	ldd R5,z+15
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall cmp32f
	brge L42
	.dbline 157
;  	{
	.dbline 158
; 	 HC_595_OUT(0xFF);
	ldi R16,255
	xcall _HC_595_OUT
	.dbline 159
; 	 Seg7_Bitselect_PORT|=((1<<Seg7_Bit0)|(1<<Seg7_Bit1)|(1<<Seg7_Bit2)|(1<<Seg7_Bit3));
	in R24,0x18
	ori R24,240
	out 0x18,R24
	.dbline 160
; 	}
	xjmp L43
L42:
	.dbline 161
;  else if(data>99)
	ldi R16,<L47
	ldi R17,>L47
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R30,R28
 ; stack offset 4
	ldd R2,z+12
	ldd R3,z+13
	ldd R4,z+14
	ldd R5,z+15
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall cmp32f
	brlt X0
	xjmp L45
X0:
	.dbline 162
;  	{
	.dbline 163
; 	 temp=data*10;
	ldi R16,<L50
	ldi R17,>L50
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R30,R28
 ; stack offset 4
	ldd R2,z+12
	ldd R3,z+13
	ldd R4,z+14
	ldd R5,z+15
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32f
	movw R30,R28
	std z+0,R16
	std z+1,R17
	std z+2,R18
	std z+3,R19
	movw R30,R28
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L51
	ldi R17,>L51
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L48
	movw R30,R28
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L51
	ldi R17,>L51
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R22,R16
	subi R22,0  ; offset = 32768
	sbci R23,128
	xjmp L49
L48:
	movw R30,R28
	ldd R16,z+0
	ldd R17,z+1
	ldd R18,z+2
	ldd R19,z+3
	xcall fp2int
	movw R22,R16
L49:
	movw R20,R22
	.dbline 164
; 	 point_pos=1;
	ldi R24,1
	sts _point_pos,R24
	.dbline 165
; 	 Seg7_Led_Buf[3]=temp/1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall div16u
	sts _Seg7_Led_Buf+3,R16
	.dbline 166
;  	 Seg7_Led_Buf[2]=(temp%1000)/100;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+2,R16
	.dbline 167
;  	 Seg7_Led_Buf[1]=(temp%100)/10;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+1,R16
	.dbline 168
;  	 Seg7_Led_Buf[0]=temp%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _Seg7_Led_Buf,R16
	.dbline 169
; 	 Seg7_Led_Update();
	xcall _Seg7_Led_Update
	.dbline 170
; 	}
	xjmp L46
L45:
	.dbline 171
;  else if(data>9)
	ldi R16,<L57
	ldi R17,>L57
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R30,R28
 ; stack offset 4
	ldd R2,z+12
	ldd R3,z+13
	ldd R4,z+14
	ldd R5,z+15
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall cmp32f
	brlt X1
	xjmp L55
X1:
	.dbline 172
;  	{
	.dbline 173
; 	 temp=data*100;
	ldi R16,<L60
	ldi R17,>L60
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R30,R28
 ; stack offset 4
	ldd R2,z+12
	ldd R3,z+13
	ldd R4,z+14
	ldd R5,z+15
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32f
	movw R30,R28
	std z+0,R16
	std z+1,R17
	std z+2,R18
	std z+3,R19
	movw R30,R28
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L51
	ldi R17,>L51
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L58
	movw R30,R28
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L51
	ldi R17,>L51
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R22,R16
	subi R22,0  ; offset = 32768
	sbci R23,128
	xjmp L59
L58:
	movw R30,R28
	ldd R16,z+0
	ldd R17,z+1
	ldd R18,z+2
	ldd R19,z+3
	xcall fp2int
	movw R22,R16
L59:
	movw R20,R22
	.dbline 174
; 	 point_pos=2;
	ldi R24,2
	sts _point_pos,R24
	.dbline 175
; 	 Seg7_Led_Buf[3]=temp/1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall div16u
	sts _Seg7_Led_Buf+3,R16
	.dbline 176
;  	 Seg7_Led_Buf[2]=(temp%1000)/100;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+2,R16
	.dbline 177
;  	 Seg7_Led_Buf[1]=(temp%100)/10;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+1,R16
	.dbline 178
;  	 Seg7_Led_Buf[0]=temp%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _Seg7_Led_Buf,R16
	.dbline 179
; 	 Seg7_Led_Update();
	xcall _Seg7_Led_Update
	.dbline 180
; 	}
	xjmp L56
L55:
	.dbline 182
;  else
;  	{
	.dbline 183
; 	 temp=data*1000;
	ldi R16,<L66
	ldi R17,>L66
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	movw R30,R28
 ; stack offset 4
	ldd R2,z+12
	ldd R3,z+13
	ldd R4,z+14
	ldd R5,z+15
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	xcall empy32f
	movw R30,R28
	std z+0,R16
	std z+1,R17
	std z+2,R18
	std z+3,R19
	movw R30,R28
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L51
	ldi R17,>L51
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall cmp32f
	brlt L64
	movw R30,R28
	ldd R2,z+0
	ldd R3,z+1
	ldd R4,z+2
	ldd R5,z+3
	st -y,R5
	st -y,R4
	st -y,R3
	st -y,R2
	ldi R16,<L51
	ldi R17,>L51
	xcall elpm32
	st -y,R19
	st -y,R18
	st -y,R17
	st -y,R16
	xcall sub32f
	xcall fp2int
	movw R22,R16
	subi R22,0  ; offset = 32768
	sbci R23,128
	xjmp L65
L64:
	movw R30,R28
	ldd R16,z+0
	ldd R17,z+1
	ldd R18,z+2
	ldd R19,z+3
	xcall fp2int
	movw R22,R16
L65:
	movw R20,R22
	.dbline 184
; 	 point_pos=3;
	ldi R24,3
	sts _point_pos,R24
	.dbline 185
; 	 Seg7_Led_Buf[3]=temp/1000;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall div16u
	sts _Seg7_Led_Buf+3,R16
	.dbline 186
;  	 Seg7_Led_Buf[2]=(temp%1000)/100;
	ldi R18,1000
	ldi R19,3
	movw R16,R20
	xcall mod16u
	ldi R18,100
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+2,R16
	.dbline 187
;  	 Seg7_Led_Buf[1]=(temp%100)/10;
	ldi R18,100
	ldi R19,0
	movw R16,R20
	xcall mod16u
	ldi R18,10
	ldi R19,0
	xcall div16u
	sts _Seg7_Led_Buf+1,R16
	.dbline 188
;  	 Seg7_Led_Buf[0]=temp%10;
	ldi R18,10
	ldi R19,0
	movw R16,R20
	xcall mod16u
	sts _Seg7_Led_Buf,R16
	.dbline 189
; 	 Seg7_Led_Update();
	xcall _Seg7_Led_Update
	.dbline 190
; 	}
L56:
L46:
L43:
	.dbline 191
;  point=0;
	clr R2
	sts _point,R2
	.dbline -2
L40:
	adiw R28,4
	xcall pop_gset2
	adiw R28,4
	.dbline 0 ; func end
	ret
	.dbsym r temp 20 i
	.dbsym l data 8 D
	.dbend
	.area bss(ram, con, rel)
	.dbfile C:\DOCUME~1\Administrator\桌面\test4\hc595.c
_Seg7_Led_Buf::
	.blkb 4
	.dbsym e Seg7_Led_Buf _Seg7_Led_Buf A[4:4]c
	.area lit(rom, con, rel)
L66:
	.word 0x0,0x447a
L60:
	.word 0x0,0x42c8
L57:
	.word 0x0,0x4110
L51:
	.word 0x0,0x4700
L50:
	.word 0x0,0x4120
L47:
	.word 0x0,0x42c6
L44:
	.word 0xc000,0x4479
L41:
	.word 0xc5ac,0x3727
