#start=Traffic_Lights.exe#

name "traffic"
.Model Small
.Stack 100h
.Data
    ; FEDC_BA98_7654_3210
    situation dw 0000_0011_0000_1100b
    s1 dw 0000_0110_1001_1010b
    s2 dw 0000_1000_0110_0001b
    s3 dw 0000_1000_0110_0001b
    s4 dw 0000_0100_1101_0011b
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

    MOV cx, 0FH ; 004C4B40h = 5,000,000
    MOV dx, 4240H
    MOV ah, 86H
    INT 15H   
    
    MOV cx, 0FH ; 004C4B40h = 5,000,000
    MOV dx, 4240H
    MOV ah, 86H
    INT 15H
    
    ADD SI, 2   ; next situation
    CMP SI, sit_end
    JB  next
    MOV SI, offset situation
    JMP next
MAIN Endp
End MAIN
