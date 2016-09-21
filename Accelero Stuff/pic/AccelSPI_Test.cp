#line 1 "F:/Projects/accPIC/AccelSPI_Test.c"
#line 19 "F:/Projects/accPIC/AccelSPI_Test.c"
sbit CS_bit at RC0_bit;
sbit CS_Direction_bit at TRISC0_bit;

unsigned short temp;
char out[16];
int readings[3] = {0, 0, 0};

void ADXL345_Write(unsigned short address, unsigned short data1) {
 unsigned short internal = 0;
 internal = address |  0x00 ;

 CS_bit = 0;
 SPI1_Write(internal);
 SPI1_Write(data1);
 CS_bit = 1;
}

unsigned short ADXL345_Read(unsigned short address) {
 unsigned short internal = 0;
 internal = address |  0x80 ;

 CS_bit = 0;
 SPI1_Write(internal);
 internal = SPI1_Read(0);
 CS_bit = 1;

 return internal;
}

void main() {

 CS_bit = 1;
 CS_Direction_bit = 0;


 SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_LOW_2_HIGH);


 UART1_Init(9600);

 UART1_Write_Text("Starting ADXL345 test.");
 UART1_Write(13);
 UART1_Write(10);

 Delay_ms(1000);


 ADXL345_Write( 0x2D , 0x00);


 ADXL345_Write( 0x31 , 0x0B);


 ADXL345_Write( 0x2C ,  0x0F );


 ADXL345_Write( 0x2D , 0x08);

 while (1) {

 Delay_ms(800);


 readings[0] = ADXL345_Read( 0x32 ) << 8;


 readings[0] = readings[0] | ADXL345_Read( 0x33 );


 readings[1] = ADXL345_Read( 0x34 ) << 8;


 readings[1] = readings[1] | ADXL345_Read( 0x35 );


 readings[2] = ADXL345_Read( 0x36 ) << 8;


 readings[2] = readings[2] | ADXL345_Read( 0x37 );


 UART1_Write_Text("X: ");
 IntToStr(readings[0], out);
 UART1_Write_Text(out);
 UART1_Write(13);
 UART1_Write(10);

 Delay_ms(100);


 UART1_Write_Text("Y: ");
 IntToStr(readings[1], out);
 UART1_Write_Text(out);
 UART1_Write(13);
 UART1_Write(10);

 Delay_ms(100);


 UART1_Write_Text("Z: ");
 IntToStr(readings[2], out);
 UART1_Write_Text(out);
 UART1_Write(13);
 UART1_Write(10);

 UART1_Write(13);
 UART1_Write(10);


 }
}
