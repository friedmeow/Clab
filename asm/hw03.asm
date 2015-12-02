
;========================================================
; Student Name:楊卓耘
; Student ID:0312512
; Email:friedmeow@gmail.com
;========================================================
; Instructor: Sai-Keung WONG
; Email: cswingo@cs.nctu.edu.tw
; Room: EC706
; Assembly Language 
;========================================================
; Description:
;
; IMPORTANT: always save EBX, EDI and ESI as their
; values are preserved by the callers in C calling convention.
;

INCLUDE Irvine32.inc
INCLUDE Macros.inc

invisibleObjX  TEXTEQU %(-100000)
invisibleObjY  TEXTEQU %(-100000)
RANDOM_COLOR	= 0
RANDOM_COLOR_KEY = 'r'
RAINBOW_COLOR	= 1
RAINBOW_COLOR_KEY = 'p'
MOVE_LEFT		= 0
MOVE_LEFT_KEY	= 'a'
MOVE_RIGHT		= 1
MOVE_RIGHT_KEY	= 'd'
MOVE_UP			= 2
MOVE_UP_KEY		= 'w'
MOVE_DOWN		= 3
MOVE_DOWN_KEY	= 's'
SPACE_KEY		= ' '
SPACE			= 0
V_KEY			= 'v'
V_Val			= 0
C_KEY			= 'c'
C_Val			= 1
L_KEY			= 'l'
L_Val			= 2
; PROTO C is to make agreement on calling convention for INVOKE

c_updatePositionsOfAllObjects PROTO C

.data 


MY_INFO_AT_TOP_BAR	BYTE "My Student Name:楊卓耘 StudentID: 0312512",0 

MyMsg BYTE "Project Title: Assembly Programming...",0dh, 0ah, 0

CaptionString BYTE "Student Name: 楊卓耘",0
MessageString 	BYTE "Programmer Name:楊卓耘", 0dh, 0ah
				BYTE "Programmer ID:0312512", 0dh, 0ah
				BYTE "Programmer Email Address:friedmeow@gmail.com", 0dh, 0ah, 0dh, 0ah
				BYTE "‘a’:left;‘d’:right; ‘w’:up; ‘s’:down", 0dh, 0ah
				BYTE "‘p’:rainbow color", 0dh, 0ah 
				BYTE "‘r’:random color", 0dh, 0ah 
				BYTE "‘c’:clear", 0dh, 0ah 
				BYTE "‘v’:save", 0dh, 0ah 
				BYTE "‘l’:load", 0dh, 0ah 
				BYTE "spacebar : toggle grow / not grow", 0dh, 0ah 
				BYTE "ESC : quit the program", 0dh, 0ah, 0dh, 0ah, 0 



CaptionString_EndingMessage BYTE "Student Name: 楊卓耘",0
MessageString_EndingMessage BYTE "My Student ID is 0312512", 0dh, 0ah, 0dh, 0ah
							BYTE "My Email is: friedmeow@gmail.com", 0dh, 0ah, 0dh, 0ah, 0
ConsoleString	BYTE "Programmer Name:楊卓耘", 0dh, 0ah
				BYTE "Programmer ID:0312512", 0dh, 0ah
				BYTE "Programmer Email Address:friedmeow@gmail.com", 0dh, 0ah, 0dh, 0ah, 0

InputString_1	BYTE	"Input the grow cycle of the object:",0
InputString_2	BYTE	"Input the maximum number of spheres (max number less than 1024):", 0
GrowCycle		DWORD	0
GrowCycleCount	DWORD	0
NumOfSpheres	DWORD	0
MaxSpheres		DWORD 1024
SphereCount		DWORD	0	
LoadCount		DWORD	0
ColorCount		DWORD	0
RainbowCount	DWORD	0	
ClearCount		DWORD	1	
windowWidth		DWORD 8000
windowHeight	DWORD 8000

