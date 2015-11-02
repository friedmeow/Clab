TITLE Lab1
;Student ID: 0312512
;Student Name: 楊卓耘
;Student Email: friedmeow@gmail.com
include Irvine32.inc
include Macros.inc



.data
xlength				  DWORD		80                                                                         
ylength				  DWORD		26
numberarray       SDWORD	1024 DUP(?)
unnumberarray	  DWORD		1024 DUP(?)
farray					  DWORD		1024 DUP(?)
xco						  BYTE			0
yco						  BYTE			0
x							  REAL8			1.0
two						  REAL8			2.0
minusone			  DWORD		-1
xarray					  REAL8			1.0, 1024 DUP(?)
nterms					  DWORD		0
xterms					  DWORD		0
losterms				  DWORD		0
fac						  DWORD		0
three					  DWORD		3
sinsum				  REAL8			0.0
zero						  REAL8			0.0

.code
main PROC

L0:
;;;;**** Main *************************	

	mWriteln "1) Show colorful frames "
	mWriteln "2) Sum up signed integers "
	mWriteln "3) Sum up unsigned integers "
	mWriteln "4) Compute sin(x) "
	mWriteln "5) Show student information "
	mWriteln "6) Quit "
	mWriteln " "
	mWriteln "Please select an option…… "
	

LCheckKey:
	mov eax,500
	call Delay
	call ReadKey
	jz LCheckKey
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
	jne Sixth
Sixth:
	cmp al, '6' 
	pushad
	je L6
	popad
	jne Fail
Fail:
	mwriteln "The valid numbers are 1 - 6 "
	mov eax, 1500
	call delay
	call clrscr
	jmp L0
	
L1:
;;;;**** First *************************	

	call Clrscr
	call Randomize
	push eax
	call Color
	
	pop eax


	mov ecx, 10	
	mov dl, 0
	mov dh, 0
	call GotoXY
L11:

	push dx
	push ecx
	call ColorFrame
	pop ecx
	pop dx
	sub xlength, 2
	sub ylength, 2
	inc dl
	inc dh		
	add xco, 1
	add yco, 1
    push eax
	mov eax, 500
	call Delay
	pop eax
	push eax
	call Color
	pop eax

	loop L11
	mov xco, 0
	mov yco, 0
	mov xlength, 80
	mov ylength, 26
	mov eax, 15
	call SetTextColor

	call GoBack
	jmp L0
	
	call Clrscr
	jmp L0

L2:
;;;;**** Second *************************	

	call Clrscr
	mWriteln "2) Sum up signed integers "

	;;;;Enter terms

	mWriteln "Please input the number of terms "
	call ReadInt
	;mov esi, OFFSET numberarray
	mov ecx, eax
	
	;;;;; Enter number

	mWriteln "Please input signed integers: "
	pushad ;;;; save registers
	mov esi, 0
	L21:
	call ReadInt
	mov numberarray[esi*TYPE numberarray], eax
	inc esi
	;add esi, TYPE numberarray
	loop L21
	popad ;;;; restore registers

	;;mov esi, 0
	mov eax, 0


	mWriteln "The sum of signed integers are: "
	
	;;;; Show Input Numbers
	
	pushad
	mov esi, 20
	L22:
	mov numberarray[esi*TYPE numberarray], eax
	inc esi
;	add esi, TYPE numberarray
	call WriteInt
	loop L22
	popad

	;;;; Summing ......

	mov al, '='
	call WriteChar
	mov esi, OFFSET numberarray
	mov eax, 0
	L23:
	add eax, [esi]
	add esi, TYPE numberarray
	loop L23
	call WriteInt
	mov eax, 15
	call SetTextColor
	mWriteln " "
	mWriteln "Press key to continue...... "

	call GoBack
	jmp L0
	call Clrscr
	jmp L0

