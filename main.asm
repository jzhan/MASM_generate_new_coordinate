.386
.MODEL flat, stdcall
.stack 100h

ExitProcess PROTO :DWORD

time PROTO C :DWORD
srand PROTO C :DWORD
rand PROTO C

.data
	dw_new_coord DWORD 0
	
.code
main PROC
	invoke time, 0
	invoke srand, eax

	;generate new x coordinate
	invoke rand
	xor edx, edx
	mov ebx, 50
	div ebx

	mov dw_new_coord, edx

	;generate new y coordinate
	invoke rand
	xor edx, edx
	mov ebx, 50
	div ebx

	shl edx, 16 ;shift 16bit to the left
	add dw_new_coord, edx
	
	invoke ExitProcess, 0
main ENDP
END main