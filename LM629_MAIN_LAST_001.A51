;Parametrat e Displayt
LCD		EQU    	 P0          ;LCD is connected on Port 0 of 8051
Busy    	BIT      LCD.7       ;LCD busy flag
E       	BIT      P2.4        ;LCD E
RW      	BIT      P2.3        ;LCD Read/Write(RW)
RS      	BIT      P2.2        ;LCD RS

Display_Status	EQU 	4Fh	     ;used for LCD page display

Vlera2LCD	EQU 	5AH	     ;Used for preparing and making ready for LCD
Qindeshet	EQU 	5BH
Dhjeteshet	EQU 	5CH
Njeshet		EQU 	5DH
				     ;Navigation Buttons
ESC_Button	BIT	P3.7	     ;ESC
Down_Button	BIT	P3.6	     ;DOWN
Select_Button	BIT	P3.5         ;ENTER(SELECT)
UP_Button	BIT	P3.4	     ;UP

OLD_Select_Button BIT	00H
OLD_ESC_Button	  BIT	01H
OLD_UP_Button	  BIT	02H
OLD_Down_Button	  BIT	03H

;**********************************
;Parametrat e MODBUS-it		  *
;**********************************

CRC_ACCUM_LOW	EQU 0DH 	; bank 1 regjistri R5
CRC_ACCUM_HI 	EQU 0EH 	; bank 1 regjistri R6
CRC_MASK_LSB 	EQU 001H 	;CRC-16 polinomi
CRC_MASK_MSB	EQU 0A0H
COIL_ADDR 	EQU 20H
INP_ADDR	EQU 20H
HREG_ADDR 	EQU 20H
IREG_ADDR 	EQU 20H
HREGNUM 	EQU 08H
IREGNUM 	EQU 08H
INPNUM 		EQU 128
COILNUM 	EQU 128		 ;numri total i coilave
t15 		EQU 63817 	 ;65536-1719 , 11bit/9600*1.5=63817
t35 		EQU 61526 	 ;65536-4010 =61526
t20 		EQU 15366 	 ;63245 diferenca negative t15-t35=2291

;*********************************
;**********LM629 PINS*************
LM629 EQU P1    ;D0-D7 i LM629 	;*	LM629 is connected on port P1 of 8051
RD_ EQU P2.0   	;RD i LM629	;*      RD_ of LM629
CS_ EQU P2.1 	;CS i LM629	;*	CS_ of LM629
RST EQU P2.6	;RESET I LM629  ;*	RESET_ of LM629
WR_ EQU P3.1 	;WR i LM629	;*	WR_ of LM629
PS_ EQU P3.0 	;PS i LM629	;*	PS_ of LM629
;*********************************
		
;*******LM629 VARIABLES***********
RDSTAT EQU 29h	                ;* BIT ADDRESSABLE READ STATUS
TR_C EQU RDSTAT.2		;* 
TMP EQU 40h 	     		;* TEMPORARY DATA
D_SMR EQU 41h     		;* DERIVATIVE SAMPLE RATE
ENC_NDARJE EQU 42h		;* ENCODER STRIPS NUMBER
				;* RESOLUTION = ENC_NDARJE * 4;
RESOLUTION_L EQU 43h		;* RESOLUTION HIGH_BYTE 	
RESOLUTION_H EQU 44h		;* RESOLUTION LOW_BYTE
				;*
Kp_H EQU 45h			;* Kp HIGH  PROPORTIONAL GAIN
Kp_L EQU 46h			;* Kp LOW
Ki_H EQU 47h			;* Ki HIGH  INTEGRAL GAIN
Ki_L EQU 48h			;* Ki LOW
Kd_H EQU 49h			;* Kd HIGH  DERIVATIVE GAIN
Kd_L EQU 4Ah			;* Kd LOW
Il_H EQU 4Bh			;* INTEGRAL LIMIT - ANTI WIDUP High byte
Il_L EQU 4Ch			;* INTEGRAL LIMIT - ANTI WIDUP Low byte
				;*
;Setpoint			;* DESIRED POSTION VALUE - SETPOINT
P_DES_L EQU 4Dh			;* HEX LOW BYTE
P_DES_H EQU 4Eh			;* HIGH BYTE
;SP. CALCULATED FOR LM629/LM628	;*
P_d_HB1 EQU 58h			;* SETPOINT REGISTERS AFTER THEY ARE CALCULATED
P_d_HB0 EQU 59h			;* P_FOR_LM629 = P_DES * RESOLUTION
P_d_LB1	EQU 60h			;*
P_d_LB0 EQU 61h			;*
;Vd CALCULATED FOR LM629/LM628	;* 
V_d_HB1 EQU 62h			;* DESIRED SPEED CALCULATED 
V_d_HB0 EQU 63h			;*
V_d_LB1	EQU 64h			;*
V_d_LB0 EQU 65h			;*
				;*
P_r_HB1 EQU 50h			;* ACTUAL REAL POSITION
P_r_HB0 EQU 51h			;*
P_r_LB1 EQU 52h			;*
P_r_LB0 EQU 53h			;*
				;*
V_r_HB1 EQU 54h			;* ACTUAL REAL SPEED
V_r_HB0 EQU 55h			;*
V_r_LB1 EQU 56h			;*
V_r_LB0 EQU 57h			;*
				;*
;informacion per gjendjen 	;*
RDSIG_L EQU 66h			;*
RDSIG_H EQU 67h			;*
				;*
START_STOP	EQU 	5Eh	;*
				;*
;Filter & Trajectory cmds	;*
;LFIL 			;1EH 	;* LOAD FILTER COMMAND
;UDF 			;04H	;* UPDATE FILTER COMMAND
;LTRJ			;1FH	;* LOAD TRAJECTORY COMMAND
;STT 			;01H	;* START MOTOR COMMAND
;RESET_CMD 		;00H	;* RESET COMMAND 
;DEF			;02H	;* DEFINE HOME COMMAND
;SIP 			;03H	;*
;LPEI			;1BH	;*
;LPES 			;1AH	;*
;SBPA 			;20H	;*
;SBPR 			;21H	;*
;MSKI 			;1CH	;*
;RSTI 			;1DH	;* RESET INTERRUPTS
				;*
;Read real values		;*
;RDDP 			;08H	;* Read desired position value
;RDRP 			;0AH  	;* Read real position value
;RDDV			;07H	;* Read desired veolcity value
;RDRV 			;0BH	;* Read real velocity value
;*********************************
	

;*********FILLIMI*****************
;*********************************
	ORG 0000h		;*
	LJMP INICIALIZIMI	;*
				;*
	ORG 0023h		;*
	RETI			;*
				;*
	ORG 0003h		;*
	AJMP EX0_ISR		;*
				;*
	ORG 000Bh		;*
	AJMP T0_ISR		;*
				;*
