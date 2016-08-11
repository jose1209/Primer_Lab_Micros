section .data
	xc dw 320 	;POS x de centro del circulo
	yc dw 240	;POS y de centro del circulo
	TEMPO dw ?

	COLOR db 20  ;color inicial
	LAST  db "5"
	RAD dw 50    ;radio del circulo
	HOR dw ?	 ;algoritmo para graficar el circuilo
	VER dw ?
	vid db ? 	 ;salvamos el modo video

section .text

;-------------------ALgoritmo del programa------------------------
INFI:
	ITERA:
		CALL GRAFICAR
		CALL ESCUCHAR
		JNZ ATENDER ; Si no está vacío atiende el que está
		; Si está vacío atiende el último ingresado
		MOV AL,LAST
;----------------------------------------------------------------------

;---------------------Captura del Teclado-------------------
ATENDER:
	cmp al,"1"
	jnz E2
	call movsoeste
	jmp ITERA
E2:	
	cmp al, "2"
	jnz E3
	call movsur	
	jmp ITERA
E3:	
	cmp al, "3"
	jnz E4
	call movseste
	jmp ITERA
E4:	
	cmp al, "4"
	jnz E5
	call movoeste
	jmp ITERA
E5:	
	cmp al, "5"
	jnz E6
	call nomueva
	jmp ITERA
E6:
	cmp al, "6"
	jnz E7
	call moveste
	jmp ITERA
E7:	
	cmp al, "7"
	jnz E8
	call movneste	
	jmp ITERA
E8:	
	cmp al, "8"
	jnz E9
	call movnorte	
	jmp ITERA
E9:	
	cmp al, "9"
	jnz E10
	call movneste	
	jmp ITERA

; Alteración del RADIO a tiempo real
E10:
	cmp al,"+"
	jnz E11
	call INCREASE
	jmp ITERA
E11:
	cmp al,"-"
	jnz CAMBIARC
	call DECREASE
	jmp ITERA
; Modificación del COLOR a tiempo real
CAMBIARC:
	cmp al,"c"
	jnz QUIT
	call CCOLOR
	jmp ITERA
QUIT:	
	cmp al, "q"
	jnz INFI
	ret

;---------------------Incremento del circulo----------------
INCREASE:
	call BORRAR
	MOV AX,xc
	ADD AX,RAD
	SUB AX,640
	JZ DONTINC
	MOV AX,xc
	SUB AX,RAD
	JZ DONTINC
	MOV AX,yc
	SUB AX,RAD
	JZ DONTINC
	MOV AX,yc
	ADD AX,RAD
	SUB AX,480
	JZ DONTINC
	INC RAD
;-------------Si no colisiona al crecer, crece-------------
DONTINC:
	RET
;-----------------------------------------------------------
;-----------------Decremento del Circulo------------------
DECREASE:
	CALL BORRAR
	CMP RAD,10
	JE DONTDEC
	DEC RAD
;------------Si no es diminuto puede seguir decreciendo---------
DONTDEC:
	RET
;---------------------------------------------------------------
;-------------------Color del circulo-------------------------
CCOLOR:
	ADD COLOR,27
	;MOV LAST,"5" Que se detenga al cambiar de color
	RET
;--------------------------------------------------------------
;------------------Mover sur este-------------------------------
movsoeste:
	MOV AX,xc
	SUB AX,RAD
	JNZ NO1
	CALL movseste
	RET
NO1:
	MOV AX,yc
	ADD AX,RAD
	SUB AX,480
	JNZ	NO2
	CALL movnoeste
	RET
NO2:
	CALL BORRAR
	INC yc
	DEC xc
	MOV LAST,"1"
	RET
;---------------------------------------------------------------
;---------------------------Mover sur---------------------------
movsur:
	MOV AX,yc
	ADD AX,RAD
	SUB AX,480
	JNZ NO3
	CALL movnorte
	RET
NO3:
	CALL BORRAR
	INC yc
	MOV LAST,"2"
	RET
;---------------------------------------------------------------
;------------------------------Mover sureste-------------------
movseste:
	MOV AX,yc
	ADD AX,RAD
	SUB AX,480
	JNZ NO4
	CALL movneste
	RET
NO4:
	MOV AX,xc
	ADD AX,RAD
	SUB AX,640
	JNZ NO5
	CALL movsoeste
	RET
NO5:
	CALL BORRAR
	INC yc
	INC xc
	MOV LAST,"3"
	RET
;------------------------------------------------------------------
;---------------------------Mover oeste---------------------------
movoeste:
	MOV AX,xc
	SUB AX,RAD
	JNZ NO6
	CALL moveste
	RET
NO6:
	CALL BORRAR
	DEC xc
	MOV LAST,"4"
	RET
;--------------------------------------------------------------------
;-----------------Mover este----------------------------------------
moveste:
	MOV AX,xc
	ADD AX,RAD
	SUB AX,640
	JNZ NO7
	CALL movoeste
	RET
NO7:
	CALL BORRAR
	INC xc
	MOV LAST,"6"
	RET
;--------------------------------------------------------------------
;----------------------------Mover Noroeste---------------------------
movnoeste:
	MOV AX,xc
	SUB AX,RAD
	JNZ NO8
	CALL movneste
	RET
NO8:
	MOV AX,yc
	SUB AX,RAD
	JNZ NO9
	CALL movseste
	RET
