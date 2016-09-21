
_main:

;energy_meter_tx.c,4 :: 		void main()
;energy_meter_tx.c,6 :: 		trisb = 0b00000001;
	MOVLW      1
	MOVWF      TRISB+0
;energy_meter_tx.c,7 :: 		portb = 0b00000000;
	CLRF       PORTB+0
;energy_meter_tx.c,8 :: 		trisc = 0b00000000;
	CLRF       TRISC+0
;energy_meter_tx.c,9 :: 		portc = 0b00000000;
	CLRF       PORTC+0
;energy_meter_tx.c,10 :: 		count = 0;
	CLRF       _count+0
;energy_meter_tx.c,11 :: 		while(1)
L_main0:
;energy_meter_tx.c,13 :: 		while(!portb.f0);
L_main2:
	BTFSC      PORTB+0, 0
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;energy_meter_tx.c,14 :: 		while(portb.f0)
L_main4:
	BTFSS      PORTB+0, 0
	GOTO       L_main5
;energy_meter_tx.c,15 :: 		{ count++;              //increment
	INCF       _count+0, 1
;energy_meter_tx.c,16 :: 		if(count==16)           // checking overflow
	MOVF       _count+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;energy_meter_tx.c,18 :: 		count=1;
	MOVLW      1
	MOVWF      _count+0
;energy_meter_tx.c,19 :: 		}
L_main6:
;energy_meter_tx.c,20 :: 		while(portb.f0);        //waiting for LDR to set 0
L_main7:
	BTFSS      PORTB+0, 0
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;energy_meter_tx.c,21 :: 		}
	GOTO       L_main4
L_main5:
;energy_meter_tx.c,22 :: 		portc=count;                // sending to encoader
	MOVF       _count+0, 0
	MOVWF      PORTC+0
;energy_meter_tx.c,23 :: 		portb.f1=0;             // enabel transmission
	BCF        PORTB+0, 1
;energy_meter_tx.c,24 :: 		delay_us(100);
	MOVLW      166
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	NOP
;energy_meter_tx.c,25 :: 		portb.f1=1;              // transmission terminate
	BSF        PORTB+0, 1
;energy_meter_tx.c,26 :: 		}
	GOTO       L_main0
;energy_meter_tx.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
