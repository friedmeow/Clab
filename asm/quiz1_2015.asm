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
m			SDWORD		?
minusone	SDWORD		1
sum			SDWORD		0
floatsum	REAL8		?
zero		REAL8		0.0
S0			REAL8		1.0
S1			REAL8		3.5
farray		REAL8		0.0, 1024 DUP(?)

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
	Call InputOne
	Cmp n, 0
	je Loneend
	mwriteln "Input m (non-zero, signed integer):"
	Call ReadInt 
	mov m, eax
	Call SummingOne
	
	mov eax, sum

	cdq
	mov ebx, m
	idiv ebx

	mwriteln "Quotient:"
	Call WriteInt
	mwriteln " "
	mwriteln "Remainder:"
	mov eax, edx
	Call WriteInt
	mov eax, 3000
	Call Delay
	jmp L1
Loneend:
	mov eax, 15
	Call SetTextColor
	jmp L0

L2:
	Call Clrscr
	mwriteln "2. Compute (2-4+6-…+(-1)^(n+1) 2n)*m"
	mwriteln "Please input n [0, 50]:"
	Call InputTwo
	Cmp n, 0
	je Ltwoend
	mwriteln "Input m (non-zero, signed integer):"
	Call ReadInt 
	mov m, eax
	Call SummingTwo
	mov eax, sum
	imul m
	mwriteln "Result:"
	Call Writeint
	mov eax, 3000
	Call Delay
	jmp L2
Ltwoend:
	mov eax, 15
	Call SetTextColor
	jmp L0
L3:
	Call Clrscr
	mwriteln "3.Compute S(n)."
	mwriteln "Define S(n) = S(n-1) + S(n-2), n>=2. "
	mwriteln "S(0) = 1.0, S(1) = 3.5"
	mwriteln "Please input n:"
	Call InputThree
	Cmp n, 0
	je Lthreeend
	Call SummingThree
	mov ebx, n
	mwriteln "Result:"
	finit
	fld farray[ebx*TYPE REAL8]	
	Call WriteFloat
	mov eax, 3000
	Call Delay
	jmp L3
Lthreeend:
	mov eax, 15
	Call SetTextColor
	jmp L0
L4:
	Call Clrscr
	mwriteln "Thanks for playing this system."
	mwriteln "This program is written by"
	mwriteln "Name: 楊卓耘"
	mwriteln "ID: 0312512"
	mwriteln "I am learning assembly programming."
	mwriteln "Please contact me at friedmeow@gmail.com"
	mov eax, 5000
	Call delay
	jmp Lend

Lend:
	exit
MAIN ENDP

SummingThree PROC

	mov ecx, 1024
	mov ebx, 0
LSetZero:
	finit
	fld zero
	fld farray[ebx*TYPE REAL8]	
	fmul ST(0), ST(1)
	fst farray[ebx*TYPE REAL8]	
	inc ebx
	loop LSetZero

	mov ebx, 0
	finit
	fld S0
	fst farray[ebx*TYPE REAL8]	
	inc ebx
	finit
	fld S1
	fst farray[ebx*TYPE REAL8]

	mov ecx, n
	dec ecx
	mov ebx, 2
Lsum:
	finit
	sub ebx, 2
	fld farray[ebx*TYPE REAL8]	
	add ebx, 2
	fld farray[ebx*TYPE REAL8]	
	fadd ST(0), ST(1)
	fst farray[ebx*TYPE REAL8]
	finit
	dec ebx
	fld farray[ebx*TYPE REAL8]	
	inc ebx
	fld farray[ebx*TYPE REAL8]	
	fadd ST(0), ST(1)
	fst farray[ebx*TYPE REAL8]
	inc ebx	
	loop Lsum
	


	ret
SummingThree ENDP

SummingTwo PROC
	mov sum, 0
	mov ecx, n
	mov eax, 1
	mov minusone, 1
Lsum:
	imul eax, minusone
	add sum, eax
	cmp eax, 0
	jl LabsoluteVa
	jmp Lcontinue
LabsoluteVa:
	neg eax
Lcontinue:
	inc eax
	neg minusone
	loop Lsum
	mov eax, sum
	imul eax, 2
	mov sum, eax
	ret
SummingTwo ENDP

SummingOne PROC
	mov sum, 0
	mov ecx, n
	mov eax, 1
Lsum:
	add sum, eax
	inc eax
	loop Lsum
	mov eax, sum
	imul eax, 2
	mov sum, eax
	ret
SummingOne ENDP

KeyCheck PROC
LCheck:
	Call ReadKey
	jz LCheck
	ret
KeyCheck ENDP
InputThree PROC
Linput:
	Call ReadInt
	Cmp eax, 0
	je Lsavezero
	Cmp eax, 2
	jl Lbelowtwo
	mov n, eax
Lend:
	ret
Lbelowtwo:
	mwriteln "Input n is less than 2"
	jmp Linput
Lsavezero:
	mov n, 0
	jmp Lend
InputThree ENDP
InputTwo PROC
Linput:
	Call ReadInt
	Cmp eax, 50
	jg Labovefifty
	Cmp eax, 0
	jl Lbelowzero
	mov n, eax
	ret
Lbelowzero:
	mwriteln "Input n is less than 0"
	jmp Linput
Labovefifty:
	mwriteln "Input n is greater than 50"
	jmp Linput

InputTwo ENDP

InputOne PROC
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

InputOne ENDP

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
