%macro escribe 2
	mov rax, 4		;llamada al sistema (sys_write)
	mov rbx, 1		;descripcion de archivo (stdout)
	mov rcx, %1	    ;msg a escribir
	mov rdx, %2		;longitud del mensage
	int 0x80
%endmacro 	

%macro limpiar 0 
	mov rax, 1		;llamada al sistema (sys_exit)
	int 0x80
%endmacro 

%macro leer 2
	mov rax, 3		;llamada al sistema (sys_write)
	mov rbx, 2		;descripcion de archivo (stdout)
	mov rcx, %1	    ;direccion de memoria donde se guarda la entrada 
	mov rdx, %2		;lecturas a realizar 
	int 0x80
%endmacro 


section .data 

	msg1 db 0x1b, "[2;2f","************ ",0x1b,"[3;2f","*",0x1b,"[3;13f","*",0x1b,"[4;2f","************ ",0x0a
	len1 equ $-msg1

	msg2 db 0x1b, "[5;2f","************ ",0x1b,"[6;2f","*",0x1b,"[6;13f","*",0x1b,"[7;2f","************ ",0x0a
	len2 equ $-msg2

	msg3 db 0x1b, "[8;2f","************ ",0x1b,"[9;2f","*",0x1b,"[9;13f","*",0x1b,"[10;2f","************ ",0x0a
	len3 equ $-msg3

	msg4 db 0x1b, "[2;15f","************ ",0x1b,"[3;15f","*",0x1b,"[3;26f","*",0x1b,"[4;15f","************ ",0x0a
	len4 equ $-msg4

	msg5 db 0x1b, "[5;15f","************ ",0x1b,"[6;15f","*",0x1b,"[6;26f","*",0x1b,"[7;15f","************ ",0x0a
	len5 equ $-msg5

	msg6 db 0x1b, "[8;15f","************ ",0x1b,"[9;15f","*",0x1b,"[9;26f","*",0x1b,"[10;15f","************ ",0x0a
	len6 equ $-msg6

	msg7 db 0x1b, "[2;28f","************ ",0x1b,"[3;28f","*",0x1b,"[3;39f","*",0x1b,"[4;28f","************ ",0x0a
	len7 equ $-msg7

	msg8 db 0x1b, "[5;28f","************ ",0x1b,"[6;28f","*",0x1b,"[6;39f","*",0x1b,"[7;28f","************ ",0x0a
	len8 equ $-msg8

	msg9 db 0x1b, "[8;28f","************ ",0x1b,"[9;28f","*",0x1b,"[9;39f","*",0x1b,"[10;28f","************ ",0x0a
	len9 equ $-msg9

	msg10 db 0x1b, "[2;41f","************ ",0x1b,"[3;41f","*",0x1b,"[3;52f","*",0x1b,"[4;41f","************ ",0x0a
	len10 equ $-msg10

	msg11 db 0x1b, "[5;41f","************ ",0x1b,"[6;41f","*",0x1b,"[6;52f","*",0x1b,"[7;41f","************ ",0x0a
	len11 equ $-msg11

	msg12 db 0x1b, "[8;41f","************ ",0x1b,"[9;41f","*",0x1b,"[9;52f","*",0x1b,"[10;41f","************ ",0x0a
	len12 equ $-msg12

	msg13 db 0x1b, "[2;54f","************ ",0x1b,"[3;54f","*",0x1b,"[3;65f","*",0x1b,"[4;54f","************ ",0x0a
	len13 equ $-msg13

	msg14 db 0x1b, "[5;54f","************ ",0x1b,"[6;54f","*",0x1b,"[6;65f","*",0x1b,"[7;54f","************ ",0x0a
	len14 equ $-msg14

	msg15 db 0x1b, "[8;54f","************ ",0x1b,"[9;54f","*",0x1b,"[9;65f","*",0x1b,"[10;54f","************ ",0x0a
	len15 equ $-msg15

	msg16 db 0x1b, "[2;67f","************ ",0x1b,"[3;67f","*",0x1b,"[3;78f","*",0x1b,"[4;67f","************",0x0a
	len16 equ $-msg16

	msg17 db 0x1b, "[5;67f","************ ",0x1b,"[6;67f","*",0x1b,"[6;78f","*",0x1b,"[7;67f","************",0x0a
	len17 equ $-msg17

	msg18 db 0x1b, "[8;67f","************ ",0x1b,"[9;67f","*",0x1b,"[9;78f","*",0x1b,"[10;67f","************",0x0a
	len18 equ $-msg18

	msg19 db "Rebote AD",0x0a
	len19 equ $-msg19

	msg20 db "Rebote AI",0x0a
	len20 equ $-msg20

	msg21 db "Rebote BD",0x0a
	len21 equ $-msg21

	msg22 db "Rebote BI",0x0a
	len22 equ $-msg22

	msg23 db 0x1b, "[2;2f","             ",0x1b,"[3;2f"," ",0x1b,"[3;13f"," ",0x1b,"[4;2f","             ",0x0a
	len23 equ $-msg23

	msg24 db 0x1b, "[5;2f","             ",0x1b,"[6;2f"," ",0x1b,"[6;13f"," ",0x1b,"[7;2f","             ",0x0a
	len24 equ $-msg24

	msg25 db 0x1b, "[8;2f","             ",0x1b,"[9;2f"," ",0x1b,"[9;13f"," ",0x1b,"[10;2f","             ",0x0a
	len25 equ $-msg25

	msg26 db 0x1b, "[2;15f","             ",0x1b,"[3;15f"," ",0x1b,"[3;26f"," ",0x1b,"[4;15f","             ",0x0a
	len26 equ $-msg26

	msg27 db 0x1b, "[5;15f","             ",0x1b,"[6;15f"," ",0x1b,"[6;26f"," ",0x1b,"[7;15f","             ",0x0a
	len27 equ $-msg27

	msg28 db 0x1b, "[8;15f","             ",0x1b,"[9;15f"," ",0x1b,"[9;26f"," ",0x1b,"[10;15f","             ",0x0a
	len28 equ $-msg28

	msg29 db 0x1b, "[2;28f","             ",0x1b,"[3;28f"," ",0x1b,"[3;39f"," ",0x1b,"[4;28f","             ",0x0a
	len29 equ $-msg29

	msg30 db 0x1b, "[5;28f","             ",0x1b,"[6;28f"," ",0x1b,"[6;39f"," ",0x1b,"[7;28f","             ",0x0a
	len30 equ $-msg30

	msg31 db 0x1b, "[8;28f","             ",0x1b,"[9;28f"," ",0x1b,"[9;39f"," ",0x1b,"[10;28f","             ",0x0a
	len31 equ $-msg31

	msg32 db 0x1b, "[2;41f","             ",0x1b,"[3;41f"," ",0x1b,"[3;52f"," ",0x1b,"[4;41f","             ",0x0a
	len32 equ $-msg32

	msg33 db 0x1b, "[5;41f","             ",0x1b,"[6;41f"," ",0x1b,"[6;52f"," ",0x1b,"[7;41f","             ",0x0a
	len33 equ $-msg33

	msg34 db 0x1b, "[8;41f","             ",0x1b,"[9;41f"," ",0x1b,"[9;52f"," ",0x1b,"[10;41f","             ",0x0a
	len34 equ $-msg34

	msg35 db 0x1b, "[2;54f","             ",0x1b,"[3;54f"," ",0x1b,"[3;65f"," ",0x1b,"[4;54f","             ",0x0a
	len35 equ $-msg35

	msg36 db 0x1b, "[5;54f","             ",0x1b,"[6;54f"," ",0x1b,"[6;65f"," ",0x1b,"[7;54f","             ",0x0a
	len36 equ $-msg36

	msg37 db 0x1b, "[8;54f","             ",0x1b,"[9;54f"," ",0x1b,"[9;65f"," ",0x1b,"[10;54f","             ",0x0a
	len37 equ $-msg37

	msg38 db 0x1b, "[2;67f","             ",0x1b,"[3;67f"," ",0x1b,"[3;78f"," ",0x1b,"[4;67f","            ",0x0a
	len38 equ $-msg38

	msg39 db 0x1b, "[5;67f","             ",0x1b,"[6;67f"," ",0x1b,"[6;78f"," ",0x1b,"[7;67f","            ",0x0a
	len39 equ $-msg39

	msg40 db 0x1b, "[8;67f","             ",0x1b,"[9;67f"," ",0x1b,"[9;78f"," ",0x1b,"[10;67f","            ",0x0a
	len40 equ $-msg40

	b1 dq 0
	b2 dq 0
	b3 dq 0
	b4 dq 0
	b5 dq 0
	b6 dq 0
	b7 dq 0
	b8 dq 0
	b9 dq 0
	b10 dq 0
	b11 dq 0
	b12 dq 0
	b13 dq 0
	b14 dq 0
	b15 dq 0
	b16 dq 0
	b17 dq 0
	b18 dq 0

    m dq 0
	
	x1 dq 0
	x2 dq 0  ; Vienen de Alejandro
	y1 dq 0
	y2 dq 0


