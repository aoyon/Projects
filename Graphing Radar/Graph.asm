
_main:

;Graph.c,25 :: 		void main()
;Graph.c,27 :: 		ADCON1=0;
	CLRF       ADCON1+0
;Graph.c,29 :: 		TRISB=0;
	CLRF       TRISB+0
;Graph.c,30 :: 		TRISC=255;
	MOVLW      255
	MOVWF      TRISC+0
;Graph.c,31 :: 		PORTB=0;
	CLRF       PORTB+0
;Graph.c,32 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Graph.c,33 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Graph.c,34 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Graph.c,35 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
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
;Graph.c,38 :: 		while(1)
L_main1:
;Graph.c,41 :: 		i=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _i+0
	MOVF       R0+1, 0
	MOVWF      _i+1
;Graph.c,42 :: 		k=i/2.06;
	CALL       _Int2Double+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      215
	MOVWF      R4+1
	MOVLW      3
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _k+0
	MOVF       R0+1, 0
	MOVWF      _k+1
;Graph.c,43 :: 		IntToStr(k,text1);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVF       _text1+0, 0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Graph.c,45 :: 		UART1_Write_Text(text1);
	MOVF       _text1+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Graph.c,46 :: 		UART1_Write_Text("\n");
	MOVLW      ?lstr2_Graph+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Graph.c,47 :: 		Delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Graph.c,49 :: 		}
	GOTO       L_main1
;Graph.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
