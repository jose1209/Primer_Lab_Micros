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
v  dq 3
p1 dq 0		;variable plataforma izquierda decena 
p2 dq 0		;variable plataforma izquierda unidad
p3 dq 0		;variable plataforma derecha decena
p4 dq 0		;variable plataforma derecha unidad

tecla_derecha dq 0       ;contador tecla derecha 
tecla_izquierda dq 0	 ;contador tecla izquierda
;variables para almacenar cuantas veces se mueve la plataforma

borra db 0x1b,"[2J"		;escape code para borrar pantalla
len2 equ $-borra			

bola1 db 0x1b,"[00;00f","*"
len1 equ $-bola1

barra db  0x1b,"[21;40f","********"		;variable de la plataforma a imprimir
len3 equ $-barra

cursor db  0x1b,"[?25l"		;escape code para esconder el cursor
len4 equ $-cursor

tecla dq 0	;variable para recibir datos de teclado

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

escribe cursor,len4	;se esconde el cursor	; 
call canonical_off  ;se llama a la funcion para apagar el modo canonico
call echo_off; se apaga el echo
mov qword [x1], 0x34 ; x1
mov qword [y1], 0x31 ; y1, ahí está totalemente abajo
mov qword [x2], 0x38 ; x2
mov qword [y2], 0x38 ; y2
mov qword [p1], 0x34	 
mov qword [p2], 0x30
mov qword [p3], 0x34
mov qword [p4], 0x37

mov qword [tecla_derecha], 0x00
mov qword [tecla_izquierda],0x00
mov qword [tecla],0x00
call limpiar_pantalla
call posicion_cambio
call disparo_inicio
;jmp inicio

inicio:
;escribe barra,len3
;jmp leer_tecla
ret
;jmp direccion_2
;-----------------------------------------------------------------------------


leer_tecla:
call kbhit
cmp 
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



posicion_cambio:
call limpiar_pantalla
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
escribe bola1, len1
call barra_cambio
call delay
;call limpiar_pantalla
ret

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

;---------------------------dibujar elemento---------------------------------
;-----------------------------------------------------------------------------



;---------------------------retardo temporal----------------------------------
delay:
mov dword [tv_sec], 0
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
mov r13,0
cmp qword[tecla_derecha],r13
jg plataforma_derecha
cmp qword[tecla_izquierda],r13
jg plataforma_izquierda
;call posicion_cambio
ret  
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
;call barra_cambio
jmp inicio

suma_decena:			;unidad borde izquierdo
mov r13,0x09
mov r10,0x01
add qword [p3], r10
sub qword [p4], r13
;call barra_cambio
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
;call barra_cambio
jmp inicio

resta_decena:
mov r13,0x09
mov r10,0x01
sub qword [p3], r10
add qword [p4], r13
;call barra_cambio
jmp inicio 




;---------------------------dibujar elemento----------------------------------

;-----------------------------------------------------------------------------



;---------------------------direccion-----------------------------------------
direccion:
;call leer_tecla
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
div esi         ; make it from 0 to 9
mov edi,0
cmp edx,edi
jz iz
jnz der
ret

iz:
mov qword [d0], 0x11
call loop_1
jmp direccion

der:
mov qword [d0], 0x12
call loop_1
jmp direccion


loop_1:
rdtsc
xor eax, edx
mov ebx, eax        ; the seed is in ebx
mov esi, 2
mov ecx, 50
add ebx, $811C9DC5  ; prime 1
imul ebx, $01000193  ; prime 2
mov eax, ebx
xor edx, edx
div esi         ; make it from 0 to 9
mov edi,0
cmp edx,edi
jz y1_0
jnz y1_1
ret

y1_0:
mov qword [y1], 0x30 
jmp loop_2

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
;call leer_tecla
call posicion_cambio
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
;call leer_tecla
call posicion_cambio
jmp direccion

buff_1:
mov r13, 0x30
cmp qword [y2],r13
je cero2
call resta3
;call leer_tecla
call posicion_cambio
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
;call leer_tecla
call posicion_cambio
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
je rebotar_RU;preguntar si esta la barra acá
call suma4
mov qword [y2], 0x30 ; x1
;call leer_tecla
call posicion_cambio

jmp direccion

buff_2:
mov r13, 0x39
cmp qword [y2],r13;pregunta si y2 es 9
je cero2_
call suma3; suma y2 en una unidad
;call leer_tecla
call posicion_cambio
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






;---------------------------movimiento inferior izquierdo---------------------

abajo_i: 
mov qword [d0], 0x14 ;
call buffer3
;call leer_tecla
call posicion_cambio
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
je rebotar_LU
call suma4
mov qword [y2], 0x30 ; x1
;call leer_tecla
call posicion_cambio
jmp direccion

buff_22:
mov r13, 0x39
cmp qword [y2],r13
je cero22_
call suma3; suma y2 en una unidad

;call leer_tecla
call posicion_cambio
jmp direccion
;-----------------------------------------------------------------------------







;---------------------------movimiento superior derecho-----------------------
arriba_d:
mov qword [d0], 0x12 ;
call buffer4
;call leer_tecla
call posicion_cambio
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
;call leer_tecla
call posicion_cambio
jmp direccion

buff_11:
mov r13, 0x30
cmp qword [y2],r13
je cero22
call resta3
;call leer_tecla
call posicion_cambio
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
call posicion_cambio
jmp direccion

h1:; si x2 es cero brinco a h1 para decrementar la decena y poner a x2 en 9
mov r13, 0x30
cmp qword [x1],r13; pregunto si estoy en una esquina , 0.0, 19
je rebotar_RU; si estoy en esos ptos me devuelvo en la misma direccion que venia, me voy hacia arriba derecha
call resta2
mov qword [x2], 0x39 ; x1
call posicion_cambio
jmp direccion

h2:
mov r13, 0x31
cmp qword [y1],r13
je rebotar_LU
call suma4
mov qword [y2], 0x30 ; x1
call posicion_cambio
jmp direccion

h3:
mov r13, 0x37
cmp qword [x1],r13
je rebotar_LD
call suma2; caso en que no se esta en el borde
mov qword [x2], 0x30 ; x2 lo pone en cero
call posicion_cambio
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

jmp final

R_bloque_I: ;costado izquierdo del bloque
mov r12, 0x12;derecha arriba
cmp qword [d0], r12 ; 
je rebotar_LU

mov r12, 0x13;derecha abajo
cmp qword [d0], r12 ; 
je rebotar_LD

jmp final

R_bloque_Arriba: ;costado superior del bloque
mov r12, 0x13;derecha abajo
cmp qword [d0], r12 ; 
je rebotar_RU

mov r12, 0x14;izquierda abajo
cmp qword [d0], r12 ; 
je rebotar_LU

jmp final

R_bloque_Abajo: ;costado superior del bloque
mov r12, 0x12;derecha arriba
cmp qword [d0], r12 ; 
je rebotar_RD

mov r12, 0x11;izquierda arriba
cmp qword [d0], r12 ; 
je rebotar_LD

jmp final

;-----------------------------------------------------------------------------






;---------------------------eliminar vida--------------------------------------
resta_vidas:
mov r9,1
sub qword [v],r9
mov r9,0
cmp qword [v], r9;
je perdio_juego

jmp _start
;-----------------------------------------------------------------------------
perdio_juego:
jmp final 






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
