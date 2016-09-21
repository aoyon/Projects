
_interrupt:

;Aoyon USB IO Device.c,4 :: 		void interrupt(){
;Aoyon USB IO Device.c,5 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;Aoyon USB IO Device.c,6 :: 		}
L_end_interrupt:
L__interrupt51:
	RETFIE      1
; end of _interrupt

_main:

;Aoyon USB IO Device.c,16 :: 		void main(void){
;Aoyon USB IO Device.c,19 :: 		ADCON1 = 0b00001010;                       // Analog Channel AN0,AN1,AN2,AN3,AN4 are active all other Analog channel are Digital
	MOVLW       10
	MOVWF       ADCON1+0 
;Aoyon USB IO Device.c,20 :: 		CMCON  |= 7;                              // Disable comparators
	MOVLW       7
	IORWF       CMCON+0, 1 
;Aoyon USB IO Device.c,22 :: 		TRISB = 0;
	CLRF        TRISB+0 
;Aoyon USB IO Device.c,23 :: 		PORTB = 0;
	CLRF        PORTB+0 
;Aoyon USB IO Device.c,24 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Aoyon USB IO Device.c,25 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Aoyon USB IO Device.c,27 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;Aoyon USB IO Device.c,28 :: 		HID_Enable(&readbuff,&writebuff);         // Enable HID communication
	MOVLW       _readbuff+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_readbuff+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;Aoyon USB IO Device.c,30 :: 		while(1){
L_main0:
;Aoyon USB IO Device.c,32 :: 		if(HID_Read())
	CALL        _HID_Read+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;Aoyon USB IO Device.c,34 :: 		if(readbuff[40] == 1)
	MOVF        1320, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;Aoyon USB IO Device.c,36 :: 		TRISB = 255;
	MOVLW       255
	MOVWF       TRISB+0 
;Aoyon USB IO Device.c,37 :: 		}
L_main3:
;Aoyon USB IO Device.c,38 :: 		if(readbuff[41] == 1)
	MOVF        1321, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Aoyon USB IO Device.c,40 :: 		TRISB = 0;
	CLRF        TRISB+0 
;Aoyon USB IO Device.c,41 :: 		}
L_main4:
;Aoyon USB IO Device.c,42 :: 		if(readbuff[42] == 1)
	MOVF        1322, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;Aoyon USB IO Device.c,44 :: 		TRISC = 255;
	MOVLW       255
	MOVWF       TRISC+0 
;Aoyon USB IO Device.c,45 :: 		}
L_main5:
;Aoyon USB IO Device.c,46 :: 		if(readbuff[43] == 1)
	MOVF        1323, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;Aoyon USB IO Device.c,48 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Aoyon USB IO Device.c,49 :: 		}
L_main6:
;Aoyon USB IO Device.c,52 :: 		if(readbuff[30] == 1)
	MOVF        1310, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;Aoyon USB IO Device.c,54 :: 		PORTB.RB0 =~ PORTB.f0;
	BTG         PORTB+0, 0 
;Aoyon USB IO Device.c,55 :: 		readbuff[30] = 0;
	CLRF        1310 
;Aoyon USB IO Device.c,56 :: 		}
L_main7:
;Aoyon USB IO Device.c,57 :: 		if(readbuff[31] == 1)
	MOVF        1311, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main8
;Aoyon USB IO Device.c,59 :: 		PORTB.f1 =~ PORTB.f1;
	BTG         PORTB+0, 1 
;Aoyon USB IO Device.c,60 :: 		readbuff[31] = 0;
	CLRF        1311 
;Aoyon USB IO Device.c,61 :: 		}
L_main8:
;Aoyon USB IO Device.c,62 :: 		if(readbuff[32] == 1)
	MOVF        1312, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;Aoyon USB IO Device.c,64 :: 		PORTB.f2 =~ PORTB.f2;
	BTG         PORTB+0, 2 
;Aoyon USB IO Device.c,65 :: 		readbuff[32] = 0;
	CLRF        1312 
