INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
n					DWORD ?
numarray	DWORD 1024 DUP(?)
sum				DWORD 0
myBytes BYTE 3, 4, 4
source  BYTE  "This is the source string",0
target  BYTE  ($-source)/BYTE

.code
MAIN PROC
	call ReadInt
	cmp eax, 2
	je L2
	mwriteln "Please input the terms:"
	Call ReadInt
	mov n, eax
	
	mwriteln "Please input numbers:"
	mov ecx, n
	mov esi, 0
Linnum:
	Call ReadInt
	mov numarray[esi*TYPE numarray], eax
	inc esi
	loop Linnum

	mov ecx, n
	mov esi, 0
Lsum:
	mov eax, numarray[esi*TYPE numarray]
	neg eax
	add sum, eax
	inc esi
	Loop Lsum

	mov eax, sum
	Call WriteInt
L2:

	mov  esi,0		; index register
	mov  ecx,SIZEOF source		; loop counter
L1:
	mov  al,source[esi]		; get char from source
	mov  target[esi],al		; store it in the target
	call writechar
	inc  esi		; move to next character
	loop L1		; repeat for entire string


	Call ReadInt
	exit
MAIN ENDP
END MAIN
