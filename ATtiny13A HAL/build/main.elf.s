
build/main.elf:     file format elf32-avr
build/main.elf
architecture: avr, flags 0x00000112:
EXEC_P, HAS_SYMS, D_PAGED
start address 0x00000000

Program Header:
    LOAD off    0x00001000 vaddr 0x00000000 paddr 0x00000000 align 2**12
         filesz 0x0000021a memsz 0x0000021a flags r-x
    LOAD off    0x00002100 vaddr 0x00800100 paddr 0x00800100 align 2**12
         filesz 0x00000000 memsz 0x00000016 flags rw-
   STACK off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**0
         filesz 0x00000000 memsz 0x00000000 flags rw-

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         0000021a  00000000  00000000  00001000  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00800100  00800100  0000121a  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
SYMBOL TABLE:
000001e0 l     F .text	0000002a _GLOBAL__sub_I__swift_stdlib_Hashing_parameters
00000218 l       .text	00000000 __stop_program
00000216 l       .text	00000000 .hidden exit
00000216 l       .text	00000000 .hidden _exit
00000096 l       .text	00000000 .do_clear_bss_start
00000094 l       .text	00000000 .do_clear_bss_loop
0000008c l       .text	00000010 .hidden __do_clear_bss
00000076 l       .text	00000016 .hidden __do_copy_data
0000009c l       .text	00000016 .hidden __do_global_ctors
0000020a l       .text	0000000c .hidden __tablejump2__
00000000 g       .text	00000000 __vectors
0000006a  w      .text	00000000 __init
000000ba  w      .text	00000000 __vector_1
000000ba g       .text	00000000 __bad_interrupt
000000ba  w      .text	00000000 __vector_2
000000ba  w      .text	00000000 __vector_3
000000ba  w      .text	00000000 __vector_4
000000ba  w      .text	00000000 __vector_5
000000ba  w      .text	00000000 __vector_6
000000ba  w      .text	00000000 __vector_7
000000ba  w      .text	00000000 __vector_8
000000ba  w      .text	00000000 __vector_9
000000ba  w      .text	00000000 __vector_10
000000ba  w      .text	00000000 __vector_11
000000ba  w      .text	00000000 __vector_12
000000ba  w      .text	00000000 __vector_13
000000ba  w      .text	00000000 __vector_14
000000ba  w      .text	00000000 __vector_15
000000ba  w      .text	00000000 __vector_16
000000ba  w      .text	00000000 __vector_17
0000018c g     F .text	00000054 __vector_18
000000ba  w      .text	00000000 __vector_19
000000ba  w      .text	00000000 __vector_20
000000ba  w      .text	00000000 __vector_21
000000ba  w      .text	00000000 __vector_22
000000ba  w      .text	00000000 __vector_23
000000ba  w      .text	00000000 __vector_24
000000ba  w      .text	00000000 __vector_25
00000000  w      .text	00000000 __vector_default
000000be g     F .text	000000ce .protected main
00800100 g       .data	00000000 __data_end
00800100 g       .data	00000000 __data_start
00000068 g       .text	00000000 __ctors_start
0000006a g       .text	00000000 __ctors_end
00000068 g       .text	00000000 __trampolines_start
00000068 g       .text	00000000 __trampolines_end
0000006a g       .text	00000000 __dtors_start
0000006a g       .text	00000000 __dtors_end
0000021a g       .text	00000000 _etext
00800100 g       .data	00000000 _edata



Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 35 00 	jmp	0x6a	; 0x6a <__ctors_end>
   4:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
   8:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
   c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  10:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  14:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  18:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  1c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  20:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  24:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  28:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  2c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  30:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  34:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  38:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  3c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  40:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  44:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  48:	0c 94 c6 00 	jmp	0x18c	; 0x18c <__vector_18>
  4c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  50:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  54:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  58:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  5c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  60:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  64:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>

00000068 <__ctors_start>:
  68:	f0 00       	.word	0x00f0	; ????

0000006a <__ctors_end>:
  6a:	11 24       	eor	r1, r1
  6c:	1f be       	out	0x3f, r1	; 63
  6e:	cf ef       	ldi	r28, 0xFF	; 255
  70:	d8 e0       	ldi	r29, 0x08	; 8
  72:	de bf       	out	0x3e, r29	; 62
  74:	cd bf       	out	0x3d, r28	; 61