;*********************************


;***TIMER 0 INTERRUPT ROUTINE*****
T0_ISR: 			;*
	LCALL POZITA_R		;* READ REAL POZITION
	LCALL SHPEJTESIA_R	;* READ REAL SPEED
	LCALL LCD_Display	;* DISPLAY TO LCD
	LCALL POZITA_D		;* READ DISRED POSITION
	LCALL SHPEJTESIA_D	;* READ DESIRED SPEED
	RETI			;*
;*********************************

;**EXTERNAL INTERRUPT S.R*********
EX0_ISR:			;*
	LCALL FILTER_SEL	;* UPDATE FILTER DATA
	LCALL TRAJECTORY_SEL	;* UPDATE TRAJECTORY
RETI				;*
;*********************************


;*****RESETIMI I LM629**********;*
INICIALIZIMI:			;*
	MOV Display_Status, #00	;*
	LCALL LCD_Init		;*
	MOV Kp_H, #00h		;* Kp HIGH 	Kp=5
	MOV Kp_L, #33h		;* Kp LOW
	MOV Ki_H, #00h		;* Ki HIGH 	Ki=5
	MOV Ki_L, #00h		;* Ki LOW
	MOV Kd_H, #00h		;* Kd HIGH	Kd=2
	MOV Kd_L, #02h 		;* Kd HIGH
	
	;CONSTANT SPEED, TO REDUCE CALCULATIONS
	MOV V_d_HB1, #00h	;*
	MOV V_d_HB0, #00h	;*
	MOV V_d_LB1, #00h	;*
	MOV V_d_LB0, #0FFh	;*
	
	MOV RESOLUTION_L, #01Bh	;* 1BDB hex = 7131 per motor 1, dhe 1D18 hex = 7448 ndarje per motorin 2
	MOV RESOLUTION_H, #0DBh	;* 7131 NDARJE per rrotullim (perafersisht me vleren e motorit)
	MOV P_DES_H, #00h	;* 7448 ndarje per brez prej 0-100%
	MOV P_DES_L, #02h	;* 10 RROTULLIME VLERA E DESHIRUAR Pd*R
	LCALL HW_RESET		;* HARDAWARE RESET
	MOV P1, #0FFh		;* P1 -INPUT
				;*
AGAIN:  LCALL READ_ST		;*
	MOV A, RDSTAT		;*
	 			;* A ËSHTË RESETUAR SI DUHET?
	CJNE A, #84H, CHECK1	;* Krahaso te dhenat e lexuara!
	LJMP RES_OK		;* Nese ka ardh 84h ose 0C4h Lm629 eshte resetuar siq duhet!
CHECK1: CJNE A, #0C4H, AGAIN    ;*
				;*
RES_OK:				;*
				;*
	MOV P0, RDSTAT		;*
	MOV A,#80H		;* Rreshti pare i LCD
	LCALL READY		;*
        LCALL COMMAND		;*
        MOV DPTR,#PAGE_INIT1	;*
        LCALL DISP_STRING	;*
        MOV A,#0C0H		;* Rreshti dyte i LCD 
        LCALL READY		;*
        LCALL COMMAND		;*
        MOV DPTR,#PAGE_INIT2	;*
        LCALL DISP_STRING	;*
        			;*
here:	JB P2.7, HERE		;*
        MOV A,#0C0H		;* Rreshti dyte i LCD 
        LCALL READY		;*
        LCALL COMMAND		;*
        MOV DPTR,#LOADING_P	;*
        LCALL DISP_STRING	;*
        			;*
	LCALL RSTI1		;* RSTI
	LCALL DEFINE_HOME	;* DEFINE HOME A~>02
	SJMP MAIN		;*
	 			;*
;*********************************

;*******PROGRAMI KRYESOR**********
MAIN:				;*
	MOV A, PCON		;* ~
	SETB ACC.7		;* ~
	MOV PCON, A		;* ~
	MOV TMOD,#22h		;* ~Timer 1 mode 2
	mov TH1, #-9		;* ~Baud Rate Select
	MOV SCON, #52H		;* ~8-bit,1 stop bit, ren enabled
	MOV TH0,#-200		;* FREKUENCA E LEXIMIT TE TE DHENAVE NGA LM629
	MOV IE,#83h		;* MUNDESO TIMER0 INTERRUPT - x ~> Mundeso interrupt te jashtem 0! IE = 1000 0011
	SETB TR0		;* STARTO NUMERIMIN
	SETB TR1		;* ~8 starto timer 2 PER BAUDRATE
				;*
LOOP:				;*
	MOV SBUF, P_r_HB1	;*
HB1:	JNB TI, HB1		;*
	CLR TI			;*
	SJMP LOOP		;*
RET				;*
;*********************************
;*********************************

;*****************************************
;FUNKSIONET LM629			 *
;*****************************************

;**********Read Status Byte***************
READ_ST:				;*
	CLR PS_				;*
	CLR CS_				;*
	NOP				;*
	CLR RD_				;*
	MOV RDSTAT, LM629		;*
	SETB RD_			;*
	SETB CS_			;*
	SETB PS_			;*
RET					;*
;*****************************************
;***********RSTI**************************
RSTI1:					;*
					;*
       	LCALL BUSY_BIT0			;* RSTI
       	MOV A, #1Dh			;*
       	LCALL WR_CMD_LM629		;*
       	LCALL BUSY_BIT0			;*
       	MOV A, #00h			;*
       	LCALL WR_DT_LM629		;*
       	LCALL WR_DT_LM629		;*
       	MOV P1, #0FFh			;*
	LCALL VONESA1			;*
	CLR PS_				;*
	CLR CS_				;*
	NOP				;*
	CLR RD_				;*
	MOV RDSTAT, LM629		;*
	MOV A, RDSTAT			;*
	SETB RD_			;*
	SETB CS_			;*
	SETB PS_			;*
	CJNE A, #80h, CHECK12		;* Krahaso te dhenat e lexuara!
	LJMP RES_OK			;* Nese ka ardh 84h ose 0C4h Lm629 eshte resetuar siq duhet!
CHECK12: CJNE A, #0C0H, RSTI1		;*
	MOV P0, RDSTAT			;*
	LCALL VONESA1       		;*
					;*
RET					;*
;*****************************************

;*********SHKRUAJ KOMANDË***************** ~ I TESTUAR FUNKSIONON MIRË
					;*
WR_CMD_LM629:				;* 
					;*
	SETB RD_			;*	
	CLR CS_				;*
	NOP				;*
	CLR PS_				;*
	NOP				;*
	CLR WR_				;*
	NOP				;*
	NOP				;*
	MOV LM629, A			;*
	SETB WR_			;*
RET					;*
					;*
;*****************************************
;*********SHKRUAJ TË DHËNA**************** ~ I TESTUAR FUNKSIONON MIRË
					;*
