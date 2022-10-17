;lab 2 question 3
;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
Main_Loop:

	mov.w #0111h, R4;
	mov.w #1110h, R5;
	mov.w #0001h, R6; used to compare values of R4 and R5 to 1
	and R6, R4;
;compares R6 and R4. Stores a true 1 or false 0 in R4.

	and R6, R5;
;compares R6 and R5. Stores a true 1 or false 0 in R5.

	cmp R6, R4;
	jeq equal_R6_R4 ;yes
	jne not_equal_R6_R4; no


equal_R6_R4:
	cmp R6, R5;
	jeq equal_R6_R5; yes
	jne not_equal_R6_R5;

equal_R6_R5:
	mov.w #0FF0h,R9
	jmp $;
	NOP

not_equal_R6_R5:
	mov.w R9, R10; moves R9 into R10
	inv R10; inverts R10 to not disrupt R9
	jmp $;
	NOP

not_equal_R6_R4
	cmp R6, R5
	jeq not_equal_R6_R5; yes
	jmp $; no



	jmp Main_Loop;
	NOP

                                            

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
