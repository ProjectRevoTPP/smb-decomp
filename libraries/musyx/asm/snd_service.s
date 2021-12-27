.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global sndRand
sndRand:
/* 800FF3C0 000FB2E0  3C 60 A8 35 */	lis r3, 0xA8351D63@ha
/* 800FF3C4 000FB2E4  80 8D 98 98 */	lwz r4, last_rnd@sda21(r13)
/* 800FF3C8 000FB2E8  38 03 1D 63 */	addi r0, r3, 0xA8351D63@l
/* 800FF3CC 000FB2EC  7C 04 01 D6 */	mullw r0, r4, r0
/* 800FF3D0 000FB2F0  90 0D 98 98 */	stw r0, last_rnd@sda21(r13)
/* 800FF3D4 000FB2F4  80 0D 98 98 */	lwz r0, last_rnd@sda21(r13)
/* 800FF3D8 000FB2F8  54 03 D4 3E */	rlwinm r3, r0, 0x1a, 0x10, 0x1f
/* 800FF3DC 000FB2FC  4E 80 00 20 */	blr

.global sndSin
sndSin:
/* 800FF3E0 000FB300  54 60 05 3E */	clrlwi r0, r3, 0x14
/* 800FF3E4 000FB304  28 00 04 00 */	cmplwi r0, 0x400
/* 800FF3E8 000FB308  3C 60 80 1F */	lis r3, lbl_801EA600@ha
/* 800FF3EC 000FB30C  38 63 A6 00 */	addi r3, r3, lbl_801EA600@l
/* 800FF3F0 000FB310  40 80 00 10 */	bge lbl_800FF400
/* 800FF3F4 000FB314  54 00 08 3C */	slwi r0, r0, 1
/* 800FF3F8 000FB318  7C 63 02 AE */	lhax r3, r3, r0
/* 800FF3FC 000FB31C  4E 80 00 20 */	blr
lbl_800FF400:
/* 800FF400 000FB320  28 00 08 00 */	cmplwi r0, 0x800
/* 800FF404 000FB324  40 80 00 18 */	bge lbl_800FF41C
/* 800FF408 000FB328  54 00 05 BE */	clrlwi r0, r0, 0x16
/* 800FF40C 000FB32C  20 00 03 FF */	subfic r0, r0, 0x3ff
/* 800FF410 000FB330  54 00 08 3C */	slwi r0, r0, 1
/* 800FF414 000FB334  7C 63 02 AE */	lhax r3, r3, r0
/* 800FF418 000FB338  4E 80 00 20 */	blr
lbl_800FF41C:
/* 800FF41C 000FB33C  28 00 0C 00 */	cmplwi r0, 0xc00
/* 800FF420 000FB340  40 80 00 14 */	bge lbl_800FF434
/* 800FF424 000FB344  54 00 0D 7C */	rlwinm r0, r0, 1, 0x15, 0x1e
/* 800FF428 000FB348  7C 03 02 AE */	lhax r0, r3, r0
/* 800FF42C 000FB34C  7C 60 00 D0 */	neg r3, r0
/* 800FF430 000FB350  4E 80 00 20 */	blr
lbl_800FF434:
/* 800FF434 000FB354  54 00 05 BE */	clrlwi r0, r0, 0x16
/* 800FF438 000FB358  20 00 03 FF */	subfic r0, r0, 0x3ff
/* 800FF43C 000FB35C  54 00 08 3C */	slwi r0, r0, 1
/* 800FF440 000FB360  7C 03 02 AE */	lhax r0, r3, r0
/* 800FF444 000FB364  7C 60 00 D0 */	neg r3, r0
/* 800FF448 000FB368  4E 80 00 20 */	blr

