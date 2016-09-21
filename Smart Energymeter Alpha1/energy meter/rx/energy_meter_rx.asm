
_unit_uses:

;energy_meter_rx.c,24 :: 		int unit_uses( int count, int cvalue)
;energy_meter_rx.c,27 :: 		total_unit= 15 * count + cvalue;
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
;energy_meter_rx.c,28 :: 		return total_unit;
;energy_meter_rx.c,29 :: 		}
L_end_unit_uses:
	RETURN
; end of _unit_uses

_user_bill:

;energy_meter_rx.c,31 :: 		int user_bill( int unit)
;energy_meter_rx.c,34 :: 		total_bill= unit*2;
	MOVF       FARG_user_bill_unit+0, 0
	MOVWF      R0+0
	MOVF       FARG_user_bill_unit+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
;energy_meter_rx.c,35 :: 		return total_bill;
;energy_meter_rx.c,37 :: 		}
L_end_user_bill:
	RETURN
; end of _user_bill

_show_bill:

;energy_meter_rx.c,38 :: 		void show_bill( int bill, int unit)
;energy_meter_rx.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx.c,41 :: 		txt2[10] = (unit%10)+48;
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
;energy_meter_rx.c,42 :: 		txt2[9] = ((unit/10)%10)+48;
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
;energy_meter_rx.c,43 :: 		txt2[8] = ((unit/100)%10)+48;
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
;energy_meter_rx.c,44 :: 		txt2[7] = ((unit/1000)%10)+48;
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
;energy_meter_rx.c,45 :: 		txt2[6] = (unit/10000)+48;
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
;energy_meter_rx.c,48 :: 		txt3[9] = (bill%10)+48;
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
;energy_meter_rx.c,49 :: 		txt3[8] = ((bill/10)%10)+48;
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
;energy_meter_rx.c,50 :: 		txt3[7] = ((bill/100)%10)+48;
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
;energy_meter_rx.c,51 :: 		txt3[6] = ((bill/1000)%10)+48;
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
;energy_meter_rx.c,52 :: 		txt3[5] = (bill/10000)+48;
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
;energy_meter_rx.c,54 :: 		Lcd_Out(1,1,txt2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx.c,55 :: 		Lcd_Out(2,1,txt3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx.c,56 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_show_bill0:
	DECFSZ     R13+0, 1
	GOTO       L_show_bill0
	DECFSZ     R12+0, 1
	GOTO       L_show_bill0
	DECFSZ     R11+0, 1
	GOTO       L_show_bill0
	NOP
;energy_meter_rx.c,58 :: 		}
L_end_show_bill:
	RETURN
; end of _show_bill

_main:

;energy_meter_rx.c,66 :: 		void main() {
;energy_meter_rx.c,67 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;energy_meter_rx.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx.c,69 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx.c,70 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx.c,71 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	DECFSZ     R11+0, 1
	GOTO       L_main1
	NOP
	NOP
;energy_meter_rx.c,72 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;energy_meter_rx.c,73 :: 		Lcd_Out(1,1,txt2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx.c,74 :: 		Lcd_Out(2,1,txt3);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;energy_meter_rx.c,77 :: 		trisc=0b00001111;
	MOVLW      15
	MOVWF      TRISC+0
;energy_meter_rx.c,78 :: 		portc=0b00000000;
	CLRF       PORTC+0
;energy_meter_rx.c,79 :: 		count=0;
	CLRF       _count+0
	CLRF       _count+1
;energy_meter_rx.c,81 :: 		while(1)
L_main2:
;energy_meter_rx.c,83 :: 		cvalue=portc;
	MOVF       PORTC+0, 0
	MOVWF      _cvalue+0
	CLRF       _cvalue+1
;energy_meter_rx.c,84 :: 		if(cvalue==15&&count==0)
	MOVLW      0
	XORWF      _cvalue+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVLW      15
	XORWF      _cvalue+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      0
	XORWF      _count+0, 0
L__main19:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
L__main13:
;energy_meter_rx.c,85 :: 		flag1=1;
	MOVLW      1
	MOVWF      _flag1+0
	MOVLW      0
	MOVWF      _flag1+1
L_main6:
;energy_meter_rx.c,86 :: 		if(portc==1 && flag1==1)
	MOVF       PORTC+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	MOVLW      0
	XORWF      _flag1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVLW      1
	XORWF      _flag1+0, 0
L__main20:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
L__main12:
;energy_meter_rx.c,87 :: 		{count=count+1;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;energy_meter_rx.c,88 :: 		unit=unit_uses(count,cvalue);
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
;energy_meter_rx.c,89 :: 		bill = user_bill(unit);
	MOVF       R0+0, 0
	MOVWF      FARG_user_bill_unit+0
	MOVF       R0+1, 0
	MOVWF      FARG_user_bill_unit+1
	CALL       _user_bill+0
	MOVF       R0+0, 0
	MOVWF      _bill+0
	MOVF       R0+1, 0
	MOVWF      _bill+1
;energy_meter_rx.c,90 :: 		show_bill(bill,unit);
	MOVF       R0+0, 0
	MOVWF      FARG_show_bill_bill+0
	MOVF       R0+1, 0
	MOVWF      FARG_show_bill_bill+1
	MOVF       _unit+0, 0
	MOVWF      FARG_show_bill_unit+0
	MOVF       _unit+1, 0
	MOVWF      FARG_show_bill_unit+1
	CALL       _show_bill+0
;energy_meter_rx.c,91 :: 		while(portc==1); }
L_main10:
	MOVF       PORTC+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	GOTO       L_main10
L_main11:
L_main9:
;energy_meter_rx.c,94 :: 		cvalue=portc;
	MOVF       PORTC+0, 0
	MOVWF      _cvalue+0
	CLRF       _cvalue+1
;energy_meter_rx.c,95 :: 		unit=unit_uses(count,cvalue)   ;
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
;energy_meter_rx.c,96 :: 		bill = user_bill(unit);
	MOVF       R0+0, 0
	MOVWF      FARG_user_bill_unit+0
	MOVF       R0+1, 0
	MOVWF      FARG_user_bill_unit+1
	CALL       _user_bill+0
	MOVF       R0+0, 0
	MOVWF      _bill+0
	MOVF       R0+1, 0
	MOVWF      _bill+1
;energy_meter_rx.c,97 :: 		show_bill(bill,unit);
	MOVF       R0+0, 0
	MOVWF      FARG_show_bill_bill+0
	MOVF       R0+1, 0
	MOVWF      FARG_show_bill_bill+1
	MOVF       _unit+0, 0
	MOVWF      FARG_show_bill_unit+0
	MOVF       _unit+1, 0
	MOVWF      FARG_show_bill_unit+1
	CALL       _show_bill+0
;energy_meter_rx.c,105 :: 		}
	GOTO       L_main2
;energy_meter_rx.c,109 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
