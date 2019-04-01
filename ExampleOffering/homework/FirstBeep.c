//******************************************************************************
// MSP430F2011 Program
//
// 2.5 kHz Generator
//
//  The program outputs an annoying tone
//
//******************************************************************************

//Which one to include???
#include  <msp430x20x2.h>
#include  <msp430x20x1.h>

/*unsigned char a;      // 1 byte = 8 bits
unsigned short b;       // 2 bytes = 16 bits
unsigned long c;        // 4 bytes = 32 bits
*/

void main(void)
{
	unsigned short icounter;		// counter for beeper loop

  // Disable Entire System
  //  _BIS_SR(LPM4_bits);

  /* Don't worry about this */
  // Turn DCO to slowest clock (method from Errata sheet)
  DCOCTL = 0x00;
  // Set RSEL bits
  BCSCTL1 &= 0xF0;    // 0b1111_0000 -> Clear out previous setting
  /*BCSCTL1 |= 0x00;    // Place new setting for RSEL : 0b0000_xxxx
  DCOCTL |= 0x00;     // Place new setting for DCO  : 0bxxx0_0000*/
  BCSCTL2 |= DIVM0; //Divide MCLK by 2
  /* Ok, back to worrying */

  WDTCTL = WDTPW + WDTHOLD;                 // Stop watchdog timer

    // Set P1.ALL to be Output ports
  P1OUT = 0x00;
  P1DIR |= BIT2; // Make beeper an output port



 while (1){
   // Generate ?? kHz tone -- Tone 1
   for ( icounter = ??? ; icounter >= 0 ; icounter-- ) {
     // Toggle Pin ON
     P1OUT ^= BIT2;
     // Delay for 1/2 period of 2.5 kHz (10 cycles)
     //__delay_cycles(1);

     // Toggle Pin OFF
     P1OUT ^= BIT2;
     // Delay
     __delay_cycles(1); // a macro to delay for some number of cycles
   }
 }
}

