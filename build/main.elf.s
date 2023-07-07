
build/main.elf:     file format elf32-avr
build/main.elf
architecture: avr, flags 0x00000112:
EXEC_P, HAS_SYMS, D_PAGED
start address 0x00000000

Program Header:
    LOAD off    0x00001000 vaddr 0x00000000 paddr 0x00000000 align 2**12
         filesz 0x00000a70 memsz 0x00000a70 flags r-x
    LOAD off    0x00002100 vaddr 0x00800100 paddr 0x00000a70 align 2**12
         filesz 0x00000006 memsz 0x00000006 flags rw-
    LOAD off    0x00002106 vaddr 0x00800106 paddr 0x00800106 align 2**12
         filesz 0x00000000 memsz 0x00000021 flags rw-
   STACK off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**0
         filesz 0x00000000 memsz 0x00000000 flags rw-

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000a70  00000000  00000000  00001000  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000006  00800100  00000a70  00002100  2**0
                  CONTENTS, ALLOC, LOAD, DATA
SYMBOL TABLE:
00000068 l     O .text	0000000f __unnamed_1
00000077 l     O .text	00000007 __unnamed_2
0000007e l     O .text	00000007 __unnamed_3
00000502 l     F .text	0000000e .hidden $s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n
00000510 l     F .text	000001f8 .hidden $s4main5writeyySuF
00000708 l     F .text	00000042 .hidden globalinit_33_D4F15F4E01259638BE2FAE7B0B53848C_func6
000007b8 l       .text	00000000 .L4
000007c4 l     F .text	0000002a _GLOBAL__sub_I__swift_stdlib_Hashing_parameters
00000804 l       .text	00000000 __udivmodhi4_ep
000007f6 l       .text	00000000 __udivmodhi4_loop
000007ee l       .text	00000028 .hidden __udivmodhi4
00000a6e l       .text	00000000 __stop_program
00000a6c l       .text	00000000 .hidden exit
00000a6c l       .text	00000000 .hidden _exit
000000b4 l       .text	00000000 .do_clear_bss_start
000000b2 l       .text	00000000 .do_clear_bss_loop
000000aa l       .text	00000010 .hidden __do_clear_bss
00000094 l       .text	00000016 .hidden __do_copy_data
000000ba l       .text	00000016 .hidden __do_global_ctors
00000816 l       .text	0000000c .hidden __tablejump2__
00000000 g       .text	00000000 __vectors
00000088  w      .text	00000000 __init
000000d8  w      .text	00000000 __vector_1
000000d8 g       .text	00000000 __bad_interrupt
000000d8  w      .text	00000000 __vector_2
000000d8  w      .text	00000000 __vector_3
000000d8  w      .text	00000000 __vector_4
000000d8  w      .text	00000000 __vector_5
000000d8  w      .text	00000000 __vector_6
000000d8  w      .text	00000000 __vector_7
000000d8  w      .text	00000000 __vector_8
000000d8  w      .text	00000000 __vector_9
000000d8  w      .text	00000000 __vector_10
000000d8  w      .text	00000000 __vector_11
000000d8  w      .text	00000000 __vector_12
000000d8  w      .text	00000000 __vector_13
000000d8  w      .text	00000000 __vector_14
000000d8  w      .text	00000000 __vector_15
000000d8  w      .text	00000000 __vector_16
000000d8  w      .text	00000000 __vector_17
0000074a g     F .text	00000054 __vector_18
000000d8  w      .text	00000000 __vector_19
000000d8  w      .text	00000000 __vector_20
000000d8  w      .text	00000000 __vector_21
000000d8  w      .text	00000000 __vector_22
000000d8  w      .text	00000000 __vector_23
000000d8  w      .text	00000000 __vector_24
000000d8  w      .text	00000000 __vector_25
00000000  w      .text	00000000 __vector_default
000000dc g     F .text	00000426 .protected main
000007be g     F .text	00000006 _byteFromProgmem
00000822 g     F .text	00000138 malloc
0000095a g     F .text	00000112 free
0000079e g     F .text	0000001c swift_once
000007ba  w    F .text	00000004 swift_slowAlloc
00800106 g       .data	00000000 __data_end
00800100 g       .data	00000000 __data_start
00000086 g       .text	00000000 __ctors_start
00000088 g       .text	00000000 __ctors_end
00800102 g     O .data	00000002 __malloc_heap_start
00800100 g     O .data	00000002 __malloc_heap_end
00800104 g     O .data	00000002 __malloc_margin
00000068 g       .text	00000000 __trampolines_start
00000068 g       .text	00000000 __trampolines_end
00000088 g       .text	00000000 __dtors_start
00000088 g       .text	00000000 __dtors_end
00000a70 g       .text	00000000 _etext
00800106 g       .data	00000000 _edata



Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 44 00 	jmp	0x88	; 0x88 <__ctors_end>
   4:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
   8:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
   c:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  10:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  14:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  18:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  1c:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  20:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  24:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  28:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  2c:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  30:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  34:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  38:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  3c:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  40:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  44:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  48:	0c 94 a5 03 	jmp	0x74a	; 0x74a <__vector_18>
  4c:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  50:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  54:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  58:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  5c:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  60:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>
  64:	0c 94 6c 00 	jmp	0xd8	; 0xd8 <__bad_interrupt>

00000068 <__trampolines_end>:
  68:	44 61       	ori	r20, 0x14	; 20
  6a:	74 61       	ori	r23, 0x14	; 20
  6c:	52 65       	ori	r21, 0x52	; 82
  6e:	67 69       	ori	r22, 0x97	; 151
  70:	73 74       	andi	r23, 0x43	; 67
  72:	65 72       	andi	r22, 0x25	; 37
  74:	3a 20       	and	r3, r10
  76:	Address 0x0000000000000076 is out of bounds.


00000077 <__unnamed_2>:
  77:	61 64 63 6c 3a 20 00                                adcl: .

0000007e <__unnamed_3>:
  7e:	61 64 63 68 3a 20 00 00                             adch: ..

00000086 <__ctors_start>:
  86:	e2 03       	fmuls	r22, r18

00000088 <__ctors_end>:
  88:	11 24       	eor	r1, r1
  8a:	1f be       	out	0x3f, r1	; 63
  8c:	cf ef       	ldi	r28, 0xFF	; 255
  8e:	d8 e0       	ldi	r29, 0x08	; 8
  90:	de bf       	out	0x3e, r29	; 62
  92:	cd bf       	out	0x3d, r28	; 61

00000094 <__do_copy_data>:
  94:	11 e0       	ldi	r17, 0x01	; 1
  96:	a0 e0       	ldi	r26, 0x00	; 0
  98:	b1 e0       	ldi	r27, 0x01	; 1
  9a:	e0 e7       	ldi	r30, 0x70	; 112
  9c:	fa e0       	ldi	r31, 0x0A	; 10
  9e:	02 c0       	rjmp	.+4      	; 0xa4 <__do_copy_data+0x10>
  a0:	05 90       	lpm	r0, Z+
  a2:	0d 92       	st	X+, r0
  a4:	a6 30       	cpi	r26, 0x06	; 6
  a6:	b1 07       	cpc	r27, r17
  a8:	d9 f7       	brne	.-10     	; 0xa0 <__do_copy_data+0xc>

000000aa <__do_clear_bss>:
  aa:	21 e0       	ldi	r18, 0x01	; 1
  ac:	a6 e0       	ldi	r26, 0x06	; 6
  ae:	b1 e0       	ldi	r27, 0x01	; 1
  b0:	01 c0       	rjmp	.+2      	; 0xb4 <.do_clear_bss_start>

000000b2 <.do_clear_bss_loop>:
  b2:	1d 92       	st	X+, r1

000000b4 <.do_clear_bss_start>:
  b4:	a7 32       	cpi	r26, 0x27	; 39
  b6:	b2 07       	cpc	r27, r18
  b8:	e1 f7       	brne	.-8      	; 0xb2 <.do_clear_bss_loop>

000000ba <__do_global_ctors>:
  ba:	10 e0       	ldi	r17, 0x00	; 0
  bc:	c4 e4       	ldi	r28, 0x44	; 68
  be:	d0 e0       	ldi	r29, 0x00	; 0
  c0:	04 c0       	rjmp	.+8      	; 0xca <__do_global_ctors+0x10>
  c2:	21 97       	sbiw	r28, 0x01	; 1
  c4:	fe 01       	movw	r30, r28
  c6:	0e 94 0b 04 	call	0x816	; 0x816 <__tablejump2__>
  ca:	c3 34       	cpi	r28, 0x43	; 67
  cc:	d1 07       	cpc	r29, r17
  ce:	c9 f7       	brne	.-14     	; 0xc2 <__do_global_ctors+0x8>
  d0:	0e 94 6e 00 	call	0xdc	; 0xdc <main>
  d4:	0c 94 36 05 	jmp	0xa6c	; 0xa6c <_exit>

