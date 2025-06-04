#start=Traffic_Lights.exe#
name "traffic"
.Model Small
.Stack 100h
.Data
    ; FEDC_BA98_7654_3210 
    
    ; GIAI DOAN 1: CHI DUONG DOC HOAT ÐONG
    s1 dw 0000_0011_0000_1100b  ; Xanh doc + do ngang
    s2 dw 0000_0010_0000_1000b  ; Xanh doc tat + do ngang
    s3 dw 0000_0010_1000_1010b  ; Vang doc + do ngang
    
    ; GIAI DOAN 2: CHI ÐUONG NGANG HOAT ÐONG
    s4 dw 0000_1000_0110_0001b  ; Xanh ngang + do doc
    s5 dw 0000_0000_0100_0001b  ; Xanh ngang tat + do doc
    s6 dw 0000_0100_0101_0001b  ; Vang ngang + do doc
    
    off  dw 0000_0000_0000_0000b  ; Tat toan bo
    
    all_green dw 0000_1001_0010_0100b
    
    all_red dw 0000_0010_0100_1001b
    
    sit_end = $
    
.Code 
    ; THOI GIAN DEN TIN HIEU
       
    delay0.2s Proc
        PUSH AX
        PUSH CX
        MOV CX, 0003H    
        MOV DX, 0D40H   
        MOV AH, 86H
        INT 15H
        POP CX
        POP AX
        ret             
    delay0.2s Endp
    
    delay1s Proc
        PUSH AX
        PUSH CX
        MOV CX, 0FH 
        MOV DX, 4240H
        MOV AH, 86H
        INT 15H
        POP CX
        POP AX
        ret
    delay1s Endp
    
    delay2s Proc
        PUSH AX
        PUSH CX
        MOV CX, 001EH   
        MOV DX, 8480H
        MOV AH, 86H
        INT 15H
        POP CX
        POP AX
        ret
    delay2s Endp
    
    delay5s Proc
        PUSH AX
        PUSH CX
        MOV CX, 004CH    
        MOV DX, 4B40H
        MOV AH, 86H
        INT 15H
        POP CX
        POP AX
        ret
    delay5s Endp
    
    ; Nhap nhay den
    
    Blink_light Proc
        push cx
        mov cx, 2     ; so lan nhay
        
    loop_start:
        ; Xuat trang thai tat (BX)  
        xchg ax, bx
        out 4, ax
        call delay0.2s
        
        ; Xuat trang thai sang (AX)
        xchg ax, bx
        out 4, ax
        call delay0.2s
        
        loop loop_start
    
        ; Ket thuc bang trang thai tat
        xchg ax, bx
        out 4, ax
        call delay0.2s
        
        pop cx
        ret
    Blink_light Endp
    
    Check_Input Proc
        mov ah, 1
        int 21h
        
        cmp al, '1'
        je exit_program1
        cmp al, '2'
        je exit_program2
        
    no_input:
        ret
    
    
    exit_program2:
        mov ax, all_red
        out 4, ax
        call delay5s
        
        mov ax, off
        out 4, ax
        
        mov ah, 4Ch
        int 21h
    
    exit_program1:
        mov ax, all_green
        out 4, ax
        call delay5s
        
        mov ax, off
        out 4, ax
        
        mov ah, 4Ch
        int 21h
        
Check_Input Endp
     
    
MAIN Proc
    MOV AX, @DATA
    MOV DS, AX 
    
    call check_input
    
next:
    ; GIAI DOAN 1: CHI DUONG DOC HOAT ÐONG
    
    ; Xanh doc
    mov ax,s1
    out 4, ax
    call delay5s 
    
    mov ax,s1    
    mov bx,s2    
    call Blink_light
    
    ; Vang doc
    mov ax,s3
    out 4, ax
    call delay2s
    
    mov ax,s3    
    mov bx,off    
    call Blink_light
    
    ; GIAI DOAN 2: CHI ÐUONG NGANG HOAT ÐONG
    
    ; Xanh ngang
    mov ax,s4
    out 4, ax
    call delay5s
    
    mov ax,s4    
    mov bx,s5    
    call Blink_light
           
    ; Vang ngang
    mov ax,s6
    out 4, ax
    call delay2s
    
    mov ax,s6    
    mov bx,off    
    call Blink_light
  
    JMP next
MAIN Endp
End MAIN
