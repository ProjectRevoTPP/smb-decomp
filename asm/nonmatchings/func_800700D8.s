/* 800700D8 0006BFF8  7C 08 02 A6 */	mflr r0
/* 800700DC 0006BFFC  3C 80 80 29 */	lis r4, lbl_8028CF28@ha
/* 800700E0 0006C000  90 01 00 04 */	stw r0, 4(r1)
/* 800700E4 0006C004  38 00 00 00 */	li r0, 0
/* 800700E8 0006C008  3C A0 80 17 */	lis r5, eventInfo@ha
/* 800700EC 0006C00C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800700F0 0006C010  1C 00 00 0C */	mulli r0, r0, 0xc
/* 800700F4 0006C014  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800700F8 0006C018  38 84 CF 28 */	addi r4, r4, lbl_8028CF28@l
/* 800700FC 0006C01C  38 C5 3C C8 */	addi r6, r5, eventInfo@l
/* 80070100 0006C020  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80070104 0006C024  7C A4 02 14 */	add r5, r4, r0
/* 80070108 0006C028  38 00 00 01 */	li r0, 1
/* 8007010C 0006C02C  88 C6 01 20 */	lbz r6, 0x120(r6)
/* 80070110 0006C030  1C 00 00 0C */	mulli r0, r0, 0xc
/* 80070114 0006C034  7D 24 02 14 */	add r9, r4, r0
/* 80070118 0006C038  38 00 00 00 */	li r0, 0
/* 8007011C 0006C03C  90 05 2F 30 */	stw r0, 0x2f30(r5)
/* 80070120 0006C040  39 29 2F 30 */	addi r9, r9, 0x2f30
/* 80070124 0006C044  7C C7 07 74 */	extsb r7, r6
/* 80070128 0006C048  90 05 2F 34 */	stw r0, 0x2f34(r5)
/* 8007012C 0006C04C  20 E7 00 02 */	subfic r7, r7, 2
/* 80070130 0006C050  7C E8 00 34 */	cntlzw r8, r7
/* 80070134 0006C054  91 25 2F 38 */	stw r9, 0x2f38(r5)
/* 80070138 0006C058  38 A5 2F 30 */	addi r5, r5, 0x2f30
/* 8007013C 0006C05C  3C C0 80 20 */	lis r6, spritePoolInfo@ha
/* 80070140 0006C060  90 09 00 00 */	stw r0, 0(r9)
/* 80070144 0006C064  55 1F D9 7E */	srwi r31, r8, 5
/* 80070148 0006C068  38 E6 59 88 */	addi r7, r6, spritePoolInfo@l
/* 8007014C 0006C06C  90 A9 00 04 */	stw r5, 4(r9)
/* 80070150 0006C070  39 04 00 30 */	addi r8, r4, 0x30
/* 80070154 0006C074  39 80 00 02 */	li r12, 2
/* 80070158 0006C078  90 09 00 08 */	stw r0, 8(r9)
/* 8007015C 0006C07C  3B C0 00 00 */	li r30, 0
/* 80070160 0006C080  81 67 00 3C */	lwz r11, 0x3c(r7)
/* 80070164 0006C084  48 00 00 B8 */	b lbl_8007021C
lbl_80070168:
/* 80070168 0006C088  88 0B 00 00 */	lbz r0, 0(r11)
/* 8007016C 0006C08C  7C 00 07 75 */	extsb. r0, r0
/* 80070170 0006C090  41 82 00 A0 */	beq lbl_80070210
/* 80070174 0006C094  2C 1F 00 00 */	cmpwi r31, 0
/* 80070178 0006C098  41 82 00 10 */	beq lbl_80070188
/* 8007017C 0006C09C  88 08 00 0F */	lbz r0, 0xf(r8)
/* 80070180 0006C0A0  2C 00 00 64 */	cmpwi r0, 0x64
/* 80070184 0006C0A4  40 82 00 8C */	bne lbl_80070210
lbl_80070188:
/* 80070188 0006C0A8  2C 03 00 00 */	cmpwi r3, 0
/* 8007018C 0006C0AC  40 82 00 14 */	bne lbl_800701A0
/* 80070190 0006C0B0  80 08 00 74 */	lwz r0, 0x74(r8)
/* 80070194 0006C0B4  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 80070198 0006C0B8  41 82 00 78 */	beq lbl_80070210
/* 8007019C 0006C0BC  48 00 00 10 */	b lbl_800701AC
lbl_800701A0:
/* 800701A0 0006C0C0  80 08 00 74 */	lwz r0, 0x74(r8)
/* 800701A4 0006C0C4  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 800701A8 0006C0C8  40 82 00 68 */	bne lbl_80070210
lbl_800701AC:
/* 800701AC 0006C0CC  80 08 00 50 */	lwz r0, 0x50(r8)
/* 800701B0 0006C0D0  28 00 00 00 */	cmplwi r0, 0
/* 800701B4 0006C0D4  40 82 00 5C */	bne lbl_80070210
/* 800701B8 0006C0D8  81 45 00 08 */	lwz r10, 8(r5)
/* 800701BC 0006C0DC  48 00 00 18 */	b lbl_800701D4
lbl_800701C0:
/* 800701C0 0006C0E0  C0 28 00 4C */	lfs f1, 0x4c(r8)
/* 800701C4 0006C0E4  C0 06 00 4C */	lfs f0, 0x4c(r6)
/* 800701C8 0006C0E8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800701CC 0006C0EC  41 81 00 14 */	bgt lbl_800701E0
/* 800701D0 0006C0F0  81 4A 00 08 */	lwz r10, 8(r10)
lbl_800701D4:
/* 800701D4 0006C0F4  80 CA 00 00 */	lwz r6, 0(r10)
/* 800701D8 0006C0F8  28 06 00 00 */	cmplwi r6, 0
/* 800701DC 0006C0FC  40 82 FF E4 */	bne lbl_800701C0
lbl_800701E0:
/* 800701E0 0006C100  38 0C 00 00 */	addi r0, r12, 0
/* 800701E4 0006C104  1C 00 00 0C */	mulli r0, r0, 0xc
/* 800701E8 0006C108  7D 24 02 14 */	add r9, r4, r0
/* 800701EC 0006C10C  91 09 2F 30 */	stw r8, 0x2f30(r9)
/* 800701F0 0006C110  39 8C 00 01 */	addi r12, r12, 1
/* 800701F4 0006C114  80 0A 00 04 */	lwz r0, 4(r10)
/* 800701F8 0006C118  90 09 2F 34 */	stw r0, 0x2f34(r9)
/* 800701FC 0006C11C  91 49 2F 38 */	stw r10, 0x2f38(r9)
/* 80070200 0006C120  39 29 2F 30 */	addi r9, r9, 0x2f30
/* 80070204 0006C124  80 CA 00 04 */	lwz r6, 4(r10)
/* 80070208 0006C128  91 26 00 08 */	stw r9, 8(r6)
/* 8007020C 0006C12C  91 2A 00 04 */	stw r9, 4(r10)
lbl_80070210:
/* 80070210 0006C130  39 08 00 BC */	addi r8, r8, 0xbc
/* 80070214 0006C134  3B DE 00 01 */	addi r30, r30, 1
/* 80070218 0006C138  39 6B 00 01 */	addi r11, r11, 1
lbl_8007021C:
/* 8007021C 0006C13C  80 07 00 38 */	lwz r0, 0x38(r7)
/* 80070220 0006C140  7C 1E 00 00 */	cmpw r30, r0
/* 80070224 0006C144  41 80 FF 44 */	blt lbl_80070168
/* 80070228 0006C148  83 C5 00 08 */	lwz r30, 8(r5)
/* 8007022C 0006C14C  48 00 00 28 */	b lbl_80070254
lbl_80070230:
/* 80070230 0006C150  7F E3 FB 78 */	mr r3, r31
/* 80070234 0006C154  48 00 01 09 */	bl g_something_with_sprites
/* 80070238 0006C158  48 00 00 0C */	b lbl_80070244
lbl_8007023C:
/* 8007023C 0006C15C  48 00 01 01 */	bl g_something_with_sprites
/* 80070240 0006C160  83 FF 00 54 */	lwz r31, 0x54(r31)
lbl_80070244:
/* 80070244 0006C164  80 7F 00 54 */	lwz r3, 0x54(r31)
/* 80070248 0006C168  28 03 00 00 */	cmplwi r3, 0
/* 8007024C 0006C16C  40 82 FF F0 */	bne lbl_8007023C
/* 80070250 0006C170  83 DE 00 08 */	lwz r30, 8(r30)
lbl_80070254:
/* 80070254 0006C174  83 FE 00 00 */	lwz r31, 0(r30)
/* 80070258 0006C178  28 1F 00 00 */	cmplwi r31, 0
/* 8007025C 0006C17C  40 82 FF D4 */	bne lbl_80070230
/* 80070260 0006C180  A8 0D 99 B2 */	lha r0, gameMode  //-_SDA_BASE_(r13)
/* 80070264 0006C184  2C 00 00 04 */	cmpwi r0, 4
/* 80070268 0006C188  40 82 00 44 */	bne lbl_800702AC
/* 8007026C 0006C18C  A8 0D 99 AE */	lha r0, gameSubmode  //-_SDA_BASE_(r13)
/* 80070270 0006C190  2C 00 00 9E */	cmpwi r0, 0x9e
/* 80070274 0006C194  40 80 00 24 */	bge lbl_80070298
/* 80070278 0006C198  2C 00 00 94 */	cmpwi r0, 0x94
/* 8007027C 0006C19C  40 80 00 10 */	bge lbl_8007028C
/* 80070280 0006C1A0  2C 00 00 90 */	cmpwi r0, 0x90
/* 80070284 0006C1A4  40 80 00 28 */	bge lbl_800702AC
/* 80070288 0006C1A8  48 00 00 20 */	b lbl_800702A8
lbl_8007028C:
/* 8007028C 0006C1AC  2C 00 00 9C */	cmpwi r0, 0x9c
/* 80070290 0006C1B0  40 80 00 1C */	bge lbl_800702AC
/* 80070294 0006C1B4  48 00 00 14 */	b lbl_800702A8
lbl_80070298:
/* 80070298 0006C1B8  2C 00 00 A4 */	cmpwi r0, 0xa4
/* 8007029C 0006C1BC  40 80 00 0C */	bge lbl_800702A8
/* 800702A0 0006C1C0  2C 00 00 A2 */	cmpwi r0, 0xa2
/* 800702A4 0006C1C4  40 80 00 08 */	bge lbl_800702AC
lbl_800702A8:
/* 800702A8 0006C1C8  48 02 38 DD */	bl func_80093B84
lbl_800702AC:
/* 800702AC 0006C1CC  48 00 41 F1 */	bl func_8007449C
/* 800702B0 0006C1D0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800702B4 0006C1D4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800702B8 0006C1D8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800702BC 0006C1DC  7C 08 03 A6 */	mtlr r0
/* 800702C0 0006C1E0  38 21 00 18 */	addi r1, r1, 0x18
/* 800702C4 0006C1E4  4E 80 00 20 */	blr