L3:
;;;;**** Third *************************	

	call Clrscr
	mWriteln "3) Sum up unsigned integers: "
	
	;;;;Enter terms
	mWriteln "Please input the number of terms "
	call ReadInt

	mov esi, OFFSET unnumberarray
	mov ecx, eax
	
	;;;;; Enter number

	mWriteln "Please input unsigned integers: "
	pushad ;;;; save registers
L31:
	call ReadDec
	mov [esi], eax
	add esi, TYPE unnumberarray
	loop L31
	popad ;;;; restore registers

	mov esi, OFFSET unnumberarray
	mov eax, 0


	mWriteln "The sum of unsigned integers are: "
	
	;;;; Show Input Numbers
	
	pushad
L32:
	mov eax, 0
	mov al, '+'
	call WriteChar
	mov eax, [esi]
	add esi, TYPE unnumberarray
	call WriteDec
	loop L32
	popad

	;;;; Summing ......

	mov al, '='
	call WriteChar
	mov esi, OFFSET unnumberarray
	mov eax, 0
L33:
	add eax, [esi]
	add esi, TYPE unnumberarray
loop L33
	call WriteDec
	mov eax, 15
	call SetTextColor
	mWriteln " "
	mWriteln "Press key to continue...... "
	call GoBack
	jmp L0
	call Clrscr
	jmp L0

L4:
;;;;**** Fourth *************************	
	call Clrscr
	mWriteln "4)  Compute sin(x)"
	;;;; input and store x
	mWriteln "Please input a floating number x:"
	finit
	call ReadFloat
	fst x

	;;;; number terms
	mWriteln "Please input the number of terms:"
	call ReadDec
	mov nterms, eax
	cmp nterms, 0
	je Reterm
	jne MulStart
Reterm:
	mWriteln "You should at least enter one term"
	mov eax, 1500
	call Delay
	call Clrscr
	jmp L4

MulStart:
	cmp nterms, 1
	je Onetermanswer
	jne Manytermanswer
	;;;; Compute Sin
Onetermanswer	:
	mwriteln "The power terms will be used"
	finit
	fld x
	call Writefloat
	mwriteln " "
	mwriteln "The power terms will be used"
	mov eax, nterms
	dec eax
	call WriteDec
	mwriteln " "
	mwriteln "The result of sin(x)"
	finit
	fld x
	call Writefloat
	jmp Last

Manytermanswer:
	call xPower

	call Factorial
	
	call ShowFac

	call ComputeSin
	mWriteln " "
	mWriteln "************************************************* "
	mWriteln "When Terms or X inserted are too big, overflow might occur"
	mWriteln "************************************************* "

	mov ebx, 0
	mov ecx, 1024
Lloopzero:
	mov farray[ebx * TYPE farray], 0
	inc ebx
	loop Lloopzero


Last:
	mov eax, 15
	call SetTextColor
	mWriteln " "
	mWriteln "Press key to continue...... "

	call GoBack
	jmp L0
	call Clrscr
	jmp L0

L5:
;;;;**** Fifth *************************	
	call Clrscr
	mWriteln "5) Show student information"
	mWriteln "Student ID: 0312512 "
	mWriteln "Student Name: 楊卓耘 "
	mWriteln "Student Email: friedmeow@gmail.com "
	mov eax, 15
	call SetTextColor
	mWriteln " "
	mWriteln "Press key to continue...... "
	call GoBack
	jmp L0
	call Clrscr
	jmp L0

L6:

		pushad
		call Clrscr
		exit

main ENDP 

;;;;**** *************************	
;;;;**** Functions *************************	
;;;;**** *************************	

xPower PROC


MulStart:
	mov ecx, nterms
	imul ecx, 2
	mov ebx, 0
LMul:
	finit
	fld x  
	fld xarray[ebx]
	;;;; xarray Value ST(0) xValue ST(1)
	fmul ST(0), ST(1)
	add ebx, TYPE xarray
	fst xarray[ebx]

	loop LMul
	xor ebx,  ebx
	mov ecx, nterms
	mwriteln "The power terms will be used"