.global sndBSearch
sndBSearch:
/* 800FF44C 000FB36C  7C 08 02 A6 */	mflr r0
/* 800FF450 000FB370  2C 05 00 00 */	cmpwi r5, 0
/* 800FF454 000FB374  90 01 00 04 */	stw r0, 4(r1)
/* 800FF458 000FB378  94 21 FF B8 */	stwu r1, -0x48(r1)
/* 800FF45C 000FB37C  BE E1 00 24 */	stmw r23, 0x24(r1)
/* 800FF460 000FB380  3A E3 00 00 */	addi r23, r3, 0
/* 800FF464 000FB384  3B 04 00 00 */	addi r24, r4, 0
/* 800FF468 000FB388  3B 26 00 00 */	addi r25, r6, 0
/* 800FF46C 000FB38C  3B 47 00 00 */	addi r26, r7, 0
/* 800FF470 000FB390  41 82 00 5C */	beq lbl_800FF4CC
/* 800FF474 000FB394  3B C0 00 01 */	li r30, 1
/* 800FF478 000FB398  3B A5 00 00 */	addi r29, r5, 0
lbl_800FF47C:
/* 800FF47C 000FB39C  7C 1E EA 14 */	add r0, r30, r29
/* 800FF480 000FB3A0  7C 1C 0E 70 */	srawi r28, r0, 1
/* 800FF484 000FB3A4  3B FC FF FF */	addi r31, r28, -1
/* 800FF488 000FB3A8  7C 19 F9 D6 */	mullw r0, r25, r31
/* 800FF48C 000FB3AC  39 9A 00 00 */	addi r12, r26, 0
/* 800FF490 000FB3B0  7F 78 02 14 */	add r27, r24, r0
/* 800FF494 000FB3B4  7D 88 03 A6 */	mtlr r12
/* 800FF498 000FB3B8  38 77 00 00 */	addi r3, r23, 0
/* 800FF49C 000FB3BC  38 9B 00 00 */	addi r4, r27, 0
/* 800FF4A0 000FB3C0  4E 80 00 21 */	blrl
/* 800FF4A4 000FB3C4  2C 03 00 00 */	cmpwi r3, 0
/* 800FF4A8 000FB3C8  40 82 00 0C */	bne lbl_800FF4B4
/* 800FF4AC 000FB3CC  7F 63 DB 78 */	mr r3, r27
/* 800FF4B0 000FB3D0  48 00 00 20 */	b lbl_800FF4D0
lbl_800FF4B4:
/* 800FF4B4 000FB3D4  40 80 00 0C */	bge lbl_800FF4C0
/* 800FF4B8 000FB3D8  7F FD FB 78 */	mr r29, r31
/* 800FF4BC 000FB3DC  48 00 00 08 */	b lbl_800FF4C4
lbl_800FF4C0:
/* 800FF4C0 000FB3E0  3B DC 00 01 */	addi r30, r28, 1
lbl_800FF4C4:
/* 800FF4C4 000FB3E4  7C 1E E8 00 */	cmpw r30, r29
/* 800FF4C8 000FB3E8  40 81 FF B4 */	ble lbl_800FF47C
lbl_800FF4CC:
/* 800FF4CC 000FB3EC  38 60 00 00 */	li r3, 0
lbl_800FF4D0:
/* 800FF4D0 000FB3F0  BA E1 00 24 */	lmw r23, 0x24(r1)
/* 800FF4D4 000FB3F4  80 01 00 4C */	lwz r0, 0x4c(r1)
/* 800FF4D8 000FB3F8  38 21 00 48 */	addi r1, r1, 0x48
/* 800FF4DC 000FB3FC  7C 08 03 A6 */	mtlr r0
/* 800FF4E0 000FB400  4E 80 00 20 */	blr

.global sndConvertMs
sndConvertMs:
/* 800FF4E4 000FB404  80 03 00 00 */	lwz r0, 0(r3)
/* 800FF4E8 000FB408  54 00 40 2E */	slwi r0, r0, 8
/* 800FF4EC 000FB40C  90 03 00 00 */	stw r0, 0(r3)
/* 800FF4F0 000FB410  4E 80 00 20 */	blr

.global sndConvertTicks
sndConvertTicks:
/* 800FF4F4 000FB414  7C 08 02 A6 */	mflr r0
/* 800FF4F8 000FB418  90 01 00 04 */	stw r0, 4(r1)
/* 800FF4FC 000FB41C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800FF500 000FB420  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800FF504 000FB424  3B E3 00 00 */	addi r31, r3, 0
/* 800FF508 000FB428  38 64 00 00 */	addi r3, r4, 0
/* 800FF50C 000FB42C  4B FE C4 7D */	bl synthGetTicksPerSecond
/* 800FF510 000FB430  80 1F 00 00 */	lwz r0, 0(r31)
/* 800FF514 000FB434  54 00 80 1E */	slwi r0, r0, 0x10
/* 800FF518 000FB438  7C 00 1B 96 */	divwu r0, r0, r3
/* 800FF51C 000FB43C  1C 00 03 E8 */	mulli r0, r0, 0x3e8
/* 800FF520 000FB440  54 00 D9 7E */	srwi r0, r0, 5
/* 800FF524 000FB444  90 1F 00 00 */	stw r0, 0(r31)
/* 800FF528 000FB448  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800FF52C 000FB44C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800FF530 000FB450  38 21 00 18 */	addi r1, r1, 0x18
/* 800FF534 000FB454  7C 08 03 A6 */	mtlr r0
/* 800FF538 000FB458  4E 80 00 20 */	blr

.global sndConvert2Ms
sndConvert2Ms:
/* 800FF53C 000FB45C  54 63 C2 3E */	srwi r3, r3, 8
/* 800FF540 000FB460  4E 80 00 20 */	blr

.section .sdata

.global last_rnd
last_rnd:
	# ROM: 0x1EC1B8
	.byte 0x00, 0x00, 0x00, 0x01
	.4byte 0

.section .data

