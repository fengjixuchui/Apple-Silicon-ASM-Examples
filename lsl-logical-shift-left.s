// ------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------
// Logical Shift Left (LSL)
// Each shift left = number x 2
//
// COMPILE  -->  make
// RUN      -->  ./filename ; echo $?
// ------------------------------------------------


.global _start
.align 2


_start:
	MOV	X1, 15					// 15 in binary is 1111
	LSL	X0, X1, 1				// Shift X1 left by 1 and store in X0
								// Answer should be 15 x 2 = 30

end:
	MOV	X16, 1					// System call to terminate this program
	SVC	0						// Call kernel to perform the action