section .text
	global _start       ;para el linker
_start:		            ;marca la entrada

    mov qword [y1], 0x30
    mov qword [y2], 0x34  ; Vienen de Alejandro
	mov qword [x1], 0x36
	mov qword [x2], 0x37

    mov qword [m], 0x33  ; Vienen de Alejandro

	mov qword [b1], 0x30
    mov qword [b2], 0x30
	mov qword [b3], 0x30
	mov qword [b4], 0x30
	mov qword [b5], 0x30
    mov qword [b6], 0x30
	mov qword [b7], 0x30
	mov qword [b8], 0x30  ;Declararlas en la parte principal
	mov qword [b9], 0x30
    mov qword [b10], 0x30
	mov qword [b11], 0x30
	mov qword [b12], 0x30
	mov qword [b13], 0x30
    mov qword [b14], 0x30
	mov qword [b15], 0x30
	mov qword [b16], 0x30
	mov qword [b17], 0x30
	mov qword [b18], 0x30

Escribir_Bloques:

    escribe msg1,len1
    escribe msg2,len2
    escribe msg3,len3
    escribe msg4,len4
    escribe msg5,len5
    escribe msg6,len6
    escribe msg7,len7
    escribe msg8,len8
    escribe msg9,len9
    escribe msg10,len10
    escribe msg11,len11
    escribe msg12,len12
    escribe msg13,len13
    escribe msg14,len14
    escribe msg15,len15
    escribe msg16,len16
    escribe msg17,len17
    escribe msg18,len18

;-------------------------------------------------------- Inicio Comparaciones Iniciales ----------------------------------------------------------------

comparacion1:

	cmp qword [y1],0x30
	je comparacion2
	cmp qword [y1],0x31
	je comparacion3
    jmp salir

comparacion2:
	
	cmp qword [y2],0x32
	je comparacion4
	cmp qword [y2],0x33
	je comparacion5
	cmp qword [y2],0x34
	je comparacion6
	cmp qword [y2],0x35
	je comparacion4
	cmp qword [y2],0x36
	je comparacion5
	cmp qword [y2],0x37
	je comparacion6
	cmp qword [y2],0x38
	je comparacion4
	cmp qword [y2],0x39
	je comparacion5
	jmp salir

comparacion3:

	cmp qword [y2],0x30
	je comparacion6
	jmp salir

comparacion4:

	cmp qword [x1],0x30
	je comparacion7
	cmp qword [x1],0x31
	je comparacion8
	cmp qword [x1],0x32
	je comparacion9
	cmp qword [x1],0x33
	je comparacion10
	cmp qword [x1],0x34
	je comparacion11
	cmp qword [x1],0x35
	je comparacion12
	cmp qword [x1],0x36
	je comparacion13
	cmp qword [x1],0x37
	je comparacion14
	jmp salir
	
comparacion5:

	cmp qword [x1],0x30
	je comparacion15
	cmp qword [x1],0x31
	je comparacion16
	cmp qword [x1],0x32
	je comparacion17
	cmp qword [x1],0x33
	je comparacion18
	cmp qword [x1],0x34
	je comparacion19
	cmp qword [x1],0x35
	je comparacion20
	cmp qword [x1],0x36
	je comparacion21
	cmp qword [x1],0x37
	je comparacion22
	jmp salir


comparacion6:

	cmp qword [x1],0x30
	je comparacion7
	cmp qword [x1],0x31
	je comparacion8
	cmp qword [x1],0x32
	je comparacion9
	cmp qword [x1],0x33
	je comparacion10
	cmp qword [x1],0x34
	je comparacion11
	cmp qword [x1],0x35
	je comparacion12
	cmp qword [x1],0x36
	je comparacion13
	cmp qword [x1],0x37
	je comparacion14
	jmp salir

;---------------------------------------------------------- Final Comparaciones Iniciales ---------------------------------------------------------------


;---------------------------------------------------------- Inicio Comparaciones Fila 2,4,5,7,8,10 -------------------------------------------------------------
comparacion7:

	cmp qword [x2],0x30
	je salir
	cmp qword [x2],0x31
	je salir
	cmp qword [x2],0x32
	je esquina_I1
	jmp verificacion_A

comparacion8:

	cmp qword [x2],0x33
	je esquina_D1
	cmp qword [x2],0x34
	je salir
	cmp qword [x2],0x35
	je esquina_I2
	jmp verificacion_B
	

comparacion9:
    
    cmp qword [x2],0x30
    je verificacion_B
    cmp qword [x2],0x31
    je verificacion_B
    cmp qword [x2],0x32
    je verificacion_B
    cmp qword [x2],0x33
    je verificacion_B
    cmp qword [x2],0x34
    je verificacion_B
    cmp qword [x2],0x35
    je verificacion_B
	cmp qword [x2],0x36
	je esquina_D2
	cmp qword [x2],0x37
	je salir
	cmp qword [x2],0x38	
	je esquina_I3
	cmp qword [x2],0x39
	je verificacion_C
	jmp salir

comparacion10:

	cmp qword [x2],0x39
	je esquina_D3
	jmp verificacion_C

comparacion11:

	cmp qword [x2],0x30
	je salir
	cmp qword [x2],0x31
	je esquina_I4
	jmp verificacion_D
	

comparacion12:

	cmp qword [x2],0x30
	je verificacion_D
	cmp qword [x2],0x31
	je verificacion_D
	cmp qword [x2],0x32
	je esquina_D4
	cmp qword [x2],0x33
	je salir
	cmp qword [x2],0x34
	je esquina_I5
	jmp verificacion_E

comparacion13:

	cmp qword [x2],0x30
	je verificacion_E
	cmp qword [x2],0x31
	je verificacion_E
	cmp qword [x2],0x32
	je verificacion_E
	cmp qword [x2],0x33
	je verificacion_E
	cmp qword [x2],0x34
	je verificacion_E
	cmp qword [x2],0x35
	je esquina_D5
	cmp qword [x2],0x36
	je salir
	cmp qword [x2],0x37
	je esquina_I6
	jmp verificacion_F

comparacion14:

	cmp qword [x2],0x38
	je esquina_D6
	cmp qword [x2],0x39
	je salir
	jmp verificacion_F

;--------------------------------------------------------Final Comparaciones Fila 2,4,5,7,8,10-----------------------------------------------------------------


;--------------------------------------------------------Inicio Comparaciones Fila 3,6,9----------------------------------------------------------------
comparacion15:

	cmp qword [x2],0x32
	je verificacion_G
	jmp salir

comparacion16:

	cmp qword [x2],0x33
	je verificacion_M
	cmp qword [x2],0x35
	je verificacion_H
	jmp salir

comparacion17:

	cmp qword [x2],0x36
	je verificacion_N
	cmp qword [x2],0x38
	je verificacion_I
	jmp salir

comparacion18:

	cmp qword [x2],0x39
	je verificacion_O
	jmp salir

comparacion19:

	cmp qword [x2],0x31
	je verificacion_J
	jmp salir

comparacion20:

	cmp qword [x2],0x32
	je verificacion_P
	cmp qword [x2],0x34
	je verificacion_K
	jmp salir

comparacion21:

	cmp qword [x2],0x35
	je verificacion_Q
	cmp qword [x2],0x37
	je verificacion_L
	jmp salir

comparacion22:

	cmp qword [x2],0x38
	je verificacion_R
	jmp salir

;--------------------------------------------------------Final Comparaciones Fila 3,6,9-----------------------------------------------------------------


;--------------------------------------------------------  Inicio Verificaciones -----------------------------------------------------------------------

