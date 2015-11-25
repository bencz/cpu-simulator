; Initialize the stack
li %r14, 0xFFFF


;entry point
kmain:
	mov %r13, %r14
	subi %r14, %r14, 20
	li %r0, geetings_message
	bl put_string
	li %r0, 0x0A
	bl put_char
.loop:
	li %r0, prompt  ; Load message into r0
	bl put_string
	mov %r0, %r13
	bl get_line

	li %r0, help_command
	mov %r1, %r13
	bl strcmp
	cmpi %r0, 0
	bz .help

	br .loop
.help:
	li %r0, help_message
	bl put_string
	br .loop
.hang:
	br .hang
	rtn

; Function:		put_string
; Params:		r0 Char pointer
; Description:	Prints a string literal 
put_string:
	push %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	mov %r3, %r0
.loop:
	lb %r4, @r3
	cmpi %r4, 0
	bz .end
	mov %r0, %r4
	bl put_char
	addi %r3, %r3, 1
	br .loop
	.end:
	pop %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	rtn

; Function:		put_char
; Params:		r0 Character to print
; Description:	Prints a single character
put_char:
	push %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	mov %r3, %r0
	li %r0, 0x05
	li %r1, 0x00
	bl outb
	li %r0, 0x06
	li %r1, 0x00
	bl outb
	li %r0, 0x05
	mov %r1, %r3
	bl outb
	li %r0, 0x06
	li %r1, 0x01
	bl outb
	pop %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	rtn

; Function:		get_char
; Params:		None
; Returns:		A character read from the terminal
get_char:
	push %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
.again:
	li %r0, 0x05
	li %r1, 0x00
	bl outb
	li %r0, 0x06
	li %r1, 0x00
	bl outb
	li %r0, 0x06
	li %r1, 0x02
	bl outb
	li %r0, 0x07
	bl inb
	cmpi %r0, 1
	bne .again
	li %r0, 0x05
	bl inb
	pop %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	rtn

; Function:		get_line
; Params:		character buffer
; Returns:		Nothing
get_line:
	push %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	mov %r3, %r0
.again:
	bl get_char
	mov %r4, %r0
	cmpi %r4, 13
	bz .end
	sb @r3, %r4
	addi %r3, %r3, 1
	br .again
	.end:
	pop %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	rtn

; Function:		strcmp
; Params:		two strings to compare
; Returns:		0 if equal
strcmp:
	push %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	mov %r3, %r0
	mov %r4, %r1
	li %r5, 0
.again:
	lb %r6, @r3
	lb %r7, @r4
	sub %r8, %r6, %r7
	add %r5, %r5, %r8
	cmpi %r6, 0
	bz .end
	cmpi %r7, 0
	bz .end
	addi %r3, %r3, 1
	addi %r4, %r4, 1
	br .again
.end:
	mov %r0, %r5
	pop %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	rtn
	

; Function:		outb
; Params:		r0 GPIO Port
;				r1 Byte to write
; Description:	Prints a single character
outb:
	push %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	li %r3, 0xFFFF
	lshi %r3, %r3, 16
	or %r3, %r3, %r0
	sb @r3, %r1
	pop %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	rtn

; Function:		inb
; Params:		r0 GPIO Port
; Description:	Reads a single byte from a device
; Returns:		A single byte read from the device
inb:
	push %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	li %r3, 0xFFFF
	lshi %r3, %r3, 16
	or %r3, %r3, %r0
	lb %r0, @r3
	pop %r3, %r4, %r5, %r6, %r7, %r8, %r9, %r10, %r11, %r12, %r13, %r14
	rtn

prompt:
	data "> ", 0x0

geetings_message:
	data "Welcome to Pulse OS! Type help for help", 0x00

help_command:
	data "help", 0x00

help_message:
	data "Supported Commands: help", 0x00
	
end_program: