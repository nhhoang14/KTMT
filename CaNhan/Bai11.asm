.Model small
.Stack 100H
.Data
    TB1 DB 'Gia tri lon nhat cua mang: $'
    TB2 DB 'Gia tri nho nhat cua mang: $'                
    list DB 1,2,3,4,5,6,7,8,0
    MIN DB ?
    MAX DB ?   
.Code
    MAIN Proc           
        MOV AX, @DATA
        MOV DS, AX
                   
        MOV CX, 9                         
        LEA SI, LIST       ; dua gia tri dau tien cua chuoi vào si
        MOV BL, [SI]    ; dua dia chi si vào bl
        INC SI               ; tang gia tri si them 1
    Start:
        LODSB        
        CMP AL, AL ; so sanh al va bl 
        JGE BYPASS;   nhay denn BYPASS               
        MOV BL, AL;      neu al > bl thi gan bl = al;
        BYPASS:
        LOOP Start  ; lap
        
        LEA DX, TB1
        MOV AH, 9
        INT 21H
         
        ; print the max
        ADD BL, '0' ; 	ep kieu so ve kieu ke tu
        MOV DL,BL   ; dua gia tri max bl vào dl;
        MOV AH, 2  ; in ra màn hình
        INT 21H
            
        MOV AH, 4CH ; ket thuc chuong trinh
        INT 21H
    MAIN Endp
END MAIN