verificacion_A:
	
	cmp qword [y2],0x32
	je bloque_1A
	cmp qword [y2],0x34
	je bloque_1B
	cmp qword [y2],0x35
	je bloque_2A
	cmp qword [y2],0x37
	je bloque_2B
	cmp qword [y2],0x38
	je bloque_3A
	cmp qword [y2],0x30
	je bloque_3B
	jmp salir

verificacion_B:

	cmp qword [y2],0x32
	je bloque_4A
	cmp qword [y2],0x34
	je bloque_4B
	cmp qword [y2],0x35
	je bloque_5A
	cmp qword [y2],0x37
	je bloque_5B
	cmp qword [y2],0x38
	je bloque_6A
	cmp qword [y2],0x30
	je bloque_6B
	jmp salir

verificacion_C:

	cmp qword [y2],0x32
	je bloque_7A
	cmp qword [y2],0x34
	je bloque_7B
	cmp qword [y2],0x35
	je bloque_8A
	cmp qword [y2],0x37
	je bloque_8B
	cmp qword [y2],0x38
	je bloque_9A
	cmp qword [y2],0x30
	je bloque_9B
	jmp salir

verificacion_D:

	cmp qword [y2],0x32
	je bloque_10A
	cmp qword [y2],0x34
	je bloque_10B
	cmp qword [y2],0x35
	je bloque_11A
	cmp qword [y2],0x37
	je bloque_11B
	cmp qword [y2],0x38
	je bloque_12A
	cmp qword [y2],0x30
	je bloque_12B
	jmp salir

verificacion_E:

	cmp qword [y2],0x32
	je bloque_13A
	cmp qword [y2],0x34
	je bloque_13B
	cmp qword [y2],0x35
	je bloque_14A
	cmp qword [y2],0x37
	je bloque_14B
	cmp qword [y2],0x38
	je bloque_15A
	cmp qword [y2],0x30
	je bloque_15B
	jmp salir

verificacion_F:

	cmp qword [y2],0x32
	je bloque_16A
	cmp qword [y2],0x34
	je bloque_16B
	cmp qword [y2],0x35
	je bloque_17A
	cmp qword [y2],0x37
	je bloque_17B
	cmp qword [y2],0x38
	je bloque_18A
	cmp qword [y2],0x30
	je bloque_18B
	jmp salir

verificacion_G:
	
	cmp qword [y2],0x33
	je bloque_1I
	cmp qword [y2],0x36
	je bloque_2I
	cmp qword [y2],0x39
	je bloque_3I
	jmp salir

verificacion_H:

	cmp qword [y2],0x33
	je bloque_4I
	cmp qword [y2],0x36
	je bloque_5I
	cmp qword [y2],0x39
	je bloque_6I
	jmp salir

verificacion_I:

	cmp qword [y2],0x33
	je bloque_7I
	cmp qword [y2],0x36
	je bloque_8I
	cmp qword [y2],0x39
	je bloque_9I
	jmp salir

verificacion_J:

	cmp qword [y2],0x33
	je bloque_10I
	cmp qword [y2],0x36
	je bloque_11I
	cmp qword [y2],0x39
	je bloque_12I
	jmp salir

verificacion_K:

	cmp qword [y2],0x33
	je bloque_13I
	cmp qword [y2],0x36
	je bloque_14I
	cmp qword [y2],0x39
	je bloque_15I
	jmp salir

verificacion_L:

    cmp qword [y2],0x33
	je bloque_16I
	cmp qword [y2],0x36
	je bloque_17I
	cmp qword [y2],0x39
	je bloque_18I
	jmp salir

verificacion_M:

    cmp qword [y2],0x33
	je bloque_1D
	cmp qword [y2],0x36
	je bloque_2D
	cmp qword [y2],0x39
	je bloque_3D
	jmp salir

verificacion_N:

    cmp qword [y2],0x33
	je bloque_4D
	cmp qword [y2],0x36
	je bloque_5D
	cmp qword [y2],0x39
	je bloque_6D
	jmp salir

verificacion_O:

    cmp qword [y2],0x33
	je bloque_7D
	cmp qword [y2],0x36
	je bloque_8D
	cmp qword [y2],0x39
	je bloque_9D
	jmp salir

verificacion_P:

    cmp qword [y2],0x33
	je bloque_10D
	cmp qword [y2],0x36
	je bloque_11D
	cmp qword [y2],0x39
	je bloque_12D
	jmp salir

verificacion_Q:

    cmp qword [y2],0x33
	je bloque_13D
	cmp qword [y2],0x36
	je bloque_14D
	cmp qword [y2],0x39
	je bloque_15D
	jmp salir

verificacion_R:

    cmp qword [y2],0x33
	je bloque_16D
	cmp qword [y2],0x36
	je bloque_17D
	cmp qword [y2],0x39
	je bloque_18D
	jmp salir

;--------------------------------------------------------  Final Verificaciones ---------------------------------------------------------------------


;--------------------------------------------------------  	Inicio Eliminar Bloques -----------------------------------------------------------------

bloque_1A:
	
	cmp qword [b1],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento1_AD
	cmp qword [m],0x34
	je Movimiento1_AI
	jmp salir


bloque_2A:

	cmp qword [b2],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento2_AD
	cmp qword [m],0x34
	je Movimiento2_AI
	jmp salir

bloque_3A:

	cmp qword [b3],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento3_AD
	cmp qword [m],0x34
	je Movimiento3_AI
	jmp salir

bloque_4A:

	cmp qword [b4],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento4_AD
	cmp qword [m],0x34
	je Movimiento4_AI
	jmp salir

bloque_5A:

	cmp qword [b5],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento5_AD
	cmp qword [m],0x34
	je Movimiento5_AI
	jmp salir

bloque_6A:

	cmp qword [b6],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento6_AD
	cmp qword [m],0x34
	je Movimiento6_AI
	jmp salir

bloque_7A:

	cmp qword [b7],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento7_AD
	cmp qword [m],0x34
	je Movimiento7_AI
	jmp salir

bloque_8A:

	cmp qword [b8],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento8_AD
	cmp qword [m],0x34
	je Movimiento8_AI
	jmp salir

bloque_9A:

	cmp qword [b9],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento9_AD
	cmp qword [m],0x34
	je Movimiento9_AI
	jmp salir

bloque_10A:

	cmp qword [b10],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento10_AD
	cmp qword [m],0x34
	je Movimiento10_AI
	jmp salir

bloque_11A:

	cmp qword [b11],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento11_AD
	cmp qword [m],0x34
	je Movimiento11_AI
	jmp salir

bloque_12A:

	cmp qword [b12],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento12_AD
	cmp qword [m],0x34
	je Movimiento12_AI
	jmp salir

bloque_13A:

	cmp qword [b13],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento13_AD
	cmp qword [m],0x34
	je Movimiento13_AI
	jmp salir

bloque_14A:

	cmp qword [b14],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento14_AD
	cmp qword [m],0x34
	je Movimiento14_AI
	jmp salir

bloque_15A:

	cmp qword [b15],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento15_AD
	cmp qword [m],0x34
	je Movimiento15_AI
	jmp salir

bloque_16A:

	cmp qword [b16],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento16_AD
	cmp qword [m],0x34
	je Movimiento16_AI
	jmp salir

bloque_17A:

	cmp qword [b17],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento17_AD
	cmp qword [m],0x34
	je Movimiento17_AI
	jmp salir

bloque_18A:

	cmp qword [b18],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento18_AD
	cmp qword [m],0x34
	je Movimiento18_AI
	jmp salir

bloque_1B:
	
	cmp qword [b1],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento1_BD
	cmp qword [m],0x32
	je Movimiento1_BI
	jmp salir


bloque_2B:

	cmp qword [b2],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento2_BD
	cmp qword [m],0x32
	je Movimiento2_BI
	jmp salir

bloque_3B:

	cmp qword [b3],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento3_BD
	cmp qword [m],0x32
	je Movimiento3_BI
	jmp salir

bloque_4B:

	cmp qword [b4],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento4_BD
	cmp qword [m],0x32
	je Movimiento4_BI
	jmp salir

bloque_5B:

	cmp qword [b5],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento5_BD
	cmp qword [m],0x32
	je Movimiento5_BI
	jmp salir

bloque_6B:

	cmp qword [b6],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento6_BD
	cmp qword [m],0x32
	je Movimiento6_BI
	jmp salir