WR_DT_LM629:				;*
	SETB RD_			;*
	CLR CS_				;*
	NOP				;*
	SETB PS_			;*
	NOP				;*
	CLR WR_				;*
	MOV LM629, A			;*
	NOP				;*
	NOP 				;*
	SETB WR_			;*
	NOP				;*
RET					;*
					;*
;*****************************************
;************LEXO TË DHËNA****************
					;*
RD_DT_LM629:				;*CS=L PS=H (RD=L ~> RD =H)
	CLR CS_				;*
	SETB WR_			;*
	SETB PS_			;*
	NOP				;*
	CLR RD_				;*
	NOP				;*
	NOP				;*
	NOP				;*
	MOV TMP, LM629			;*
	NOP 				;*
	SETB RD_			;*
RET					;*
					;*
;*****************************************
;********CHECK STATUS BUSY BIT************ 
					;*
BUSY_BIT0: 				;*
	CLR PS_				;*
	CLR CS_				;*
	NOP				;*
	CLR RD_				;*
	MOV RDSTAT, LM629		;*
	SETB RD_			;*
	JB RDSTAT.0, BUSY_BIT0		;*
	RET				;*
					;*
;*****************************************
;***********DEFINE HOME*******************
DEFINE_HOME:				;*
	LCALL BUSY_BIT0			;*DEFINE HOME
       	MOV A, #02h			;*
       	LCALL WR_CMD_LM629		;*
	RET				;*
;*****************************************
;***********HARDWARE RESET****************
HW_RESET:				;*
	CLR RST				;*
	LCALL VONESA1			;*
	SETB RST			;*
	RET				;*
;*****************************************	
;*******FILTER CONFIGURATION**************
					;*
FILTER_SEL:				;*
					;*
	LCALL BUSY_BIT0			;*
	MOV A, #01Eh			;* LFIL %% 
	LCALL WR_CMD_LM629		;* 
					;*
	;Te dhenat			;*
	LCALL BUSY_BIT0			;*
	MOV D_SMR, #00h			;* Td = D_SMR*(2048/CLK) = 2048/6Mhz = 341us - First Byte
	MOV A, D_SMR			;* DERIVATIVE SAMPLE RATE 0-FF
	LCALL WR_DT_LM629		;* 1
	MOV A, #0Eh			;* 0 0 0 0 Kp Ki Kd Il- Second Byte 0000 111 0 - VENDOS KP KI KD
	LCALL WR_DT_LM629		;* 2
					;*
	;Kp				;*
	LCALL BUSY_BIT0			;*
	;MOV A, #00h
	MOV A, Kp_H			;* MSB 0-255
	LCALL WR_DT_LM629		;* 1
	;MOV A, #03h
	MOV A, Kp_L			;* LSB 0-255
	LCALL WR_DT_LM629		;* 2
	;Ki				;*
	LCALL BUSY_BIT0			;*
	MOV A, Ki_H			;* MSB 0-255
	LCALL WR_DT_LM629		;* 1
	MOV A, Ki_L			;* LSB 0-255
	LCALL WR_DT_LM629		;* 2
	;Kd				;*
	LCALL BUSY_BIT0			;*
	MOV A, Kd_H			;* MSB 0-255
	LCALL WR_DT_LM629		;* 1
	MOV A, Kd_L			;* LSB 0-255
	LCALL WR_DT_LM629		;* 2
					;* 
	;UDF				;* Update Data Filter
	LCALL BUSY_BIT0			;*
	MOV A, #04h			;* UDF
	LCALL WR_CMD_LM629		;* EKZEKUTO
					;* U vendos Kp në LM629	
	NOP				;*
	RET				;*
;*****************************************

;******TRAJECTORY SELECT******************
TRAJECTORY_SEL:				;*
					;*
	LCALL BUSY_BIT0			;*
	MOV A, #01Fh			;* LTRJ %% 
	LCALL WR_CMD_LM629		;* 
					;*
	;DERGO Ad,Vd & Pd		;*
	LCALL BUSY_BIT0			;*
	MOV A, #00h			;* 1 NDALO MOTORIN SMOOTHLEY 04
	LCALL WR_DT_LM629		;* ~
	MOV A, #02Ah			;* 2 ACC WILL BE LOADED, VELOCITTY WILL BE LOADED & POSITION WILL BE LOADED ~ DESIRED
	LCALL WR_DT_LM629		;*
	LCALL BUSY_BIT0			;*
	 				;*
					;*
	;NXITIMI			;*
	LCALL DEFINE_NXITIMI		;*
					;*
	;SHPEJTESIA			;*
	LCALL DEFINE_SHPEJTESIA	 	;*
	LCALL BUSY_BIT0			;*
	;POZITA				;*
	LCALL DEFINE_POZTIA		;*
					;*
	;STARTO MOTORIN			;*
	LCALL START_MOTOR		;*
					;*
	RET				;*
;*****************************************
;*********************************
DEFINE_POZTIA:			;*
				;*
	MOV R4,RESOLUTION_H	;* P=R*Pd 
	MOV R5,RESOLUTION_L	;*
	MOV R6,P_DES_H		;*
	MOV R7,P_DES_L		;*
	LCALL MUL16_16		;*
	;DEC R1			;*
	;INC R3			;*
				;*
	MOV P_d_HB1, R0		;*
	MOV P_d_HB0, R1		;*
	MOV P_d_LB1, R2		;*
	MOV P_d_LB0, R3		;*		
				;*
	MOV A, R0		;* 
	;MOV A, #00h		;*
	LCALL WR_DT_LM629	;* ~MSB1 R0
	MOV A, R1		;*
	;MOV A, #00h		;*
	LCALL WR_DT_LM629	;* ~MSB0 R1
	LCALL BUSY_BIT0		;*
	MOV A, R2		;*  
	;MOV A, #1Bh		;*
	LCALL WR_DT_LM629	;* ~LSB1 R2
	MOV A, R3		;* 
	;MOV A, #0DBh		;*
	LCALL WR_DT_LM629	;* ~LSB0 R3
	LCALL BUSY_BIT0		;*
				;*
	RET			;*
;*********************************
;*********************************
DEFINE_SHPEJTESIA:		;*
				;*
;*V=R*341*[10^(-4)]*[Vd]*[2^16]	;*
;*Vhex				;*
				;*
	MOV A, V_d_HB1		;* 
	;mov a, #00h
	LCALL WR_DT_LM629	;* ~MSB1 00h 
	MOV A, V_d_HB0		;*
	;mov a, #06h
	LCALL WR_DT_LM629	;* ~MSB0 00h
	LCALL BUSY_BIT0		;*
	MOV A, V_d_LB1		;*
	;mov a, #0D1h
	LCALL WR_DT_LM629	;* ~LSB1 00h
	MOV A, V_d_LB0		;* 
	;mov a, #0ECH
	LCALL WR_DT_LM629	;* ~LSB0 ECh 
	LCALL BUSY_BIT0		;*
