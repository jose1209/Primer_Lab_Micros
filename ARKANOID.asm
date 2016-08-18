%macro escribe 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

section .data

timeval:
    tv_sec  dd 0
    tv_usec dd 0

x1 dq 0
x2 dq 0
y1 dq 0
y2 dq 0
d0 dq 0
v dq 3
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

p1 dq 0		;variable plataforma izquierda decena 
p2 dq 0		;variable plataforma izquierda unidad
p3 dq 0		;variable plataforma derecha decena
p4 dq 0		;variable plataforma derecha unidad

tecla_derecha dq 0       ;contador tecla derecha 
tecla_izquierda dq 0	 ;contador tecla izquierda
;variables para almacenar cuantas veces se mueve la plataforma	
	borra db 0x1b,"[2J"
	len42 equ $-borra

barra db  0x1b,"[19;40f","************"		;variable de la plataforma a imprimir
	len43 equ $-barra

tecla dq 0	;variable para recibir datos de teclado

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

	bola1 db 0x1b,"[00;00f","*"
	len41 equ $-bola1




	cursor db  0x1b,"[?25l"		;escape code para esconder el cursor
	len44 equ $-cursor





termios:        times 36 db 0									;Estructura de 36bytes que contiene el modo de operacion de la consola
stdin:          	  equ 0												;Standard Input (se usa stdin en lugar de escribir manualmente los valores)
ICANON:      equ 1<<1											;ICANON: Valor de control para encender/apagar el modo canonico
ECHO:           equ 1<<3 
VMIN:      equ 0											;ICANON: Valor de control para encender/apagar el modo canonico
VTIME:           equ 0    											;ECHO: Valor de control para encender/apagar el modo de eco

vmin_on:

call read_stdin_termios

        ;Se escribe el nuevo valor de modo Canonico
       and dword [termios+19], 0
       ;or dword [termios+19], VMIN
	;Se escribe la nueva configuracion de TERMIOS
        call write_stdin_termios
        ret


    
vtime_on:

call read_stdin_termios

        ;Se escribe el nuevo valor de modo Canonico
        and dword [termios+20], 0
        or dword [termios+20], VTIME

	;Se escribe la nueva configuracion de TERMIOS
        call write_stdin_termios
        ret
canonical_off:

	;Se llama a la funcion que lee el estado actual del TERMIOS en STDIN
	;TERMIOS son los parametros de configuracion que usa Linux para STDIN
        call read_stdin_termios

	;Se escribe el nuevo valor de ICANON en EAX, para apagar el modo canonico
        push rax
        mov eax, ICANON
        not eax
        and [termios+12], eax
        pop rax

	;Se escribe la nueva configuracion de TERMIOS
        call write_stdin_termios
        ret
        ;Final de la funcion
;###################################################


;####################################################
;echo_off
;Esta es una funcion que sirve para apagar el modo echo en Linux
;Cuando el modo echo se apaga, Linux NO muestra en la pantalla la tecla que
;se acaba de presionar.
;
;Para apagar el modo echo, simplemente use: call echo_off
;###################################################
echo_off:

	;Se llama a la funcion que lee el estado actual del TERMIOS en STDIN
	;TERMIOS son los parametros de configuracion que usa Linux para STDIN
        call read_stdin_termios

        ;Se escribe el nuevo valor de ECHO en EAX para apagar el echo
        push rax
        mov eax, ECHO
        not eax
        and [termios+12], eax
        pop rax

	;Se escribe la nueva configuracion de TERMIOS
        call write_stdin_termios
        ret
        ;Final de la funcion
;###################################################


;####################################################
;canonical_on
;Esta es una funcion que sirve para encender el modo canonico en Linux
;Cuando el modo canonico se enciende, Linux espera un ENTER para
;procesar lo que se captura desde el teclado
;
;Para encender el modo canonico, simplemente use: call canonical_on
;###################################################
canonical_on:

	;Se llama a la funcion que lee el estado actual del TERMIOS en STDIN
	;TERMIOS son los parametros de configuracion que usa Linux para STDIN
        call read_stdin_termios

        ;Se escribe el nuevo valor de modo Canonico
        or dword [termios+12], ICANON

	;Se escribe la nueva configuracion de TERMIOS
        call write_stdin_termios
        ret
        ;Final de la funcion
;###################################################


;####################################################
;echo_on
;Esta es una funcion que sirve para encender el echo en Linux
;Cuando el echo se enciende, Linux muestra en la pantalla (stdout) cada tecla
;que se recibe del teclado (stdin)
;
;Para encender el modo echo, simplemente use: call echo_on
;###################################################
echo_on:

	;Se llama a la funcion que lee el estado actual del TERMIOS en STDIN
	;TERMIOS son los parametros de configuracion que usa Linux para STDIN
        call read_stdin_termios

        ;Se escribe el nuevo valor de modo echo
        or dword [termios+12], ECHO

	;Se escribe la nueva configuracion de TERMIOS
        call write_stdin_termios
        ret
        ;Final de la funcion
;###################################################


;####################################################
;read_stdin_termios
;Esta es una funcion que sirve para leer la configuracion actual del stdin o 
;teclado directamente de Linux
;Esta configuracion se conoce como TERMIOS (Terminal Input/Output Settings)
;Los valores del stdin se cargan con EAX=36h y llamada a la interrupcion 80h
;
;Para utilizarlo, simplemente se usa: call read_stdin_termios
;###################################################
read_stdin_termios:
        push rax
        push rbx
        push rcx
        push rdx

        mov eax, 36h
        mov ebx, stdin
        mov ecx, 5401h
        mov edx, termios
        int 80h

        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret
        ;Final de la funcion
;###################################################


;####################################################
;write_stdin_termios
;Esta es una funcion que sirve para escribir la configuracion actual del stdin o 
;teclado directamente de Linux
;Esta configuracion se conoce como TERMIOS (Terminal Input/Output Settings)
;Los valores del stdin se cargan con EAX=36h y llamada a la interrupcion 80h
;
;Para utilizarlo, simplemente se usa: call write_stdin_termios
;###################################################
write_stdin_termios:
        push rax
        push rbx
        push rcx
        push rdx

        mov eax, 36h
        mov ebx, stdin
        mov ecx, 5402h
        mov edx, termios
        int 80h

        pop rdx
        pop rcx
        pop rbx
        pop rax
        ret
        ;Final de la funcion
;###################################################

section .text
global _start




;---------------------------Principal-----------------------------------------
_start:
escribe cursor,len44	;se esconde el cursor	; 

call canonical_off  ;se llama a la funcion para apagar el modo canonico
call echo_off; se apaga el echo
call vmin_on
call vtime_on
mov qword [x1], 0x34 ; x1
mov qword [y1], 0x31 ; y1, ahí está totalemente abajo
mov qword [x2], 0x38 ; x2
mov qword [y2], 0x39 ; y2
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
mov qword [p1], 0x34	 
mov qword [p2], 0x30
mov qword [p3], 0x35
mov qword [p4], 0x31

mov qword [tecla_derecha], 0x00
mov qword [tecla_izquierda],0x00
mov qword [tecla],0x00

call limpiar_pantalla
call posicion_cambio
call disparo_inicio
jmp final
;-----------------------------------------------------------------------------







