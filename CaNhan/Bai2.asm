.Model Small
.Stack 100H
.Data
    TB1 DB 'Hay nhap mot ky tu: $' ; Khoi tao xau
    TB2 DB 13,10,'Ky tu da nhap: $'
    OUTPUT DB ? ; Khoi tao bien KyTu khong co gia tri ban dau
.Code
    MAIN Proc
        MOV AX, @DATA    ; Khoi dau thanh ghi DS
        MOV DS, AX    ; Tro thanh ghi ds ve dau doan data
    
        ; In ra man hinh xau TB1
        LEA DX, TB1    ; Dua con tro toi dia chi cua TBao1
        MOV AH, 9    ; Su dung ham ngat 9 cua ngat INT 21h
        INT 21H
    
        ; Nhap vao 1 ki tu tu ban phim
        MOV AH, 1    ; Su dung ham ngat 1 cua ngat INT 21h
        INT 21H
        MOV OUTPUT, AL    ; gan gia tri vua nhap (duoc luu o AL) vao bien KyTu
    
        ; In ra man hinh xau TB2
        LEA DX, TB2    ; Dua con tro toi dia chi cua TBao2
        MOV AH, 9    ; Su dung ham ngat 9 cua ngat INT 21h
        INT 21H
    
        ; Hien thi ky tu da nhap
        MOV AH, 2    ; Su dung ham ngat 2 cua ngat INT 21h
        MOV DL, OUTPUT    ; Hien thi ra man hinh ky tu da luu o DL
        INT 21H
    
        ; Ket thuc chuong trinh
        MOV AH, 4CH 
        INT 21H
    MAIN Endp
END MAIN