RET				;*
				;*
;*********************************
;*********************************
DEFINE_NXITIMI:			;*
;a=R*(341)^2*10^(-4)*Ad*2^16	;*
;aHEX				;*
    				;*S
	MOV A, #00h		;* ~MSB1 R0
	LCALL WR_DT_LM629	;* 
	MOV A, #00h		;* ~MSB0 R1
	LCALL WR_DT_LM629	;* 
	LCALL BUSY_BIT0		;*
	MOV A, #00h		;* ~LSB1 R2
	LCALL WR_DT_LM629	;* 
	MOV A, #0Fh		;* ~LSB0 R3 ~> 00 00 00 0F ~>1 REV/SEC^2
	LCALL WR_DT_LM629	;* 
	LCALL BUSY_BIT0		;*
RET				;*
;*********************************

;*********************************
START_MOTOR:			;*
	LCALL BUSY_BIT0		;*
	MOV A, #01H		;* START MOTOR
	LCALL WR_CMD_LM629	;*
	LCALL BUSY_BIT0		;*
	SETB START_STOP		;*
RET				;*
;*********************************
;*********************************
RDSIGNALS:			;*
	MOV A, #0Ch		;* 0C - READ SIGNALS
	LCALL WR_CMD_LM629	;*
	LCALL BUSY_BIT0		;*
	MOV P1, #0FFh   	;*
	LCALL RD_DT_LM629	;*
	MOV RDSIG_H, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV RDSIG_L, TMP	;*
	LCALL BUSY_BIT0		;*
				;*
				;*
RET				;*
;*********************************
;*********************************
STOP_MOTOR:			;*
				;*
	MOV A, #01Fh		;* LTRJ %% 
	ACALL WR_CMD_LM629	;* 
	LCALL BUSY_BIT0		;*
	MOV A, #01h		;* STOP
	LCALL WR_DT_LM629	;*
	MOV A, #00h		;* STOP
	LCALL WR_DT_LM629	;*
	LCALL BUSY_BIT0		;*
	MOV A, #01H		;* START MOTOR ME VLERA 0
	LCALL WR_CMD_LM629	;*
				;* INDIKATORI SE MOTORI ESHTE NDALUR
	RET			;*
;*********************************
;*********************************
POZITA_R:			;*
	;POZITA REALE		;* 
				;* 08 DESIRED, 0A REAL P_REAE=R*P_READ
	MOV A, #0Ah		;* P_READ ~> P_r_hb1,P_r_hb0,P_r_lb1,P_r_lb0
	LCALL WR_CMD_LM629	;*
	LCALL BUSY_BIT0		;*
	MOV P1, #0FFh   	;*
	LCALL RD_DT_LM629	;*
	MOV P_r_HB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV P_r_HB0, TMP	;*
	LCALL BUSY_BIT0		;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV P_r_LB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV P_r_LB0, TMP	;*
	MOV P1, #0FFh		;*
				;*
				;*
RET				;*
;*********************************
;*********************************
POZITA_D:			;*
	;POZITA E DESHIRUAR	;* 
				;* 08 DESIRED, 0A REAL
	MOV A, #08h		;*
	LCALL WR_CMD_LM629	;*
	LCALL BUSY_BIT0		;*
	MOV P1, #0FFh   	;*
	LCALL RD_DT_LM629	;*
	MOV P_d_HB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV P_d_HB0, TMP	;*
	LCALL BUSY_BIT0		;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV P_d_LB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV P_d_LB0, TMP	;*
	MOV P1, #0FFh		;*
RET				;*
;*********************************
;*********************************
SHPEJTESIA_R:			;*
				;*
	MOV A, #0Bh		;* 07 DESIRED - 0B REAL
	LCALL WR_CMD_LM629	;*	
	LCALL BUSY_BIT0		;*
				;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_r_HB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_r_HB0, TMP	;*
	LCALL BUSY_BIT0		;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_r_LB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_r_LB0, TMP	;*
	MOV P1, #0FFh		;*
RET				;*
;*********************************
;*********************************
SHPEJTESIA_D:			;*
				;*
	MOV A, #0Dh		;* 07 DESIRED - 0B REAL
	LCALL WR_CMD_LM629	;*	
	LCALL BUSY_BIT0		;*
				;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_d_HB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_d_HB0, TMP	;*
	LCALL BUSY_BIT0		;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_d_LB1, TMP	;*
	MOV P1, #0FFh		;*
	LCALL RD_DT_LM629	;*
	MOV V_d_LB0, TMP	;*
	MOV P1, #0FFh		;*
RET				;*
;*********************************


;****************************************************************************
;			Shumzimi i dy numrave 16bit
;****************************************************************************
MUL16_16: 
 ;Multiply R5 by R7
 MOV A,R5 ;Move the R5 into the Accumulator
 MOV B,R7 ;Move R7 into B
 MUL AB   ;Multiply the two values
 MOV R2,B ;Move B (the high-byte) into R2
 MOV R3,A ;Move A (the low-byte) into R3

 ;Multiply R5 by R6
 MOV A,R5    ;Move R5 back into the Accumulator
 MOV B,R6    ;Move R6 into B
 MUL AB      ;Multiply the two values
 ADD A,R2    ;Add the low-byte into the value already in R2
 MOV R2,A    ;Move the resulting value back into R2
 MOV A,B     ;Move the high-byte into the accumulator
 ADDC A,#00h ;Add zero (plus the carry, if any)
 MOV R1,A    ;Move the resulting answer into R1
 MOV A,#00h  ;Load the accumulator with  zero
 ADDC A,#00h ;Add zero (plus the carry, if any)
 MOV R0,A    ;Move the resulting answer to R0.

 ;Multiply R4 by R7
 MOV A,R4   ;Move R4 into the Accumulator
 MOV B,R7   ;Move R7 into B
 MUL AB     ;Multiply the two values
 ADD A,R2   ;Add the low-byte into the value already in R2
 MOV R2,A   ;Move the resulting value back into R2
 MOV A,B    ;Move the high-byte into the accumulator
 ADDC A,R1  ;Add the current value of R1 (plus any carry)
 MOV R1,A   ;Move the resulting answer into R1.
 MOV A,#00h ;Load the accumulator with zero
 ADDC A,R0  ;Add the current value of R0 (plus any carry)
 MOV R0,A   ;Move the resulting answer to R1.

 ;Multiply R4 by R6
 MOV A,R4  ;Move R4 back into the Accumulator
 MOV B,R6  ;Move R6 into B
 MUL AB    ;Multiply the two values
 ADD A,R1  ;Add the low-byte into the value already in R1
 MOV R1,A  ;Move the resulting value back into R1
 MOV A,B   ;Move the high-byte into the accumulator
 ADDC A,R0 ;Add it to the value already in R0 (plus any carry)
 MOV R0,A  ;Move the resulting answer back to R0

 ;Return - answer is now in R0, R1, R2, and R3
 RET
