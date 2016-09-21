
_uart_write:

;energy_meter_rx_modified.c,24 :: 		void uart_write()
;energy_meter_rx_modified.c,26 :: 		for(i=6;i<=10;i++)
	MOVLW      6
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_uart_write0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__uart_write22
	MOVF       _i+0, 0
	SUBLW      10
L__uart_write22:
	BTFSS      STATUS+0, 0
	GOTO       L_uart_write1
;energy_meter_rx_modified.c,27 :: 		{UART1_Write(txt2[i]);
	MOVF       _i+0, 0
	ADDLW      _txt2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;energy_meter_rx_modified.c,26 :: 		for(i=6;i<=10;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;energy_meter_rx_modified.c,28 :: 		}
	GOTO       L_uart_write0
L_uart_write1:
;energy_meter_rx_modified.c,29 :: 		UART1_Write('s');
	MOVLW      115
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;energy_meter_rx_modified.c,30 :: 		for(i=5;i<=9;i++)
	MOVLW      5
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_uart_write3:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__uart_write23
	MOVF       _i+0, 0
	SUBLW      9
L__uart_write23:
	BTFSS      STATUS+0, 0
	GOTO       L_uart_write4
;energy_meter_rx_modified.c,32 :: 		UART1_Write(txt3[i]);
	MOVF       _i+0, 0
	ADDLW      _txt3+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;energy_meter_rx_modified.c,30 :: 		for(i=5;i<=9;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;energy_meter_rx_modified.c,33 :: 		}
	GOTO       L_uart_write3
L_uart_write4:
;energy_meter_rx_modified.c,34 :: 		UART1_Write_Text("\n");
	MOVLW      ?lstr1_energy_meter_rx_modified+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;energy_meter_rx_modified.c,35 :: 		}
L_end_uart_write:
	RETURN
; end of _uart_write

_unit_uses:

;energy_meter_rx_modified.c,41 :: 		int unit_uses( int count, int cvalue)
;energy_meter_rx_modified.c,44 :: 		total_unit= 15 * count + cvalue;
	MOVLW      15
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       FARG_unit_uses_count+0, 0
	MOVWF      R4+0
	MOVF       FARG_unit_uses_count+1, 0
	MOVWF      R4+1
	CALL       _Mul_16x16_U+0
	MOVF       FARG_unit_uses_cvalue+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_unit_uses_cvalue+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
;energy_meter_rx_modified.c,45 :: 		return total_unit;
;energy_meter_rx_modified.c,46 :: 		}
L_end_unit_uses:
	RETURN
; end of _unit_uses

_user_bill:

;energy_meter_rx_modified.c,48 :: 		int user_bill( int unit)
;energy_meter_rx_modified.c,51 :: 		total_bill= unit*2;
	MOVF       FARG_user_bill_unit+0, 0
	MOVWF      R0+0
	MOVF       FARG_user_bill_unit+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
;energy_meter_rx_modified.c,52 :: 		return total_bill;
;energy_meter_rx_modified.c,54 :: 		}
L_end_user_bill:
	RETURN
; end of _user_bill

_show_bill:

;energy_meter_rx_modified.c,55 :: 		void show_bill( int bill, int unit)
;energy_meter_rx_modified.c,58 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx_modified.c,59 :: 		txt2[10] = (unit%10)+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_bill_unit+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_unit+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+10
;energy_meter_rx_modified.c,60 :: 		txt2[9] = ((unit/10)%10)+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_bill_unit+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_unit+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+9
;energy_meter_rx_modified.c,61 :: 		txt2[8] = ((unit/100)%10)+48;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_bill_unit+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_unit+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+8
;energy_meter_rx_modified.c,62 :: 		txt2[7] = ((unit/1000)%10)+48;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_show_bill_unit+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_unit+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+7
;energy_meter_rx_modified.c,63 :: 		txt2[6] = (unit/10000)+48;
	MOVLW      16
	MOVWF      R4+0
	MOVLW      39
	MOVWF      R4+1
	MOVF       FARG_show_bill_unit+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_unit+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt2+6