scaleFactor	DWORD	128
canvasMinX	DWORD -4000
canvasMaxX	DWORD 4000
canvasMinY	DWORD -4000
canvasMaxY	DWORD 4000
;
particleRangeMinX REAL8 0.0
particleRangeMaxX REAL8 0.0
particleRangeMinY REAL8 0.0
particleRangeMaxY REAL8 0.0
;
particleSize DWORD  2
numParticles DWORD 20000
particleMaxSpeed DWORD 3
toggleSpace		DWORD	1
moveDirection	DWORD	1
ColorMode		DWORD	0
SpaceMode		DWORD	0
FunctionMode	DWORD	3
SaveMove		DWORD	0
SphereSave		DWORD	0
GrowSave		DWORD	0
ColorCountSave	DWORD	0
RainbowCountSave	DWORD	0
flgQuit		DWORD	0
maxNumObjects	DWORD 512
numObjects	DWORD	300
SaveObjPosX	SDWORD	1024 DUP(0)
SaveObjPosY	SDWORD	1024 DUP(0)
objPosX		SDWORD	0, 1024 DUP(600000)
objPosY		SDWORD	1024 DUP(0)
objTypes	BYTE	1024 DUP(1)
objSpeedX	SDWORD	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
			SDWORD	1024 DUP(?)
 			SDWORD	2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
			SDWORD	1024 DUP(?)			
objColor	DWORD	255, 0, 0,
					254, 254, 254,
					0, 127, 0,
					1024*3 DUP(128)
RainBowToUse	DWORD	255, 0 ,0,
						255, 127, 0,
						255, 255, 0,
						0, 255, 0,
						0, 0, 255,
						75, 0, 130,
						139, 0, 255,
						1024*3 DUP(?) 

DIGIT_MO_0		BYTE 0, 0, 1, 0dh
				BYTE 0, 0, 0, 0dh
				BYTE 0, 0, 0, 0dh
				BYTE 0, 0, 0, 0dh
				BYTE 0, 0, 0, 0ffh
DIGIT_MO_SIZE = ($-DIGIT_MO_0)				

offsetImage DWORD 0

openingMsg	BYTE	"This program shows the student ID using bitmap and manipulates images....", 0dh
			BYTE	"Great programming.", 0
movementDIR	BYTE 0
state		BYTE	0

imagePercentage DWORD	0

mImageStatus DWORD 0
mImagePtr0 BYTE 200000 DUP(?)
mImagePtr1 BYTE 200000 DUP(?)
mImagePtr2 BYTE 200000 DUP(?)
mTmpBuffer	BYTE	200000 DUP(?)
mImageWidth DWORD 0
mImageHeight DWORD 0
mBytesPerPixel DWORD 0
mImagePixelPointSize DWORD 6

.code

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_ClearScreen()
;
;Clear the screen.
;We can set text color if you want.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_ClearScreen PROC C
	mov al, 0
	mov ah, 0
	call SetTextColor
	call clrscr
	ret
asm_ClearScreen ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_ShowTitle()
;
;Show the title of the program
;at the beginning.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_ShowTitle PROC C USES edx
	mov dx, 0
	call GotoXY
	xor eax, eax
	mov ah, 0h
	mov al, 0e1h
	call SetTextColor
	mov edx, offset MyMsg
	call WriteString
	ret
asm_ShowTitle ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_InitializeApp()
;
;This function is called
;at the beginning of the program.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_InitializeApp PROC C USES ebx edi esi edx
	call AskForInput_Initialization
	call initGame
	ret
asm_InitializeApp ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_EndingMessage()
;
;This function is called
;when the program exits.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_EndingMessage PROC C USES ebx edx
	mov ebx, OFFSET CaptionString_EndingMessage
	mov edx, OFFSET MessageString_EndingMessage
	call MsgBox
	ret
asm_EndingMessage ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_updateSimulationNow()
;
;Update the simulation.
;For examples,
;we can update the positions of the objects.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_updateSimulationNow PROC C USES edi esi ebx
	;
	call updateGame
	;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;DO NOT REMOVE THIS THE FOLLOWING LINE
	call c_updatePositionsOfAllObjects 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ret
asm_updateSimulationNow ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void setCursor(int x, int y)
;
;Set the position of the cursor 
;in the console (text) window.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
setCursor PROC C USES edx,
	x:DWORD, y:DWORD
	mov edx, y
	shl edx, 8
	xor edx, x
	call Gotoxy
	ret
setCursor ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_GetNumParticles PROC C
	mov eax, 10000
	ret
asm_GetNumParticles ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_GetParticleMaxSpeed PROC C
	mov eax, particleMaxSpeed
	ret
asm_GetParticleMaxSpeed ENDP

;int asm_GetParticleSize()
;
;Return the particle size.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_GetParticleSize PROC C
	;modify this procedure
	mov eax, 1
	ret