;**************************************************************************** 

;*********************************
;FUNKSIONET E LCD-se		;*
;*********************************		



;**********VONESA*************************
VONESA1:				;*
	MOV r5, #10h			;*
V3:	MOV R7, #0FAh			;*
V2:	MOV R6, #0FAh			;*
V1:					;*
	DJNZ R6, V1			;*
	DJNZ R7, V2			;*
	DJNZ R5, V3			;*
	RET				;*
;*****************************************

;*********************************************************;*********************************************************
;					PJESA E INTERFACE-IT ME LCD						   ;*
;*********************************************************;*********************************************************
LCD_Display:
;show lcd display
	MOV A,Display_Status
	RL A
	RL A
	MOV DPTR , #TAB_Status
	JMP @A+DPTR

TAB_Status:
	LJMP PAGE_00				;00
	NOP
	LJMP PAGE_01				;01
	NOP
	LJMP PAGE_02				;02
	NOP
	LJMP PAGE_03				;03
	NOP
	LJMP PAGE_04				;04
	NOP
	LJMP PAGE_05				;05
	NOP
	LJMP PAGE_06				;06
	NOP
	LJMP PAGE_07				;07
	NOP
	LJMP PAGE_08				;08
	NOP
	LJMP PAGE_09				;09
	NOP
	LJMP PAGE_10				;10
	NOP
	LJMP PAGE_11				;11
	NOP
	LJMP PAGE_12				;12
	NOP
	LJMP PAGE_13				;13
	NOP
	LJMP PAGE_14				;14
	NOP
	LJMP PAGE_15				;15
	NOP
	LJMP PAGE_16				;16
	NOP
	LJMP PAGE_17				;17
;----------------------------------------------------------------------------------------
PAGE_00:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_00_L1
        	LCALL    DISP_STRING
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_00_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_01:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_01_L1
        	LCALL    DISP_STRING
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_01_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_02:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_02_L1
        	LCALL    DISP_STRING
        	;KETU SHTOHET PJESA PER Kp_H
        	
		MOV 	 Vlera2LCD, Kp_H
		LCALL 	 Reg_2_LCD
		LCALL    READY
        	
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_02_L2
        	LCALL    DISP_STRING
        	
LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_03:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_03_L1
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, Kp_L	;PJESA PER Kp_L
		LCALL 	 Reg_2_LCD
		LCALL 	 READY
		
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_03_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_04:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_04_L1
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, Ki_H	;PJESA PER KI_H
		LCALL 	 Reg_2_LCD
		LCALL	 READY
        	
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_04_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_05:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_05_L1
        	LCALL    DISP_STRING
        	
          	MOV 	 Vlera2LCD, Ki_L	;PJESA PER Ki_L
		LCALL 	 Reg_2_LCD
		LCALL	 READY
		
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_05_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_06:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_06_L1
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, Kd_H	;PJESA PER Kd_H
		LCALL 	 Reg_2_LCD
		LCALL	 READY  
  
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_06_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_07:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_07_L1
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, Kd_L	;PJESA PER Kd_L
		LCALL 	 Reg_2_LCD
		LCALL	 READY  
  
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_07_L2
        	LCALL    DISP_STRING      	

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_08:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_08_L1
        	LCALL    DISP_STRING

        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_08_L2
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, RDSTAT	; STATUSI 
		LCALL 	 Reg_2_LCD
		LCALL	 READY  
  

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_09:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_09_L1
        	LCALL    DISP_STRING

        	MOV 	 Vlera2LCD, P_DES_H	;PJESA PER P_DES_H
		LCALL 	 Reg_2_LCD
		LCALL	 READY  
           	
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_09_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_10:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_10_L1
        	LCALL    DISP_STRING
        	
		MOV 	 Vlera2LCD, P_DES_L	;;PJESA PER P_DES_L
		LCALL 	 Reg_2_LCD
		LCALL	 READY  
		
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_10_L2

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_11:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_11_L1	;START/STOP PAGE
        	LCALL    DISP_STRING
        	
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_11_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_12:
		
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_12_L1
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, P_r_HB1	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, P_r_HB0	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, P_r_LB1	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, P_r_LB0	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
        	
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_12_L2
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, P_d_HB1	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, P_d_HB0	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, P_d_LB1	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, P_d_LB0	;;PJESA PER P_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 

		
LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_13:       ;FAQJA E SHPEJTESISE DUHET FUNKSIONALIZUAR FUNKSIONET QE E SHTYPIN SHPEJTESINE MOMENTALE REALE DHE TE DESHIRUAR
		MOV      A,#80H			;Rreshti pare i LCD
		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_13_L1
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, V_r_HB1	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, V_r_HB0	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, V_r_LB1	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, V_r_LB0	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 

		
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_13_L2
        	LCALL    DISP_STRING
        	
        	MOV 	 Vlera2LCD, V_d_HB1	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, V_d_HB0	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, V_d_LB1	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 
		MOV 	 Vlera2LCD, V_d_LB0	;;PJESA PER V_R_HB1
		LCALL 	 Reg_2_LCD
		LCALL	 READY 


LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_14:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_14_L1
        	LCALL    DISP_STRING
        	MOV      A,#0C0H		;Rreshti dyte i LCD 
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_14_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_15:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_15_L1
        	LCALL    DISP_STRING
        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_15_L2
        	LCALL    DISP_STRING

LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_16:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_16_L1
        	LCALL    DISP_STRING

        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_16_L2
        	LCALL    DISP_STRING

        	
LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------
PAGE_17:
		MOV      A,#80H			;Rreshti pare i LCD

		LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_17_L1
        	LCALL    DISP_STRING

        	MOV      A,#0C0H		;Rreshti dyte i LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      DPTR,#PAGE_17_L2
        	LCALL    DISP_STRING

        	
LJMP END_SHOW_Display
;----------------------------------------------------------------------------------------

END_SHOW_Display:
;refresh keys
	JB Select_Button,NO_Select1
		JNB OLD_Select_Button,NO_Select2
		    CLR OLD_Select_Button
	        Lcall Select_Button_Selected   ; Eshte shtypur Select
	            SJMP NO_Select2
		NO_Select1:
			SETB OLD_Select_Button
		NO_SELECT2:
	JB ESC_Button,NO_ESC1
		JNB OLD_ESC_Button,NO_ESC2
		    CLR OLD_ESC_Button
	        Lcall ESC_Button_Selected	; Eshte shtypur ESC
	            SJMP NO_ESC2
		NO_ESC1:
			SETB OLD_ESC_Button
		NO_ESC2:	
	JB UP_Button,NO_UP1
		JNB OLD_UP_Button,NO_UP2
		    CLR OLD_UP_Button
	        Lcall UP_Button_Selected	; Eshte shtypur UP
	            SJMP NO_UP2
		NO_UP1:
			SETB OLD_UP_Button
		NO_UP2:
	JB Down_Button,NO_Down1
		JNB OLD_Down_Button,NO_Down2
		    CLR OLD_Down_Button
	        Lcall Down_Button_Selected	; Eshte shtypur Down
	            SJMP NO_Down2
		NO_Down1:
			SETB OLD_Down_Button
		NO_Down2:

		RET

