void enable_interrupts();
void disable_interrupts();
void sleep(unsigned char mode);
void _resetWatchdog();
void _setWatchdogForReset(unsigned char timeoutMultiplier);
void _disableWatchdog();
