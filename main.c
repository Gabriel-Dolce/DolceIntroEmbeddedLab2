//lab 2 question 2
#include <msp430.h> 


/**
 * main.c
 */
int add(int a, int b);

void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
	int a = 0b1000111100001111;
	int b = 0b1111000011110000;
	int c = 0;

	c = add(a,b);

	

	while(1);
}
	int add(int a, int b)
	    {
	        return a + b;
	    }

