;днаюбхк тхкэрп бшянйху вюярнр LXE,1998
;SPCPLAY 2.6 STEREO
;цнкняю б пюгмшу йюмюкюу, сдюпмхй б нанху
;дпюибеп опнхцпшбюмхъ - хдеъ LA software,
; днпюанрйю Terra software
;

NAM=306		;юдпея акнйю оюп-пнб EMT36
DRV10=137600	;юдпея оепемняю дп-пю мю ай10

ADR:	.WORD 140000		;BIC R0,R0
	MOV  	#TXT1,R1
	CLR  	R2
	EMT  	20
	MOV  	#NAMBUF,R1
	MOV  	R1,R0
	MOV  	R1,R5
	MOV  	#10,R2
1:	MOV  	#20040,(R0)+
	SOB  	R2,1
	ADD  	#5020,R2
	EMT  	10

	MOV  	@#NAM,R1
	MOV	R1,R3
	MOV  	#3,(R3)+
	MOV  	#40000,(R3)+
	CLR	(R3)+
	MOV	#10,R2
2:	MOV	(R5)+,(R3)+
	SOB	R2,2

	CMPB 	@#177717,#300
	BNE  	3
	MOV  	#100000,@#ADR
	MOV  	#36000,@#177716		;PAGE 3,4
	CALL 	@#LOAD
	CALL	@#MOVINF
	MOV  	#16000,@#177716
	BR   	8

3:	CALL 	@#LOAD
	CALL	@#MOVINF
	MOV  	#40002,R0
4:	CMP  	(R0),#60000
	BGE  	5
	TST  	(R0)+
	BNE  	4
5:	CLR  	(R0)
	MOV  	#40000,R0
	MOV  	@#ADR,R1
	MOV  	#7770,R2
6:	MOV  	(R0)+,(R1)+
	SOB  	R2,6
	MOV  	#10,R0
7:	MOV  	R2,(R1)+
	SOB  	R0,7

8:	CALL	@#INFO
	MOV  	#NAMBUF,R2
	MOV  	R2,R3
	MOV  	#13,R4
9:	CMPB 	(R3)+,#56
	BEQ  	10
	SOB  	R4,9
10:	MOVB 	#'I,(R3)+
	MOVB 	#'N,(R3)+
	MOVB 	#'S,(R3)+
	MOV  	#320,R1
	MOV  	R1,R0
	MOV  	#10,R3
	MOV  	#3,(R0)+
	MOV  	#4000,(R0)+
	CLR  	(R0)+
11:	MOV  	(R2)+,(R0)+
	SOB  	R3,11

	CMPB 	@#177717,#300
	BNE  	12
	MOV  	#76000,@#177716		;PAGE 6,4
	CALL 	@#LOAD
	MOV  	#75400,@#177716		;PAGE 6,3
	BR   	SETDRV
12:	CALL 	@#LOAD
	BR   	SETDRV

LOAD:	EMT  	36
	INC 	R1
	TSTB 	(R1)
	BNE  	2
	RET

2:	MOV  	#16000,@#177716
	MOV  	#TXT2,R1
	CLR 	R2
	EMT  	20
	EMT  	6
	TST  	(SP)+
	RET

TXT2:	.ASCII	<14>/нЬХАЙЮ ОПХ ДХЯЙНБНИ НОЕПЮЖХХ./<12>
	.ASCIZ	/ мЮФЛХРЕ КЧАСЧ ЙКЮБХЬС ДКЪ БШУНДЮ Б MK-DOS./

TXT1:	.ASCII	<14>/ SPCplay 2.4 FOR STEREO-COVOX./<12>
	.ASCII	/(c) Terra software, Inc.  1997/<12>
	.ASCIZ	/File Name:/

INFT:	.ASCIZ	/         Melody name:      /<12>
	.EVEN




SETDRV:	MOV  	#330,@#177664
	MTPS 	#340
	MOV  	#STOP,@#4
	MOV  	@#ADR,R0
	MOV  	R0,R1
	SUB  	#40000,R1
	MOV  	(R0)+,@#DRV+2		;лхм. дкхр. хмярп.
	MOV  	R0,@#PLAY+2		;юдпея- сй. SPC рейярю
1:	TST  	(R0)
	BEQ  	2
	ADD  	R1,(R0)+
	BR   	1

2:	MOV R1,-(SP)
	MOV R2,-(SP)
	MOV  	#4000,R0
	MOV  	#70000,R5
