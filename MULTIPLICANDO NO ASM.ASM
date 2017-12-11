;EXEMPLO DE MULTIPLICAÇÃO ASM


    clo
    mov bl, c0
    call 45
    mov al, 2a  ; imprime asterisco
    mov [c1], al
    mov bl, c2
    call 45
    mov al, 3d  ; imprime igual
    mov [c3], al
    pop al
    pop bl  
    mul al,bl
    push al
    pop dl
    div dl, 0a
    mov bl, c4
    jz prox
    add dl, 30
    mov [bl], dl
    inc bl
prox:
    mod al, 0a
    add al, 30
    mov [bl], al
    halt

    org 45
leitura:
    IN 00
    CMP AL, 30
    JS LEITURA
    CMP AL, 3A
    JNS LEITURA
    mov [bl], al
    SUB AL, 30
    pop bl
    push al
    push bl
    RET
    end