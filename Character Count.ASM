;Utilizando a linguagem Assembly do SMS, escrever um programa para realizar a contagem de caracteres iguais a um caractere escolhido. O programa deve funcionar da seguinte maneira:
;-    O programa deverá ler caracteres do teclado. O programa só deve aceitar caracteres de A à Z (maiúsculos) e de a à z (minúsculos). Todo outro caractere deve ser ignorado.
;-    O programa deve imprimir o caractere lido. Se o caractere lido for minúsculo, o programa deve transformar em maiúsculo antes da impressão (só caracteres maiúsculos serão mostrados).
;-    A leitura deve continuar até a tecla Enter ser pressionada (0D em hexa) ou até preencher as 4 linhas da tela.
;-    Após o fim da leitura, um único novo caractere deve ser lido, o programa deve esperar até que um caractere entre A-Z ou a-z seja digitado, ignorando qualquer outra digitação. (Este caractere não será mostrado)
;-    Depois da digitação do novo caractere, o programa deve contar quantos caracteres iguais ao último foram digitados anteriormente (independentemente de maiúsculo ou minúsculo)
;-    O programa também deve limpar a tela, apresentar a letra e o resultado da contagem encontrada (lembre-se que está contagem nunca ultrapassará 64, já que será o número máximo de caracteres armazenados).


CLO
        mov bl,c0
start: 			;RECEBE ENTRADA DO TECLADO
	IN 00
	CMP bl, 00	;COMPARA SE PREENCHEU A TELA DO LCD
	JZ caractere
	CMP AL, 0d	;COMPARA SE A LETRA DIGITADA FOI ENTER
	JZ caractere
        CMP AL, 7a	;COMPARA SE É MENOR QUE 'z'
	JS minuscula
	JMP start	

minuscula:
	CMP al, 61	;COMPARA DE É MENOR QUE 'a'
	JS maiuscula	;SE SIM, VAI PARA ROTINA DE MAIUSCULA
	sub al, 20	;SUBTRAI PARA IMPRIMIR NA TELA A LETRA MINUSCULA EM MAIUSCULA
	mov [bl], al
	inc bl
	JMP start

maiuscula:
	CMP al, 5b	;COMPARA SE É MENOR QUE '['
	JNS start
	CMP al, 41	;COMPARA SE É MENOR QUE 'A'
	JS start
	mov [bl], al
	inc bl
	JMP start	

caractere:
	IN 00
	CMP AL, 7a
	JNS caractere
	CMP AL, 61
	JS MAI
	SUB AL, 20
	JMP rotina

MAI:
	CMP al, 5b	;COMPARA SE É MENOR QUE '['
	JNS caractere
	CMP al, 41	;COMPARA SE É MENOR QUE 'A'
	JS caractere
	JMP rotina



ROTINA:
	mov bl, c0
contar:
	CMP BL, 00
	JZ LIMPAR
	mov CL, [BL]
	inc BL
	CMP CL, AL
	JZ incremento
	JMP contar

incremento:
	INC DL
	JMP contar


LIMPAR:
	mov bl, C0
	MOV CL, 20
loop:
	CMP BL, 00
	JZ FIM
	MOV [BL], CL
	inc bl	
	JMP loop
FIM:
	mov bl, c0
	mov [bl], al
	mov bl, c1
	mov CL, 3d
	mov [C1], CL
	mov bl, c2
	push DL
    	pop AL
    	div al, 0a
    	jz prox
    	add al, 30
    	mov [bl], al
    	inc bl
prox:
    	mod dl, 0a
    	add dl, 30
    	mov [bl], dl
    	halt
	
end