;Aoyon USB IO Device.c,66 :: 		}
L_main9:
;Aoyon USB IO Device.c,67 :: 		if(readbuff[33] == 1)
	MOVF        1313, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
;Aoyon USB IO Device.c,69 :: 		PORTB.f3 =~ PORTB.f3;
	BTG         PORTB+0, 3 
;Aoyon USB IO Device.c,70 :: 		readbuff[33] = 0;
	CLRF        1313 
;Aoyon USB IO Device.c,71 :: 		}
L_main10:
;Aoyon USB IO Device.c,72 :: 		if(readbuff[34] == 1)
	MOVF        1314, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;Aoyon USB IO Device.c,74 :: 		PORTB.f4 =~ PORTB.f4;
	BTG         PORTB+0, 4 
;Aoyon USB IO Device.c,75 :: 		readbuff[34] = 0;
	CLRF        1314 
;Aoyon USB IO Device.c,76 :: 		}
L_main11:
;Aoyon USB IO Device.c,77 :: 		if(readbuff[35] == 1)
	MOVF        1315, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;Aoyon USB IO Device.c,79 :: 		PORTB.f5 =~ PORTB.f5;
	BTG         PORTB+0, 5 
;Aoyon USB IO Device.c,80 :: 		readbuff[35] = 0;
	CLRF        1315 
;Aoyon USB IO Device.c,81 :: 		}
L_main12:
;Aoyon USB IO Device.c,82 :: 		if(readbuff[36] == 1)
	MOVF        1316, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;Aoyon USB IO Device.c,84 :: 		PORTB.f6 =~ PORTB.f6;
	BTG         PORTB+0, 6 
;Aoyon USB IO Device.c,85 :: 		readbuff[36] = 0;
	CLRF        1316 
;Aoyon USB IO Device.c,86 :: 		}
L_main13:
;Aoyon USB IO Device.c,87 :: 		if(readbuff[37] == 1)
	MOVF        1317, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;Aoyon USB IO Device.c,89 :: 		PORTB.f7 =~ PORTB.f7;
	BTG         PORTB+0, 7 
;Aoyon USB IO Device.c,90 :: 		readbuff[37] = 0;
	CLRF        1317 
;Aoyon USB IO Device.c,91 :: 		}
L_main14:
;Aoyon USB IO Device.c,96 :: 		if(readbuff[21] == 1)
	MOVF        1301, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;Aoyon USB IO Device.c,98 :: 		PORTC.RC0 =~ PORTC.f0;
	BTG         PORTC+0, 0 
;Aoyon USB IO Device.c,99 :: 		readbuff[21] = 0;
	CLRF        1301 
;Aoyon USB IO Device.c,100 :: 		}
L_main15:
;Aoyon USB IO Device.c,101 :: 		if(readbuff[22] == 1)
	MOVF        1302, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main16
;Aoyon USB IO Device.c,103 :: 		PORTC.f1 =~ PORTC.f1;
	BTG         PORTC+0, 1 
;Aoyon USB IO Device.c,104 :: 		readbuff[22] = 0;
	CLRF        1302 
;Aoyon USB IO Device.c,105 :: 		}
L_main16:
;Aoyon USB IO Device.c,106 :: 		if(readbuff[23] == 1)
	MOVF        1303, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;Aoyon USB IO Device.c,108 :: 		PORTC.f2 =~ PORTC.f2;
	BTG         PORTC+0, 2 
;Aoyon USB IO Device.c,109 :: 		readbuff[23] = 0;
	CLRF        1303 
;Aoyon USB IO Device.c,110 :: 		}
L_main17:
;Aoyon USB IO Device.c,111 :: 		if(readbuff[24] == 1)
	MOVF        1304, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main18
;Aoyon USB IO Device.c,113 :: 		PORTC.f6 =~ PORTC.f6;
	BTG         PORTC+0, 6 
;Aoyon USB IO Device.c,114 :: 		readbuff[24] = 0;
	CLRF        1304 
