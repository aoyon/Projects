
_main:

;Graph.c,24 :: 		void main()
;Graph.c,26 :: 		ADCON1=0;
	CLRF       ADCON1+0
;Graph.c,28 :: 		TRISB=0;
	CLRF       TRISB+0
;Graph.c,29 :: 		TRISC=255;
	MOVLW      255
	MOVWF      TRISC+0
;Graph.c,30 :: 		PORTB=0;
	CLRF       PORTB+0
;Graph.c,31 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Graph.c,32 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Graph.c,33 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Graph.c,34 :: 		Delay_ms(50);
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
;Graph.c,37 :: 		while(1)
L_main1:
;Graph.c,40 :: 		s1=ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _s1+0
	MOVF       R0+1, 0
	MOVWF      _s1+1
;Graph.c,41 :: 		s1=s1/2.06;
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
	MOVWF      _s1+0
	MOVF       R0+1, 0
	MOVWF      _s1+1
;Graph.c,42 :: 		s2=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _s2+0
	MOVF       R0+1, 0
	MOVWF      _s2+1
;Graph.c,43 :: 		s2=s2/2.06;
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
	MOVWF      _s2+0
	MOVF       R0+1, 0
	MOVWF      _s2+1
;Graph.c,50 :: 		sprinti(line,"%03d*%03d",s1,s2);
	MOVLW      _line+0
	MOVWF      FARG_sprinti_wh+0
	MOVLW      ?lstr_1_Graph+0
	MOVWF      FARG_sprinti_f+0
	MOVLW      hi_addr(?lstr_1_Graph+0)
	MOVWF      FARG_sprinti_f+1
	MOVF       _s1+0, 0
	MOVWF      FARG_sprinti_wh+3
	MOVF       _s1+1, 0
	MOVWF      FARG_sprinti_wh+4
	MOVF       R0+0, 0
	MOVWF      FARG_sprinti_wh+5
	MOVF       R0+1, 0
	MOVWF      FARG_sprinti_wh+6
	CALL       _sprinti+0
;Graph.c,51 :: 		UART1_Write_Text(line);
	MOVLW      _line+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Graph.c,52 :: 		UART1_Write_Text("\n");
	MOVLW      ?lstr2_Graph+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Graph.c,53 :: 		Delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
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
;Graph.c,54 :: 		}
	GOTO       L_main1
;Graph.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
