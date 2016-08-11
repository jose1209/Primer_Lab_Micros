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


section .text
	global _start

_start:

; ///////////////////////////INITIAL SETUP/////////////////////////////
 
; Lo primero que hay que hacer es entrar a modo grafico
; con la interrupcion 10h, ax=13h (320x200)
; ademas se limpia la pantalla
 
	mov ax,1a00h ; verificar si soporta modo 13h
	int 10h
	cmp al,1ah
	je Graph
	 
Graph:
	mov ah,0fh   ; tomar modo actual
	int 10h
	mov al,VideoMode ; guardar en al																								Ojo aqui hay un problema
	 
	mov ax,13h ; setear modo 13h
	int 10h
	mov bx,100
	clc





;-------------------Salir---------------------------------------
	mov eax,1
	int 0x80
