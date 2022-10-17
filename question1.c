//lab 2 question 1
#include <msp430.h> 

float B = 100;
/**
 * main.c
 */
void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	int a = 0;
	unsigned int c = 0xFFFF;
	unsigned int d = 0x0000;
	int result1;
	int result2;

	a++;
	B-=1;
	result1 = c != d;
	result2 = d > c;

	while(1);
}
