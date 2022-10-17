;Lab 2 Question 5
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

      mov.w #0000h, R4;
      mov.w #000Fh, R5;

      cmp R4, R5; compares R5 - R4
      jeq $; done to 'weed out' equals from jge
      NOP
      jge greater; when R5 is greater than R4
      NOP
      jl less; when R5 is less than R4
      NOP

greater:;when R5 is greater than R4
		call #greater_function
		jmp $
		NOP

less:; When R5 is less than R4
		call #less_function
		jmp $
		NOP

greater_function:
		mov.w #0001h, &200ah
		mov.w #0002h, &200ch
		mov.w #0003h, &200eh
		mov.w #0004h, &2010h
		mov.w #0005h, &2012h
		dec R4
		ret

less_function:
		mov.w #000Ah, &2000h; move A to memory location 2000h
		mov.w #0009h, &2002h;
		mov.w #0008h, &2004h;
		mov.w #0007h, &2006h;
		mov.w #0006h, &2008h;
		dec R4
		ret

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
            
