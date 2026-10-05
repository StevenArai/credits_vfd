	.syntax	unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-m4
	.eabi_attribute	6, 13	@ Tag_CPU_arch
	.eabi_attribute	7, 77	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 0	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.eabi_attribute	34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"arm_surface.c"
	.text
	.globl	surface                         @ -- Begin function surface
	.p2align	1
	.prefalign	2, .Lfunc_end0, nop
	.type	surface,%function
	.code	16
	.thumb_func
surface:                                @ @surface
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, lr}
	push.w	{r4, r5, r6, r7, r8, r9, lr}
	.pad	#4
	sub	sp, #4
	bl	__aeabi_i2d
	movs	r3, #0
	movt	r3, #16404
	movs	r2, #0
	bl	__aeabi_ddiv
	movw	r2, #39322
	movw	r3, #39321
	movt	r2, #39321
	movt	r3, #16329
	mov	r4, r0
	mov	r5, r1
	bl	__aeabi_dmul
	bl	cos
	movw	r3, #13107
	mov	r8, r0
	mov	r9, r1
	movt	r3, #16339
	mov	r0, r4
	mov	r1, r5
	mov.w	r2, #858993459
	bl	__aeabi_dmul
	bl	sin
	movw	r2, #15729
	movw	r3, #28835
	mov	r6, r0
	mov	r7, r1
	movt	r2, #55050
	movt	r3, #16333
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	bl	sin
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r8
	mov	r3, r9
	bl	__aeabi_dadd
	mov	r6, r0
	mov	r7, r1
	mov	r0, r4
	mov	r1, r5
	bl	sin
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	mov	r1, r7
	movs	r2, #0
	mov.w	r3, #-1073741824
	bl	__aeabi_dmul
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	movs	r3, #0
	movt	r3, #16392
	movs	r2, #0
	bl	__aeabi_dadd
	movs	r3, #0
	movt	r3, #16412
	movs	r2, #0
	bl	__aeabi_dmul
	movs	r3, #0
	movt	r3, #16418
	movs	r2, #0
	bl	__aeabi_ddiv
	movs	r3, #0
	movt	r3, #16352
	movs	r2, #0
	bl	__aeabi_dadd
	bl	floor
	bl	__aeabi_d2iz
	usat	r0, #3, r0
	add	sp, #4
	pop.w	{r4, r5, r6, r7, r8, r9, pc}
.Lfunc_end0:
	.size	surface, .Lfunc_end0-surface
	.cantunwind
	.fnend
                                        @ -- End function
	.ident	"clang version 23.1.2 (https://github.com/llvm/llvm-project.git 85ac560262434c9ccfc0c183ec22d4138ed647fb)"
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