.global lbl_801EA600
lbl_801EA600:
	# ROM: 0x1E7600
	.byte 0x00, 0x00, 0x00, 0x06
	.byte 0x00, 0x0C, 0x00, 0x12
	.byte 0x00, 0x19, 0x00, 0x1F
	.byte 0x00, 0x25, 0x00, 0x2B
	.byte 0x00, 0x32, 0x00, 0x38
	.byte 0x00, 0x3E, 0x00, 0x45
	.byte 0x00, 0x4B, 0x00, 0x51
	.byte 0x00, 0x57, 0x00, 0x5E
	.byte 0x00, 0x64, 0x00, 0x6A
	.byte 0x00, 0x71, 0x00, 0x77
	.byte 0x00, 0x7D, 0x00, 0x83
	.byte 0x00, 0x8A, 0x00, 0x90
	.byte 0x00, 0x96, 0x00, 0x9D
	.byte 0x00, 0xA3, 0x00, 0xA9
	.byte 0x00, 0xAF, 0x00, 0xB6
	.byte 0x00, 0xBC, 0x00, 0xC2
	.byte 0x00, 0xC8, 0x00, 0xCF
	.byte 0x00, 0xD5, 0x00, 0xDB
	.byte 0x00, 0xE2, 0x00, 0xE8
	.byte 0x00, 0xEE, 0x00, 0xF4
	.byte 0x00, 0xFB, 0x01, 0x01
	.byte 0x01, 0x07, 0x01, 0x0D
	.byte 0x01, 0x14, 0x01, 0x1A
	.byte 0x01, 0x20, 0x01, 0x27
	.byte 0x01, 0x2D, 0x01, 0x33
	.byte 0x01, 0x39, 0x01, 0x40
	.byte 0x01, 0x46, 0x01, 0x4C
	.byte 0x01, 0x52, 0x01, 0x59
	.byte 0x01, 0x5F, 0x01, 0x65
	.byte 0x01, 0x6B, 0x01, 0x72
	.byte 0x01, 0x78, 0x01, 0x7E
	.byte 0x01, 0x84, 0x01, 0x8B
	.byte 0x01, 0x91, 0x01, 0x97
	.byte 0x01, 0x9D, 0x01, 0xA4
	.byte 0x01, 0xAA, 0x01, 0xB0
	.byte 0x01, 0xB6, 0x01, 0xBD
	.byte 0x01, 0xC3, 0x01, 0xC9
	.byte 0x01, 0xCF, 0x01, 0xD6
	.byte 0x01, 0xDC, 0x01, 0xE2
	.byte 0x01, 0xE8, 0x01, 0xEF
	.byte 0x01, 0xF5, 0x01, 0xFB
	.byte 0x02, 0x01, 0x02, 0x08
	.byte 0x02, 0x0E, 0x02, 0x14
	.byte 0x02, 0x1A, 0x02, 0x21
	.byte 0x02, 0x27, 0x02, 0x2D
	.byte 0x02, 0x33, 0x02, 0x39
	.byte 0x02, 0x40, 0x02, 0x46
	.byte 0x02, 0x4C, 0x02, 0x52
	.byte 0x02, 0x59, 0x02, 0x5F
	.byte 0x02, 0x65, 0x02, 0x6B
	.byte 0x02, 0x71, 0x02, 0x78
	.byte 0x02, 0x7E, 0x02, 0x84
	.byte 0x02, 0x8A, 0x02, 0x90
	.byte 0x02, 0x97, 0x02, 0x9D
	.byte 0x02, 0xA3, 0x02, 0xA9
	.byte 0x02, 0xAF, 0x02, 0xB6
	.byte 0x02, 0xBC, 0x02, 0xC2
	.byte 0x02, 0xC8, 0x02, 0xCE
	.byte 0x02, 0xD5, 0x02, 0xDB
	.byte 0x02, 0xE1, 0x02, 0xE7
	.byte 0x02, 0xED, 0x02, 0xF3
	.byte 0x02, 0xFA, 0x03, 0x00
	.byte 0x03, 0x06, 0x03, 0x0C
	.byte 0x03, 0x12, 0x03, 0x18
	.byte 0x03, 0x1F, 0x03, 0x25
	.byte 0x03, 0x2B, 0x03, 0x31
	.byte 0x03, 0x37, 0x03, 0x3D
	.byte 0x03, 0x44, 0x03, 0x4A
	.byte 0x03, 0x50, 0x03, 0x56
	.byte 0x03, 0x5C, 0x03, 0x62
	.byte 0x03, 0x68, 0x03, 0x6F
	.byte 0x03, 0x75, 0x03, 0x7B
	.byte 0x03, 0x81, 0x03, 0x87
	.byte 0x03, 0x8D, 0x03, 0x93
	.byte 0x03, 0x99, 0x03, 0xA0
	.byte 0x03, 0xA6, 0x03, 0xAC
	.byte 0x03, 0xB2, 0x03, 0xB8
	.byte 0x03, 0xBE, 0x03, 0xC4
	.byte 0x03, 0xCA, 0x03, 0xD0
	.byte 0x03, 0xD7, 0x03, 0xDD
	.byte 0x03, 0xE3, 0x03, 0xE9
	.byte 0x03, 0xEF, 0x03, 0xF5
	.byte 0x03, 0xFB, 0x04, 0x01
	.byte 0x04, 0x07, 0x04, 0x0D
	.byte 0x04, 0x13, 0x04, 0x1A
	.byte 0x04, 0x20, 0x04, 0x26
	.byte 0x04, 0x2C, 0x04, 0x32
	.byte 0x04, 0x38, 0x04, 0x3E
	.byte 0x04, 0x44, 0x04, 0x4A
	.byte 0x04, 0x50, 0x04, 0x56
	.byte 0x04, 0x5C, 0x04, 0x62
	.byte 0x04, 0x68, 0x04, 0x6E
	.byte 0x04, 0x74, 0x04, 0x7A
	.byte 0x04, 0x80, 0x04, 0x86
	.byte 0x04, 0x8C, 0x04, 0x92
	.byte 0x04, 0x98, 0x04, 0x9E
	.byte 0x04, 0xA5, 0x04, 0xAB
	.byte 0x04, 0xB1, 0x04, 0xB7
	.byte 0x04, 0xBD, 0x04, 0xC3
	.byte 0x04, 0xC9, 0x04, 0xCF
	.byte 0x04, 0xD5, 0x04, 0xDB
	.byte 0x04, 0xE0, 0x04, 0xE6
	.byte 0x04, 0xEC, 0x04, 0xF2
	.byte 0x04, 0xF8, 0x04, 0xFE
	.byte 0x05, 0x04, 0x05, 0x0A
	.byte 0x05, 0x10, 0x05, 0x16
	.byte 0x05, 0x1C, 0x05, 0x22
	.byte 0x05, 0x28, 0x05, 0x2E
	.byte 0x05, 0x34, 0x05, 0x3A
	.byte 0x05, 0x40, 0x05, 0x46
	.byte 0x05, 0x4C, 0x05, 0x52
	.byte 0x05, 0x58, 0x05, 0x5D
	.byte 0x05, 0x63, 0x05, 0x69
	.byte 0x05, 0x6F, 0x05, 0x75
	.byte 0x05, 0x7B, 0x05, 0x81
	.byte 0x05, 0x87, 0x05, 0x8D
	.byte 0x05, 0x93, 0x05, 0x99
	.byte 0x05, 0x9E, 0x05, 0xA4
	.byte 0x05, 0xAA, 0x05, 0xB0
	.byte 0x05, 0xB6, 0x05, 0xBC
	.byte 0x05, 0xC2, 0x05, 0xC7
	.byte 0x05, 0xCD, 0x05, 0xD3
	.byte 0x05, 0xD9, 0x05, 0xDF
	.byte 0x05, 0xE5, 0x05, 0xEB
	.byte 0x05, 0xF0, 0x05, 0xF6
	.byte 0x05, 0xFC, 0x06, 0x02
	.byte 0x06, 0x08, 0x06, 0x0E
	.byte 0x06, 0x13, 0x06, 0x19
	.byte 0x06, 0x1F, 0x06, 0x25
	.byte 0x06, 0x2B, 0x06, 0x30
	.byte 0x06, 0x36, 0x06, 0x3C
	.byte 0x06, 0x42, 0x06, 0x48
	.byte 0x06, 0x4D, 0x06, 0x53
	.byte 0x06, 0x59, 0x06, 0x5F
	.byte 0x06, 0x64, 0x06, 0x6A
	.byte 0x06, 0x70, 0x06, 0x76
	.byte 0x06, 0x7B, 0x06, 0x81
	.byte 0x06, 0x87, 0x06, 0x8D
	.byte 0x06, 0x92, 0x06, 0x98
	.byte 0x06, 0x9E, 0x06, 0xA3
	.byte 0x06, 0xA9, 0x06, 0xAF
	.byte 0x06, 0xB5, 0x06, 0xBA
	.byte 0x06, 0xC0, 0x06, 0xC6
	.byte 0x06, 0xCB, 0x06, 0xD1
	.byte 0x06, 0xD7, 0x06, 0xDC
	.byte 0x06, 0xE2, 0x06, 0xE8
	.byte 0x06, 0xED, 0x06, 0xF3
	.byte 0x06, 0xF9, 0x06, 0xFE
	.byte 0x07, 0x04, 0x07, 0x0A
	.byte 0x07, 0x0F, 0x07, 0x15
	.byte 0x07, 0x1B, 0x07, 0x20
	.byte 0x07, 0x26, 0x07, 0x2B
	.byte 0x07, 0x31, 0x07, 0x37
	.byte 0x07, 0x3C, 0x07, 0x42
	.byte 0x07, 0x48, 0x07, 0x4D
	.byte 0x07, 0x53, 0x07, 0x58
	.byte 0x07, 0x5E, 0x07, 0x63
	.byte 0x07, 0x69, 0x07, 0x6F
	.byte 0x07, 0x74, 0x07, 0x7A
	.byte 0x07, 0x7F, 0x07, 0x85
	.byte 0x07, 0x8A, 0x07, 0x90
	.byte 0x07, 0x95, 0x07, 0x9B
	.byte 0x07, 0xA0, 0x07, 0xA6
	.byte 0x07, 0xAC, 0x07, 0xB1
	.byte 0x07, 0xB7, 0x07, 0xBC
	.byte 0x07, 0xC2, 0x07, 0xC7
	.byte 0x07, 0xCD, 0x07, 0xD2
	.byte 0x07, 0xD7, 0x07, 0xDD
	.byte 0x07, 0xE2, 0x07, 0xE8
	.byte 0x07, 0xED, 0x07, 0xF3
	.byte 0x07, 0xF8, 0x07, 0xFE
	.byte 0x08, 0x03, 0x08, 0x09
	.byte 0x08, 0x0E, 0x08, 0x13
	.byte 0x08, 0x19, 0x08, 0x1E
	.byte 0x08, 0x24, 0x08, 0x29
	.byte 0x08, 0x2E, 0x08, 0x34
	.byte 0x08, 0x39, 0x08, 0x3F
	.byte 0x08, 0x44, 0x08, 0x49
	.byte 0x08, 0x4F, 0x08, 0x54
	.byte 0x08, 0x5A, 0x08, 0x5F
	.byte 0x08, 0x64, 0x08, 0x6A
	.byte 0x08, 0x6F, 0x08, 0x74
	.byte 0x08, 0x7A, 0x08, 0x7F
	.byte 0x08, 0x84, 0x08, 0x8A
	.byte 0x08, 0x8F, 0x08, 0x94
	.byte 0x08, 0x99, 0x08, 0x9F
	.byte 0x08, 0xA4, 0x08, 0xA9
	.byte 0x08, 0xAF, 0x08, 0xB4
	.byte 0x08, 0xB9, 0x08, 0xBE
	.byte 0x08, 0xC4, 0x08, 0xC9
	.byte 0x08, 0xCE, 0x08, 0xD3
	.byte 0x08, 0xD9, 0x08, 0xDE
	.byte 0x08, 0xE3, 0x08, 0xE8
	.byte 0x08, 0xEE, 0x08, 0xF3
	.byte 0x08, 0xF8, 0x08, 0xFD
	.byte 0x09, 0x02, 0x09, 0x08
	.byte 0x09, 0x0D, 0x09, 0x12
	.byte 0x09, 0x17, 0x09, 0x1C
	.byte 0x09, 0x21, 0x09, 0x27
	.byte 0x09, 0x2C, 0x09, 0x31
	.byte 0x09, 0x36, 0x09, 0x3B
	.byte 0x09, 0x40, 0x09, 0x45
	.byte 0x09, 0x4B, 0x09, 0x50
	.byte 0x09, 0x55, 0x09, 0x5A
	.byte 0x09, 0x5F, 0x09, 0x64
	.byte 0x09, 0x69, 0x09, 0x6E
	.byte 0x09, 0x73, 0x09, 0x78
	.byte 0x09, 0x7D, 0x09, 0x82
	.byte 0x09, 0x87, 0x09, 0x8D
	.byte 0x09, 0x92, 0x09, 0x97
	.byte 0x09, 0x9C, 0x09, 0xA1
	.byte 0x09, 0xA6, 0x09, 0xAB
	.byte 0x09, 0xB0, 0x09, 0xB5
	.byte 0x09, 0xBA, 0x09, 0xBF
	.byte 0x09, 0xC4, 0x09, 0xC9
	.byte 0x09, 0xCE, 0x09, 0xD3
	.byte 0x09, 0xD7, 0x09, 0xDC
	.byte 0x09, 0xE1, 0x09, 0xE6
	.byte 0x09, 0xEB, 0x09, 0xF0
	.byte 0x09, 0xF5, 0x09, 0xFA
	.byte 0x09, 0xFF, 0x0A, 0x04
	.byte 0x0A, 0x09, 0x0A, 0x0E
	.byte 0x0A, 0x12, 0x0A, 0x17
	.byte 0x0A, 0x1C, 0x0A, 0x21
	.byte 0x0A, 0x26, 0x0A, 0x2B
	.byte 0x0A, 0x30, 0x0A, 0x35
	.byte 0x0A, 0x39, 0x0A, 0x3E
	.byte 0x0A, 0x43, 0x0A, 0x48
	.byte 0x0A, 0x4D, 0x0A, 0x51
	.byte 0x0A, 0x56, 0x0A, 0x5B
	.byte 0x0A, 0x60, 0x0A, 0x65
	.byte 0x0A, 0x69, 0x0A, 0x6E
	.byte 0x0A, 0x73, 0x0A, 0x78
	.byte 0x0A, 0x7C, 0x0A, 0x81
	.byte 0x0A, 0x86, 0x0A, 0x8B
	.byte 0x0A, 0x8F, 0x0A, 0x94
	.byte 0x0A, 0x99, 0x0A, 0x9D
	.byte 0x0A, 0xA2, 0x0A, 0xA7
	.byte 0x0A, 0xAC, 0x0A, 0xB0
	.byte 0x0A, 0xB5, 0x0A, 0xBA
	.byte 0x0A, 0xBE, 0x0A, 0xC3
	.byte 0x0A, 0xC8, 0x0A, 0xCC
	.byte 0x0A, 0xD1, 0x0A, 0xD5
	.byte 0x0A, 0xDA, 0x0A, 0xDF
	.byte 0x0A, 0xE3, 0x0A, 0xE8
	.byte 0x0A, 0xEC, 0x0A, 0xF1
	.byte 0x0A, 0xF6, 0x0A, 0xFA
	.byte 0x0A, 0xFF, 0x0B, 0x03
	.byte 0x0B, 0x08, 0x0B, 0x0C
	.byte 0x0B, 0x11, 0x0B, 0x15
	.byte 0x0B, 0x1A, 0x0B, 0x1F
	.byte 0x0B, 0x23, 0x0B, 0x28
	.byte 0x0B, 0x2C, 0x0B, 0x31
	.byte 0x0B, 0x35, 0x0B, 0x3A
	.byte 0x0B, 0x3E, 0x0B, 0x42
	.byte 0x0B, 0x47, 0x0B, 0x4B
	.byte 0x0B, 0x50, 0x0B, 0x54
	.byte 0x0B, 0x59, 0x0B, 0x5D
	.byte 0x0B, 0x62, 0x0B, 0x66
	.byte 0x0B, 0x6A, 0x0B, 0x6F
	.byte 0x0B, 0x73, 0x0B, 0x78
	.byte 0x0B, 0x7C, 0x0B, 0x80
	.byte 0x0B, 0x85, 0x0B, 0x89
	.byte 0x0B, 0x8D, 0x0B, 0x92
	.byte 0x0B, 0x96, 0x0B, 0x9A
	.byte 0x0B, 0x9F, 0x0B, 0xA3
	.byte 0x0B, 0xA7, 0x0B, 0xAC
	.byte 0x0B, 0xB0, 0x0B, 0xB4
	.byte 0x0B, 0xB8, 0x0B, 0xBD
	.byte 0x0B, 0xC1, 0x0B, 0xC5
	.byte 0x0B, 0xCA, 0x0B, 0xCE
	.byte 0x0B, 0xD2, 0x0B, 0xD6
	.byte 0x0B, 0xDA, 0x0B, 0xDF
	.byte 0x0B, 0xE3, 0x0B, 0xE7
	.byte 0x0B, 0xEB, 0x0B, 0xEF
	.byte 0x0B, 0xF4, 0x0B, 0xF8
	.byte 0x0B, 0xFC, 0x0C, 0x00
	.byte 0x0C, 0x04, 0x0C, 0x08
	.byte 0x0C, 0x0D, 0x0C, 0x11
	.byte 0x0C, 0x15, 0x0C, 0x19
	.byte 0x0C, 0x1D, 0x0C, 0x21
	.byte 0x0C, 0x25, 0x0C, 0x29
	.byte 0x0C, 0x2D, 0x0C, 0x31
	.byte 0x0C, 0x36, 0x0C, 0x3A
	.byte 0x0C, 0x3E, 0x0C, 0x42
	.byte 0x0C, 0x46, 0x0C, 0x4A
	.byte 0x0C, 0x4E, 0x0C, 0x52
	.byte 0x0C, 0x56, 0x0C, 0x5A
	.byte 0x0C, 0x5E, 0x0C, 0x62
	.byte 0x0C, 0x66, 0x0C, 0x6A
	.byte 0x0C, 0x6E, 0x0C, 0x72
	.byte 0x0C, 0x76, 0x0C, 0x79
	.byte 0x0C, 0x7D, 0x0C, 0x81
	.byte 0x0C, 0x85, 0x0C, 0x89
	.byte 0x0C, 0x8D, 0x0C, 0x91
	.byte 0x0C, 0x95, 0x0C, 0x99
	.byte 0x0C, 0x9D, 0x0C, 0xA0
	.byte 0x0C, 0xA4, 0x0C, 0xA8
	.byte 0x0C, 0xAC, 0x0C, 0xB0
	.byte 0x0C, 0xB4, 0x0C, 0xB7
	.byte 0x0C, 0xBB, 0x0C, 0xBF
	.byte 0x0C, 0xC3, 0x0C, 0xC7
	.byte 0x0C, 0xCA, 0x0C, 0xCE
	.byte 0x0C, 0xD2, 0x0C, 0xD6
	.byte 0x0C, 0xD9, 0x0C, 0xDD
	.byte 0x0C, 0xE1, 0x0C, 0xE5
	.byte 0x0C, 0xE8, 0x0C, 0xEC
	.byte 0x0C, 0xF0, 0x0C, 0xF3
	.byte 0x0C, 0xF7, 0x0C, 0xFB
	.byte 0x0C, 0xFE, 0x0D, 0x02
	.byte 0x0D, 0x06, 0x0D, 0x09
	.byte 0x0D, 0x0D, 0x0D, 0x11
	.byte 0x0D, 0x14, 0x0D, 0x18
	.byte 0x0D, 0x1C, 0x0D, 0x1F
	.byte 0x0D, 0x23, 0x0D, 0x26
	.byte 0x0D, 0x2A, 0x0D, 0x2D
	.byte 0x0D, 0x31, 0x0D, 0x35
	.byte 0x0D, 0x38, 0x0D, 0x3C
	.byte 0x0D, 0x3F, 0x0D, 0x43
	.byte 0x0D, 0x46, 0x0D, 0x4A
	.byte 0x0D, 0x4D, 0x0D, 0x51
	.byte 0x0D, 0x54, 0x0D, 0x58
	.byte 0x0D, 0x5B, 0x0D, 0x5F
	.byte 0x0D, 0x62, 0x0D, 0x65
	.byte 0x0D, 0x69, 0x0D, 0x6C
	.byte 0x0D, 0x70, 0x0D, 0x73
	.byte 0x0D, 0x77, 0x0D, 0x7A
	.byte 0x0D, 0x7D, 0x0D, 0x81
	.byte 0x0D, 0x84, 0x0D, 0x87
	.byte 0x0D, 0x8B, 0x0D, 0x8E
	.byte 0x0D, 0x91, 0x0D, 0x95
	.byte 0x0D, 0x98, 0x0D, 0x9B
	.byte 0x0D, 0x9F, 0x0D, 0xA2
	.byte 0x0D, 0xA5, 0x0D, 0xA9
	.byte 0x0D, 0xAC, 0x0D, 0xAF
	.byte 0x0D, 0xB2, 0x0D, 0xB6
	.byte 0x0D, 0xB9, 0x0D, 0xBC
	.byte 0x0D, 0xBF, 0x0D, 0xC2
	.byte 0x0D, 0xC6, 0x0D, 0xC9
	.byte 0x0D, 0xCC, 0x0D, 0xCF
	.byte 0x0D, 0xD2, 0x0D, 0xD5
	.byte 0x0D, 0xD9, 0x0D, 0xDC
	.byte 0x0D, 0xDF, 0x0D, 0xE2
	.byte 0x0D, 0xE5, 0x0D, 0xE8
	.byte 0x0D, 0xEB, 0x0D, 0xEE
	.byte 0x0D, 0xF2, 0x0D, 0xF5
	.byte 0x0D, 0xF8, 0x0D, 0xFB
	.byte 0x0D, 0xFE, 0x0E, 0x01
	.byte 0x0E, 0x04, 0x0E, 0x07
	.byte 0x0E, 0x0A, 0x0E, 0x0D
	.byte 0x0E, 0x10, 0x0E, 0x13
	.byte 0x0E, 0x16, 0x0E, 0x19
	.byte 0x0E, 0x1C, 0x0E, 0x1F
	.byte 0x0E, 0x22, 0x0E, 0x25
	.byte 0x0E, 0x28, 0x0E, 0x2B
	.byte 0x0E, 0x2D, 0x0E, 0x30
	.byte 0x0E, 0x33, 0x0E, 0x36
	.byte 0x0E, 0x39, 0x0E, 0x3C
	.byte 0x0E, 0x3F, 0x0E, 0x42
	.byte 0x0E, 0x44, 0x0E, 0x47
	.byte 0x0E, 0x4A, 0x0E, 0x4D
	.byte 0x0E, 0x50, 0x0E, 0x53
	.byte 0x0E, 0x55, 0x0E, 0x58
	.byte 0x0E, 0x5B, 0x0E, 0x5E
	.byte 0x0E, 0x60, 0x0E, 0x63
	.byte 0x0E, 0x66, 0x0E, 0x69
	.byte 0x0E, 0x6B, 0x0E, 0x6E
	.byte 0x0E, 0x71, 0x0E, 0x74
	.byte 0x0E, 0x76, 0x0E, 0x79
	.byte 0x0E, 0x7C, 0x0E, 0x7E
	.byte 0x0E, 0x81, 0x0E, 0x84
	.byte 0x0E, 0x86, 0x0E, 0x89
	.byte 0x0E, 0x8B, 0x0E, 0x8E
	.byte 0x0E, 0x91, 0x0E, 0x93
	.byte 0x0E, 0x96, 0x0E, 0x98
	.byte 0x0E, 0x9B, 0x0E, 0x9E
	.byte 0x0E, 0xA0, 0x0E, 0xA3
	.byte 0x0E, 0xA5, 0x0E, 0xA8
	.byte 0x0E, 0xAA, 0x0E, 0xAD
	.byte 0x0E, 0xAF, 0x0E, 0xB2
	.byte 0x0E, 0xB4, 0x0E, 0xB7
	.byte 0x0E, 0xB9, 0x0E, 0xBC
	.byte 0x0E, 0xBE, 0x0E, 0xC0
	.byte 0x0E, 0xC3, 0x0E, 0xC5
	.byte 0x0E, 0xC8, 0x0E, 0xCA
	.byte 0x0E, 0xCD, 0x0E, 0xCF
	.byte 0x0E, 0xD1, 0x0E, 0xD4
	.byte 0x0E, 0xD6, 0x0E, 0xD8
	.byte 0x0E, 0xDB, 0x0E, 0xDD
	.byte 0x0E, 0xDF, 0x0E, 0xE2
	.byte 0x0E, 0xE4, 0x0E, 0xE6
	.byte 0x0E, 0xE8, 0x0E, 0xEB
	.byte 0x0E, 0xED, 0x0E, 0xEF
	.byte 0x0E, 0xF2, 0x0E, 0xF4
	.byte 0x0E, 0xF6, 0x0E, 0xF8
	.byte 0x0E, 0xFA, 0x0E, 0xFD
	.byte 0x0E, 0xFF, 0x0F, 0x01
	.byte 0x0F, 0x03, 0x0F, 0x05
	.byte 0x0F, 0x08, 0x0F, 0x0A
	.byte 0x0F, 0x0C, 0x0F, 0x0E
	.byte 0x0F, 0x10, 0x0F, 0x12
	.byte 0x0F, 0x14, 0x0F, 0x16
	.byte 0x0F, 0x18, 0x0F, 0x1B
	.byte 0x0F, 0x1D, 0x0F, 0x1F
	.byte 0x0F, 0x21, 0x0F, 0x23
	.byte 0x0F, 0x25, 0x0F, 0x27
	.byte 0x0F, 0x29, 0x0F, 0x2B
	.byte 0x0F, 0x2D, 0x0F, 0x2F
	.byte 0x0F, 0x31, 0x0F, 0x33
	.byte 0x0F, 0x35, 0x0F, 0x37
	.byte 0x0F, 0x39, 0x0F, 0x3B
	.byte 0x0F, 0x3C, 0x0F, 0x3E
	.byte 0x0F, 0x40, 0x0F, 0x42
	.byte 0x0F, 0x44, 0x0F, 0x46
	.byte 0x0F, 0x48, 0x0F, 0x4A
	.byte 0x0F, 0x4B, 0x0F, 0x4D
	.byte 0x0F, 0x4F, 0x0F, 0x51
	.byte 0x0F, 0x53, 0x0F, 0x55
	.byte 0x0F, 0x56, 0x0F, 0x58
	.byte 0x0F, 0x5A, 0x0F, 0x5C
	.byte 0x0F, 0x5D, 0x0F, 0x5F
	.byte 0x0F, 0x61, 0x0F, 0x63
	.byte 0x0F, 0x64, 0x0F, 0x66
	.byte 0x0F, 0x68, 0x0F, 0x69
	.byte 0x0F, 0x6B, 0x0F, 0x6D
	.byte 0x0F, 0x6E, 0x0F, 0x70
	.byte 0x0F, 0x72, 0x0F, 0x73
	.byte 0x0F, 0x75, 0x0F, 0x77
	.byte 0x0F, 0x78, 0x0F, 0x7A
	.byte 0x0F, 0x7B, 0x0F, 0x7D
	.byte 0x0F, 0x7F, 0x0F, 0x80
	.byte 0x0F, 0x82, 0x0F, 0x83
	.byte 0x0F, 0x85, 0x0F, 0x86
	.byte 0x0F, 0x88, 0x0F, 0x89
	.byte 0x0F, 0x8B, 0x0F, 0x8C
	.byte 0x0F, 0x8E, 0x0F, 0x8F
	.byte 0x0F, 0x91, 0x0F, 0x92
	.byte 0x0F, 0x94, 0x0F, 0x95
	.byte 0x0F, 0x96, 0x0F, 0x98
	.byte 0x0F, 0x99, 0x0F, 0x9B
	.byte 0x0F, 0x9C, 0x0F, 0x9D
	.byte 0x0F, 0x9F, 0x0F, 0xA0
	.byte 0x0F, 0xA1, 0x0F, 0xA3
	.byte 0x0F, 0xA4, 0x0F, 0xA5
	.byte 0x0F, 0xA7, 0x0F, 0xA8
	.byte 0x0F, 0xA9, 0x0F, 0xAB
	.byte 0x0F, 0xAC, 0x0F, 0xAD
	.byte 0x0F, 0xAE, 0x0F, 0xB0
	.byte 0x0F, 0xB1, 0x0F, 0xB2
	.byte 0x0F, 0xB3, 0x0F, 0xB4
	.byte 0x0F, 0xB6, 0x0F, 0xB7
	.byte 0x0F, 0xB8, 0x0F, 0xB9
	.byte 0x0F, 0xBA, 0x0F, 0xBB
	.byte 0x0F, 0xBD, 0x0F, 0xBE
	.byte 0x0F, 0xBF, 0x0F, 0xC0
	.byte 0x0F, 0xC1, 0x0F, 0xC2
	.byte 0x0F, 0xC3, 0x0F, 0xC4
	.byte 0x0F, 0xC5, 0x0F, 0xC6
	.byte 0x0F, 0xC7, 0x0F, 0xC8
	.byte 0x0F, 0xC9, 0x0F, 0xCA
	.byte 0x0F, 0xCB, 0x0F, 0xCC
	.byte 0x0F, 0xCD, 0x0F, 0xCE
	.byte 0x0F, 0xCF, 0x0F, 0xD0
	.byte 0x0F, 0xD1, 0x0F, 0xD2
	.byte 0x0F, 0xD3, 0x0F, 0xD4
	.byte 0x0F, 0xD5, 0x0F, 0xD6
	.byte 0x0F, 0xD7, 0x0F, 0xD8
	.byte 0x0F, 0xD9, 0x0F, 0xD9
	.byte 0x0F, 0xDA, 0x0F, 0xDB
	.byte 0x0F, 0xDC, 0x0F, 0xDD
	.byte 0x0F, 0xDE, 0x0F, 0xDE
	.byte 0x0F, 0xDF, 0x0F, 0xE0
	.byte 0x0F, 0xE1, 0x0F, 0xE1
	.byte 0x0F, 0xE2, 0x0F, 0xE3
	.byte 0x0F, 0xE4, 0x0F, 0xE4
	.byte 0x0F, 0xE5, 0x0F, 0xE6
	.byte 0x0F, 0xE7, 0x0F, 0xE7
	.byte 0x0F, 0xE8, 0x0F, 0xE9
	.byte 0x0F, 0xE9, 0x0F, 0xEA
	.byte 0x0F, 0xEB, 0x0F, 0xEB
	.byte 0x0F, 0xEC, 0x0F, 0xEC
	.byte 0x0F, 0xED, 0x0F, 0xEE
	.byte 0x0F, 0xEE, 0x0F, 0xEF
	.byte 0x0F, 0xEF, 0x0F, 0xF0
	.byte 0x0F, 0xF0, 0x0F, 0xF1
	.byte 0x0F, 0xF1, 0x0F, 0xF2
	.byte 0x0F, 0xF2, 0x0F, 0xF3
	.byte 0x0F, 0xF3, 0x0F, 0xF4
	.byte 0x0F, 0xF4, 0x0F, 0xF5
	.byte 0x0F, 0xF5, 0x0F, 0xF6
	.byte 0x0F, 0xF6, 0x0F, 0xF7
	.byte 0x0F, 0xF7, 0x0F, 0xF7
	.byte 0x0F, 0xF8, 0x0F, 0xF8
	.byte 0x0F, 0xF9, 0x0F, 0xF9
	.byte 0x0F, 0xF9, 0x0F, 0xFA
	.byte 0x0F, 0xFA, 0x0F, 0xFA
	.byte 0x0F, 0xFB, 0x0F, 0xFB
	.byte 0x0F, 0xFB, 0x0F, 0xFB
	.byte 0x0F, 0xFC, 0x0F, 0xFC
	.byte 0x0F, 0xFC, 0x0F, 0xFC
	.byte 0x0F, 0xFD, 0x0F, 0xFD
	.byte 0x0F, 0xFD, 0x0F, 0xFD
	.byte 0x0F, 0xFE, 0x0F, 0xFE
	.byte 0x0F, 0xFE, 0x0F, 0xFE
	.byte 0x0F, 0xFE, 0x0F, 0xFE
	.byte 0x0F, 0xFF, 0x0F, 0xFF
	.byte 0x0F, 0xFF, 0x0F, 0xFF
	.byte 0x0F, 0xFF, 0x0F, 0xFF
	.byte 0x0F, 0xFF, 0x0F, 0xFF
	.byte 0x0F, 0xFF, 0x0F, 0xFF
	.byte 0x0F, 0xFF, 0x0F, 0xFF
	.byte 0x0F, 0xFF, 0x0F, 0xFF
