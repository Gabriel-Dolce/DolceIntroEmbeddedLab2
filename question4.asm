;Lab 2 Question 4
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
 			; # is just a number
			; & is a memory location
			; @ is memory location. Go to register and use value there.
			; (x) is offset. If R5 holds a value, offset memory location by x.

 			mov.w   #0006h,&2000h; move 0006 to the memory location 2000h
            mov.w   #0009h,&2002h; move 0009 to the memory location 2002h
            clr.w   &2006h; clear the value in memory locatoin 2006h to 0.
            clr.w   &2008h; clear the value in memory locatioon 2008h to 0.

            mov.w   &2002h,&2004h; copy contents of 2002h into adress 2004. move 9 into 2004
            add.w   &2000h,&2004h; add contents of address 2000 to 2004. Store in 2004. Add 6 to 9 = 15 = F at 2004h
            cmp.w   #000Ah,&2004h; compare the number A to the value stored in 2004 (F). dst - src. F > A
            jhs Greater; This one gets used based off of how the command works when comparing source and destination.
            jlo Less
Greater:
            mov.w   &2000h,&2008h; copy contents of 2000h into adress 2008. move 6 into 2008
            jmp $;
Less:
            mov.w   &2002h,&2006h;copy contents of 2002h into adress 2006. move 9 into 2006
            jmp $;
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
            
