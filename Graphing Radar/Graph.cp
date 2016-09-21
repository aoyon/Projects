#line 1 "F:/Projects/Graphing/Ruhul vai/Graph.c"

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



int i,j,k;
char uart_rd;
char line;
char *text1="Adc Value";

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

 i=ADC_Read(0);
 k=i/2.06;
 IntToStr(k,text1);

 UART1_Write_Text(text1);
 UART1_Write_Text("\n");
 Delay_ms(50);

 }
 }
