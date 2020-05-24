
INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib 
.386
.model flat,stdCALL
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	coeffA DWORD 73
	coeffB REAL4 -17.0
	constantTwo DWORD 2
	constantThreePointFour REAL4 3.4
	tempVar REAL4 ?
	sin_res REAL4 ?
	numerator REAL4 ?
	resultR REAL4 ?
	messageResult BYTE "R is ",0

.code

main PROC
	fldpi
	fldpi
	fmul st(0),st(1)
	fmul st(0),st(1)
	fsin
	
	fldpi
	fcos
	fmul st(0),st(0)
	fldpi
	fcos
	fmul st(0),st(1); cos(pi)^3
	fsub st(2),st(0)
	fxch st(2)
	fsqrt ;numerator

	fild coeffA
	fld constantThreePointFour
	fmulp
	fld coeffB
	fimul constantTwo
	faddp
	fmul st(0),st(0)
	fmul st(0),st(0)
	fdivp 
	fchs
	fstp resultR
	fld resultR
	mov EDX, offset messageResult
	call WriteString
	call WriteFloat
	exit
	main ENDP
	END main