asm_GetParticleSize ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_handleMousePassiveEvent( int x, int y )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_handleMousePassiveEvent PROC C USES eax ebx edx,
	x : DWORD, y : DWORD
	mov eax, x
	mWrite "x:"
	call WriteDec
	mWriteln " "
	mov eax, y
	mWrite "y:"
	call WriteDec
	mWriteln " "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	ret
asm_handleMousePassiveEvent ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_handleMouseEvent(int button, int status, int x, int y)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_handleMouseEvent PROC C USES ebx,
	button : DWORD, status : DWORD, x : DWORD, y : DWORD
	
	mWriteln "asm_handleMouseEvent"
	mov eax, button
	mWrite "button:"
	call WriteDec
	mWriteln " "
	mov eax, status
	mWrite "status:"
	call WriteDec
	mov eax, x
	mWriteln " "
	mWrite "x:"
	call WriteDec
	mWriteln " "
	mov eax, y
	mWrite "y:"
	call WriteDec
	mWriteln " "
	mov eax, windowWidth
	mWrite "windowWidth:"
	call WriteDec
	mWriteln " "
	mov eax, windowHeight
	mWrite "windowHeight:"
	call WriteDec
	mWriteln " "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ret
asm_handleMouseEvent ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;int asm_HandleKey(int key)
;
;Handle key events.
;Return 1 if the key has been handled.
;Return 0, otherwise.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_HandleKey PROC C, 
	key : DWORD
	mov eax, key
	call WriteInt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	cmp eax, MOVE_LEFT_KEY
	jne L1
	call moveLeft
	jmp L4
L1:
	cmp eax, MOVE_RIGHT_KEY
	jne L2
	call moveRight
	jmp L4
L2:
	cmp eax, MOVE_UP_KEY
	jne L3
	call moveUp
	jmp L4
L3:
	cmp eax, MOVE_DOWN_KEY
	jne L4
	call moveDown
L4:
	cmp eax, RANDOM_COLOR_KEY
	jne L5
	call randomColor
L5:
	cmp eax, RAINBOW_COLOR_KEY
	jne L6
	call rainbowColor
L6:
	cmp eax, SPACE_KEY
	jne L7
	call Toggle_Space
L7:
	cmp eax, V_KEY
	jne L8
	call VKEY
L8:
	cmp eax, C_KEY
	jne L9
	call CKEY
L9:	
	cmp eax, L_KEY
	jne exit0
	call LKEY
exit0:
	mov eax, 0
	ret
asm_HandleKey ENDP
VKEY PROC
	mov functionMode, V_Val
	ret
VKEY ENDP
CKEY PROC
	mov functionMode, C_Val
	ret
CKEY ENDP
LKEY PROC
	mov functionMode, L_Val
	ret
LKEY ENDP
Toggle_Space PROC
	mov colorMode, RANDOM_COLOR
	ret
Toggle_Space ENDP

randomColor PROC
	mov colorMode, RANDOM_COLOR
	ret
randomColor ENDP
rainbowColor PROC
	mov colorMode, RAINBOW_COLOR
	ret
rainbowColor ENDP
moveDown PROC
	mov moveDirection, MOVE_DOWN
	ret
moveDown ENDP
moveUp PROC
	mov moveDirection, MOVE_UP
	ret
moveUp ENDP
moveRight PROC
	mov moveDirection, MOVE_RIGHT
	ret
moveRight ENDP
moveLeft PROC
	mov moveDirection, MOVE_LEFT
	ret
moveLeft ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_SetWindowDimension(int w, int h, int scaledWidth, int scaledHeight)
;
;w: window resolution (i.e. number of pixels) along the x-axis.
;h: window resolution (i.e. number of pixels) along the y-axis. 
;scaledWidth : scaled up width
;scaledHeight : scaled up height

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_SetWindowDimension PROC C USES ebx,
	w: DWORD, h: DWORD, scaledWidth : DWORD, scaledHeight : DWORD
	mov ebx, offset windowWidth
	mov eax, w
	mov [ebx], eax
	mov eax, scaledWidth
	shr eax, 1	; divide by 2, i.e. eax = eax/2
	mov ebx, offset canvasMaxX
	mov [ebx], eax
	neg eax
	mov ebx, offset canvasMinX
	mov [ebx], eax
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov ebx, offset windowHeight
	mov eax, h
	mov [ebx], eax
	mov eax, scaledHeight
	shr eax, 1	; divide by 2, i.e. eax = eax/2
	mov ebx, offset canvasMaxY
	mov [ebx], eax
	neg eax
	mov ebx, offset canvasMinY
	mov [ebx], eax
	;
	finit
	fild canvasMinX
	fstp particleRangeMinX
	;
	finit
	fild canvasMaxX
	fstp particleRangeMaxX
	;
	finit
	fild canvasMinY
	fstp particleRangeMinY
	;
	finit
	fild canvasMaxY
	fstp particleRangeMaxY	
	;
	call asm_RefreshWindowSize
	ret
