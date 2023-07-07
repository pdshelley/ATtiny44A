#include <avr/interrupt.h>

void enable_interrupts() {
    sei();
}

void disable_interrupts() {
    cli();
}



#ifdef ADD_SLEEP_FUNCTIONS

#include <avr/sleep.h>

void sleep(unsigned char mode) {
	set_sleep_mode(mode);
	cli();
	sleep_enable();
	sei();
	sleep_cpu();
	sleep_disable();
}

#endif



#ifdef ADD_WATCHDOG_FUNCTIONS

#include <avr/wdt.h>

void _resetWatchdog() {
	wdt_reset();
}

void _setWatchdogForReset(unsigned char timeoutMultiplier) {
	wdt_enable(timeoutMultiplier);
}

void _disableWatchdog() {
	wdt_disable();
}

#endif



/*
Clock rates:
Timer0
0: off
1: clock rate
2: clock/8
3: clock/64
4: clock/256
5: clock/1024
6: counter on pin T0, falling edge
7: counter on pin T0, rising edge
TCCR0B more or less is just this clock rate, plus bit 3 (~0x08) indicates special WGM modes

Timer1
0: off
1: clock rate
2: clock/8
3: clock/64
4: clock/256
5: clock/1024
6: counter on pin T1, falling edge
7: counter on pin T1, rising edge

Timer2
0: off
1: clock rate
2: clock/8
3: clock/32
4: clock/64
5: clock/128
6: clock/256
7: clock/1024
TCCR2B more or less is just this clock rate, plus bit 3 (~0x08) indicates special WGM modes
*/



/*
Timer0 WGM modes:
0: no WGM/fast PWM, no automatic pin change, regular counter/timer, resets at 0xFF
1: phase correct PWM ignoring OCRA/OCRB (always does full 256 counts before overflow)
2: CTC mode, no PWM/pin change but counter always resets when it reaches OCRA
3: FastPWM ignoring OCRA/OCRB (always does full 256 counts before overflow)
(special WGM modes set by bit 3 on TCCR2B)
4: -- invalid
5: PWM phase correct, using OCRA/OCRB
6: -- invalid
7: fast PWM, using OCRA/OCRB

PWM depends on COM0A0/1 and COM0B0/1: (see timer2 PWM output pins description below)
TCCR2A controls all of these, last nybble is the WGM mode, first nybble is COM2A and COM2B,
determining how OCR2A and OCR2B pins behave
*/

/*

Timer1 WGM modes:
0: none (normal)
1: phase correct PWM 8 bit
2: phase correct PWM 9 bit
3: phase correct PWM 10 bit
4: CTC
5: fast PWM 8 bit
6: fast PWM 9 bit
7: fast PWM 10 bit
8: phase and frequency correct PWM (ICR1)
9: phase and frequency correct PWM (OCR1A)
10: phase correct PWM (ICR1)
11: phase correct PWM (OCR1A)
12: CTC
13: -- invalid
14: fast PWM (ICR1)
15: fast PWM (OCR1A)

COM1 - same principles as COM2A/COM2B (see below)
TCCR1A first nybble is COM1, last nybble is lower two bits of WGM mode
TCCR1B bits 4 and 3 are top two bits of WGM mode, bits 0-2 are clock speed (see above)
*/

/*

Timer2 WGM modes:
0: no WGM/fast PWM, no automatic pin change, regular counter/timer, resets at 0xFF
1: phase correct PWM ignoring OCRA/OCRB (always does full 256 counts before overflow)
2: CTC mode, no PWM/pin change but counter always resets when it reaches OCRA
3: FastPWM ignoring OCRA/OCRB (always does full 256 counts before overflow)
(special WGM modes set by bit 3 on TCCR2B)
4: -- invalid
5: PWM phase correct, using OCRA/OCRB
6: -- invalid
7: fast PWM, using OCRA/OCRB

PWM depends on COM2A0/1 and COM2B0/1:
0: off (PWM disabled)
1: toggle PWM pin on compare/match to OCR2A or OCR2B respectively
2: regular PWM
3: inverted PWM
TCCR2A controls all of these, last nybble is the WGM mode, first nybble is COM2A and COM2B, 
determining how OCR2A and OCR2B pins behave
*/