000000d8 <__bad_interrupt>:
  d8:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000dc <main>:
  dc:	2f 92       	push	r2
  de:	3f 92       	push	r3
  e0:	4f 92       	push	r4
  e2:	5f 92       	push	r5
  e4:	6f 92       	push	r6
  e6:	7f 92       	push	r7
  e8:	8f 92       	push	r8
  ea:	9f 92       	push	r9
  ec:	af 92       	push	r10
  ee:	bf 92       	push	r11
  f0:	df 92       	push	r13
  f2:	ef 92       	push	r14
  f4:	ff 92       	push	r15
  f6:	0f 93       	push	r16
  f8:	1f 93       	push	r17
  fa:	3d 98       	cbi	0x07, 5	; 7
  fc:	23 9a       	sbi	0x04, 3	; 4
  fe:	53 9a       	sbi	0x0a, 3	; 10
 100:	80 91 c2 00 	lds	r24, 0x00C2	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7f80c2>
 104:	89 7c       	andi	r24, 0xC9	; 201
 106:	86 60       	ori	r24, 0x06	; 6
 108:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7f80c2>
 10c:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7f80c1>
 110:	84 60       	ori	r24, 0x04	; 4
 112:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7f80c1>
 116:	80 91 c2 00 	lds	r24, 0x00C2	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7f80c2>
 11a:	87 7f       	andi	r24, 0xF7	; 247
 11c:	80 93 c2 00 	sts	0x00C2, r24	; 0x8000c2 <__TEXT_REGION_LENGTH__+0x7f80c2>
 120:	10 92 c5 00 	sts	0x00C5, r1	; 0x8000c5 <__TEXT_REGION_LENGTH__+0x7f80c5>
 124:	80 e1       	ldi	r24, 0x10	; 16
 126:	80 93 c4 00 	sts	0x00C4, r24	; 0x8000c4 <__TEXT_REGION_LENGTH__+0x7f80c4>
 12a:	80 91 c1 00 	lds	r24, 0x00C1	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7f80c1>
 12e:	88 69       	ori	r24, 0x98	; 152
 130:	80 93 c1 00 	sts	0x00C1, r24	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7f80c1>
 134:	80 91 7c 00 	lds	r24, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
 138:	8f 73       	andi	r24, 0x3F	; 63
 13a:	80 64       	ori	r24, 0x40	; 64
 13c:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
 140:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
 144:	87 68       	ori	r24, 0x87	; 135
 146:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
 14a:	00 e0       	ldi	r16, 0x00	; 0
 14c:	10 e0       	ldi	r17, 0x00	; 0
 14e:	c8 01       	movw	r24, r16
 150:	98 01       	movw	r18, r16
 152:	a8 01       	movw	r20, r16
 154:	b8 01       	movw	r22, r16
 156:	03 c0       	rjmp	.+6      	; 0x15e <main+0x82>
 158:	e1 70       	andi	r30, 0x01	; 1
 15a:	e0 30       	cpi	r30, 0x00	; 0
 15c:	b9 f0       	breq	.+46     	; 0x18c <main+0xb0>
 15e:	f8 01       	movw	r30, r16
 160:	31 97       	sbiw	r30, 0x01	; 1
 162:	f1 f7       	brne	.-4      	; 0x160 <main+0x84>
 164:	8f 5f       	subi	r24, 0xFF	; 255
 166:	9f 4f       	sbci	r25, 0xFF	; 255
 168:	2f 4f       	sbci	r18, 0xFF	; 255
 16a:	3f 4f       	sbci	r19, 0xFF	; 255
 16c:	4f 4f       	sbci	r20, 0xFF	; 255
 16e:	5f 4f       	sbci	r21, 0xFF	; 255
 170:	6f 4f       	sbci	r22, 0xFF	; 255
 172:	7f 4f       	sbci	r23, 0xFF	; 255
 174:	e1 e0       	ldi	r30, 0x01	; 1
 176:	80 34       	cpi	r24, 0x40	; 64
 178:	91 05       	cpc	r25, r1
 17a:	20 07       	cpc	r18, r16
 17c:	31 07       	cpc	r19, r17
 17e:	40 07       	cpc	r20, r16
 180:	51 07       	cpc	r21, r17
 182:	60 07       	cpc	r22, r16
 184:	71 07       	cpc	r23, r17
 186:	41 f7       	brne	.-48     	; 0x158 <main+0x7c>
 188:	e1 2d       	mov	r30, r1
 18a:	e6 cf       	rjmp	.-52     	; 0x158 <main+0x7c>
 18c:	10 93 19 01 	sts	0x0119, r17	; 0x800119 <$s4main5stuffSuvp+0x1>
 190:	00 93 18 01 	sts	0x0118, r16	; 0x800118 <$s4main5stuffSuvp>
 194:	88 e6       	ldi	r24, 0x68	; 104
 196:	90 e0       	ldi	r25, 0x00	; 0
 198:	4c 01       	movw	r8, r24
 19a:	87 e7       	ldi	r24, 0x77	; 119
 19c:	90 e0       	ldi	r25, 0x00	; 0
 19e:	3c 01       	movw	r6, r24
 1a0:	8e e7       	ldi	r24, 0x7E	; 126
 1a2:	90 e0       	ldi	r25, 0x00	; 0
 1a4:	2c 01       	movw	r4, r24
 1a6:	80 91 7c 00 	lds	r24, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
 1aa:	80 7f       	andi	r24, 0xF0	; 240
 1ac:	85 60       	ori	r24, 0x05	; 5
 1ae:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
 1b2:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
 1b6:	80 64       	ori	r24, 0x40	; 64
 1b8:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
 1bc:	80 91 78 00 	lds	r24, 0x0078	; 0x800078 <__TEXT_REGION_LENGTH__+0x7f8078>
 1c0:	e8 2e       	mov	r14, r24
 1c2:	ff 24       	eor	r15, r15
 1c4:	80 91 79 00 	lds	r24, 0x0079	; 0x800079 <__TEXT_REGION_LENGTH__+0x7f8079>
 1c8:	a8 2e       	mov	r10, r24
 1ca:	bb 24       	eor	r11, r11
 1cc:	c5 01       	movw	r24, r10
 1ce:	98 2f       	mov	r25, r24
 1d0:	88 27       	eor	r24, r24
 1d2:	8e 29       	or	r24, r14
 1d4:	9f 29       	or	r25, r15
 1d6:	90 93 19 01 	sts	0x0119, r25	; 0x800119 <$s4main5stuffSuvp+0x1>
 1da:	80 93 18 01 	sts	0x0118, r24	; 0x800118 <$s4main5stuffSuvp>
 1de:	f8 01       	movw	r30, r16
 1e0:	c4 01       	movw	r24, r8
 1e2:	80 30       	cpi	r24, 0x00	; 0
 1e4:	91 05       	cpc	r25, r1
 1e6:	98 01       	movw	r18, r16
 1e8:	09 f0       	breq	.+2      	; 0x1ec <main+0x110>
 1ea:	94 01       	movw	r18, r8
 1ec:	c9 01       	movw	r24, r18
 1ee:	8e 0f       	add	r24, r30
 1f0:	9f 1f       	adc	r25, r31
 1f2:	20 30       	cpi	r18, 0x00	; 0
 1f4:	31 05       	cpc	r19, r1
 1f6:	09 f0       	breq	.+2      	; 0x1fa <main+0x11e>
 1f8:	9c 01       	movw	r18, r24
 1fa:	1f 01       	movw	r2, r30
 1fc:	49 2f       	mov	r20, r25
 1fe:	44 23       	and	r20, r20
 200:	0a f0       	brmi	.+2      	; 0x204 <main+0x128>
 202:	c9 01       	movw	r24, r18
 204:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 208:	d8 2e       	mov	r13, r24
 20a:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 20e:	81 70       	andi	r24, 0x01	; 1
 210:	80 30       	cpi	r24, 0x00	; 0
 212:	d9 f3       	breq	.-10     	; 0x20a <main+0x12e>
 214:	d0 92 c6 00 	sts	0x00C6, r13	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 218:	f1 01       	movw	r30, r2
 21a:	31 96       	adiw	r30, 0x01	; 1
 21c:	ee 30       	cpi	r30, 0x0E	; 14
 21e:	f1 05       	cpc	r31, r1
 220:	f9 f6       	brne	.-66     	; 0x1e0 <main+0x104>
 222:	80 91 18 01 	lds	r24, 0x0118	; 0x800118 <$s4main5stuffSuvp>
 226:	90 91 19 01 	lds	r25, 0x0119	; 0x800119 <$s4main5stuffSuvp+0x1>
 22a:	0e 94 88 02 	call	0x510	; 0x510 <$s4main5writeyySuF>
 22e:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 232:	81 70       	andi	r24, 0x01	; 1
 234:	80 30       	cpi	r24, 0x00	; 0
 236:	d9 f3       	breq	.-10     	; 0x22e <main+0x152>
 238:	8a e0       	ldi	r24, 0x0A	; 10
 23a:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 23e:	c3 01       	movw	r24, r6
 240:	80 30       	cpi	r24, 0x00	; 0
 242:	91 05       	cpc	r25, r1
 244:	c8 01       	movw	r24, r16
 246:	09 f0       	breq	.+2      	; 0x24a <main+0x16e>
 248:	c3 01       	movw	r24, r6
 24a:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 24e:	d8 2e       	mov	r13, r24
 250:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 254:	81 70       	andi	r24, 0x01	; 1
 256:	80 30       	cpi	r24, 0x00	; 0
 258:	d9 f3       	breq	.-10     	; 0x250 <main+0x174>
 25a:	d0 92 c6 00 	sts	0x00C6, r13	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 25e:	c3 01       	movw	r24, r6
 260:	80 30       	cpi	r24, 0x00	; 0
 262:	91 05       	cpc	r25, r1
 264:	98 01       	movw	r18, r16
 266:	09 f0       	breq	.+2      	; 0x26a <main+0x18e>
 268:	93 01       	movw	r18, r6
 26a:	c9 01       	movw	r24, r18
 26c:	01 96       	adiw	r24, 0x01	; 1
 26e:	20 30       	cpi	r18, 0x00	; 0
 270:	31 05       	cpc	r19, r1
 272:	09 f0       	breq	.+2      	; 0x276 <main+0x19a>
 274:	9c 01       	movw	r18, r24
 276:	49 2f       	mov	r20, r25
 278:	44 23       	and	r20, r20
 27a:	0a f0       	brmi	.+2      	; 0x27e <main+0x1a2>
 27c:	c9 01       	movw	r24, r18
 27e:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 282:	d8 2e       	mov	r13, r24
 284:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 288:	81 70       	andi	r24, 0x01	; 1
 28a:	80 30       	cpi	r24, 0x00	; 0
 28c:	d9 f3       	breq	.-10     	; 0x284 <main+0x1a8>
 28e:	d0 92 c6 00 	sts	0x00C6, r13	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 292:	c3 01       	movw	r24, r6
 294:	80 30       	cpi	r24, 0x00	; 0
 296:	91 05       	cpc	r25, r1
 298:	98 01       	movw	r18, r16
 29a:	09 f0       	breq	.+2      	; 0x29e <main+0x1c2>
 29c:	93 01       	movw	r18, r6
 29e:	c9 01       	movw	r24, r18
 2a0:	02 96       	adiw	r24, 0x02	; 2
 2a2:	20 30       	cpi	r18, 0x00	; 0
 2a4:	31 05       	cpc	r19, r1
 2a6:	09 f0       	breq	.+2      	; 0x2aa <main+0x1ce>
 2a8:	9c 01       	movw	r18, r24
 2aa:	49 2f       	mov	r20, r25
 2ac:	44 23       	and	r20, r20
 2ae:	0a f0       	brmi	.+2      	; 0x2b2 <main+0x1d6>
 2b0:	c9 01       	movw	r24, r18
 2b2:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 2b6:	d8 2e       	mov	r13, r24
 2b8:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 2bc:	81 70       	andi	r24, 0x01	; 1
 2be:	80 30       	cpi	r24, 0x00	; 0
 2c0:	d9 f3       	breq	.-10     	; 0x2b8 <main+0x1dc>
 2c2:	d0 92 c6 00 	sts	0x00C6, r13	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 2c6:	c3 01       	movw	r24, r6
 2c8:	80 30       	cpi	r24, 0x00	; 0
 2ca:	91 05       	cpc	r25, r1
 2cc:	98 01       	movw	r18, r16
 2ce:	09 f0       	breq	.+2      	; 0x2d2 <main+0x1f6>
 2d0:	93 01       	movw	r18, r6
 2d2:	c9 01       	movw	r24, r18
 2d4:	03 96       	adiw	r24, 0x03	; 3
 2d6:	20 30       	cpi	r18, 0x00	; 0
 2d8:	31 05       	cpc	r19, r1
 2da:	09 f0       	breq	.+2      	; 0x2de <main+0x202>
 2dc:	9c 01       	movw	r18, r24
 2de:	49 2f       	mov	r20, r25
 2e0:	44 23       	and	r20, r20
 2e2:	0a f0       	brmi	.+2      	; 0x2e6 <main+0x20a>
 2e4:	c9 01       	movw	r24, r18
 2e6:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 2ea:	d8 2e       	mov	r13, r24
 2ec:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 2f0:	81 70       	andi	r24, 0x01	; 1
 2f2:	80 30       	cpi	r24, 0x00	; 0
 2f4:	d9 f3       	breq	.-10     	; 0x2ec <main+0x210>
 2f6:	d0 92 c6 00 	sts	0x00C6, r13	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 2fa:	c3 01       	movw	r24, r6
 2fc:	80 30       	cpi	r24, 0x00	; 0
 2fe:	91 05       	cpc	r25, r1
 300:	98 01       	movw	r18, r16
 302:	09 f0       	breq	.+2      	; 0x306 <main+0x22a>
 304:	93 01       	movw	r18, r6
 306:	c9 01       	movw	r24, r18
 308:	04 96       	adiw	r24, 0x04	; 4
 30a:	20 30       	cpi	r18, 0x00	; 0
 30c:	31 05       	cpc	r19, r1
 30e:	09 f0       	breq	.+2      	; 0x312 <main+0x236>
 310:	9c 01       	movw	r18, r24
 312:	49 2f       	mov	r20, r25
 314:	44 23       	and	r20, r20
 316:	0a f0       	brmi	.+2      	; 0x31a <main+0x23e>
 318:	c9 01       	movw	r24, r18
 31a:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 31e:	d8 2e       	mov	r13, r24
 320:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 324:	81 70       	andi	r24, 0x01	; 1
 326:	80 30       	cpi	r24, 0x00	; 0
 328:	d9 f3       	breq	.-10     	; 0x320 <main+0x244>
 32a:	d0 92 c6 00 	sts	0x00C6, r13	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 32e:	c3 01       	movw	r24, r6
 330:	80 30       	cpi	r24, 0x00	; 0
 332:	91 05       	cpc	r25, r1
 334:	98 01       	movw	r18, r16
 336:	09 f0       	breq	.+2      	; 0x33a <main+0x25e>
 338:	93 01       	movw	r18, r6
 33a:	c9 01       	movw	r24, r18
 33c:	05 96       	adiw	r24, 0x05	; 5
 33e:	20 30       	cpi	r18, 0x00	; 0
 340:	31 05       	cpc	r19, r1
 342:	09 f0       	breq	.+2      	; 0x346 <main+0x26a>
 344:	9c 01       	movw	r18, r24
 346:	49 2f       	mov	r20, r25
 348:	44 23       	and	r20, r20
 34a:	0a f0       	brmi	.+2      	; 0x34e <main+0x272>
 34c:	c9 01       	movw	r24, r18
 34e:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 352:	d8 2e       	mov	r13, r24
 354:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 358:	81 70       	andi	r24, 0x01	; 1
 35a:	80 30       	cpi	r24, 0x00	; 0
 35c:	d9 f3       	breq	.-10     	; 0x354 <main+0x278>
 35e:	d0 92 c6 00 	sts	0x00C6, r13	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 362:	c7 01       	movw	r24, r14
 364:	0e 94 88 02 	call	0x510	; 0x510 <$s4main5writeyySuF>
 368:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 36c:	81 70       	andi	r24, 0x01	; 1
 36e:	80 30       	cpi	r24, 0x00	; 0
 370:	d9 f3       	breq	.-10     	; 0x368 <main+0x28c>
 372:	8a e0       	ldi	r24, 0x0A	; 10
 374:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 378:	c2 01       	movw	r24, r4
 37a:	80 30       	cpi	r24, 0x00	; 0
 37c:	91 05       	cpc	r25, r1
 37e:	c8 01       	movw	r24, r16
 380:	09 f0       	breq	.+2      	; 0x384 <main+0x2a8>
 382:	c2 01       	movw	r24, r4
 384:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 388:	f8 2e       	mov	r15, r24
 38a:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 38e:	81 70       	andi	r24, 0x01	; 1
 390:	80 30       	cpi	r24, 0x00	; 0
 392:	d9 f3       	breq	.-10     	; 0x38a <main+0x2ae>
 394:	f0 92 c6 00 	sts	0x00C6, r15	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 398:	c2 01       	movw	r24, r4
 39a:	80 30       	cpi	r24, 0x00	; 0
 39c:	91 05       	cpc	r25, r1
 39e:	98 01       	movw	r18, r16
 3a0:	09 f0       	breq	.+2      	; 0x3a4 <main+0x2c8>
 3a2:	92 01       	movw	r18, r4
 3a4:	c9 01       	movw	r24, r18
 3a6:	01 96       	adiw	r24, 0x01	; 1
 3a8:	20 30       	cpi	r18, 0x00	; 0
 3aa:	31 05       	cpc	r19, r1
 3ac:	09 f0       	breq	.+2      	; 0x3b0 <main+0x2d4>
 3ae:	9c 01       	movw	r18, r24
 3b0:	49 2f       	mov	r20, r25
 3b2:	44 23       	and	r20, r20
 3b4:	0a f0       	brmi	.+2      	; 0x3b8 <main+0x2dc>
 3b6:	c9 01       	movw	r24, r18
 3b8:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 3bc:	f8 2e       	mov	r15, r24
 3be:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 3c2:	81 70       	andi	r24, 0x01	; 1
 3c4:	80 30       	cpi	r24, 0x00	; 0
 3c6:	d9 f3       	breq	.-10     	; 0x3be <main+0x2e2>
 3c8:	f0 92 c6 00 	sts	0x00C6, r15	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 3cc:	c2 01       	movw	r24, r4
 3ce:	80 30       	cpi	r24, 0x00	; 0
 3d0:	91 05       	cpc	r25, r1
 3d2:	98 01       	movw	r18, r16
 3d4:	09 f0       	breq	.+2      	; 0x3d8 <main+0x2fc>
 3d6:	92 01       	movw	r18, r4
 3d8:	c9 01       	movw	r24, r18
 3da:	02 96       	adiw	r24, 0x02	; 2
 3dc:	20 30       	cpi	r18, 0x00	; 0
 3de:	31 05       	cpc	r19, r1
 3e0:	09 f0       	breq	.+2      	; 0x3e4 <main+0x308>
 3e2:	9c 01       	movw	r18, r24
 3e4:	49 2f       	mov	r20, r25
 3e6:	44 23       	and	r20, r20
 3e8:	0a f0       	brmi	.+2      	; 0x3ec <main+0x310>
 3ea:	c9 01       	movw	r24, r18
 3ec:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 3f0:	f8 2e       	mov	r15, r24
 3f2:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 3f6:	81 70       	andi	r24, 0x01	; 1
 3f8:	80 30       	cpi	r24, 0x00	; 0
 3fa:	d9 f3       	breq	.-10     	; 0x3f2 <main+0x316>
 3fc:	f0 92 c6 00 	sts	0x00C6, r15	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 400:	c2 01       	movw	r24, r4
 402:	80 30       	cpi	r24, 0x00	; 0
 404:	91 05       	cpc	r25, r1
 406:	98 01       	movw	r18, r16
 408:	09 f0       	breq	.+2      	; 0x40c <main+0x330>
 40a:	92 01       	movw	r18, r4
 40c:	c9 01       	movw	r24, r18
 40e:	03 96       	adiw	r24, 0x03	; 3
 410:	20 30       	cpi	r18, 0x00	; 0
 412:	31 05       	cpc	r19, r1
 414:	09 f0       	breq	.+2      	; 0x418 <main+0x33c>
 416:	9c 01       	movw	r18, r24
 418:	49 2f       	mov	r20, r25
 41a:	44 23       	and	r20, r20
 41c:	0a f0       	brmi	.+2      	; 0x420 <main+0x344>
 41e:	c9 01       	movw	r24, r18
 420:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 424:	f8 2e       	mov	r15, r24
 426:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 42a:	81 70       	andi	r24, 0x01	; 1
 42c:	80 30       	cpi	r24, 0x00	; 0
 42e:	d9 f3       	breq	.-10     	; 0x426 <main+0x34a>
 430:	f0 92 c6 00 	sts	0x00C6, r15	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 434:	c2 01       	movw	r24, r4
 436:	80 30       	cpi	r24, 0x00	; 0
 438:	91 05       	cpc	r25, r1
 43a:	98 01       	movw	r18, r16
 43c:	09 f0       	breq	.+2      	; 0x440 <main+0x364>
 43e:	92 01       	movw	r18, r4
 440:	c9 01       	movw	r24, r18
 442:	04 96       	adiw	r24, 0x04	; 4
 444:	20 30       	cpi	r18, 0x00	; 0
 446:	31 05       	cpc	r19, r1
 448:	09 f0       	breq	.+2      	; 0x44c <main+0x370>
 44a:	9c 01       	movw	r18, r24
 44c:	49 2f       	mov	r20, r25
 44e:	44 23       	and	r20, r20
 450:	0a f0       	brmi	.+2      	; 0x454 <main+0x378>
 452:	c9 01       	movw	r24, r18
 454:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 458:	f8 2e       	mov	r15, r24
 45a:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 45e:	81 70       	andi	r24, 0x01	; 1
 460:	80 30       	cpi	r24, 0x00	; 0
 462:	d9 f3       	breq	.-10     	; 0x45a <main+0x37e>
 464:	f0 92 c6 00 	sts	0x00C6, r15	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 468:	c2 01       	movw	r24, r4
 46a:	80 30       	cpi	r24, 0x00	; 0
 46c:	91 05       	cpc	r25, r1
 46e:	98 01       	movw	r18, r16
 470:	09 f0       	breq	.+2      	; 0x474 <main+0x398>
 472:	92 01       	movw	r18, r4
 474:	c9 01       	movw	r24, r18
 476:	05 96       	adiw	r24, 0x05	; 5
 478:	20 30       	cpi	r18, 0x00	; 0
 47a:	31 05       	cpc	r19, r1
 47c:	09 f0       	breq	.+2      	; 0x480 <main+0x3a4>
 47e:	9c 01       	movw	r18, r24
 480:	49 2f       	mov	r20, r25
 482:	44 23       	and	r20, r20
 484:	0a f0       	brmi	.+2      	; 0x488 <main+0x3ac>
 486:	c9 01       	movw	r24, r18
 488:	0e 94 df 03 	call	0x7be	; 0x7be <_byteFromProgmem>
 48c:	f8 2e       	mov	r15, r24
 48e:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 492:	81 70       	andi	r24, 0x01	; 1
 494:	80 30       	cpi	r24, 0x00	; 0
 496:	d9 f3       	breq	.-10     	; 0x48e <main+0x3b2>
 498:	f0 92 c6 00 	sts	0x00C6, r15	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 49c:	c5 01       	movw	r24, r10
 49e:	0e 94 88 02 	call	0x510	; 0x510 <$s4main5writeyySuF>
 4a2:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 4a6:	81 70       	andi	r24, 0x01	; 1
 4a8:	80 30       	cpi	r24, 0x00	; 0
 4aa:	d9 f3       	breq	.-10     	; 0x4a2 <main+0x3c6>
 4ac:	8a e0       	ldi	r24, 0x0A	; 10
 4ae:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 4b2:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 4b6:	81 70       	andi	r24, 0x01	; 1
 4b8:	80 30       	cpi	r24, 0x00	; 0
 4ba:	d9 f3       	breq	.-10     	; 0x4b2 <main+0x3d6>
 4bc:	8a e0       	ldi	r24, 0x0A	; 10
 4be:	80 93 c6 00 	sts	0x00C6, r24	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 4c2:	c8 01       	movw	r24, r16
 4c4:	98 01       	movw	r18, r16
 4c6:	a8 01       	movw	r20, r16
 4c8:	b8 01       	movw	r22, r16
 4ca:	04 c0       	rjmp	.+8      	; 0x4d4 <main+0x3f8>
 4cc:	e1 70       	andi	r30, 0x01	; 1
 4ce:	e0 30       	cpi	r30, 0x00	; 0
 4d0:	09 f0       	breq	.+2      	; 0x4d4 <main+0x3f8>
 4d2:	69 ce       	rjmp	.-814    	; 0x1a6 <main+0xca>
 4d4:	f8 01       	movw	r30, r16
 4d6:	31 97       	sbiw	r30, 0x01	; 1
 4d8:	f1 f7       	brne	.-4      	; 0x4d6 <main+0x3fa>
 4da:	8f 5f       	subi	r24, 0xFF	; 255
 4dc:	9f 4f       	sbci	r25, 0xFF	; 255
 4de:	2f 4f       	sbci	r18, 0xFF	; 255
 4e0:	3f 4f       	sbci	r19, 0xFF	; 255
 4e2:	4f 4f       	sbci	r20, 0xFF	; 255
 4e4:	5f 4f       	sbci	r21, 0xFF	; 255
 4e6:	6f 4f       	sbci	r22, 0xFF	; 255
 4e8:	7f 4f       	sbci	r23, 0xFF	; 255
 4ea:	e1 e0       	ldi	r30, 0x01	; 1
 4ec:	80 34       	cpi	r24, 0x40	; 64
 4ee:	91 05       	cpc	r25, r1
 4f0:	20 07       	cpc	r18, r16
 4f2:	31 07       	cpc	r19, r17
 4f4:	40 07       	cpc	r20, r16
 4f6:	51 07       	cpc	r21, r17
 4f8:	60 07       	cpc	r22, r16
 4fa:	71 07       	cpc	r23, r17
 4fc:	39 f3       	breq	.-50     	; 0x4cc <main+0x3f0>
 4fe:	e1 2d       	mov	r30, r1
 500:	e5 cf       	rjmp	.-54     	; 0x4cc <main+0x3f0>

