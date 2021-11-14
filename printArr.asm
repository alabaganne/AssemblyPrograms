; a program that reads and prints an array (tp2)
title tp2
data segment
	; tab: array of characters
	; db: declare byte
	tab db 'a', 'b', 'c', 'd'
ends

code segment
	assume cs: code, ds: data

main:
	mov ax, data
	mov ds, ax
	; init the index to 0, will be used as an index of item in tab array
	mov si, 0

	; cx register: stores the loop count, it keeps decrementing on each iteration, once it's equal to 0, the loop will end
	mov cx, 4
	; in this case, the loop will run 4 times
	bcl:
		mov dl, tab[si]

		; the following 2 lines are for priting whatever in the dl register
		mov ah, 02h
		int 21h

		; when si = 0, tab[si] is equal to tab[0] which is equal to the character 'a'
		inc si,
		loop bcl

	; terminate the program, the content of al is used as a return code
	mov ah, 4ch
	int 21h

code ends
end main
