
_main:

;Aoyon.c,3 :: 		void main()
;Aoyon.c,6 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Aoyon.c,7 :: 		Delay_ms(50);
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
;Aoyon.c,10 :: 		while(1)
L_main1:
;Aoyon.c,12 :: 		for(i = 0; i<5; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      5
	SUBWF      _i+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Aoyon.c,14 :: 		UART1_Write_Text(rfidVal[i]);
	MOVF       _i+0, 0
	ADDLW      _rfidVal+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aoyon.c,15 :: 		UART1_Write_Text("\n");
	MOVLW      ?lstr6_Aoyon+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Aoyon.c,16 :: 		Delay_ms(3000);
	MOVLW      77
	MOVWF      R11+0
	MOVLW      25
	MOVWF      R12+0
	MOVLW      79
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;Aoyon.c,12 :: 		for(i = 0; i<5; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Aoyon.c,17 :: 		}
	GOTO       L_main3
L_main4:
;Aoyon.c,19 :: 		}
	GOTO       L_main1
;Aoyon.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
