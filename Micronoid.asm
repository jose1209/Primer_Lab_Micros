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



;-----------------------------Variables para la interfaz entrada salida------------------------------
segment .bss
	res resb 2
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