Select_Button_Selected:
	MOV A,Display_status
	RL A
	RL A
	MOV DPTR , #Select_Button_Status
	JMP @A+DPTR

Select_Button_Status:
	LJMP Select_on_PAGE_00				;00
	NOP
	LJMP Select_on_PAGE_01				;01
	NOP
	LJMP Select_on_PAGE_02				;02
	NOP
	LJMP Select_on_PAGE_03				;03
	NOP
	LJMP Select_on_PAGE_04				;04
	NOP
	LJMP Select_on_PAGE_05				;05
	NOP
	LJMP Select_on_PAGE_06				;06
	NOP
	LJMP Select_on_PAGE_07				;07
	NOP
	LJMP Select_on_PAGE_08				;08
	NOP
	LJMP Select_on_PAGE_09				;09
	NOP
	LJMP Select_on_PAGE_10				;10
	NOP
	LJMP Select_on_PAGE_11				;11
	NOP
	LJMP Select_on_PAGE_12				;12
	NOP
	LJMP Select_on_PAGE_13				;13
	NOP
	LJMP Select_on_PAGE_14				;14
	NOP
	LJMP Select_on_PAGE_15				;15
	NOP
	LJMP Select_on_PAGE_16				;16
	NOP
	LJMP Select_on_PAGE_17				;17


Select_on_PAGE_00:
	
ret
Select_on_PAGE_01:
	MOV Display_Status,#02
	;LCALL FILTER_SEL		; THIRRE FUNKSIONIN PER TE UPDATE FILTRIN
ret
Select_on_PAGE_02:
	MOV Display_Status,#03
	;LCALL FILTER_SEL
ret
Select_on_PAGE_03:
	MOV Display_Status,#04
	;LCALL FILTER_SEL
ret
Select_on_PAGE_04:
	MOV Display_Status,#05
	;LCALL FILTER_SEL
ret
Select_on_PAGE_05:
	MOV Display_Status,#06
	;LCALL FILTER_SEL
ret
Select_on_PAGE_06:
	MOV Display_Status,#07
	;LCALL FILTER_SEL
ret
Select_on_PAGE_07:
	MOV Display_Status,#08
	LCALL FILTER_SEL			;LOAD FILTER DATA LDF ON ENTER
ret
Select_on_PAGE_08:
	MOV Display_Status,#09
ret
Select_on_PAGE_09:
	MOV Display_Status,#10
	;LCALL TRAJECTORY_SEL
ret
Select_on_PAGE_10:
	MOV Display_Status,#11
	;LCALL TRAJECTORY_SEL			;PASI TE VENDOSEN VLERAT E POZITES SE DESHIRUAR ~ VENDOSET TRAJEKTORJA
ret
Select_on_PAGE_11:
     	
     	LCALL TRAJECTORY_SEL
        LCALL START_MOTOR
	MOV Display_Status,#14 ; ON
ret
Select_on_PAGE_12:
	
ret
Select_on_PAGE_13:
	
ret
Select_on_PAGE_14:

	LCALL STOP_MOTOR
	MOV Display_Status,#15
ret
Select_on_PAGE_15:

	MOV Display_Status,#11
ret
Select_on_PAGE_16:
	MOV Display_Status,#17
ret
Select_on_PAGE_17:
	LCALL DEFINE_HOME
	MOV Display_Status,#00
ret

;----------------------------------------------------------------------------------------
ESC_Button_Selected:
	MOV A,Display_status
	RL A
	RL A
	MOV DPTR , #ESC_Button_Status
	JMP @A+DPTR

ESC_Button_Status:
	LJMP ESC_on_PAGE_00				;00
	NOP
	LJMP ESC_on_PAGE_01				;01
	NOP
	LJMP ESC_on_PAGE_02				;02
	NOP
	LJMP ESC_on_PAGE_03				;03
	NOP
	LJMP ESC_on_PAGE_04				;04
	NOP
	LJMP ESC_on_PAGE_05				;05
	NOP
	LJMP ESC_on_PAGE_06				;06
	NOP
	LJMP ESC_on_PAGE_07				;07
	NOP
	LJMP ESC_on_PAGE_08				;08
	NOP
	LJMP ESC_on_PAGE_09				;09
	NOP
	LJMP ESC_on_PAGE_10				;10
	NOP
	LJMP ESC_on_PAGE_11				;11
	NOP
	LJMP ESC_on_PAGE_12				;12
	NOP
	LJMP ESC_on_PAGE_13				;13
	NOP
	LJMP ESC_on_PAGE_14				;14
	NOP
	LJMP ESC_on_PAGE_15				;15
	NOP
	LJMP ESC_on_PAGE_16				;16
	NOP
	LJMP ESC_on_PAGE_17				;17


ESC_on_PAGE_00:
					;nese jemi ne faqen 00 dhe shtypim esc, do nothing
ret
ESC_on_PAGE_01:
	MOV Display_Status,#00		
ret
ESC_on_PAGE_02:
	MOV Display_Status,#01			;nese jemi ne njeren nga faqet prej 2-7 shko ne LDF-01 page
ret
ESC_on_PAGE_03:
	MOV Display_Status,#01
ret
ESC_on_PAGE_04:
	MOV Display_Status,#01
ret
ESC_on_PAGE_05:
	MOV Display_Status,#01
ret
ESC_on_PAGE_06:
	MOV Display_Status,#01
ret
ESC_on_PAGE_07:
	MOV Display_Status,#01
ret
ESC_on_PAGE_08:
	MOV Display_Status,#00
ret
ESC_on_PAGE_09:
	MOV Display_Status,#08
ret
ESC_on_PAGE_10:
	MOV Display_Status,#08
ret
ESC_on_PAGE_11:
	MOV Display_Status,#00
ret
ESC_on_PAGE_12:
	MOV Display_Status,#00
ret
ESC_on_PAGE_13:
	MOV Display_Status,#00
ret
ESC_on_PAGE_14:
	MOV Display_Status,#00
ret
ESC_on_PAGE_15:
	MOV Display_Status,#00
ret
ESC_on_PAGE_16:
	MOV Display_Status,#00
ret
ESC_on_PAGE_17:
	MOV Display_Status,#00
ret

