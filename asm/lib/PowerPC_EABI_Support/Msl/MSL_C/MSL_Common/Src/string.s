.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global strchr
strchr:
/* 80106888 001027A8  38 63 FF FF */	addi r3, r3, -1
/* 8010688C 001027AC  54 80 06 3E */	clrlwi r0, r4, 0x18
/* 80106890 001027B0  48 00 00 0C */	b lbl_8010689C
lbl_80106894:
/* 80106894 001027B4  7C 04 00 40 */	cmplw r4, r0
/* 80106898 001027B8  4D 82 00 20 */	beqlr 
lbl_8010689C:
/* 8010689C 001027BC  8C 83 00 01 */	lbzu r4, 1(r3)
/* 801068A0 001027C0  28 04 00 00 */	cmplwi r4, 0
/* 801068A4 001027C4  40 82 FF F0 */	bne lbl_80106894
/* 801068A8 001027C8  28 00 00 00 */	cmplwi r0, 0
/* 801068AC 001027CC  4D 82 00 20 */	beqlr 
/* 801068B0 001027D0  38 60 00 00 */	li r3, 0
/* 801068B4 001027D4  4E 80 00 20 */	blr 

.global strncmp
strncmp:
/* 801068B8 001027D8  38 63 FF FF */	addi r3, r3, -1
/* 801068BC 001027DC  38 84 FF FF */	addi r4, r4, -1
/* 801068C0 001027E0  38 C5 00 01 */	addi r6, r5, 1
/* 801068C4 001027E4  48 00 00 24 */	b lbl_801068E8
lbl_801068C8:
/* 801068C8 001027E8  8C 03 00 01 */	lbzu r0, 1(r3)
/* 801068CC 001027EC  8C A4 00 01 */	lbzu r5, 1(r4)
/* 801068D0 001027F0  7C 00 28 40 */	cmplw r0, r5
/* 801068D4 001027F4  41 82 00 0C */	beq lbl_801068E0
/* 801068D8 001027F8  7C 65 00 50 */	subf r3, r5, r0
/* 801068DC 001027FC  4E 80 00 20 */	blr 
lbl_801068E0:
/* 801068E0 00102800  28 00 00 00 */	cmplwi r0, 0
/* 801068E4 00102804  41 82 00 0C */	beq lbl_801068F0
lbl_801068E8:
/* 801068E8 00102808  34 C6 FF FF */	addic. r6, r6, -1
/* 801068EC 0010280C  40 82 FF DC */	bne lbl_801068C8
lbl_801068F0:
/* 801068F0 00102810  38 60 00 00 */	li r3, 0
/* 801068F4 00102814  4E 80 00 20 */	blr 

