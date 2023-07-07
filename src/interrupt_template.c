#include "interrupt_shared.h"
#include <avr/interrupt.h>

static generalInterruptCallback INTERRUPT_cb = 0;

ISR(INTERRUPT) {
    if (INTERRUPT_cb) {
        INTERRUPT_cb();
    }
}

generalInterruptCallback getINTERRUPT_cb() {
	return INTERRUPT_cb;
}

void setINTERRUPT_cb(generalInterruptCallback cb) {
	INTERRUPT_cb = cb;
}