00000076 <__do_copy_data>:
  76:	11 e0       	ldi	r17, 0x01	; 1
  78:	a0 e0       	ldi	r26, 0x00	; 0
  7a:	b1 e0       	ldi	r27, 0x01	; 1
  7c:	ea e1       	ldi	r30, 0x1A	; 26
  7e:	f2 e0       	ldi	r31, 0x02	; 2
  80:	02 c0       	rjmp	.+4      	; 0x86 <__do_copy_data+0x10>
  82:	05 90       	lpm	r0, Z+
  84:	0d 92       	st	X+, r0
  86:	a0 30       	cpi	r26, 0x00	; 0
  88:	b1 07       	cpc	r27, r17
  8a:	d9 f7       	brne	.-10     	; 0x82 <__do_copy_data+0xc>

0000008c <__do_clear_bss>:
  8c:	21 e0       	ldi	r18, 0x01	; 1
  8e:	a0 e0       	ldi	r26, 0x00	; 0
  90:	b1 e0       	ldi	r27, 0x01	; 1
  92:	01 c0       	rjmp	.+2      	; 0x96 <.do_clear_bss_start>

00000094 <.do_clear_bss_loop>:
  94:	1d 92       	st	X+, r1

00000096 <.do_clear_bss_start>:
  96:	a6 31       	cpi	r26, 0x16	; 22
  98:	b2 07       	cpc	r27, r18
  9a:	e1 f7       	brne	.-8      	; 0x94 <.do_clear_bss_loop>

0000009c <__do_global_ctors>:
  9c:	10 e0       	ldi	r17, 0x00	; 0
  9e:	c5 e3       	ldi	r28, 0x35	; 53
  a0:	d0 e0       	ldi	r29, 0x00	; 0
  a2:	04 c0       	rjmp	.+8      	; 0xac <__do_global_ctors+0x10>
  a4:	21 97       	sbiw	r28, 0x01	; 1
  a6:	fe 01       	movw	r30, r28
  a8:	0e 94 05 01 	call	0x20a	; 0x20a <__tablejump2__>
  ac:	c4 33       	cpi	r28, 0x34	; 52
  ae:	d1 07       	cpc	r29, r17
  b0:	c9 f7       	brne	.-14     	; 0xa4 <__do_global_ctors+0x8>
  b2:	0e 94 5f 00 	call	0xbe	; 0xbe <main>
  b6:	0c 94 0b 01 	jmp	0x216	; 0x216 <_exit>

