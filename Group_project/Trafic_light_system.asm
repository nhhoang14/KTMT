#start=Traffic_Lights.exe#

name "traffic"
.Model Small
.Stack 100h
.Data
    ; FEDC_BA98_7654_3210
    situation dw 0000_0011_0000_1100b ; Xanh doc  
    s1 dw 0000_0011_0000_1100b ; Xanh doc
    s2 dw 0000_0010_1000_1010b  ; Vang doc
    s3 dw 0000_1000_0110_0001b  ; Xanh ngang
    s4 dw 0000_1000_0110_0001b  ; Xang ngang
    s5 dw 0000_0100_0101_0001b  ; Vang ngang
    sit_end = $

    all_red equ 0000_0010_0100_1001b
.Code
MAIN Proc
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, all_red
    OUT 4, AX
    
    MOV SI, offset situation

next:
    MOV AX, [SI]
    OUT 4, AX

    MOV CX, 0FH ; 004C4B40h = 5,000,000
    MOV DX, 4240H
    MOV AH, 86H
    INT 15H   
    
    MOV CX, 0FH ; 004C4B40h = 5,000,000
    MOV DX, 4240H
    MOV AH, 86H
    INT 15H
    
    ADD SI, 2   ; next situation
    CMP SI, sit_end
    JB  next
    MOV SI, offset situation
    JMP next
MAIN Endp
End MAIN
