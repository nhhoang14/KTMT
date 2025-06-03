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
    
    sit_end = $
    
.Code 
    ; THOI GIAN DEN TIN HIEU
       
    delay0.2s proc
        MOV CX, 0003H    
        MOV DX, 0D40H   
        MOV AH, 86H
        INT 15H
        ret
    delay0.2s endp
    
    delay1s proc
        MOV CX, 0FH 
        MOV DX, 4240H
        MOV AH, 86H
        INT 15H
        ret
    delay1s endp
    
    delay2s proc
        MOV CX, 001EH   
        MOV DX, 8480H
        MOV AH, 86H
        INT 15H
        ret
    delay2s endp
    
    delay5s proc
        MOV CX, 004CH    
        MOV DX, 4B40H
        MOV AH, 86H
        INT 15H
        ret
    delay5s endp
    
    ; Blink_light
    
    
MAIN Proc
    MOV AX, @DATA
    MOV DS, AX 

next:
    ; GIAI DOAN 1: CHI DUONG DOC HOAT ÐONG
    
    ; Xanh doc
    mov ax,s1
    out 4, ax
    call delay5s 
    
    mov ax,s2
    out 4, ax
    call delay0.2s
    
    mov ax,s1
    out 4, ax
    call delay0.2s
    
    mov ax,s2
    out 4, ax
    call delay0.2s
    
    mov ax,s1
    out 4, ax
    call delay0.2s
    
    mov ax,s2
    out 4, ax
    call delay0.2s
    
    ; Vang doc
    mov ax,s3
    out 4, ax
    call delay2s
    
    mov ax,off
    out 4, ax
    call delay0.2s
    
    mov ax,s3
    out 4, ax
    call delay0.2s
   
    mov ax,off
    out 4, ax
    call delay0.2s
    
    mov ax,s3
    out 4, ax
    call delay0.2s
    
    mov ax,off
    out 4, ax
    call delay0.2s
    
    ; GIAI DOAN 2: CHI ÐUONG NGANG HOAT ÐONG
    
    ; Xanh ngang
    mov ax,s4
    out 4, ax
    call delay5s
    
    mov ax,s5
    out 4, ax
    call delay0.2s
    
    mov ax,s4
    out 4, ax
    call delay0.2s
    
    mov ax,s5
    out 4, ax
    call delay0.2s
    
    mov ax,s4
    out 4, ax
    call delay0.2s 
    
    mov ax,s5
    out 4, ax
    call delay0.2s
           
    ; Vang ngang
    mov ax,s6
    out 4, ax
    call delay2s
    
    mov ax,off
    out 4, ax
    call delay0.2s
    
    mov ax,s6
    out 4, ax
    call delay0.2s
    
    mov ax,off
    out 4, ax
    call delay0.2s
    
    mov ax,s6
    out 4, ax
    call delay0.2s
    
    mov ax,off
    out 4, ax
    call delay0.2s
  
    JMP next
MAIN Endp
End MAIN