000000ba <__bad_interrupt>:
  ba:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000be <main>:
  be:	80 91 7c 00 	lds	r24, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
  c2:	8f 73       	andi	r24, 0x3F	; 63
  c4:	80 64       	ori	r24, 0x40	; 64
  c6:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
  ca:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
  ce:	87 68       	ori	r24, 0x87	; 135
  d0:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
  d4:	80 e0       	ldi	r24, 0x00	; 0
  d6:	90 e0       	ldi	r25, 0x00	; 0
  d8:	9c 01       	movw	r18, r24
  da:	ac 01       	movw	r20, r24
  dc:	bc 01       	movw	r22, r24
  de:	fc 01       	movw	r30, r24
  e0:	03 c0       	rjmp	.+6      	; 0xe8 <main+0x2a>
  e2:	a1 70       	andi	r26, 0x01	; 1
  e4:	a0 30       	cpi	r26, 0x00	; 0
  e6:	b9 f0       	breq	.+46     	; 0x116 <main+0x58>
  e8:	dc 01       	movw	r26, r24
  ea:	11 97       	sbiw	r26, 0x01	; 1
  ec:	f1 f7       	brne	.-4      	; 0xea <main+0x2c>
  ee:	2f 5f       	subi	r18, 0xFF	; 255
  f0:	3f 4f       	sbci	r19, 0xFF	; 255
  f2:	4f 4f       	sbci	r20, 0xFF	; 255
  f4:	5f 4f       	sbci	r21, 0xFF	; 255
  f6:	6f 4f       	sbci	r22, 0xFF	; 255
  f8:	7f 4f       	sbci	r23, 0xFF	; 255
  fa:	ef 4f       	sbci	r30, 0xFF	; 255
  fc:	ff 4f       	sbci	r31, 0xFF	; 255
  fe:	a1 e0       	ldi	r26, 0x01	; 1
 100:	20 34       	cpi	r18, 0x40	; 64
 102:	31 05       	cpc	r19, r1
 104:	48 07       	cpc	r20, r24
 106:	59 07       	cpc	r21, r25
 108:	68 07       	cpc	r22, r24
 10a:	79 07       	cpc	r23, r25
 10c:	e8 07       	cpc	r30, r24
 10e:	f9 07       	cpc	r31, r25
 110:	41 f7       	brne	.-48     	; 0xe2 <main+0x24>
 112:	a1 2d       	mov	r26, r1
 114:	e6 cf       	rjmp	.-52     	; 0xe2 <main+0x24>
 116:	90 93 13 01 	sts	0x0113, r25	; 0x800113 <$s4main5stuffSuvp+0x1>
 11a:	80 93 12 01 	sts	0x0112, r24	; 0x800112 <$s4main5stuffSuvp>
 11e:	20 91 7c 00 	lds	r18, 0x007C	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
 122:	20 7f       	andi	r18, 0xF0	; 240
 124:	25 60       	ori	r18, 0x05	; 5
 126:	20 93 7c 00 	sts	0x007C, r18	; 0x80007c <__TEXT_REGION_LENGTH__+0x7f807c>
 12a:	20 91 7a 00 	lds	r18, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
 12e:	20 64       	ori	r18, 0x40	; 64
 130:	20 93 7a 00 	sts	0x007A, r18	; 0x80007a <__TEXT_REGION_LENGTH__+0x7f807a>
 134:	20 91 79 00 	lds	r18, 0x0079	; 0x800079 <__TEXT_REGION_LENGTH__+0x7f8079>
 138:	32 2f       	mov	r19, r18
 13a:	22 27       	eor	r18, r18
 13c:	40 91 78 00 	lds	r20, 0x0078	; 0x800078 <__TEXT_REGION_LENGTH__+0x7f8078>
 140:	55 27       	eor	r21, r21
 142:	42 2b       	or	r20, r18
 144:	53 2b       	or	r21, r19
 146:	50 93 13 01 	sts	0x0113, r21	; 0x800113 <$s4main5stuffSuvp+0x1>
 14a:	40 93 12 01 	sts	0x0112, r20	; 0x800112 <$s4main5stuffSuvp>
 14e:	9c 01       	movw	r18, r24
 150:	ac 01       	movw	r20, r24
 152:	bc 01       	movw	r22, r24
 154:	fc 01       	movw	r30, r24
 156:	03 c0       	rjmp	.+6      	; 0x15e <main+0xa0>
 158:	a1 70       	andi	r26, 0x01	; 1
 15a:	a0 30       	cpi	r26, 0x00	; 0
 15c:	01 f7       	brne	.-64     	; 0x11e <main+0x60>
 15e:	dc 01       	movw	r26, r24
 160:	11 97       	sbiw	r26, 0x01	; 1
 162:	f1 f7       	brne	.-4      	; 0x160 <main+0xa2>
 164:	2f 5f       	subi	r18, 0xFF	; 255
 166:	3f 4f       	sbci	r19, 0xFF	; 255
 168:	4f 4f       	sbci	r20, 0xFF	; 255
 16a:	5f 4f       	sbci	r21, 0xFF	; 255
 16c:	6f 4f       	sbci	r22, 0xFF	; 255
 16e:	7f 4f       	sbci	r23, 0xFF	; 255
 170:	ef 4f       	sbci	r30, 0xFF	; 255
 172:	ff 4f       	sbci	r31, 0xFF	; 255
 174:	a1 e0       	ldi	r26, 0x01	; 1
 176:	20 34       	cpi	r18, 0x40	; 64
 178:	31 05       	cpc	r19, r1
 17a:	48 07       	cpc	r20, r24
 17c:	59 07       	cpc	r21, r25
 17e:	68 07       	cpc	r22, r24
 180:	79 07       	cpc	r23, r25
 182:	e8 07       	cpc	r30, r24
 184:	f9 07       	cpc	r31, r25
 186:	41 f3       	breq	.-48     	; 0x158 <main+0x9a>
 188:	a1 2d       	mov	r26, r1
 18a:	e6 cf       	rjmp	.-52     	; 0x158 <main+0x9a>

