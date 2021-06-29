.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global GXBeginDisplayList
GXBeginDisplayList:
/* 800E419C 000E00BC  7C 08 02 A6 */	mflr r0
/* 800E41A0 000E00C0  3C A0 80 2D */	lis r5, lbl_802C8690@ha
/* 800E41A4 000E00C4  90 01 00 04 */	stw r0, 4(r1)
/* 800E41A8 000E00C8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800E41AC 000E00CC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800E41B0 000E00D0  3B E5 86 90 */	addi r31, r5, lbl_802C8690@l
/* 800E41B4 000E00D4  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800E41B8 000E00D8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800E41BC 000E00DC  3B A4 00 00 */	addi r29, r4, 0
/* 800E41C0 000E00E0  93 81 00 10 */	stw r28, 0x10(r1)
/* 800E41C4 000E00E4  3B 83 00 00 */	addi r28, r3, 0
/* 800E41C8 000E00E8  4B FF 95 B9 */	bl GXGetCPUFifo
/* 800E41CC 000E00EC  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E41D0 000E00F0  7C 7E 1B 78 */	mr r30, r3
/* 800E41D4 000E00F4  80 04 04 F0 */	lwz r0, 0x4f0(r4)
/* 800E41D8 000E00F8  28 00 00 00 */	cmplwi r0, 0
/* 800E41DC 000E00FC  41 82 00 08 */	beq lbl_800E41E4
/* 800E41E0 000E0100  4B FF B4 8D */	bl __GXSetDirtyState
lbl_800E41E4:
/* 800E41E4 000E0104  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E41E8 000E0108  88 04 04 ED */	lbz r0, 0x4ed(r4)
/* 800E41EC 000E010C  28 00 00 00 */	cmplwi r0, 0
/* 800E41F0 000E0110  41 82 00 10 */	beq lbl_800E4200
/* 800E41F4 000E0114  38 7F 00 24 */	addi r3, r31, 0x24
/* 800E41F8 000E0118  38 A0 04 F4 */	li r5, 0x4f4
/* 800E41FC 000E011C  4B F1 F2 19 */	bl memcpy
lbl_800E4200:
/* 800E4200 000E0120  38 1D FF FC */	addi r0, r29, -4
/* 800E4204 000E0124  93 9F 00 00 */	stw r28, 0(r31)
/* 800E4208 000E0128  7C 1C 02 14 */	add r0, r28, r0
/* 800E420C 000E012C  90 1F 00 04 */	stw r0, 4(r31)
/* 800E4210 000E0130  38 80 00 00 */	li r4, 0
/* 800E4214 000E0134  38 00 00 01 */	li r0, 1
/* 800E4218 000E0138  93 BF 00 08 */	stw r29, 8(r31)
/* 800E421C 000E013C  7F C3 F3 78 */	mr r3, r30
/* 800E4220 000E0140  90 9F 00 1C */	stw r4, 0x1c(r31)
/* 800E4224 000E0144  93 9F 00 14 */	stw r28, 0x14(r31)
/* 800E4228 000E0148  93 9F 00 18 */	stw r28, 0x18(r31)
/* 800E422C 000E014C  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E4230 000E0150  98 04 04 EC */	stb r0, 0x4ec(r4)
/* 800E4234 000E0154  4B FF 91 E9 */	bl GXSaveCPUFifo
/* 800E4238 000E0158  93 CD A3 A8 */	stw r30, OldCPUFifo-_SDA_BASE_(r13)
/* 800E423C 000E015C  7F E3 FB 78 */	mr r3, r31
/* 800E4240 000E0160  4B FF 8F 55 */	bl GXSetCPUFifo
/* 800E4244 000E0164  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800E4248 000E0168  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800E424C 000E016C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800E4250 000E0170  7C 08 03 A6 */	mtlr r0
/* 800E4254 000E0174  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800E4258 000E0178  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800E425C 000E017C  38 21 00 20 */	addi r1, r1, 0x20
/* 800E4260 000E0180  4E 80 00 20 */	blr 