.global strcmp
strcmp:
/* 801068F8 00102818  88 C3 00 00 */	lbz r6, 0(r3)
/* 801068FC 0010281C  88 A4 00 00 */	lbz r5, 0(r4)
/* 80106900 00102820  7C 05 30 51 */	subf. r0, r5, r6
/* 80106904 00102824  41 82 00 0C */	beq lbl_80106910
/* 80106908 00102828  7C 65 30 50 */	subf r3, r5, r6
/* 8010690C 0010282C  4E 80 00 20 */	blr 
lbl_80106910:
/* 80106910 00102830  54 80 07 BE */	clrlwi r0, r4, 0x1e
/* 80106914 00102834  54 65 07 BE */	clrlwi r5, r3, 0x1e
/* 80106918 00102838  7C 00 28 40 */	cmplw r0, r5
/* 8010691C 0010283C  40 82 00 C8 */	bne lbl_801069E4
/* 80106920 00102840  28 05 00 00 */	cmplwi r5, 0
/* 80106924 00102844  41 82 00 58 */	beq lbl_8010697C
/* 80106928 00102848  28 06 00 00 */	cmplwi r6, 0
/* 8010692C 0010284C  40 82 00 0C */	bne lbl_80106938
/* 80106930 00102850  38 60 00 00 */	li r3, 0
/* 80106934 00102854  4E 80 00 20 */	blr 
lbl_80106938:
/* 80106938 00102858  20 05 00 03 */	subfic r0, r5, 3
/* 8010693C 0010285C  28 00 00 00 */	cmplwi r0, 0
/* 80106940 00102860  7C 09 03 A6 */	mtctr r0
/* 80106944 00102864  41 82 00 30 */	beq lbl_80106974
lbl_80106948:
/* 80106948 00102868  8C A3 00 01 */	lbzu r5, 1(r3)
/* 8010694C 0010286C  8C 04 00 01 */	lbzu r0, 1(r4)
/* 80106950 00102870  7C 00 28 51 */	subf. r0, r0, r5
/* 80106954 00102874  41 82 00 0C */	beq lbl_80106960
/* 80106958 00102878  7C 03 03 78 */	mr r3, r0
/* 8010695C 0010287C  4E 80 00 20 */	blr 
lbl_80106960:
/* 80106960 00102880  28 05 00 00 */	cmplwi r5, 0
/* 80106964 00102884  40 82 00 0C */	bne lbl_80106970
/* 80106968 00102888  38 60 00 00 */	li r3, 0
/* 8010696C 0010288C  4E 80 00 20 */	blr 
lbl_80106970:
/* 80106970 00102890  42 00 FF D8 */	bdnz lbl_80106948
lbl_80106974:
/* 80106974 00102894  38 63 00 01 */	addi r3, r3, 1
/* 80106978 00102898  38 84 00 01 */	addi r4, r4, 1
lbl_8010697C:
/* 8010697C 0010289C  80 E3 00 00 */	lwz r7, 0(r3)
/* 80106980 001028A0  80 CD 98 D4 */	lwz r6, K2-_SDA_BASE_(r13)
/* 80106984 001028A4  80 AD 98 D0 */	lwz r5, K1-_SDA_BASE_(r13)
/* 80106988 001028A8  7C 07 32 14 */	add r0, r7, r6
/* 8010698C 001028AC  81 04 00 00 */	lwz r8, 0(r4)
/* 80106990 001028B0  7C 00 28 39 */	and. r0, r0, r5
/* 80106994 001028B4  40 82 00 38 */	bne lbl_801069CC
/* 80106998 001028B8  48 00 00 18 */	b lbl_801069B0
lbl_8010699C:
/* 8010699C 001028BC  84 E3 00 04 */	lwzu r7, 4(r3)
/* 801069A0 001028C0  85 04 00 04 */	lwzu r8, 4(r4)
/* 801069A4 001028C4  7C 07 32 14 */	add r0, r7, r6
/* 801069A8 001028C8  7C 00 28 39 */	and. r0, r0, r5
/* 801069AC 001028CC  40 82 00 20 */	bne lbl_801069CC
lbl_801069B0:
/* 801069B0 001028D0  7C 07 40 40 */	cmplw r7, r8
/* 801069B4 001028D4  41 82 FF E8 */	beq lbl_8010699C
/* 801069B8 001028D8  40 81 00 0C */	ble lbl_801069C4
/* 801069BC 001028DC  38 60 00 01 */	li r3, 1
/* 801069C0 001028E0  4E 80 00 20 */	blr 
lbl_801069C4:
/* 801069C4 001028E4  38 60 FF FF */	li r3, -1
/* 801069C8 001028E8  4E 80 00 20 */	blr 
lbl_801069CC:
/* 801069CC 001028EC  88 C3 00 00 */	lbz r6, 0(r3)
/* 801069D0 001028F0  88 A4 00 00 */	lbz r5, 0(r4)
/* 801069D4 001028F4  7C 05 30 51 */	subf. r0, r5, r6
/* 801069D8 001028F8  41 82 00 0C */	beq lbl_801069E4
/* 801069DC 001028FC  7C 65 30 50 */	subf r3, r5, r6
/* 801069E0 00102900  4E 80 00 20 */	blr 
lbl_801069E4:
/* 801069E4 00102904  28 06 00 00 */	cmplwi r6, 0
/* 801069E8 00102908  40 82 00 0C */	bne lbl_801069F4
/* 801069EC 0010290C  38 60 00 00 */	li r3, 0
/* 801069F0 00102910  4E 80 00 20 */	blr 
lbl_801069F4:
/* 801069F4 00102914  8C A3 00 01 */	lbzu r5, 1(r3)
/* 801069F8 00102918  8C 04 00 01 */	lbzu r0, 1(r4)
/* 801069FC 0010291C  7C 00 28 51 */	subf. r0, r0, r5
/* 80106A00 00102920  41 82 00 0C */	beq lbl_80106A0C
/* 80106A04 00102924  7C 03 03 78 */	mr r3, r0
/* 80106A08 00102928  4E 80 00 20 */	blr 
lbl_80106A0C:
/* 80106A0C 0010292C  28 05 00 00 */	cmplwi r5, 0
/* 80106A10 00102930  40 82 FF E4 */	bne lbl_801069F4
/* 80106A14 00102934  38 60 00 00 */	li r3, 0
/* 80106A18 00102938  4E 80 00 20 */	blr 

