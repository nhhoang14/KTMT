.Model Small
.Stack 100H
.Data
    TB1 DB 'Chuoi ban dau la: Kien truc may tinh'  ; Khai bao TB1
    TB2 DB 13,10,'Tong chieu dai cua chuoi: $'  ; Khai bao TB2
    S   DB 'Kien truc may tinh$' ; Chuoi can dem
.Code
    MAIN Proc
        ; Khoi tao cho thanh ghi DS
        MOV AX, @DATA
        MOV DS, AX
        
        ; In ra man hinh xau TB1
        LEA DX, TB1
        MOV AH, 9  
        INT 21H
        
        ; In ra man hinh xau TB2
        LEA DX, TB2
        MOV AH, 9
        INT 21H
        
        ; Tinh chieu dau chuoi
        XOR AX, AX
        MOV AL, S+1 ; Chuyen chieu dai chuoi vao AX 
        MOV CX, 0   ; Khoi tao bien dem (count)
        MOV BX, 10  ; Khoi tao so chia
        
    PushLoop:    ; Day cac so vao ngan xep
        MOV DX, 0   ; Khoi tao phan du bang 0
        DIV BX  ; Chia 10
        PUSH DX ; Lay DX la phan du day vao ngan xep
        INC CX  ; Tang CX len 1 don vi
        CMP AX, 0   ; So sanh AX phan thuong (khac 0 thi tiep tuc vong lap)
        JNZ PushLoop ; Jump not zero  
        
    PrintLoop:    ; Lay cac so tu ngan xep ra
        POP DX  ; Chua so du trong phep chia  
        ADD DX, '0' ; Chuyen chu so -> ky tu so
        MOV AH, 2
        INT 21H
        LOOP PrintLoop
        
        ; Ket thuc tro ve chuong trinh goi
        MOV AH, 4CH
        INT 21H
    MAIN Endp
END MAIN