asm_SetWindowDimension ENDP	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;int asm_GetNumOfObjects()
;
;Return the number of objects
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_GetNumOfObjects PROC C
	mov eax, MaxSpheres
	
	ret
asm_GetNumOfObjects ENDP	

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;int asm_GetObjectType(int objID)
;
;Return the object type
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_GetObjectType		PROC C USES ebx edx,
	objID: DWORD
	push ebx
	push edx
	xor eax, eax
	mov edx, offset objTypes
	mov ebx, objID
	mov al, [edx + ebx]
	pop edx
	pop ebx
	ret
asm_GetObjectType		ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_GetObjectColor (int &r, int &g, int &b, int objID)
;Input: objID, the ID of the object
;
;Return the color three color components
;red, green and blue.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_GetObjectColor  PROC C USES ebx edi esi,
	r: PTR DWORD, g: PTR DWORD, b: PTR DWORD, objID: DWORD

;	mov eax, 256
;	
;Call RandomRange
;	mov edi, r
;	mov DWORD PTR [edi], eax
;	mov eax, 256
;	Call RandomRange
;	mov edi, g
;	mov DWORD PTR [edi], eax
;	mov eax, 256
;	Call RandomRange
;	mov edi, b
;	mov DWORD PTR [edi], eax
;	mov eax, 256
;	Call RandomRange
;	mov objColor[4 + ecx * TYPE objColor], 0
;	mov eax, 256
;	Call RandomRange
;	mov objColor[8 + ecx * TYPE objColor], 0
	mov ecx, ObjID
	mov eax, 3
	mul ecx
	mov ecx, eax
	mov edi, r
	mov eax, objColor[0 + ecx*TYPE objColor]
	mov DWORD PTR [edi], eax
	mov edi, g
	mov eax, objColor[4 + ecx*TYPE objColor]
	mov DWORD PTR [edi], eax
	mov edi, b
	mov eax, objColor[8 + ecx*TYPE objColor]
	mov DWORD PTR [edi], eax
;	mov edi, r

	
	;
	
;	mov edi, g
;	mov eax, objColor[4 + ecx*TYPE objColor]
;	mov DWORD PTR [edi], eax	;
	;

;	mov edi, b
;	mov eax, objColor[8 + ecx*TYPE objColor]
;	mov DWORD PTR [edi], eax

	ret
asm_GetObjectColor ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;int asm_ComputeRotationAngle(a, b)
;return an angle*10.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_ComputeRotationAngle PROC C USES ebx,
	a: DWORD, b: DWORD
	mov ebx, b
	shl ebx, 1
	mov eax, a
	add eax, 10
	ret
asm_ComputeRotationAngle ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;int asm_ComputeObjPositionX(int x, int objID)
;
;Return the x-coordinate in eax.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_ComputeObjPositionX PROC C USES edi esi,
	x: DWORD, objID: DWORD
	;modify this procedure
	mov ebx, objID
	mov eax, objPosX[0 + ebx*TYPE objPosX]
	
	ret
asm_ComputeObjPositionX ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;int asm_ComputeObjPositionY(int y, int objID)
;
;Return the y-coordinate in eax.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_ComputeObjPositionY PROC C USES ebx esi edx,
	y: DWORD, objID: DWORD
	;modify this procedure
	mov ebx, objID
	mov eax, objPosY[0 + ebx*TYPE objPosY]
	ret
asm_ComputeObjPositionY ENDP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; The input image's information:
; imageIndex : the index of an image, starting from 0
; imagePtr : the starting address of the image, i.e., the address of the first byte of the image
; (w, h) defines the dimension of the image.
; w: width
; h: height
; Thus, the image has w times h pixels.
; bytesPerPixel : the number of bytes used to represent one pixel
;
; Purpose of this procedure:
; Copy the image to our own database
;
asm_SetImage PROC C USES esi edi ebx,
imageIndex : DWORD,
imagePtr : PTR BYTE, w : DWORD, h : DWORD, bytesPerPixel : DWORD
	mov mImageStatus, 1
	mov mImageWidth, 16
	mov mImageHeight, 16
	mov mBytesPerPixel, 1
	ret