LShow:
	finit
	add ebx, TYPE xarray
	fld xarray[ebx]
	add ebx, TYPE xarray
	call WriteFloat
	mWriteLn " "
	Loop LShow
	ret
xPower ENDP

Factorial PROC


	mov ebx, 0
	push eax
	mov eax, nterms
	imul eax, 2
	dec eax
	mov xterms, eax
	pop eax
	 
	mov ecx, nterms
	dec ecx

;	mov ebx, OFFSET farray
LSavfac:

	push ecx
	mov ecx, xterms
	dec ecx
  
	mov eax, xterms	
;	call WriteInt
	
;	mov  farray[ebx*TYPE DWORD], eax 
	mov edx, eax
Lfac:
	dec eax
;	call DumpRegs
	imul  edx, eax
	
	loop lfac	
;	call DumpRegs
;	mov eax, [esi]
;	call WriteInt
;	imul edx, -1

	mov farray[ebx*TYPE DWORD], edx 
	inc ebx
;	mwriteln " "
	
	sub xterms, 2
	
	pop ecx
	loop lSavfac
	ret
Factorial ENDP


ShowFac PROC

	mwriteln "The factorial terms will be used"
	mov ebx, 0
	mov ecx, nterms
	mov ebx, nterms
	dec ebx
LShow:	
	mov eax, farray[ebx*TYPE DWORD]
	call WriteInt
	mwriteln " "
	dec ebx
	loop LShow
	ret
ShowFac ENDP

ComputeSin PROC

	mov three, 3
	finit
	fld zero
	fld sinsum
	fmul ST(0), ST(1)
	fst sinsum

	finit
	mwriteln "Terms of Taylor Series "

	mov ebx, 1
	fld xarray[ebx*TYPE xarray]
	call WriteFloat
	fld sinsum
	fadd ST(0), ST(1)
	fst sinsum
	;call ShowFPUstack

	;call WriteFloat

	mwriteln " "

	finit
	mov ecx, nterms
	dec ecx
	mov eax, nterms
	dec eax
	dec eax
	mov losterms, eax
LSin:	
	finit


	mov ebx, losterms
	dec losterms
	fild farray[ebx * TYPE farray]
	;call WriteFloat
	;mwriteln "Fac    "

	mov ebx, three
	fld xarray[ebx*TYPE xarray]
	;call WriteFloat
	;mwriteln "Power    "
	fimul minusone
	;call ShowFPUstack

	fdiv ST(0), ST(1)
	call WriteFloat
	mwriteln " "
	;call ShowFPUstack

	fld sinsum

	fadd ST(0), ST(1)

	fst sinsum
	;call ShowFPUstack

	;call WriteFloat


	mov eax, minusone
	imul eax, -1
	mov minusone, eax
	add three, 2
	dec nterms
	loop lsin

	finit
	fld sinsum
	mwriteln "The result of sin(x)"
	call WriteFloat

	add ebx, TYPE xarray
	ret
	
ComputeSin ENDP

Color PROC

ColorSelect:
	call Random32
	shl eax, 28
	shr eax, 24

ColorCheck:
	cmp eax, ebx
	je ColorSelect	
	cmp eax, 0
	je ColorSelect

	Call SetTextColor
	mov ebx, eax
	ret
Color ENDP

ColorFrame PROC

	mov ecx, xlength
	mov dl, xco
    mov dh, yco
	call GotoXY
LUp:
	mov al, " "
	call WriteChar
	inc dl
	call GotoXY
	loop LUp
	
	mov ecx, ylength
	dec ecx

LLeft:
	mov dl, xco
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
	dec ecx
    inc dl
LRight:
	mov al, " "
	call WriteChar
	dec dh
	call GotoXY
	loop LRight
	ret

ColorFrame ENDP


GoBack PROC

	call ReadKey
LCheck:
	mov eax,500
	call Delay
	call ReadKey
	jz LCheck
LBack:
	call clrscr
	
	ret

GoBack ENDP

	INVOKE ExitProcess,0
END main


