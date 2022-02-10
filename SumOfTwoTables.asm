title sum_tabs					; a program that takes 2 arrays tab1 and tab3 and return their sum in tab3

data segment
tab1 db 1, 2, 3, 4
tab2 db 2, 3, 4, 5
tab3 db 4 dup(0)
data ends

stk segment stack
dw 100 dup(?)
stk ends

code segment
assume cs: code, ds: data

main:
mov ax, data
mov ds, ax

; loop to fill the table of sums (tab3)
mov si, 0
bcl:
mov bl, 0
; tab3[i] = tab1[si] + tab2[si]
add bl, tab1[si]
add bl, tab2[si]
mov tab3[si], bl
inc si
cmp si, 4
jne bcl

; loop to print the content of tab3
mov si, 0
bcl2:
mov dl, tab3[si]
add dl, 30h						; convert int to char
mov ah, 02h						; print char
int 21h
; print a space after each
mov dl, 32
mov ah, 02h
int 21h
inc si
cmp si, 4
jne bcl2

mov ah, 4ch
int 21h
code ends
end main
