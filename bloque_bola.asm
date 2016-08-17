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

	borra db 0x1b,"[2J"
	len42 equ $-borra

	bola1 db 0x1b,"[00;00f","*"
	len41 equ $-bola1

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

section .text
global _start




;---------------------------Principal-----------------------------------------
_start:
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
call delay
call limpiar_pantalla
call escribir_bloque
ret
;-----------------------------------------------------------------------------
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
call posicion_cambio
jmp direccion

buff_1:
mov r13, 0x30
cmp qword [y2],r13
je cero2
call resta3
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
call posicion_cambio

jmp direccion

buff_2:
mov r13, 0x39
cmp qword [y2],r13;pregunta si y2 es 9
je cero2_
call suma3; suma y2 en una unidad
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
call posicion_cambio
jmp direccion

buff_22:
mov r13, 0x39
cmp qword [y2],r13
je cero22_
call suma3; suma y2 en una unidad
call posicion_cambio
jmp direccion
;-----------------------------------------------------------------------------







;---------------------------movimiento superior derecho-----------------------
arriba_d:
mov qword [d0], 0x12 ;
call buffer4

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
call posicion_cambio
jmp direccion

buff_11:
mov r13, 0x30
cmp qword [y2],r13
je cero22
call resta3
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







;---------------------------retardo temporal----------------------------------
delay:
mov dword [tv_sec], 0
mov dword [tv_usec], 99000000
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
