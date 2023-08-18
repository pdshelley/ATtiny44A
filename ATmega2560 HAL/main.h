// import header files or add definitions here that you want to be visible
// within Swift via the clang importer

// note that many gcc constructs will not work, if you are having trouble
// getting something to compile, add a normal .c file (and optionally header)
// with wrapper functions, then declare the wrapper function here instead

#define cpuFrequency F_CPU

typedef void (* _Nonnull generalInterruptCallback)();

void enable_interrupts();

void disable_interrupts();

generalInterruptCallback getUSART_RX_vect_cb();

void setUSART_RX_vect_cb(generalInterruptCallback cb);

