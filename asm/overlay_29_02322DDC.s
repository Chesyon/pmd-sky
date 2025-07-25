	.include "asm/macros.inc"
	.include "overlay_29_02322DDC.inc"

	.text

	arm_func_start ov29_02322DDC
ov29_02322DDC: ; 0x02322DDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0
	mov r8, r2
	mov r5, r4
	mov sl, r0
	mov sb, r1
	mov fp, r3
	ldr r7, [sp, #0x28]
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r5, #1
	cmp r8, #0
	beq _02322ED0
	mov r6, #0
	b _02322E38
_02322E18:
	ldr r0, [fp, r6, lsl #2]
	cmp r0, #0
	beq _02322E40
	bl ShouldDisplayEntityWrapper
	cmp r0, #0
	movne r5, #1
	bne _02322E40
	add r6, r6, #1
_02322E38:
	cmp r6, #0x41
	blt _02322E18
_02322E40:
	cmp r5, #0
	beq _02322E94
	bl ov29_0234B034
	mov r1, #0
	str r1, [sp]
	ldr r2, [sl, #0xb4]
	mov r3, r1
	bl ov29_0230040C
	cmp r7, #0
	bne _02322E80
	bl ov29_0234B034
	mov r1, #0
	mov r2, sb
	mov r3, r1
	bl FormatMoveStringMore
	b _02322EAC
_02322E80:
	mov r0, r7, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, #0
	bl ov29_0234B084
	b _02322EAC
_02322E94:
	cmp r7, #0
	beq _02322EAC
	mov r0, r7, lsl #0x10
	mov r1, r0, asr #0x10
	mov r0, #0
	bl ov29_0234B084
_02322EAC:
	ldrh r1, [sb, #4]
	ldr r0, _02322F74 ; =0x00000163
	cmp r1, r0
	mov r0, sl
	mov r1, r8
	beq _02322ECC
	bl LogMessageWithPopup
	b _02322ED0
_02322ECC:
	bl LogMessageQuiet
_02322ED0:
	cmp r5, #0
	beq _02322F5C
	ldrb r0, [sp, #0x2c]
	mov r1, sb
	cmp r0, #0
	mov r0, sl
	beq _02322EF8
	mov r2, #1
	bl ov29_02324E78
	b _02322F00
_02322EF8:
	mov r2, #0
	bl ov29_02324E78
_02322F00:
	mov r4, r0
	ldrh r0, [sb, #4]
	cmp r0, #0xfe
	bne _02322F24
	mov r0, sl
	bl EntityIsValid__02321438
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sl, #0xaf]
_02322F24:
	ldrh r0, [sb, #4]
	bl ov10_022BFDAC
	cmp r0, #0
	beq _02322F4C
	ldr r1, [sl, #0xb4]
	mov r0, sl
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
	mov r0, #1
	bl AnimationDelayOrSomething
_02322F4C:
	mov r0, sl
	mov r1, sb
	bl ov29_023250D4
	b _02322F6C
_02322F5C:
	ldr r1, [sl, #0xb4]
	mov r0, sl
	ldrb r1, [r1, #0x4c]
	bl ov29_02304A48
_02322F6C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_02322F74: .word 0x00000163
	arm_func_end ov29_02322DDC

	arm_func_start ov29_02322F78
ov29_02322F78: ; 0x02322F78
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	ldr r4, _023230F4 ; =DUNGEON_PTR
	mov r7, r0
	ldr r0, [r4]
	mov r6, r1
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	mov r5, r2
	mov r8, r3
	cmp r0, #0
	ldr r4, [r7, #0xb4]
	mvnne r0, #0
	bne _023230EC
	ldrsh r0, [r4, #4]
	bl GetBodySize
	cmp r0, #4
	blo _02322FC8
	cmp r8, #1
	beq _023230E8
_02322FC8:
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r5, #4]
	mov r2, #1
	bl GetMoveAnimationId
	bl GetMoveAnimation
	ldrsh r0, [r0, #6]
	ldrsh r3, [r6, #2]
	mov r1, #0x18
	ldrsh r2, [r6]
	smulbb r3, r3, r1
	smulbb r2, r2, r1
	add r3, r3, #0x10
	add r2, r2, #0xc
	mov r6, r3, lsl #8
	mov r2, r2, lsl #8
	mov r3, r2, asr #8
	mov r2, r6, asr #8
	strh r3, [sp]
	strh r2, [sp, #2]
	cmp r0, #0
	beq _023230E0
	mov r0, #0x5e
	bl AdvanceFrame
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r5, #4]
	mov r2, #1
	bl GetMoveAnimationId
	mov r1, r0
	ldrsh r0, [r4, #4]
	bl ov10_022BF01C
	mov r2, r0
	mvn r0, #0
	cmp r2, r0
	ldreq r0, _023230F8 ; =ov29_02352A54
	ldreqh r1, [r0]
	streqh r1, [sp, #0xc]
	ldreqh r0, [r0, #2]
	streqh r0, [sp, #0xe]
	beq _02323084
	add r0, sp, #0xc
	add r1, r7, #0x2c
	and r2, r2, #0xff
	bl sub_0201CF90
_02323084:
	mov r0, r7
	bl GetApparentWeather
	mov r1, r0
	ldrh r0, [r5, #4]
	mov r2, #1
	bl GetMoveAnimationId
	strh r0, [sp, #4]
	ldrsh r2, [r4, #4]
	add r0, sp, #4
	add r1, sp, #0
	strh r2, [sp, #6]
	ldr r3, [r7, #0xc]
	mov r2, #0
	mov r3, r3, asr #8
	strh r3, [sp, #8]
	ldr r3, [r7, #0x10]
	mov r3, r3, asr #8
	strh r3, [sp, #0xa]
	ldrb r3, [r4, #0x4c]
	str r3, [sp, #0x10]
	str r2, [sp, #0x14]
	bl ov10_022BE9E8
	b _023230EC
_023230E0:
	sub r0, r1, #0x19
	b _023230EC
_023230E8:
	mvn r0, #0
_023230EC:
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_023230F4: .word DUNGEON_PTR
_023230F8: .word ov29_02352A54
	arm_func_end ov29_02322F78

	arm_func_start ov29_023230FC
ov29_023230FC: ; 0x023230FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc0
	ldr r4, _023238F4 ; =ov29_02352A54
	mov r8, r0
	mov r0, #0
	str r0, [sp, #0x88]
	ldr r0, [r4, #4]
	mov r7, r1
	ldr r1, [r4, #8]
	str r0, [sp, #0xb0]
	str r1, [sp, #0xb4]
	ldr r1, [sp, #0x88]
	ldrh r0, [r7, #4]
	mov r6, r2
	mov fp, r3
	str r1, [sp, #0x84]
	mov r5, r1
	ldr sb, [r8, #0xb4]
	bl GetMoveAnimationSpeed
	cmp r0, #1
	moveq sl, #2
	beq _02323160
	cmp r0, #2
	moveq sl, #3
	movne sl, #6
_02323160:
	ldrsh r2, [r8, #4]
	ldr r0, _023238F8 ; =DIRECTIONS_XY
	ldr r1, _023238FC ; =DIRECTIONS_XY + 2
	strh r2, [sp, #0xbc]
	ldrsh r2, [r8, #6]
	mov r4, #0
	strh r2, [sp, #0xbe]
	ldrb r2, [sb, #0x4c]
	mov r2, r2, lsl #2
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x6c]
	ldrsh r0, [r1, r2]
	str r0, [sp, #0x68]
	b _02323214
_02323198:
	ldrsh r2, [sp, #0xbc]
	cmp r2, #0
	ldrgesh r1, [sp, #0xbe]
	cmpge r1, #0
	blt _0232321C
	cmp r2, #0x38
	cmplt r1, #0x20
	bge _0232321C
	ldr r0, [sp, #0x6c]
	add r0, r2, r0
	strh r0, [sp, #0xbc]
	ldr r0, [sp, #0x68]
	add r0, r1, r0
	strh r0, [sp, #0xbe]
	ldr r0, [sp, #0x84]
	ldrsh r1, [sp, #0xbe]
	add r0, r0, #1
	str r0, [sp, #0x84]
	ldrsh r0, [sp, #0xbc]
	bl GetTile
	ldrh r1, [r0]
	tst r1, #3
	beq _0232321C
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _02323210
	ldr r0, [r1]
	cmp r0, #1
	moveq r5, r1
	beq _0232321C
_02323210:
	add r4, r4, #1
_02323214:
	cmp r4, r6
	blt _02323198
_0232321C:
	mov r0, r8
	ldrh r1, [r7, #4]
	bl ov29_02324D60
	cmp r0, #0
	beq _02323250
	mov r0, r8
	mov r1, r7
	bl IsChargingTwoTurnMove
	cmp r0, #0
	mvneq r0, #0
	streq r0, [sp, #0xb0]
	streq r0, [sp, #0xb4]
	beq _023232E4
_02323250:
	mov r0, r8
	add r1, sp, #0xbc
	mov r2, r7
	mov r3, r6
	bl ov29_02322F78
	str r0, [sp, #0xb0]
	ldrb r0, [sp, #0xf0]
	cmp r0, #0
	beq _023232E4
	cmp r5, #0
	mvneq r0, #0
	streq r0, [sp, #0xb4]
	beq _023232E4
	ldrsh r2, [r8, #4]
	mov r0, r5
	add r1, sp, #0xb8
	strh r2, [sp, #0xb8]
	ldrsh r4, [r8, #6]
	mov r2, r7
	mov r3, r6
	strh r4, [sp, #0xba]
	bl ov29_02322F78
	ldrsh r2, [r5, #4]
	str r0, [sp, #0xb4]
	ldr r0, _023238F8 ; =DIRECTIONS_XY
	strh r2, [sp, #0xb8]
	ldrsh r2, [r5, #6]
	ldr r1, _023238FC ; =DIRECTIONS_XY + 2
	strh r2, [sp, #0xba]
	ldrb r2, [sb, #0x4c]
	add r2, r2, #4
	mov r2, r2, lsl #0x1d
	mov r2, r2, lsr #0x1b
	ldrsh r0, [r0, r2]
	str r0, [sp, #0x64]
	ldrsh r0, [r1, r2]
	str r0, [sp, #0x60]
_023232E4:
	ldrsh r0, [r8, #4]
	ldr r5, _02323900 ; =ov29_0235175C
	ldr r3, _023238F8 ; =DIRECTIONS_XY
	strh r0, [sp, #0xbc]
	ldrsh r1, [r8, #6]
	ldr r2, _023238FC ; =DIRECTIONS_XY + 2
	mov r0, #0x18
	strh r1, [sp, #0xbe]
	ldrb r1, [sb, #0x4c]
	str r1, [sp, #0x1c]
	ldr r4, [sp, #0x1c]
	mov r1, sl
	ldr r4, [r5, r4, lsl #2]
	str r4, [sp, #0x7c]
	ldr r4, [sp, #0x1c]
	mov r4, r4, lsl #2
	ldrsh r3, [r3, r4]
	ldrsh r2, [r2, r4]
	str r3, [sp, #0x10]
	str r2, [sp, #0xc]
	bl _s32_div_f
	ldr r2, [sp, #0x84]
	str r0, [sp, #0x18]
	mul r1, r2, r0
	cmp r6, #2
	blt _0232335C
	add r4, r1, #8
	cmp r4, #0x40
	movge r4, #0x40
	b _02323360
_0232335C:
	mov r4, #0x20
_02323360:
	mov r0, #0x80000
	mov sb, #0
	bl _s32_div_f
	str r0, [sp, #0x80]
	mov r0, #1
	bl ov29_0234B4CC
	mov r1, sb
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x10]
	mov r0, sl, lsl #8
	mul r2, r1, r0
	ldr r1, [sp, #0xc]
	str r2, [sp, #0x2c]
	mul r2, r1, r0
	ldr r1, [sp, #0x64]
	str r2, [sp, #0x28]
	mul r2, r1, r0
	ldr r1, [sp, #0x60]
	str r2, [sp, #0x48]
	mul r0, r1, r0
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x7c]
	ldr r1, _02323904 ; =0x00000FFF
	add r3, r0, #0xc00
	add r2, r0, #0x1400
	mov r0, r4, asr #1
	str r0, [sp, #0x3c]
	and r0, r3, r1
	str r0, [sp, #0x40]
	and r0, r2, r1
	str r0, [sp, #0x30]
	rsb r0, r4, #0
	str r0, [sp, #0x34]
	ldr r1, _02323908 ; =ov29_02352A6C
	ldr r0, [sp, #0x1c]
	ldr r5, [sp, #0xb4]
	ldr r0, [r1, r0, lsl #2]
	str r0, [sp, #0x38]
	b _02323824
_023233FC:
	ldrsh r1, [sp, #0xbc]
	cmp r1, #0
	ldrgesh r2, [sp, #0xbe]
	cmpge r2, #0
	blt _02323830
	cmp r1, #0x38
	cmplt r2, #0x20
	bge _02323830
	ldr r0, [sp, #0x10]
	ldrh r3, [sp, #0xbc]
	add r1, r1, r0
	ldr r0, [sp, #0xc]
	cmp r5, #0
	add r0, r2, r0
	ldrh r2, [sp, #0xbe]
	strh r3, [sp, #0xa0]
	strh r1, [sp, #0xbc]
	strh r2, [sp, #0xa2]
	strh r0, [sp, #0xbe]
	blt _0232347C
	ldrh r0, [sp, #0xba]
	ldrh r2, [sp, #0xb8]
	ldrsh r1, [sp, #0xb8]
	strh r0, [sp, #0xa6]
	ldr r0, [sp, #0x64]
	strh r2, [sp, #0xa4]
	add r0, r1, r0
	strh r0, [sp, #0xb8]
	ldrsh r1, [sp, #0xba]
	ldr r0, [sp, #0x60]
	add r0, r1, r0
	strh r0, [sp, #0xba]
_0232347C:
	add r0, sp, #0xbc
	bl ov29_022E2CA0
	cmp r0, #0
	beq _02323740
	ldr r0, _0232390C ; =DUNGEON_PTR
	ldr r0, [r0]
	add r0, r0, #0x1a000
#ifdef JAPAN
	ldrb r0, [r0, #0x19a]
#else
	ldrb r0, [r0, #0x23e]
#endif
	cmp r0, #0
	bne _02323740
	ldrsh r0, [sp, #0xa0]
	mov r1, #0x18
	ldrsh r2, [sp, #0xa2]
	smulbb r0, r0, r1
	add r0, r0, #0xc
	mov r0, r0, lsl #8
	str r0, [sp, #0x5c]
	smulbb r0, r2, r1
	add r0, r0, #0x10
	cmp r5, #0
	mov sl, r0, lsl #8
	blt _0232350C
	ldrsh r3, [sp, #0xa4]
	ldr r0, [sp, #0x48]
	ldrsh r2, [sp, #0xa6]
	str r0, [sp, #0x24]
	smulbb r0, r3, r1
	add r0, r0, #0xc
	mov r0, r0, lsl #8
	smulbb r1, r2, r1
	str r0, [sp, #0x58]
	add r0, r1, #0x10
	mov r0, r0, lsl #8
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x20]
_0232350C:
	mov r0, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0xb0]
	str r0, [sp, #0x8c]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x90]
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	str r0, [sp, #0x94]
	b _0232372C
_02323538:
	ldr r0, [sp, #0x8c]
	cmp r0, #0
	blt _02323600
	cmp fp, #1
	bne _02323564
	mov r0, sb, asr #8
	bl sub_020018D0
	mul r0, r4, r0
	str r0, [sp, #0x50]
	mov r2, #0
	b _023235B4
_02323564:
	cmp fp, #2
	movne r0, #0
	strne r0, [sp, #0x50]
	movne r2, r0
	bne _023235B4
	mov r0, sb, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x3c]
	mul r0, r1, r0
	mov r0, r0, asr #8
	str r0, [sp, #0x74]
	ldr r0, [sp, #0x40]
	bl sub_020018D0
	ldr r1, [sp, #0x74]
	mul r0, r1, r0
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x40]
	bl sub_02001980
	ldr r1, [sp, #0x74]
	mul r2, r1, r0
_023235B4:
	ldr r0, [sp, #0x5c]
	add r1, sp, #0x9c
	add r0, r0, r2
	mov r0, r0, asr #8
	strh r0, [sp, #0x9c]
	ldr r0, [sp, #0x50]
	ldr r2, _0232390C ; =DUNGEON_PTR
	sub r0, sl, r0
	mov r0, r0, asr #8
	ldr r3, [r2]
	strh r0, [sp, #0x9e]
	ldr r2, _02323910 ; =0x0001A226
	ldr r0, [sp, #0x90]
	ldrsh r2, [r3, r2]
	rsb r2, r2, sl, asr #8
	add r3, r2, r2, lsr #31
	ldr r2, [sp, #0x38]
	add r2, r2, r3, asr #1
	bl ov10_022BEB2C
_02323600:
	cmp r5, #0
	blt _023236D0
	cmp fp, #1
	bne _0232362C
	mov r0, sb, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x34]
	mov r2, #0
	mul r0, r1, r0
	str r0, [sp, #0x4c]
	b _0232367C
_0232362C:
	cmp fp, #2
	movne r2, #0
	movne r0, r2
	strne r0, [sp, #0x4c]
	bne _0232367C
	mov r0, sb, asr #8
	bl sub_020018D0
	ldr r1, [sp, #0x3c]
	mul r0, r1, r0
	mov r0, r0, asr #8
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x30]
	bl sub_020018D0
	ldr r1, [sp, #0x70]
	mul r0, r1, r0
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x30]
	bl sub_02001980
	ldr r1, [sp, #0x70]
	mul r2, r1, r0
_0232367C:
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x54]
	add r0, r0, r2
	mov r0, r0, asr #8
	strh r0, [sp, #0x98]
	ldr r0, [sp, #0x4c]
	ldr r2, _0232390C ; =DUNGEON_PTR
	sub r0, r1, r0
	mov r0, r0, asr #8
	ldr r3, [r2]
	strh r0, [sp, #0x9a]
	ldr r2, _02323910 ; =0x0001A226
	ldr r0, [sp, #0x94]
	ldrsh r3, [r3, r2]
	ldr r2, [sp, #0x54]
	add r1, sp, #0x98
	rsb r2, r3, r2, asr #8
	add r3, r2, r2, lsr #31
	ldr r2, [sp, #0x38]
	add r2, r2, r3, asr #1
	bl ov10_022BEB2C
_023236D0:
	mov r0, #0x30
	bl AdvanceFrame
	ldr r1, [sp, #0x5c]
	ldr r0, [sp, #0x2c]
	cmp r5, #0
	add r0, r1, r0
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x28]
	add sl, sl, r0
	blt _02323718
	ldr r1, [sp, #0x58]
	ldr r0, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x58]
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0x20]
	add r0, r1, r0
	str r0, [sp, #0x54]
_02323718:
	ldr r0, [sp, #0x80]
	add sb, sb, r0
	ldr r0, [sp, #0x78]
	add r0, r0, #1
	str r0, [sp, #0x78]
_0232372C:
	ldr r1, [sp, #0x78]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	blt _02323538
	b _0232374C
_02323740:
	ldr r1, [sp, #0x80]
	ldr r0, [sp, #0x18]
	mla sb, r1, r0, sb
_0232374C:
	ldrsh r0, [sp, #0xbc]
	ldrsh r1, [sp, #0xbe]
	bl GetTile
	mov sl, r0
	ldrh r0, [sl]
	tst r0, #3
	beq _02323830
	ldr r0, [sl, #0xc]
	cmp r0, #0
	beq _02323818
	ldr r0, [r0]
	cmp r0, #1
	bne _02323818
	mov r0, r8
	mov r1, #0x2e
	bl IqSkillIsEnabled
	cmp r0, #0
	bne _023237A8
	mov r0, r8
	mov r1, #0x60
	bl ExclusiveItemEffectIsActive__02323918
	cmp r0, #0
	beq _023237BC
_023237A8:
	mov r0, r8
	ldr r1, [sl, #0xc]
	bl ov29_022FAFD4
	cmp r0, #0
	bne _02323818
_023237BC:
	ldr r0, [sl, #0xc]
	mov r1, r7
	bl TwoTurnMoveForcedMiss
	cmp r0, #0
	bne _02323818
	mov r0, r8
	mov r1, #1
	bl ov29_023024E0
	mov r4, r0
	mov r0, r8
	mov r1, r7
	mov r2, #0
	bl GetEntityMoveTargetAndRange
	ldr r1, [sl, #0xc]
	mov r2, r0
	stmia sp, {r1, r7}
	add r1, sp, #0xa8
	mov r0, #0
	mov r3, r8
	str r4, [sp, #8]
	bl ov29_023243B4
	str r0, [sp, #0x88]
	b _02323830
_02323818:
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
_02323824:
	ldr r0, [sp, #0x14]
	cmp r0, r6
	blt _023233FC
_02323830:
	ldr r0, [sp, #0xb0]
	cmp r0, #0
	blt _02323848
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_02323848:
	cmp r5, #0
	blt _0232385C
	mov r0, r5, lsl #0x10
	mov r0, r0, asr #0x10
	bl ov10_022BDE50
_0232385C:
	mov r0, #0
	bl ov29_0234B4CC
	ldrh r1, [r7, #4]
	ldr r0, _02323914 ; =0x000001E5
	cmp r1, r0
	bne _0232387C
	mov r0, #1
	bl AnimationDelayOrSomething
_0232387C:
	ldr r0, [sp, #0x88]
	cmp r0, #0
	ble _023238B4
	ldr r1, [sp, #0x88]
	add r0, sp, #0xa8
	mov r2, #0
	str r2, [r0, r1, lsl #2]
	ldr r4, [sp, #0xec]
	ldr r3, [sp, #0xe8]
	mov r1, r8
	mov r2, r7
	str r4, [sp]
	bl ExecuteMoveEffect
	b _023238EC
_023238B4:
	cmp r6, #1
	bne _023238EC
	add r0, sp, #0xbc
	bl ov29_022E2CA0
	cmp r0, #0
	beq _023238EC
	mov r0, #1
	mov r1, #0x4a
	bl ov29_022EA370
	add r3, sp, #0xbc
	mov r0, r8
	mov r2, r7
	mov r1, #0
	bl PlayMoveAnimation
_023238EC:
	add sp, sp, #0xc0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_023238F4: .word ov29_02352A54
_023238F8: .word DIRECTIONS_XY
_023238FC: .word DIRECTIONS_XY + 2
_02323900: .word ov29_0235175C
_02323904: .word 0x00000FFF
_02323908: .word ov29_02352A6C
_0232390C: .word DUNGEON_PTR
#ifdef JAPAN
_02323910: .word 0x0001A182
#else
_02323910: .word 0x0001A226
#endif
_02323914: .word 0x000001E5
	arm_func_end ov29_023230FC
