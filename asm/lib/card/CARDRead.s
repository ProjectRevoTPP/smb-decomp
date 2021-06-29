.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __CARDSeek
__CARDSeek:
/* 800DA910 000D6830  7C 08 02 A6 */	mflr r0
/* 800DA914 000D6834  90 01 00 04 */	stw r0, 4(r1)
/* 800DA918 000D6838  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800DA91C 000D683C  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800DA920 000D6840  3B E6 00 00 */	addi r31, r6, 0
/* 800DA924 000D6844  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800DA928 000D6848  3B C5 00 00 */	addi r30, r5, 0
/* 800DA92C 000D684C  93 A1 00 24 */	stw r29, 0x24(r1)
/* 800DA930 000D6850  3B A4 00 00 */	addi r29, r4, 0
/* 800DA934 000D6854  38 81 00 18 */	addi r4, r1, 0x18
/* 800DA938 000D6858  93 81 00 20 */	stw r28, 0x20(r1)
/* 800DA93C 000D685C  7C 7C 1B 78 */	mr r28, r3
/* 800DA940 000D6860  80 63 00 00 */	lwz r3, 0(r3)
/* 800DA944 000D6864  4B FF B8 8D */	bl __CARDGetControlBlock
/* 800DA948 000D6868  2C 03 00 00 */	cmpwi r3, 0
/* 800DA94C 000D686C  40 80 00 08 */	bge lbl_800DA954
/* 800DA950 000D6870  48 00 01 58 */	b lbl_800DAAA8
lbl_800DA954:
/* 800DA954 000D6874  A0 1C 00 10 */	lhz r0, 0x10(r28)
/* 800DA958 000D6878  28 00 00 05 */	cmplwi r0, 5
/* 800DA95C 000D687C  41 80 00 28 */	blt lbl_800DA984
/* 800DA960 000D6880  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DA964 000D6884  A0 A3 00 10 */	lhz r5, 0x10(r3)
/* 800DA968 000D6888  7C 00 28 40 */	cmplw r0, r5
/* 800DA96C 000D688C  40 80 00 18 */	bge lbl_800DA984
/* 800DA970 000D6890  80 83 00 0C */	lwz r4, 0xc(r3)
/* 800DA974 000D6894  80 1C 00 08 */	lwz r0, 8(r28)
/* 800DA978 000D6898  7C 85 21 D6 */	mullw r4, r5, r4
/* 800DA97C 000D689C  7C 04 00 00 */	cmpw r4, r0
/* 800DA980 000D68A0  41 81 00 14 */	bgt lbl_800DA994
lbl_800DA984:
/* 800DA984 000D68A4  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DA988 000D68A8  38 80 FF 80 */	li r4, -128
/* 800DA98C 000D68AC  4B FF B8 F5 */	bl __CARDPutControlBlock
/* 800DA990 000D68B0  48 00 01 18 */	b lbl_800DAAA8
lbl_800DA994:
/* 800DA994 000D68B4  4B FF D4 0D */	bl __CARDGetDirBlock
/* 800DA998 000D68B8  80 1C 00 04 */	lwz r0, 4(r28)
/* 800DA99C 000D68BC  80 A1 00 18 */	lwz r5, 0x18(r1)
/* 800DA9A0 000D68C0  54 00 30 32 */	slwi r0, r0, 6
/* 800DA9A4 000D68C4  7C 83 02 14 */	add r4, r3, r0
/* 800DA9A8 000D68C8  80 65 00 0C */	lwz r3, 0xc(r5)
/* 800DA9AC 000D68CC  A0 04 00 38 */	lhz r0, 0x38(r4)
/* 800DA9B0 000D68D0  7C 60 19 D6 */	mullw r3, r0, r3
/* 800DA9B4 000D68D4  7C 03 F0 00 */	cmpw r3, r30
/* 800DA9B8 000D68D8  40 81 00 10 */	ble lbl_800DA9C8
/* 800DA9BC 000D68DC  7C 1E EA 14 */	add r0, r30, r29
/* 800DA9C0 000D68E0  7C 03 00 00 */	cmpw r3, r0
/* 800DA9C4 000D68E4  40 80 00 14 */	bge lbl_800DA9D8
lbl_800DA9C8:
/* 800DA9C8 000D68E8  38 65 00 00 */	addi r3, r5, 0
/* 800DA9CC 000D68EC  38 80 FF F5 */	li r4, -11
/* 800DA9D0 000D68F0  4B FF B8 B1 */	bl __CARDPutControlBlock
/* 800DA9D4 000D68F4  48 00 00 D4 */	b lbl_800DAAA8
lbl_800DA9D8:
/* 800DA9D8 000D68F8  93 85 00 C0 */	stw r28, 0xc0(r5)
/* 800DA9DC 000D68FC  93 BC 00 0C */	stw r29, 0xc(r28)
/* 800DA9E0 000D6900  80 1C 00 08 */	lwz r0, 8(r28)
/* 800DA9E4 000D6904  7C 1E 00 00 */	cmpw r30, r0
/* 800DA9E8 000D6908  40 80 00 40 */	bge lbl_800DAA28
/* 800DA9EC 000D690C  38 00 00 00 */	li r0, 0
/* 800DA9F0 000D6910  90 1C 00 08 */	stw r0, 8(r28)
/* 800DA9F4 000D6914  A0 04 00 36 */	lhz r0, 0x36(r4)
/* 800DA9F8 000D6918  B0 1C 00 10 */	sth r0, 0x10(r28)
/* 800DA9FC 000D691C  A0 9C 00 10 */	lhz r4, 0x10(r28)
/* 800DAA00 000D6920  28 04 00 05 */	cmplwi r4, 5
/* 800DAA04 000D6924  41 80 00 14 */	blt lbl_800DAA18
/* 800DAA08 000D6928  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DAA0C 000D692C  A0 03 00 10 */	lhz r0, 0x10(r3)
/* 800DAA10 000D6930  7C 04 00 40 */	cmplw r4, r0
/* 800DAA14 000D6934  41 80 00 14 */	blt lbl_800DAA28
lbl_800DAA18:
/* 800DAA18 000D6938  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DAA1C 000D693C  38 80 FF FA */	li r4, -6
/* 800DAA20 000D6940  4B FF B8 61 */	bl __CARDPutControlBlock
/* 800DAA24 000D6944  48 00 00 84 */	b lbl_800DAAA8
lbl_800DAA28:
/* 800DAA28 000D6948  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DAA2C 000D694C  4B FF CF 71 */	bl __CARDGetFatBlock
/* 800DAA30 000D6950  48 00 00 4C */	b lbl_800DAA7C
lbl_800DAA34:
/* 800DAA34 000D6954  80 1C 00 08 */	lwz r0, 8(r28)
/* 800DAA38 000D6958  7C 00 22 14 */	add r0, r0, r4
/* 800DAA3C 000D695C  90 1C 00 08 */	stw r0, 8(r28)
/* 800DAA40 000D6960  A0 1C 00 10 */	lhz r0, 0x10(r28)
/* 800DAA44 000D6964  54 00 08 3C */	slwi r0, r0, 1
/* 800DAA48 000D6968  7C 03 02 2E */	lhzx r0, r3, r0
/* 800DAA4C 000D696C  B0 1C 00 10 */	sth r0, 0x10(r28)
/* 800DAA50 000D6970  A0 BC 00 10 */	lhz r5, 0x10(r28)
/* 800DAA54 000D6974  28 05 00 05 */	cmplwi r5, 5
/* 800DAA58 000D6978  41 80 00 14 */	blt lbl_800DAA6C
/* 800DAA5C 000D697C  80 81 00 18 */	lwz r4, 0x18(r1)
/* 800DAA60 000D6980  A0 04 00 10 */	lhz r0, 0x10(r4)
/* 800DAA64 000D6984  7C 05 00 40 */	cmplw r5, r0
/* 800DAA68 000D6988  41 80 00 14 */	blt lbl_800DAA7C
lbl_800DAA6C:
/* 800DAA6C 000D698C  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800DAA70 000D6990  38 80 FF FA */	li r4, -6
/* 800DAA74 000D6994  4B FF B8 0D */	bl __CARDPutControlBlock
/* 800DAA78 000D6998  48 00 00 30 */	b lbl_800DAAA8
lbl_800DAA7C:
/* 800DAA7C 000D699C  80 81 00 18 */	lwz r4, 0x18(r1)
/* 800DAA80 000D69A0  80 BC 00 08 */	lwz r5, 8(r28)
/* 800DAA84 000D69A4  80 84 00 0C */	lwz r4, 0xc(r4)
/* 800DAA88 000D69A8  38 04 FF FF */	addi r0, r4, -1
/* 800DAA8C 000D69AC  7F C0 00 78 */	andc r0, r30, r0
/* 800DAA90 000D69B0  7C 05 00 40 */	cmplw r5, r0
/* 800DAA94 000D69B4  41 80 FF A0 */	blt lbl_800DAA34
/* 800DAA98 000D69B8  93 DC 00 08 */	stw r30, 8(r28)
/* 800DAA9C 000D69BC  38 60 00 00 */	li r3, 0
/* 800DAAA0 000D69C0  80 01 00 18 */	lwz r0, 0x18(r1)
/* 800DAAA4 000D69C4  90 1F 00 00 */	stw r0, 0(r31)
lbl_800DAAA8:
/* 800DAAA8 000D69C8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800DAAAC 000D69CC  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 800DAAB0 000D69D0  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 800DAAB4 000D69D4  7C 08 03 A6 */	mtlr r0
/* 800DAAB8 000D69D8  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 800DAABC 000D69DC  83 81 00 20 */	lwz r28, 0x20(r1)
/* 800DAAC0 000D69E0  38 21 00 30 */	addi r1, r1, 0x30
/* 800DAAC4 000D69E4  4E 80 00 20 */	blr 

