
build/main.elf:     file format elf32-avr
build/main.elf
architecture: avr, flags 0x00000112:
EXEC_P, HAS_SYMS, D_PAGED
start address 0x00000000

Program Header:
    LOAD off    0x00001000 vaddr 0x00000000 paddr 0x00000000 align 2**12
         filesz 0x00000174 memsz 0x00000174 flags r-x
    LOAD off    0x00002100 vaddr 0x00800100 paddr 0x00800100 align 2**12
         filesz 0x00000000 memsz 0x00000013 flags rw-
   STACK off    0x00000000 vaddr 0x00000000 paddr 0x00000000 align 2**0
         filesz 0x00000000 memsz 0x00000000 flags rw-

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
  0 .text         00000174  00000000  00000000  00001000  2**1
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
  1 .data         00000000  00800100  00800100  00001174  2**0
                  CONTENTS, ALLOC, LOAD, READONLY, CODE
SYMBOL TABLE:
0000013a l     F .text	0000002a _GLOBAL__sub_I__swift_stdlib_Hashing_parameters
00000172 l       .text	00000000 __stop_program
00000170 l       .text	00000000 .hidden exit
00000170 l       .text	00000000 .hidden _exit
00000096 l       .text	00000000 .do_clear_bss_start
00000094 l       .text	00000000 .do_clear_bss_loop
0000008c l       .text	00000010 .hidden __do_clear_bss
00000076 l       .text	00000016 .hidden __do_copy_data
0000009c l       .text	00000016 .hidden __do_global_ctors
00000164 l       .text	0000000c .hidden __tablejump2__
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
000000e6 g     F .text	00000054 __vector_18
000000ba  w      .text	00000000 __vector_19
000000ba  w      .text	00000000 __vector_20
000000ba  w      .text	00000000 __vector_21
000000ba  w      .text	00000000 __vector_22
000000ba  w      .text	00000000 __vector_23
000000ba  w      .text	00000000 __vector_24
000000ba  w      .text	00000000 __vector_25
00000000  w      .text	00000000 __vector_default
000000be g     F .text	00000028 .protected main
00800100 g       .data	00000000 __data_end
00800100 g       .data	00000000 __data_start
00000068 g       .text	00000000 __ctors_start
0000006a g       .text	00000000 __ctors_end
00000068 g       .text	00000000 __trampolines_start
00000068 g       .text	00000000 __trampolines_end
0000006a g       .text	00000000 __dtors_start
0000006a g       .text	00000000 __dtors_end
00000174 g       .text	00000000 _etext
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
  48:	0c 94 73 00 	jmp	0xe6	; 0xe6 <__vector_18>
  4c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  50:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  54:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  58:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  5c:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  60:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>
  64:	0c 94 5d 00 	jmp	0xba	; 0xba <__bad_interrupt>

00000068 <__ctors_start>:
  68:	9d 00       	.word	0x009d	; ????

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
  7c:	e4 e7       	ldi	r30, 0x74	; 116
  7e:	f1 e0       	ldi	r31, 0x01	; 1
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
  96:	a3 31       	cpi	r26, 0x13	; 19
  98:	b2 07       	cpc	r27, r18
  9a:	e1 f7       	brne	.-8      	; 0x94 <.do_clear_bss_loop>

0000009c <__do_global_ctors>:
  9c:	10 e0       	ldi	r17, 0x00	; 0
  9e:	c5 e3       	ldi	r28, 0x35	; 53
  a0:	d0 e0       	ldi	r29, 0x00	; 0
  a2:	04 c0       	rjmp	.+8      	; 0xac <__do_global_ctors+0x10>
  a4:	21 97       	sbiw	r28, 0x01	; 1
  a6:	fe 01       	movw	r30, r28
  a8:	0e 94 b2 00 	call	0x164	; 0x164 <__tablejump2__>
  ac:	c4 33       	cpi	r28, 0x34	; 52
  ae:	d1 07       	cpc	r29, r17
  b0:	c9 f7       	brne	.-14     	; 0xa4 <__do_global_ctors+0x8>
  b2:	0e 94 5f 00 	call	0xbe	; 0xbe <main>
  b6:	0c 94 b8 00 	jmp	0x170	; 0x170 <_exit>

