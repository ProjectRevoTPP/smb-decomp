.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global OSGetTime
OSGetTime:
/* 800C997C 000C589C  7C 6D 42 E6 */	mftbu r3
/* 800C9980 000C58A0  7C 8C 42 E6 */	mftb r4, 0x10c
/* 800C9984 000C58A4  7C AD 42 E6 */	mftbu r5
/* 800C9988 000C58A8  7C 03 28 00 */	cmpw r3, r5
/* 800C998C 000C58AC  40 82 FF F0 */	bne OSGetTime
/* 800C9990 000C58B0  4E 80 00 20 */	blr 

.global OSGetTick
OSGetTick:
/* 800C9994 000C58B4  7C 6C 42 E6 */	mftb r3, 0x10c
/* 800C9998 000C58B8  4E 80 00 20 */	blr 

.global __OSGetSystemTime
__OSGetSystemTime:
/* 800C999C 000C58BC  7C 08 02 A6 */	mflr r0
/* 800C99A0 000C58C0  90 01 00 04 */	stw r0, 4(r1)
/* 800C99A4 000C58C4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800C99A8 000C58C8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800C99AC 000C58CC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800C99B0 000C58D0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800C99B4 000C58D4  4B FF C7 09 */	bl OSDisableInterrupts
/* 800C99B8 000C58D8  7C 7F 1B 78 */	mr r31, r3
/* 800C99BC 000C58DC  4B FF FF C1 */	bl OSGetTime
/* 800C99C0 000C58E0  3C C0 80 00 */	lis r6, 0x800030DC@ha
/* 800C99C4 000C58E4  80 A6 30 DC */	lwz r5, 0x800030DC@l(r6)
/* 800C99C8 000C58E8  80 06 30 D8 */	lwz r0, 0x30d8(r6)
/* 800C99CC 000C58EC  7F A5 20 14 */	addc r29, r5, r4
/* 800C99D0 000C58F0  7F C0 19 14 */	adde r30, r0, r3
/* 800C99D4 000C58F4  7F E3 FB 78 */	mr r3, r31
/* 800C99D8 000C58F8  4B FF C7 0D */	bl OSRestoreInterrupts
/* 800C99DC 000C58FC  7F A4 EB 78 */	mr r4, r29
/* 800C99E0 000C5900  7F C3 F3 78 */	mr r3, r30
/* 800C99E4 000C5904  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800C99E8 000C5908  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800C99EC 000C590C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800C99F0 000C5910  7C 08 03 A6 */	mtlr r0
/* 800C99F4 000C5914  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800C99F8 000C5918  38 21 00 20 */	addi r1, r1, 0x20
/* 800C99FC 000C591C  4E 80 00 20 */	blr 