.global ReadCallback
ReadCallback:
/* 800DAAC8 000D69E8  7C 08 02 A6 */	mflr r0
/* 800DAACC 000D69EC  90 01 00 04 */	stw r0, 4(r1)
/* 800DAAD0 000D69F0  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800DAAD4 000D69F4  BF 61 00 14 */	stmw r27, 0x14(r1)
/* 800DAAD8 000D69F8  3B A3 00 00 */	addi r29, r3, 0
/* 800DAADC 000D69FC  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800DAAE0 000D6A00  1C BD 01 08 */	mulli r5, r29, 0x108
/* 800DAAE4 000D6A04  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800DAAE8 000D6A08  7C 9E 23 79 */	or. r30, r4, r4
/* 800DAAEC 000D6A0C  7F E0 2A 14 */	add r31, r0, r5
/* 800DAAF0 000D6A10  41 80 00 C8 */	blt lbl_800DABB8
/* 800DAAF4 000D6A14  83 9F 00 C0 */	lwz r28, 0xc0(r31)
/* 800DAAF8 000D6A18  80 9C 00 0C */	lwz r4, 0xc(r28)
/* 800DAAFC 000D6A1C  2C 04 00 00 */	cmpwi r4, 0
/* 800DAB00 000D6A20  40 80 00 0C */	bge lbl_800DAB0C
/* 800DAB04 000D6A24  3B C0 FF F2 */	li r30, -14
/* 800DAB08 000D6A28  48 00 00 B0 */	b lbl_800DABB8
lbl_800DAB0C:
/* 800DAB0C 000D6A2C  80 BF 00 0C */	lwz r5, 0xc(r31)
/* 800DAB10 000D6A30  80 DC 00 08 */	lwz r6, 8(r28)
/* 800DAB14 000D6A34  38 05 FF FF */	addi r0, r5, -1
/* 800DAB18 000D6A38  7C 03 00 F8 */	nor r3, r0, r0
/* 800DAB1C 000D6A3C  7C 06 2A 14 */	add r0, r6, r5
/* 800DAB20 000D6A40  7C 60 00 38 */	and r0, r3, r0
/* 800DAB24 000D6A44  7F 66 00 50 */	subf r27, r6, r0
/* 800DAB28 000D6A48  7C 1B 20 50 */	subf r0, r27, r4
/* 800DAB2C 000D6A4C  90 1C 00 0C */	stw r0, 0xc(r28)
/* 800DAB30 000D6A50  80 1C 00 0C */	lwz r0, 0xc(r28)
/* 800DAB34 000D6A54  2C 00 00 00 */	cmpwi r0, 0
/* 800DAB38 000D6A58  40 81 00 80 */	ble lbl_800DABB8
/* 800DAB3C 000D6A5C  7F E3 FB 78 */	mr r3, r31
/* 800DAB40 000D6A60  4B FF CE 5D */	bl __CARDGetFatBlock
/* 800DAB44 000D6A64  80 1C 00 08 */	lwz r0, 8(r28)
/* 800DAB48 000D6A68  7C 00 DA 14 */	add r0, r0, r27
/* 800DAB4C 000D6A6C  90 1C 00 08 */	stw r0, 8(r28)
/* 800DAB50 000D6A70  A0 1C 00 10 */	lhz r0, 0x10(r28)
/* 800DAB54 000D6A74  54 00 08 3C */	slwi r0, r0, 1
/* 800DAB58 000D6A78  7C 03 02 2E */	lhzx r0, r3, r0
/* 800DAB5C 000D6A7C  B0 1C 00 10 */	sth r0, 0x10(r28)
/* 800DAB60 000D6A80  A0 7C 00 10 */	lhz r3, 0x10(r28)
/* 800DAB64 000D6A84  28 03 00 05 */	cmplwi r3, 5
/* 800DAB68 000D6A88  41 80 00 10 */	blt lbl_800DAB78
/* 800DAB6C 000D6A8C  A0 1F 00 10 */	lhz r0, 0x10(r31)
/* 800DAB70 000D6A90  7C 03 00 40 */	cmplw r3, r0
/* 800DAB74 000D6A94  41 80 00 0C */	blt lbl_800DAB80
lbl_800DAB78:
/* 800DAB78 000D6A98  3B C0 FF FA */	li r30, -6
/* 800DAB7C 000D6A9C  48 00 00 3C */	b lbl_800DABB8
lbl_800DAB80:
/* 800DAB80 000D6AA0  80 BC 00 0C */	lwz r5, 0xc(r28)
/* 800DAB84 000D6AA4  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 800DAB88 000D6AA8  7C 05 00 00 */	cmpw r5, r0
/* 800DAB8C 000D6AAC  40 80 00 08 */	bge lbl_800DAB94
/* 800DAB90 000D6AB0  48 00 00 08 */	b lbl_800DAB98
lbl_800DAB94:
/* 800DAB94 000D6AB4  7C 05 03 78 */	mr r5, r0
lbl_800DAB98:
/* 800DAB98 000D6AB8  7C 80 19 D6 */	mullw r4, r0, r3
/* 800DAB9C 000D6ABC  80 DF 00 B4 */	lwz r6, 0xb4(r31)
/* 800DABA0 000D6AC0  3C 60 80 0E */	lis r3, ReadCallback@ha
/* 800DABA4 000D6AC4  38 E3 AA C8 */	addi r7, r3, ReadCallback@l
/* 800DABA8 000D6AC8  38 7D 00 00 */	addi r3, r29, 0
/* 800DABAC 000D6ACC  4B FF CC 4D */	bl __CARDRead
/* 800DABB0 000D6AD0  7C 7E 1B 79 */	or. r30, r3, r3
/* 800DABB4 000D6AD4  40 80 00 30 */	bge lbl_800DABE4
lbl_800DABB8:
/* 800DABB8 000D6AD8  83 7F 00 D0 */	lwz r27, 0xd0(r31)
/* 800DABBC 000D6ADC  38 00 00 00 */	li r0, 0
/* 800DABC0 000D6AE0  38 7F 00 00 */	addi r3, r31, 0
/* 800DABC4 000D6AE4  90 1F 00 D0 */	stw r0, 0xd0(r31)
/* 800DABC8 000D6AE8  7F C4 F3 78 */	mr r4, r30
/* 800DABCC 000D6AEC  4B FF B6 B5 */	bl __CARDPutControlBlock
/* 800DABD0 000D6AF0  39 9B 00 00 */	addi r12, r27, 0
/* 800DABD4 000D6AF4  7D 88 03 A6 */	mtlr r12
/* 800DABD8 000D6AF8  38 7D 00 00 */	addi r3, r29, 0
/* 800DABDC 000D6AFC  38 9E 00 00 */	addi r4, r30, 0
/* 800DABE0 000D6B00  4E 80 00 21 */	blrl 
lbl_800DABE4:
/* 800DABE4 000D6B04  BB 61 00 14 */	lmw r27, 0x14(r1)
/* 800DABE8 000D6B08  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800DABEC 000D6B0C  38 21 00 28 */	addi r1, r1, 0x28
/* 800DABF0 000D6B10  7C 08 03 A6 */	mtlr r0
/* 800DABF4 000D6B14  4E 80 00 20 */	blr 

