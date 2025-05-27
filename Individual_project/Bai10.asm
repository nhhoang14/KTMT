.MODEL SMALL
.STACK 100H
.DATA
    TB1 DB 'Chuoi ban dau la: Kien truc may tinh$'
    TB2 DB 13,10,'Tong chieu dai cua chuoi: $'
    S   DB 'Kien truc may tinh$'
.CODE
    MAIN PROC
        ; Khoi tao cho thanh ghi DS
        MOV AX, @DATA
        MOV DS, AX
    
        ; In ra man hinh xau TB1
        LEA DX, TB1
        MOV AH, 9
        INT 21H
        
        ; Tinh chieu dai chuoi S (dem so ky tu truoc dau $)
        LEA SI, S
        MOV CX, 0   ; CX se dem do dai
    
    CountLoop:
        MOV AL, [SI]
        CMP AL, '$' ; Neu gap ky tu ket thuc thi dung
        JE DoneCounting
        INC CX
        INC SI
        JMP CountLoop
    
    DoneCounting:
        ; In ra man hinh xau TB2
        LEA DX, TB2
        MOV AH, 9
        INT 21H
    
        ; In so ky tu (CX chua do dai chuoi)
        MOV AX, CX
        MOV BX, 10
        XOR CX, CX
    
    PushLoop:
        XOR DX, DX
        DIV BX
        PUSH DX
        INC CX
        CMP AX, 0
        JNZ PushLoop
    
    PrintLoop:
        POP DX
        ADD DL, '0'
        MOV AH, 2
        INT 21H
        LOOP PrintLoop
    
        ; Ket thuc chuong trinh
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN
