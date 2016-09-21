
_ADXL345_Write:

;AccelSPI_Test.c,26 :: 		void ADXL345_Write(unsigned short address, unsigned short data1) {
;AccelSPI_Test.c,27 :: 		unsigned short internal = 0;
;AccelSPI_Test.c,30 :: 		CS_bit = 0;
	BCF        RC0_bit+0, 0
;AccelSPI_Test.c,31 :: 		SPI1_Write(internal);
	MOVF       FARG_ADXL345_Write_address+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;AccelSPI_Test.c,32 :: 		SPI1_Write(data1);
	MOVF       FARG_ADXL345_Write_data1+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;AccelSPI_Test.c,33 :: 		CS_bit = 1;
	BSF        RC0_bit+0, 0
;AccelSPI_Test.c,34 :: 		}
L_end_ADXL345_Write:
	RETURN
; end of _ADXL345_Write

_ADXL345_Read:

;AccelSPI_Test.c,36 :: 		unsigned short ADXL345_Read(unsigned short address) {
;AccelSPI_Test.c,37 :: 		unsigned short internal = 0;
;AccelSPI_Test.c,38 :: 		internal = address | _SPI_READ;
	MOVLW      128
	IORWF      FARG_ADXL345_Read_address+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
;AccelSPI_Test.c,40 :: 		CS_bit = 0;
	BCF        RC0_bit+0, 0
;AccelSPI_Test.c,41 :: 		SPI1_Write(internal);
	CALL       _SPI1_Write+0
;AccelSPI_Test.c,42 :: 		internal = SPI1_Read(0);
	CLRF       FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
;AccelSPI_Test.c,43 :: 		CS_bit = 1;
	BSF        RC0_bit+0, 0
;AccelSPI_Test.c,45 :: 		return internal;
;AccelSPI_Test.c,46 :: 		}
L_end_ADXL345_Read:
	RETURN
; end of _ADXL345_Read

_main:

;AccelSPI_Test.c,48 :: 		void main() {
;AccelSPI_Test.c,50 :: 		CS_bit = 1;
	BSF        RC0_bit+0, 0
;AccelSPI_Test.c,51 :: 		CS_Direction_bit = 0;
	BCF        TRISC0_bit+0, 0
;AccelSPI_Test.c,54 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_LOW_2_HIGH);
	CLRF       FARG_SPI1_Init_Advanced_master+0
	CLRF       FARG_SPI1_Init_Advanced_data_sample+0
	MOVLW      16
	MOVWF      FARG_SPI1_Init_Advanced_clock_idle+0
	MOVLW      1
	MOVWF      FARG_SPI1_Init_Advanced_transmit_edge+0
	CALL       _SPI1_Init_Advanced+0
;AccelSPI_Test.c,57 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AccelSPI_Test.c,59 :: 		UART1_Write_Text("Starting ADXL345 test.");
	MOVLW      ?lstr1_AccelSPI_Test+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AccelSPI_Test.c,60 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,61 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,63 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;AccelSPI_Test.c,66 :: 		ADXL345_Write(_POWER_CTL, 0x00);
	MOVLW      45
	MOVWF      FARG_ADXL345_Write_address+0
	CLRF       FARG_ADXL345_Write_data1+0
	CALL       _ADXL345_Write+0
;AccelSPI_Test.c,69 :: 		ADXL345_Write(_DATA_FORMAT, 0x0B);
	MOVLW      49
	MOVWF      FARG_ADXL345_Write_address+0
	MOVLW      11
	MOVWF      FARG_ADXL345_Write_data1+0
	CALL       _ADXL345_Write+0
;AccelSPI_Test.c,72 :: 		ADXL345_Write(_BW_RATE, _SPEED);
	MOVLW      44
	MOVWF      FARG_ADXL345_Write_address+0
	MOVLW      15
	MOVWF      FARG_ADXL345_Write_data1+0
	CALL       _ADXL345_Write+0
