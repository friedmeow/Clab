TITLE					 LAB TWO
;Student ID: 0312512
;Student Name: 楊卓耘
;Student Email: friedmeow@gmail
INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
xlength								DWORD		80
ylength								DWORD		9	
yptwolength						DWORD		25	
counter								DWORD		?	
SelectColorMessage			BYTE				"Please select a color for the space ship." , 0
shipcolor							BYTE				'0'
defaultcolor						BYTE				'0'
beep									BYTE				' ', 7
dlposition							BYTE				?
dhposition							BYTE				?
space									BYTE				' ', 0

.code
main PROC
L0:
	Call ChooseColor
	Call ColorFrame
	Call Menu
	Call KeyCheck 

First:
	cmp al, '1'
	je L1
	jne Second
Second:
	cmp al, '2'
	je L2 
	jne Third
Third:
	cmp al, '3'
	je L3 
	jne Fourth
Fourth:
	cmp al, '4'
	je L4 
	jne Fifth
Fifth:
	cmp al, '5' 
	je L5
	jne Fail
Fail:
	mwriteln "The valid numbers are 1 - 5 "
	mov eax, 1500
	call delay
	call clrscr
	jmp L0

 L1:
	Call Clrscr
	Call ShowMessage
	mov dh, 1
	mov dl, 20
	Call GotoXY
	mov eax, yellow + yellow*16
	Call SetTextColor
	Call Rectangle
	mov eax, green + green*16
	Call SetTextColor
	mov dh, 1
	add dl, 15
	Call GotoXY
	Call Rectangle
	mov eax, blue + blue*16
	Call SetTextColor
	mov dh, 1
	add dl, 15
	Call GotoXY
	Call Rectangle
	Call ColorNumber
	

	Call ShipColorNum
	mov eax, 15
	Call SetTextColor
	Call Clrscr
	jmp L0
 L2:
	Call Clrscr

	Call PTwoColor
	Call ShowaFrame

	Call KeyCheck 
	mov eax, 15
	Call SetTextColor
	Call Clrscr
	jmp L0
 L3:
	Call Clrscr

	Call PTwoColor
	mov ylength, 25
	Call ColorFrame
	mov ylength, 9
	Call ShipMove

	Cmp dl, 74
	je Reached
	;Call UpdatePosition



Reached:
	mov eax, 15
	Call SetTextColor
	Call Clrscr
	jmp L0

 L4:
	Call Clrscr
	mWriteln "4) Show student information"
	mWriteln "Student ID: 0312512 "
	mWriteln "Student Name: 楊卓耘 "
	mWriteln "Student Email: friedmeow@gmail.com "
	Call KeyCheck 
	mov eax, 15
	Call SetTextColor
	Call Clrscr
  	jmp L0
 L5:
	Call Clrscr
	Exit

main ENDP

ChooseColor PROC
Default:
	mov al, shipcolor
	cmp defaultcolor, '0'
	jnz LYellow
	cmp shipcolor, '0'
	jnz LYellow
	mov eax, yellow + yellow * 16
	Call SetTextColor
	jmp LEnd
LYellow:
	cmp al, '1'
	jne LGreen
	mov eax, yellow + yellow * 16
	mov defaultcolor, '1'

	jmp Set
LGreen:
	cmp al, '2'
	jne LBlue
	mov eax, green + green * 16
	mov defaultcolor, '1'

	jmp Set
LBlue:
	cmp al,'3'
	jne LChooseAgain
	mov eax, blue + blue * 16
	mov defaultcolor, '1'

	jmp Set
LChooseAgain:
	mwriteln "The valid numbers are 1 - 3 "
	mov eax, 1500
	call delay
	call ShipColorNum
	jmp Default

Set:
	Call SetTextColor

LEnd:
	ret
ChooseColor ENDP

ColorFrame PROC
	mov dl, 0
	mov dh, 0
	call GotoXY

	mov ecx, xlength
LUp:
	mov al, " "
	call WriteChar
	inc dl
	call GotoXY
	loop LUp
	
	mov ecx, ylength
LLeft:
	mov dl, 0
	call GotoXY
	mov al, " "
	call WriteChar
	inc dh
	loop LLeft

	mov ecx, xlength
	sub ecx, 2	
LDown:
	mov al, " "
	call WriteChar
	inc dl
	loop LDown

	mov ecx, ylength
    inc dl
LRight:
	mov al, " "
	call WriteChar
	dec dh
	call GotoXY
	loop LRight
	ret

ColorFrame ENDP

Menu PROC
;;;; ********************** 
;;;; ********************** The method to set line is a little complicated
;;;; ********************** 
	mov eax, white + black * 16
	Call SetTextColor
	mov dh, 1
	mov dl, 1
	Call GotoXY
	mWriteln "1) Change the space ship color"
	inc dh
	Call GotoXY
	mWriteln "2) Show a frame around the screen rectangula area"
	inc dh
	Call GotoXY
	mWriteln "3) Play a game"
	inc dh
	Call GotoXY
	mWriteln "4) Show student information"
	inc dh
	Call GotoXY
	mWriteln "5) Quit "
	inc dh
	Call GotoXY
	mWriteln " "
	inc dh
	Call GotoXY
	mWriteln "Please select an option…… "
	ret