.global GXEndDisplayList
GXEndDisplayList:
/* 800E4264 000E0184  7C 08 02 A6 */	mflr r0
/* 800E4268 000E0188  3C 80 80 2D */	lis r4, lbl_802C8690@ha
/* 800E426C 000E018C  90 01 00 04 */	stw r0, 4(r1)
/* 800E4270 000E0190  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800E4274 000E0194  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800E4278 000E0198  3B E4 86 90 */	addi r31, r4, lbl_802C8690@l
/* 800E427C 000E019C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800E4280 000E01A0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800E4284 000E01A4  93 81 00 10 */	stw r28, 0x10(r1)
/* 800E4288 000E01A8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E428C 000E01AC  80 03 04 F0 */	lwz r0, 0x4f0(r3)
/* 800E4290 000E01B0  28 00 00 00 */	cmplwi r0, 0
/* 800E4294 000E01B4  41 82 00 08 */	beq lbl_800E429C
/* 800E4298 000E01B8  4B FF B3 D5 */	bl __GXSetDirtyState
lbl_800E429C:
/* 800E429C 000E01BC  80 8D A3 60 */	lwz r4, __piReg-_SDA_BASE_(r13)
/* 800E42A0 000E01C0  7F E3 FB 78 */	mr r3, r31
/* 800E42A4 000E01C4  80 04 00 14 */	lwz r0, 0x14(r4)
/* 800E42A8 000E01C8  54 1E 37 FE */	rlwinm r30, r0, 6, 0x1f, 0x1f
/* 800E42AC 000E01CC  4B FF 91 91 */	bl __GXSaveCPUFifoAux
/* 800E42B0 000E01D0  80 6D A3 A8 */	lwz r3, OldCPUFifo-_SDA_BASE_(r13)
/* 800E42B4 000E01D4  4B FF 8E E1 */	bl GXSetCPUFifo
/* 800E42B8 000E01D8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E42BC 000E01DC  88 03 04 ED */	lbz r0, 0x4ed(r3)
/* 800E42C0 000E01E0  28 00 00 00 */	cmplwi r0, 0
/* 800E42C4 000E01E4  41 82 00 34 */	beq lbl_800E42F8
/* 800E42C8 000E01E8  4B FE 1D F5 */	bl OSDisableInterrupts
/* 800E42CC 000E01EC  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E42D0 000E01F0  7C 7D 1B 78 */	mr r29, r3
/* 800E42D4 000E01F4  38 A0 04 F4 */	li r5, 0x4f4
/* 800E42D8 000E01F8  83 84 00 08 */	lwz r28, 8(r4)
/* 800E42DC 000E01FC  38 64 00 00 */	addi r3, r4, 0
/* 800E42E0 000E0200  38 9F 00 24 */	addi r4, r31, 0x24
/* 800E42E4 000E0204  4B F1 F1 31 */	bl memcpy
/* 800E42E8 000E0208  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E42EC 000E020C  7F A3 EB 78 */	mr r3, r29
/* 800E42F0 000E0210  93 84 00 08 */	stw r28, 8(r4)
/* 800E42F4 000E0214  4B FE 1D F1 */	bl OSRestoreInterrupts
lbl_800E42F8:
/* 800E42F8 000E0218  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E42FC 000E021C  38 00 00 00 */	li r0, 0
/* 800E4300 000E0220  28 1E 00 00 */	cmplwi r30, 0
/* 800E4304 000E0224  98 03 04 EC */	stb r0, 0x4ec(r3)
/* 800E4308 000E0228  40 82 00 0C */	bne lbl_800E4314
/* 800E430C 000E022C  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 800E4310 000E0230  48 00 00 08 */	b lbl_800E4318
lbl_800E4314:
/* 800E4314 000E0234  38 60 00 00 */	li r3, 0
lbl_800E4318:
/* 800E4318 000E0238  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800E431C 000E023C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800E4320 000E0240  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800E4324 000E0244  7C 08 03 A6 */	mtlr r0
/* 800E4328 000E0248  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800E432C 000E024C  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800E4330 000E0250  38 21 00 20 */	addi r1, r1, 0x20
/* 800E4334 000E0254  4E 80 00 20 */	blr 

.global GXCallDisplayList
GXCallDisplayList:
/* 800E4338 000E0258  7C 08 02 A6 */	mflr r0
/* 800E433C 000E025C  90 01 00 04 */	stw r0, 4(r1)
/* 800E4340 000E0260  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800E4344 000E0264  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800E4348 000E0268  3B E4 00 00 */	addi r31, r4, 0
/* 800E434C 000E026C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800E4350 000E0270  3B C3 00 00 */	addi r30, r3, 0
/* 800E4354 000E0274  80 AD 97 C8 */	lwz r5, gx-_SDA_BASE_(r13)
/* 800E4358 000E0278  80 05 04 F0 */	lwz r0, 0x4f0(r5)
/* 800E435C 000E027C  28 00 00 00 */	cmplwi r0, 0
/* 800E4360 000E0280  41 82 00 08 */	beq lbl_800E4368
/* 800E4364 000E0284  4B FF B3 09 */	bl __GXSetDirtyState
lbl_800E4368:
/* 800E4368 000E0288  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E436C 000E028C  80 03 00 00 */	lwz r0, 0(r3)
/* 800E4370 000E0290  28 00 00 00 */	cmplwi r0, 0
/* 800E4374 000E0294  41 82 00 08 */	beq lbl_800E437C
/* 800E4378 000E0298  4B FF B4 5D */	bl __GXSendFlushPrim
lbl_800E437C:
/* 800E437C 000E029C  38 00 00 40 */	li r0, 0x40
/* 800E4380 000E02A0  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 800E4384 000E02A4  98 03 80 00 */	stb r0, 0xCC008000@l(r3)
/* 800E4388 000E02A8  93 C3 80 00 */	stw r30, -0x8000(r3)
/* 800E438C 000E02AC  93 E3 80 00 */	stw r31, -0x8000(r3)
/* 800E4390 000E02B0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800E4394 000E02B4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800E4398 000E02B8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800E439C 000E02BC  38 21 00 18 */	addi r1, r1, 0x18
/* 800E43A0 000E02C0  7C 08 03 A6 */	mtlr r0
/* 800E43A4 000E02C4  4E 80 00 20 */	blr 