bloque_7B:

	cmp qword [b7],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento7_BD
	cmp qword [m],0x32
	je Movimiento7_BI
	jmp salir

bloque_8B:

	cmp qword [b8],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento8_BD
	cmp qword [m],0x32
	je Movimiento8_BI
	jmp salir

bloque_9B:

	cmp qword [b9],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento9_BD
	cmp qword [m],0x32
	je Movimiento9_BI
	jmp salir

bloque_10B:

	cmp qword [b10],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento10_BD
	cmp qword [m],0x32
	je Movimiento10_BI
	jmp salir

bloque_11B:

	cmp qword [b11],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento11_BD
	cmp qword [m],0x32
	je Movimiento11_BI
	jmp salir

bloque_12B:

	cmp qword [b12],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento12_BD
	cmp qword [m],0x32
	je Movimiento12_BI
	jmp salir

bloque_13B:

	cmp qword [b13],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento13_BD
	cmp qword [m],0x32
	je Movimiento13_BI
	jmp salir

bloque_14B:

	cmp qword [b14],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento14_BD
	cmp qword [m],0x32
	je Movimiento14_BI
	jmp salir

bloque_15B:

	cmp qword [b15],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento15_BD
	cmp qword [m],0x32
	je Movimiento15_BI
	jmp salir

bloque_16B:

	cmp qword [b16],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento16_BD
	cmp qword [m],0x32
	je Movimiento16_BI
	jmp salir

bloque_17B:

	cmp qword [b17],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento17_BD
	cmp qword [m],0x32
	je Movimiento17_BI
	jmp salir

bloque_18B:

	cmp qword [b18],0x31
	je salir
	cmp qword [m],0x31
	je Movimiento18_BD
	cmp qword [m],0x32
	je Movimiento18_BI
	jmp salir

bloque_1I:

	cmp qword [b1],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento19_BI
	cmp qword [m],0x31
	je Movimiento19_AI
	jmp salir

bloque_2I:

	cmp qword [b2],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento20_BI
	cmp qword [m],0x31
	je Movimiento20_AI
	jmp salir

bloque_3I:

	cmp qword [b3],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento21_BI
	cmp qword [m],0x31
	je Movimiento21_AI
	jmp salir

bloque_4I:

	cmp qword [b4],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento22_BI
	cmp qword [m],0x31
	je Movimiento22_AI
	jmp salir

bloque_5I:

	cmp qword [b5],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento23_BI
	cmp qword [m],0x31
	je Movimiento23_AI
	jmp salir

bloque_6I:

	cmp qword [b6],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento24_BI
	cmp qword [m],0x31
	je Movimiento24_AI
	jmp salir

bloque_7I:

	cmp qword [b7],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento25_BI
	cmp qword [m],0x31
	je Movimiento25_AI
	jmp salir

bloque_8I:

	cmp qword [b8],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento26_BI
	cmp qword [m],0x31
	je Movimiento26_AI
	jmp salir

bloque_9I:

	cmp qword [b9],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento27_BI
	cmp qword [m],0x31
	je Movimiento27_AI
	jmp salir

bloque_10I:

	cmp qword [b10],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento28_BI
	cmp qword [m],0x31
	je Movimiento28_AI
	jmp salir

bloque_11I:

	cmp qword [b11],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento29_BI
	cmp qword [m],0x31
	je Movimiento29_AI
	jmp salir

bloque_12I:

	cmp qword [b12],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento30_BI
	cmp qword [m],0x31
	je Movimiento30_AI
	jmp salir

bloque_13I:

	cmp qword [b13],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento31_BI
	cmp qword [m],0x31
	je Movimiento31_AI
	jmp salir

bloque_14I:

	cmp qword [b14],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento32_BI
	cmp qword [m],0x31
	je Movimiento32_AI
	jmp salir

bloque_15I:

	cmp qword [b15],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento33_BI
	cmp qword [m],0x31
	je Movimiento33_AI
	jmp salir

bloque_16I:

	cmp qword [b16],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento34_BI
	cmp qword [m],0x31
	je Movimiento34_AI
	jmp salir

bloque_17I:

	cmp qword [b17],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento35_BI
	cmp qword [m],0x31
	je Movimiento35_AI
	jmp salir

bloque_18I:

	cmp qword [b18],0x31
	je salir
	cmp qword [m],0x33
	je Movimiento36_BI
	cmp qword [m],0x31
	je Movimiento36_AI
	jmp salir

bloque_1D:

	cmp qword [b1],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento19_AD
	cmp qword [m],0x34
	je Movimiento19_BD
	jmp salir

bloque_2D:

	cmp qword [b2],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento20_AD
	cmp qword [m],0x34
	je Movimiento20_BD
	jmp salir

bloque_3D:

	cmp qword [b3],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento21_AD
	cmp qword [m],0x34
	je Movimiento21_BD
	jmp salir

bloque_4D:

	cmp qword [b4],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento22_AD
	cmp qword [m],0x34
	je Movimiento22_BD
	jmp salir

bloque_5D:

	cmp qword [b5],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento23_AD
	cmp qword [m],0x34
	je Movimiento23_BD
	jmp salir

bloque_6D:

	cmp qword [b6],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento24_AD
	cmp qword [m],0x34
	je Movimiento24_BD
	jmp salir

bloque_7D:

	cmp qword [b7],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento25_AD
	cmp qword [m],0x34
	je Movimiento25_BD
	jmp salir

bloque_8D:

	cmp qword [b8],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento26_AD
	cmp qword [m],0x34
	je Movimiento26_BD
	jmp salir

bloque_9D:

	cmp qword [b9],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento27_AD
	cmp qword [m],0x34
	je Movimiento27_BD
	jmp salir

bloque_10D:

	cmp qword [b10],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento28_AD
	cmp qword [m],0x34
	je Movimiento28_BD
	jmp salir

bloque_11D:

	cmp qword [b11],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento29_AD
	cmp qword [m],0x34
	je Movimiento29_BD
	jmp salir

bloque_12D:

	cmp qword [b12],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento30_AD
	cmp qword [m],0x34
	je Movimiento30_BD
	jmp salir

bloque_13D:

	cmp qword [b13],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento31_AD
	cmp qword [m],0x34
	je Movimiento31_BD
	jmp salir

bloque_14D:

	cmp qword [b14],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento32_AD
	cmp qword [m],0x34
	je Movimiento32_BD
	jmp salir

bloque_15D:

	cmp qword [b15],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento33_AD
	cmp qword [m],0x34
	je Movimiento33_BD
	jmp salir

bloque_16D:

	cmp qword [b16],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento34_AD
	cmp qword [m],0x34
	je Movimiento34_BD
	jmp salir

bloque_17D:

	cmp qword [b17],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento35_AD
	cmp qword [m],0x34
	je Movimiento35_BD
	jmp salir

bloque_18D:

	cmp qword [b18],0x31
	je salir
	cmp qword [m],0x32
	je Movimiento36_AD
	cmp qword [m],0x34
	je Movimiento36_BD
	jmp salir
;--------------------------------------------------------   Final Eliminar Bloques  -----------------------------------------------------------------

;--------------------------------------------------------   Inicio Esquinas  ------------------------------------------------------------------------

esquina_D1:

	cmp qword [y2],0x32
	je rebote_esquina1
	cmp qword [y2],0x34
	je rebote_esquina2
	cmp qword [y2],0x35
	je rebote_esquina3
	cmp qword [y2],0x37
	je rebote_esquina4
	cmp qword [y2],0x38
	je rebote_esquina5
	cmp qword [y2],0x30
	je rebote_esquina6
	jmp salir

esquina_D2:

	cmp qword [y2],0x32
	je rebote_esquina7
	cmp qword [y2],0x34
	je rebote_esquina8
	cmp qword [y2],0x35
	je rebote_esquina9
	cmp qword [y2],0x37
	je rebote_esquina10
	cmp qword [y2],0x38
	je rebote_esquina11
	cmp qword [y2],0x30
	je rebote_esquina12
	jmp salir

