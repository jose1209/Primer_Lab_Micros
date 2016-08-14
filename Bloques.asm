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

	msg5 db 0x1b, "[5;15f","************ ",0x1b,"[4;15f","*",0x1b,"[6;26f","*",0x1b,"[7;15f","************ ",0x0a
	len5 equ $-msg5

	msg6 db 0x1b, "[8;15f","************ ",0x1b,"[9;15f","*",0x1b,"[9;26f","*",0x1b,"[10;15f","************ ",0x0a
	len6 equ $-msg6

	msg7 db 0x1b, "[2;28f","************ ",0x1b,"[3;28f","*",0x1b,"[3;39f","*",0x1b,"[4;28f","************ ",0x0a
	len7 equ $-msg7

	msg8 db 0x1b, "[5;28f","************ ",0x1b,"[4;28f","*",0x1b,"[6;39f","*",0x1b,"[7;28f","************ ",0x0a
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

	msg19 db "Rebote hacia arriba",0x0a
	len19 equ $-msg19

	msg20 db "Rebote Izquierdo",0x0a
	len20 equ $-msg20

	msg21 db "Rebote Derecho",0x0a
	len21 equ $-msg21

	msg22 db "Rebote Abajo",0x0a
	len22 equ $-msg22

	

	x1 dq 0
	x2 dq 0
	y1 dq 0
	y2 dq 0

section .text
	global _start       ;para el linker
_start:		            ;marca la entrada

    mov qword [x1], 0x45
    mov qword [y1], 0x30
	mov qword [x2], 0x34
	mov qword [y2], 0x34

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
    jp salir

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
	jp salir

comparacion3:

	cmp qword [y2],0x30
	je comparacion6
	jp salir

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
	jp salir
	
comparacion5:

	cmp qword [x1],0x30
	je comparacion15
	cmp qword [x1],0x31
	je comparacion16
	cmp qword [x1],0x32
	je comparacio17
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
	jp salir


comparacion6:

	cmp qword [x1],0x30
	je comparacion23
	cmp qword [x1],0x31
	je comparacion24
	cmp qword [x1],0x32
	je comparacion25
	cmp qword [x1],0x33
	je comparacion26
	cmp qword [x1],0x34
	je comparacion27
	cmp qword [x1],0x35
	je comparacion28
	cmp qword [x1],0x36
	je comparacion29
	cmp qword [x1],0x37
	je comparacion30
	jp salir

;---------------------------------------------------------- Final Comparaciones Iniciales ---------------------------------------------------------------


;---------------------------------------------------------- Inicio Comparaciones Fila 2,5,8 -------------------------------------------------------------
comparacion7:

	cmp qword [x2],0x30
	je salir
	cmp qword [x2],0x31
	je salir
	cmp qword [x2],0x32
	je esquina_SI
	jp verificacion_A

comparacion8:

	cmp qword [x2],0x33
	je esquina_SD
	cmp qword [x2],0x34
	je salir
	cmp qword [x2],0x35
	je esquina_SI
	jp verificacion_A
	

comparacion9:

	cmp qword [x2],0x36
	je esquina_SD
	cmp qword [x2],0x37
	je salir
	cmp qword [x2],0x38	
	je esquina_SI
	jp verificacion_A

comparacion10:

	cmp qword [x2],0x39
	je esquina_SD
	jp verificacion_A

comparacion11:

	cmp qword [x2],0x30
	je salir
	cmp qword [x2],0x31
	je esquina_SI
	jp verificacion_A
	

comparacion12:

	cmp qword [x2],0x32
	je esquina_SD
	cmp qword [x2],0x33
	je salir
	cmp qword [x2],0x34
	je esquina_SI
	jp verificacion_A

comparacion13:

	cmp qword [x2],0x35
	je esquina_SD
	cmp qword [x2],0x36
	je salir
	cmp qword [x2],0x37
	je esquina_SI
	jp verificacion_A

comparacion14:

	cmp qword [x2],0x38
	je esquina_SD
	cmp qword [x2],0x39
	je salir
	jp verificacion_A

;--------------------------------------------------------Final Comparaciones Fila 2,5,8-----------------------------------------------------------------


;--------------------------------------------------------Inicio Comparaciones Fila 3,6,9----------------------------------------------------------------
comparacion15:

	cmp qword [x2],0x32
	je verificacion_I
	jp salir

comparacion16:

	cmp qword [x2],0x33
	je verificacion_D
	cmp qword [x2],0x35
	je verificacion_I
	jp salir

comparacion17:

	cmp qword [x2],0x36
	je verificacion_D
	cmp qword [x2],0x38
	je verificacion_I
	jp salir

comparacion18:

	cmp qword [x2],0x39
	je verificacion_D
	jp salir

comparacion19:

	cmp qword [x2],0x31
	je verificacion_I
	jp salir

comparacion20:

	cmp qword [x2],0x32
	je verificacion_D
	cmp qword [x2],0x34
	je verificacion_I
	jp salir

comparacion21:

	cmp qword [x2],0x35
	je verificacion_D
	cmp qword [x2],0x37
	je verificacion_I
	jp salir

comparacion22:

	cmp qword [x2],0x38
	je verificacion_D
	jp salir

;--------------------------------------------------------Final Comparaciones Fila 3,6,9-----------------------------------------------------------------


;--------------------------------------------------------Inicio Comparaciones Fila 4,7,10---------------------------------------------------------------

comparacion23:

	cmp qword [x2],0x30
	je salir
	cmp qword [x2],0x31
	je salir
	cmp qword [x2],0x32
	je esquina_II
	jp verificacion_B

comparacion24:

	cmp qword [x2],0x33
	je esquina_ID
	cmp qword [x2],0x34
	je salir
	cmp qword [x2],0x35
	je esquina_II
	jp verificacion_B

comparacion25:

	cmp qword [x2],0x36
	je esquina_ID
	cmp qword [x2],0x37
	je salir
	cmp qword [x2],0x38	
	je esquina_II
	jp verificacion_B

comparacion26:

	cmp qword [x2],0x39
	je esquina_ID
	jp verificacion_B

comparacion27:

	cmp qword [x2],0x30
	je salir
	cmp qword [x2],0x31
	je esquina_II
	jp verificacion_B

comparacion28:

	cmp qword [x2],0x32
	je esquina_ID
	cmp qword [x2],0x33
	je salir
	cmp qword [x2],0x34
	je esquina_II
	jp verificacion_B

comparacion29:

	cmp qword [x2],0x35
	je esquina_ID
	cmp qword [x2],0x36
	je salir
	cmp qword [x2],0x37
	je esquina_II
	jp verificacion_B

comparacion30:

	cmp qword [x2],0x38
	je esquina_ID
	cmp qword [x2],0x39
	je salir
	jp verificacion_B

;--------------------------------------------------------Final Comparaciones Fila 4,7,10-----------------------------------------------------------------

Llamado_2:
   escribe msg19,len19

Llamado_3:
	escribe msg20,len20

Llamado_4:
	escribe msg21,len21
	
Llamado_1:
    escribe msg22,len22

esquina:
verificacion:
salir:
	limpiar


	







    