;Aoyon USB IO Device.c,115 :: 		}
L_main18:
;Aoyon USB IO Device.c,116 :: 		if(readbuff[25] == 1)
	MOVF        1305, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
;Aoyon USB IO Device.c,118 :: 		PORTC.f7 =~ PORTC.f7;
	BTG         PORTC+0, 7 
;Aoyon USB IO Device.c,119 :: 		readbuff[25] = 0;
	CLRF        1305 
;Aoyon USB IO Device.c,120 :: 		}
L_main19:
;Aoyon USB IO Device.c,122 :: 		}
	GOTO        L_main20
L_main2:
;Aoyon USB IO Device.c,131 :: 		if(PORTB.f0 == 1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main21
;Aoyon USB IO Device.c,133 :: 		writebuff[30] = 1;
	MOVLW       1
	MOVWF       1374 
;Aoyon USB IO Device.c,134 :: 		}
	GOTO        L_main22
L_main21:
;Aoyon USB IO Device.c,137 :: 		writebuff[30] = 0;
	CLRF        1374 
;Aoyon USB IO Device.c,138 :: 		}
L_main22:
;Aoyon USB IO Device.c,139 :: 		if(PORTB.f1 == 1)
	BTFSS       PORTB+0, 1 
	GOTO        L_main23
;Aoyon USB IO Device.c,141 :: 		writebuff[31] = 1;
	MOVLW       1
	MOVWF       1375 
;Aoyon USB IO Device.c,142 :: 		}
	GOTO        L_main24
L_main23:
;Aoyon USB IO Device.c,145 :: 		writebuff[31] = 0;
	CLRF        1375 
;Aoyon USB IO Device.c,146 :: 		}
L_main24:
;Aoyon USB IO Device.c,147 :: 		if(PORTB.f2 == 1)
	BTFSS       PORTB+0, 2 
	GOTO        L_main25
;Aoyon USB IO Device.c,149 :: 		writebuff[32] = 1;
	MOVLW       1
	MOVWF       1376 
;Aoyon USB IO Device.c,150 :: 		}
	GOTO        L_main26
L_main25:
;Aoyon USB IO Device.c,153 :: 		writebuff[32] = 0;
	CLRF        1376 
;Aoyon USB IO Device.c,154 :: 		}
L_main26:
;Aoyon USB IO Device.c,155 :: 		if(PORTB.f3 == 1)
	BTFSS       PORTB+0, 3 
	GOTO        L_main27
;Aoyon USB IO Device.c,157 :: 		writebuff[33] = 1;
	MOVLW       1
	MOVWF       1377 
;Aoyon USB IO Device.c,158 :: 		}
	GOTO        L_main28
L_main27:
;Aoyon USB IO Device.c,161 :: 		writebuff[33] = 0;
	CLRF        1377 
;Aoyon USB IO Device.c,162 :: 		}
L_main28:
;Aoyon USB IO Device.c,163 :: 		if(PORTB.f4 == 1)
	BTFSS       PORTB+0, 4 
	GOTO        L_main29
;Aoyon USB IO Device.c,165 :: 		writebuff[34] = 1;
	MOVLW       1
	MOVWF       1378 
;Aoyon USB IO Device.c,166 :: 		}
	GOTO        L_main30
L_main29:
;Aoyon USB IO Device.c,169 :: 		writebuff[34] = 0;
	CLRF        1378 
;Aoyon USB IO Device.c,170 :: 		}
L_main30:
;Aoyon USB IO Device.c,171 :: 		if(PORTB.f5 == 1)
	BTFSS       PORTB+0, 5 
	GOTO        L_main31
;Aoyon USB IO Device.c,173 :: 		writebuff[35] = 1;
	MOVLW       1
	MOVWF       1379 
;Aoyon USB IO Device.c,174 :: 		}
	GOTO        L_main32
L_main31:
;Aoyon USB IO Device.c,177 :: 		writebuff[35] = 0;
	CLRF        1379 
