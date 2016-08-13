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

borra db 0x1b,"[2J"
len2 equ $-borra

barra db  0x1b,"[21;40f","********"
len3 equ $-barra

section .text
global _start

;---------------------------Principal-----------------------------------------
_start:
call rara 
mov qword [p1], 0x36;p1
mov qword [p2], 0x32;p2
call limpiar_pantalla
;call posicion_cambio
;call arriba_i
call plataforma
jmp final
;-----------------------------------------------------------------------------


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
call delay
call limpiar_pantalla
ret
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
;jmp plataforma_derecha
jmp plataforma_izquierda
ret
;-----------------------------------------------------------------------------

plataforma_derecha:
mov r13, 0x37
cmp qword [p1], r13
je plataforma_limite_derecho
jmp plataforma_suma_unidad

plataforma_limite_derecho:
mov r13, 0x32
cmp qword [p2], r13
je plataforma_izquierda
jmp plataforma_suma_unidad

plataforma_suma_unidad:

mov r13, 0x39
cmp qword [p2], r13
je  plataforma_suma_decena
mov r13,0x01
add qword [p2], r13
call barra_cambio
jmp plataforma_derecha

plataforma_suma_decena:
mov r13,0x09
mov r10,0x01
add qword [p1], r10
sub qword [p2], r13

call barra_cambio

jmp plataforma_derecha

;_____________________________________________________________________________

plataforma_izquierda:
mov r13, 0x30
cmp qword [p1], r13
je plataforma_limite_izquierdo
jmp plataforma_resta_unidad

plataforma_limite_izquierdo:
mov r13, 0x30
cmp qword [p2], r13
je plataforma_derecha
jmp plataforma_resta_unidad

plataforma_resta_unidad:

mov r13, 0x30
cmp qword [p2], r13
je  plataforma_resta_decena
mov r13,0x01
sub qword [p2], r13
call barra_cambio
jmp plataforma_izquierda

plataforma_resta_decena:
mov r13,0x09
mov r10,0x01
sub qword [p1], r10
add qword [p2], r13

call barra_cambio

jmp plataforma_izquierda

;---------------------------limpia registros----------------------------------
final:
mov eax, 1
;se carga la llamada 60d (sys_exit) en rax
mov ebx,0
;en rdi se carga un 0
int 0x80
;-----------------------------------------------------------------------------