esquina_D3:

	cmp qword [y2],0x32
	je rebote_esquina13
	cmp qword [y2],0x34
	je rebote_esquina14
	cmp qword [y2],0x35
	je rebote_esquina15
	cmp qword [y2],0x37
	je rebote_esquina16
	cmp qword [y2],0x38
	je rebote_esquina17
	cmp qword [y2],0x30
	je rebote_esquina18
	jmp salir

esquina_D4:

	cmp qword [y2],0x32
	je rebote_esquina19
	cmp qword [y2],0x34
	je rebote_esquina20
	cmp qword [y2],0x35
	je rebote_esquina21
	cmp qword [y2],0x37
	je rebote_esquina22
	cmp qword [y2],0x38
	je rebote_esquina23
	cmp qword [y2],0x30
	je rebote_esquina24
	jmp salir

esquina_D5:

	cmp qword [y2],0x32
	je rebote_esquina25
	cmp qword [y2],0x34
	je rebote_esquina26
	cmp qword [y2],0x35
	je rebote_esquina27
	cmp qword [y2],0x37
	je rebote_esquina28
	cmp qword [y2],0x38
	je rebote_esquina29
	cmp qword [y2],0x30
	je rebote_esquina30
	jmp salir

esquina_D6:

	cmp qword [y2],0x32
	je rebote_esquina31
	cmp qword [y2],0x34
	je rebote_esquina32
	cmp qword [y2],0x35
	je rebote_esquina33
	cmp qword [y2],0x37
	je rebote_esquina34
	cmp qword [y2],0x38
	je rebote_esquina35
	cmp qword [y2],0x30
	je rebote_esquina36
	jmp salir

esquina_I1:

	cmp qword [y2],0x32
	je rebote_esquina37
	cmp qword [y2],0x34
	je rebote_esquina38
	cmp qword [y2],0x35
	je rebote_esquina39
	cmp qword [y2],0x37
	je rebote_esquina40
	cmp qword [y2],0x38
	je rebote_esquina41
	cmp qword [y2],0x30
	je rebote_esquina42
	jmp salir

esquina_I2:

	cmp qword [y2],0x32
	je rebote_esquina43
	cmp qword [y2],0x34
	je rebote_esquina44
	cmp qword [y2],0x35
	je rebote_esquina45
	cmp qword [y2],0x37
	je rebote_esquina46
	cmp qword [y2],0x38
	je rebote_esquina47
	cmp qword [y2],0x30
	je rebote_esquina48
	jmp salir

esquina_I3:

	cmp qword [y2],0x32
	je rebote_esquina49
	cmp qword [y2],0x34
	je rebote_esquina50
	cmp qword [y2],0x35
	je rebote_esquina51
	cmp qword [y2],0x37
	je rebote_esquina52
	cmp qword [y2],0x38
	je rebote_esquina53
	cmp qword [y2],0x30
	je rebote_esquina54
	jmp salir

esquina_I4:

	cmp qword [y2],0x32
	je rebote_esquina55
	cmp qword [y2],0x34
	je rebote_esquina56
	cmp qword [y2],0x35
	je rebote_esquina57
	cmp qword [y2],0x37
	je rebote_esquina58
	cmp qword [y2],0x38
	je rebote_esquina59
	cmp qword [y2],0x30
	je rebote_esquina60
	jmp salir

esquina_I5:

	cmp qword [y2],0x32
	je rebote_esquina61
	cmp qword [y2],0x34
	je rebote_esquina62
	cmp qword [y2],0x35
	je rebote_esquina63
	cmp qword [y2],0x37
	je rebote_esquina64
	cmp qword [y2],0x38
	je rebote_esquina65
	cmp qword [y2],0x30
	je rebote_esquina66
	jmp salir

esquina_I6:

	cmp qword [y2],0x32
	je rebote_esquina67
	cmp qword [y2],0x34
	je rebote_esquina68
	cmp qword [y2],0x35
	je rebote_esquina69
	cmp qword [y2],0x37
	je rebote_esquina70
	cmp qword [y2],0x38
	je rebote_esquina71
	cmp qword [y2],0x30
	je rebote_esquina72
	jmp salir

;--------------------------------------------------------   Final Esquinas  --------------------------------------------------------------------------

;--------------------------------------------------------   Inicio Borrar  --------------------------------------------------------------------------

Movimiento1_AD:

	escribe msg23,len23
	escribe msg19,len19
	mov qword [b1], 0x31
	jmp salir

Movimiento2_AD:

	escribe msg24,len24
	escribe msg19,len19
	mov qword [b2], 0x31
	jmp salir

Movimiento3_AD:

	escribe msg25,len25
	escribe msg19,len19
	mov qword [b3], 0x31
	jmp salir

Movimiento4_AD:

	escribe msg26,len26
	escribe msg19,len19
	mov qword [b4], 0x31
	jmp salir

Movimiento5_AD:

	escribe msg27,len27
	escribe msg19,len19
	mov qword [b5], 0x31
	jmp salir

Movimiento6_AD:

	escribe msg28,len28
	escribe msg19,len19
	mov qword [b6], 0x31
	jmp salir

Movimiento7_AD:

	escribe msg29,len29
	escribe msg19,len19
	mov qword [b7], 0x31
	jmp salir


Movimiento8_AD:

	escribe msg30,len30
	escribe msg19,len19
	mov qword [b8], 0x31
	jmp salir

Movimiento9_AD:

	escribe msg31,len31
	escribe msg19,len19
	mov qword [b9], 0x31
	jmp salir

Movimiento10_AD:

	escribe msg32,len32
	escribe msg19,len19
	mov qword [b10], 0x31
	jmp salir

Movimiento11_AD:

	escribe msg33,len33
	escribe msg19,len19
	mov qword [b11], 0x31
	jmp salir

Movimiento12_AD:

	escribe msg34,len34
	escribe msg19,len19
	mov qword [b12], 0x31
	jmp salir

Movimiento13_AD:

	escribe msg35,len35
	escribe msg19,len19 
	mov qword [b13], 0x31
	jmp salir

Movimiento14_AD:

	escribe msg36,len36
	escribe msg19,len19
	mov qword [b14], 0x31
	jmp salir

Movimiento15_AD:

	escribe msg37,len37
	escribe msg19,len19
	mov qword [b15], 0x31
	jmp salir

Movimiento16_AD:

	escribe msg38,len38
	escribe msg19,len19
	mov qword [b16], 0x31
	jmp salir

Movimiento17_AD:

	escribe msg39,len39
	escribe msg19,len19
	mov qword [b17], 0x31
	jmp salir

Movimiento18_AD:

	escribe msg40,len40
	escribe msg19,len19
	mov qword [b18], 0x31
	jmp salir

Movimiento19_AD:

	escribe msg23,len23
	escribe msg19,len19
	mov qword [b1], 0x31
	jmp salir

Movimiento20_AD:

	escribe msg24,len24
	escribe msg19,len19
	mov qword [b2], 0x31
	jmp salir

Movimiento21_AD:

	escribe msg25,len25
	escribe msg19,len19
	mov qword [b3], 0x31
	jmp salir

Movimiento22_AD:

	escribe msg26,len26
	escribe msg19,len19
	mov qword [b4], 0x31
	jmp salir

Movimiento23_AD:

	escribe msg27,len27
	escribe msg19,len19
	mov qword [b5], 0x31
	jmp salir

Movimiento24_AD:

	escribe msg28,len28
	escribe msg19,len19
	mov qword [b6], 0x31
	jmp salir

Movimiento25_AD:

	escribe msg29,len29
	escribe msg19,len19
	mov qword [b7], 0x31
	jmp salir

Movimiento26_AD:

	escribe msg30,len30
	escribe msg19,len19
	mov qword [b8], 0x31
	jmp salir

Movimiento27_AD:

	escribe msg31,len31
	escribe msg19,len19
	mov qword [b9], 0x31
	jmp salir

Movimiento28_AD:

	escribe msg32,len32
	escribe msg19,len19
	mov qword [b10], 0x31
	jmp salir

Movimiento29_AD:

	escribe msg33,len33
	escribe msg19,len19
	mov qword [b11], 0x31
	jmp salir

Movimiento30_AD:

	escribe msg34,len34
	escribe msg19,len19
	mov qword [b12], 0x31
	jmp salir

Movimiento31_AD:

	escribe msg35,len35
	escribe msg19,len19
	mov qword [b13], 0x31
	jmp salir

Movimiento32_AD:

	escribe msg36,len36
	escribe msg19,len19
	mov qword [b14], 0x31
	jmp salir