00000502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>:
 502:	80 91 c0 00 	lds	r24, 0x00C0	; 0x8000c0 <__TEXT_REGION_LENGTH__+0x7f80c0>
 506:	80 72       	andi	r24, 0x20	; 32
 508:	82 95       	swap	r24
 50a:	8f 70       	andi	r24, 0x0F	; 15
 50c:	86 95       	lsr	r24
 50e:	08 95       	ret

00000510 <$s4main5writeyySuF>:
 510:	8f 92       	push	r8
 512:	9f 92       	push	r9
 514:	af 92       	push	r10
 516:	bf 92       	push	r11
 518:	cf 92       	push	r12
 51a:	df 92       	push	r13
 51c:	ef 92       	push	r14
 51e:	ff 92       	push	r15
 520:	0f 93       	push	r16
 522:	1f 93       	push	r17
 524:	6c 01       	movw	r12, r24
 526:	8a e1       	ldi	r24, 0x1A	; 26
 528:	91 e0       	ldi	r25, 0x01	; 1
 52a:	64 e8       	ldi	r22, 0x84	; 132
 52c:	73 e0       	ldi	r23, 0x03	; 3
 52e:	0e 94 cf 03 	call	0x79e	; 0x79e <swift_once>
 532:	80 91 20 01 	lds	r24, 0x0120	; 0x800120 <$s4main9intBufferSrys5UInt8VGSgvp+0x4>
 536:	80 30       	cpi	r24, 0x00	; 0
 538:	09 f0       	breq	.+2      	; 0x53c <$s4main5writeyySuF+0x2c>
 53a:	db c0       	rjmp	.+438    	; 0x6f2 <$s4main5writeyySuF+0x1e2>
 53c:	80 91 1c 01 	lds	r24, 0x011C	; 0x80011c <$s4main9intBufferSrys5UInt8VGSgvp>
 540:	90 91 1d 01 	lds	r25, 0x011D	; 0x80011d <$s4main9intBufferSrys5UInt8VGSgvp+0x1>
 544:	fc 01       	movw	r30, r24
 546:	35 96       	adiw	r30, 0x05	; 5
 548:	b1 2c       	mov	r11, r1
 54a:	80 30       	cpi	r24, 0x00	; 0
 54c:	7c 01       	movw	r14, r24
 54e:	9b 05       	cpc	r25, r11
 550:	29 f0       	breq	.+10     	; 0x55c <$s4main5writeyySuF+0x4c>
 552:	cf 01       	movw	r24, r30
 554:	2f 2f       	mov	r18, r31
 556:	22 23       	and	r18, r18
 558:	32 f4       	brpl	.+12     	; 0x566 <$s4main5writeyySuF+0x56>
 55a:	06 c0       	rjmp	.+12     	; 0x568 <$s4main5writeyySuF+0x58>
 55c:	80 e0       	ldi	r24, 0x00	; 0
 55e:	90 e0       	ldi	r25, 0x00	; 0
 560:	2f 2f       	mov	r18, r31
 562:	22 23       	and	r18, r18
 564:	0a f0       	brmi	.+2      	; 0x568 <$s4main5writeyySuF+0x58>
 566:	fc 01       	movw	r30, r24
 568:	6a e0       	ldi	r22, 0x0A	; 10
 56a:	70 e0       	ldi	r23, 0x00	; 0
 56c:	86 01       	movw	r16, r12
 56e:	c8 01       	movw	r24, r16
 570:	4f 01       	movw	r8, r30
 572:	0e 94 f7 03 	call	0x7ee	; 0x7ee <__udivmodhi4>
 576:	8a e0       	ldi	r24, 0x0A	; 10
 578:	78 02       	muls	r23, r24
 57a:	90 2d       	mov	r25, r0
 57c:	11 24       	eor	r1, r1
 57e:	68 9f       	mul	r22, r24
 580:	21 2d       	mov	r18, r1
 582:	11 24       	eor	r1, r1
 584:	29 0f       	add	r18, r25
 586:	32 2f       	mov	r19, r18
 588:	22 27       	eor	r18, r18
 58a:	c0 01       	movw	r24, r0
 58c:	82 2b       	or	r24, r18
 58e:	93 2b       	or	r25, r19
 590:	98 01       	movw	r18, r16
 592:	28 1b       	sub	r18, r24
 594:	39 0b       	sbc	r19, r25
 596:	20 63       	ori	r18, 0x30	; 48
 598:	d4 01       	movw	r26, r8
 59a:	2c 93       	st	X, r18
 59c:	0a 30       	cpi	r16, 0x0A	; 10
 59e:	1b 05       	cpc	r17, r11
 5a0:	10 f4       	brcc	.+4      	; 0x5a6 <$s4main5writeyySuF+0x96>
 5a2:	15 e0       	ldi	r17, 0x05	; 5
 5a4:	8a c0       	rjmp	.+276    	; 0x6ba <$s4main5writeyySuF+0x1aa>
 5a6:	c7 01       	movw	r24, r14
 5a8:	fc 01       	movw	r30, r24
 5aa:	34 96       	adiw	r30, 0x04	; 4
 5ac:	11 2d       	mov	r17, r1
 5ae:	80 30       	cpi	r24, 0x00	; 0
 5b0:	91 07       	cpc	r25, r17
 5b2:	29 f0       	breq	.+10     	; 0x5be <$s4main5writeyySuF+0xae>
 5b4:	cf 01       	movw	r24, r30
 5b6:	2f 2f       	mov	r18, r31
 5b8:	22 23       	and	r18, r18
 5ba:	32 f4       	brpl	.+12     	; 0x5c8 <$s4main5writeyySuF+0xb8>
 5bc:	06 c0       	rjmp	.+12     	; 0x5ca <$s4main5writeyySuF+0xba>
 5be:	80 e0       	ldi	r24, 0x00	; 0
 5c0:	90 e0       	ldi	r25, 0x00	; 0
 5c2:	2f 2f       	mov	r18, r31
 5c4:	22 23       	and	r18, r18
 5c6:	0a f0       	brmi	.+2      	; 0x5ca <$s4main5writeyySuF+0xba>
 5c8:	fc 01       	movw	r30, r24
 5ca:	2a e0       	ldi	r18, 0x0A	; 10
 5cc:	30 e0       	ldi	r19, 0x00	; 0
 5ce:	cb 01       	movw	r24, r22
 5d0:	b9 01       	movw	r22, r18
 5d2:	5f 01       	movw	r10, r30
 5d4:	0e 94 f7 03 	call	0x7ee	; 0x7ee <__udivmodhi4>
 5d8:	80 63       	ori	r24, 0x30	; 48
 5da:	d5 01       	movw	r26, r10
 5dc:	8c 93       	st	X, r24
 5de:	c6 01       	movw	r24, r12
 5e0:	84 36       	cpi	r24, 0x64	; 100
 5e2:	91 07       	cpc	r25, r17
 5e4:	10 f4       	brcc	.+4      	; 0x5ea <$s4main5writeyySuF+0xda>
 5e6:	14 e0       	ldi	r17, 0x04	; 4
 5e8:	68 c0       	rjmp	.+208    	; 0x6ba <$s4main5writeyySuF+0x1aa>
 5ea:	c7 01       	movw	r24, r14
 5ec:	fc 01       	movw	r30, r24
 5ee:	33 96       	adiw	r30, 0x03	; 3
 5f0:	80 30       	cpi	r24, 0x00	; 0
 5f2:	91 05       	cpc	r25, r1
 5f4:	29 f0       	breq	.+10     	; 0x600 <$s4main5writeyySuF+0xf0>
 5f6:	cf 01       	movw	r24, r30
 5f8:	2f 2f       	mov	r18, r31
 5fa:	22 23       	and	r18, r18
 5fc:	32 f4       	brpl	.+12     	; 0x60a <$s4main5writeyySuF+0xfa>
 5fe:	06 c0       	rjmp	.+12     	; 0x60c <$s4main5writeyySuF+0xfc>
 600:	80 e0       	ldi	r24, 0x00	; 0
 602:	90 e0       	ldi	r25, 0x00	; 0
 604:	2f 2f       	mov	r18, r31
 606:	22 23       	and	r18, r18
 608:	0a f0       	brmi	.+2      	; 0x60c <$s4main5writeyySuF+0xfc>
 60a:	fc 01       	movw	r30, r24
 60c:	64 e6       	ldi	r22, 0x64	; 100
 60e:	70 e0       	ldi	r23, 0x00	; 0
 610:	c6 01       	movw	r24, r12
 612:	5c 01       	movw	r10, r24
 614:	8f 01       	movw	r16, r30
 616:	0e 94 f7 03 	call	0x7ee	; 0x7ee <__udivmodhi4>
 61a:	2a e0       	ldi	r18, 0x0A	; 10
 61c:	30 e0       	ldi	r19, 0x00	; 0
 61e:	cb 01       	movw	r24, r22
 620:	b9 01       	movw	r22, r18
 622:	0e 94 f7 03 	call	0x7ee	; 0x7ee <__udivmodhi4>
 626:	80 63       	ori	r24, 0x30	; 48
 628:	d8 01       	movw	r26, r16
 62a:	8c 93       	st	X, r24
 62c:	13 e0       	ldi	r17, 0x03	; 3
 62e:	c5 01       	movw	r24, r10
 630:	88 3e       	cpi	r24, 0xE8	; 232
 632:	91 07       	cpc	r25, r17
 634:	08 f4       	brcc	.+2      	; 0x638 <$s4main5writeyySuF+0x128>
 636:	41 c0       	rjmp	.+130    	; 0x6ba <$s4main5writeyySuF+0x1aa>
 638:	c7 01       	movw	r24, r14
 63a:	fc 01       	movw	r30, r24
 63c:	32 96       	adiw	r30, 0x02	; 2
 63e:	80 30       	cpi	r24, 0x00	; 0
 640:	91 05       	cpc	r25, r1
 642:	11 f0       	breq	.+4      	; 0x648 <$s4main5writeyySuF+0x138>
 644:	cf 01       	movw	r24, r30
 646:	02 c0       	rjmp	.+4      	; 0x64c <$s4main5writeyySuF+0x13c>
 648:	80 e0       	ldi	r24, 0x00	; 0
 64a:	90 e0       	ldi	r25, 0x00	; 0
 64c:	2f 2f       	mov	r18, r31
 64e:	22 23       	and	r18, r18
 650:	0a f0       	brmi	.+2      	; 0x654 <$s4main5writeyySuF+0x144>
 652:	fc 01       	movw	r30, r24
 654:	68 ee       	ldi	r22, 0xE8	; 232
 656:	73 e0       	ldi	r23, 0x03	; 3
 658:	86 01       	movw	r16, r12
 65a:	c8 01       	movw	r24, r16
 65c:	5f 01       	movw	r10, r30
 65e:	0e 94 f7 03 	call	0x7ee	; 0x7ee <__udivmodhi4>
 662:	8d ec       	ldi	r24, 0xCD	; 205
 664:	68 9f       	mul	r22, r24
 666:	81 2d       	mov	r24, r1
 668:	11 24       	eor	r1, r1
 66a:	86 95       	lsr	r24
 66c:	86 95       	lsr	r24
 66e:	86 95       	lsr	r24
 670:	9a e0       	ldi	r25, 0x0A	; 10
 672:	89 02       	muls	r24, r25
 674:	11 24       	eor	r1, r1
 676:	60 19       	sub	r22, r0
 678:	60 63       	ori	r22, 0x30	; 48
 67a:	d5 01       	movw	r26, r10
 67c:	6c 93       	st	X, r22
 67e:	87 e2       	ldi	r24, 0x27	; 39
 680:	00 31       	cpi	r16, 0x10	; 16
 682:	18 07       	cpc	r17, r24
 684:	10 f4       	brcc	.+4      	; 0x68a <$s4main5writeyySuF+0x17a>
 686:	12 e0       	ldi	r17, 0x02	; 2
 688:	18 c0       	rjmp	.+48     	; 0x6ba <$s4main5writeyySuF+0x1aa>
 68a:	c7 01       	movw	r24, r14
 68c:	fc 01       	movw	r30, r24
 68e:	31 96       	adiw	r30, 0x01	; 1
 690:	80 30       	cpi	r24, 0x00	; 0
 692:	91 05       	cpc	r25, r1
 694:	11 f0       	breq	.+4      	; 0x69a <$s4main5writeyySuF+0x18a>
 696:	cf 01       	movw	r24, r30
 698:	02 c0       	rjmp	.+4      	; 0x69e <$s4main5writeyySuF+0x18e>
 69a:	80 e0       	ldi	r24, 0x00	; 0
 69c:	90 e0       	ldi	r25, 0x00	; 0
 69e:	2f 2f       	mov	r18, r31
 6a0:	22 23       	and	r18, r18
 6a2:	0a f0       	brmi	.+2      	; 0x6a6 <$s4main5writeyySuF+0x196>
 6a4:	fc 01       	movw	r30, r24
 6a6:	60 e1       	ldi	r22, 0x10	; 16
 6a8:	77 e2       	ldi	r23, 0x27	; 39
 6aa:	c6 01       	movw	r24, r12
 6ac:	8f 01       	movw	r16, r30
 6ae:	0e 94 f7 03 	call	0x7ee	; 0x7ee <__udivmodhi4>
 6b2:	60 63       	ori	r22, 0x30	; 48
 6b4:	d8 01       	movw	r26, r16
 6b6:	6c 93       	st	X, r22
 6b8:	11 e0       	ldi	r17, 0x01	; 1
 6ba:	80 e0       	ldi	r24, 0x00	; 0
 6bc:	90 e0       	ldi	r25, 0x00	; 0
 6be:	6c 01       	movw	r12, r24
 6c0:	a1 2f       	mov	r26, r17
 6c2:	bb 27       	eor	r27, r27
 6c4:	c7 01       	movw	r24, r14
 6c6:	a8 0f       	add	r26, r24
 6c8:	b9 1f       	adc	r27, r25
 6ca:	80 30       	cpi	r24, 0x00	; 0
 6cc:	91 05       	cpc	r25, r1
 6ce:	c6 01       	movw	r24, r12
 6d0:	09 f0       	breq	.+2      	; 0x6d4 <$s4main5writeyySuF+0x1c4>
 6d2:	cd 01       	movw	r24, r26
 6d4:	2b 2f       	mov	r18, r27
 6d6:	22 23       	and	r18, r18
 6d8:	0a f0       	brmi	.+2      	; 0x6dc <$s4main5writeyySuF+0x1cc>
 6da:	dc 01       	movw	r26, r24
 6dc:	0c 91       	ld	r16, X
 6de:	0e 94 81 02 	call	0x502	; 0x502 <$s4main8UARTPortPAAE17dataRegisterEmptySbvgZAA5UART0V_Tg5Tf4d_n>
 6e2:	81 70       	andi	r24, 0x01	; 1
 6e4:	80 30       	cpi	r24, 0x00	; 0
 6e6:	d9 f3       	breq	.-10     	; 0x6de <$s4main5writeyySuF+0x1ce>
 6e8:	00 93 c6 00 	sts	0x00C6, r16	; 0x8000c6 <__TEXT_REGION_LENGTH__+0x7f80c6>
 6ec:	13 95       	inc	r17
 6ee:	16 30       	cpi	r17, 0x06	; 6
 6f0:	39 f7       	brne	.-50     	; 0x6c0 <$s4main5writeyySuF+0x1b0>
 6f2:	1f 91       	pop	r17
 6f4:	0f 91       	pop	r16
 6f6:	ff 90       	pop	r15
 6f8:	ef 90       	pop	r14
 6fa:	df 90       	pop	r13
 6fc:	cf 90       	pop	r12
 6fe:	bf 90       	pop	r11
 700:	af 90       	pop	r10
 702:	9f 90       	pop	r9
 704:	8f 90       	pop	r8
 706:	08 95       	ret

