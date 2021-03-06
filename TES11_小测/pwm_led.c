#include <iom16v.h>
#include <macros.h>
/*ADC采样函数，采样第1通道信号，采样分辨率1024*/
unsigned int get_ad(void) {
	unsigned int i;
	ADMUX = (1 << REFS0)|(1 << MUX0);/*AVCC、通道1*/
	ADCSRA|=(1 << ADEN) |(1<< ADSC);	/*使能、开启*/
	ADCSRA|=(1<<ADPS2)|(1 << ADPS1)|(1 << ADPS0);	/*128分频*/
	while(!(ADCSRA & (1 << ADIF)));	/*等待采样结束*/
	i = ADC;			/*读取AD结果*/
	ADCSRA &= ~(1 << ADIF);	/*清标志*/
	ADCSRA &= ~(1 << ADEN);	/*关闭转换*/
	return i;	   /*返回结果*/
}
void io_init(void) 
{	DDRA = 0x00;	/*方向输入*/
	PORTA = 0xFF;	/*打开上拉*/
	DDRB = 0xFF;	/*方向输出*/
	PORTB = 0xFF;	/*输出高电平*/
}
void pwm_init(void)
{   OCR0=0;	/*先预设值，防止启动瞬间值为空*/
    TCCR0 |=(1<<WGM00);   //相位可调PWM模式
    TCCR0 |=(1<<CS02);      //64分频
    TCCR0 |=(1<<COM01);     //正向PWM
}
void main(void) 
{	unsigned int j;
    io_init();	  /*IO口初始化*/
	pwm_init();
			while (1) 
			{	j = get_ad();		/*获取电压*/
				    //OCR1A=j/4;
					//OCR1B=j/4;  
      //AD是10位精度最大1023的值，而PWM是8位的，最大是255，所以必须除以4
	  	}
}