Movimiento33_AD:

	escribe msg37,len37
	escribe msg19,len19
	mov qword [b15], 0x31
	jmp salir

Movimiento34_AD:

	escribe msg38,len38
	escribe msg19,len19
	mov qword [b16], 0x31
	jmp salir

Movimiento35_AD:

	escribe msg39,len39
	escribe msg19,len19
	mov qword [b17], 0x31
	jmp salir

Movimiento36_AD:

	escribe msg40,len40
	escribe msg19,len19
	mov qword [b18], 0x31
	jmp salir


Movimiento1_BD:

	escribe msg23,len23
	escribe msg21,len21
	mov qword [b1], 0x31
	jmp salir

Movimiento2_BD:

	escribe msg24,len24
	escribe msg21,len21
	mov qword [b2], 0x31
	jmp salir

Movimiento3_BD:

	escribe msg25,len25
	escribe msg21,len21
	mov qword [b3], 0x31
	jmp salir

Movimiento4_BD:

	escribe msg26,len26
	escribe msg21,len21
	mov qword [b4], 0x31
	jmp salir

Movimiento5_BD:

	escribe msg27,len27
	escribe msg21,len21
	mov qword [b5], 0x31
	jmp salir

Movimiento6_BD:

	escribe msg28,len28
	escribe msg21,len21
	mov qword [b6], 0x31
	jmp salir

Movimiento7_BD:

	escribe msg29,len29
	escribe msg21,len21
	mov qword [b7], 0x31
	jmp salir

Movimiento8_BD:

	escribe msg30,len30
	escribe msg21,len21
	mov qword [b8], 0x31
	jmp salir

Movimiento9_BD:

	escribe msg31,len31
	escribe msg21,len21
	mov qword [b9], 0x31
	jmp salir

Movimiento10_BD:

	escribe msg32,len32
	escribe msg21,len21
	mov qword [b10], 0x31
	jmp salir

Movimiento11_BD:

	escribe msg33,len33
	escribe msg21,len21
	mov qword [b11], 0x31
	jmp salir

Movimiento12_BD:

	escribe msg34,len34
	escribe msg21,len21
	mov qword [b12], 0x31
	jmp salir

Movimiento13_BD:

	escribe msg35,len35
	escribe msg21,len21
	mov qword [b13], 0x31
	jmp salir

Movimiento14_BD:

	escribe msg36,len36
	escribe msg21,len21
	mov qword [b14], 0x31
	jmp salir

Movimiento15_BD:

	escribe msg37,len37
	escribe msg21,len21
	mov qword [b15], 0x31
	jmp salir

Movimiento16_BD:

	escribe msg38,len38
	escribe msg21,len21
	mov qword [b16], 0x31
	jmp salir

Movimiento17_BD:

	escribe msg39,len39
	escribe msg21,len21
	mov qword [b17], 0x31
	jmp salir

Movimiento18_BD:

	escribe msg40,len40
	escribe msg21,len21
	mov qword [b18], 0x31
	jmp salir

Movimiento19_BD:

	escribe msg23,len23
	escribe msg21,len21
	mov qword [b1], 0x31
	jmp salir

Movimiento20_BD:

	escribe msg24,len24
	escribe msg21,len21
	mov qword [b2], 0x31
	jmp salir

Movimiento21_BD:

	escribe msg25,len25
	escribe msg21,len21
	mov qword [b3], 0x31
	jmp salir

Movimiento22_BD:

	escribe msg26,len26
	escribe msg21,len21
	mov qword [b4], 0x31
	jmp salir

Movimiento23_BD:

	escribe msg27,len27
	escribe msg21,len21
	mov qword [b5], 0x31
	jmp salir

Movimiento24_BD:

	escribe msg28,len28
	escribe msg21,len21
	mov qword [b6], 0x31
	jmp salir

Movimiento25_BD:

	escribe msg29,len29
	escribe msg21,len21
	mov qword [b7], 0x31
	jmp salir

Movimiento26_BD:

	escribe msg30,len30
	escribe msg21,len21
	mov qword [b8], 0x31
	jmp salir

Movimiento27_BD:

	escribe msg31,len31
	escribe msg21,len21
	mov qword [b9], 0x31
	jmp salir

Movimiento28_BD:

	escribe msg32,len32
	escribe msg21,len21
	mov qword [b10], 0x31
	jmp salir

Movimiento29_BD:

	escribe msg33,len33
	escribe msg21,len21
	mov qword [b11], 0x31
	jmp salir

Movimiento30_BD:

	escribe msg34,len34
	escribe msg21,len21
	mov qword [b12], 0x31
	jmp salir

Movimiento31_BD:

	escribe msg35,len35
	escribe msg21,len21
	mov qword [b13], 0x31
	jmp salir

Movimiento32_BD:

	escribe msg36,len36
	escribe msg21,len21
	mov qword [b14], 0x31
	jmp salir

Movimiento33_BD:

	escribe msg37,len37
	escribe msg21,len21
	mov qword [b15], 0x31
	jmp salir

Movimiento34_BD:

	escribe msg38,len38
	escribe msg21,len21
	mov qword [b16], 0x31
	jmp salir

Movimiento35_BD:

	escribe msg39,len39
	escribe msg21,len21
	mov qword [b17], 0x31
	jmp salir

Movimiento36_BD:

	escribe msg40,len40
	escribe msg21,len21
	mov qword [b18], 0x31
	jmp salir


Movimiento1_AI:

	escribe msg23,len23
	escribe msg20,len20
	mov qword [b1], 0x31
	jmp salir

Movimiento2_AI:

	escribe msg24,len24
	escribe msg20,len20
	mov qword [b2], 0x31
	jmp salir

Movimiento3_AI:

	escribe msg25,len25
	escribe msg20,len20
	mov qword [b3], 0x31
	jmp salir

Movimiento4_AI:

	escribe msg26,len26
	escribe msg20,len20
	mov qword [b4], 0x31
	jmp salir

Movimiento5_AI:

	escribe msg27,len27
	escribe msg20,len20
	mov qword [b5], 0x31
	jmp salir

Movimiento6_AI:

	escribe msg28,len28
	escribe msg20,len20
	mov qword [b6], 0x31
	jmp salir

Movimiento7_AI:

	escribe msg29,len29
	escribe msg20,len20
	mov qword [b7], 0x31
	jmp salir

Movimiento8_AI:

	escribe msg30,len30
	escribe msg20,len20
	mov qword [b8], 0x31
	jmp salir

Movimiento9_AI:

	escribe msg31,len31
	escribe msg20,len20
	mov qword [b9], 0x31
	jmp salir

Movimiento10_AI:

	escribe msg32,len32
	escribe msg20,len20
	mov qword [b10], 0x31
	jmp salir

Movimiento11_AI:

	escribe msg33,len33
	escribe msg20,len20
	mov qword [b11], 0x31
	jmp salir

Movimiento12_AI:

	escribe msg34,len34
	escribe msg20,len20
	mov qword [b12], 0x31
	jmp salir

Movimiento13_AI:

	escribe msg35,len35
	escribe msg20,len20
	mov qword [b13], 0x31
	jmp salir

Movimiento14_AI:

	escribe msg36,len36
	escribe msg20,len20
	mov qword [b14], 0x31
	jmp salir

Movimiento15_AI:

	escribe msg37,len37
	escribe msg20,len20
	mov qword [b15], 0x31
	jmp salir

Movimiento16_AI:

	escribe msg38,len38
	escribe msg20,len20
	mov qword [b16], 0x31
	jmp salir

Movimiento17_AI:

	escribe msg39,len39
	escribe msg20,len20
	mov qword [b17], 0x31
	jmp salir

Movimiento18_AI:

	escribe msg40,len40
	escribe msg20,len20
	mov qword [b18], 0x31
	jmp salir

Movimiento19_AI:

	escribe msg23,len23
	escribe msg20,len20
	mov qword [b1], 0x31
	jmp salir

Movimiento20_AI:

	escribe msg24,len24
	escribe msg20,len20
	mov qword [b2], 0x31
	jmp salir

Movimiento21_AI:

	escribe msg25,len25
	escribe msg20,len20
	mov qword [b3], 0x31
	jmp salir

Movimiento22_AI:

	escribe msg26,len26
	escribe msg20,len20
	mov qword [b4], 0x31
	jmp salir

