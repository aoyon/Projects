#line 1 "C:/Users/Aoyon/Desktop/energy meter/rx/energy_meter_rx_modified.c"

sbit LCD_RS at RB3_bit;
sbit LCD_EN at RB2_bit;
sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;

sbit LCD_RS_Direction at TRISB3_bit;
sbit LCD_EN_Direction at TRISB2_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;



char txt1[] = "Energy Meter";
char txt2[] = "Units=00000";
char txt3[] = "Bill=00000";

 int count,unit,cvalue,bill,flag1,flag2,i;

 void uart_write()
 {
 for(i=6;i<=10;i++)
 {UART1_Write(txt2[i]);
 }
 UART1_Write('s');
 for(i=5;i<=9;i++)
 {
 UART1_Write(txt3[i]);
 }
 UART1_Write_Text("\n");
 }





 int unit_uses( int count, int cvalue)
 {
 int total_unit;
 total_unit= 15 * count + cvalue;
 return total_unit;
 }

 int user_bill( int unit)
 {
 int total_bill;
 total_bill= unit*2;
 return total_bill;

 }
 void show_bill( int bill, int unit)
 {

 Lcd_Cmd(_LCD_CLEAR);
 txt2[10] = (unit%10)+48;
 txt2[9] = ((unit/10)%10)+48;
 txt2[8] = ((unit/100)%10)+48;
 txt2[7] = ((unit/1000)%10)+48;
 txt2[6] = (unit/10000)+48;


 txt3[9] = (bill%10)+48;
 txt3[8] = ((bill/10)%10)+48;
 txt3[7] = ((bill/100)%10)+48;
 txt3[6] = ((bill/1000)%10)+48;
 txt3[5] = (bill/10000)+48;

 Lcd_Out(1,1,txt2);
 Lcd_Out(2,1,txt3);
 delay_ms(500);
 i=0;
 uart_write();
 }


void main() {
 ADCON1=0b00000110;



 UART1_Init(9600);
 Delay_ms(100);
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,txt1);
 UART1_Write_Text(txt1);
 UART1_Write(42);

 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);




 trisc=0b00001111;
 portc=0b00000000;
 count=0;

 while(1)
 {
 cvalue=portc<<4;
 if(cvalue==15&&count==0)
 flag1=1;
 if(cvalue==1 && flag1==1)
 {count=count+1;
 unit=unit_uses(count,cvalue);
 bill = user_bill(unit);
 show_bill(bill,unit);
 while(portc<<4==1); }


 cvalue=portc;
 unit=unit_uses(count,cvalue) ;
 bill = user_bill(unit);
 show_bill(bill,unit);



 }
 }
