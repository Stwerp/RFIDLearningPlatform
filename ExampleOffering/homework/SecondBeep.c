//******************************************************************************
// MSP430F201x Program
//
// Beep Generator
//
//  The program sleeps for ??? ms in LPM3 mode, then wakes up and outputs
//  a ??? kHz square wave tone on P1OUT1.? for ??? ms
//
//******************************************************************************

#include  <msp430x20x1.h>
// #include  <msp430x20x2.h>

/*unsigned char mask2;    // 1 byte = 8 bits
unsigned short position;  // 2 bytes = 16 bits
unsigned long data;       // 4 bytes = 32 bits
*/

void main(void)
{
  //PLAN:
  //  1) set clock to low setting
  //  2) Set pins to be Input/output
  //  3) Set ACLK to be sourced from VLOCLK
  //  4) Sleep for a short period (~20 ms)
  //  5) Enter loop
  //    a) beep
  //    b) sleep for a long period
  //    c) Wake up!
  //    d) repeat
  //END OF PLAN

  int i;

  // Turn DCO to slowest clock (method from Errata sheet)
  DCOCTL = 0x00;
  // Set RSEL bits
  BCSCTL1 &= 0xF0;    // 0b1111_0000 -> Clear out previous setting
  /*BCSCTL1 |= 0x00;    // Place new setting for RSEL : 0b0000_xxxx
  DCOCTL |= 0x00;     // Place new setting for DCO  : 0bxxx0_0000*/
  BCSCTL2 |= DIVM0; //Divide MCLK by 2

  // Stop watchdog timer
  WDTCTL = WDTPW + WDTHOLD;

  // Turn OFF SMCLK and external Oscillator
  //  OSCOFF : ?
  //  SCFG1  : ?
  _BIS_SR(OSCOFF + SCG1);

  // Set P1.ALL to be Output ports
  P1OUT = 0x00;
  P1DIR = 0xFF;
  P1SEL = 0x00;

  // Setup ACLK source to be from internal VLOCLK (~10 kHz)
  BCSCTL3 |= LFXT1S_2;
  // Setup ACLK to be dvided by 8 (~10 kHz / 8 => ~.8 ms per clock tick)
  BCSCTL1 |= DIVA1 + DIVA0;

  // Sleep ~20 ms
  CCTL0 = CCIE;                      // CCR0 interrupt enabled
  CCR0 = 25;                         // 10 khz/8 source * 20 ms = 25  cycles
  TACTL = TACLR + TASSEL_1 + MC_1;   // Clear TA0, Source: ACLK, Mode: UP
  // Enter LPM3 Mode
  _BIC_SR(OSCOFF);					 // Turn on VLOCLK
  _BIS_SR(LPM3_bits + GIE);          // Enter LPM3 w/ interrupts
  // -- Wake up -- //

  // Turn OFF SMCLK and external Oscillator
  _BIS_SR(OSCOFF + SCG1);

  while (1) {
   // Generate 5.0 kHz tone -- Tone 1
   for ( i = 175 ; i > 0 ; i-- ) {
     // Toggle Pin ON
     P1OUT |= BIT2;
     // Delay for 1/2 period of 2.5 kHz (10 cycles)
     //__delay_cycles(1);

     // Toggle Pin OFF
     P1OUT &= ~(BIT2);
     // Delay
     __delay_cycles(2);
   }
      // Sleep  ??? ms
   CCTL0 = CCIE;                       // CCR0 interrupt enabled
   CCR0 = ???;                        // 10 khz / 8 source * ??? ms = ?,???  cycles
   TACTL = TACLR + TASSEL_1 + MC_1;   // Clear TA0, Source: ACLK, Mode: UP

   // Enter LPM3 Mode
   _BIC_SR(OSCOFF);
   _BIS_SR(LPM3_bits + GIE);                 // Enter LPM3 w/ interrupts
   // -- Wake up -- //

   // Turn OFF SMCLK and external Oscillator
   _BIS_SR(OSCOFF + SCG1);
 }
}

// Timer A0 interrupt service routine
#pragma vector=TIMERA0_VECTOR
__interrupt void Timer_A0 (void)
{
  // Turn timer interrupts OFF
  CCTL0 = 0x00;
  // Turn OFF Timer
  TACTL = 0x00;
  // Turn CPU on
  _BIC_SR_IRQ(LPM3_bits + GIE);
}