;energy_meter_rx_modified.c,66 :: 		txt3[9] = (bill%10)+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_bill_bill+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_bill+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt3+9
;energy_meter_rx_modified.c,67 :: 		txt3[8] = ((bill/10)%10)+48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_bill_bill+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_bill+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt3+8
;energy_meter_rx_modified.c,68 :: 		txt3[7] = ((bill/100)%10)+48;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FARG_show_bill_bill+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_bill+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt3+7
;energy_meter_rx_modified.c,69 :: 		txt3[6] = ((bill/1000)%10)+48;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FARG_show_bill_bill+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_bill+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt3+6
;energy_meter_rx_modified.c,70 :: 		txt3[5] = (bill/10000)+48;
	MOVLW      16
	MOVWF      R4+0
	MOVLW      39
	MOVWF      R4+1
	MOVF       FARG_show_bill_bill+0, 0
	MOVWF      R0+0
	MOVF       FARG_show_bill_bill+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt3+5
;energy_meter_rx_modified.c,72 :: 		Lcd_Out(1,1,txt2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx_modified.c,73 :: 		Lcd_Out(2,1,txt3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx_modified.c,74 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_show_bill6:
	DECFSZ     R13+0, 1
	GOTO       L_show_bill6
	DECFSZ     R12+0, 1
	GOTO       L_show_bill6
	DECFSZ     R11+0, 1
	GOTO       L_show_bill6
	NOP
;energy_meter_rx_modified.c,75 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
;energy_meter_rx_modified.c,76 :: 		uart_write();
	CALL       _uart_write+0
;energy_meter_rx_modified.c,77 :: 		}
L_end_show_bill:
	RETURN
; end of _show_bill

_main:

;energy_meter_rx_modified.c,80 :: 		void main() {
;energy_meter_rx_modified.c,81 :: 		ADCON1=0b00000110;
	MOVLW      6
	MOVWF      ADCON1+0
;energy_meter_rx_modified.c,85 :: 		UART1_Init(9600);               // Initialize UART module at 9600 bps
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;energy_meter_rx_modified.c,86 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;energy_meter_rx_modified.c,87 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;energy_meter_rx_modified.c,88 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx_modified.c,89 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx_modified.c,90 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx_modified.c,91 :: 		UART1_Write_Text(txt1);
	MOVLW      _txt1+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;energy_meter_rx_modified.c,92 :: 		UART1_Write(42);
	MOVLW      42
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;energy_meter_rx_modified.c,94 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;energy_meter_rx_modified.c,95 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx_modified.c,100 :: 		trisc=0b00001111;
	MOVLW      15
	MOVWF      TRISC+0
;energy_meter_rx_modified.c,101 :: 		portc=0b00000000;
	CLRF       PORTC+0
;energy_meter_rx_modified.c,102 :: 		count=0;
	CLRF       _count+0
	CLRF       _count+1
;energy_meter_rx_modified.c,104 :: 		while(1)
L_main9:
;energy_meter_rx_modified.c,106 :: 		cvalue=portc<<4;
	MOVLW      4
	MOVWF      R0+0
	MOVF       PORTC+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R0+0, 0
L__main28:
	BTFSC      STATUS+0, 2
	GOTO       L__main29
	RLF        R1+0, 1
	RLF        R1+1, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__main28
L__main29:
	MOVF       R1+0, 0
	MOVWF      _cvalue+0
	MOVF       R1+1, 0
	MOVWF      _cvalue+1
;energy_meter_rx_modified.c,107 :: 		if(cvalue==15&&count==0)
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      15
	XORWF      R1+0, 0
L__main30:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      0
	XORWF      _count+0, 0
L__main31:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
L__main20:
;energy_meter_rx_modified.c,108 :: 		flag1=1;
	MOVLW      1
	MOVWF      _flag1+0
	MOVLW      0
	MOVWF      _flag1+1
L_main13:
;energy_meter_rx_modified.c,109 :: 		if(cvalue==1 && flag1==1)
	MOVLW      0
	XORWF      _cvalue+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      1
	XORWF      _cvalue+0, 0
L__main32:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	MOVLW      0
	XORWF      _flag1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      1
	XORWF      _flag1+0, 0
L__main33:
	BTFSS      STATUS+0, 2
	GOTO       L_main16
L__main19:
;energy_meter_rx_modified.c,110 :: 		{count=count+1;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;energy_meter_rx_modified.c,111 :: 		unit=unit_uses(count,cvalue);
	MOVF       _count+0, 0
	MOVWF      FARG_unit_uses_count+0
	MOVF       _count+1, 0
	MOVWF      FARG_unit_uses_count+1
	MOVF       _cvalue+0, 0
	MOVWF      FARG_unit_uses_cvalue+0
	MOVF       _cvalue+1, 0
	MOVWF      FARG_unit_uses_cvalue+1
	CALL       _unit_uses+0
	MOVF       R0+0, 0
	MOVWF      _unit+0
	MOVF       R0+1, 0
	MOVWF      _unit+1
;energy_meter_rx_modified.c,112 :: 		bill = user_bill(unit);
	MOVF       R0+0, 0
	MOVWF      FARG_user_bill_unit+0
	MOVF       R0+1, 0
	MOVWF      FARG_user_bill_unit+1
	CALL       _user_bill+0
	MOVF       R0+0, 0
	MOVWF      _bill+0
	MOVF       R0+1, 0
	MOVWF      _bill+1
;energy_meter_rx_modified.c,113 :: 		show_bill(bill,unit);
	MOVF       R0+0, 0
	MOVWF      FARG_show_bill_bill+0
	MOVF       R0+1, 0
	MOVWF      FARG_show_bill_bill+1
	MOVF       _unit+0, 0
	MOVWF      FARG_show_bill_unit+0
	MOVF       _unit+1, 0
	MOVWF      FARG_show_bill_unit+1
	CALL       _show_bill+0
;energy_meter_rx_modified.c,114 :: 		while(portc<<4==1); }
L_main17:
	MOVLW      4
	MOVWF      R0+0
	MOVF       PORTC+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	MOVF       R0+0, 0
L__main34:
	BTFSC      STATUS+0, 2
	GOTO       L__main35
	RLF        R1+0, 1
	RLF        R1+1, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__main34
L__main35:
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      1
	XORWF      R1+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
	GOTO       L_main17
L_main18:
L_main16:
;energy_meter_rx_modified.c,117 :: 		cvalue=portc;
	MOVF       PORTC+0, 0
	MOVWF      _cvalue+0
	CLRF       _cvalue+1
;energy_meter_rx_modified.c,118 :: 		unit=unit_uses(count,cvalue)   ;
	MOVF       _count+0, 0
	MOVWF      FARG_unit_uses_count+0
	MOVF       _count+1, 0
	MOVWF      FARG_unit_uses_count+1
	MOVF       _cvalue+0, 0
	MOVWF      FARG_unit_uses_cvalue+0
	MOVF       _cvalue+1, 0
	MOVWF      FARG_unit_uses_cvalue+1
	CALL       _unit_uses+0
	MOVF       R0+0, 0
	MOVWF      _unit+0
	MOVF       R0+1, 0
	MOVWF      _unit+1
;energy_meter_rx_modified.c,119 :: 		bill = user_bill(unit);
	MOVF       R0+0, 0
	MOVWF      FARG_user_bill_unit+0
	MOVF       R0+1, 0
	MOVWF      FARG_user_bill_unit+1
	CALL       _user_bill+0
	MOVF       R0+0, 0
	MOVWF      _bill+0
	MOVF       R0+1, 0
	MOVWF      _bill+1
;energy_meter_rx_modified.c,120 :: 		show_bill(bill,unit);
	MOVF       R0+0, 0
	MOVWF      FARG_show_bill_bill+0
	MOVF       R0+1, 0
	MOVWF      FARG_show_bill_bill+1
	MOVF       _unit+0, 0
	MOVWF      FARG_show_bill_unit+0
	MOVF       _unit+1, 0
	MOVWF      FARG_show_bill_unit+1
	CALL       _show_bill+0
;energy_meter_rx_modified.c,124 :: 		}
	GOTO       L_main9
;energy_meter_rx_modified.c,125 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