;---------------------------dibujar elemento----------------------------------
posicion_cambio:
mov r8, 0x1b;0x1b
mov [bola1 + 0x00], r8
mov r8, 0x5b;[
mov [bola1 + 0x01], r8
mov r8, [y1];y1
mov [bola1 + 0x02], r8
mov r8, [y2];y2
mov [bola1 + 0x03], r8
mov r8, 0x3b;;
mov [bola1 + 0x04], r8
mov r8, [x1];x1
mov [bola1 + 0x05], r8
mov r8, [x2];x2
mov [bola1 + 0x06], r8
mov r8, 0x66;f
mov [bola1 + 0x07], r8
mov r8, 0x2a;*
mov [bola1 + 0x08], r8
escribe bola1, len41
call inicio
call delay
call limpiar_pantalla
call escribir_bloque
ret
;-----------------------------------------------------------------------------

inicio:
call barra_cambio
jmp leer_tecla
;-----------------------------------------------------------------------------


leer_tecla:

	mov rax,0							;rax = "sys_read"
	mov rdi,0							;rdi = 0 (standard input = teclado)
	mov rsi,tecla					;rsi = direccion de memoria donde se almacena la tecla capturada
	mov rdx,1							;rdx=1 (cuantos eventos o teclazos capturar)
	syscall							;Llamar al sistem

;mov eax, 3
;mov ebx, 1
;mov ecx, tecla
;mov edx, 1
;syscall
;call limpiar_pantalla
;escribe tecla,1
;call delay 
jmp contadores_tecla
;call delay
;call limpiar_pantalla
;escribe tecla,1
;call delay
contadores_tecla:

mov r13,0x63
mov r14,qword[tecla]
cmp r14,r13
je aumento_derecha
mov r13,0x7A
mov r14,qword[tecla]
cmp r14,r13
je aumento_izquierda
jmp plataforma

aumento_derecha:
;call limpiar_pantalla
mov r13,0x00
mov qword[tecla],r13
mov r13,0x01
add qword [tecla_derecha], r13
jmp plataforma 

aumento_izquierda:
;call limpiar_pantalla
mov r13,0x00
mov qword[tecla],r13
mov r13,0x01
add qword [tecla_izquierda], r13
jmp plataforma 




;---------------------------Dibujar elemento----------------------------------
barra_cambio:
mov r8, 0x1b;0x1b
mov [barra + 0x00], r8
mov r8, 0x5b;[
mov [barra + 0x01], r8
mov r8, 0x31;y1
mov [barra + 0x02], r8
mov r8, 0x39;y2
mov [barra + 0x03], r8
mov r8, 0x3b;;
mov [barra + 0x04], r8
mov r8, [p1];x1
mov [barra + 0x05], r8
mov r8, [p2];x2
mov [barra + 0x06], r8
mov r8, 0x66;f
mov [barra + 0x07], r8
mov r8, 0x2a;*
mov [barra + 0x08], r8
mov r8, 0x2a;*o
mov [barra + 0x09], r8
mov r8, 0x2a;*
mov [barra + 0x0A], r8
mov r8, 0x2a;*
mov [barra + 0x0B], r8
mov r8, 0x2a;*
mov [barra + 0x0C], r8
mov r8, 0x2a;*
mov [barra + 0x0D], r8
mov r8, 0x2a;*
mov [barra + 0x0E], r8
mov r8, 0x2a;*
mov [barra + 0x0F], r8
mov r8, 0x2a;*
mov [barra + 0x10], r8
mov r8, 0x2a;*
mov [barra + 0x11], r8
mov r8, 0x2a;*
mov [barra + 0x12], r8
mov r8, 0x2a;*
mov [barra + 0x13], r8
escribe barra, len43
;call delay
;call limpiar_pantalla
ret
;-----------------------------------------------------------------------------



;---------------------------plataforma----------------------------------
plataforma:
mov r13,0x00
cmp qword[tecla_derecha],r13
jne plataforma_derecha
cmp qword[tecla_izquierda],r13
jne plataforma_izquierda
;escribe barra,len3
;escribe borra,len2
;call delay
;jmp inicio 
ret
;-----------------------------------------------------------------------------

plataforma_derecha:
mov r13,0x01
sub qword[tecla_derecha],r13
mov r13, 0x36
cmp qword [p1], r13
je plataforma_limite_derecho
jmp plataforma_suma_unidad

plataforma_limite_derecho:
mov r13, 0x38
cmp qword [p2], r13
je inicio
jmp plataforma_suma_unidad

plataforma_suma_unidad:

mov r13, 0x39
cmp qword [p2], r13
je  plataforma_suma_decena
mov r13,0x01
add qword [p2], r13
;call barra_cambio
;jmp inicio
jmp suma_unidad

plataforma_suma_decena:
mov r13,0x09
mov r10,0x01
add qword [p1], r10
sub qword [p2], r13
;call barra_cambio
;jmp inicio
jmp suma_unidad

suma_unidad:  ;unidad borde derecho
mov r13, 0x39
cmp qword [p4], r13
je  suma_decena
mov r13,0x01
add qword [p4], r13
call barra_cambio
ret

suma_decena:			;unidad borde izquierdo
mov r13,0x09
mov r10,0x01
add qword [p3], r10
sub qword [p4], r13
call barra_cambio
ret
;_____________________________________________________________________________

plataforma_izquierda:
mov r13,0x01
sub qword[tecla_izquierda],r13
mov r13, 0x30
cmp qword [p1], r13
je plataforma_limite_izquierdo
jmp plataforma_resta_unidad

plataforma_limite_izquierdo:
mov r13, 0x32
cmp qword [p2], r13
je inicio
jmp plataforma_resta_unidad

plataforma_resta_unidad:

mov r13, 0x30
cmp qword [p2], r13
je  plataforma_resta_decena
mov r13,0x01
sub qword [p2], r13
;call barra_cambio
;jmp inicio
jmp resta_unidad

plataforma_resta_decena:
mov r13,0x09
mov r10,0x01
sub qword [p1], r10
add qword [p2], r13
;call barra_cambio
;jmp inicio 
jmp resta_unidad

resta_unidad:
mov r13, 0x30
cmp qword [p4], r13
je  resta_decena
mov r13,0x01
sub qword [p4], r13
call barra_cambio
ret

resta_decena:
mov r13,0x09
mov r10,0x01
sub qword [p3], r10
add qword [p4], r13
call barra_cambio
ret 

;-------------------------------------------------------------------

escribir_bloque:

cmp qword [b1],0x30
je bloque1
cmp qword [b2],0x30
je bloque2
cmp qword [b3],0x30
je bloque3
cmp qword [b4],0x30
je bloque4
cmp qword [b5],0x30
je bloque5
cmp qword [b6],0x30
je bloque6
cmp qword [b7],0x30
je bloque7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque1:
escribe msg1,len1
cmp qword [b2],0x30
je bloque2
cmp qword [b3],0x30
je bloque3
cmp qword [b4],0x30
je bloque4
cmp qword [b5],0x30
je bloque5
cmp qword [b6],0x30
je bloque6
cmp qword [b7],0x30
je bloque7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque2:
escribe msg2,len2
cmp qword [b3],0x30
je bloque3
cmp qword [b4],0x30
je bloque4
cmp qword [b5],0x30
je bloque5
cmp qword [b6],0x30
je bloque6
cmp qword [b7],0x30
je bloque7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque3:
escribe msg3,len3
cmp qword [b4],0x30
je bloque4
cmp qword [b5],0x30
je bloque5
cmp qword [b6],0x30
je bloque6
cmp qword [b7],0x30
je bloque7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque4:
escribe msg4,len4
cmp qword [b5],0x30
je bloque5
cmp qword [b6],0x30
je bloque6
cmp qword [b7],0x30
je bloque7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque5:
escribe msg5,len5
cmp qword [b6],0x30
je bloque6
cmp qword [b7],0x30
je bloque7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque6:
escribe msg6,len6
cmp qword [b7],0x30
je bloque7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret


bloque7:
escribe msg7,len7
cmp qword [b8],0x30
je bloque8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque8:
escribe msg8,len8
cmp qword [b9],0x30
je bloque9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque9:
escribe msg9,len9
cmp qword [b10],0x30
je bloque10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque10:
escribe msg10,len10
cmp qword [b11],0x30
je bloque11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque11:
escribe msg11,len11
cmp qword [b12],0x30
je bloque12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque12:
escribe msg12,len12
cmp qword [b13],0x30
je bloque13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret


bloque13:
escribe msg13,len13
cmp qword [b14],0x30
je bloque14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque14:
escribe msg14,len14
cmp qword [b15],0x30
je bloque15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque15:
escribe msg15,len15
cmp qword [b16],0x30
je bloque16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque16:
escribe msg16,len16
cmp qword [b17],0x30
je bloque17
cmp qword [b18],0x30
je bloque18
ret

bloque17:
escribe msg17,len17
cmp qword [b18],0x30
je bloque18
ret

bloque18:
escribe msg18,len18
ret

;---------------------------direccion-----------------------------------------
direccion:
call inicio

mov r15, 0x11
cmp qword [d0], r15 ; 
je arriba_i

mov r15, 0x12
cmp qword [d0], r15 ; 
je arriba_d

mov r15, 0x13
cmp qword [d0], r15 ; 
je abajo_d

mov r15, 0x14
cmp qword [d0], r15 ; 
je abajo_i

jmp final
;-----------------------------------------------------------------------------








;---------------------------disparo aleatorio---------------------------------
disparo_inicio:

rdtsc
xor eax, edx
mov ebx, eax        ; the seed is in ebx
mov esi, 2
mov ecx, 50
add ebx, $811C9DC5  ; prime 1
imul ebx, $01000193  ; prime 2
mov eax, ebx
xor edx, edx
div esi         ; make it from 0 to 1
mov edi,0
cmp edx,edi
jz iz
jnz der
ret

iz:
mov qword [d0], 0x11
call y1_1
jmp direccion

der:
mov qword [d0], 0x12
call y1_1
jmp direccion



y1_1:
mov qword [y1], 0x31 
jmp loop_2

loop_2:

rdtsc
xor eax, edx
mov ebx, eax        ; the seed is in ebx
mov esi, 10
mov ecx, 50
add ebx, $811C9DC5  ; prime 1
imul ebx, $01000193  ; prime 2
mov eax, ebx
xor edx, edx
div esi         ; make it from 0 to 9
jmp y2_

y2_:
mov edi,0
cmp edx,edi
je y2_0

mov edi,1
cmp edx,edi
je y2_1

mov edi,2
cmp edx,edi
je y2_2

mov edi,3
cmp edx,edi
je y2_3

mov edi,4
cmp edx,edi
je y2_4

mov edi,5
cmp edx,edi
je y2_5

mov edi,6
cmp edx,edi
je y2_6

mov edi,7
cmp edx,edi
je y2_7

mov edi,8
cmp edx,edi
je y2_8

mov edi,9
cmp edx,edi
je y2_9

jmp final


y2_0:
mov qword [y2], 0x30 ; y2
jmp direccion

y2_1:
mov qword [y2], 0x31 ; y2
jmp direccion

y2_2:
mov qword [y2], 0x32 ; y2
jmp direccion

y2_3:
mov qword [y2], 0x33 ; y2
jmp direccion

y2_4:
mov qword [y2], 0x34 ; y2
jmp direccion

y2_5:
mov qword [y2], 0x35 ; y2
jmp direccion

y2_6:
mov qword [y2], 0x36 ; y2
jmp direccion

y2_7:
mov qword [y2], 0x37 ; y2
jmp direccion

y2_8:
mov qword [y2], 0x38 ; y2
jmp direccion

y2_9:
mov qword [y2], 0x39 ; y2
jmp direccion
;-----------------------------------------------------------------------------






;---------------------------movimiento superior izquierdo---------------------
arriba_i: 
mov qword [d0], 0x11 ; 
call buffer
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp arriba_i
ret

buffer:
mov r13, 0x30
cmp qword [x2],r13
je cero1
call resta1
mov r13, 0x30
cmp qword [y2],r13
je cero2
call resta3
ret

cero1:
mov r13, 0x30
cmp qword [x1],r13
je rebotar_RU
call resta2
mov qword [x2], 0x39 ; x1
jmp buff_1

cero2:
mov r13, 0x30
cmp qword [y1],r13
je rebotar_LD
call resta4
mov qword [y2], 0x39 ; x1
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

buff_1:
mov r13, 0x30
cmp qword [y2],r13
je cero2
call resta3
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion


resta1:
mov r10,0x01
sub qword [x2], r10
ret
resta2:
mov r10,0x01
sub qword [x1], r10
ret
resta3:
mov r10,0x01
sub qword [y2], r10
ret
resta4:
mov r10,0x01
sub qword [y1], r10
ret
;-----------------------------------------------------------------------------








;---------------------------movimiento inferior Derecho-----------------------
abajo_d: 
mov qword [d0], 0x13 ;
call buffer2
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp abajo_d 
ret

buffer2:
mov r13, 0x39
cmp qword [x2],r13
je cero1_;si x2 es 9
call suma1; es el caso en el que x2 no es 9
mov r13, 0x39
cmp qword [y2],r13; es el caso en el que x2 no es 9
je cero2_
call suma3
ret

cero1_:;para x2 9
mov r13, 0x37
cmp qword [x1],r13;pregunto si x1 es 7
je rebotar_LD; si esto pasa es que estoy en una posicion de y cualquiera excepto 19, y debo rebotar en la pared
call suma2; caso en que no se esta en el borde
mov qword [x2], 0x30 ; x2 lo pone en cero
jmp buff_2;actualizo y

cero2_:;si y2 es 9, esto es el piso o no
mov r13, 0x31
cmp qword [y1],r13;pregunto si estoy en el piso
je rebotar_barra;preguntar si esta la barra acá   (rebotar_RU)
call suma4
mov qword [y2], 0x30 ; x1
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

buff_2:
mov r13, 0x39
cmp qword [y2],r13;pregunta si y2 es 9
je cero2_
call suma3; suma y2 en una unidad
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion


suma1:
mov r10,0x01
add qword [x2], r10
ret
suma2:
mov r10,0x01
add qword [x1], r10
ret
suma3:
mov r10,0x01
add qword [y2], r10
ret
suma4:
mov r10,0x01
add qword [y1], r10
ret
;-----------------------------------------------------------------------------
rebotar_barra:
;preguntar si barra esta aca ?

mov r12, 0x13;derecha abajo
cmp qword [d0], r12 ; 
je barra_lugar1;rebotar_RU

mov r12, 0x14;izquierda abajo
cmp qword [d0], r12 ; 
je barra_lugar2;rebotar_LU

jmp direccion


barra_lugar1:
mov r14,qword [x1]
cmp qword [p1],r14
jle decena_2
jmp resta_vidas


decena_2:
mov r14,qword [x1]
cmp qword [p3],r14
jge rebotar_RU
jmp resta_vidas



barra_lugar2:
mov r14,qword [x1]
cmp qword [p1],r14
jle decena_4
jmp resta_vidas



decena_4:
mov r14,qword [x1]
cmp qword [p3],r14
jge rebotar_LU
jmp resta_vidas





;---------------------------movimiento inferior izquierdo---------------------

abajo_i: 
mov qword [d0], 0x14 ;
call buffer3
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp abajo_i 
ret

buffer3:
mov r13, 0x30
cmp qword [x2],r13
je cero_1
call resta1; es el caso en el que x2 no es 0
mov r13, 0x39
cmp qword [y2],r13; es el caso en el que x2 no es 9
je cero22_
call suma3
ret

cero_1:
mov r13, 0x30
cmp qword [x1],r13
je rebotar_RD
call resta2
mov qword [x2], 0x39 ; x1
jmp buff_22

cero22_:
mov r13, 0x31
cmp qword [y1],r13
je rebotar_barra;rebotar_LU
call suma4
mov qword [y2], 0x30 ; x1
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

buff_22:
mov r13, 0x39
cmp qword [y2],r13
je cero22_
call suma3; suma y2 en una unidad
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion
;-----------------------------------------------------------------------------







;---------------------------movimiento superior derecho-----------------------
arriba_d:
mov qword [d0], 0x12 ;
call buffer4
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp arriba_d
ret

buffer4:
mov r13, 0x39
cmp qword [x2],r13
je cero_2
call suma1; es el caso en el que x2 no es 9
mov r13, 0x30
cmp qword [y2],r13
je cero22
call resta3
ret

cero_2:
mov r13, 0x37
cmp qword [x1],r13
je rebotar_LU
call suma2; caso en que no se esta en el borde
mov qword [x2], 0x30 ; x2 lo pone en cero
jmp buff_11

cero22:
mov r13, 0x30
cmp qword [y1],r13
je rebotar_RD
call resta4
mov qword [y2], 0x39 ; x1
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

buff_11:
mov r13, 0x30
cmp qword [y2],r13
je cero22
call resta3
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion
;-----------------------------------------------------------------------------









;---------------------------Rebotes LD, LU, RD, RU----------------------------
rebotar_LD:
mov qword [d0], 0x14 ;movimiento abajo a la izquierda
mov r13, 0x39
cmp qword [y2],r13; pregunta si y2 es 9, por si hay que cambiar la unidad
je cero22_; en caso de que y2 sea nueve se pone a y2 en cero y se le resta a x
call suma3; le sumo una unidad a y2 ya que se que no es 9
mov r13, 0x30
cmp qword [x2],r13; pregunto si x2 vale cero, porque a el le resto
je h1; si x2 es cero brinco a h1 para decrementar la decena y poner a x2 en 9
call resta1; es el caso en el que x2 no es 0
jmp direccion

rebotar_LU:;movimiento arriba a la izquierda
mov qword [d0], 0x11 ;
mov r13, 0x30
cmp qword [x2],r13; pregunta si x2 es 0, por si hay que cambiar la unidad
je cero_1; en caso de que x2 sea 0 se pone a x2 en 9 y se le resta a y
call resta1; le resto una unidad a x2 ya que se que no es 0
mov r13, 0x30
cmp qword [y2],r13; pregunto si y2 vale cero, porque a el le resto
je h0; si y2 es cero brinco a h0 para decrementar la decena y poner a y2 en 9
call resta3; es el caso en el que y2 no es 0
jmp direccion

rebotar_RD:
mov qword [d0], 0x13
mov r13, 0x39
cmp qword [x2],r13
je cero_2
call suma1
cmp qword [y2], 0x39 ; x1
je h2
call suma3
jmp direccion

rebotar_RU:
mov qword [d0], 0x12 
mov r13, 0x30
cmp qword [y2],r13
je cero2
call resta3
mov r13, 0x39
cmp qword [x2],r13
je h3
call suma1; es el caso en el que x2 no es 9
jmp direccion

h0:; si y2 es cero brinco a h0 para decrementar la decena y poner a y2 en 9
mov r13, 0x30
cmp qword [y1],r13; pregunto si estoy en una esquina , 0.0
je rebotar_RD; si estoy en esos ptos me devuelvo en la misma direccion que venia, me voy hacia arriba derecha
call resta4
mov qword [y2], 0x39 ; x1
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

h1:; si x2 es cero brinco a h1 para decrementar la decena y poner a x2 en 9
mov r13, 0x30
cmp qword [x1],r13; pregunto si estoy en una esquina , 0.0, 19
je rebotar_RU; si estoy en esos ptos me devuelvo en la misma direccion que venia, me voy hacia arriba derecha
call resta2
mov qword [x2], 0x39 ; x1
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

h2:
mov r13, 0x31
cmp qword [y1],r13
je rebotar_LU
call suma4
mov qword [y2], 0x30 ; x1
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

h3:
mov r13, 0x37
cmp qword [x1],r13
je rebotar_LD
call suma2; caso en que no se esta en el borde
mov qword [x2], 0x30 ; x2 lo pone en cero
;call verificacion_bloques
call posicion_cambio
call verificacion_bloques
jmp direccion

;-----------------------------------------------------------------------------








;---------------------------Rebotes bloques y barrera-------------------------

R_bloque_D: ;costado derecho del bloque
mov r12, 0x11;izquierda arriba
cmp qword [d0], r12 ; 
je rebotar_RU

mov r12, 0x14;izquierda abajo
cmp qword [d0], r12 ; 
je rebotar_RD

jmp direccion

R_bloque_I: ;costado izquierdo del bloque
mov r12, 0x12;derecha arriba
cmp qword [d0], r12 ; 
je rebotar_LU

mov r12, 0x13;derecha abajo
cmp qword [d0], r12 ; 
je rebotar_LD

jmp direccion

R_bloque_Arriba: ;costado superior del bloque
mov r12, 0x13;derecha abajo
cmp qword [d0], r12 ; 
je rebotar_RU

mov r12, 0x14;izquierda abajo
cmp qword [d0], r12 ; 
je rebotar_LU

jmp direccion

R_bloque_Abajo: ;costado superior del bloque
mov r12, 0x12;derecha arriba
cmp qword [d0], r12 ; 
je rebotar_RD

mov r12, 0x11;izquierda arriba
cmp qword [d0], r12 ; 
je rebotar_LD

jmp direccion

;-----------------------------------------------------------------------------






;---------------------------eliminar vida--------------------------------------
resta_vidas:
mov r9,1
sub qword [v],r9
mov r9,0
cmp qword [v], r9;
je perdio_juego
mov r13,0x00
mov qword[tecla_derecha],r13
mov qword[tecla_izquierda],r13
jmp _start
;-----------------------------------------------------------------------------
perdio_juego:
jmp final 


verificacion_bloques:

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
	jmp borrarb1A
	

bloque_2A:

	cmp qword [b2],0x31
	je salir
	jmp borrarb2A

bloque_3A:

	cmp qword [b3],0x31
	je salir
	jmp borrarb3A

bloque_4A:

	cmp qword [b4],0x31
	je salir
	jmp borrarb4A

bloque_5A:

	cmp qword [b5],0x31
	je salir
	jmp borrarb5A

bloque_6A:

	cmp qword [b6],0x31
	je salir
	jmp borrarb6A

bloque_7A:

	cmp qword [b7],0x31
	je salir
	jmp borrarb7A

bloque_8A:

	cmp qword [b8],0x31
	je salir
	jmp borrarb8A

bloque_9A:

	cmp qword [b9],0x31
	je salir
	jmp borrarb9A

bloque_10A:

	cmp qword [b10],0x31
	je salir
	jmp borrarb10A

bloque_11A:

	cmp qword [b11],0x31
	je salir
	jmp borrarb11A

bloque_12A:

	cmp qword [b12],0x31
	je salir
	jmp borrarb12A

bloque_13A:

	cmp qword [b13],0x31
	je salir
	jmp borrarb13A

bloque_14A:

	cmp qword [b14],0x31
	je salir
	jmp borrarb14A

bloque_15A:

	cmp qword [b15],0x31
	je salir
	jmp borrarb15A

bloque_16A:

	cmp qword [b16],0x31
	je salir
	jmp borrarb16A

bloque_17A:

	cmp qword [b17],0x31
	je salir
	jmp borrarb17A

bloque_18A:

	cmp qword [b18],0x31
	je salir
	jmp borrarb18A

bloque_1B:
	
	cmp qword [b1],0x31
	je salir
	jmp borrarb1B


bloque_2B:

	cmp qword [b2],0x31
	je salir
	jmp borrarb2B

bloque_3B:

	cmp qword [b3],0x31
	je salir
	jmp borrarb3B

bloque_4B:

	cmp qword [b4],0x31
	je salir
	jmp borrarb4B

bloque_5B:

	cmp qword [b5],0x31
	je salir
	jmp borrarb5B

bloque_6B:

	cmp qword [b6],0x31
	je salir
	jmp borrarb6B

bloque_7B:

	cmp qword [b7],0x31
	je salir
	jmp borrarb7B

bloque_8B:

	cmp qword [b8],0x31
	je salir
	jmp borrarb8B

bloque_9B:

	cmp qword [b9],0x31
	je salir
	jmp borrarb9B

bloque_10B:

	cmp qword [b10],0x31
	je salir
	jmp borrarb10B

bloque_11B:

	cmp qword [b11],0x31
	je salir
	jmp borrarb11B

bloque_12B:

	cmp qword [b12],0x31
	je salir
	jmp borrarb12B

bloque_13B:

	cmp qword [b13],0x31
	je salir
	jmp borrarb13B

bloque_14B:

	cmp qword [b14],0x31
	je salir
	jmp borrarb14B

bloque_15B:

	cmp qword [b15],0x31
	je salir
	jmp borrarb15B

bloque_16B:

	cmp qword [b16],0x31
	je salir
	jmp borrarb16B

bloque_17B:

	cmp qword [b17],0x31
	je salir
	jmp borrarb17B

bloque_18B:

	cmp qword [b18],0x31
	je salir
	jmp borrarb18B

bloque_1I:

	cmp qword [b1],0x31
	je salir
	jmp borrarb1I

bloque_2I:

	cmp qword [b2],0x31
	je salir
	jmp borrarb2I

bloque_3I:

	cmp qword [b3],0x31
	je salir
	jmp borrarb3I

bloque_4I:

	cmp qword [b4],0x31
	je salir
	jmp borrarb4I

bloque_5I:

	cmp qword [b5],0x31
	je salir
	jmp borrarb5I

bloque_6I:

	cmp qword [b6],0x31
	je salir
	jmp borrarb6I

bloque_7I:

	cmp qword [b7],0x31
	je salir
	jmp borrarb7I

bloque_8I:

	cmp qword [b8],0x31
	je salir
	jmp borrarb8I

bloque_9I:

	cmp qword [b9],0x31
	je salir
	jmp borrarb9I

bloque_10I:

	cmp qword [b10],0x31
	je salir
	jmp borrarb10I

bloque_11I:

	cmp qword [b11],0x31
	je salir
	jmp borrarb11I

bloque_12I:

	cmp qword [b12],0x31
	je salir
	jmp borrarb12I

bloque_13I:

	cmp qword [b13],0x31
	je salir
	jmp borrarb13I

bloque_14I:

	cmp qword [b14],0x31
	je salir
	jmp borrarb14I

bloque_15I:

	cmp qword [b15],0x31
	je salir
	jmp borrarb15I

bloque_16I:

	cmp qword [b16],0x31
	je salir
	jmp borrarb16I

bloque_17I:

	cmp qword [b17],0x31
	je salir
	jmp borrarb17I

bloque_18I:

	cmp qword [b18],0x31
	je salir
	jmp borrarb18I

bloque_1D:

	cmp qword [b1],0x31
	je salir
	jmp borrarb1D

bloque_2D:

	cmp qword [b2],0x31
	je salir
	jmp borrarb2D

bloque_3D:

	cmp qword [b3],0x31
	je salir
	jmp borrarb3D

bloque_4D:

	cmp qword [b4],0x31
	je salir
	jmp borrarb4D

bloque_5D:

	cmp qword [b5],0x31
	je salir
	jmp borrarb5D

bloque_6D:

	cmp qword [b6],0x31
	je salir
	jmp borrarb6D

bloque_7D:

	cmp qword [b7],0x31
	je salir
	jmp borrarb7D

bloque_8D:

	cmp qword [b8],0x31
	je salir
	jmp borrarb8D

bloque_9D:

	cmp qword [b9],0x31
	je salir
	jmp borrarb9D

bloque_10D:

	cmp qword [b10],0x31
	je salir
	jmp borrarb10D

bloque_11D:

	cmp qword [b11],0x31
	je salir
	jmp borrarb11D

bloque_12D:

	cmp qword [b12],0x31
	je salir
	jmp borrarb12D

bloque_13D:

	cmp qword [b13],0x31
	je salir
	jmp borrarb13D

bloque_14D:

	cmp qword [b14],0x31
	je salir
	jmp borrarb14D

bloque_15D:

	cmp qword [b15],0x31
	je salir
	jmp borrarb15D

bloque_16D:

	cmp qword [b16],0x31
	je salir
	jmp borrarb16D

bloque_17D:

	cmp qword [b17],0x31
	je salir
	jmp borrarb17D

bloque_18D:

	cmp qword [b18],0x31
	je salir
	jmp borrarb18D
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

borrarb1A:
	mov r12, 0x31
	escribe msg23,len23
	mov qword [b1], r12
	jmp R_bloque_Arriba


borrarb2A:
	mov r12, 0x31
	escribe msg24,len24
	mov qword [b2], r12
	jmp R_bloque_Arriba

borrarb3A:
	mov r12, 0x31
	escribe msg25,len25
	mov qword [b3], r12
	jmp R_bloque_Arriba

borrarb4A:
	mov r12, 0x31
	escribe msg26,len26
	mov qword [b4], r12
	jmp R_bloque_Arriba

borrarb5A:
	mov r12, 0x31
	escribe msg27,len27
	mov qword [b5], r12
	jmp R_bloque_Arriba

borrarb6A:
	mov r12, 0x31
	escribe msg28,len28
	mov qword [b6], r12
	jmp R_bloque_Arriba

borrarb7A:
	mov r12, 0x31
	escribe msg29,len29
	mov qword [b7], r12
	jmp R_bloque_Arriba


borrarb8A:
	mov r12, 0x31
	escribe msg30,len30
	mov qword [b8], r12
	jmp R_bloque_Arriba

borrarb9A:
	mov r12, 0x31
	escribe msg31,len31
	mov qword [b9], r12
	jmp R_bloque_Arriba

borrarb10A:
	mov r12, 0x31
	escribe msg32,len32
	mov qword [b10], r12
	jmp R_bloque_Arriba

borrarb11A:
	mov r12, 0x31
	escribe msg33,len33
	mov qword [b11], r12
	jmp R_bloque_Arriba

borrarb12A:
	mov r12, 0x31
	escribe msg34,len34
	mov qword [b12], r12
	jmp R_bloque_Arriba

borrarb13A:
	mov r12, 0x31
	escribe msg35,len35
	mov qword [b13], r12
	jmp R_bloque_Arriba

borrarb14A:
	mov r12, 0x31
	escribe msg36,len36
	mov qword [b14], r12
	jmp R_bloque_Arriba

borrarb15A:
	mov r12, 0x31
	escribe msg37,len37
	mov qword [b15], r12
	jmp R_bloque_Arriba

borrarb16A:
	mov r12, 0x31
	escribe msg38,len38
	mov qword [b16], r12
	jmp R_bloque_Arriba

borrarb17A:
	mov r12, 0x31
	escribe msg39,len39
	mov qword [b17], r12
	jmp R_bloque_Arriba

borrarb18A:

	escribe msg40,len40
	mov qword [b18], 0x31
	jmp R_bloque_Arriba

borrarb1B:
	escribe msg23,len23
	mov qword [b1], 0x31
	jmp R_bloque_Abajo


borrarb2B:
	escribe msg24,len24
	mov qword [b2], 0x31
	jmp R_bloque_Abajo

borrarb3B:

	escribe msg25,len25
	mov qword [b3], 0x31
	jmp R_bloque_Abajo

borrarb4B:

	escribe msg26,len26
	mov qword [b4], 0x31
	jmp R_bloque_Abajo

borrarb5B:

	escribe msg27,len27
	mov qword [b5], 0x31
	jmp R_bloque_Abajo

borrarb6B:

	escribe msg28,len28
	mov qword [b6], 0x31
	jmp R_bloque_Abajo

borrarb7B:

	escribe msg29,len29
	mov qword [b7], 0x31
	jmp R_bloque_Abajo


borrarb8B:

	escribe msg30,len30
	mov qword [b8], 0x31
	jmp R_bloque_Abajo

borrarb9B:

	escribe msg31,len31
	mov qword [b9], 0x31
	jmp R_bloque_Abajo

borrarb10B:

	escribe msg32,len32
	mov qword [b10], 0x31
	jmp R_bloque_Abajo

borrarb11B:

	escribe msg33,len33
	mov qword [b11], 0x31
	jmp R_bloque_Abajo

borrarb12B:

	escribe msg34,len34
	mov qword [b12], 0x31
	jmp R_bloque_Abajo

borrarb13B:

	escribe msg35,len35
	mov qword [b13], 0x31
	jmp R_bloque_Abajo

borrarb14B:

	escribe msg36,len36
	mov qword [b14], 0x31
	jmp R_bloque_Abajo

borrarb15B:

	escribe msg37,len37
	mov qword [b15], 0x31
	jmp R_bloque_Abajo

borrarb16B:

	escribe msg38,len38
	mov qword [b16], 0x31
	jmp R_bloque_Abajo

borrarb17B:

	escribe msg39,len39
	mov qword [b17], 0x31
	jmp R_bloque_Abajo

borrarb18B:

	escribe msg40,len40
	mov qword [b18], 0x31
	jmp R_bloque_Abajo


borrarb1I:

	escribe msg23,len23
	mov qword [b1], 0x31
	jmp R_bloque_I


borrarb2I:
	mov r12, 0x31
	escribe msg24,len24
	mov qword [b2], r12
	jmp R_bloque_I

borrarb3I:
	mov r12, 0x31
	escribe msg25,len25
	mov qword [b3], r12
	jmp R_bloque_I

borrarb4I:
	mov r12, 0x31
	escribe msg26,len26
	mov qword [b4], r12
	jmp R_bloque_I

borrarb5I:
	mov r12, 0x31
	escribe msg27,len27
	mov qword [b5], r12
	jmp R_bloque_I

borrarb6I:
	mov r12, 0x31
	escribe msg28,len28
	mov qword [b6], r12
	jmp R_bloque_I

borrarb7I:
	mov r12, 0x31
	escribe msg29,len29
	mov qword [b7], r12
	jmp R_bloque_I


borrarb8I:
	mov r12, 0x31
	escribe msg30,len30
	mov qword [b8], r12
	jmp R_bloque_I

borrarb9I:
	mov r12, 0x31
	escribe msg31,len31
	mov qword [b9], r12
	jmp R_bloque_I

borrarb10I:
	mov r12, 0x31
	escribe msg32,len32
	mov qword [b10], r12
	jmp R_bloque_I

borrarb11I:
	mov r12, 0x31
	escribe msg33,len33
	mov qword [b11], r12
	jmp R_bloque_I

borrarb12I:
	mov r12, 0x31
	escribe msg34,len34
	mov qword [b12], r12
	jmp R_bloque_I

borrarb13I:
	mov r12, 0x31
	escribe msg35,len35
	mov qword [b13], r12
	jmp R_bloque_I

borrarb14I:
	mov r12, 0x31
	escribe msg36,len36
	mov qword [b14], r12
	jmp R_bloque_I

borrarb15I:
	mov r12, 0x31
	escribe msg37,len37
	mov qword [b15], r12
	jmp R_bloque_I

borrarb16I:
	mov r12, 0x31
	escribe msg38,len38
	mov qword [b16], r12
	jmp R_bloque_I

borrarb17I:
	mov r12, 0x31
	escribe msg39,len39
	mov qword [b17], r12
	jmp R_bloque_I

borrarb18I:
	mov r12, 0x31
	escribe msg40,len40
	mov qword [b18], r12
	jmp R_bloque_I

borrarb1D:
	mov r12, 0x31
	escribe msg23,len23
	mov qword [b1], r12
	jmp R_bloque_D


borrarb2D:

	mov r12, 0x31
	escribe msg24,len24
	mov qword [b2], r12
	jmp R_bloque_D

borrarb3D:

	mov r12, 0x31
	escribe msg25,len25
	mov qword [b3], r12
	jmp R_bloque_D

borrarb4D:
	escribe msg26,len26
	mov qword [b4], r12
	jmp R_bloque_D

borrarb5D:
	mov r12, 0x31
	escribe msg27,len27
	mov qword [b5], r12
	jmp R_bloque_D

borrarb6D:
	mov r12, 0x31
	escribe msg28,len28
	mov qword [b6], r12
	jmp R_bloque_D

borrarb7D:
	mov r12, 0x31
	escribe msg29,len29
	mov qword [b7], r12
	jmp R_bloque_D


borrarb8D:
	mov r12, 0x31
	escribe msg30,len30
	mov qword [b8], r12
	jmp R_bloque_D

borrarb9D:
	mov r12, 0x31
	escribe msg31,len31
	mov qword [b9], r12
	jmp R_bloque_D

borrarb10D:
	mov r12, 0x31
	escribe msg32,len32
	mov qword [b10], r12
	jmp R_bloque_D

borrarb11D:
	mov r12, 0x31
	escribe msg33,len33
	mov qword [b11], r12
	jmp R_bloque_D

borrarb12D:
	mov r12, 0x31
	escribe msg34,len34
	mov qword [b12], r12
	jmp R_bloque_D

borrarb13D:
	mov r12, 0x31
	escribe msg35,len35
	mov qword [b13], r12
	jmp R_bloque_D

borrarb14D:
	mov r12, 0x31
	escribe msg36,len36
	mov qword [b14], r12
	jmp R_bloque_D

borrarb15D:
	mov r12, 0x31
	escribe msg37,len37
	mov qword [b15], r12
	jmp R_bloque_D

borrarb16D:
	mov r12, 0x31
	escribe msg38,len38
	mov qword [b16], r12
	jmp R_bloque_D

borrarb17D:
	mov r12, 0x31
	escribe msg39,len39
	mov qword [b17], r12
	jmp R_bloque_D

borrarb18D:
	mov r12, 0x31
	escribe msg40,len40
	mov qword [b18], r12
	jmp R_bloque_D




;--------------------------------------------------------   Final Borrar  --------------------------------------------------------------------------

;-------------------------------------------------------- Inicio Distintas ESquinas  ---------------------------------------------------------------

rebote_esquina1:

	cmp qword [b1],0x30
	je borra_esquina1
	jmp salir

rebote_esquina2:

	cmp qword [b1],0x30
	je borra_esquina2
	jmp salir
rebote_esquina3:

	cmp qword [b2],0x30
	je borra_esquina3
	jmp salir

rebote_esquina4:

	cmp qword [b2],0x30
	je borra_esquina4
	jmp salir

rebote_esquina5:

	cmp qword [b3],0x30
	je borra_esquina5
	jmp salir

rebote_esquina6:

	cmp qword [b3],0x30
	je borra_esquina6
	jmp salir

rebote_esquina7:

	cmp qword [b4],0x30
	je borra_esquina7
	jmp salir

rebote_esquina8:

	cmp qword [b4],0x30
	je borra_esquina8
	jmp salir

rebote_esquina9:

	cmp qword [b5],0x30
	je borra_esquina9
	jmp salir

rebote_esquina10:

	cmp qword [b5],0x30
	je borra_esquina10
	jmp salir

rebote_esquina11:

	cmp qword [b6],0x30
	je borra_esquina11
	jmp salir

rebote_esquina12:

	cmp qword [b6],0x30
	je borra_esquina12
	jmp salir

rebote_esquina13:

	cmp qword [b7],0x30
	je borra_esquina13
	jmp salir

rebote_esquina14:

	cmp qword [b7],0x30
	je borra_esquina14
	jmp salir

rebote_esquina15:

	cmp qword [b8],0x30
	je borra_esquina15
	jmp salir

rebote_esquina16:

	cmp qword [b8],0x30
	je borra_esquina16
	jmp salir

rebote_esquina17:

	cmp qword [b9],0x30
	je borra_esquina17
	jmp salir

rebote_esquina18:

	cmp qword [b9],0x30
	je borra_esquina18
	jmp salir

rebote_esquina19:

	cmp qword [b10],0x30
	je borra_esquina19
	jmp salir

rebote_esquina20:

	cmp qword [b10],0x30
	je borra_esquina20
	jmp salir

rebote_esquina21:

	cmp qword [b11],0x30
	je borra_esquina21
	jmp salir

rebote_esquina22:

	cmp qword [b11],0x30
	je borra_esquina22
	jmp salir

rebote_esquina23:

	cmp qword [b12],0x30
	je borra_esquina23
	jmp salir

rebote_esquina24:

	cmp qword [b12],0x30
	je borra_esquina24
	jmp salir

rebote_esquina25:

	cmp qword [b13],0x30
	je borra_esquina25
	jmp salir

rebote_esquina26:

	cmp qword [b13],0x30
	je borra_esquina26
	jmp salir

rebote_esquina27:

	cmp qword [b14],0x30
	je borra_esquina27
	jmp salir

rebote_esquina28:

	cmp qword [b14],0x30
	je borra_esquina28
	jmp salir

rebote_esquina29:

	cmp qword [b15],0x30
	je borra_esquina29
	jmp salir

rebote_esquina30:

	cmp qword [b15],0x30
	je borra_esquina30
	jmp salir

rebote_esquina31:

	cmp qword [b16],0x30
	je borra_esquina31
	jmp salir

rebote_esquina32:

	cmp qword [b16],0x30
	je borra_esquina32
	jmp salir

rebote_esquina33:

	cmp qword [b17],0x30
	je borra_esquina33
	jmp salir

rebote_esquina34:

	cmp qword [b17],0x30
	je borra_esquina34
	jmp salir

rebote_esquina35:

	cmp qword [b18],0x30
	je borra_esquina35
	jmp salir

rebote_esquina36:

	cmp qword [b18],0x30
	je borra_esquina36
	jmp salir

rebote_esquina37:

	cmp qword [b1],0x30
	je borra_esquina37
	jmp salir

rebote_esquina38:

	cmp qword [b1],0x30
	je borra_esquina38
	jmp salir

rebote_esquina39:

	cmp qword [b2],0x30
	je borra_esquina39
	jmp salir

rebote_esquina40:

	cmp qword [b2],0x30
	je borra_esquina40
	jmp salir

rebote_esquina41:

	cmp qword [b3],0x30
	je borra_esquina41
	jmp salir

rebote_esquina42:

	cmp qword [b3],0x30
	je borra_esquina42
	jmp salir

rebote_esquina43:

	cmp qword [b4],0x30
	je borra_esquina43
	jmp salir

rebote_esquina44:

	cmp qword [b4],0x30
	je borra_esquina44
	jmp salir

rebote_esquina45:

	cmp qword [b5],0x30
	je borra_esquina45
	jmp salir

rebote_esquina46:

	cmp qword [b5],0x30
	je borra_esquina46
	jmp salir

rebote_esquina47:

	cmp qword [b6],0x30
	je borra_esquina47
	jmp salir

rebote_esquina48:

	cmp qword [b6],0x30
	je borra_esquina48
	jmp salir

rebote_esquina49:

	cmp qword [b7],0x30
	je borra_esquina49
	jmp salir

rebote_esquina50:

	cmp qword [b7],0x30
	je borra_esquina50
	jmp salir

rebote_esquina51:

	cmp qword [b8],0x30
	je borra_esquina51
	jmp salir

rebote_esquina52:

	cmp qword [b8],0x30
	je borra_esquina52
	jmp salir

rebote_esquina53:

	cmp qword [b9],0x30
	je borra_esquina53
	jmp salir

rebote_esquina54:

	cmp qword [b9],0x30
	je borra_esquina54
	jmp salir

rebote_esquina55:

	cmp qword [b10],0x30
	je borra_esquina55
	jmp salir

rebote_esquina56:

	cmp qword [b10],0x30
	je borra_esquina56
	jmp salir

rebote_esquina57:

	cmp qword [b11],0x30
	je borra_esquina57
	jmp salir

rebote_esquina58:

	cmp qword [b11],0x30
	je borra_esquina58
	jmp salir

rebote_esquina59:

	cmp qword [b12],0x30
	je borra_esquina59
	jmp salir

rebote_esquina60:

	cmp qword [b12],0x30
	je borra_esquina60
	jmp salir

rebote_esquina61:

	cmp qword [b13],0x30
	je borra_esquina61
	jmp salir

rebote_esquina62:

	cmp qword [b13],0x30
	je borra_esquina62
	jmp salir

rebote_esquina63:

	cmp qword [b14],0x30
	je borra_esquina63
	jmp salir

rebote_esquina64:

	cmp qword [b14],0x30
	je borra_esquina64
	jmp salir

rebote_esquina65:

	cmp qword [b15],0x30
	je borra_esquina65
	jmp salir

rebote_esquina66:

	cmp qword [b15],0x30
	je borra_esquina66
	jmp salir

rebote_esquina67:

	cmp qword [b16],0x30
	je borra_esquina67
	jmp salir

rebote_esquina68:

	cmp qword [b16],0x30
	je borra_esquina68
	jmp salir

rebote_esquina69:

	cmp qword [b17],0x30
	je borra_esquina69
	jmp salir

rebote_esquina70:

	cmp qword [b17],0x30
	je borra_esquina70
	jmp salir

rebote_esquina71:

	cmp qword [b18],0x30
	je borra_esquina71
	jmp salir

rebote_esquina72:

	cmp qword [b18],0x30
	je borra_esquina72
	jmp salir

;-------------------------------------------------------- Final Distintas ESquinas  ----------------------------------------------------------------
	
borra_esquina1:
	escribe msg23,len23
	mov qword [b1],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina2:

    escribe msg23,len23
    mov qword [b1],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina3:

	escribe msg24,len24
	mov qword [b2],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina4:

    escribe msg24,len24
    mov qword [b2],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina5:

	escribe msg25,len25
	mov qword [b3],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina6:

    escribe msg25,len25
    mov qword [b3],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina7:

	escribe msg26,len26
	mov qword [b4],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina8:

    escribe msg26,len26
    mov qword [b4],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina9:

	escribe msg27,len27
	mov qword [b5],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina10:

    escribe msg27,len27
    mov qword [b5],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina11:
	escribe msg28,len28
	mov qword [b6],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina12:

    escribe msg28,len28
    mov qword [b6],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina13:
	escribe msg29,len29
	mov qword [b7],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina14:

    escribe msg29,len29
    mov qword [b7],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina15:

	escribe msg30,len30
	mov qword [b8],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina16:

    escribe msg30,len30
    mov qword [b8],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina17:

	escribe msg31,len31
	mov qword [b9],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina18:

    escribe msg31,len31
    mov qword [b9],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina19:

	escribe msg32,len32
	mov qword [b10],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina20:

    escribe msg32,len32
    mov qword [b10],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina21:

	escribe msg33,len33
	mov qword [b11],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina22:

    escribe msg33,len33
    mov qword [b11],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina23:

	escribe msg34,len34
	mov qword [b12],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina24:

    escribe msg34,len34
    mov qword [b12],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina25:

	escribe msg35,len35
	mov qword [b13],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina26:

    escribe msg35,len35
    mov qword [b13],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina27:

	escribe msg36,len36
	mov qword [b14],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina28:

    escribe msg36,len36
    mov qword [b14],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina29:

	escribe msg37,len37
	mov qword [b15],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina30:

    escribe msg37,len37
    mov qword [b15],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina31:

	escribe msg38,len38
	mov qword [b16],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina32:

    escribe msg38,len38
    mov qword [b16],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina33:

	escribe msg39,len39
	mov qword [b17],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina34:

    escribe msg39,len39
    mov qword [b17],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina35:

	escribe msg40,len40
	mov qword [b18],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina36:

    escribe msg40,len40
    mov qword [b18],0x31
	cmp qword [d0], 0x14
	je rebotar_RU
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina37:
	escribe msg23,len23
	mov qword [b1],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina38:

	escribe msg23,len23
	mov qword [b1],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina39:

	escribe msg24,len24
	mov qword [b2],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina40:

	escribe msg24,len24
	mov qword [b2],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina41:

	escribe msg25,len25
	mov qword [b3],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina42:

	escribe msg25,len25
	mov qword [b3],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina43:

	escribe msg26,len26
	mov qword [b4],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina44:

	escribe msg26,len26
	mov qword [b4],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina45:

	escribe msg27,len27
	mov qword [b5],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina46:

	escribe msg27,len27
	mov qword [b5],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina47:

	escribe msg28,len28
	mov qword [b6],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina48:

	escribe msg28,len28
	mov qword [b6],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina49:

	escribe msg29,len29
	mov qword [b7],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina50:

	escribe msg29,len29
	mov qword [b7],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina51:

	escribe msg30,len30
	mov qword [b8],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina52:

	escribe msg30,len30
	mov qword [b8],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina53:

	escribe msg31,len31
	mov qword [b9],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina54:

	escribe msg31,len31
	mov qword [b9],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina55:

	escribe msg32,len32
	mov qword [b10],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina56:

	escribe msg32,len32
	mov qword [b10],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina57:

	escribe msg33,len33
	mov qword [b11],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina58:

	escribe msg33,len33
	mov qword [b11],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina59:

	escribe msg34,len34
	mov qword [b12],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina60:

	escribe msg34,len34
	mov qword [b12],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina61:

	escribe msg35,len35
	mov qword [b13],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina62:

	escribe msg35,len35
	mov qword [b13],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	escribe msg35,len35
	cmp qword [d0], 0x12
	je rebotar_LD
	escribe msg35,len35
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina63:

	escribe msg36,len36
	mov qword [b14],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina64:

	escribe msg36,len36
	mov qword [b14],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina65:

	escribe msg37,len37
	mov qword [b15],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina66:

	escribe msg37,len37
	mov qword [b15],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina67:

	escribe msg38,len38
	mov qword [b16],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina68:

	escribe msg38,len38
	mov qword [b16],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina69:

	escribe msg39,len39
	mov qword [b17],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina70:

	escribe msg39,len39
	mov qword [b17],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir

borra_esquina71:

	escribe msg40,len40
	mov qword [b18],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x14
	je rebotar_RU
	jmp salir

borra_esquina72:

	escribe msg40,len40
	mov qword [b18],0x31
	cmp qword [d0], 0x13
	je rebotar_LU;movimiento
	cmp qword [d0], 0x12
	je rebotar_LD
	cmp qword [d0], 0x11
	je rebotar_RD
	jmp salir



salir:
jmp direccion 





;---------------------------retardo temporal----------------------------------
delay:
mov dword [tv_sec], 0
mov dword [tv_usec], 155555000
mov eax, 162
mov ebx, timeval
mov ecx, 0
int 0x80
ret
;-----------------------------------------------------------------------------






;---------------------------limpia pantalla-----------------------------------
limpiar_pantalla:
;escribe borra, len2
mov eax, 4
mov ebx, 1
mov ecx, borra
mov edx, len42
int 0x80
ret
;-----------------------------------------------------------------------------



;---------------------------limpia registros----------------------------------
final:
mov eax, 1
;se carga la llamada 60d (sys_exit) en rax
mov ebx,0
;en rdi se carga un 0
int 0x80
;-----------------------------------------------------------------------------
