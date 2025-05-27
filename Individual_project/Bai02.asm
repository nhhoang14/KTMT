.MODEL SMALL
.STACK 100H
.DATA
    TB1 DB 'Hay nhap mot ky tu: $'      ; Khai bao TB1
    TB2 DB 13,10,'Ky tu da nhap: $'     ; Khai bao TB2
    OUTPUT DB ?                         ; Khai bao bien KyTu chua co gia tri
.CODE
    MAIN PROC
        ; Khoi tao thanh ghi DS
        MOV AX, @DATA
        MOV DS, AX
    
        ; In ra man hinh xau TB1
        LEA DX, TB1
        MOV AH, 9
        INT 21H
    
        ; Nhap 1 ky tu tu ban phim
        MOV AH, 1
        INT 21H
        MOV OUTPUT, AL
    
        ; In ra man hinh xau TB2
        LEA DX, TB2
        MOV AH, 9
        INT 21H
    
        ; Hien thi ky tu vua nhap
        MOV AH, 2
        MOV DL, OUTPUT
        INT 21H
    
        ; Ket thuc chuong trinh
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN
