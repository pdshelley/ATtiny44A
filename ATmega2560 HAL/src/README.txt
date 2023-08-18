# Makefile include for building the HAL-metal layer.

# sample usage, switch to src directory and...
# MCU=atmega1284p MCU_DEFINE=__AVR_ATmega1284P__ ADD_WD_FUNCTIONS=no ADD_SLEEP_FUNCTIONS=no make install

# or...
# MCU=atmega328pb PACK=packs/Atmel.ATmega_DFP.1.6.364 make install

# make on its own creates the build products and intermediates in the build folder
# make install also copies the final build products into the appropriate bin folder
# make clean removes the build folder for that MCU only, but doesn't delete anything copied to bin
# make clean also requires MCU to be defined and, annoyingly, MCU_DEFINE too (even though it's unused)
# (my make game isn't strong enough to fix that issue)