.global CARDReadAsync
CARDReadAsync:
/* 800DABF8 000D6B18  7C 08 02 A6 */	mflr r0
/* 800DABFC 000D6B1C  90 01 00 04 */	stw r0, 4(r1)
/* 800DAC00 000D6B20  54 C0 05 FF */	clrlwi. r0, r6, 0x17
/* 800DAC04 000D6B24  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800DAC08 000D6B28  BF 61 00 24 */	stmw r27, 0x24(r1)
/* 800DAC0C 000D6B2C  3B A3 00 00 */	addi r29, r3, 0
/* 800DAC10 000D6B30  3B C4 00 00 */	addi r30, r4, 0
/* 800DAC14 000D6B34  3B E5 00 00 */	addi r31, r5, 0
/* 800DAC18 000D6B38  3B 67 00 00 */	addi r27, r7, 0
/* 800DAC1C 000D6B3C  40 82 00 0C */	bne lbl_800DAC28
/* 800DAC20 000D6B40  57 E0 05 FF */	clrlwi. r0, r31, 0x17
/* 800DAC24 000D6B44  41 82 00 0C */	beq lbl_800DAC30
lbl_800DAC28:
/* 800DAC28 000D6B48  38 60 FF 80 */	li r3, -128
/* 800DAC2C 000D6B4C  48 00 00 FC */	b lbl_800DAD28
lbl_800DAC30:
/* 800DAC30 000D6B50  38 7D 00 00 */	addi r3, r29, 0
/* 800DAC34 000D6B54  38 9F 00 00 */	addi r4, r31, 0
/* 800DAC38 000D6B58  38 A6 00 00 */	addi r5, r6, 0
/* 800DAC3C 000D6B5C  38 C1 00 1C */	addi r6, r1, 0x1c
/* 800DAC40 000D6B60  4B FF FC D1 */	bl __CARDSeek
/* 800DAC44 000D6B64  2C 03 00 00 */	cmpwi r3, 0
/* 800DAC48 000D6B68  40 80 00 08 */	bge lbl_800DAC50
/* 800DAC4C 000D6B6C  48 00 00 DC */	b lbl_800DAD28
lbl_800DAC50:
/* 800DAC50 000D6B70  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DAC54 000D6B74  4B FF D1 4D */	bl __CARDGetDirBlock
/* 800DAC58 000D6B78  80 1D 00 04 */	lwz r0, 4(r29)
/* 800DAC5C 000D6B7C  54 00 30 32 */	slwi r0, r0, 6
/* 800DAC60 000D6B80  7F 83 02 14 */	add r28, r3, r0
/* 800DAC64 000D6B84  38 7C 00 00 */	addi r3, r28, 0
/* 800DAC68 000D6B88  4B FF F4 19 */	bl __CARDAccess
/* 800DAC6C 000D6B8C  38 83 00 00 */	addi r4, r3, 0
/* 800DAC70 000D6B90  2C 04 FF F6 */	cmpwi r4, -10
/* 800DAC74 000D6B94  40 82 00 10 */	bne lbl_800DAC84
/* 800DAC78 000D6B98  7F 83 E3 78 */	mr r3, r28
/* 800DAC7C 000D6B9C  4B FF F4 91 */	bl __CARDIsPublic
/* 800DAC80 000D6BA0  7C 64 1B 78 */	mr r4, r3
lbl_800DAC84:
/* 800DAC84 000D6BA4  2C 04 00 00 */	cmpwi r4, 0
/* 800DAC88 000D6BA8  40 80 00 10 */	bge lbl_800DAC98
/* 800DAC8C 000D6BAC  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DAC90 000D6BB0  4B FF B5 F1 */	bl __CARDPutControlBlock
/* 800DAC94 000D6BB4  48 00 00 94 */	b lbl_800DAD28
lbl_800DAC98:
/* 800DAC98 000D6BB8  38 7E 00 00 */	addi r3, r30, 0
/* 800DAC9C 000D6BBC  38 9F 00 00 */	addi r4, r31, 0
/* 800DACA0 000D6BC0  4B FE 82 91 */	bl DCInvalidateRange
/* 800DACA4 000D6BC4  28 1B 00 00 */	cmplwi r27, 0
/* 800DACA8 000D6BC8  41 82 00 0C */	beq lbl_800DACB4
/* 800DACAC 000D6BCC  7F 60 DB 78 */	mr r0, r27
/* 800DACB0 000D6BD0  48 00 00 0C */	b lbl_800DACBC
lbl_800DACB4:
/* 800DACB4 000D6BD4  3C 60 80 0D */	lis r3, __CARDDefaultApiCallback@ha
/* 800DACB8 000D6BD8  38 03 51 C0 */	addi r0, r3, __CARDDefaultApiCallback@l
lbl_800DACBC:
/* 800DACBC 000D6BDC  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DACC0 000D6BE0  90 03 00 D0 */	stw r0, 0xd0(r3)
/* 800DACC4 000D6BE4  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DACC8 000D6BE8  80 9D 00 08 */	lwz r4, 8(r29)
/* 800DACCC 000D6BEC  80 A3 00 0C */	lwz r5, 0xc(r3)
/* 800DACD0 000D6BF0  38 05 FF FF */	addi r0, r5, -1
/* 800DACD4 000D6BF4  7C 88 00 38 */	and r8, r4, r0
/* 800DACD8 000D6BF8  7C 68 28 50 */	subf r3, r8, r5
/* 800DACDC 000D6BFC  7C 1F 18 00 */	cmpw r31, r3
/* 800DACE0 000D6C00  40 80 00 08 */	bge lbl_800DACE8
/* 800DACE4 000D6C04  7F E3 FB 78 */	mr r3, r31
lbl_800DACE8:
/* 800DACE8 000D6C08  A0 1D 00 10 */	lhz r0, 0x10(r29)
/* 800DACEC 000D6C0C  3C 80 80 0E */	lis r4, ReadCallback@ha
/* 800DACF0 000D6C10  3B E3 00 00 */	addi r31, r3, 0
/* 800DACF4 000D6C14  80 7D 00 00 */	lwz r3, 0(r29)
/* 800DACF8 000D6C18  7C 05 01 D6 */	mullw r0, r5, r0
/* 800DACFC 000D6C1C  38 E4 AA C8 */	addi r7, r4, ReadCallback@l
/* 800DAD00 000D6C20  38 BF 00 00 */	addi r5, r31, 0
/* 800DAD04 000D6C24  38 DE 00 00 */	addi r6, r30, 0
/* 800DAD08 000D6C28  7C 88 02 14 */	add r4, r8, r0
/* 800DAD0C 000D6C2C  4B FF CA ED */	bl __CARDRead
/* 800DAD10 000D6C30  7C 7D 1B 79 */	or. r29, r3, r3
/* 800DAD14 000D6C34  40 80 00 10 */	bge lbl_800DAD24
/* 800DAD18 000D6C38  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 800DAD1C 000D6C3C  7F A4 EB 78 */	mr r4, r29
/* 800DAD20 000D6C40  4B FF B5 61 */	bl __CARDPutControlBlock
lbl_800DAD24:
/* 800DAD24 000D6C44  7F A3 EB 78 */	mr r3, r29
lbl_800DAD28:
/* 800DAD28 000D6C48  BB 61 00 24 */	lmw r27, 0x24(r1)
/* 800DAD2C 000D6C4C  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800DAD30 000D6C50  38 21 00 38 */	addi r1, r1, 0x38
/* 800DAD34 000D6C54  7C 08 03 A6 */	mtlr r0
/* 800DAD38 000D6C58  4E 80 00 20 */	blr 

