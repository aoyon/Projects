#line 1 "C:/Users/S. Farhan/Desktop/New folder (2)/energy meter/rx/energy_meter_rx.c"

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
 int count,unit,cvalue,bill,flag1,flag2;

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

 }







void main() {
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,txt1);
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt2);
 Lcd_Out(2,1,txt3);


 trisc=0b00001111;
 portc=0b00000000;
 count=0;

 while(1)
 {
 cvalue=portc;
 if(cvalue==15&&count==0)
 flag1=1;
 if(portc==1 && flag1==1)
 {count=count+1;
 unit=unit_uses(count,cvalue);
 bill = user_bill(unit);
 show_bill(bill,unit);
 while(portc==1); }


 cvalue=portc;
 unit=unit_uses(count,cvalue) ;
 bill = user_bill(unit);
 show_bill(bill,unit);







 }



 }
