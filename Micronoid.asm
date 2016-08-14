;Definicion de las macros para Micronoid

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

;Seccion de la definicion de las variables

;Parte en que se muestra la interfaz de la entrada al juego, se toman los datos del jugador, ademas de la interfaz de salida de juego


;--------------------------------Limpiar Pantalla --------------------------------------------------------------------------------
	escSeq db 27,"[2J"
	escLen equ 8 

;--------------------------------Pantalla de inicio--------------------------------------------------------------------------

	msg2 db  0x1b,"[2;1f",0x1b,"[47;37m","--------------------------------------------------------------------------------",0xA,0x1b,"[49;39m"	; [2;1 = y,x  , techo
	len2 equ $-msg2

	msg3 db 0x1b,"[23;1f",0x1b,"[47;37m","--------------------------------------------------------------------------------",0xA,0x1b,"[49;39m" ; suelo
	len3 equ $-msg3

	msg4 db 0x1b,"[9;5f",0x1b,"[49;37m","Nombre del jugador: ",0xA,0x1b,"[49;39m" ; nombre del jugador
	len4 equ $-msg4

	msg1 db 0x1b,"[5;5f",0x1b,"[49;37m","Bienvenidos a Micronoid",0xA,0x1b,"[49;39m" ; Bienvenida
	len1 equ $-msg1

;---------------------------------------Pantalla final---------------------------------------------------------------------	
	
	msg5 db 0x1b,"[5;5f",0x1b,"[49;37m","Felicidades has ganado ",0xA,0x1b,"[49;39m" ; gano
	len5 equ $-msg5

	msg6 db 0x1b,"[5;5f",0x1b,"[49;37m","Bienvenidos a Micronoid",0xA,0x1b,"[49;39m" ; perdio
	len6 equ $-msg6
	
	msg7 db 0x1b,"[10;5f",0x1b,"[49;37m","Integrantes:",0xA,0x1b,"[49;39m" ; integrantes
	len7 equ $-msg7

	msg8 db 0x1b,"[11;8f",0x1b,"[49;37m","Alenjandro Soto Ramirez	201244738",0xA,0x1b,"[49;39m" ; 1
	len8 equ $-msg8

	msg9 db 0x1b,"[12;8f",0x1b,"[49;37m","Allan Carmona Cruz",0xA,0x1b,"[49;39m" ; 2
	len9 equ $-msg9

	msg10 db 0x1b,"[13;8f",0x1b,"[49;37m","Jose Gabriel Carmona Rodriguez",0xA,0x1b,"[49;39m" ; 3
	len10 equ $-msg10

	msg11 db 0x1b,"[14;8f",0x1b,"[49;37m","Luis Alejandro Morales Pena",0xA,0x1b,"[49;39m" ; 4
	len11 equ $-msg11

	msg12 db 0x1b,"[15;8f",0x1b,"[49;37m","Marcos Loria Zuniga",0xA,0x1b,"[49;39m" ; 5
	len12 equ $-msg12

	msg13 db 0x1b,"[17;5f",0x1b,"[49;37m","Grupo 1",0xA,0x1b,"[49;39m" ; grupo
	len13 equ $-msg13

	msg14 db 0x1b,"[5;5f",0x1b,"[49;37m","Gracias por jugar Micronoid",0xA,0x1b,"[49;39m" ; final
	len14 equ $-msg14
;----------------------------------------Fin de la interfaz de entrada salida-----------------------

;------------------------------Definicion de variables pintado bloques----------------------------------

	msg15 db 0x1b, "[2;2f","************ ",0x1b,"[3;2f","*",0x1b,"[3;13f","*",0x1b,"[4;2f","************ ",0x0a
	len15 equ $-msg1

	msg16 db 0x1b, "[5;2f","************ ",0x1b,"[6;2f","*",0x1b,"[6;13f","*",0x1b,"[7;2f","************ ",0x0a
	len16 equ $-msg2

	msg17 db 0x1b, "[8;2f","************ ",0x1b,"[9;2f","*",0x1b,"[9;13f","*",0x1b,"[10;2f","************ ",0x0a
	len17 equ $-msg3

	msg18 db 0x1b, "[2;15f","************ ",0x1b,"[3;15f","*",0x1b,"[3;26f","*",0x1b,"[4;15f","************ ",0x0a
	len18 equ $-msg4

	msg19 db 0x1b, "[5;15f","************ ",0x1b,"[4;15f","*",0x1b,"[6;26f","*",0x1b,"[7;15f","************ ",0x0a
	len19 equ $-msg5

	msg20 db 0x1b, "[8;15f","************ ",0x1b,"[9;15f","*",0x1b,"[9;26f","*",0x1b,"[10;15f","************ ",0x0a
	len20 equ $-msg6

	msg21 db 0x1b, "[2;28f","************ ",0x1b,"[3;28f","*",0x1b,"[3;39f","*",0x1b,"[4;28f","************ ",0x0a
	len21 equ $-msg7

	msg22 db 0x1b, "[5;28f","************ ",0x1b,"[4;28f","*",0x1b,"[6;39f","*",0x1b,"[7;28f","************ ",0x0a
	len22 equ $-msg8

	msg23 db 0x1b, "[8;28f","************ ",0x1b,"[9;28f","*",0x1b,"[9;39f","*",0x1b,"[10;28f","************ ",0x0a
	len23 equ $-msg9

	msg24 db 0x1b, "[2;41f","************ ",0x1b,"[3;41f","*",0x1b,"[3;52f","*",0x1b,"[4;41f","************ ",0x0a
	len24 equ $-msg10

	msg25 db 0x1b, "[5;41f","************ ",0x1b,"[6;41f","*",0x1b,"[6;52f","*",0x1b,"[7;41f","************ ",0x0a
	len25 equ $-msg11

	msg26 db 0x1b, "[8;41f","************ ",0x1b,"[9;41f","*",0x1b,"[9;52f","*",0x1b,"[10;41f","************ ",0x0a
	len26 equ $-msg12

	msg27 db 0x1b, "[2;54f","************ ",0x1b,"[3;54f","*",0x1b,"[3;65f","*",0x1b,"[4;54f","************ ",0x0a
	len27 equ $-msg13

	msg28 db 0x1b, "[5;54f","************ ",0x1b,"[6;54f","*",0x1b,"[6;65f","*",0x1b,"[7;54f","************ ",0x0a
	len28 equ $-msg14

	msg29 db 0x1b, "[8;54f","************ ",0x1b,"[9;54f","*",0x1b,"[9;65f","*",0x1b,"[10;54f","************ ",0x0a
	len29 equ $-msg15

	msg30 db 0x1b, "[2;67f","************ ",0x1b,"[3;67f","*",0x1b,"[3;78f","*",0x1b,"[4;67f","************",0x0a
	len30 equ $-msg16

	msg31 db 0x1b, "[5;67f","************ ",0x1b,"[6;67f","*",0x1b,"[6;78f","*",0x1b,"[7;67f","************",0x0a
	len31 equ $-msg17

	msg32 db 0x1b, "[8;67f","************ ",0x1b,"[9;67f","*",0x1b,"[9;78f","*",0x1b,"[10;67f","************",0x0a
	len32 equ $-msg18

	msg33 db "Rebote hacia arriba",0x0a
	len33 equ $-msg19

	msg34 db "Rebote Izquierdo",0x0a
	len34 equ $-msg20

	msg35 db "Rebote Derecho",0x0a
	len35 equ $-msg21

	msg36 db "Rebote Abajo",0x0a
	len36 equ $-msg22

	x1 dq 0
	x2 dq 0
	y1 dq 0
	y2 dq 0

;------------------------------Fin de pintado de bloques-------------------------------------------------



;-----------------------------Variables para la interfaz entrada salida------------------------------
segment .bss
	;res resb 2
	num resb 20

;-----------------------------Secmento para el codigo del programa------------------------------------

segment .text

;--------------------------Funciones para la interfaz entrada salida de la pantalla-----------------------------------
leetecla:
	mov eax, 3
	mov ebx, 0
	mov edx, 2
	int 0x80
	ret

limpiapantalla:
	mov rax, 4
	mov rbx, 1
	mov rcx, escSeq
	mov rdx, escLen
	int 80h
	jmp final
;---------------------------Fin de funciones para interfaz entrada salida de la pantalla--------------------------------

global _start

_start:

;---------------------------------------Menu de Bienvenida--------------------------------------------------
	escribe msg2, len2		; techo
	escribe msg3, len3		; piso
	escribe msg1, len1		; Bienvenida
	escribe msg4, len4		; nombre jugador

	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 20
	int 0x80

	call limpiapantalla
	;escribe num, 20
;-------------------------------Fin del Menu de Bienvenida-------------------------------------------

;-------------------------------Inicio Pintado de los Bloques----------------------------------------

    escribe msg15,len15
    escribe msg16,len16
    escribe msg17,len17
    escribe msg18,len18
    escribe msg19,len19
    escribe msg20,len20
    escribe msg21,len21
    escribe msg22,len22
    escribe msg23,len23
    escribe msg24,len24
    escribe msg25,len25
    escribe msg26,len26
    escribe msg27,len27
    escribe msg28,len28
    escribe msg29,len29
    escribe msg30,len30
    escribe msg31,len31
    escribe msg32,len32
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
   escribe msg33,len33

Llamado_3:
	escribe msg34,len34

Llamado_4:
	escribe msg35,len35
	
Llamado_1:
    escribe msg36,len36


;-------------------------------Fin del pintado de los bloques---------------------------------------

;--------------------------------------Menu de salida------------------------------------------------
final:
	escribe msg2, len2		; techo
	escribe msg3, len3		; piso
	escribe msg14, len14		; final
	escribe msg7, len7		; integrantes
	escribe msg8, len8		; 1
	escribe msg9, len9		; 2
	escribe msg10, len10		; 3
	escribe msg11, len11		; 4
	escribe msg12, len12		; 5
	escribe msg13, len13		; grupo

;--------------------------------------Fin del menu de salida--------------------------------------








;----------------------------------salir del juego-------------------------------------------------- 
salir:
	 mov eax, 1
	 mov ebx, 0
	 int 0x80