asm_SetImage ENDP

asm_GetImagePixelSize PROC C
mov eax, mImagePixelPointSize
ret
asm_GetImagePixelSize ENDP

asm_GetImageStatus PROC C
mov eax, 1
ret
asm_GetImageStatus ENDP

asm_getImagePercentage PROC C
mov eax, imagePercentage
ret
asm_getImagePercentage ENDP

;
;asm_GetImageColour(int imageIndex, int ix, int iy, int &r, int &g, int &b)
;
asm_GetImageColour PROC C USES ebx esi, 
imageIndex : DWORD,
ix: DWORD, iy : DWORD,
r: PTR DWORD, g: PTR DWORD, b: PTR DWORD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov esi, r
	mov DWORD PTR [esi], 0
	mov esi, g
	mov DWORD PTR [esi], 125
	mov esi, b
	mov DWORD PTR [esi], 0
	ret
asm_GetImageColour ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;const char *asm_getStudentInfoString()
;
;return pointer in edx
asm_getStudentInfoString PROC C
	mov eax, offset MY_INFO_AT_TOP_BAR
	ret
asm_getStudentInfoString ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; Return the particle system state in eax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_GetParticleSystemState PROC C
	mov eax, 3
	ret
asm_GetParticleSystemState ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;void asm_GetImageDimension(int &iw, int &ih)
asm_GetImageDimension PROC C USES ebx,
iw : PTR DWORD, ih : PTR DWORD
	mov ebx, iw
	mov DWORD PTR [ebx], 8
	mov ebx, ih
	mov DWORD PTR [ebx], 8
	ret
asm_GetImageDimension ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;
; Compute a position to place an image.
; This position defines the lower left corner
; of the image.
;
asm_GetImagePos PROC C USES ebx,
	x : PTR DWORD,
	y : PTR DWORD
	mov eax, canvasMinX
	mov ebx, scaleFactor
	cdq
	idiv ebx
	mov ebx, x
	mov [ebx], eax
;
	mov eax, canvasMinY
	mov ebx, scaleFactor
	cdq
	idiv ebx
	mov ebx, y
	mov [ebx], eax
	ret
asm_GetImagePos ENDP

AskForInput_Initialization PROC USES ebx edi esi
	mov edx, offset ConsoleString
	Call WriteString
	mov edx, offset InputString_1
	Call WriteString
	mov eax, 0
	Call ReadInt
	Cmp eax, 0
	je DefaultGrowCycle
	jne SetGrowCycle
DefaultGrowCycle:
	mov GrowCycle, 25
	jmp NumOfSphere
SetGrowCycle:
	mov GrowCycle, eax
NumOfSphere:
	mov edx, offset InputString_2
	Call WriteString
	mov eax, 0
	Call ReadInt
	Cmp eax, 0
	je DefaultSphere
	jne SetSphere
DefaultSphere:
	mov NumOfSpheres, 1023
	jmp Sphere_Cycle_Set
SetSphere:
	dec eax
	mov NumOfSpheres, eax
	
Sphere_Cycle_Set:

	mov edx, offset MyMsg
	call WriteString
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	mov ebx, OFFSET CaptionString
	mov edx, OFFSET MessageString
	call MsgBox
	ret
AskForInput_Initialization ENDP

asm_RefreshWindowSize PROC
	ret
asm_RefreshWindowSize ENDP

initGame PROC
	mov eax, moveDirection
	cmp eax, MOVE_RIGHT
	je LRight
	jne Lexit0
LRight:
	mov esi, offset objPosX
	mov eax, 20
	add SDWORD PTR [esi], eax
Lexit0:
	ret
initGame ENDP

updateGame PROC USES esi 


;;;;If Hit Boundary 
	mov eax, ObjPosX
	cmp eax, CanvasMaxX
	jng LcmpCanvasMinX
	mov moveDirection, MOVE_LEFT
	jmp LNoHitBoundary
LcmpCanvasMinX:
	mov eax, ObjPosX
	cmp eax, CanvasMinX
	jl LChangeRight
	jmp LcmpY
