;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; National Chiao Tung University
; Department Of Computer Science
; 
; Assembly Programming Tests
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Write programs in the Release mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; $Student Name:楊卓耘
; $Student ID:0312512
; $Student Email:friedmeow@gmail.com
;
; Instructor Name: Sai-Keung Wong 
;
TITLE 

include Irvine32.inc
include Macros.inc
.data
xlength		DWORD		80
ylength		DWORD		24
n			DWORD		?
m			DWORD		?

.code
MAIN PROC
L0:
	Call ColorFrame
	Call Menu
	Call KeyCheck
One:
	Cmp al, '1'
	je L1
Second:
	Cmp al, '2'
	je L2
Third:
	Cmp al, '3'
	je L3
Fourth:
	Cmp al, '4'
	je L4
Fail:
	mwriteln "The Valid numbers are 1-4"
	mov eax, 500
	Call Delay
	jmp L0
L1:
	Call Clrscr
	mwriteln "1. Compute ( 2+4+6+…+2n )/m"
	mwriteln "Input n [0, 100]:"
	Call Input
	Cmp n, 0
	je L0
	mwriteln "Input m (non-zero, signed integer):"
	Call ReadDec 
	mov m, eax

	Call WriteInt

	Call KeyCheck
	mov eax, 15
	Call SetTextColor
	jmp L0

L2:
	Call Clrscr
	Call KeyCheck
	mov eax, 15
	Call SetTextColor
	jmp L0
L3:
	Call Clrscr
	Call KeyCheck
	mov eax, 15
	Call SetTextColor
	jmp L0
L4:
	Call Clrscr
	jmp Lend

Lend:
	exit
MAIN ENDP

KeyCheck PROC
LCheck:
	Call ReadKey
	jz LCheck
	ret
KeyCheck ENDP

Input PROC
Linput:
	Call ReadInt
	Cmp eax, 100
	jg Labovehundred
	Cmp eax, 0
	jl Lbelowzero
	mov n, eax
	ret
Lbelowzero:
	mwriteln "Input n is less than 0"
	jmp Linput
Labovehundred:
	mwriteln "Input n is greater than 100"
	jmp Linput

Input ENDP

MENU PROC
	mov eax, white + blue * 16
	Call SetTextColor
	mov dl, 3
	mov dh, 1
	Call GotoXY
	mwriteln "My student ID is: 0312512"
	inc dh
	mov dl, 3
	Call GotoXY
	mwriteln "Please select one of the option"
	inc dh
	mov dl, 3
	Call GotoXY
	mwriteln "1. Compute (2+4+6+…+2n)/m"
	inc dh
	mov dl, 3
	Call GotoXY
	mwriteln "2. Compute (2-4+6-…+(-1)^(n+1) 2n)*m"
	inc dh
	mov dl, 3
	Call GotoXY
	mwriteln "3. Compute S(n)."
	inc dh
    mov dl, 3
	Call GotoXY
	mwriteln "Define S(n) = S(n-1) + S(n-2), n>=2."
	inc dh
	mov dl, 3
	Call GotoXY
	mwriteln "S(0) = 1, S(1) = 3.5."
	inc dh
	mov dl, 3
	Call GotoXY
	mwriteln "4. Quit the program"
	inc dh
	mov dl, 3
	Call GotoXY
	mwriteln "Please select an option……"
	mov dl, 3
	inc dh
	Call GotoXY
	ret
MENU ENDP
ColorFrame PROC
	mov eax, white + blue * 16
	Call SetTextColor
	Call Clrscr

	mov dl, 0
	mov dh, 0
	mov eax, green + green * 16
	mov al, ' '
	Call SetTextColor
	Call GotoXY
	mov ecx, xlength
LUp:
	Call WriteChar
	loop Lup

	mov dl, 0
	mov dh, 1
	mov ecx, ylength
Lleft:
	Call GotoXY
	Call WriteChar
	inc dh
	loop Lleft

	mov dh, 24
	mov dl, 0
	Call GotoXY
	mov ecx, xlength
LDown:
	Call WriteChar
	Loop LDown

	
	mov dh, 24
	mov ecx, ylength
LRight:
	mov dl, 79
	Call GotoXY
	Call WriteChar
	dec dh
	Loop LRight

	mov dl, 0
	mov dh, 0
	Call GotoXY

	ret

ColorFrame ENDP

END MAIN