Movimiento23_AI:

	escribe msg27,len27
	escribe msg20,len20
	mov qword [b5], 0x31
	jmp salir

Movimiento24_AI:

	escribe msg28,len28
	escribe msg20,len20
	mov qword [b6], 0x31
	jmp salir

Movimiento25_AI:

	escribe msg29,len29
	escribe msg20,len20
	mov qword [b7], 0x31
	jmp salir

Movimiento26_AI:

	escribe msg30,len30
	escribe msg20,len20
	mov qword [b8], 0x31
	jmp salir

Movimiento27_AI:

	escribe msg31,len31
	escribe msg20,len20
	mov qword [b9], 0x31
	jmp salir

Movimiento28_AI:

	escribe msg32,len32
	escribe msg20,len20
	mov qword [b10], 0x31
	jmp salir

Movimiento29_AI:

	escribe msg33,len33
	escribe msg20,len20
	mov qword [b11], 0x31
	jmp salir

Movimiento30_AI:

	escribe msg34,len34
	escribe msg20,len20
	mov qword [b12], 0x31
	jmp salir

Movimiento31_AI:

	escribe msg35,len35
	escribe msg20,len20
	mov qword [b13], 0x31
	jmp salir

Movimiento32_AI:

	escribe msg36,len36
	escribe msg20,len20
	mov qword [b14], 0x31
	jmp salir

Movimiento33_AI:

	escribe msg37,len37
	escribe msg20,len20
	mov qword [b15], 0x31
	jmp salir

Movimiento34_AI:

	escribe msg38,len38
	escribe msg20,len20
	mov qword [b16], 0x31
	jmp salir

Movimiento35_AI:

	escribe msg39,len39
	escribe msg20,len20
	mov qword [b17], 0x31
	jmp salir

Movimiento36_AI:

	escribe msg40,len40
	escribe msg20,len20
	mov qword [b18], 0x31
	jmp salir


Movimiento1_BI:

	escribe msg23,len23
	escribe msg22,len22
	mov qword [b1], 0x31
	jmp salir

Movimiento2_BI:

	escribe msg24,len24
	escribe msg22,len22
	mov qword [b2], 0x31
	jmp salir

Movimiento3_BI:

	escribe msg25,len25
	escribe msg22,len22
	mov qword [b3], 0x31
	jmp salir

Movimiento4_BI:

	escribe msg26,len26
	escribe msg22,len22
	mov qword [b4], 0x31
	jmp salir

Movimiento5_BI:

	escribe msg27,len27
	escribe msg22,len22
	mov qword [b5], 0x31
	jmp salir

Movimiento6_BI:

	escribe msg28,len28
	escribe msg22,len22
	mov qword [b6], 0x31
	jmp salir

Movimiento7_BI:

	escribe msg29,len29
	escribe msg22,len22
	mov qword [b7], 0x31
	jmp salir

Movimiento8_BI:

	escribe msg30,len30
	escribe msg22,len22
	mov qword [b8], 0x31
	jmp salir

Movimiento9_BI:

	escribe msg31,len31
	escribe msg22,len22
	mov qword [b9], 0x31
	jmp salir

Movimiento10_BI:

	escribe msg32,len32
	escribe msg22,len22
	mov qword [b10], 0x31
	jmp salir

Movimiento11_BI:

	escribe msg33,len33
	escribe msg22,len22
	mov qword [b11], 0x31
	jmp salir

Movimiento12_BI:

	escribe msg34,len34
	escribe msg22,len22
	mov qword [b12], 0x31
	jmp salir

Movimiento13_BI:

	escribe msg35,len35
	escribe msg22,len22
	mov qword [b13], 0x31
	jmp salir

Movimiento14_BI:

	escribe msg36,len36
	escribe msg22,len22
	mov qword [b14], 0x31
	jmp salir

Movimiento15_BI:

	escribe msg37,len37
	escribe msg22,len22
	mov qword [b15], 0x31
	jmp salir

Movimiento16_BI:

	escribe msg38,len38
	escribe msg22,len22
	mov qword [b16], 0x31
	jmp salir

Movimiento17_BI:

	escribe msg39,len39
	escribe msg22,len22
	mov qword [b17], 0x31
	jmp salir

Movimiento18_BI:

	escribe msg40,len40
	escribe msg22,len22
	mov qword [b18], 0x31
	jmp salir

Movimiento19_BI:

	escribe msg23,len23
	escribe msg22,len22
	mov qword [b1], 0x31
	jmp salir

Movimiento20_BI:

	escribe msg24,len24
	escribe msg22,len22
	mov qword [b2], 0x31
	jmp salir

Movimiento21_BI:

	escribe msg25,len25
	escribe msg22,len22
	mov qword [b3], 0x31
	jmp salir

Movimiento22_BI:

	escribe msg26,len26
	escribe msg22,len22
	mov qword [b4], 0x31
	jmp salir

Movimiento23_BI:

	escribe msg27,len27
	escribe msg22,len22
	mov qword [b5], 0x31
	jmp salir

Movimiento24_BI:

	escribe msg28,len28
	escribe msg22,len22
	mov qword [b6], 0x31
	jmp salir

Movimiento25_BI:

	escribe msg29,len29
	escribe msg22,len22
	mov qword [b7], 0x31
	jmp salir

Movimiento26_BI:

	escribe msg30,len30
	escribe msg22,len22
	mov qword [b8], 0x31
	jmp salir

Movimiento27_BI:

	escribe msg31,len31
	escribe msg22,len22
	mov qword [b9], 0x31
	jmp salir

Movimiento28_BI:

	escribe msg32,len32
	escribe msg22,len22
	mov qword [b10], 0x31
	jmp salir

Movimiento29_BI:

	escribe msg33,len33
	escribe msg22,len22
	mov qword [b11], 0x31
	jmp salir

Movimiento30_BI:

	escribe msg34,len34
	escribe msg22,len22
	mov qword [b12], 0x31
	jmp salir

Movimiento31_BI:

	escribe msg35,len35
	escribe msg22,len22
	mov qword [b13], 0x31
	jmp salir

Movimiento32_BI:

	escribe msg36,len36
	escribe msg22,len22
	mov qword [b14], 0x31
	jmp salir

Movimiento33_BI:

	escribe msg37,len37
	escribe msg22,len22
	mov qword [b15], 0x31
	jmp salir

Movimiento34_BI:

	escribe msg38,len38
	escribe msg22,len22
	mov qword [b16], 0x31
	jmp salir

Movimiento35_BI:

	escribe msg39,len39
	escribe msg22,len22
	mov qword [b17], 0x31
	jmp salir

Movimiento36_BI:

	escribe msg40,len40
	escribe msg22,len22
	mov qword [b18], 0x31
	jmp salir


;--------------------------------------------------------   Final Borrar  --------------------------------------------------------------------------

;-------------------------------------------------------- Inicio Distintas ESquinas  ---------------------------------------------------------------

rebote_esquina1:

	cmp qword [m], 0x32
	je Movimiento1_AD
	cmp qword [m], 0x33
	je Movimiento1_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina2:

	cmp qword [m], 0x31
	je Movimiento1_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento1_BD
	jmp salir

rebote_esquina3:

	cmp qword [m], 0x32
	je Movimiento2_AD
	cmp qword [m], 0x33
	je Movimiento2_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina4:

	cmp qword [m], 0x31
	je Movimiento2_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento2_BD
	jmp salir

rebote_esquina5:

	cmp qword [m], 0x32
	je Movimiento3_AD
	cmp qword [m], 0x33
	je Movimiento3_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina6:

	cmp qword [m], 0x31
	je Movimiento3_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento3_BD
	jmp salir

rebote_esquina7:

	cmp qword [m], 0x32
	je Movimiento4_AD
	cmp qword [m], 0x33
	je Movimiento4_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina8:

	cmp qword [m], 0x31
	je Movimiento4_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento4_BD
	jmp salir

rebote_esquina9:

	cmp qword [m], 0x32
	je Movimiento5_AD
	cmp qword [m], 0x33
	je Movimiento5_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina10:

	cmp qword [m], 0x31
	je Movimiento5_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento5_BD
	jmp salir

rebote_esquina11:

	cmp qword [m], 0x32
	je Movimiento6_AD
	cmp qword [m], 0x33
	je Movimiento6_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina12:

	cmp qword [m], 0x31
	je Movimiento6_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento6_BD
	jmp salir

