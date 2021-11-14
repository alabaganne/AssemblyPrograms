title find_sub_str                   ; read ch1 | make a procedure that takes ch1 and ch2 as args and check if ch2 exists in ch1 | keep reading until ch2 in ch1

data segment
input_msg1 db "enter ch1 : $"
input_msg2 db "enter ch2 : $"
result_msg1 db "ch2 exists in ch1. end of program. $"
result_msg2 db "ch2 does not exist in ch1. try again! $"
ch1 db 32, 0, 32 dup('$')
ch2 db 32, 0, 32 dup('$')
data ends

stk segment stack
db 16 dup(?)
stk ends

; functions
print macro arg                      ; print function
mov dl, offset arg
mov ah, 09h
int 21h
endm

println macro
mov dl, 10                           ; 10: ascii code for new line
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h
endm

read_str macro arg
mov dl, offset arg
mov ah, 0ah
int 21h
println
endm

lengthStr macro arg
endm
; end functions

code segment
assume cs: code, ds: data, ss: stk

start:
    ; read ch1
    print input_msg1
    read_str ch1

loop1:
    ; read ch2
    print input_msg2
    read_str ch2
    push ch1
    push ch2

close:
    mov ax, 4c00h
    int 21h

code ends
end main