.global GetDates
GetDates:
/* 800C9A00 000C5920  3C A0 92 49 */	lis r5, 0x92492493@ha
/* 800C9A04 000C5924  38 05 24 93 */	addi r0, r5, 0x92492493@l
/* 800C9A08 000C5928  38 E3 00 06 */	addi r7, r3, 6
/* 800C9A0C 000C592C  7C C0 38 96 */	mulhw r6, r0, r7
/* 800C9A10 000C5930  3C A0 B3 8D */	lis r5, 0xB38CF9B1@ha
/* 800C9A14 000C5934  38 05 F9 B1 */	addi r0, r5, 0xB38CF9B1@l
/* 800C9A18 000C5938  7C 00 18 96 */	mulhw r0, r0, r3
/* 800C9A1C 000C593C  7C A6 3A 14 */	add r5, r6, r7
/* 800C9A20 000C5940  7C A5 16 70 */	srawi r5, r5, 2
/* 800C9A24 000C5944  54 A6 0F FE */	srwi r6, r5, 0x1f
/* 800C9A28 000C5948  7C A5 32 14 */	add r5, r5, r6
/* 800C9A2C 000C594C  7C 00 1A 14 */	add r0, r0, r3
/* 800C9A30 000C5950  1C C5 00 07 */	mulli r6, r5, 7
/* 800C9A34 000C5954  7C 00 46 70 */	srawi r0, r0, 8
/* 800C9A38 000C5958  54 05 0F FE */	srwi r5, r0, 0x1f
/* 800C9A3C 000C595C  7C A0 2A 14 */	add r5, r0, r5
/* 800C9A40 000C5960  7C 06 38 50 */	subf r0, r6, r7
/* 800C9A44 000C5964  1D 65 01 6D */	mulli r11, r5, 0x16d
/* 800C9A48 000C5968  90 04 00 18 */	stw r0, 0x18(r4)
/* 800C9A4C 000C596C  48 00 00 04 */	b lbl_800C9A50
lbl_800C9A50:
/* 800C9A50 000C5970  3C C0 51 EC */	lis r6, 0x51EB851F@ha
/* 800C9A54 000C5974  39 46 85 1F */	addi r10, r6, 0x51EB851F@l
/* 800C9A58 000C5978  48 00 00 04 */	b lbl_800C9A5C
lbl_800C9A5C:
/* 800C9A5C 000C597C  48 00 00 0C */	b lbl_800C9A68
lbl_800C9A60:
/* 800C9A60 000C5980  39 6B FE 93 */	addi r11, r11, -365
/* 800C9A64 000C5984  38 A5 FF FF */	addi r5, r5, -1
lbl_800C9A68:
/* 800C9A68 000C5988  2C 05 00 01 */	cmpwi r5, 1
/* 800C9A6C 000C598C  40 80 00 0C */	bge lbl_800C9A78
/* 800C9A70 000C5990  38 00 00 00 */	li r0, 0
/* 800C9A74 000C5994  48 00 00 38 */	b lbl_800C9AAC
lbl_800C9A78:
/* 800C9A78 000C5998  38 05 FF FF */	addi r0, r5, -1
/* 800C9A7C 000C599C  7C 0A 00 96 */	mulhw r0, r10, r0
/* 800C9A80 000C59A0  7C 08 3E 70 */	srawi r8, r0, 7
/* 800C9A84 000C59A4  7C 06 2E 70 */	srawi r6, r0, 5
/* 800C9A88 000C59A8  38 05 00 03 */	addi r0, r5, 3
/* 800C9A8C 000C59AC  54 C7 0F FE */	srwi r7, r6, 0x1f
/* 800C9A90 000C59B0  7C 00 16 70 */	srawi r0, r0, 2
/* 800C9A94 000C59B4  55 09 0F FE */	srwi r9, r8, 0x1f
/* 800C9A98 000C59B8  7C C6 3A 14 */	add r6, r6, r7
/* 800C9A9C 000C59BC  7C 00 01 94 */	addze r0, r0
/* 800C9AA0 000C59C0  7C E8 4A 14 */	add r7, r8, r9
/* 800C9AA4 000C59C4  7C 06 00 50 */	subf r0, r6, r0
/* 800C9AA8 000C59C8  7C 07 02 14 */	add r0, r7, r0
lbl_800C9AAC:
/* 800C9AAC 000C59CC  7C 0B 02 14 */	add r0, r11, r0
/* 800C9AB0 000C59D0  7C 03 00 00 */	cmpw r3, r0
/* 800C9AB4 000C59D4  41 80 FF AC */	blt lbl_800C9A60
/* 800C9AB8 000C59D8  7C A6 16 70 */	srawi r6, r5, 2
/* 800C9ABC 000C59DC  90 A4 00 14 */	stw r5, 0x14(r4)
/* 800C9AC0 000C59E0  7C C6 01 94 */	addze r6, r6
/* 800C9AC4 000C59E4  54 C6 10 3A */	slwi r6, r6, 2
/* 800C9AC8 000C59E8  7C C6 28 10 */	subfc r6, r6, r5
/* 800C9ACC 000C59EC  7C 00 18 50 */	subf r0, r0, r3
/* 800C9AD0 000C59F0  2C 06 00 00 */	cmpwi r6, 0
/* 800C9AD4 000C59F4  90 04 00 1C */	stw r0, 0x1c(r4)
/* 800C9AD8 000C59F8  38 E0 00 01 */	li r7, 1
/* 800C9ADC 000C59FC  39 00 00 00 */	li r8, 0
/* 800C9AE0 000C5A00  40 82 00 30 */	bne lbl_800C9B10
/* 800C9AE4 000C5A04  3C 60 51 EC */	lis r3, 0x51EB851F@ha
/* 800C9AE8 000C5A08  38 63 85 1F */	addi r3, r3, 0x51EB851F@l
/* 800C9AEC 000C5A0C  7C 63 28 96 */	mulhw r3, r3, r5
/* 800C9AF0 000C5A10  7C 63 2E 70 */	srawi r3, r3, 5
/* 800C9AF4 000C5A14  54 66 0F FE */	srwi r6, r3, 0x1f
/* 800C9AF8 000C5A18  7C 63 32 14 */	add r3, r3, r6
/* 800C9AFC 000C5A1C  1C 63 00 64 */	mulli r3, r3, 0x64
/* 800C9B00 000C5A20  7C 63 28 50 */	subf r3, r3, r5
/* 800C9B04 000C5A24  2C 03 00 00 */	cmpwi r3, 0
/* 800C9B08 000C5A28  41 82 00 08 */	beq lbl_800C9B10
/* 800C9B0C 000C5A2C  7C E8 3B 78 */	mr r8, r7
lbl_800C9B10:
/* 800C9B10 000C5A30  2C 08 00 00 */	cmpwi r8, 0
/* 800C9B14 000C5A34  40 82 00 30 */	bne lbl_800C9B44
/* 800C9B18 000C5A38  3C 60 51 EC */	lis r3, 0x51EB851F@ha
/* 800C9B1C 000C5A3C  38 63 85 1F */	addi r3, r3, 0x51EB851F@l
/* 800C9B20 000C5A40  7C 63 28 96 */	mulhw r3, r3, r5
/* 800C9B24 000C5A44  7C 63 3E 70 */	srawi r3, r3, 7
/* 800C9B28 000C5A48  54 66 0F FE */	srwi r6, r3, 0x1f
/* 800C9B2C 000C5A4C  7C 63 32 14 */	add r3, r3, r6
/* 800C9B30 000C5A50  1C 63 01 90 */	mulli r3, r3, 0x190
/* 800C9B34 000C5A54  7C 63 28 50 */	subf r3, r3, r5
/* 800C9B38 000C5A58  2C 03 00 00 */	cmpwi r3, 0
/* 800C9B3C 000C5A5C  41 82 00 08 */	beq lbl_800C9B44
/* 800C9B40 000C5A60  38 E0 00 00 */	li r7, 0
lbl_800C9B44:
/* 800C9B44 000C5A64  2C 07 00 00 */	cmpwi r7, 0
/* 800C9B48 000C5A68  41 82 00 10 */	beq lbl_800C9B58
/* 800C9B4C 000C5A6C  3C 60 80 1E */	lis r3, lbl_801E7548@ha
/* 800C9B50 000C5A70  38 C3 75 48 */	addi r6, r3, lbl_801E7548@l
/* 800C9B54 000C5A74  48 00 00 0C */	b lbl_800C9B60
lbl_800C9B58:
/* 800C9B58 000C5A78  3C 60 80 1E */	lis r3, lbl_801E7518@ha
/* 800C9B5C 000C5A7C  38 C3 75 18 */	addi r6, r3, lbl_801E7518@l
lbl_800C9B60:
/* 800C9B60 000C5A80  38 E0 00 0C */	li r7, 0xc
/* 800C9B64 000C5A84  38 60 00 30 */	li r3, 0x30
/* 800C9B68 000C5A88  48 00 00 04 */	b lbl_800C9B6C
lbl_800C9B6C:
/* 800C9B6C 000C5A8C  48 00 00 04 */	b lbl_800C9B70
lbl_800C9B70:
/* 800C9B70 000C5A90  38 63 FF FC */	addi r3, r3, -4
/* 800C9B74 000C5A94  7C A6 18 2E */	lwzx r5, r6, r3
/* 800C9B78 000C5A98  38 E7 FF FF */	addi r7, r7, -1
/* 800C9B7C 000C5A9C  7C 00 28 00 */	cmpw r0, r5
/* 800C9B80 000C5AA0  41 80 FF F0 */	blt lbl_800C9B70
/* 800C9B84 000C5AA4  90 E4 00 10 */	stw r7, 0x10(r4)
/* 800C9B88 000C5AA8  7C 66 18 2E */	lwzx r3, r6, r3
/* 800C9B8C 000C5AAC  7C 63 00 50 */	subf r3, r3, r0
/* 800C9B90 000C5AB0  38 03 00 01 */	addi r0, r3, 1
/* 800C9B94 000C5AB4  90 04 00 0C */	stw r0, 0xc(r4)
/* 800C9B98 000C5AB8  4E 80 00 20 */	blr 