00000708 <globalinit_33_D4F15F4E01259638BE2FAE7B0B53848C_func6>:
 708:	0f 93       	push	r16
 70a:	1f 93       	push	r17
 70c:	06 e0       	ldi	r16, 0x06	; 6
 70e:	10 e0       	ldi	r17, 0x00	; 0
 710:	6f ef       	ldi	r22, 0xFF	; 255
 712:	7f ef       	ldi	r23, 0xFF	; 255
 714:	c8 01       	movw	r24, r16
 716:	0e 94 dd 03 	call	0x7ba	; 0x7ba <swift_slowAlloc>
 71a:	90 93 1d 01 	sts	0x011D, r25	; 0x80011d <$s4main9intBufferSrys5UInt8VGSgvp+0x1>
 71e:	80 93 1c 01 	sts	0x011C, r24	; 0x80011c <$s4main9intBufferSrys5UInt8VGSgvp>
 722:	80 30       	cpi	r24, 0x00	; 0
 724:	91 05       	cpc	r25, r1
 726:	11 f4       	brne	.+4      	; 0x72c <globalinit_33_D4F15F4E01259638BE2FAE7B0B53848C_func6+0x24>
 728:	00 e0       	ldi	r16, 0x00	; 0
 72a:	10 e0       	ldi	r17, 0x00	; 0
 72c:	10 93 1f 01 	sts	0x011F, r17	; 0x80011f <$s4main9intBufferSrys5UInt8VGSgvp+0x3>
 730:	00 93 1e 01 	sts	0x011E, r16	; 0x80011e <$s4main9intBufferSrys5UInt8VGSgvp+0x2>
 734:	21 e0       	ldi	r18, 0x01	; 1
 736:	80 30       	cpi	r24, 0x00	; 0
 738:	91 05       	cpc	r25, r1
 73a:	09 f0       	breq	.+2      	; 0x73e <globalinit_33_D4F15F4E01259638BE2FAE7B0B53848C_func6+0x36>
 73c:	21 2d       	mov	r18, r1
 73e:	21 70       	andi	r18, 0x01	; 1
 740:	20 93 20 01 	sts	0x0120, r18	; 0x800120 <$s4main9intBufferSrys5UInt8VGSgvp+0x4>
 744:	1f 91       	pop	r17
 746:	0f 91       	pop	r16
 748:	08 95       	ret

0000074a <__vector_18>:
 74a:	0f 92       	push	r0
 74c:	0f b6       	in	r0, 0x3f	; 63
 74e:	0f 92       	push	r0
 750:	1f 92       	push	r1
 752:	11 24       	eor	r1, r1
 754:	2f 93       	push	r18
 756:	3f 93       	push	r19
 758:	4f 93       	push	r20
 75a:	5f 93       	push	r21
 75c:	6f 93       	push	r22
 75e:	7f 93       	push	r23
 760:	8f 93       	push	r24
 762:	9f 93       	push	r25
 764:	af 93       	push	r26
 766:	bf 93       	push	r27
 768:	ef 93       	push	r30
 76a:	ff 93       	push	r31
 76c:	e0 91 21 01 	lds	r30, 0x0121	; 0x800121 <USART_RX_vect_cb>
 770:	f0 91 22 01 	lds	r31, 0x0122	; 0x800122 <USART_RX_vect_cb+0x1>
 774:	e0 30       	cpi	r30, 0x00	; 0
 776:	f1 05       	cpc	r31, r1
 778:	09 f0       	breq	.+2      	; 0x77c <__vector_18+0x32>
 77a:	09 95       	icall
 77c:	ff 91       	pop	r31
 77e:	ef 91       	pop	r30
 780:	bf 91       	pop	r27
 782:	af 91       	pop	r26
 784:	9f 91       	pop	r25
 786:	8f 91       	pop	r24
 788:	7f 91       	pop	r23
 78a:	6f 91       	pop	r22
 78c:	5f 91       	pop	r21
 78e:	4f 91       	pop	r20
 790:	3f 91       	pop	r19
 792:	2f 91       	pop	r18
 794:	1f 90       	pop	r1
 796:	0f 90       	pop	r0
 798:	0f be       	out	0x3f, r0	; 63
 79a:	0f 90       	pop	r0
 79c:	18 95       	reti

0000079e <swift_once>:
 79e:	dc 01       	movw	r26, r24
 7a0:	fb 01       	movw	r30, r22
 7a2:	ca 01       	movw	r24, r20
 7a4:	2d 91       	ld	r18, X+
 7a6:	3c 91       	ld	r19, X
 7a8:	11 97       	sbiw	r26, 0x01	; 1
 7aa:	23 2b       	or	r18, r19
 7ac:	29 f4       	brne	.+10     	; 0x7b8 <.L4>
 7ae:	2f ef       	ldi	r18, 0xFF	; 255
 7b0:	3f ef       	ldi	r19, 0xFF	; 255
 7b2:	2d 93       	st	X+, r18
 7b4:	3c 93       	st	X, r19
 7b6:	09 94       	ijmp

000007b8 <.L4>:
 7b8:	08 95       	ret

000007ba <swift_slowAlloc>:
 7ba:	0c 94 11 04 	jmp	0x822	; 0x822 <malloc>

000007be <_byteFromProgmem>:
 7be:	fc 01       	movw	r30, r24
 7c0:	84 91       	lpm	r24, Z
 7c2:	08 95       	ret

000007c4 <_GLOBAL__sub_I__swift_stdlib_Hashing_parameters>:
 7c4:	e6 e0       	ldi	r30, 0x06	; 6
 7c6:	f1 e0       	ldi	r31, 0x01	; 1
 7c8:	10 82       	st	Z, r1
 7ca:	11 82       	std	Z+1, r1	; 0x01
 7cc:	12 82       	std	Z+2, r1	; 0x02
 7ce:	13 82       	std	Z+3, r1	; 0x03
 7d0:	14 82       	std	Z+4, r1	; 0x04
 7d2:	15 82       	std	Z+5, r1	; 0x05
 7d4:	16 82       	std	Z+6, r1	; 0x06
 7d6:	17 82       	std	Z+7, r1	; 0x07
 7d8:	10 86       	std	Z+8, r1	; 0x08
 7da:	11 86       	std	Z+9, r1	; 0x09
 7dc:	12 86       	std	Z+10, r1	; 0x0a
 7de:	13 86       	std	Z+11, r1	; 0x0b
 7e0:	14 86       	std	Z+12, r1	; 0x0c
 7e2:	15 86       	std	Z+13, r1	; 0x0d
 7e4:	16 86       	std	Z+14, r1	; 0x0e
 7e6:	17 86       	std	Z+15, r1	; 0x0f
 7e8:	81 e0       	ldi	r24, 0x01	; 1
 7ea:	80 8b       	std	Z+16, r24	; 0x10
 7ec:	08 95       	ret