;Aoyon USB IO Device.c,178 :: 		}
L_main32:
;Aoyon USB IO Device.c,179 :: 		if(PORTB.f6 == 1)
	BTFSS       PORTB+0, 6 
	GOTO        L_main33
;Aoyon USB IO Device.c,181 :: 		writebuff[36] = 1;
	MOVLW       1
	MOVWF       1380 
;Aoyon USB IO Device.c,182 :: 		}
	GOTO        L_main34
L_main33:
;Aoyon USB IO Device.c,185 :: 		writebuff[36] = 0;
	CLRF        1380 
;Aoyon USB IO Device.c,186 :: 		}
L_main34:
;Aoyon USB IO Device.c,187 :: 		if(PORTB.f7 == 1)
	BTFSS       PORTB+0, 7 
	GOTO        L_main35
;Aoyon USB IO Device.c,189 :: 		writebuff[37] = 1;
	MOVLW       1
	MOVWF       1381 
;Aoyon USB IO Device.c,190 :: 		}
	GOTO        L_main36
L_main35:
;Aoyon USB IO Device.c,193 :: 		writebuff[37] = 0;
	CLRF        1381 
;Aoyon USB IO Device.c,194 :: 		}
L_main36:
;Aoyon USB IO Device.c,201 :: 		if(PORTC.f0 == 1)
	BTFSS       PORTC+0, 0 
	GOTO        L_main37
;Aoyon USB IO Device.c,203 :: 		writebuff[21] = 1;
	MOVLW       1
	MOVWF       1365 
;Aoyon USB IO Device.c,204 :: 		}
	GOTO        L_main38
L_main37:
;Aoyon USB IO Device.c,207 :: 		writebuff[21] = 0;
	CLRF        1365 
;Aoyon USB IO Device.c,208 :: 		}
L_main38:
;Aoyon USB IO Device.c,210 :: 		if(PORTC.f1 == 1)
	BTFSS       PORTC+0, 1 
	GOTO        L_main39
;Aoyon USB IO Device.c,212 :: 		writebuff[22] = 1;
	MOVLW       1
	MOVWF       1366 
;Aoyon USB IO Device.c,213 :: 		}
	GOTO        L_main40
L_main39:
;Aoyon USB IO Device.c,216 :: 		writebuff[22] = 0;
	CLRF        1366 
;Aoyon USB IO Device.c,217 :: 		}
L_main40:
;Aoyon USB IO Device.c,219 :: 		if(PORTC.f2 == 1)
	BTFSS       PORTC+0, 2 
	GOTO        L_main41
;Aoyon USB IO Device.c,221 :: 		writebuff[23] = 1;
	MOVLW       1
	MOVWF       1367 
;Aoyon USB IO Device.c,222 :: 		}
	GOTO        L_main42
L_main41:
;Aoyon USB IO Device.c,225 :: 		writebuff[23] = 0;
	CLRF        1367 
;Aoyon USB IO Device.c,226 :: 		}
L_main42:
;Aoyon USB IO Device.c,228 :: 		if(PORTC.f6 == 1)
	BTFSS       PORTC+0, 6 
	GOTO        L_main43
;Aoyon USB IO Device.c,230 :: 		writebuff[24] = 1;
	MOVLW       1
	MOVWF       1368 
;Aoyon USB IO Device.c,231 :: 		}
	GOTO        L_main44
L_main43:
;Aoyon USB IO Device.c,234 :: 		writebuff[24] = 0;
	CLRF        1368 
;Aoyon USB IO Device.c,235 :: 		}
L_main44:
;Aoyon USB IO Device.c,237 :: 		if(PORTC.f7 == 1)
	BTFSS       PORTC+0, 7 
	GOTO        L_main45
;Aoyon USB IO Device.c,239 :: 		writebuff[25] = 1;
	MOVLW       1
	MOVWF       1369 
;Aoyon USB IO Device.c,240 :: 		}
	GOTO        L_main46