LChangeRight:
	mov moveDirection, MOVE_RIGHT
	jmp LNoHitBoundary
LcmpY:
	mov eax, ObjPosY
	cmp eax, CanvasMaxY
	jng LcmpCanvasMinY
	mov moveDirection, MOVE_DOWN
	jmp LNoHitBoundary
LcmpCanvasMinY:
	mov eax, ObjPosY
	cmp eax, CanvasMinY
	jl LChangeUp
	jmp LNoHitBoundary
LChangeUP:
	mov moveDirection, MOVE_UP
	jmp LNoHitBoundary
LNoHitBoundary:
;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hit Boundary Not Done

;;;;When Update GrowCycle + 1 until == GrowCycle
;;;;Draw New sphere
	mov eax, GrowCycle
	Cmp eax, GrowCycleCount
	je LGrowCycleReach
	inc GrowCycleCount
	jne LGrowCycleNoReach
LGrowCycleReach:
	mov GrowCycleCount, 0
	mov eax, SphereCount
	cmp eax, NumOfSpheres
	je LMaxSphereReach
	jne LAddSphereCount	
LAddSphereCount:
	inc SphereCount
	mov ebx, SphereCount
	mov esi, OFFSET ObjPosX
	mov edi, objPosX
	mov [esi + ebx * TYPE ObjPosX], edi
	mov ebx, SphereCount
	mov esi, OFFSET ObjPosY
	mov edi, objPosY
	mov [esi + ebx * TYPE ObjPosY], edi
	jmp LGrowCycleNoReach
LMaxSphereReach:
LGrowCycleNoReach:
	mov eax, moveDirection
	cmp eax, MOVE_LEFT
	je LLeft_Update
	mov eax, moveDirection
	cmp eax, MOVE_RIGHT
	je LRight_Update
	mov eax, moveDirection
	cmp eax, MOVE_UP
	je LUp_Update
	mov eax, moveDirection
	cmp eax, MOVE_DOWN
	je LDown_Update
	jmp LColorIni
LUp_Update:
	mov esi, offset objPosY
	mov eax, 20
	add SDWORD PTR [esi], eax
	jmp LColorIni
LDown_Update:
	mov esi, offset objPosY
	mov eax, 20
	sub SDWORD PTR [esi], eax
	jmp LColorIni
LLeft_Update:
	mov esi, offset objPosX
	mov eax, 20
	sub SDWORD PTR [esi], eax
	jmp LColorIni
LRight_Update:
	mov esi, offset objPosX
	mov eax, 20
	add SDWORD PTR [esi], eax
	jmp LColorIni

LColorIni:
	mov eax, SphereCount
	cmp ColorCount, eax
	jne LColorChange
	je LSpaceCheck
LColorChange:
	inc ColorCount
	mov eax, ColorMode
	cmp eax, RANDOM_COLOR
	je LRandom_Color_Update
	mov eax, ColorMode
	cmp eax, RAINBOW_COLOR
	je LRainbow_Color_Update
	jmp LSpaceCheck
LRandom_Color_Update:
	call GenerateRandomColor
	jmp LSpaceCheck
LRainbow_Color_Update:
	pushad
	call GenerateRainbowColor
	popad
	jmp LSpaceCheck
LSpaceCheck:
	;cmp spacemode, space
	;jmp LFunctionCheck
LFunctionCheck:
	mov eax, functionmode
	cmp eax, L_Val
	je LLupdate
	mov eax, functionmode
	cmp eax, V_Val
	je LVupdate
	mov eax, functionmode
	cmp eax, C_Val
	je LCupdate
	jmp Lexit0
LLupdate:
	call DoLfunction
	jmp Lexit0
LCupdate:
	call DoCfunction
	jmp Lexit0
LVupdate:
	call DoVfunction
	jmp Lexit0
Lexit0:
	ret
updateGame ENDP
DoLfunction PROC

	pushad
	call DoCfunction
	popad

	mov ecx, loadCount
	mov ebx, loadCount
