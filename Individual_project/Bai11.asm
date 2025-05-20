.Model small
.Stack 100H
.Data
    TB1 DB 'Gia tri lon nhat cua mang: $'
    TB2 DB 13,10,'Gia tri nho nhat cua mang: $'                
    list DB 1,2,3,4,5,6,7,8,0
    MIN DB ?
    MAX DB ?   
.Code
    MAIN Proc           
        MOV AX, @DATA
        MOV DS, AX
                   
        MOV CX, 9              ; s? ph?n t? trong m?ng
        LEA SI, list           ; SI tr? d?n d?u m?ng
        MOV AL, [SI]           ; l?y ph?n t? d?u tiên
        MOV MAX, AL
        MOV MIN, AL
        INC SI                 ; tr? d?n ph?n t? ti?p theo
        DEC CX                 ; dã x? lý 1 ph?n t? d?u tiên nên gi?m CX
    
    Start:
        LODSB                  ; n?p ph?n t? ti?p theo vào AL và tang SI
        CMP AL, MAX
        JLE SkipMax
        MOV MAX, AL
    SkipMax:
    
        CMP AL, MIN
        JGE SkipMin
        MOV MIN, AL
    SkipMin:
    
        LOOP Start
    
        ; In chu?i TB1
        LEA DX, TB1
        MOV AH, 9
        INT 21H
    
        ; In MAX (chuy?n sang ký t?)
        MOV AL, MAX
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H
    
        ; Xu?ng dòng + in chu?i TB2
        LEA DX, TB2
        MOV AH, 9
        INT 21H
    
        ; In MIN (chuy?n sang ký t?)
        MOV AL, MIN
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H
    
        ; Ket thuc chuong trinh
        MOV AH, 4CH
        INT 21H
    MAIN Endp
END MAIN