L_main45:
;Aoyon USB IO Device.c,243 :: 		writebuff[25] = 0;
	CLRF        1369 
;Aoyon USB IO Device.c,244 :: 		}
L_main46:
;Aoyon USB IO Device.c,247 :: 		adc_rdchn0 = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_rdchn0+0 
	MOVF        R1, 0 
	MOVWF       _adc_rdchn0+1 
;Aoyon USB IO Device.c,248 :: 		writebuff[11] = (char)adc_rdchn0;
	MOVF        R0, 0 
	MOVWF       1355 
;Aoyon USB IO Device.c,249 :: 		writebuff[12] = (char)(adc_rdchn0 >> 8);
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       1356 
;Aoyon USB IO Device.c,252 :: 		adc_rdchn1 = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_rdchn1+0 
	MOVF        R1, 0 
	MOVWF       _adc_rdchn1+1 
;Aoyon USB IO Device.c,253 :: 		writebuff[13] = (char)adc_rdchn1;
	MOVF        R0, 0 
	MOVWF       1357 
;Aoyon USB IO Device.c,254 :: 		writebuff[14] = (char)(adc_rdchn1 >> 8);
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       1358 
;Aoyon USB IO Device.c,257 :: 		adc_rdchn2 = ADC_Read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_rdchn2+0 
	MOVF        R1, 0 
	MOVWF       _adc_rdchn2+1 
;Aoyon USB IO Device.c,258 :: 		writebuff[15] = (char)adc_rdchn2;
	MOVF        R0, 0 
	MOVWF       1359 
;Aoyon USB IO Device.c,259 :: 		writebuff[16] = (char)(adc_rdchn2 >> 8);
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       1360 
;Aoyon USB IO Device.c,262 :: 		adc_rdchn3 = ADC_Read(3);
	MOVLW       3
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_rdchn3+0 
	MOVF        R1, 0 
	MOVWF       _adc_rdchn3+1 
;Aoyon USB IO Device.c,263 :: 		writebuff[17] = (char)adc_rdchn3;
	MOVF        R0, 0 
	MOVWF       1361 
;Aoyon USB IO Device.c,264 :: 		writebuff[18] = (char)(adc_rdchn3 >> 8);
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       1362 
;Aoyon USB IO Device.c,267 :: 		adc_rdchn4 = ADC_Read(4);
	MOVLW       4
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_rdchn4+0 
	MOVF        R1, 0 
	MOVWF       _adc_rdchn4+1 
;Aoyon USB IO Device.c,268 :: 		writebuff[19] = (char)adc_rdchn4;
	MOVF        R0, 0 
	MOVWF       1363 
;Aoyon USB IO Device.c,269 :: 		writebuff[20] = (char)(adc_rdchn4 >> 8);
	MOVF        R1, 0 
	MOVWF       R2 
	CLRF        R3 
	MOVF        R2, 0 
	MOVWF       1364 
;Aoyon USB IO Device.c,282 :: 		while(!HID_Write(&writebuff,64));        //Send to PC
L_main47:
	MOVLW       _writebuff+0
	MOVWF       FARG_HID_Write_writebuff+0 
	MOVLW       hi_addr(_writebuff+0)
	MOVWF       FARG_HID_Write_writebuff+1 
	MOVLW       64
	MOVWF       FARG_HID_Write_len+0 
	CALL        _HID_Write+0, 0
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main48
	GOTO        L_main47
L_main48:
;Aoyon USB IO Device.c,283 :: 		Delay_ms(5);
	MOVLW       33
	MOVWF       R12, 0
	MOVLW       118
	MOVWF       R13, 0
L_main49:
	DECFSZ      R13, 1, 1
	BRA         L_main49
	DECFSZ      R12, 1, 1
	BRA         L_main49
	NOP
;Aoyon USB IO Device.c,284 :: 		}
L_main20:
;Aoyon USB IO Device.c,285 :: 		}
	GOTO        L_main0
;Aoyon USB IO Device.c,286 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
