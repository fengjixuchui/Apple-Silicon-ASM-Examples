// ------------------------------------------------------
// Porting Raspberry Pi ARM code to Apple Silicon
// 2023-01-08
// Jds
// ------------------------------------------------------
// Introduction to the Stack (STR and LDR)
// Add two numbers to the stack and take them back off
//
// NOTE -- Commenting out the second ldr line will return
//         "2" as we will then only read back the first
//         number (2) from the stack instead of both
//         (2 and 1) from the stack. 
//
// RUN --> ./filename ; echo $?
// ------------------------------------------------------


.global _start
.align 2


_start:
	mov X1, 1
	mov X2, 2

	str X1, [sp, #-16]!			// Store R1 data (#1) on the stack and move SP-16
	str X2, [sp, #-16]!			// The ! sets the registers to be used again

	ldr X0, [sp], #+16			// Load current SP data to X0 and move SP+16 (X0 = 2)
	ldr X0, [sp], #+16			// Load current SP data to X0 and move SP+16 (X0 = 1)


_end:
	mov	X16, 1					// System call to terminate this program
	svc	0						// Call kernel to perform the action