000000ba <__bad_interrupt>:
  ba:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000be <main>:
  be:	25 9a       	sbi	0x04, 5	; 4
  c0:	80 e0       	ldi	r24, 0x00	; 0
  c2:	90 e0       	ldi	r25, 0x00	; 0
  c4:	2d 9a       	sbi	0x05, 5	; 5
  c6:	20 e4       	ldi	r18, 0x40	; 64
  c8:	fc 01       	movw	r30, r24
  ca:	31 97       	sbiw	r30, 0x01	; 1
  cc:	f1 f7       	brne	.-4      	; 0xca <main+0xc>
  ce:	2a 95       	dec	r18
  d0:	20 30       	cpi	r18, 0x00	; 0
  d2:	d1 f7       	brne	.-12     	; 0xc8 <main+0xa>
  d4:	2d 98       	cbi	0x05, 5	; 5
  d6:	20 e4       	ldi	r18, 0x40	; 64
  d8:	fc 01       	movw	r30, r24
  da:	31 97       	sbiw	r30, 0x01	; 1
  dc:	f1 f7       	brne	.-4      	; 0xda <main+0x1c>
  de:	2a 95       	dec	r18
  e0:	20 30       	cpi	r18, 0x00	; 0
  e2:	d1 f7       	brne	.-12     	; 0xd8 <main+0x1a>
  e4:	ef cf       	rjmp	.-34     	; 0xc4 <main+0x6>

000000e6 <__vector_18>:
  e6:	0f 92       	push	r0
  e8:	0f b6       	in	r0, 0x3f	; 63
  ea:	0f 92       	push	r0
  ec:	1f 92       	push	r1
  ee:	11 24       	eor	r1, r1
  f0:	2f 93       	push	r18
  f2:	3f 93       	push	r19
  f4:	4f 93       	push	r20
  f6:	5f 93       	push	r21
  f8:	6f 93       	push	r22
  fa:	7f 93       	push	r23
  fc:	8f 93       	push	r24
  fe:	9f 93       	push	r25
 100:	af 93       	push	r26
 102:	bf 93       	push	r27
 104:	ef 93       	push	r30
 106:	ff 93       	push	r31
 108:	e0 91 11 01 	lds	r30, 0x0111	; 0x800111 <USART_RX_vect_cb>
 10c:	f0 91 12 01 	lds	r31, 0x0112	; 0x800112 <USART_RX_vect_cb+0x1>
 110:	e0 30       	cpi	r30, 0x00	; 0
 112:	f1 05       	cpc	r31, r1
 114:	09 f0       	breq	.+2      	; 0x118 <__vector_18+0x32>
 116:	09 95       	icall
 118:	ff 91       	pop	r31
 11a:	ef 91       	pop	r30
 11c:	bf 91       	pop	r27
 11e:	af 91       	pop	r26
 120:	9f 91       	pop	r25
 122:	8f 91       	pop	r24
 124:	7f 91       	pop	r23
 126:	6f 91       	pop	r22
 128:	5f 91       	pop	r21
 12a:	4f 91       	pop	r20
 12c:	3f 91       	pop	r19
 12e:	2f 91       	pop	r18
 130:	1f 90       	pop	r1
 132:	0f 90       	pop	r0
 134:	0f be       	out	0x3f, r0	; 63
 136:	0f 90       	pop	r0
 138:	18 95       	reti

0000013a <_GLOBAL__sub_I__swift_stdlib_Hashing_parameters>:
 13a:	e0 e0       	ldi	r30, 0x00	; 0
 13c:	f1 e0       	ldi	r31, 0x01	; 1
 13e:	10 82       	st	Z, r1
 140:	11 82       	std	Z+1, r1	; 0x01
 142:	12 82       	std	Z+2, r1	; 0x02
 144:	13 82       	std	Z+3, r1	; 0x03
 146:	14 82       	std	Z+4, r1	; 0x04
 148:	15 82       	std	Z+5, r1	; 0x05
 14a:	16 82       	std	Z+6, r1	; 0x06
 14c:	17 82       	std	Z+7, r1	; 0x07
 14e:	10 86       	std	Z+8, r1	; 0x08
 150:	11 86       	std	Z+9, r1	; 0x09
 152:	12 86       	std	Z+10, r1	; 0x0a
 154:	13 86       	std	Z+11, r1	; 0x0b
 156:	14 86       	std	Z+12, r1	; 0x0c
 158:	15 86       	std	Z+13, r1	; 0x0d
 15a:	16 86       	std	Z+14, r1	; 0x0e
 15c:	17 86       	std	Z+15, r1	; 0x0f
 15e:	81 e0       	ldi	r24, 0x01	; 1
 160:	80 8b       	std	Z+16, r24	; 0x10
 162:	08 95       	ret

00000164 <__tablejump2__>:
 164:	ee 0f       	add	r30, r30
 166:	ff 1f       	adc	r31, r31
 168:	05 90       	lpm	r0, Z+
 16a:	f4 91       	lpm	r31, Z
 16c:	e0 2d       	mov	r30, r0
 16e:	09 94       	ijmp

00000170 <_exit>:
 170:	f8 94       	cli

00000172 <__stop_program>:
 172:	ff cf       	rjmp	.-2      	; 0x172 <__stop_program>