.global CARDCancel
CARDCancel:
/* 800DAD3C 000D6C5C  7C 08 02 A6 */	mflr r0
/* 800DAD40 000D6C60  90 01 00 04 */	stw r0, 4(r1)
/* 800DAD44 000D6C64  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DAD48 000D6C68  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DAD4C 000D6C6C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800DAD50 000D6C70  7C 7E 1B 78 */	mr r30, r3
/* 800DAD54 000D6C74  4B FE B3 69 */	bl OSDisableInterrupts
/* 800DAD58 000D6C78  80 1E 00 00 */	lwz r0, 0(r30)
/* 800DAD5C 000D6C7C  3C 80 80 2C */	lis r4, __CARDBlock@ha
/* 800DAD60 000D6C80  3B E0 00 00 */	li r31, 0
/* 800DAD64 000D6C84  1C A0 01 08 */	mulli r5, r0, 0x108
/* 800DAD68 000D6C88  38 04 7C 60 */	addi r0, r4, __CARDBlock@l
/* 800DAD6C 000D6C8C  7C 80 2A 14 */	add r4, r0, r5
/* 800DAD70 000D6C90  80 04 00 00 */	lwz r0, 0(r4)
/* 800DAD74 000D6C94  2C 00 00 00 */	cmpwi r0, 0
/* 800DAD78 000D6C98  40 82 00 0C */	bne lbl_800DAD84
/* 800DAD7C 000D6C9C  3B E0 FF FD */	li r31, -3
/* 800DAD80 000D6CA0  48 00 00 28 */	b lbl_800DADA8
lbl_800DAD84:
/* 800DAD84 000D6CA4  80 04 00 04 */	lwz r0, 4(r4)
/* 800DAD88 000D6CA8  2C 00 FF FF */	cmpwi r0, -1
/* 800DAD8C 000D6CAC  40 82 00 1C */	bne lbl_800DADA8
/* 800DAD90 000D6CB0  80 04 00 C0 */	lwz r0, 0xc0(r4)
/* 800DAD94 000D6CB4  7C 00 F0 40 */	cmplw r0, r30
/* 800DAD98 000D6CB8  40 82 00 10 */	bne lbl_800DADA8
/* 800DAD9C 000D6CBC  38 00 FF FF */	li r0, -1
/* 800DADA0 000D6CC0  90 1E 00 0C */	stw r0, 0xc(r30)
/* 800DADA4 000D6CC4  3B E0 FF F2 */	li r31, -14
lbl_800DADA8:
/* 800DADA8 000D6CC8  4B FE B3 3D */	bl OSRestoreInterrupts
/* 800DADAC 000D6CCC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DADB0 000D6CD0  7F E3 FB 78 */	mr r3, r31
/* 800DADB4 000D6CD4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DADB8 000D6CD8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800DADBC 000D6CDC  7C 08 03 A6 */	mtlr r0
/* 800DADC0 000D6CE0  38 21 00 18 */	addi r1, r1, 0x18
/* 800DADC4 000D6CE4  4E 80 00 20 */	blr 