Menu ENDP



ShipColorNum PROC
LKeyCheck:
	mov eax, 500
	Call Delay
	Call ReadKey
	jz LKeyCheck
	mov shipcolor, al
	mov ax, 7
	Call WriteChar
	ret

ShipColorNum ENDP

KeyCheck PROC
LKeyCheck:
	mov eax, 50
	Call Delay
	Call ReadKey
	jz LKeyCheck
	ret
KeyCheck ENDP


;;;;*******L1 Functions
ShowMessage PROC
	mov dl, 20
	mov dh, 0
	Call GotoXY
	mov edx, OFFSET SelectColorMessage
	Call WriteString
	ret
ShowMessage ENDP

Rectangle PROC
	mov al, 'a'

	;;Call ChooseColor
	mov ecx, 3
Lwidth:
	Call WriteChar
	loop Lwidth

	inc dh
	Call GotoXY
	mov ecx, 3
Lheight:
	Call WriteChar
	loop Lheight
	ret
Rectangle ENDP

ColorNumber PROC
	mov eax, white
	Call SetTextColor
	mov dl, 21
	mov dh, 3
	Call GotoXY
	mov al, '1'
	Call WriteChar
	add dl, 15
	Call GotoXY
	mov al, '2'
	Call WriteChar
	add dl, 15
	Call GotoXY
	mov al, '3'
	Call WriteChar
	ret
ColorNumber ENDP

;;;; L2 Functions

ShowaFrame PROC


	mov ecx, yptwolength
LLeft:
	mov dl, 0
	call GotoXY
	mov al, " "
	mov eax, 50
	Call Delay
	call WriteChar
	inc dh
	loop LLeft

	mov ecx, xlength
	sub ecx, 2	
LDown:
	mov al, " "
	mov eax, 50
	Call Delay
	call WriteChar
	inc dl
	loop LDown

	mov ecx, yptwolength
    inc dl
LRight:
	mov al, " "
	mov eax, 50
	Call Delay
	call WriteChar
	dec dh
	call GotoXY
	loop LRight

	mov dh, 0
	call GotoXY

	mov ecx, xlength
LUp:
	mov al, " "
	mov eax, 50
	Call Delay
	call WriteChar
	dec dl
	call GotoXY
	loop LUp

	ret

ShowaFrame ENDP

PTwoColor PROC
	mov al, shipcolor
	cmp shipcolor, '0'
	je LYellowplum
LYellow:
	cmp shipcolor,'1'
	jne LGreen
LYellowplum:
	mov eax, yellow + yellow*16
	jmp Lset
LGreen:
	cmp shipcolor, '2'
	jne LBlue
	mov eax, green + green * 16
	jmp Lset
LBlue:
	cmp shipcolor, '3'
	mov eax, blue + blue * 16
LSet:
	Call SetTextColor
	ret
PTwoColor ENDP


;;;;******L3 Functions

SpaceShip PROC
	mov ecx, 3
LShip:
	mov al, 'a'
	Call WriteChar
	loop Lship
	ret
SpaceShip ENDP

ShipMove PROC
	
	mov dl, 1
	mov dh, 6
	Call GotoXY
	Call ptwocolor
	Call SpaceShip
	mov dl, 1
	mov dh, 6
	Call GotoXY
	mov ecx, 73 
LMove:	


	push ecx
	mov eax, black + black * 16
	Call SetTextColor
	Call SpaceShip
	Call ptwocolor
	Call SpaceShip
	inc dl

pop ecx
	mov counter, ecx
	mov eax, 50
	Call Delay
	mov dlposition, dl
	mov dhposition, dh
	push dx
	Call UpdatePosition
	pop dx
	mov dl, dlposition
	mov dh, dhposition

	Call GotoXY
	mov ecx, counter
	loop LMove

	ret
ShipMove ENDP

SpaceCheck PROC

	Call ReadKey
	mov al, space
	cmp al, space
	ret
SpaceCheck ENDP

UpdatePosition PROC
	mov dl, dlposition
	mov dh, dhposition
	Call ReadKey
	cmp al, ' '
	jne Lcompare
LSpaceCheck:
	mov counter, 1
	jmp Lend
Lcompare:
	cmp al, 'e'
	je Lee
	jne Lc
Lee:
	cmp dhposition, 1
	je Lend
	add dlposition, 2
	mov dl, dlposition
	mov dh, dhposition
	Call GotoXY
	mov eax, black + black * 16
	Call SetTextColor
	Call SpaceShip
	dec dhposition
	sub dlposition, 2
	jmp Lend
Lc:
	cmp al, 'c'
	je Lcdo
	jne Lend
Lcdo:
	cmp dhposition, 23
	je Lend
	add dlposition, 2
	mov dl, dlposition
	mov dh, dhposition
	Call GotoXY
	mov eax, black + black * 16
	Call SetTextColor
	Call SpaceShip
	inc dhposition
	sub dlposition, 2
	jmp Lend
;Lspace:
;	cmp al, ' '
;	je Lend
Lend:
	
	ret
UpdatePosition ENDP

END main