3:	;рср ашк LXE
	CLR R2
	BISB (R0),R2
	CLR R1
	BISB 2(R0),R1
	ADD R2,R1
	CLR R2
	BISB 1(R0),R2
	ADD R2,R1
	CLR R2
	BISB 3(R0),R2
	ADD R2,R1
	CLR R2
	BISB 4(R0),R2
	ADD R2,R1
	CLR R2
	BISB 5(R0),R2
	ADD R2,R1
	CLR R2
	BISB 6(R0),R2
	ADD R2,R1
	CLR R2
	BISB 7(R0),R2
	ADD R2,R1
	ASR R1
	ASR R1
	ASR R1
	ASR R1
	MOVB R1,(R0)+

	SOB  	R5,3
	MOV (SP)+,R2
	MOV (SP)+,R1
	CMPB 	@#177717,#300
	BEQ  	PLAY

	MOV  	#ENDDRV-DRV,R0
	MOV  	#DRV,R1
	MOV  	#DRV10,R2
4:	MOVB 	(R1)+,(R2)+
	SOB  	R0,4
	JMP  	@#PLAY-DRV+DRV10


DRV:	MOV  	#3777,SP	;дкхрекэмнярэ мнрш
	MOV	R0,PREG+2	;януп. якед. онк-е сйюг-къ мнр
	MOV	#177714,R0
DRV2:	ADD	(PC)+,(PC)+
CH1:	.WORD	0
	.WORD	100000
	ADC	R3
	ADD	(PC)+,(PC)+
CH2:	.WORD	0
	.WORD	100000
	ADC	R4
DRUMC:	MOVB 	(R5)+,R1	;сдюпмхй
	MOVB	(R4),R2		;2 цнкня
	ADD  	R1,R2		;сдюпмхй х 2 цнкня
	SWAB	R2		; б ярюпьел аюире
	BISB	(R3),R2		;1 цнкня
	ADD	R1,R2		;сдюпмхй х 1 цнкня
	MOV  	R2,(R0)		;  б лкюдьел
	SOB  	SP,DRV2		;меярюмдюпрмне хяо-е SP


PREG:	MOV	(PC)+,R0
	.WORD	0		;сйюгюрекэ
	MOV  	(R0)+,R3	;юдпея 1 цнкняю
	MOV  	(R0)+,CH1	; йнмярюмрю вюярнрш
	MOV  	(R0)+,R4	;юдпея 2 цнкняю
	MOV  	(R0)+,CH2	; йнмярюмрю вюярнрш
	MOV  	(R0)+,R5	;юдпея сдюпмхйю дюкее йнлюмдю
	MOV  	(R0)+,DRUMC	;MOV (R5)+,R1 хкх MOV (R5),R1
	BNE  	DRV


PLAY:	MOV #140002,R0	;сйюгюрекэ б яохяйе пюгдекнб
;	TST (R0)+
	MOV  	(R0)+,PREG+2	;сйюгюрекэ юдпеяю мнр
	BEQ CONT
	MOV R0,PLAY+2
	BR   	PREG

CONT:	MOV @#1000,R0
	TST (R0)+
	MOV R0,PLAY+2
	BR PLAY

STOP:	MOV  	#1000,SP
	MOV  	#1330,@#177664
	MOV  	#16000,@#177716
	JMP  	@#100000
ENDDRV:

MOVINF:	MOV  	#40000,R1	;оепемеярх йсянй SPC
	MOV  	#100,R2		;я хлемюлх хмярпслемрнб
	MOV  	#ENN,R4
1:	MOV  	(R1)+,(R4)+
	SOB  	R2,1
	RET

INFO:	EMT	26
	DEC	R2
	EMT	24
	MOV	#INFT,R1
	CLR	R2
	EMT	20
	MOV	#ENN,R1
2:	TST	(R1)+		;онхяй 0
	BNE	2
	MOV  	#177040,R2	;дюкее 40 аюир
	EMT  	20		;мюгбюмхе лекндхх
	MOV  	#232,R0
	EMT  	16
	CALL 	NAMES4		;R1-дюкее хлемю хмярп.
	MOV  	#52.,XP
	CLR	YP
	CALL 	NAMES4
	RTS  	PC


NAMES4:	MOV  	#4,R3		;бшдюрэ мюгбюмхъ хмярп.
	MOV  	R1,-(SP)	;NAMES4+4
	MOV  	(PC)+,R1
XP:	.WORD	40.
	MOV  	(PC)+,R2
YP:	.WORD	0
	EMT  	24
	INC  	YP
	MOV  	(SP)+,R1
	MOV  	#10,R2
	CMP  	#ENN+200,R1
	BLOS 	2
	EMT  	20
	TSTB	(R1)
	BEQ	2
	SOB  	R3,NAMES4+4
2:	RET

NAMBUF:	.BLKB	20

ENN:	.END		;аштеп хлем хмярпслемрнб
			;рюакхжю 1000 аюир

