	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15, 6	sdk_version 10, 15, 6
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -36(%rbp)
	movl	%edi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	callq	_getpid
	leaq	L_.str(%rip), %rdi
	movl	%eax, %esi
	movb	$0, %al
	callq	_printf
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	callq	_fork
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jge	LBB0_2
## %bb.1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rdi
	leaq	L_.str.1(%rip), %rsi
	xorl	%ecx, %ecx
                                        ## kill: def $cl killed $cl killed $ecx
	movb	%cl, %al
	callq	_fprintf
	movl	$1, %edi
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	callq	_exit
LBB0_2:
	cmpl	$0, -52(%rbp)
	jne	LBB0_4
## %bb.3:
	callq	_getpid
	leaq	L_.str.2(%rip), %rdi
	movl	%eax, %esi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.3(%rip), %rdi
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	callq	_strdup
	movq	%rax, -32(%rbp)
	leaq	L_.str.4(%rip), %rdi
	callq	_strdup
	leaq	-32(%rbp), %rsi
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movq	-32(%rbp), %rdi
	callq	_execvp
	jmp	LBB0_5
LBB0_4:
	xorl	%eax, %eax
	movl	%eax, %edi
	callq	_wait
	movl	%eax, -56(%rbp)
	movl	-52(%rbp), %esi
	movl	%esi, -72(%rbp)         ## 4-byte Spill
	callq	_getpid
	leaq	L_.str.5(%rip), %rdi
	movl	-72(%rbp), %esi         ## 4-byte Reload
	movl	%eax, %edx
	movb	$0, %al
	callq	_printf
LBB0_5:
	jmp	LBB0_6
LBB0_6:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rax
	jne	LBB0_8
## %bb.7:
	xorl	%eax, %eax
	addq	$80, %rsp
	popq	%rbp
	retq
LBB0_8:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"hello world (pid:%d)\n"

L_.str.1:                               ## @.str.1
	.asciz	"fork failed\n"

L_.str.2:                               ## @.str.2
	.asciz	"hello, I am child (pid: %d)\n"

L_.str.3:                               ## @.str.3
	.asciz	"wc"

L_.str.4:                               ## @.str.4
	.asciz	"process.c"

L_.str.5:                               ## @.str.5
	.asciz	"hello, I am parent of %d (pid:%d)\n"


.subsections_via_symbols
