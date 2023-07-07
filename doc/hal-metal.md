# HAL metal

## Background

HAL metal (awaiting a better name) is a set of low level register and interrupt handler access routines for swift programs. It is intended to give swift for arduino programs, compiled in the s4a IDE simple access to registers via statements like `import ATmega1284P`. The generator (see below), attempts to create full, working modules for each AVR processor listed in an .atdf file available to the generator. Those modules are then zipped, the 7MB zipfile deployed with the IDE and expanded to a suitable directory on first run (or update), making them automatically available in s4a IDE programs.

## Generator

The top level Makefile and the files in src act to make the generator. They use metaprogramming to make C, H and swift files for each register and each interrupt vector listed in an atdf for a given mcu. Those files will then be compiled into a hybrid swift/c module (intermediates in the build directory) and deployed in the bin directory, where the zipfile can finally be made.

All of this is automated by just running `make zip` in the top level. Some tools must exist and you may need to alter the locations pointed to. It relies on compilers present in /Applications/SwiftForArduino.app/ so is somewhat of a compiler bootstrap.

The meta programming is done simply by sed replacing placeholder values in template files. You can read the templates to see how it works.


### Linking

Care has been taken in the build to make static libraries sectioned suitably. You must build with --gc-sections linking (automatic in S4A IDE builds) to make sure that only the register access actually used is linked. Satisfyingly, this works well for interrupt handlers. The get/set, ISR and static function pointer it uses are in one link section, so access to the setter automatically causes them all to be linked, setting up the ISR correctly. If not used, they're not linked.


### Issues

At the time of writing, 29 mcus listed in arch-skipped do not generate properly due to apparent libc incompatibilities (awaiting support from Atmel).

Also 9 mcus are more modern and don't work with the generator. It would be a significant effort to upgrade it and isn't likely to happen soon for these 9 special cases. It's better to hand write useable modules.

### todo

The generator should automatically generate some forms of documentation. The S4A IDE doesn't currently handle code completion or swiftdoc but should one day. And in the meantime a text listing of registers defined would suffice.