NO9:
	CALL BORRAR
	DEC yc
	DEC xc
	MOV LAST,"7"
	RET
;----------------------------------------------------------------------
;------------------------Mover Norte-----------------------------------
movnorte:
	MOV AX,yc
	SUB AX,RAD
	JNZ NO10
	CALL movsur
	RET
NO10:
	CALL BORRAR
	DEC yc
	MOV LAST,"8"
	RET
;------------------------------------------------------------------------
;-------------------------Mover Noreste--------------------------------
movneste:
	MOV AX,xc
	ADD AX,RAD
	SUB AX,640
	JNZ NO11
	CALL movnoeste
	RET
NO11:
	MOV AX,yc
	SUB AX,RAD
	JNZ NO12
	CALL movseste
	RET
NO12:
	CALL BORRAR
	DEC yc
	INC xc
	MOV LAST,"9"
	RET
;-------------------------------------------------------------------------
;--------------------------No Mover--------------------------------------
nomueva:
					; CALL GRAFICAR
	MOV AH,0x00
	INT 0x16
					; Si deseamos que parpadee, eliminamos las 3 de arriba.
	MOV LAST,AL
	RET
;------------------------------------------------------------------------
;---------------------------Borrar---------------------------------------
BORRAR:
	MOV CX,0
	MOV CL,COLOR
	PUSH CX         ; Ya que en GRAFICAR se usan todos los registros
	MOV COLOR,00h
	CALL GRAFICAR
	POP CX
	MOV COLOR,CL
	RET
;-------------------------------------------------------
;-----------------------Puntear---------------------------------------
PUNTEAR:
	; Grafica un punto en CX,DX 
	MOV AH,0x0c		; Petición para escribir un punto
	MOV AL,COLOR	; Color del pixel
	MOV BH,0x00		; Página
	INT 0x10			; Llamada al BIOS
	RET
;---------------------------------------------------------------------
;--------------------Graficar-----------------------------------------
GRAFICAR:
; Graficamos todo el circulo !
	MOV HOR,0
	MOV AX,RAD
	MOV VER,AX
	
BUSQUEDA:
	CALL BUSCAR
	
    MOV AX,VER
	SUB AX,HOR
	CMP AX,1
	JA BUSQUEDA
	RET
;-----------------------------------------------------------------
;-------------------------Buscar----------------------------------
BUSCAR:
; Se encarga de buscar la coord del pixel sgte.
	INC HOR ; Horizontalmente siempre aumenta 1
	
	MOV AX,HOR	
	MUL AX
	MOV BX,AX ; X^2 se almacena en BX
	MOV AX,VER
	MUL AX    ; AX almacena Y^2
	ADD BX,AX ; BX almacena X^2 + Y^2
	MOV AX,RAD
	MUL AX    ; AX almacena R^2
	SUB AX,BX ; AX almacena R^2 - (X^2+Y^2)
	
	MOV TEMPO,AX
	
	MOV AX,HOR	
	MUL AX
	MOV BX,AX ; BX almacena X^2
	MOV AX,VER
	DEC AX    ; una unidad menos para Y (¡VAYA DIFERENCIA!)
	MUL AX    ; AX almacena Y^2
	ADD BX,AX ; BX almacena X^2 + Y^2
	MOV AX,RAD
	MUL AX    ; AX almacena R^2
	SUB AX,BX ; AX almacena R^2 - (X^2+Y^2)
	
	CMP TEMPO,AX
	JB NODEC
	DEC VER
NODEC:
	CALL REPUNTEAR
	PUSH VER
	PUSH HOR
	POP VER
	POP HOR   ; Cambiamos valores
	CALL REPUNTEAR
	PUSH VER
	PUSH HOR
	POP VER
	POP HOR   ; Devolvemos originales 
	RET
;-----------------------------------------------------------------------
;--------------------------Repuntear------------------------------------
REPUNTEAR:
	; I CUADRANTE
	MOV CX,xc
	ADD CX,HOR
	MOV DX,yc
	SUB DX,VER
	CALL PUNTEAR
	; IV CUADRANTE
	MOV DX,yc
	ADD DX,VER
	CALL PUNTEAR
	; III CUADRANTE
	MOV CX,xc
	SUB CX,HOR
	CALL PUNTEAR
	; II CUADRANTE
	MOV DX,yc
	SUB DX,VER
	CALL PUNTEAR
	RET
;------------------------------------------------------------------------
;------------------------------Escuchar----------------------------------
ESCUCHAR:
	MOV AH,0x06     ; Peticion directa a la consola
 	MOV DL,0x0FF    ; Entrada de teclado
 	INT 0x21        ; Interrupcion que llama al DOS
	; Si ZF está prendido quiere decir que el buffer está vacío.
	RET
	; En AL queda el ASCII del caracter ingresado.
;------------------------------------------------------------------------

	global _start

_start:
	
;-------------Peticion del modo de video---------------
	mov ah,0x0f
	int 0x10
	mov vid,al
;------------Peticion a modo grafico------------------
	mov ah,0x00
	mov al,0x12			;Resolucion de 640x480
	int 0x10

;-----------------Posicionamieto del circulo--------------------
	mov cx,xc
	mov dx,yc
	call PUNTEAR

	call INFI			;Bucle infinito que hace que el programa se acabe cuando se toca esc

;------------------Restablece el modo texto-----------------------
	mov ah,0x00	
	mov al,vid
	int 10h

	mov ah,0x004c
	int 0x21
