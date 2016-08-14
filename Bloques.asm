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
    mov qword [x1], 0x45
    mov qword [y1], 0x30
	mov qword [x2], 0x34
	mov qword [y2], 0x34

comparacion_1:

	cmp qword [y1],0x30
	je comparacion_2
	cmp qword [y1],0x31
	je comparacion_2
    limpiar ;Hay que cambiarlo a no haga nada al unirlo

comparacion_2:
	
	cmp qword [y2],0x34
	je comparacion_3
	cmp qword [y2],0x35
	je comparacion_4
	cmp qword [y2],0x36
	je comparacion_5
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar

comparacion_3:
	cmp qword [x1],0x32
	je Llamado_1
	cmp qword [x1],0x33
	je comparacion_6
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar

comparacion_4:
	cmp qword [x1],0x32
	je comparacion_7
	cmp qword [x1],0x33
	je comparacion_8
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar

comparacion_5:
	cmp qword [x1],0x32
	je Llamado_4
	cmp qword [x1],0x33
	je comparacion_9
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar

comparacion_6:
	cmp qword [x2],0x30
	je Llamado_1
	cmp qword [x2],0x31
	je Llamado_1
	cmp qword [x2],0x32
	je Llamado_1
	cmp qword [x2],0x33
	je Llamado_1
	cmp qword [x2],0x34
	je Llamado_1
	cmp qword [x2],0x35
	je Llamado_1
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar


comparacion_7:
	cmp qword [x2],0x30
	je Llamado_2
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar


comparacion_8:
	cmp qword [x2],0x35
	je Llamado_3
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar


comparacion_9:
	cmp qword [x2],0x30
	je Llamado_4
	cmp qword [x2],0x31
	je Llamado_4
	cmp qword [x2],0x32
	je Llamado_4
	cmp qword [x2],0x33
	je Llamado_4
	cmp qword [x2],0x34
	je Llamado_4
	cmp qword [x2],0x35
	je Llamado_4
	;Si no hay ninguna condicion que se cumpla que no haga nada 
	limpiar


Llamado_2:
   escribe msg19,len19

Llamado_3:
	escribe msg20,len20

Llamado_4:
	escribe msg21,len21
	
Llamado_1:
    escribe msg22,len22




limpiar