.global strncat
strncat:
/* 80106A1C 0010293C  38 84 FF FF */	addi r4, r4, -1
/* 80106A20 00102940  38 C3 FF FF */	addi r6, r3, -1
lbl_80106A24:
/* 80106A24 00102944  8C 06 00 01 */	lbzu r0, 1(r6)
/* 80106A28 00102948  28 00 00 00 */	cmplwi r0, 0
/* 80106A2C 0010294C  40 82 FF F8 */	bne lbl_80106A24
/* 80106A30 00102950  38 C6 FF FF */	addi r6, r6, -1
/* 80106A34 00102954  38 A5 00 01 */	addi r5, r5, 1
/* 80106A38 00102958  48 00 00 1C */	b lbl_80106A54
lbl_80106A3C:
/* 80106A3C 0010295C  8C 04 00 01 */	lbzu r0, 1(r4)
/* 80106A40 00102960  28 00 00 00 */	cmplwi r0, 0
/* 80106A44 00102964  9C 06 00 01 */	stbu r0, 1(r6)
/* 80106A48 00102968  40 82 00 0C */	bne lbl_80106A54
/* 80106A4C 0010296C  38 C6 FF FF */	addi r6, r6, -1
/* 80106A50 00102970  48 00 00 0C */	b lbl_80106A5C
lbl_80106A54:
/* 80106A54 00102974  34 A5 FF FF */	addic. r5, r5, -1
/* 80106A58 00102978  40 82 FF E4 */	bne lbl_80106A3C
lbl_80106A5C:
/* 80106A5C 0010297C  38 00 00 00 */	li r0, 0
/* 80106A60 00102980  98 06 00 01 */	stb r0, 1(r6)
/* 80106A64 00102984  4E 80 00 20 */	blr 

.global strncpy
strncpy:
/* 80106A68 00102988  38 84 FF FF */	addi r4, r4, -1
/* 80106A6C 0010298C  38 C3 FF FF */	addi r6, r3, -1
/* 80106A70 00102990  38 A5 00 01 */	addi r5, r5, 1
/* 80106A74 00102994  48 00 00 2C */	b lbl_80106AA0
lbl_80106A78:
/* 80106A78 00102998  8C 04 00 01 */	lbzu r0, 1(r4)
/* 80106A7C 0010299C  28 00 00 00 */	cmplwi r0, 0
/* 80106A80 001029A0  9C 06 00 01 */	stbu r0, 1(r6)
/* 80106A84 001029A4  40 82 00 1C */	bne lbl_80106AA0
/* 80106A88 001029A8  38 00 00 00 */	li r0, 0
/* 80106A8C 001029AC  48 00 00 08 */	b lbl_80106A94
lbl_80106A90:
/* 80106A90 001029B0  9C 06 00 01 */	stbu r0, 1(r6)
lbl_80106A94:
/* 80106A94 001029B4  34 A5 FF FF */	addic. r5, r5, -1
/* 80106A98 001029B8  40 82 FF F8 */	bne lbl_80106A90
/* 80106A9C 001029BC  4E 80 00 20 */	blr 
lbl_80106AA0:
/* 80106AA0 001029C0  34 A5 FF FF */	addic. r5, r5, -1
/* 80106AA4 001029C4  40 82 FF D4 */	bne lbl_80106A78
/* 80106AA8 001029C8  4E 80 00 20 */	blr 

