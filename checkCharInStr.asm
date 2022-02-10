title tp1                   ; keep reading until getting 'a' input

data segment
    start_msg db "the program will exit once the input is equal to 'a' $"
    exit_msg db "you entered an 'a', end of program! $"
data ends

code segment
assume cs: code, ds: data

main:
mov dl, offset start_msg    ; print start_msg
mov ah, 09h                 ; output operation
int 21h

; print a new line
mov dl, 10                  ; 10: ascii code for a new line
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h

bcl:
    mov ah, 01h             ; input operation, will be saved in the "al" register
    int 21h

    cmp al, 'a'
    jne bcl                 ; if input is different than 'a', repeat


; print a new line
mov dl, 10
mov ah, 02h
int 21h
mov dl, 13
mov ah, 02h
int 21h

mov dl, offset exit_msg     ; put exit msg in the dl message for printing
mov ah, 09h                 ; prepare for print operation
int 21h                     ; execute operation

mov ax, 4c00h               ; prepare for exit operation
int 21h                     ; execute exit
code ends
end main