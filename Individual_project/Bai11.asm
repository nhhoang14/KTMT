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
                   
        MOV CX, 9   ; So phan tu trong mang
        LEA SI, list    ; SI tro den dau mang
        MOV AL, [SI]    ; Lay phan tu dau tien
        MOV MAX, AL ; Gan MAX = phan tu dau tien
        MOV MIN, AL ; Gan MIN = phan tu dau tien
        INC SI  ; Tro den phan tu tiep theo
        DEC CX  ; Da xu ly 1 phan tu dau tien nen giam CX
    
    Start:
        LODSB   ; Nap phan tu tiep theo vao AL va tang SI
        CMP AL, MAX
        JLE SkipMax
        MOV MAX, AL
    SkipMax:
        CMP AL, MIN
        JGE SkipMin
        MOV MIN, AL
    SkipMin:
        LOOP Start
    
        ; In TB1
        LEA DX, TB1
        MOV AH, 9
        INT 21H
    
        ; In MAX (chuyen sang ky tu)
        MOV AL, MAX
        ADD AL, '0'
        MOV DL, AL
        MOV AH, 2
        INT 21H
    
        ; In chuoi TB2
        LEA DX, TB2
        MOV AH, 9
        INT 21H
    
        ; In MIN (chuyen sang ky tu)
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
