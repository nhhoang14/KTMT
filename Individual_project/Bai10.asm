.Model Small
.Stack 100H
.Data
    TB1 DB 'Hay nhap mot chuoi: $'  ; Khai bao TB1
    TB2 DB 13,10,'Tong chieu dai cua chuoi: $'  ; Khai bao TB2
    S DB 100 DUP('$') ; Chuoi nhap vao
.Code
    MAIN Proc
        ; Khoi tao cho thanh ghi DS
        MOV AX, @DATA   ; Nap dia chi doan du lieu vao AX
        MOV DS, AX  ; Nap dia chi doan du lieu vao DS
        
        ; In ra man hinh xau TB1
        LEA DX, TB1 ; Nap dia chi TB1 vao DX
        MOV AH, 9   ; Dung ham ngat 9 cua ngat 21H   
        INT 21H
        
        ; Nhap chuoi S
        LEA DX, S   ; Nap dia chi S vao DX
        MOV AH, 10  ; Dung ham ngat 10 cua ngat 21H
        INT 21H
        
        ; In ra man hinh xau TB2
        LEA DX, TB2 ; Nap dia chi TB1 vao DX
        MOV AH, 9   ; Dung ham ngat 9 cua ngat 21H
        INT 21H
        
        ; Tinh chieu dau chuoi
        XOR AX, AX
        MOV AL, S+1 ; Chuyen chieu dai chuoi vao AX 
        MOV CX, 0   ; Khoi tao bien dem (count)
        MOV BX, 10  ; Khoi tao so chia
        
    LapDem1:    ; Day cac so vao ngan xep
        MOV DX, 0   ; Khoi tao phan du bang 0
        DIV BX  ; Chia 10
        PUSH DX ; Lay DX la phan du day vao ngan xep
        INC CX  ; Tang CX len 1 don vi
        CMP AX, 0   ; So sanh AX phan thuong (khac 0 thi tiep tuc vong lap)
        JNZ LapDem1 ; Jump not zero  
        
    LapDem2:    ; Lay cac so tu ngan xep ra
        POP DX  ; Chua so du trong phep chia  
        ADD DX, '0' ; Chuyen chu so -> ky tu so
        MOV AH, 2   ; Su dung ham ngat 2 cua ngat 21h
        INT 21H
        LOOP LapDem2
        
        ; Ket thuc tro ve chuong trinh goi
        MOV AH, 4CH ; Dung ham 4CH cua ngat 21H
        INT 21H
    MAIN Endp

END MAIN