;AccelSPI_Test.c,75 :: 		ADXL345_Write(_POWER_CTL, 0x08);
	MOVLW      45
	MOVWF      FARG_ADXL345_Write_address+0
	MOVLW      8
	MOVWF      FARG_ADXL345_Write_data1+0
	CALL       _ADXL345_Write+0
;AccelSPI_Test.c,77 :: 		while (1) {
L_main1:
;AccelSPI_Test.c,79 :: 		Delay_ms(800);
	MOVLW      9
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;AccelSPI_Test.c,82 :: 		readings[0] = ADXL345_Read(_DATAX0) << 8;
	MOVLW      50
	MOVWF      FARG_ADXL345_Read_address+0
	CALL       _ADXL345_Read+0
	MOVF       R0+0, 0
	MOVWF      _readings+1
	CLRF       _readings+0
;AccelSPI_Test.c,85 :: 		readings[0] = readings[0] | ADXL345_Read(_DATAX1);
	MOVLW      51
	MOVWF      FARG_ADXL345_Read_address+0
	CALL       _ADXL345_Read+0
	MOVF       R0+0, 0
	IORWF      _readings+0, 1
	MOVLW      0
	IORWF      _readings+1, 1
;AccelSPI_Test.c,88 :: 		readings[1] = ADXL345_Read(_DATAY0) << 8;
	MOVLW      52
	MOVWF      FARG_ADXL345_Read_address+0
	CALL       _ADXL345_Read+0
	MOVF       R0+0, 0
	MOVWF      _readings+3
	CLRF       _readings+2
;AccelSPI_Test.c,91 :: 		readings[1] = readings[1] | ADXL345_Read(_DATAY1);
	MOVLW      53
	MOVWF      FARG_ADXL345_Read_address+0
	CALL       _ADXL345_Read+0
	MOVF       R0+0, 0
	IORWF      _readings+2, 1
	MOVLW      0
	IORWF      _readings+3, 1
;AccelSPI_Test.c,94 :: 		readings[2] = ADXL345_Read(_DATAZ0) << 8;
	MOVLW      54
	MOVWF      FARG_ADXL345_Read_address+0
	CALL       _ADXL345_Read+0
	MOVF       R0+0, 0
	MOVWF      _readings+5
	CLRF       _readings+4
;AccelSPI_Test.c,97 :: 		readings[2] = readings[2] | ADXL345_Read(_DATAZ1);
	MOVLW      55
	MOVWF      FARG_ADXL345_Read_address+0
	CALL       _ADXL345_Read+0
	MOVF       R0+0, 0
	IORWF      _readings+4, 1
	MOVLW      0
	IORWF      _readings+5, 1
;AccelSPI_Test.c,100 :: 		UART1_Write_Text("X: ");
	MOVLW      ?lstr2_AccelSPI_Test+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AccelSPI_Test.c,101 :: 		IntToStr(readings[0], out);
	MOVF       _readings+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _readings+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _out+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;AccelSPI_Test.c,102 :: 		UART1_Write_Text(out);
	MOVLW      _out+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AccelSPI_Test.c,103 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,104 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,106 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;AccelSPI_Test.c,109 :: 		UART1_Write_Text("Y: ");
	MOVLW      ?lstr3_AccelSPI_Test+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AccelSPI_Test.c,110 :: 		IntToStr(readings[1], out);
	MOVF       _readings+2, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _readings+3, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _out+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;AccelSPI_Test.c,111 :: 		UART1_Write_Text(out);
	MOVLW      _out+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AccelSPI_Test.c,112 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,113 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,115 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;AccelSPI_Test.c,118 :: 		UART1_Write_Text("Z: ");
	MOVLW      ?lstr4_AccelSPI_Test+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AccelSPI_Test.c,119 :: 		IntToStr(readings[2], out);
	MOVF       _readings+4, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _readings+5, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _out+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;AccelSPI_Test.c,120 :: 		UART1_Write_Text(out);
	MOVLW      _out+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AccelSPI_Test.c,121 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,122 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,124 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,125 :: 		UART1_Write(10);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;AccelSPI_Test.c,128 :: 		}
	GOTO       L_main1
;AccelSPI_Test.c,129 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
