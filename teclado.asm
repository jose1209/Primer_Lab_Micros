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


p1 dq 0       ;plataforma 1 izquierda, 
p2 dq 0		  ;plataforma 2 derecha
tecla_derecha dq 0
tecla_izquierda dq 0

borra db 0x1b,"[2J"
len2 equ $-borra

barra db  0x1b,"[21;40f","********"
len3 equ $-barra

cursor db  0x1b,"[?25l"
len4 equ $-cursor


tecla dq 0

variable: db''													;Almacenamiento de la tecla capturada

termios:        times 36 db 0									;Estructura de 36bytes que contiene el modo de operacion de la consola
stdin:          	  equ 0												;Standard Input (se usa stdin en lugar de escribir manualmente los valores)
ICANON:      equ 1<<1											;ICANON: Valor de control para encender/apagar el modo canonico
ECHO:           equ 1<<3    											;ECHO: Valor de control para encender/apagar el modo de eco


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
escribe cursor,len4
;call leer_tecla
call canonical_off
call echo_off
mov qword [p1], 0x36;p1
mov qword [p2], 0x32;p2
mov qword [tecla_derecha], 0x00
mov qword [tecla_izquierda],0x00
mov qword [tecla],0x00
call limpiar_pantalla
jmp inicio

inicio:
escribe barra,len3
jmp leer_tecla
;-----------------------------------------------------------------------------


leer_tecla:

mov eax, 3
mov ebx, 1
mov ecx, tecla
mov edx, 1
int 0x80
;call limpiar_pantalla
;escribe tecla,1
;call delay 
jmp contadores_tecla
;call delay
;call limpiar_pantalla
;escribe tecla,1
;call delay
contadores_tecla:

mov r13,0x74
mov r14,qword[tecla]
cmp r14,r13
je aumento_derecha
mov r13,0x72
mov r14,qword[tecla]
cmp r14,r13
je aumento_izquierda
jmp plataforma

aumento_derecha:
call limpiar_pantalla
mov r13,0x00
mov qword[tecla],r13
mov r13,0x01
add qword [tecla_derecha], r13
jmp plataforma 

aumento_izquierda:
call limpiar_pantalla
mov r13,0x00
mov qword[tecla],r13
mov r13,0x01
add qword [tecla_izquierda], r13
jmp plataforma 




rara:
mov eax, 54
;se carga la llamada 60d (sys_exit) en rax
;mov ebx,0
;en rdi se carga un 0
int 0x80


;---------------------------Dibujar elemento----------------------------------
barra_cambio:
mov r8, 0x1b;0x1b
mov [barra + 0x00], r8
mov r8, 0x5b;[
mov [barra + 0x01], r8
mov r8, 0x32;y1
mov [barra + 0x02], r8
mov r8, 0x31;y2
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
mov r8, 0x2a;*
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
escribe barra, len3
;call delay
;call limpiar_pantalla
ret
;-----------------------------------------------------------------------------




;---------------------------retardo temporal----------------------------------
delay:
mov dword [tv_sec], 1
mov dword [tv_usec], 9000000
mov eax, 162
mov ebx, timeval
mov ecx, 0
int 0x80
ret
;-----------------------------------------------------------------------------



;---------------------------limpia pantalla-----------------------------------
limpiar_pantalla:
;mov eax, 4
;mov ebx, 1
;mov ecx, borra
;mov edx, len2
;int 0x80
escribe borra, len2
ret
;-----------------------------------------------------------------------------


;---------------------------plataforma----------------------------------
plataforma:
mov r13,0x00
cmp qword[tecla_derecha],r13
jne plataforma_derecha
cmp qword[tecla_izquierda],r13
jne plataforma_izquierda
escribe barra,len3
jmp inicio 
;-----------------------------------------------------------------------------

plataforma_derecha:
mov r13,0x01
sub qword[tecla_derecha],r13
mov r13, 0x37
cmp qword [p1], r13
je plataforma_limite_derecho
jmp plataforma_suma_unidad

plataforma_limite_derecho:
mov r13, 0x32
cmp qword [p2], r13
je inicio
jmp plataforma_suma_unidad

plataforma_suma_unidad:

mov r13, 0x39
cmp qword [p2], r13
je  plataforma_suma_decena
mov r13,0x01
add qword [p2], r13
call barra_cambio
jmp inicio

plataforma_suma_decena:
mov r13,0x09
mov r10,0x01
add qword [p1], r10
sub qword [p2], r13

call barra_cambio

jmp inicio

;_____________________________________________________________________________

plataforma_izquierda:
mov r13,0x01
sub qword[tecla_izquierda],r13
mov r13, 0x30
cmp qword [p1], r13
je plataforma_limite_izquierdo
jmp plataforma_resta_unidad

plataforma_limite_izquierdo:
mov r13, 0x30
cmp qword [p2], r13
je inicio
jmp plataforma_resta_unidad

plataforma_resta_unidad:

mov r13, 0x30
cmp qword [p2], r13
je  plataforma_resta_decena
mov r13,0x01
sub qword [p2], r13
call barra_cambio
jmp inicio

plataforma_resta_decena:
mov r13,0x09
mov r10,0x01
sub qword [p1], r10
add qword [p2], r13

call barra_cambio

jmp inicio 

;---------------------------limpia registros----------------------------------
final:
call canonical_on
call echo_on
mov eax, 1
;se carga la llamada 60d (sys_exit) en rax
mov ebx,0
;en rdi se carga un 0
int 0x80
;-----------------------------------------------------------------------------
