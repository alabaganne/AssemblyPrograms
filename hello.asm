title hello

data segment
msg db "hello world $"
ends

code segment
assume cs: code, ds: data

main:
mov dl, offset msg
mov ah, 09h
int 21h

mov ax, 4c00h
int 21h
code ends
end main