.global OSTicksToCalendarTime
OSTicksToCalendarTime:
/* 800C9B9C 000C5ABC  7C 08 02 A6 */	mflr r0
/* 800C9BA0 000C5AC0  90 01 00 04 */	stw r0, 4(r1)
/* 800C9BA4 000C5AC4  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800C9BA8 000C5AC8  BF 21 00 1C */	stmw r25, 0x1c(r1)
/* 800C9BAC 000C5ACC  7C 7D 1B 78 */	mr r29, r3
/* 800C9BB0 000C5AD0  7C 9E 23 78 */	mr r30, r4
/* 800C9BB4 000C5AD4  7C BF 2B 78 */	mr r31, r5
/* 800C9BB8 000C5AD8  3F 60 80 00 */	lis r27, 0x800000F8@ha
/* 800C9BBC 000C5ADC  80 1B 00 F8 */	lwz r0, 0x800000F8@l(r27)
/* 800C9BC0 000C5AE0  7F A3 EB 78 */	mr r3, r29
/* 800C9BC4 000C5AE4  7F C4 F3 78 */	mr r4, r30
/* 800C9BC8 000C5AE8  54 06 F0 BE */	srwi r6, r0, 2
/* 800C9BCC 000C5AEC  38 A0 00 00 */	li r5, 0
/* 800C9BD0 000C5AF0  48 03 9D 01 */	bl __mod2i
/* 800C9BD4 000C5AF4  7C 7A 1B 78 */	mr r26, r3
/* 800C9BD8 000C5AF8  38 A0 00 00 */	li r5, 0
/* 800C9BDC 000C5AFC  7C 99 23 78 */	mr r25, r4
/* 800C9BE0 000C5B00  6F 44 80 00 */	xoris r4, r26, 0x8000
/* 800C9BE4 000C5B04  6C A3 80 00 */	xoris r3, r5, 0x8000
/* 800C9BE8 000C5B08  7C 05 C8 10 */	subfc r0, r5, r25
/* 800C9BEC 000C5B0C  7C 63 21 10 */	subfe r3, r3, r4
/* 800C9BF0 000C5B10  7C 64 21 10 */	subfe r3, r4, r4
/* 800C9BF4 000C5B14  7C 63 00 D0 */	neg r3, r3
/* 800C9BF8 000C5B18  2C 03 00 00 */	cmpwi r3, 0
/* 800C9BFC 000C5B1C  41 82 00 14 */	beq lbl_800C9C10
/* 800C9C00 000C5B20  80 1B 00 F8 */	lwz r0, 0xf8(r27)
/* 800C9C04 000C5B24  54 00 F0 BE */	srwi r0, r0, 2
/* 800C9C08 000C5B28  7F 39 00 14 */	addc r25, r25, r0
/* 800C9C0C 000C5B2C  7F 5A 29 14 */	adde r26, r26, r5
lbl_800C9C10:
/* 800C9C10 000C5B30  38 80 00 08 */	li r4, 8
/* 800C9C14 000C5B34  7C 7A 21 D6 */	mullw r3, r26, r4
/* 800C9C18 000C5B38  7C 19 20 16 */	mulhwu r0, r25, r4
/* 800C9C1C 000C5B3C  3F 60 80 00 */	lis r27, 0x800000F8@ha
/* 800C9C20 000C5B40  80 DB 00 F8 */	lwz r6, 0x800000F8@l(r27)
/* 800C9C24 000C5B44  3C A0 43 1C */	lis r5, 0x431BDE83@ha
/* 800C9C28 000C5B48  38 A5 DE 83 */	addi r5, r5, 0x431BDE83@l
/* 800C9C2C 000C5B4C  54 C6 F0 BE */	srwi r6, r6, 2
/* 800C9C30 000C5B50  7C A5 30 16 */	mulhwu r5, r5, r6
/* 800C9C34 000C5B54  54 A6 8B FE */	srwi r6, r5, 0xf
/* 800C9C38 000C5B58  3B 80 00 00 */	li r28, 0
/* 800C9C3C 000C5B5C  7C 63 02 14 */	add r3, r3, r0
/* 800C9C40 000C5B60  7C 19 E1 D6 */	mullw r0, r25, r28
/* 800C9C44 000C5B64  7C 99 21 D6 */	mullw r4, r25, r4
/* 800C9C48 000C5B68  7C 63 02 14 */	add r3, r3, r0
/* 800C9C4C 000C5B6C  38 A0 00 00 */	li r5, 0
/* 800C9C50 000C5B70  48 03 9A 65 */	bl __div2i
/* 800C9C54 000C5B74  38 A0 00 00 */	li r5, 0
/* 800C9C58 000C5B78  38 C0 03 E8 */	li r6, 0x3e8
/* 800C9C5C 000C5B7C  48 03 9C 75 */	bl __mod2i
/* 800C9C60 000C5B80  90 9F 00 24 */	stw r4, 0x24(r31)
/* 800C9C64 000C5B84  3C 60 10 62 */	lis r3, 0x10624DD3@ha
/* 800C9C68 000C5B88  38 A3 4D D3 */	addi r5, r3, 0x10624DD3@l
/* 800C9C6C 000C5B8C  80 1B 00 F8 */	lwz r0, 0xf8(r27)
/* 800C9C70 000C5B90  7F 43 D3 78 */	mr r3, r26
/* 800C9C74 000C5B94  7F 24 CB 78 */	mr r4, r25
/* 800C9C78 000C5B98  54 00 F0 BE */	srwi r0, r0, 2
/* 800C9C7C 000C5B9C  7C 05 00 16 */	mulhwu r0, r5, r0
/* 800C9C80 000C5BA0  54 06 D1 BE */	srwi r6, r0, 6
/* 800C9C84 000C5BA4  38 A0 00 00 */	li r5, 0
/* 800C9C88 000C5BA8  48 03 9A 2D */	bl __div2i
/* 800C9C8C 000C5BAC  38 A0 00 00 */	li r5, 0
/* 800C9C90 000C5BB0  38 C0 03 E8 */	li r6, 0x3e8
/* 800C9C94 000C5BB4  48 03 9C 3D */	bl __mod2i
/* 800C9C98 000C5BB8  90 9F 00 20 */	stw r4, 0x20(r31)
/* 800C9C9C 000C5BBC  7F D9 F0 10 */	subfc r30, r25, r30
/* 800C9CA0 000C5BC0  7F BA E9 10 */	subfe r29, r26, r29
/* 800C9CA4 000C5BC4  80 1B 00 F8 */	lwz r0, 0xf8(r27)
/* 800C9CA8 000C5BC8  3C A0 00 01 */	lis r5, 0x00015180@ha
/* 800C9CAC 000C5BCC  3B 25 51 80 */	addi r25, r5, 0x00015180@l
/* 800C9CB0 000C5BD0  7F A3 EB 78 */	mr r3, r29
/* 800C9CB4 000C5BD4  54 06 F0 BE */	srwi r6, r0, 2
/* 800C9CB8 000C5BD8  7F C4 F3 78 */	mr r4, r30
/* 800C9CBC 000C5BDC  38 A0 00 00 */	li r5, 0
/* 800C9CC0 000C5BE0  48 03 99 F5 */	bl __div2i
/* 800C9CC4 000C5BE4  7F 26 CB 78 */	mr r6, r25
/* 800C9CC8 000C5BE8  38 A0 00 00 */	li r5, 0
/* 800C9CCC 000C5BEC  48 03 99 E9 */	bl __div2i
/* 800C9CD0 000C5BF0  3C A0 00 0B */	lis r5, 0x000B2575@ha
/* 800C9CD4 000C5BF4  80 1B 00 F8 */	lwz r0, 0xf8(r27)
/* 800C9CD8 000C5BF8  38 A5 25 75 */	addi r5, r5, 0x000B2575@l
/* 800C9CDC 000C5BFC  7F 44 28 14 */	addc r26, r4, r5
/* 800C9CE0 000C5C00  54 06 F0 BE */	srwi r6, r0, 2
/* 800C9CE4 000C5C04  7C 03 E1 14 */	adde r0, r3, r28
/* 800C9CE8 000C5C08  7F A3 EB 78 */	mr r3, r29
/* 800C9CEC 000C5C0C  7F C4 F3 78 */	mr r4, r30
/* 800C9CF0 000C5C10  38 A0 00 00 */	li r5, 0
/* 800C9CF4 000C5C14  48 03 99 C1 */	bl __div2i
/* 800C9CF8 000C5C18  7F 26 CB 78 */	mr r6, r25
/* 800C9CFC 000C5C1C  38 A0 00 00 */	li r5, 0
/* 800C9D00 000C5C20  48 03 9B D1 */	bl __mod2i
/* 800C9D04 000C5C24  7C 9B 23 78 */	mr r27, r4
/* 800C9D08 000C5C28  2C 1B 00 00 */	cmpwi r27, 0
/* 800C9D0C 000C5C2C  40 80 00 10 */	bge lbl_800C9D1C
/* 800C9D10 000C5C30  3F 7B 00 01 */	addis r27, r27, 1
/* 800C9D14 000C5C34  3B 5A FF FF */	addi r26, r26, -1
/* 800C9D18 000C5C38  3B 7B 51 80 */	addi r27, r27, 0x5180
lbl_800C9D1C:
/* 800C9D1C 000C5C3C  7F 43 D3 78 */	mr r3, r26
/* 800C9D20 000C5C40  7F E4 FB 78 */	mr r4, r31
/* 800C9D24 000C5C44  4B FF FC DD */	bl GetDates
/* 800C9D28 000C5C48  3C 60 88 89 */	lis r3, 0x88888889@ha
/* 800C9D2C 000C5C4C  38 A3 88 89 */	addi r5, r3, 0x88888889@l
/* 800C9D30 000C5C50  7C 05 D8 96 */	mulhw r0, r5, r27
/* 800C9D34 000C5C54  7C 80 DA 14 */	add r4, r0, r27
/* 800C9D38 000C5C58  7C 80 2E 70 */	srawi r0, r4, 5
/* 800C9D3C 000C5C5C  54 03 0F FE */	srwi r3, r0, 0x1f
/* 800C9D40 000C5C60  7C E0 1A 14 */	add r7, r0, r3
/* 800C9D44 000C5C64  7C 05 38 96 */	mulhw r0, r5, r7
/* 800C9D48 000C5C68  7C 00 3A 14 */	add r0, r0, r7
/* 800C9D4C 000C5C6C  7C 05 2E 70 */	srawi r5, r0, 5
/* 800C9D50 000C5C70  7C 00 2E 70 */	srawi r0, r0, 5
/* 800C9D54 000C5C74  54 03 0F FE */	srwi r3, r0, 0x1f
/* 800C9D58 000C5C78  7C 60 1A 14 */	add r3, r0, r3
/* 800C9D5C 000C5C7C  7C 80 2E 70 */	srawi r0, r4, 5
/* 800C9D60 000C5C80  54 A6 0F FE */	srwi r6, r5, 0x1f
/* 800C9D64 000C5C84  1C 83 00 3C */	mulli r4, r3, 0x3c
/* 800C9D68 000C5C88  54 03 0F FE */	srwi r3, r0, 0x1f
/* 800C9D6C 000C5C8C  7C A5 32 14 */	add r5, r5, r6
/* 800C9D70 000C5C90  7C 00 1A 14 */	add r0, r0, r3
/* 800C9D74 000C5C94  90 BF 00 08 */	stw r5, 8(r31)
/* 800C9D78 000C5C98  1C 00 00 3C */	mulli r0, r0, 0x3c
/* 800C9D7C 000C5C9C  7C 64 38 50 */	subf r3, r4, r7
/* 800C9D80 000C5CA0  90 7F 00 04 */	stw r3, 4(r31)
/* 800C9D84 000C5CA4  7C 00 D8 50 */	subf r0, r0, r27
/* 800C9D88 000C5CA8  90 1F 00 00 */	stw r0, 0(r31)
/* 800C9D8C 000C5CAC  BB 21 00 1C */	lmw r25, 0x1c(r1)
/* 800C9D90 000C5CB0  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800C9D94 000C5CB4  38 21 00 38 */	addi r1, r1, 0x38
/* 800C9D98 000C5CB8  7C 08 03 A6 */	mtlr r0
/* 800C9D9C 000C5CBC  4E 80 00 20 */	blr 