000007ee <__udivmodhi4>:
 7ee:	aa 1b       	sub	r26, r26
 7f0:	bb 1b       	sub	r27, r27
 7f2:	51 e1       	ldi	r21, 0x11	; 17
 7f4:	07 c0       	rjmp	.+14     	; 0x804 <__udivmodhi4_ep>

000007f6 <__udivmodhi4_loop>:
 7f6:	aa 1f       	adc	r26, r26
 7f8:	bb 1f       	adc	r27, r27
 7fa:	a6 17       	cp	r26, r22
 7fc:	b7 07       	cpc	r27, r23
 7fe:	10 f0       	brcs	.+4      	; 0x804 <__udivmodhi4_ep>
 800:	a6 1b       	sub	r26, r22
 802:	b7 0b       	sbc	r27, r23

00000804 <__udivmodhi4_ep>:
 804:	88 1f       	adc	r24, r24
 806:	99 1f       	adc	r25, r25
 808:	5a 95       	dec	r21
 80a:	a9 f7       	brne	.-22     	; 0x7f6 <__udivmodhi4_loop>
 80c:	80 95       	com	r24
 80e:	90 95       	com	r25
 810:	bc 01       	movw	r22, r24
 812:	cd 01       	movw	r24, r26
 814:	08 95       	ret

00000816 <__tablejump2__>:
 816:	ee 0f       	add	r30, r30
 818:	ff 1f       	adc	r31, r31
 81a:	05 90       	lpm	r0, Z+
 81c:	f4 91       	lpm	r31, Z
 81e:	e0 2d       	mov	r30, r0
 820:	09 94       	ijmp

00000822 <malloc>:
 822:	0f 93       	push	r16
 824:	1f 93       	push	r17
 826:	cf 93       	push	r28
 828:	df 93       	push	r29
 82a:	82 30       	cpi	r24, 0x02	; 2
 82c:	91 05       	cpc	r25, r1
 82e:	10 f4       	brcc	.+4      	; 0x834 <malloc+0x12>
 830:	82 e0       	ldi	r24, 0x02	; 2
 832:	90 e0       	ldi	r25, 0x00	; 0
 834:	e0 91 23 01 	lds	r30, 0x0123	; 0x800123 <__flp>
 838:	f0 91 24 01 	lds	r31, 0x0124	; 0x800124 <__flp+0x1>
 83c:	30 e0       	ldi	r19, 0x00	; 0
 83e:	20 e0       	ldi	r18, 0x00	; 0
 840:	b0 e0       	ldi	r27, 0x00	; 0
 842:	a0 e0       	ldi	r26, 0x00	; 0
 844:	30 97       	sbiw	r30, 0x00	; 0
 846:	99 f4       	brne	.+38     	; 0x86e <malloc+0x4c>
 848:	21 15       	cp	r18, r1
 84a:	31 05       	cpc	r19, r1
 84c:	09 f4       	brne	.+2      	; 0x850 <malloc+0x2e>
 84e:	4a c0       	rjmp	.+148    	; 0x8e4 <malloc+0xc2>
 850:	28 1b       	sub	r18, r24
 852:	39 0b       	sbc	r19, r25
 854:	24 30       	cpi	r18, 0x04	; 4
 856:	31 05       	cpc	r19, r1
 858:	d8 f5       	brcc	.+118    	; 0x8d0 <malloc+0xae>
 85a:	8a 81       	ldd	r24, Y+2	; 0x02
 85c:	9b 81       	ldd	r25, Y+3	; 0x03
 85e:	61 15       	cp	r22, r1
 860:	71 05       	cpc	r23, r1
 862:	89 f1       	breq	.+98     	; 0x8c6 <malloc+0xa4>
 864:	fb 01       	movw	r30, r22
 866:	93 83       	std	Z+3, r25	; 0x03
 868:	82 83       	std	Z+2, r24	; 0x02
 86a:	fe 01       	movw	r30, r28
 86c:	11 c0       	rjmp	.+34     	; 0x890 <malloc+0x6e>
 86e:	40 81       	ld	r20, Z
 870:	51 81       	ldd	r21, Z+1	; 0x01
 872:	02 81       	ldd	r16, Z+2	; 0x02
 874:	13 81       	ldd	r17, Z+3	; 0x03
 876:	48 17       	cp	r20, r24
 878:	59 07       	cpc	r21, r25
 87a:	e0 f0       	brcs	.+56     	; 0x8b4 <malloc+0x92>
 87c:	48 17       	cp	r20, r24
 87e:	59 07       	cpc	r21, r25
 880:	99 f4       	brne	.+38     	; 0x8a8 <malloc+0x86>
 882:	10 97       	sbiw	r26, 0x00	; 0
 884:	61 f0       	breq	.+24     	; 0x89e <malloc+0x7c>
 886:	12 96       	adiw	r26, 0x02	; 2
 888:	0c 93       	st	X, r16
 88a:	12 97       	sbiw	r26, 0x02	; 2
 88c:	13 96       	adiw	r26, 0x03	; 3
 88e:	1c 93       	st	X, r17
 890:	32 96       	adiw	r30, 0x02	; 2
 892:	cf 01       	movw	r24, r30
 894:	df 91       	pop	r29
 896:	cf 91       	pop	r28
 898:	1f 91       	pop	r17
 89a:	0f 91       	pop	r16
 89c:	08 95       	ret
 89e:	00 93 23 01 	sts	0x0123, r16	; 0x800123 <__flp>
 8a2:	10 93 24 01 	sts	0x0124, r17	; 0x800124 <__flp+0x1>
 8a6:	f4 cf       	rjmp	.-24     	; 0x890 <malloc+0x6e>
 8a8:	21 15       	cp	r18, r1
 8aa:	31 05       	cpc	r19, r1
 8ac:	51 f0       	breq	.+20     	; 0x8c2 <malloc+0xa0>
 8ae:	42 17       	cp	r20, r18
 8b0:	53 07       	cpc	r21, r19
 8b2:	38 f0       	brcs	.+14     	; 0x8c2 <malloc+0xa0>
 8b4:	a9 01       	movw	r20, r18
 8b6:	db 01       	movw	r26, r22
 8b8:	9a 01       	movw	r18, r20
 8ba:	bd 01       	movw	r22, r26
 8bc:	df 01       	movw	r26, r30
 8be:	f8 01       	movw	r30, r16
 8c0:	c1 cf       	rjmp	.-126    	; 0x844 <malloc+0x22>
 8c2:	ef 01       	movw	r28, r30
 8c4:	f9 cf       	rjmp	.-14     	; 0x8b8 <malloc+0x96>
 8c6:	90 93 24 01 	sts	0x0124, r25	; 0x800124 <__flp+0x1>
 8ca:	80 93 23 01 	sts	0x0123, r24	; 0x800123 <__flp>
 8ce:	cd cf       	rjmp	.-102    	; 0x86a <malloc+0x48>
 8d0:	fe 01       	movw	r30, r28
 8d2:	e2 0f       	add	r30, r18
 8d4:	f3 1f       	adc	r31, r19
 8d6:	81 93       	st	Z+, r24
 8d8:	91 93       	st	Z+, r25
 8da:	22 50       	subi	r18, 0x02	; 2
 8dc:	31 09       	sbc	r19, r1
 8de:	39 83       	std	Y+1, r19	; 0x01
 8e0:	28 83       	st	Y, r18
 8e2:	d7 cf       	rjmp	.-82     	; 0x892 <malloc+0x70>
 8e4:	20 91 25 01 	lds	r18, 0x0125	; 0x800125 <__brkval>
 8e8:	30 91 26 01 	lds	r19, 0x0126	; 0x800126 <__brkval+0x1>
 8ec:	23 2b       	or	r18, r19
 8ee:	41 f4       	brne	.+16     	; 0x900 <__stack+0x1>
 8f0:	20 91 02 01 	lds	r18, 0x0102	; 0x800102 <__malloc_heap_start>
 8f4:	30 91 03 01 	lds	r19, 0x0103	; 0x800103 <__malloc_heap_start+0x1>
 8f8:	30 93 26 01 	sts	0x0126, r19	; 0x800126 <__brkval+0x1>
 8fc:	20 93 25 01 	sts	0x0125, r18	; 0x800125 <__brkval>
 900:	20 91 00 01 	lds	r18, 0x0100	; 0x800100 <__malloc_heap_end>
 904:	30 91 01 01 	lds	r19, 0x0101	; 0x800101 <__malloc_heap_end+0x1>
 908:	21 15       	cp	r18, r1
 90a:	31 05       	cpc	r19, r1
 90c:	41 f4       	brne	.+16     	; 0x91e <__stack+0x1f>
 90e:	2d b7       	in	r18, 0x3d	; 61
 910:	3e b7       	in	r19, 0x3e	; 62
 912:	40 91 04 01 	lds	r20, 0x0104	; 0x800104 <__malloc_margin>
 916:	50 91 05 01 	lds	r21, 0x0105	; 0x800105 <__malloc_margin+0x1>
 91a:	24 1b       	sub	r18, r20
 91c:	35 0b       	sbc	r19, r21
 91e:	e0 91 25 01 	lds	r30, 0x0125	; 0x800125 <__brkval>
 922:	f0 91 26 01 	lds	r31, 0x0126	; 0x800126 <__brkval+0x1>
 926:	e2 17       	cp	r30, r18
 928:	f3 07       	cpc	r31, r19
 92a:	a0 f4       	brcc	.+40     	; 0x954 <__stack+0x55>
 92c:	2e 1b       	sub	r18, r30
 92e:	3f 0b       	sbc	r19, r31
 930:	28 17       	cp	r18, r24
 932:	39 07       	cpc	r19, r25
 934:	78 f0       	brcs	.+30     	; 0x954 <__stack+0x55>
 936:	ac 01       	movw	r20, r24
 938:	4e 5f       	subi	r20, 0xFE	; 254
 93a:	5f 4f       	sbci	r21, 0xFF	; 255
 93c:	24 17       	cp	r18, r20
 93e:	35 07       	cpc	r19, r21
 940:	48 f0       	brcs	.+18     	; 0x954 <__stack+0x55>
 942:	4e 0f       	add	r20, r30
 944:	5f 1f       	adc	r21, r31
 946:	50 93 26 01 	sts	0x0126, r21	; 0x800126 <__brkval+0x1>
 94a:	40 93 25 01 	sts	0x0125, r20	; 0x800125 <__brkval>
 94e:	81 93       	st	Z+, r24
 950:	91 93       	st	Z+, r25
 952:	9f cf       	rjmp	.-194    	; 0x892 <malloc+0x70>
 954:	f0 e0       	ldi	r31, 0x00	; 0
 956:	e0 e0       	ldi	r30, 0x00	; 0
 958:	9c cf       	rjmp	.-200    	; 0x892 <malloc+0x70>

