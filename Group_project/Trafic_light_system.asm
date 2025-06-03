#start=Traffic_Lights.exe#
name "traffic"
.Model Small
.Stack 100h
.Data
    ; FEDC_BA98_7654_3210 
    
    s1 dw 0000_0011_0000_1100b  ; Xanh doc
    s2 dw 0000_0010_0000_1000b  ; Xanh doc tat
    s3 dw 0000_0010_1000_1010b  ; Vang doc
    
    s4 dw 0000_1000_0110_0001b  ; Xanh ngang
    s5 dw 0000_0000_0100_0001b  ; Xanh ngang tat
    s6 dw 0000_0100_0101_0001b  ; Vang ngang
    
    off  dw 0000_0000_0000_0000b  ; Tat toan bo
    
    sit_end = $
.Code 

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
    MOV AH, 86H
    INT 15H
    ret
delay2s endp

delay5s proc
    MOV CX, 004CH    
    MOV AH, 86H
    INT 15H
    ret
delay5s endp

MAIN Proc
     MOV AX, @DATA
    MOV DS, AX 

next:
    ;xanh doc
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
    
    ;vang doc
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

    ;xanh ngang
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
           
    ;vang ngang
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