0000018c <__vector_18>:
 18c:	0f 92       	push	r0
 18e:	0f b6       	in	r0, 0x3f	; 63
 190:	0f 92       	push	r0
 192:	1f 92       	push	r1
 194:	11 24       	eor	r1, r1
 196:	2f 93       	push	r18
 198:	3f 93       	push	r19
 19a:	4f 93       	push	r20
 19c:	5f 93       	push	r21
 19e:	6f 93       	push	r22
 1a0:	7f 93       	push	r23
 1a2:	8f 93       	push	r24
 1a4:	9f 93       	push	r25
 1a6:	af 93       	push	r26
 1a8:	bf 93       	push	r27
 1aa:	ef 93       	push	r30
 1ac:	ff 93       	push	r31
 1ae:	e0 91 14 01 	lds	r30, 0x0114	; 0x800114 <USART_RX_vect_cb>
 1b2:	f0 91 15 01 	lds	r31, 0x0115	; 0x800115 <USART_RX_vect_cb+0x1>
 1b6:	e0 30       	cpi	r30, 0x00	; 0
 1b8:	f1 05       	cpc	r31, r1
 1ba:	09 f0       	breq	.+2      	; 0x1be <__vector_18+0x32>
 1bc:	09 95       	icall
 1be:	ff 91       	pop	r31
 1c0:	ef 91       	pop	r30
 1c2:	bf 91       	pop	r27
 1c4:	af 91       	pop	r26
 1c6:	9f 91       	pop	r25
 1c8:	8f 91       	pop	r24
 1ca:	7f 91       	pop	r23
 1cc:	6f 91       	pop	r22
 1ce:	5f 91       	pop	r21
 1d0:	4f 91       	pop	r20
 1d2:	3f 91       	pop	r19
 1d4:	2f 91       	pop	r18
 1d6:	1f 90       	pop	r1
 1d8:	0f 90       	pop	r0
 1da:	0f be       	out	0x3f, r0	; 63
 1dc:	0f 90       	pop	r0
 1de:	18 95       	reti

000001e0 <_GLOBAL__sub_I__swift_stdlib_Hashing_parameters>:
 1e0:	e0 e0       	ldi	r30, 0x00	; 0
 1e2:	f1 e0       	ldi	r31, 0x01	; 1
 1e4:	10 82       	st	Z, r1
 1e6:	11 82       	std	Z+1, r1	; 0x01
 1e8:	12 82       	std	Z+2, r1	; 0x02
 1ea:	13 82       	std	Z+3, r1	; 0x03
 1ec:	14 82       	std	Z+4, r1	; 0x04
 1ee:	15 82       	std	Z+5, r1	; 0x05
 1f0:	16 82       	std	Z+6, r1	; 0x06
 1f2:	17 82       	std	Z+7, r1	; 0x07
 1f4:	10 86       	std	Z+8, r1	; 0x08
 1f6:	11 86       	std	Z+9, r1	; 0x09
 1f8:	12 86       	std	Z+10, r1	; 0x0a
 1fa:	13 86       	std	Z+11, r1	; 0x0b
 1fc:	14 86       	std	Z+12, r1	; 0x0c
 1fe:	15 86       	std	Z+13, r1	; 0x0d
 200:	16 86       	std	Z+14, r1	; 0x0e
 202:	17 86       	std	Z+15, r1	; 0x0f
 204:	81 e0       	ldi	r24, 0x01	; 1
 206:	80 8b       	std	Z+16, r24	; 0x10
 208:	08 95       	ret

0000020a <__tablejump2__>:
 20a:	ee 0f       	add	r30, r30
 20c:	ff 1f       	adc	r31, r31
 20e:	05 90       	lpm	r0, Z+
 210:	f4 91       	lpm	r31, Z
 212:	e0 2d       	mov	r30, r0
 214:	09 94       	ijmp

00000216 <_exit>:
 216:	f8 94       	cli

00000218 <__stop_program>:
 218:	ff cf       	rjmp	.-2      	; 0x218 <__stop_program>
