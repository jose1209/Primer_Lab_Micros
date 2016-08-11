segment .data
	
	NoSupport db "Este computador no soporta el modo 13H de graficos",10,13,"$"
	;Font 	  db 2048 DUP(0) ;Buffer de fonts
	VideoSeg  equ 0A000H 	 ;Segmento de Video
	Fcolor 	  db 5			 ;Foreground color
	Bcolor	  db 1			 ;Background color
	VideoMode db 3			 ;Videomode "antiguo"
	notes	  dw 262,277,294,311,330,349,415,440,466,494
	LoopCounter db 0

;------------------------------_Definiendo la paleta----------------------------
	
	Paddle_x1 dw 10				;Numeros son los parametros donde se coloca la paleta, se alteran para variar la posicion
	Paddle_y1 dw 85
	Paddle_x2 dw 15
	Paddle_y2 dw 115

;--------------------------Fronteras para el espacio del Juego------------------------------------
	superior dw 16
	inferior dw 194
	izquierda dw 16
	derecha   dw 304

;---------------------Velocidad de los Objetos (Pixeles por tpoque)
	PaddleSpeed equ 4

;-----------------------Codigo--------------------------------

section .text

Hline:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	push di
	push es
	 
	mov ax,8[bp] ; cambiar X1,X2 si X1>X2
	cmp ax,6[bp]
	JB OKh
	mov bx,6[bp]
	mov 6[bp],ax
	mov 8[bp],bx
	 
OKh:
	mov ax,4[bp] ; ax=y
	xor ah,ah
	xchg ah,al   ; ax=y*256
	mov bx,ax    ; bx=y*256
	shr bx,1
	shr bx,1     ; bx =y*64
	add ax,bx    ; ax=y*320
	add ax,8[bp] ; offset de 1er punto
	mov di,ax
	mov ax, VideoSeg
	mov es,ax
	mov cx,6[bp]
	sub cx,8[bp] ; cx = longitud de linea
	inc cx
	mov al,Fcolor
	rep stosb
	 
	pop es
	pop di
	pop cx
	pop bx
	pop ax
	pop bp
	ret 6
 
;------------------------ Subrutina que maneja el movimiento de las PALETAS-------------------------------------
PaddleMovement:
 
	call ReadKeyboard ; Subrutina para leer buffer del teclado
   					  ; devuelve en AL el scan code de una tecla
 
	cmp al,0
	je exit_paddle_movement ; Si no se ha presionado nada no hay accion
 
	cmp al,72             ; Si el usuario presiona la tecla direccional arriba
	je MoveLeftPaddleUp   ; Mueve paleta izquiera hacia arriba
	
	cmp al,80             ; Si el usuario presiona la tecla direccional abajo
	je MoveLeftPaddleDown ; Mueve paleta izquiera hacia abajo
 
	jmp exit_paddle_movement
 
MoveLeftPaddleUp:
	mov cx,PaddleSpeed
 
Loop_paddle_up:
 
	mov ax,LeftPaddle_x1 ; Carga coordenadas actuales de la paleta
	mov bx,LeftPaddle_x2
	mov dx,LeftPaddle_y1
	
	cmp dx,TopLimit      ; Si ya alcanzo el tope superior, entonces
	je exit_paddle_up    ; No realiza ningun movimiento mas

	dec dx
	mov LeftPaddle_y1,dx
 
	;mov FColor,ColorPink				;----------------colorean
 
	mov LoopCounter,cl
 
	push ax
	push bx
	push dx
	call Hline
 
	mov ax,LeftPaddle_x1
	mov bx,LeftPaddle_x2
	mov dx,LeftPaddle_y2
 
	;mov Fcolor,ColorBlack				;----------------colorean
 
	push ax
	push bx
	push dx
	call Hline
 
	mov dx,LeftPaddle_y2
	dec dx
	mov LeftPaddle_y2,dx
 
	mov ch,0
	mov cl,LoopCounter
	loop Loop_paddle_up
 
exit_paddle_up:
	jmp exit_paddle_movement
 
MoveLeftPaddleDown:
	mov cx,PaddleSpeed

Loop_paddle_down:
	mov ax,LeftPaddle_x1
	mov bx,LeftPaddle_x2
	mov dx,LeftPaddle_y2
	
	cmp dx,BottomLimit
	je exit_paddle_down
	inc dx
	mov LeftPaddle_y2,dx
 
	mov LoopCounter,cl
 
	;mov FColor,ColorPink				;--------colorea
 
	push ax
	push bx
	push dx
	call Hline
 
	mov ax,LeftPaddle_x1
	mov bx,LeftPaddle_x2
	mov dx,LeftPaddle_y1
	 
	;mov Fcolor,ColorBlack				;-------cololea
 
	push ax
	push bx
	push dx
	call Hline
 
	mov dx,LeftPaddle_y1
	inc dx
	mov LeftPaddle_y1,dx
 
	mov ch,0
	mov cl,LoopCounter
	loop Loop_paddle_down
 
exit_paddle_down:
	jmp exit_paddle_movement

exit_paddle_movement:
	ret

ReadKeyboard:
 
	in al,62h     ; Leer bit 4 del Puerto C (data ready)
	test al,10h
	jz exit_key   ; Si no hay nada salir de la subrutina
	 
	in al,60h     ; Si hay algo, copiarlo a AL y guardarlo en DL
	mov dl,al
	 
	in al,62h     ; Mandar "acknowlegde" al Puerto C (bit 5)
	or al,20h
	out 62h,al
	and al,0DFh   ; Borrar bit 4 del Puerto C para leer siguiente dato
	out 62h,al
	mov al,dl     ; Copiar nuevamente dato en AL para devolverlo
	ret

exit_key:
	ret

	global _start

_start:

Loop_Main: ; Ciclo infinito del main.  Se sale solo si usuario presiona ESC
 
	call ReadKeyboard ; Lee el buffer y sale si encuentra 'ESC'
	;cmp al,01
	;je Fin

;----------------------------------delay para aprox 30 fps-------------------------------------
	mov cx,00h
	mov dx,8235h
	mov ah,86h
	int 15h

	call PaddleMovement  ; llama a la subrutina que maneja movimiento de la paleta
	jmp Loop_Main


	
	

;-------------------Salir---------------------------------------
	mov eax,1
	int 0x80
