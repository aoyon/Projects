#line 1 "C:/Users/Ahamed Nasif/Desktop/Graphing/Graph.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;



int s1,s2,s3,s4,s5,k;
char uart_rd;
char line[20];

bit but1;

void main()
{
 ADCON1=0;

 TRISB=0;
 TRISC=255;
 PORTB=0;
 ADC_Init();
 Lcd_Init();
 UART1_Init(9600);
 Delay_ms(50);


 while(1)
 {

 s1=ADC_Read(0);
 s1=s1/2.06;
 s2=ADC_Read(1);
 s2=s2/2.06;
 s3=ADC_Read(2);
 s3=s3/2.06;
 s4=ADC_Read(3);
 s4=s4/2.06;
 sprinti(line,"%03d*%03d*%03d*%03d",s1,s2,s3,s4);
 UART1_Write_Text(line);
 UART1_Write_Text("\n");
 Delay_ms(200);
 }
 }
