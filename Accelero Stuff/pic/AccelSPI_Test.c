// ADXL345 Register Definition
#define _POWER_CTL      0x2D
#define _DATA_FORMAT    0x31
#define _BW_RATE        0x2C
#define _DATAX0         0x32
#define _DATAX1         0x33
#define _DATAY0         0x34
#define _DATAY1         0x35
#define _DATAZ0         0x36
#define _DATAZ1         0x37
#define _FIFO_CTL       0x38

#define _SPI_READ       0x80
#define _SPI_WRITE      0x00

#define _SPEED          0x0F
//

sbit CS_bit at RC0_bit;
sbit CS_Direction_bit at TRISC0_bit;

unsigned short temp;
char out[16];
int readings[3] = {0, 0, 0};

void ADXL345_Write(unsigned short address, unsigned short data1) {
  unsigned short internal = 0;
  internal = address | _SPI_WRITE;

  CS_bit = 0;
  SPI1_Write(internal);
  SPI1_Write(data1);
  CS_bit = 1;
}

unsigned short ADXL345_Read(unsigned short address) {
  unsigned short internal = 0;
  internal = address | _SPI_READ;

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


  ADXL345_Write(_POWER_CTL, 0x00);


  ADXL345_Write(_DATA_FORMAT, 0x0B);


  ADXL345_Write(_BW_RATE, _SPEED);


  ADXL345_Write(_POWER_CTL, 0x08);

  while (1) {

    Delay_ms(800);


    readings[0] = ADXL345_Read(_DATAX0) << 8;


    readings[0] = readings[0] | ADXL345_Read(_DATAX1);


    readings[1] = ADXL345_Read(_DATAY0) << 8;


    readings[1] = readings[1] | ADXL345_Read(_DATAY1);


    readings[2] = ADXL345_Read(_DATAZ0) << 8;


    readings[2] = readings[2] | ADXL345_Read(_DATAZ1);


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