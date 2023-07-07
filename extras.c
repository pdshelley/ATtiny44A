#include "main.h"
#include <avr/interrupt.h>

void enable_interrupts() {
    __asm__ __volatile__ ("sei" ::: "memory");
}

void disable_interrupts() {
    __asm__ __volatile__ ("cli" ::: "memory");
}

static generalInterruptCallback USART_RX_vect_cb = 0;

ISR(USART_RX_vect) {
    if (USART_RX_vect_cb) {
        USART_RX_vect_cb();
    }
}

generalInterruptCallback getUSART_RX_vect_cb() {
    return USART_RX_vect_cb;
}

void setUSART_RX_vect_cb(generalInterruptCallback cb) {
    USART_RX_vect_cb = cb;
}


