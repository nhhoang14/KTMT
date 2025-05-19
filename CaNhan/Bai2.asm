.Model Small
.Stack 100H
.Data
    TB1 DB 'Hay nhap mot ky tu: $'  ; Khai bao TB1
    TB2 DB 13,10,'Ky tu da nhap: $' ; Khai bao TB2
    OUTPUT DB ? ; Khai bao bien Kytu khong co gia tri ban dau
.Code
    MAIN Proc
        ; Khoi tao cho thanh ghi DS
        MOV AX, @DATA   ; Nap dia chi doan du lieu vao AX
        MOV DS, AX  ; Nap dia chi doan du lieu vao DS
    
        ; In ra man hinh xau TB1
        LEA DX, TB1 ; Nap dia chi TB1 vao DX
        MOV AH, 9   ; Dung ham ngat 9 cua ngat 21H
        INT 21H
    
        ; Nhap vao 1 ki tu tu ban phim
        MOV AH, 1   ; Dung ham ngat 1 cua ngat 21H
        INT 21H
        MOV OUTPUT, AL  ; Nap gia tri vua nhap (duoc luu o AL) vao bien KyTu
    
        ; In ra man hinh xau TB2
        LEA DX, TB2 ; Nap dia chi TB2 vao DX
        MOV AH, 9   ; Dung ham ngat 9 cua ngat 21H
        INT 21H
    
        ; Hien thi ky tu da nhap
        MOV AH, 2   ; Su dung ham ngat 2 cua ngat 21h
        MOV DL, OUTPUT  ; Hien thi ra man hinh ky tu da luu o DL
        INT 21H
    
        ; Ket thuc tro ve chuong trinh goi
        MOV AH, 4CH ; Dung ham 4CH cua ngat 21H
        INT 21H
    MAIN Endp
END MAIN
