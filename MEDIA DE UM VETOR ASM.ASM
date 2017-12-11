; programa para calcular a media (inteira)
; dos valores de um vetor
; Posicao A0 da memoria contem o quantidade de elementos
;                           do vetor
; Posicao A1 primeira posicao do vetor
;                (Valores estão a partir desta posicao)
; Posicao 9F deve guardar o resultado no final
;
; NOME DO ALUNO:    <LUCAS KAÍQUE DA SILVA>

; Coloque seu codigo abaixo

	CLO
	MOV CL, A1; CONTADOR
	MOV DL,[A0]
	ADD DL, A0
	ADD DL, 1

INICIO:
	MOV AL,[CL]
	INC CL
	PUSH AL ;COLOCA OS VALORES DO VETOR NA PILHA
	CMP CL, DL ;COMPARA O CONTADOR
	JZ SOMA	
	JMP INICIO
	
SOMA:
	MOV DL,A1
	DEC CL ;CONTADOR DECREMENTANDO
	POP AL ;RETIRA OS VALORES DA PILHA ATE O LIMITE ANTE DO STACK OVERFLOW
	ADD BL, AL
	CMP CL, DL ;COMPARA O CONTADOR
	JZ DIVISAO	
	JMP SOMA

DIVISAO:
	MOV DL,[A0]
	DIV BL,DL
	MOV [9F], BL ;POSIÇÃO DO RESULTADO
	JMP FIM



FIM:
	halt ; fim do programa

;;; Declaracao dos valores do vetor
;; Podem alterar os valores e o tamanho para teste

org A0
db 7  ; tamanho do vetor
db 7  ; posicao 0
db 2  ; posicao 1
db 4  ; posicao 2
db 6  ; posicao 3
db 6  ; posicao 4
db 6  ; posicao 5
db 6  ; posicao 6
end