.global strcpy
strcpy:
/* 80106AAC 001029CC  54 60 07 BE */	clrlwi r0, r3, 0x1e
/* 80106AB0 001029D0  54 85 07 BE */	clrlwi r5, r4, 0x1e
/* 80106AB4 001029D4  7C 00 28 40 */	cmplw r0, r5
/* 80106AB8 001029D8  38 E3 00 00 */	addi r7, r3, 0
/* 80106ABC 001029DC  40 82 00 80 */	bne lbl_80106B3C
/* 80106AC0 001029E0  28 05 00 00 */	cmplwi r5, 0
/* 80106AC4 001029E4  41 82 00 40 */	beq lbl_80106B04
/* 80106AC8 001029E8  88 04 00 00 */	lbz r0, 0(r4)
/* 80106ACC 001029EC  28 00 00 00 */	cmplwi r0, 0
/* 80106AD0 001029F0  98 07 00 00 */	stb r0, 0(r7)
/* 80106AD4 001029F4  4D 82 00 20 */	beqlr 
/* 80106AD8 001029F8  20 05 00 03 */	subfic r0, r5, 3
/* 80106ADC 001029FC  28 00 00 00 */	cmplwi r0, 0
/* 80106AE0 00102A00  7C 09 03 A6 */	mtctr r0
/* 80106AE4 00102A04  41 82 00 18 */	beq lbl_80106AFC
lbl_80106AE8:
/* 80106AE8 00102A08  8C 04 00 01 */	lbzu r0, 1(r4)
/* 80106AEC 00102A0C  28 00 00 00 */	cmplwi r0, 0
/* 80106AF0 00102A10  9C 07 00 01 */	stbu r0, 1(r7)
/* 80106AF4 00102A14  4D 82 00 20 */	beqlr 
/* 80106AF8 00102A18  42 00 FF F0 */	bdnz lbl_80106AE8
lbl_80106AFC:
/* 80106AFC 00102A1C  38 E7 00 01 */	addi r7, r7, 1
/* 80106B00 00102A20  38 84 00 01 */	addi r4, r4, 1
lbl_80106B04:
/* 80106B04 00102A24  80 A4 00 00 */	lwz r5, 0(r4)
/* 80106B08 00102A28  80 0D 98 D4 */	lwz r0, K2-_SDA_BASE_(r13)
/* 80106B0C 00102A2C  80 CD 98 D0 */	lwz r6, K1-_SDA_BASE_(r13)
/* 80106B10 00102A30  39 05 00 00 */	addi r8, r5, 0
/* 80106B14 00102A34  7C A5 02 14 */	add r5, r5, r0
/* 80106B18 00102A38  7C A5 30 39 */	and. r5, r5, r6
/* 80106B1C 00102A3C  40 82 00 20 */	bne lbl_80106B3C
/* 80106B20 00102A40  38 E7 FF FC */	addi r7, r7, -4
lbl_80106B24:
/* 80106B24 00102A44  95 07 00 04 */	stwu r8, 4(r7)
/* 80106B28 00102A48  85 04 00 04 */	lwzu r8, 4(r4)
/* 80106B2C 00102A4C  7C A8 02 14 */	add r5, r8, r0
/* 80106B30 00102A50  7C A5 30 39 */	and. r5, r5, r6
/* 80106B34 00102A54  41 82 FF F0 */	beq lbl_80106B24
/* 80106B38 00102A58  38 E7 00 04 */	addi r7, r7, 4
lbl_80106B3C:
/* 80106B3C 00102A5C  88 04 00 00 */	lbz r0, 0(r4)
/* 80106B40 00102A60  28 00 00 00 */	cmplwi r0, 0
/* 80106B44 00102A64  98 07 00 00 */	stb r0, 0(r7)
/* 80106B48 00102A68  4D 82 00 20 */	beqlr 
lbl_80106B4C:
/* 80106B4C 00102A6C  8C 04 00 01 */	lbzu r0, 1(r4)
/* 80106B50 00102A70  28 00 00 00 */	cmplwi r0, 0
/* 80106B54 00102A74  9C 07 00 01 */	stbu r0, 1(r7)
/* 80106B58 00102A78  40 82 FF F4 */	bne lbl_80106B4C
/* 80106B5C 00102A7C  4E 80 00 20 */	blr 