;----------------------------------------------------------------------------------------
UP_Button_Selected:
	MOV A,Display_status
	RL A
	RL A
	MOV DPTR , #UP_Button_Status
	JMP @A+DPTR

UP_Button_Status:
	LJMP UP_on_PAGE_00				;00
	NOP
	LJMP UP_on_PAGE_01				;01
	NOP
	LJMP UP_on_PAGE_02				;02
	NOP
	LJMP UP_on_PAGE_03				;03
	NOP
	LJMP UP_on_PAGE_04				;04
	NOP
	LJMP UP_on_PAGE_05				;05
	NOP
	LJMP UP_on_PAGE_06				;06
	NOP
	LJMP UP_on_PAGE_07				;07
	NOP
	LJMP UP_on_PAGE_08				;08
	NOP
	LJMP UP_on_PAGE_09				;09
	NOP
	LJMP UP_on_PAGE_10				;10
	NOP
	LJMP UP_on_PAGE_11				;11
	NOP
	LJMP UP_on_PAGE_12				;12
	NOP
	LJMP UP_on_PAGE_13				;13
	NOP
	LJMP UP_on_PAGE_14				;14
	NOP
	LJMP UP_on_PAGE_15				;15
	NOP
	LJMP UP_on_PAGE_16				;16
	NOP
	LJMP UP_on_PAGE_17				;17
	
UP_on_PAGE_00:
	MOV Display_Status,#17				;-nese kemi UP ne faqen 00(info) shkojme ne VELOCITY_PAGE 13
ret
UP_on_PAGE_01:						;-nese kemi UP ne faqen 01(LDF) shkojme ne 00(info_page)
	MOV Display_Status,#00				;
ret
UP_on_PAGE_02:						;-nese kemi UP ne faqen 02(LTRJ) shkojme ne LTRJ_page
	INC Kp_H
ret
UP_on_PAGE_03:
	INC Kp_L
ret
UP_on_PAGE_04:
	INC Ki_H
ret
UP_on_PAGE_05:
	INC Ki_L
ret
UP_on_PAGE_06:
	INC Kd_H
ret
UP_on_PAGE_07:
	INC Kd_L
ret
UP_on_PAGE_08:
	MOV Display_Status,#01
ret
UP_on_PAGE_09:
	INC P_DES_H
ret
UP_on_PAGE_10:
	INC P_DES_L
ret
UP_on_PAGE_11:
	MOV Display_Status,#08			;GO TO LOAD TRAJECTORY PAGE -LTRJ
ret
UP_on_PAGE_12:
	MOV Display_Status,#11			; GO TO START/STOP PAGE -STT
ret
UP_on_PAGE_13:
	MOV Display_Status,#12
ret
UP_on_PAGE_14:
	MOV Display_Status,#08
ret
UP_on_PAGE_15:
	MOV Display_Status,#08
ret
UP_on_PAGE_16:
	MOV Display_Status,#13
ret
UP_on_PAGE_17:
	MOV Display_Status,#16
ret

;----------------------------------------------------------------------------------------
Down_Button_Selected:

	MOV A,Display_status
	RL A
	RL A
	MOV DPTR , #Down_Button_Status
	JMP @A+DPTR

Down_Button_Status:
	LJMP Down_on_PAGE_00				;00
	NOP
	LJMP Down_on_PAGE_01				;01
	NOP
	LJMP Down_on_PAGE_02				;02
	NOP
	LJMP Down_on_PAGE_03				;03
	NOP
	LJMP Down_on_PAGE_04				;04
	NOP
	LJMP Down_on_PAGE_05				;05
	NOP
	LJMP Down_on_PAGE_06				;06
	NOP
	LJMP Down_on_PAGE_07				;07
	NOP
	LJMP Down_on_PAGE_08				;08
	NOP
	LJMP Down_on_PAGE_09				;09
	NOP
	LJMP Down_on_PAGE_10				;10
	NOP
	LJMP Down_on_PAGE_11				;11
	NOP
	LJMP Down_on_PAGE_12				;12
	NOP
	LJMP Down_on_PAGE_13				;13
	NOP
	LJMP Down_on_PAGE_14				;14
	NOP
	LJMP Down_on_PAGE_15				;15
	NOP
	LJMP Down_on_PAGE_16				;16
	NOP
	LJMP Down_on_PAGE_17				;17

Down_on_PAGE_00:
	MOV Display_Status,#01		;GO TO 01 - LDF
ret
Down_on_PAGE_01:
	MOV Display_Status,#08		; nese jemi ne faqen 01-LDF shko ne 08 -LTRJ
ret
Down_on_PAGE_02:			;decrement kp_h, etj.
	DEC Kp_H
ret
Down_on_PAGE_03:
	DEC Kp_L
ret
Down_on_PAGE_04:
	DEC Ki_H
ret
Down_on_PAGE_05:
	DEC Ki_L
ret
Down_on_PAGE_06:
	DEC Kd_H
ret
Down_on_PAGE_07:
	DEC Kd_L
ret
Down_on_PAGE_08:
	MOV Display_Status,#11		;go to start/STOP page 11
ret
Down_on_PAGE_09:
	DEC P_des_H
ret
Down_on_PAGE_10:
	DEC P_des_L
ret
Down_on_PAGE_11:
	MOV Display_Status,#12	;go to position page 12
ret
Down_on_PAGE_12:
	MOV Display_Status,#13	;go to velocity page 13
ret
Down_on_PAGE_13:
	MOV Display_Status,#16  ;go to info page 00
ret
Down_on_PAGE_14:
	MOV Display_Status,#12
ret
Down_on_PAGE_15:
	MOV Display_Status,#12
ret
Down_on_PAGE_16:
	MOV Display_Status,#17
ret
Down_on_PAGE_17:
	MOV Display_Status,#00
ret
;--------------------------------------------------------------
REG_2_LCD:
	MOV A , Vlera2LCD

	MOV B , #100
	DIV AB
	MOV R7 , A
	MOV Qindeshet , A

	MOV A , R7
	MOV B , #100
	MUL AB

	MOV R7 , A
	MOV A , Vlera2LCD
	SUBB A , R7

	MOV B , #10
	DIV AB
	MOV B , A
	MOV Dhjeteshet , A

	MOV A , Vlera2LCD
	MOV B , #100
	DIV AB
	MOV B , #100
	MUL AB
	MOV R7 , A
	MOV A , Vlera2LCD
	SUBB A , R7
	MOV R6 , A

	MOV B , #10
	DIV AB
	MOV B , #10
	MUL AB
	MOv R7 , A
	MOV A , R6
	subb A , R7
	MOV B , #1
	DIV AB
	MOV Njeshet , A

	MOV A,Qindeshet
	LCALL Number_2_ASCII_LCD

	MOV A,Dhjeteshet
	LCALL Number_2_ASCII_LCD

	MOV A,Njeshet
	LCALL Number_2_ASCII_LCD
