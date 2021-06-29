.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global frexp
frexp:
/* 801086D4 001045F4  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 801086D8 001045F8  3C 00 7F F0 */	lis r0, 0x7ff0
/* 801086DC 001045FC  38 80 00 00 */	li r4, 0
/* 801086E0 00104600  D8 21 00 08 */	stfd f1, 8(r1)
/* 801086E4 00104604  80 A1 00 08 */	lwz r5, 8(r1)
/* 801086E8 00104608  81 01 00 0C */	lwz r8, 0xc(r1)
/* 801086EC 0010460C  54 A6 00 7E */	clrlwi r6, r5, 1
/* 801086F0 00104610  7C 06 00 00 */	cmpw r6, r0
/* 801086F4 00104614  90 83 00 00 */	stw r4, 0(r3)
/* 801086F8 00104618  38 E5 00 00 */	addi r7, r5, 0
/* 801086FC 0010461C  38 86 00 00 */	addi r4, r6, 0
/* 80108700 00104620  40 80 00 0C */	bge lbl_8010870C
/* 80108704 00104624  7C 80 43 79 */	or. r0, r4, r8
/* 80108708 00104628  40 82 00 0C */	bne lbl_80108714
lbl_8010870C:
/* 8010870C 0010462C  C8 21 00 08 */	lfd f1, 8(r1)
/* 80108710 00104630  48 00 00 58 */	b lbl_80108768
lbl_80108714:
/* 80108714 00104634  3C 00 00 10 */	lis r0, 0x10
/* 80108718 00104638  7C 04 00 00 */	cmpw r4, r0
/* 8010871C 0010463C  40 80 00 28 */	bge lbl_80108744
/* 80108720 00104640  C8 21 00 08 */	lfd f1, 8(r1)
/* 80108724 00104644  38 00 FF CA */	li r0, -54
/* 80108728 00104648  C8 02 C3 E0 */	lfd f0, lbl_802F6BE0-_SDA2_BASE_(r2)
/* 8010872C 0010464C  FC 01 00 32 */	fmul f0, f1, f0
/* 80108730 00104650  D8 01 00 08 */	stfd f0, 8(r1)
/* 80108734 00104654  80 81 00 08 */	lwz r4, 8(r1)
/* 80108738 00104658  90 03 00 00 */	stw r0, 0(r3)
/* 8010873C 0010465C  38 E4 00 00 */	addi r7, r4, 0
/* 80108740 00104660  54 84 00 7E */	clrlwi r4, r4, 1
lbl_80108744:
/* 80108744 00104664  80 A3 00 00 */	lwz r5, 0(r3)
/* 80108748 00104668  7C 84 A6 70 */	srawi r4, r4, 0x14
/* 8010874C 0010466C  54 E0 03 00 */	rlwinm r0, r7, 0, 0xc, 0
/* 80108750 00104670  7C 84 2A 14 */	add r4, r4, r5
/* 80108754 00104674  38 84 FC 02 */	addi r4, r4, -1022
/* 80108758 00104678  90 83 00 00 */	stw r4, 0(r3)
/* 8010875C 0010467C  64 00 3F E0 */	oris r0, r0, 0x3fe0
/* 80108760 00104680  90 01 00 08 */	stw r0, 8(r1)
/* 80108764 00104684  C8 21 00 08 */	lfd f1, 8(r1)
lbl_80108768:
/* 80108768 00104688  38 21 00 18 */	addi r1, r1, 0x18
/* 8010876C 0010468C  4E 80 00 20 */	blr 
