title find_element                  ; checks if an element exists in an array

data segment
tab db 'a', 'b', 'c', 'd', 'e'
msg1 db "Enter a character : $"
msg2 db "Le valeur existe!$"
msg3 db "Le valeur n'existe pas!$"
data ends

stk segment stack
stk ends

printMsg macro msg                  ; a function to print a msg
mov dx, offset msg
mov ah, 09h							; prints until '$' (09h)
int 21h
endm

printNewLine macro
mov dl, 10							; 10: ascii code for a new line
mov ah, 02h							; print a char, new line in this case
int 21h
mov dl, 13
mov ah, 02h
int 21h
endm

code segment
assume cs: code, ds: data

main:
mov ax, data
mov ds, ax
; ask the user to enter a char
printMsg msg1
; get user input
mov ah, 01h
int 21h

mov bl, al							; store user input in the bl register

printNewLine						; print a new line

; loop through the array and check if user input exists in it
mov si, 0							; init loop counter to 0
bcl:
	cmp tab[si], bl
	je found

	inc si
	cmp si, 4
	jne bcl
	je not_found

	not_found:
		printMsg msg3				; print "n'existe pas"
		jmp exit

	found:
		printMsg msg2					; print "existe"

exit:
	mov ax, 4c00h
	int 21h
	code ends
	end main