LLoadSphere:
	mov esi, OFFSET ObjPosX
	mov eax, SaveObjPosX[ebx * TYPE SDWORD]
	mov [esi + ebx * TYPE ObjPosX], eax

	mov esi, OFFSET ObjPosY
	mov eax, SaveObjPosY[ebx * TYPE SDWORD]
	mov [esi + ebx * TYPE ObjPosY], eax
	dec ebx  
	loop LLoadSphere
	
	mov eax, SaveObjPosX
	mov ObjPosX, eax
	mov eax, SaveObjPosY
	mov ObjPosY, eax
	mov eax, savemove
	mov moveDirection, eax
	mov eax, SphereSave
	mov SphereCount, eax
	mov eax, GrowSave
	mov GrowCycleCount, eax 
	mov functionmode, 3
	mov eax, ColorCountSave
	mov ColorCount, eax

	mov eax, RainbowCountSave
	mov RainbowCount, eax

	ret
DoLfunction ENDP
DoVfunction PROC
	mov ecx, SphereCount
	mov SphereSave, ecx
	mov eax, GrowCycleCount
	mov GrowSave, eax
	mov LoadCount, ecx
	mov ebx, SphereCount
LSaveSphere:
	mov esi, OFFSET ObjPosX
	mov eax, [esi + ebx * TYPE ObjPosX]
	mov SaveObjPosX[ebx * TYPE SDWORD], eax
	mov esi, OFFSET ObjPosY
	mov eax, [esi + ebx * TYPE ObjPosY]
	mov SaveObjPosY[ebx * TYPE SDWORD], eax
	dec ebx  
	loop LSaveSphere
	mov eax, ObjPosX
	mov SaveObjPosX, eax
	mov eax, ObjPosY
	mov SaveObjPosY, eax

	mov functionmode, 3
	mov eax, moveDirection
	mov savemove, eax
	mov eax, ColorCount
	mov ColorCountSave, eax
	mov eax, RainbowCount
	mov RainbowCountSave, eax
	ret	
DoVfunction ENDP
	ret
DoCfunction PROC
	cmp SphereCount, 0
	je Lexit0
	mov ecx, SphereCount
	mov ebx, SphereCount
LClearSphere:
	mov esi, OFFSET ObjPosX
	mov SDWORD PTR [esi + ebx * TYPE ObjPosX], 600000
	mov esi, OFFSET ObjPosY
	mov SDWORD PTR [esi + ebx * TYPE ObjPosY], 600000
	dec ebx  
	loop LClearSphere
	mov functionmode, 3
	mov SphereCount, 0
	mov ColorCount, 0
	mov RainBowCount, 0
Lexit0:
	ret
DoCfunction ENDP

GenerateRainbowColor PROC

	;inc ColorCount
	mov eax, RainBowCount
	mov esi, 7
	cdq
	div esi
	mov eax, edx
	mov edi, 3
	mul edi
	mov edx, eax
	mov ecx, RainbowToUse[0 + edx * TYPE RainbowToUse]
	mov eax, SphereCount
	mov ebx, 3
	mul ebx
	mov ebx, eax
	mov ObjColor[0 + ebx * TYPE ObjColor], ecx


	mov eax, RainbowCount
	mov esi, 7
	cdq
	div esi
	mov eax, edx
	mov edi, 3
	mul edi
	mov edx, eax
	mov ecx, DWORD PTR RainbowToUse[4 + edx * TYPE RainbowToUse]
	mov eax, SphereCount
	mov ebx, 3
	mul ebx
	mov ebx, eax
	mov DWORD PTR ObjColor[4 + ebx * TYPE ObjColor], ecx

	mov eax, RainbowCount
	mov esi, 7
	cdq
	div esi
	mov eax, edx
	mov edi, 3
	mul edi
	mov edx, eax
	mov ecx, DWORD PTR RainbowToUse[8 + edx * TYPE RainbowToUse]
	mov eax, SphereCount
	mov ebx, 3
	mul ebx
	mov ebx, eax
	mov DWORD PTR ObjColor[8 + ebx * TYPE ObjColor], ecx

	inc RainBowCount
	ret
GenerateRainbowColor ENDP
GenerateRandomColor PROC
	mov RainbowCount, 0
	Call Randomize
;	inc ColorCount
;	mov eax, ColorCount
	mov eax, SphereCount
	mov ebx, 3
	mul ebx
	mov ebx, eax
	mov eax, 256
	Call RandomRange
	mov DWORD PTR objColor[0 + ebx * TYPE objColor], eax
	mov eax, 256
	Call RandomRange
	mov DWORD PTR objColor[4 + ebx * TYPE objColor], eax
	mov eax, 256
	Call RandomRange
	mov DWORD PTR objColor[8 + ebx * TYPE objColor], eax	
	ret
GenerateRandomColor ENDP
END

