
_interrupt:

;Aoyon USB IO Device.c,4 :: 		void interrupt(){
;Aoyon USB IO Device.c,5 :: 		USB_Interrupt_Proc();                   // USB servicing is done inside the interrupt
	CALL        _USB_Interrupt_Proc+0, 0
;Aoyon USB IO Device.c,6 :: 		}
L_end_interrupt:
L__interrupt12:
	RETFIE      1
; end of _interrupt

_main:

;Aoyon USB IO Device.c,10 :: 		void main(void){
;Aoyon USB IO Device.c,13 :: 		ADCON1 = 0;
	CLRF        ADCON1+0 
;Aoyon USB IO Device.c,14 :: 		CMCON  |= 7;         // Disable comparators
	MOVLW       7
	IORWF       CMCON+0, 1 
;Aoyon USB IO Device.c,16 :: 		TRISC.RC0 = 0;
	BCF         TRISC+0, 0 
;Aoyon USB IO Device.c,17 :: 		PORTC.RC0 = 0;
	BCF         PORTC+0, 0 
;Aoyon USB IO Device.c,18 :: 		TRISC.RC1 = 0;
	BCF         TRISC+0, 1 
;Aoyon USB IO Device.c,19 :: 		PORTC.RC1 = 0;
	BCF         PORTC+0, 1 
;Aoyon USB IO Device.c,21 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;Aoyon USB IO Device.c,22 :: 		HID_Enable(&readbuff,&writebuff);  // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;Aoyon USB IO Device.c,24 :: 		while(1){
L_main0:
;Aoyon USB IO Device.c,26 :: 		if(HID_Read())
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;Aoyon USB IO Device.c,28 :: 		if(readbuff[62] == 1)
	MOVF        1342, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Aoyon USB IO Device.c,30 :: 		PORTC.RC0 = 1;
	BSF         PORTC+0, 0 
;Aoyon USB IO Device.c,31 :: 		readbuff[62] = 0;
	CLRF        1342 
;Aoyon USB IO Device.c,32 :: 		}
L_main3:
;Aoyon USB IO Device.c,33 :: 		if(readbuff[63] == 1)
	MOVF        1343, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Aoyon USB IO Device.c,35 :: 		PORTC.RC0 = 0;
	BCF         PORTC+0, 0 
;Aoyon USB IO Device.c,36 :: 		readbuff[63] = 0;
	CLRF        1343 
;Aoyon USB IO Device.c,37 :: 		}
L_main4:
;Aoyon USB IO Device.c,39 :: 		if(readbuff[60] == 1)
	MOVF        1340, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Aoyon USB IO Device.c,41 :: 		PORTC.RC1 = 1;
	BSF         PORTC+0, 1 
;Aoyon USB IO Device.c,42 :: 		readbuff[64] = 0;
	CLRF        1344 
;Aoyon USB IO Device.c,43 :: 		}
L_main5:
;Aoyon USB IO Device.c,45 :: 		if(readbuff[61] == 1)
	MOVF        1341, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;Aoyon USB IO Device.c,47 :: 		PORTC.RC1 = 0;
	BCF         PORTC+0, 1 
;Aoyon USB IO Device.c,48 :: 		readbuff[65] = 0;
	CLRF        1345 
;Aoyon USB IO Device.c,49 :: 		}
L_main6:
;Aoyon USB IO Device.c,50 :: 		}
	GOTO        L_main7
L_main2:
;Aoyon USB IO Device.c,53 :: 		adc_rd = ADC_Read(4);
	MOVLW       4
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_rd+0 
	MOVF        R1, 0 
	MOVWF       _adc_rd+1 
;Aoyon USB IO Device.c,54 :: 		adc_rd = adc_rd/2;
	MOVF        R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
	RRCF        R4, 1 
	RRCF        R3, 1 
	BCF         R4, 7 
	MOVF        R3, 0 
	MOVWF       _adc_rd+0 
	MOVF        R4, 0 
	MOVWF       _adc_rd+1 
;Aoyon USB IO Device.c,55 :: 		writebuff[11] = (char)adc_rd;        //low
	MOVF        R3, 0 
	MOVWF       1355 
;Aoyon USB IO Device.c,56 :: 		writebuff[12] = (char)(adc_rd >> 8); //High
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       1356 
;Aoyon USB IO Device.c,57 :: 		while(!HID_Write(&writebuff,64));        //Send to PC
L_main8:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
	GOTO        L_main8
L_main9:
;Aoyon USB IO Device.c,58 :: 		Delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
;Aoyon USB IO Device.c,59 :: 		}
L_main7:
;Aoyon USB IO Device.c,62 :: 		}
	GOTO        L_main0
;Aoyon USB IO Device.c,63 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