RET
Number_2_ASCII_LCD:
				rl A
				rl A
				mov dptr , #TabelaASCII
				jmp @A+dptr
			TabelaASCII:
					ljmp NR0
					nop
					ljmp NR1
					nop
					ljmp NR2
					nop
					ljmp NR3
					nop
					ljmp NR4
					nop
					ljmp NR5
					nop
					ljmp NR6
					nop
					ljmp NR7
					nop
					ljmp NR8
					nop
					ljmp NR9
				NR0:	LCALL    READY
					mov A,#'0'
					LCALL    DATA_DISPLAY
					ret
				NR1:	LCALL    READY
					mov A,#'1'
					LCALL    DATA_DISPLAY
					ret
				NR2:	LCALL    READY
					mov A,#'2'
					LCALL    DATA_DISPLAY
					ret
				NR3:	LCALL    READY
					mov A,#'3'
					LCALL    DATA_DISPLAY
					ret
				NR4:	LCALL    READY
					mov A,#'4'
					LCALL    DATA_DISPLAY
					ret
				NR5:	LCALL    READY
					mov A,#'5'
					LCALL    DATA_DISPLAY
					ret
				NR6:	LCALL    READY
					mov A,#'6'
					LCALL    DATA_DISPLAY
					ret
				NR7:	LCALL    READY
					mov A,#'7'
					LCALL    DATA_DISPLAY
					ret
				NR8:	LCALL    READY
					mov A,#'8'
					LCALL    DATA_DISPLAY
					ret
				NR9:	LCALL    READY
					mov A,#'9'
					LCALL    DATA_DISPLAY
					ret

;------------------------------------------------------------------------------------------
;				LCD SUBPROGRAMM
;------------------------------------------------------------------------------------------
LCD_Init:
        	MOV      A,#38H                ;2 linja 5x7
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      A,#0CH                ;ndezja e kursorit ne LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      A,#01H                ;fshirja e LCD
        	LCALL    READY
        	LCALL    COMMAND
        	MOV      A,#06H                ;nderrimi i kursorit ne te djathte
        	LCALL    READY
        	LCALL    COMMAND
ret
;------------------------------------------------------------------------------------------
READY:
        	SETB     BUSY                  ;make P0.7 input port
        	MOV 	LCD,#0FFH
        	CLR      RS                    ;RS=0 access command reg
        	SETB     RW                    ;R/W=1 read command reg
BACK:						;read command reg and check busy flag
        	CLR      E                     ;E=1 for H-to-L pulse
        	SETB     E                     ;E=0 H-to-l pulse
        	JB       BUSY,BACK             ;stay until busy flag=0
        	RET
;------------------------------------------------------------------------------------------
COMMAND:
        	MOV      LCD,A                 ;issue command code
        	CLR      RS                    ;RS=0 for command
        	CLR      RW                    ;R/W=0 to write to LCD|
        	SETB     E                     ;E=1 for H-to-L pulse
        	CLR      E                     ;E=0 ,latch in
        	RET
;------------------------------------------------------------------------------------------
DATA_DISPLAY:
        	CLR 	 E
        	MOV      LCD,A                 ;issue data
        	SETB     RS                    ;RS=1 for data
        	CLR      RW                    ;R/W=0 to write to LCD
        	SETB     E                     ;E=1 for H-to-L pulse
        	CLR      E                     ;E=0 ,latch in
        	RET
;------------------------------------------------------------------------------------------
DISP_STRING:
		CLR   A	                ;clear Accumulator for any previous data
		MOVC  A,@a+dptr         ;load the first character in accumulator
		JZ    exit		;go to exit if zero
	        LCALL    READY		;send first char
	        LCALL    DATA_DISPLAY
		INC   dptr              ;increment data pointer
		SJMP  DISP_STRING	;jump back to send the next character
exit:
         	RET                     ;End of routine
;------------------------------------------------------------------------------------------
;					LCD DB
;------------------------------------------------------------------------------------------
PAGE_00_L1:	DB   '    F I E K     ', 00H
PAGE_00_L2:	DB   '  A-K-R - LM629 ', 00H

PAGE_01_L1:	DB   ' >Load Fil. Dt. ', 00H
PAGE_01_L2:	DB   '                ', 00H

PAGE_02_L1:	DB   ' >Kp_H =     ', 00H
PAGE_02_L2:	DB   '                ', 00H

PAGE_03_L1:	DB   ' >Kp_L =     ', 00H
PAGE_03_L2:	DB   '                ', 00H

PAGE_04_L1:	DB   ' >Ki_H =     ', 00H
PAGE_04_L2:	DB   '                ', 00H

PAGE_05_L1:	DB   ' >Ki_L =     ', 00H
PAGE_05_L2:	DB   '                ', 00H

PAGE_06_L1:	DB   ' >Kd_H =     ', 00H
PAGE_06_L2:	DB   '                ', 00H

PAGE_07_L1:	DB   ' >Kd_L =     ', 00H
PAGE_07_L2:	DB   '                ', 00H

PAGE_08_L1:	DB   '>Load Trajectory', 00H
PAGE_08_L2:	DB   ' RDSTAT =', 00H

PAGE_09_L1:	DB   ' >P_des_H =  ', 00H
PAGE_09_L2:	DB   '                ', 00H

PAGE_10_L1:	DB   ' >P_des_L =  ', 00H
PAGE_10_L2:	DB   '                ', 00H

PAGE_11_L1:	DB   ' >MOTOR STATUS  ', 00H
PAGE_11_L2:	DB   '                ', 00H

PAGE_12_L1:	DB   'P_r=', 00H
PAGE_12_L2:	DB   'P_d=', 00H

PAGE_13_L1:	DB   'V_r=', 00H
PAGE_13_L2:	DB   'V_d=', 00H

PAGE_14_L1:	DB   '> MOTOR Status: ', 00H
PAGE_14_L2:	DB   '       ON       ', 00H

PAGE_15_L1:	DB   '> MOTOR Status: ', 00H
PAGE_15_L2:	DB   '       OFF      ', 00H

PAGE_16_L1:	DB   '> Read Signals: ', 00H			;eshte menduar te shkruhet funksioni qe lexon statusin e sinjaleve te rendesishme, interruptave etj.
PAGE_16_L2:	DB   '', 00H

PAGE_INIT1:	DB   ' INICIALIZIMI   ', 00H
PAGE_INIT2:	DB   ' ENTER P2.7 >>> ', 00H

PAGE_17_L1:	DB   '  >NEW HOME POS.', 00H
PAGE_17_L2:	DB   '  ENTER TO SET  ', 00H

LOADING_P:	DB   ' LOADING...     ', 00h

END



;Ejup Hoxha  - FIEK - Automatike e kompjuterizuar me Robotike