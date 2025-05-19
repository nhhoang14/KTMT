.Model Small
.Stack 100H
.Code
MAIN Proc
    MOV AH, 1 ; Nhap 1 ki tu tu ban phim
    INT 21H
    MOV BL, AL ; Gan AL vao BL
    
    MOV AH, 2 
    MOV DL, 0DH ; CR
    INT 21H
    MOV DL, 0AH ; LR
    INT 21H
    
    MOV DL, BL ; Gan BL vao Dl 
    INT 21H
    
    MOV AH, 4CH ; Ket thuc chuong trinh
    INT 21H
MAIN Endp