rebote_esquina13:

	cmp qword [m], 0x32
	je Movimiento7_AD
	cmp qword [m], 0x33
	je Movimiento7_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina14:

	cmp qword [m], 0x31
	je Movimiento7_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento7_BD
	jmp salir

rebote_esquina15:

	cmp qword [m], 0x32
	je Movimiento8_AD
	cmp qword [m], 0x33
	je Movimiento8_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina16:

	cmp qword [m], 0x31
	je Movimiento8_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento8_BD
	jmp salir

rebote_esquina17:

	cmp qword [m], 0x32
	je Movimiento9_AD
	cmp qword [m], 0x33
	je Movimiento9_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina18:

	cmp qword [m], 0x31
	je Movimiento9_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento9_BD
	jmp salir

rebote_esquina19:

	cmp qword [m], 0x32
	je Movimiento10_AD
	cmp qword [m], 0x33
	je Movimiento10_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina20:

	cmp qword [m], 0x31
	je Movimiento10_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento10_BD
	jmp salir

rebote_esquina21:

	cmp qword [m], 0x32
	je Movimiento11_AD
	cmp qword [m], 0x33
	je Movimiento11_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina22:

	cmp qword [m], 0x31
	je Movimiento11_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento11_BD
	jmp salir

rebote_esquina23:

	cmp qword [m], 0x32
	je Movimiento12_AD
	cmp qword [m], 0x33
	je Movimiento12_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina24:

	cmp qword [m], 0x31
	je Movimiento12_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento12_BD
	jmp salir

rebote_esquina25:

	cmp qword [m], 0x32
	je Movimiento13_AD
	cmp qword [m], 0x33
	je Movimiento13_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina26:

	cmp qword [m], 0x31
	je Movimiento13_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento13_BD
	jmp salir

rebote_esquina27:

	cmp qword [m], 0x32
	je Movimiento14_AD
	cmp qword [m], 0x33
	je Movimiento14_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina28:

	cmp qword [m], 0x31
	je Movimiento14_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento14_BD
	jmp salir

rebote_esquina29:

	cmp qword [m], 0x32
	je Movimiento15_AD
	cmp qword [m], 0x33
	je Movimiento15_AD
	;cmp qword [m], 0x34
	;je
	jmp salir 

rebote_esquina30:

	cmp qword [m], 0x31
	je Movimiento15_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento15_BD
	jmp salir

rebote_esquina31:

	cmp qword [m], 0x32
	je Movimiento16_AD
	cmp qword [m], 0x33
	je Movimiento16_AD
	;cmp qword [m], 0x34
	;je
	jmp salir 

rebote_esquina32:

	cmp qword [m], 0x31
	je Movimiento16_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento16_BD
	jmp salir

rebote_esquina33:

	cmp qword [m], 0x32
	je Movimiento17_AD
	cmp qword [m], 0x33
	je Movimiento17_AD
	;cmp qword [m], 0x34
	;je
	jmp salir 

rebote_esquina34:

	cmp qword [m], 0x31
	je Movimiento17_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento17_BD
	jmp salir

rebote_esquina35:

	cmp qword [m], 0x32
	je Movimiento18_AD
	cmp qword [m], 0x33
	je Movimiento18_AD
	;cmp qword [m], 0x34
	;je 
	jmp salir

rebote_esquina36:

	cmp qword [m], 0x31
	je Movimiento18_BD
	;cmp qword [m], 0x32
	;je 
	cmp qword [m], 0x34
	je Movimiento18_BD
	jmp salir

rebote_esquina37:

	cmp qword [m], 0x31
	je Movimiento1_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento1_AI
	jmp salir

rebote_esquina38:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento1_BI
	cmp qword [m], 0x33
	je Movimiento1_BI
	jmp salir

rebote_esquina39:

	cmp qword [m], 0x31
	je Movimiento2_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento2_AI
	jmp salir

rebote_esquina40:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento2_BI
	cmp qword [m], 0x33
	je Movimiento2_BI
	jmp salir

rebote_esquina41:

	cmp qword [m], 0x31
	je Movimiento3_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento3_AI
	jmp salir

rebote_esquina42:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento3_BI
	cmp qword [m], 0x33
	je Movimiento3_BI
	jmp salir

rebote_esquina43:

	cmp qword [m], 0x31
	je Movimiento4_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento4_AI
	jmp salir

rebote_esquina44:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento4_BI
	cmp qword [m], 0x33
	je Movimiento4_BI
	jmp salir

rebote_esquina45:

	cmp qword [m], 0x31
	je Movimiento5_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento5_AI
	jmp salir

rebote_esquina46:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento5_BI
	cmp qword [m], 0x33
	je Movimiento5_BI
	jmp salir

rebote_esquina47:

	cmp qword [m], 0x31
	je Movimiento6_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento6_AI
	jmp salir

rebote_esquina48:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento6_BI
	cmp qword [m], 0x33
	je Movimiento6_BI
	jmp salir

rebote_esquina49:

	cmp qword [m], 0x31
	je Movimiento7_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento7_AI
	jmp salir

rebote_esquina50:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento7_BI
	cmp qword [m], 0x33
	je Movimiento7_BI
	jmp salir

rebote_esquina51:

	cmp qword [m], 0x31
	je Movimiento8_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento8_AI
	jmp salir

rebote_esquina52:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento8_BI
	cmp qword [m], 0x33
	je Movimiento8_BI
	jmp salir

rebote_esquina53:

	cmp qword [m], 0x31
	je Movimiento9_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento9_AI
	jmp salir

rebote_esquina54:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento9_BI
	cmp qword [m], 0x33
	je Movimiento9_BI
	jmp salir

rebote_esquina55:

	cmp qword [m], 0x31
	je Movimiento10_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento10_AI
	jmp salir

rebote_esquina56:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento10_BI
	cmp qword [m], 0x33
	je Movimiento10_BI
	jmp salir

rebote_esquina57:

	cmp qword [m], 0x31
	je Movimiento11_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento11_AI
	jmp salir

rebote_esquina58:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento11_BI
	cmp qword [m], 0x33
	je Movimiento11_BI
	jmp salir

rebote_esquina59:

	cmp qword [m], 0x31
	je Movimiento12_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento12_AI
	jmp salir

rebote_esquina60:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento12_BI
	cmp qword [m], 0x33
	je Movimiento12_BI
	jmp salir

rebote_esquina61:

	cmp qword [m], 0x31
	je Movimiento13_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento13_AI
	jmp salir

rebote_esquina62:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento13_BI
	cmp qword [m], 0x33
	je Movimiento13_BI
	jmp salir

rebote_esquina63:

	cmp qword [m], 0x31
	je Movimiento14_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento14_AI
	jmp salir

rebote_esquina64:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento14_BI
	cmp qword [m], 0x33
	je Movimiento14_BI
	jmp salir

rebote_esquina65:

	cmp qword [m], 0x31
	je Movimiento15_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento15_AI
	jmp salir

rebote_esquina66:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento15_BI
	cmp qword [m], 0x33
	je Movimiento15_BI
	jmp salir

rebote_esquina67:

	cmp qword [m], 0x31
	je Movimiento16_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento16_AI
	jmp salir

rebote_esquina68:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento16_BI
	cmp qword [m], 0x33
	je Movimiento16_BI
	jmp salir

rebote_esquina69:

	cmp qword [m], 0x31
	je Movimiento17_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento17_AI
	jmp salir


rebote_esquina70:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento17_BI
	cmp qword [m], 0x33
	je Movimiento17_BI
	jmp salir

rebote_esquina71:

	cmp qword [m], 0x31
	je Movimiento18_AI
	;cmp qword [m], 0x33
	;je 
	cmp qword [m], 0x34
	je Movimiento18_AI
	jmp salir

rebote_esquina72:

	;cmp qword [m], 0x31
	;je 
	cmp qword [m], 0x32
	je Movimiento18_BI
	cmp qword [m], 0x33
	je Movimiento18_BI
	jmp salir


;-------------------------------------------------------- Final Distintas ESquinas  ----------------------------------------------------------------
	

salir:
	limpiar ;hacer un retorno 





    