0000095a <free>:
 95a:	cf 93       	push	r28
 95c:	df 93       	push	r29
 95e:	00 97       	sbiw	r24, 0x00	; 0
 960:	e9 f0       	breq	.+58     	; 0x99c <free+0x42>
 962:	fc 01       	movw	r30, r24
 964:	32 97       	sbiw	r30, 0x02	; 2
 966:	13 82       	std	Z+3, r1	; 0x03
 968:	12 82       	std	Z+2, r1	; 0x02
 96a:	a0 91 23 01 	lds	r26, 0x0123	; 0x800123 <__flp>
 96e:	b0 91 24 01 	lds	r27, 0x0124	; 0x800124 <__flp+0x1>
 972:	ed 01       	movw	r28, r26
 974:	30 e0       	ldi	r19, 0x00	; 0
 976:	20 e0       	ldi	r18, 0x00	; 0
 978:	10 97       	sbiw	r26, 0x00	; 0
 97a:	a1 f4       	brne	.+40     	; 0x9a4 <free+0x4a>
 97c:	20 81       	ld	r18, Z
 97e:	31 81       	ldd	r19, Z+1	; 0x01
 980:	82 0f       	add	r24, r18
 982:	93 1f       	adc	r25, r19
 984:	20 91 25 01 	lds	r18, 0x0125	; 0x800125 <__brkval>
 988:	30 91 26 01 	lds	r19, 0x0126	; 0x800126 <__brkval+0x1>
 98c:	28 17       	cp	r18, r24
 98e:	39 07       	cpc	r19, r25
 990:	09 f0       	breq	.+2      	; 0x994 <free+0x3a>
 992:	61 c0       	rjmp	.+194    	; 0xa56 <free+0xfc>
 994:	f0 93 26 01 	sts	0x0126, r31	; 0x800126 <__brkval+0x1>
 998:	e0 93 25 01 	sts	0x0125, r30	; 0x800125 <__brkval>
 99c:	df 91       	pop	r29
 99e:	cf 91       	pop	r28
 9a0:	08 95       	ret
 9a2:	ea 01       	movw	r28, r20
 9a4:	ce 17       	cp	r28, r30
 9a6:	df 07       	cpc	r29, r31
 9a8:	e8 f5       	brcc	.+122    	; 0xa24 <free+0xca>
 9aa:	4a 81       	ldd	r20, Y+2	; 0x02
 9ac:	5b 81       	ldd	r21, Y+3	; 0x03
 9ae:	9e 01       	movw	r18, r28
 9b0:	41 15       	cp	r20, r1
 9b2:	51 05       	cpc	r21, r1
 9b4:	b1 f7       	brne	.-20     	; 0x9a2 <free+0x48>
 9b6:	e9 01       	movw	r28, r18
 9b8:	fb 83       	std	Y+3, r31	; 0x03
 9ba:	ea 83       	std	Y+2, r30	; 0x02
 9bc:	49 91       	ld	r20, Y+
 9be:	59 91       	ld	r21, Y+
 9c0:	c4 0f       	add	r28, r20
 9c2:	d5 1f       	adc	r29, r21
 9c4:	ec 17       	cp	r30, r28
 9c6:	fd 07       	cpc	r31, r29
 9c8:	61 f4       	brne	.+24     	; 0x9e2 <free+0x88>
 9ca:	80 81       	ld	r24, Z
 9cc:	91 81       	ldd	r25, Z+1	; 0x01
 9ce:	02 96       	adiw	r24, 0x02	; 2
 9d0:	84 0f       	add	r24, r20
 9d2:	95 1f       	adc	r25, r21
 9d4:	e9 01       	movw	r28, r18
 9d6:	99 83       	std	Y+1, r25	; 0x01
 9d8:	88 83       	st	Y, r24
 9da:	82 81       	ldd	r24, Z+2	; 0x02
 9dc:	93 81       	ldd	r25, Z+3	; 0x03
 9de:	9b 83       	std	Y+3, r25	; 0x03
 9e0:	8a 83       	std	Y+2, r24	; 0x02
 9e2:	f0 e0       	ldi	r31, 0x00	; 0
 9e4:	e0 e0       	ldi	r30, 0x00	; 0
 9e6:	12 96       	adiw	r26, 0x02	; 2
 9e8:	8d 91       	ld	r24, X+
 9ea:	9c 91       	ld	r25, X
 9ec:	13 97       	sbiw	r26, 0x03	; 3
 9ee:	00 97       	sbiw	r24, 0x00	; 0
 9f0:	b9 f5       	brne	.+110    	; 0xa60 <free+0x106>
 9f2:	2d 91       	ld	r18, X+
 9f4:	3c 91       	ld	r19, X
 9f6:	11 97       	sbiw	r26, 0x01	; 1
 9f8:	cd 01       	movw	r24, r26
 9fa:	02 96       	adiw	r24, 0x02	; 2
 9fc:	82 0f       	add	r24, r18
 9fe:	93 1f       	adc	r25, r19
 a00:	20 91 25 01 	lds	r18, 0x0125	; 0x800125 <__brkval>
 a04:	30 91 26 01 	lds	r19, 0x0126	; 0x800126 <__brkval+0x1>
 a08:	28 17       	cp	r18, r24
 a0a:	39 07       	cpc	r19, r25
 a0c:	39 f6       	brne	.-114    	; 0x99c <free+0x42>
 a0e:	30 97       	sbiw	r30, 0x00	; 0
 a10:	51 f5       	brne	.+84     	; 0xa66 <free+0x10c>
 a12:	10 92 24 01 	sts	0x0124, r1	; 0x800124 <__flp+0x1>
 a16:	10 92 23 01 	sts	0x0123, r1	; 0x800123 <__flp>
 a1a:	b0 93 26 01 	sts	0x0126, r27	; 0x800126 <__brkval+0x1>
 a1e:	a0 93 25 01 	sts	0x0125, r26	; 0x800125 <__brkval>
 a22:	bc cf       	rjmp	.-136    	; 0x99c <free+0x42>
 a24:	d3 83       	std	Z+3, r29	; 0x03
 a26:	c2 83       	std	Z+2, r28	; 0x02
 a28:	40 81       	ld	r20, Z
 a2a:	51 81       	ldd	r21, Z+1	; 0x01
 a2c:	84 0f       	add	r24, r20
 a2e:	95 1f       	adc	r25, r21
 a30:	c8 17       	cp	r28, r24
 a32:	d9 07       	cpc	r29, r25
 a34:	61 f4       	brne	.+24     	; 0xa4e <free+0xf4>
 a36:	4e 5f       	subi	r20, 0xFE	; 254
 a38:	5f 4f       	sbci	r21, 0xFF	; 255
 a3a:	88 81       	ld	r24, Y
 a3c:	99 81       	ldd	r25, Y+1	; 0x01
 a3e:	48 0f       	add	r20, r24
 a40:	59 1f       	adc	r21, r25
 a42:	51 83       	std	Z+1, r21	; 0x01
 a44:	40 83       	st	Z, r20
 a46:	8a 81       	ldd	r24, Y+2	; 0x02
 a48:	9b 81       	ldd	r25, Y+3	; 0x03
 a4a:	93 83       	std	Z+3, r25	; 0x03
 a4c:	82 83       	std	Z+2, r24	; 0x02
 a4e:	21 15       	cp	r18, r1
 a50:	31 05       	cpc	r19, r1
 a52:	09 f0       	breq	.+2      	; 0xa56 <free+0xfc>
 a54:	b0 cf       	rjmp	.-160    	; 0x9b6 <free+0x5c>
 a56:	f0 93 24 01 	sts	0x0124, r31	; 0x800124 <__flp+0x1>
 a5a:	e0 93 23 01 	sts	0x0123, r30	; 0x800123 <__flp>
 a5e:	9e cf       	rjmp	.-196    	; 0x99c <free+0x42>
 a60:	fd 01       	movw	r30, r26
 a62:	dc 01       	movw	r26, r24
 a64:	c0 cf       	rjmp	.-128    	; 0x9e6 <free+0x8c>
 a66:	13 82       	std	Z+3, r1	; 0x03
 a68:	12 82       	std	Z+2, r1	; 0x02
 a6a:	d7 cf       	rjmp	.-82     	; 0xa1a <free+0xc0>

00000a6c <_exit>:
 a6c:	f8 94       	cli

00000a6e <__stop_program>:
 a6e:	ff cf       	rjmp	.-2      	; 0xa6e <__stop_program>

Disassembly of section .data:

00800100 <__malloc_heap_end>:
  800100:	00 00                                               ..

00800102 <__malloc_heap_start>:
  800102:	27 01                                               '.

00800104 <__malloc_margin>:
  800104:	20 00                                                .
