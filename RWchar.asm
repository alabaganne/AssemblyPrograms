; Programme qui permet de saisir et afficher un charactere
title tp1;

data segment
	msg db "Saisir une donnee : ", 0dh, 0ah, "$"
ends

code segment
	assume cs: code, ds: data

main:
	mov ax, data
	mov dx, ax
	
	mov dl, offset msg
	mov ah, 09h
	int 21h

	; saisie
	mov ah, 01h
	int 21h

	; affichage
	mov dl, al
	mov ah, 02h
	int 21h

	mov ax, 4c00h
	int 21h

code ends
end main