.global strlen
strlen:
/* 80106B60 00102A80  38 80 FF FF */	li r4, -1
/* 80106B64 00102A84  38 63 FF FF */	addi r3, r3, -1
lbl_80106B68:
/* 80106B68 00102A88  8C 03 00 01 */	lbzu r0, 1(r3)
/* 80106B6C 00102A8C  38 84 00 01 */	addi r4, r4, 1
/* 80106B70 00102A90  28 00 00 00 */	cmplwi r0, 0
/* 80106B74 00102A94  40 82 FF F4 */	bne lbl_80106B68
/* 80106B78 00102A98  7C 83 23 78 */	mr r3, r4
/* 80106B7C 00102A9C  4E 80 00 20 */	blr 
/* 80106B80 00102AA0  38 60 00 00 */	li r3, 0
/* 80106B84 00102AA4  4E 80 00 20 */	blr 
/* 80106B88 00102AA8  7C 08 02 A6 */	mflr r0
/* 80106B8C 00102AAC  38 60 00 00 */	li r3, 0
/* 80106B90 00102AB0  90 01 00 04 */	stw r0, 4(r1)
/* 80106B94 00102AB4  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 80106B98 00102AB8  93 E1 00 24 */	stw r31, 0x24(r1)
/* 80106B9C 00102ABC  3B E5 00 00 */	addi r31, r5, 0
/* 80106BA0 00102AC0  93 C1 00 20 */	stw r30, 0x20(r1)
/* 80106BA4 00102AC4  3B C4 00 00 */	addi r30, r4, 0
/* 80106BA8 00102AC8  80 0D A5 E8 */	lwz r0, initialized_60-_SDA_BASE_(r13)
/* 80106BAC 00102ACC  2C 00 00 00 */	cmpwi r0, 0
/* 80106BB0 00102AD0  40 82 00 20 */	bne lbl_80106BD0
/* 80106BB4 00102AD4  3C 60 00 01 */	lis r3, 0x0000E100@ha
/* 80106BB8 00102AD8  38 63 E1 00 */	addi r3, r3, 0x0000E100@l
/* 80106BBC 00102ADC  4B FC 31 E5 */	bl InitializeUART
/* 80106BC0 00102AE0  2C 03 00 00 */	cmpwi r3, 0
/* 80106BC4 00102AE4  40 82 00 0C */	bne lbl_80106BD0
/* 80106BC8 00102AE8  38 00 00 01 */	li r0, 1
/* 80106BCC 00102AEC  90 0D A5 E8 */	stw r0, initialized_60-_SDA_BASE_(r13)
lbl_80106BD0:
/* 80106BD0 00102AF0  2C 03 00 00 */	cmpwi r3, 0
/* 80106BD4 00102AF4  41 82 00 0C */	beq lbl_80106BE0
/* 80106BD8 00102AF8  38 60 00 01 */	li r3, 1
/* 80106BDC 00102AFC  48 00 00 2C */	b lbl_80106C08
lbl_80106BE0:
/* 80106BE0 00102B00  7F C3 F3 78 */	mr r3, r30
/* 80106BE4 00102B04  80 9F 00 00 */	lwz r4, 0(r31)
/* 80106BE8 00102B08  4B FC 32 09 */	bl WriteUARTN
/* 80106BEC 00102B0C  2C 03 00 00 */	cmpwi r3, 0
/* 80106BF0 00102B10  41 82 00 14 */	beq lbl_80106C04
/* 80106BF4 00102B14  38 00 00 00 */	li r0, 0
/* 80106BF8 00102B18  90 1F 00 00 */	stw r0, 0(r31)
/* 80106BFC 00102B1C  38 60 00 01 */	li r3, 1
/* 80106C00 00102B20  48 00 00 08 */	b lbl_80106C08
lbl_80106C04:
/* 80106C04 00102B24  38 60 00 00 */	li r3, 0
lbl_80106C08:
/* 80106C08 00102B28  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 80106C0C 00102B2C  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 80106C10 00102B30  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 80106C14 00102B34  7C 08 03 A6 */	mtlr r0
/* 80106C18 00102B38  38 21 00 28 */	addi r1, r1, 0x28
/* 80106C1C 00102B3C  4E 80 00 20 */	blr 
/* 80106C20 00102B40  7C 08 02 A6 */	mflr r0
/* 80106C24 00102B44  38 60 00 00 */	li r3, 0
/* 80106C28 00102B48  90 01 00 04 */	stw r0, 4(r1)
/* 80106C2C 00102B4C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80106C30 00102B50  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80106C34 00102B54  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80106C38 00102B58  3B C5 00 00 */	addi r30, r5, 0
/* 80106C3C 00102B5C  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80106C40 00102B60  3B A4 00 00 */	addi r29, r4, 0
/* 80106C44 00102B64  80 0D A5 E8 */	lwz r0, initialized_60-_SDA_BASE_(r13)
/* 80106C48 00102B68  2C 00 00 00 */	cmpwi r0, 0
/* 80106C4C 00102B6C  40 82 00 20 */	bne lbl_80106C6C
/* 80106C50 00102B70  3C 60 00 01 */	lis r3, 0x0000E100@ha
/* 80106C54 00102B74  38 63 E1 00 */	addi r3, r3, 0x0000E100@l
/* 80106C58 00102B78  4B FC 31 49 */	bl InitializeUART
/* 80106C5C 00102B7C  2C 03 00 00 */	cmpwi r3, 0
/* 80106C60 00102B80  40 82 00 0C */	bne lbl_80106C6C
/* 80106C64 00102B84  38 00 00 01 */	li r0, 1
/* 80106C68 00102B88  90 0D A5 E8 */	stw r0, initialized_60-_SDA_BASE_(r13)
lbl_80106C6C:
/* 80106C6C 00102B8C  2C 03 00 00 */	cmpwi r3, 0
/* 80106C70 00102B90  41 82 00 0C */	beq lbl_80106C7C
/* 80106C74 00102B94  38 60 00 01 */	li r3, 1
/* 80106C78 00102B98  48 00 00 6C */	b lbl_80106CE4
lbl_80106C7C:
/* 80106C7C 00102B9C  83 FE 00 00 */	lwz r31, 0(r30)
/* 80106C80 00102BA0  38 00 00 00 */	li r0, 0
/* 80106C84 00102BA4  38 60 00 00 */	li r3, 0
/* 80106C88 00102BA8  90 1E 00 00 */	stw r0, 0(r30)
/* 80106C8C 00102BAC  48 00 00 2C */	b lbl_80106CB8
lbl_80106C90:
/* 80106C90 00102BB0  38 7D 00 00 */	addi r3, r29, 0
/* 80106C94 00102BB4  38 80 00 01 */	li r4, 1
/* 80106C98 00102BB8  4B FC 31 51 */	bl ReadUARTN
/* 80106C9C 00102BBC  80 9E 00 00 */	lwz r4, 0(r30)
/* 80106CA0 00102BC0  38 04 00 01 */	addi r0, r4, 1
/* 80106CA4 00102BC4  90 1E 00 00 */	stw r0, 0(r30)
/* 80106CA8 00102BC8  88 1D 00 00 */	lbz r0, 0(r29)
/* 80106CAC 00102BCC  28 00 00 0D */	cmplwi r0, 0xd
/* 80106CB0 00102BD0  41 82 00 1C */	beq lbl_80106CCC
/* 80106CB4 00102BD4  3B BD 00 01 */	addi r29, r29, 1
lbl_80106CB8:
/* 80106CB8 00102BD8  80 1E 00 00 */	lwz r0, 0(r30)
/* 80106CBC 00102BDC  7C 00 F8 40 */	cmplw r0, r31
/* 80106CC0 00102BE0  41 81 00 0C */	bgt lbl_80106CCC
/* 80106CC4 00102BE4  2C 03 00 00 */	cmpwi r3, 0
/* 80106CC8 00102BE8  41 82 FF C8 */	beq lbl_80106C90
lbl_80106CCC:
/* 80106CCC 00102BEC  2C 03 00 00 */	cmpwi r3, 0
/* 80106CD0 00102BF0  40 82 00 0C */	bne lbl_80106CDC
/* 80106CD4 00102BF4  38 00 00 00 */	li r0, 0
/* 80106CD8 00102BF8  48 00 00 08 */	b lbl_80106CE0
lbl_80106CDC:
/* 80106CDC 00102BFC  38 00 00 01 */	li r0, 1
lbl_80106CE0:
/* 80106CE0 00102C00  54 03 06 3E */	clrlwi r3, r0, 0x18
lbl_80106CE4:
/* 80106CE4 00102C04  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80106CE8 00102C08  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80106CEC 00102C0C  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80106CF0 00102C10  7C 08 03 A6 */	mtlr r0
/* 80106CF4 00102C14  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80106CF8 00102C18  38 21 00 30 */	addi r1, r1, 0x30
/* 80106CFC 00102C1C  4E 80 00 20 */	blr 
