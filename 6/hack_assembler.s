	.file	"hack_assembler.c"
	.text
	.p2align 4
	.globl	removenewline
	.type	removenewline, @function
removenewline:
.LFB23:
	.cfi_startproc
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L5:
	cmpb	$10, %al
	je	.L6
	cmpb	$13, %al
	je	.L6
	addq	$1, %rdi
.L11:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L5
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	movb	$0, (%rdi)
	ret
	.cfi_endproc
.LFE23:
	.size	removenewline, .-removenewline
	.p2align 4
	.globl	convert_to_binary
	.type	convert_to_binary, @function
convert_to_binary:
.LFB24:
	.cfi_startproc
	movl	%edi, %eax
	movl	%esi, %r9d
	testl	%edi, %edi
	js	.L16
	testl	%esi, %esi
	jle	.L16
	movslq	%esi, %r10
	xorl	%esi, %esi
	leaq	-1(%rdx,%r10), %rdi
	.p2align 6
	.p2align 4
	.p2align 3
.L15:
	movl	%eax, %r8d
	addl	$1, %esi
	subq	$1, %rdi
	shrl	$31, %r8d
	leal	(%rax,%r8), %ecx
	andl	$1, %ecx
	subl	%r8d, %ecx
	addl	$48, %ecx
	movb	%cl, 1(%rdi)
	movl	%eax, %ecx
	movl	%r8d, %eax
	addl	%ecx, %eax
	sarl	%eax
	cmpl	%esi, %r9d
	jg	.L15
	xorl	%eax, %eax
	cmpl	$1, %ecx
	movb	$0, (%rdx,%r10)
	setle	%al
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE24:
	.size	convert_to_binary, .-convert_to_binary
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	".asm"
	.text
	.p2align 4
	.globl	is_valid_filetype
	.type	is_valid_filetype, @function
is_valid_filetype:
.LFB25:
	.cfi_startproc
	movzbl	(%rdi), %edx
	testb	%dl, %dl
	je	.L26
	cmpb	$46, %dl
	je	.L26
	movl	$1, %eax
	.p2align 5
	.p2align 4
	.p2align 3
.L20:
	movzbl	(%rdi,%rax), %edx
	movq	%rax, %rcx
	addq	$1, %rax
	testb	%dl, %dl
	je	.L19
	cmpb	$46, %dl
	jne	.L20
.L19:
	xorl	%eax, %eax
	testb	%dl, %dl
	je	.L18
	movslq	%ecx, %rcx
	movl	$1, %eax
	leaq	.LC0(%rip), %rsi
	addq	%rcx, %rdi
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L25:
	cmpb	%cl, %dl
	jne	.L28
.L23:
	movzbl	(%rsi,%rax), %edx
	addq	$1, %rax
	movzbl	-1(%rdi,%rax), %ecx
	testb	%dl, %dl
	je	.L24
	testb	%cl, %cl
	jne	.L25
.L24:
	xorl	%eax, %eax
	cmpb	%cl, %dl
	sete	%al
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	xorl	%eax, %eax
.L18:
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	xorl	%ecx, %ecx
	jmp	.L19
	.cfi_endproc
.LFE25:
	.size	is_valid_filetype, .-is_valid_filetype
	.section	.rodata.str1.1
.LC1:
	.string	"R7"
.LC2:
	.string	"R3"
.LC3:
	.string	"R1"
.LC4:
	.string	"R2"
.LC5:
	.string	"R5"
.LC6:
	.string	"R6"
.LC7:
	.string	"R4"
.LC8:
	.string	"R9"
.LC9:
	.string	"R8"
.LC10:
	.string	"R0"
.LC11:
	.string	"R13"
.LC12:
	.string	"R11"
.LC13:
	.string	"R10"
.LC14:
	.string	"R12"
.LC15:
	.string	"R14"
.LC16:
	.string	"R15"
.LC17:
	.string	"SCREEN"
.LC18:
	.string	"KBD"
.LC19:
	.string	"SP"
.LC20:
	.string	"LCL"
.LC21:
	.string	"ARG"
.LC22:
	.string	"THIS"
.LC23:
	.string	"THAT"
	.text
	.p2align 4
	.globl	add_predefined_symbols
	.type	add_predefined_symbols, @function
add_predefined_symbols:
.LFB26:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$7, %edx
	leaq	.LC1(%rip), %rsi
	call	insert_ST@PLT
	movl	$3, %edx
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$1, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$2, %edx
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$5, %edx
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$6, %edx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$4, %edx
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$9, %edx
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$8, %edx
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	xorl	%edx, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$13, %edx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$11, %edx
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$10, %edx
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$12, %edx
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$14, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$15, %edx
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$16384, %edx
	leaq	.LC17(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$24576, %edx
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	xorl	%edx, %edx
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$1, %edx
	leaq	.LC20(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$2, %edx
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$3, %edx
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$4, %edx
	leaq	.LC23(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	insert_ST@PLT
	.cfi_endproc
.LFE26:
	.size	add_predefined_symbols, .-add_predefined_symbols
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC24:
	.string	"Syntax error in line %d: Expected a '/'\n"
	.align 8
.LC25:
	.string	"Syntax error in line %d: Symbol cannot start with a number"
	.align 8
.LC26:
	.string	"Syntax error in line %d: Illegal whitespace, expected a ')'\n"
	.align 8
.LC27:
	.string	"Syntax error in line %d: No symbol defined\n"
	.align 8
.LC28:
	.string	"Syntax error in line %d: Expected a ')'\n"
	.align 8
.LC29:
	.string	"Syntax error in line %d: Same symbol defined twice\n"
	.text
	.p2align 4
	.globl	add_file_symbols
	.type	add_file_symbols, @function
add_file_symbols:
.LFB27:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	leaq	-1088(%rbp), %r15
	xorl	%r14d, %r14d
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	subq	$1080, %rsp
	movq	%rdi, -1096(%rbp)
	movq	%fs:40, %r12
	movq	%r12, -56(%rbp)
	movq	%rsi, %r12
	.p2align 4
	.p2align 3
.L47:
	movq	%r12, %rdx
	movl	$1024, %esi
	movq	%r15, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L94
	movzbl	-1088(%rbp), %edx
	movq	%rsp, %r13
	testb	%dl, %dl
	je	.L48
	movl	%edx, %eax
	movq	%r15, %rcx
	.p2align 4
	.p2align 3
.L52:
	cmpb	$10, %al
	je	.L75
	cmpb	$13, %al
	je	.L75
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	testb	%al, %al
	jne	.L52
.L51:
	cmpb	$9, %dl
	je	.L76
	cmpb	$32, %dl
	jne	.L73
.L76:
	movl	$1, %eax
	.p2align 5
	.p2align 4
	.p2align 3
.L87:
	movzbl	(%r15,%rax), %edx
	movq	%rax, %rcx
	addq	$1, %rax
	cmpb	$32, %dl
	je	.L87
	cmpb	$9, %dl
	je	.L87
.L53:
	addl	$1, %ebx
	cmpb	$40, %dl
	je	.L57
	testb	%dl, %dl
	je	.L56
	cmpb	$47, %dl
	je	.L58
	addl	$1, %r14d
.L56:
	movq	%r13, %rsp
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L75:
	movb	$0, (%rcx)
	movzbl	-1088(%rbp), %edx
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L58:
	addl	$1, %ecx
	movslq	%ecx, %rcx
	cmpb	$47, -1088(%rbp,%rcx)
	je	.L56
	movl	%ebx, %esi
	leaq	.LC24(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
.L59:
	xorl	%eax, %eax
	movq	%r13, %rsp
.L46:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L95
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L57:
	.cfi_restore_state
	movq	%r15, %rdi
	movl	%ecx, -1104(%rbp)
	call	strlen@PLT
	movslq	-1104(%rbp), %rcx
	addq	$15, %rax
	leal	1(%rcx), %edx
	andq	$-16, %rax
	movslq	%edx, %rdx
	subq	%rax, %rsp
	movzbl	-1088(%rbp,%rdx), %eax
	movq	%rsp, %r9
	leal	-48(%rax), %esi
	cmpb	$8, %sil
	jbe	.L96
.L60:
	testb	%al, %al
	je	.L61
	cmpb	$41, %al
	je	.L61
	movl	$1, %edx
	addq	%r15, %rcx
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L97:
	cmpb	$9, %al
	je	.L77
	movb	%al, -1(%r9,%rdx)
	movzbl	1(%rcx,%rdx), %eax
	leaq	1(%rdx), %rsi
	cmpb	$41, %al
	je	.L66
	testb	%al, %al
	je	.L92
	movq	%rsi, %rdx
.L64:
	cmpb	$32, %al
	jne	.L97
.L77:
	movl	%ebx, %esi
	leaq	.LC26(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L59
.L73:
	xorl	%ecx, %ecx
	jmp	.L53
.L48:
	addl	$1, %ebx
	jmp	.L56
.L96:
	movl	%ebx, %esi
	leaq	.LC25(%rip), %rdi
	xorl	%eax, %eax
	movq	%rdx, -1120(%rbp)
	movl	%ecx, -1108(%rbp)
	movq	%rsp, -1104(%rbp)
	call	printf@PLT
	movq	-1120(%rbp), %rdx
	movslq	-1108(%rbp), %rcx
	movq	-1104(%rbp), %r9
	movzbl	-1088(%rbp,%rdx), %eax
	jmp	.L60
.L66:
	testb	%al, %al
	je	.L92
	movslq	%edx, %rdx
	movq	-1096(%rbp), %rdi
	movq	%r9, %rsi
	movq	%r9, -1104(%rbp)
	movb	$0, (%r9,%rdx)
	call	search_ST@PLT
	movq	-1104(%rbp), %r9
	cmpl	$-1, %eax
	jne	.L98
	movq	-1096(%rbp), %rdi
	movl	%r14d, %edx
	movq	%r9, %rsi
	call	insert_ST@PLT
	movq	%rax, -1096(%rbp)
	movq	%r13, %rsp
	jmp	.L47
.L94:
	movq	-1096(%rbp), %rax
	jmp	.L46
.L61:
	movl	%ebx, %esi
	leaq	.LC27(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L59
.L98:
	movl	%ebx, %esi
	leaq	.LC29(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L59
.L92:
	movl	%ebx, %esi
	leaq	.LC28(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L59
.L95:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE27:
	.size	add_file_symbols, .-add_file_symbols
	.section	.rodata.str1.1
.LC30:
	.string	"M"
.LC31:
	.string	"D"
.LC32:
	.string	"DM"
.LC33:
	.string	"MD"
.LC34:
	.string	"A"
.LC35:
	.string	"AM"
.LC36:
	.string	"MA"
.LC37:
	.string	"AD"
.LC38:
	.string	"DA"
.LC39:
	.string	"ADM"
.LC40:
	.string	"AMD"
.LC41:
	.string	"DAM"
.LC42:
	.string	"DMA"
.LC43:
	.string	"MAD"
.LC44:
	.string	"MDA"
	.text
	.p2align 4
	.globl	add_dest_symbols
	.type	add_dest_symbols, @function
add_dest_symbols:
.LFB28:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1, %edx
	leaq	.LC30(%rip), %rsi
	call	insert_ST@PLT
	movl	$2, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$3, %edx
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$3, %edx
	leaq	.LC33(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$4, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$5, %edx
	leaq	.LC35(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$5, %edx
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$6, %edx
	leaq	.LC37(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$6, %edx
	leaq	.LC38(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC39(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC40(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC41(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC42(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC43(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC44(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	insert_ST@PLT
	.cfi_endproc
.LFE28:
	.size	add_dest_symbols, .-add_dest_symbols
	.section	.rodata.str1.1
.LC45:
	.string	"JGT"
.LC46:
	.string	"JEQ"
.LC47:
	.string	"JGE"
.LC48:
	.string	"JLT"
.LC49:
	.string	"JNE"
.LC50:
	.string	"JLE"
.LC51:
	.string	"JMP"
	.text
	.p2align 4
	.globl	add_jump_symbols
	.type	add_jump_symbols, @function
add_jump_symbols:
.LFB29:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1, %edx
	leaq	.LC45(%rip), %rsi
	call	insert_ST@PLT
	movl	$2, %edx
	leaq	.LC46(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$3, %edx
	leaq	.LC47(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$4, %edx
	leaq	.LC48(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$5, %edx
	leaq	.LC49(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$6, %edx
	leaq	.LC50(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC51(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	insert_ST@PLT
	.cfi_endproc
.LFE29:
	.size	add_jump_symbols, .-add_jump_symbols
	.section	.rodata.str1.1
.LC52:
	.string	"0"
.LC53:
	.string	"1"
.LC54:
	.string	"-1"
.LC55:
	.string	"!D"
.LC56:
	.string	"!A"
.LC57:
	.string	"!M"
.LC58:
	.string	"-D"
.LC59:
	.string	"-A"
.LC60:
	.string	"-M"
.LC61:
	.string	"D+1"
.LC62:
	.string	"A+1"
.LC63:
	.string	"M+1"
.LC64:
	.string	"D-1"
.LC65:
	.string	"A-1"
.LC66:
	.string	"M-1"
.LC67:
	.string	"D+A"
.LC68:
	.string	"D+M"
.LC69:
	.string	"D-A"
.LC70:
	.string	"D-M"
.LC71:
	.string	"A-D"
.LC72:
	.string	"M-D"
.LC73:
	.string	"D&A"
.LC74:
	.string	"D&M"
.LC75:
	.string	"D|A"
.LC76:
	.string	"D|M"
	.text
	.p2align 4
	.globl	add_comp_symbols
	.type	add_comp_symbols, @function
add_comp_symbols:
.LFB30:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$42, %edx
	leaq	.LC52(%rip), %rsi
	call	insert_ST@PLT
	movl	$63, %edx
	leaq	.LC53(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$58, %edx
	leaq	.LC54(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$12, %edx
	leaq	.LC31(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$48, %edx
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$112, %edx
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$13, %edx
	leaq	.LC55(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$49, %edx
	leaq	.LC56(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$113, %edx
	leaq	.LC57(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$15, %edx
	leaq	.LC58(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$51, %edx
	leaq	.LC59(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$115, %edx
	leaq	.LC60(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$31, %edx
	leaq	.LC61(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$55, %edx
	leaq	.LC62(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$119, %edx
	leaq	.LC63(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$14, %edx
	leaq	.LC64(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$50, %edx
	leaq	.LC65(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$114, %edx
	leaq	.LC66(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$2, %edx
	leaq	.LC67(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$66, %edx
	leaq	.LC68(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$19, %edx
	leaq	.LC69(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$83, %edx
	leaq	.LC70(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$7, %edx
	leaq	.LC71(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$71, %edx
	leaq	.LC72(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	xorl	%edx, %edx
	leaq	.LC73(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$64, %edx
	leaq	.LC74(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$21, %edx
	leaq	.LC75(%rip), %rsi
	movq	%rax, %rdi
	call	insert_ST@PLT
	movl	$85, %edx
	leaq	.LC76(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	insert_ST@PLT
	.cfi_endproc
.LFE30:
	.size	add_comp_symbols, .-add_comp_symbols
	.section	.rodata.str1.8
	.align 8
.LC79:
	.string	"Error at line %d: Number too large\n"
	.section	.rodata.str1.1
.LC80:
	.string	"%s\n"
	.section	.rodata.str1.8
	.align 8
.LC81:
	.string	"Syntax error at line %d: Expected a '/'"
	.align 8
.LC82:
	.string	"Syntax error at line %d: Unexpected symbol %c\n"
	.align 8
.LC83:
	.string	"Syntax error: Line %d: %c not allowed in symbol\n"
	.align 8
.LC84:
	.string	"Syntax error: Line %d: Illegal symbol"
	.section	.rodata.str1.1
.LC85:
	.string	"111"
	.section	.rodata.str1.8
	.align 8
.LC86:
	.string	"Syntax error at line %d: Unexpected '='\n"
	.align 8
.LC87:
	.string	"Syntax error at line %d: Unexpected ';'\n"
	.align 8
.LC89:
	.string	"Syntax error at line %d: Invalid dest symbol\n"
	.align 8
.LC90:
	.string	"Syntax error at line %d: Invalid dest symbol %s\n"
	.align 8
.LC91:
	.string	"Syntax error: Line %d: Invalid comp symbol %s\n"
	.align 8
.LC92:
	.string	"Syntax error: Line %d: Invalid jump symbol %s\n"
	.section	.rodata.str1.1
.LC93:
	.string	"%s%s%s\n"
	.text
	.p2align 4
	.globl	assemble_to_hack
	.type	assemble_to_hack, @function
assemble_to_hack:
.LFB31:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movq	%rdi, %r13
	pushq	%r12
	pushq	%rbx
	subq	$1160, %rsp
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsi, -1136(%rbp)
	movq	%fs:40, %rdi
	movq	%rdi, -56(%rbp)
	xorl	%edi, %edi
	call	add_predefined_symbols
	movq	%r13, %rsi
	movq	%rax, %rdi
	call	add_file_symbols
	movq	%rax, -1152(%rbp)
	testq	%rax, %rax
	je	.L106
	movq	%r13, %rdi
	xorl	%r14d, %r14d
	leaq	-1088(%rbp), %r12
	call	rewind@PLT
	xorl	%edi, %edi
	call	add_dest_symbols
	xorl	%edi, %edi
	movq	%rax, -1168(%rbp)
	call	add_jump_symbols
	xorl	%edi, %edi
	movq	%rax, -1176(%rbp)
	call	add_comp_symbols
	movq	%r13, -1128(%rbp)
	movq	%rax, -1160(%rbp)
	movl	$16, -1180(%rbp)
.L107:
	movq	-1128(%rbp), %rdx
	movl	$1024, %esi
	movq	%r12, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L198
	movzbl	-1088(%rbp), %edx
	movq	%r12, %rcx
	movl	%edx, %eax
	testb	%dl, %dl
	je	.L177
	.p2align 4
	.p2align 3
.L111:
	cmpb	$10, %al
	je	.L200
	cmpb	$13, %al
	je	.L200
	movzbl	1(%rcx), %eax
	addq	$1, %rcx
	testb	%al, %al
	jne	.L111
.L110:
	cmpb	$9, %dl
	je	.L201
	cmpb	$32, %dl
	jne	.L181
.L201:
	movl	$1, %eax
	.p2align 5
	.p2align 4
	.p2align 3
.L253:
	movzbl	(%r12,%rax), %edx
	movq	%rax, %r8
	addq	$1, %rax
	cmpb	$32, %dl
	je	.L253
	cmpb	$9, %dl
	je	.L253
	movl	%r8d, %r13d
.L112:
	cmpb	$47, %dl
	jbe	.L115
	cmpb	$64, %dl
	jne	.L117
	movq	-1136(%rbp), %rsi
	leal	1(%r13), %r15d
	movl	$48, %edi
	movq	%rsp, -1144(%rbp)
	call	fputc@PLT
	movslq	%r15d, %rax
	movzbl	-1088(%rbp,%rax), %ebx
	leal	-48(%rbx), %eax
	cmpb	$9, %al
	jbe	.L288
	movq	%r12, %rdi
	call	strlen@PLT
	addq	$15, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %rsi
	testb	$-33, %bl
	je	.L131
	cmpb	$9, %bl
	je	.L131
	movslq	%r13d, %rcx
	movl	$1, %eax
	addq	%r12, %rcx
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L290:
	cmpb	$32, %bl
	jg	.L289
.L133:
	movb	%bl, -1(%rsi,%rax)
	movzbl	1(%rcx,%rax), %ebx
	leaq	1(%rax), %rdx
	testb	$-33, %bl
	je	.L137
	cmpb	$9, %bl
	je	.L137
	movq	%rdx, %rax
.L135:
	cmpb	$61, %bl
	jle	.L290
	cmpb	$64, %bl
	je	.L134
	cmpb	$124, %bl
	jne	.L133
.L134:
	movsbl	%bl, %edx
	leal	1(%r14), %esi
	leaq	.LC83(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	-1144(%rbp), %rsp
	.p2align 4
	.p2align 3
.L106:
	xorl	%eax, %eax
.L105:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L291
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L297:
	.cfi_restore_state
	testb	%sil, %sil
	jne	.L292
	cmpb	$47, %sil
	je	.L280
.L158:
	testl	%ebx, %ebx
	jne	.L162
	movl	$3158064, -1120(%rbp)
	movl	%r13d, -1144(%rbp)
.L163:
	testb	%dil, %dil
	je	.L191
	cmpb	$59, %dil
	je	.L191
	leal	1(%r13,%rbx), %eax
	movb	%dil, -1112(%rbp)
	cltq
	movzbl	-1088(%rbp,%rax), %eax
	cmpb	$59, %al
	je	.L192
	testb	%al, %al
	je	.L192
	movb	%al, -1111(%rbp)
	leal	2(%r13,%rbx), %eax
	cltq
	movzbl	-1088(%rbp,%rax), %eax
	testb	%al, %al
	je	.L193
	cmpb	$59, %al
	je	.L193
	movb	%al, -1110(%rbp)
	movl	$3, %r13d
.L169:
	leaq	-1112(%rbp), %rbx
	movq	-1160(%rbp), %rdi
	movslq	%r13d, %rax
	movq	%rbx, %rsi
	movb	$0, -1112(%rbp,%rax)
	call	search_ST@PLT
	cmpl	$-1, %eax
	je	.L293
	testl	%eax, %eax
	js	.L171
	movl	%eax, %ecx
	movl	%eax, %edi
	movl	%eax, %esi
	movd	.LC77(%rip), %xmm0
	sarl	$4, %edi
	andl	$1, %ecx
	sarl	$5, %esi
	movb	$0, -1097(%rbp)
	addl	$48, %ecx
	andl	$1, %edi
	andl	$1, %esi
	movb	%cl, -1098(%rbp)
	movl	%eax, %ecx
	sarl	%ecx
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, -1099(%rbp)
	movl	%eax, %ecx
	sarl	$2, %ecx
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, -1100(%rbp)
	movl	%eax, %ecx
	sall	$5, %eax
	andl	$256, %eax
	sarl	$6, %ecx
	orl	%edi, %eax
	andl	$1, %ecx
	sall	$8, %eax
	orl	%esi, %eax
	sall	$8, %eax
	orl	%ecx, %eax
	movd	%eax, %xmm1
	paddb	%xmm0, %xmm1
	movd	%xmm1, -1104(%rbp)
.L171:
	testl	%r15d, %r15d
	jne	.L172
	movl	$3158064, -1116(%rbp)
.L173:
	movq	-1136(%rbp), %rdi
	leaq	-1120(%rbp), %rcx
	xorl	%eax, %eax
	leaq	-1104(%rbp), %rdx
	leaq	-1116(%rbp), %r8
	leaq	.LC93(%rip), %rsi
	call	fprintf@PLT
.L177:
	addl	$1, %r14d
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L200:
	movb	$0, (%rcx)
	movzbl	-1088(%rbp), %edx
	jmp	.L110
	.p2align 4,,10
	.p2align 3
.L115:
	movabsq	$-141836999983106, %rax
	btq	%rdx, %rax
	jnc	.L177
.L117:
	movq	-1136(%rbp), %rcx
	movl	$3, %edx
	movl	$1, %esi
	leaq	.LC85(%rip), %rdi
	call	fwrite@PLT
	movslq	%r13d, %r10
	movzbl	-1088(%rbp,%r10), %edi
	movl	%edi, %eax
	testb	$-33, %dil
	je	.L184
	cmpb	$9, %dil
	je	.L184
	movl	$1, %edx
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	addq	%r12, %r10
	jmp	.L156
	.p2align 4,,10
	.p2align 3
.L154:
	cmpb	$59, %al
	jne	.L155
	testl	%r15d, %r15d
	jne	.L294
	movl	$1, %r15d
.L155:
	movzbl	(%r10,%rdx), %eax
	leaq	1(%rdx), %rcx
	testb	$-33, %al
	je	.L153
.L296:
	cmpb	$9, %al
	je	.L153
	movq	%rcx, %rdx
.L156:
	cmpb	$61, %al
	jne	.L154
	testl	%ebx, %ebx
	jne	.L295
	movzbl	(%r10,%rdx), %eax
	movl	$1, %ebx
	leaq	1(%rdx), %rcx
	testb	$-33, %al
	jne	.L296
	.p2align 4
	.p2align 3
.L153:
	cmpb	$9, %al
	je	.L203
	cmpb	$32, %al
	jne	.L158
.L203:
	leal	1(%rdx,%r13), %r11d
	movslq	%r11d, %r11
	addq	%r12, %r11
	movq	%r11, %rax
	.p2align 4
	.p2align 4
	.p2align 3
.L256:
	movzbl	(%rax), %esi
	movq	%rax, %r10
	addq	$1, %rax
	cmpb	$32, %sil
	je	.L256
	cmpb	$9, %sil
	je	.L256
	cmpb	$47, %sil
	jne	.L297
.L280:
	leal	1(%rdx,%r13), %eax
	subl	%r11d, %eax
	leal	1(%rax,%r10), %eax
	cltq
	cmpb	$47, -1088(%rbp,%rax)
	je	.L158
	leal	1(%r14), %esi
	leaq	.LC81(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L288:
	leal	2(%r13), %r8d
	xorl	%eax, %eax
	movslq	%r8d, %r8
	.p2align 5
	.p2align 4
	.p2align 3
.L120:
	subl	$48, %ebx
	leal	(%rax,%rax,4), %eax
	movq	%r8, %rdx
	movsbl	%bl, %ebx
	leal	(%rbx,%rax,2), %eax
	movzbl	(%r12,%r8), %ebx
	addq	$1, %r8
	leal	-48(%rbx), %ecx
	cmpb	$9, %cl
	jbe	.L120
	cmpb	$32, %bl
	ja	.L121
	movabsq	$4294967809, %rcx
	btq	%rbx, %rcx
	jnc	.L121
	testl	%eax, %eax
	js	.L122
	movl	%eax, %ecx
	movl	%eax, %r8d
	movl	%eax, %edi
	movl	%eax, %esi
	andl	$1, %ecx
	sarl	$4, %r8d
	movl	%eax, %r15d
	movl	%eax, %r9d
	addl	$48, %ecx
	andl	$1, %r8d
	sarl	$5, %edi
	movl	%eax, %r10d
	movb	%cl, -1090(%rbp)
	movl	%eax, %ecx
	andl	$1, %edi
	sarl	$6, %esi
	sarl	%ecx
	andl	$1, %esi
	sarl	$8, %r15d
	movl	%eax, %r11d
	sarl	$11, %r9d
	andl	$1, %ecx
	andl	$1, %r15d
	sarl	$10, %r10d
	addl	$48, %ecx
	sarl	$9, %r11d
	movd	.LC77(%rip), %xmm0
	movb	$0, -1089(%rbp)
	movb	%cl, -1091(%rbp)
	movl	%eax, %ecx
	sarl	$2, %ecx
	andl	$1, %ecx
	addl	$48, %ecx
	movb	%cl, -1092(%rbp)
	movl	%eax, %ecx
	sall	$5, %ecx
	andl	$256, %ecx
	orl	%r8d, %ecx
	movl	%eax, %r8d
	sall	$8, %ecx
	sarl	$12, %r8d
	orl	%edi, %ecx
	movl	%eax, %edi
	sall	$8, %ecx
	sarl	$13, %edi
	orl	%esi, %ecx
	movl	%eax, %esi
	movd	%ecx, %xmm2
	movl	%eax, %ecx
	sarl	$14, %esi
	sarl	$7, %ecx
	paddb	%xmm0, %xmm2
	movq	.LC78(%rip), %xmm0
	andl	$1, %ecx
	salq	$8, %rcx
	orq	%r15, %rcx
	andl	$1, %r11d
	andl	$1, %r10d
	andl	$1, %r9d
	salq	$8, %rcx
	andl	$1, %r8d
	andl	$1, %edi
	andl	$1, %esi
	orq	%r11, %rcx
	movd	%xmm2, -1096(%rbp)
	salq	$8, %rcx
	orq	%r10, %rcx
	salq	$8, %rcx
	orq	%r9, %rcx
	salq	$8, %rcx
	orq	%r8, %rcx
	salq	$8, %rcx
	orq	%rdi, %rcx
	salq	$8, %rcx
	orq	%rsi, %rcx
	movq	%rcx, %xmm3
	paddb	%xmm3, %xmm0
	movq	%xmm0, -1104(%rbp)
	cmpl	$32767, %eax
	jg	.L122
	cmpb	$9, %bl
	je	.L123
	cmpb	$32, %bl
	jne	.L298
.L123:
	leal	1(%rdx), %eax
	cltq
	.p2align 5
	.p2align 4
	.p2align 3
.L254:
	movzbl	(%r12,%rax), %ebx
	movq	%rax, %rdx
	addq	$1, %rax
	cmpb	$32, %bl
	je	.L254
	cmpb	$9, %bl
	je	.L254
	testb	%bl, %bl
	je	.L147
	cmpb	$47, %bl
	jne	.L121
	leal	1(%rdx), %eax
	cltq
	cmpb	$47, -1088(%rbp,%rax)
	je	.L147
	leal	1(%r14), %esi
	leaq	.LC81(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L122:
	leal	1(%r14), %esi
	leaq	.LC79(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
.L125:
	movq	-1144(%rbp), %rsp
	jmp	.L106
	.p2align 4,,10
	.p2align 3
.L162:
	cmpb	$61, %dil
	je	.L188
	leal	1(%r13), %eax
	movb	%dil, -1104(%rbp)
	cltq
	movzbl	-1088(%rbp,%rax), %eax
	cmpb	$61, %al
	je	.L165
	movb	%al, -1103(%rbp)
	leal	2(%r13), %eax
	cltq
	movzbl	-1088(%rbp,%rax), %eax
	cmpb	$61, %al
	je	.L189
	movb	%al, -1102(%rbp)
	leal	3(%r13), %eax
	cltq
	cmpb	$61, -1088(%rbp,%rax)
	jne	.L299
	movl	$3, %ebx
.L165:
	movslq	%ebx, %rax
	movq	-1168(%rbp), %rdi
	movb	$0, -1104(%rbp,%rax)
	leaq	-1104(%rbp), %rax
	movq	%rax, %rsi
	movq	%rax, -1144(%rbp)
	call	search_ST@PLT
	cmpl	$-1, %eax
	je	.L300
	testl	%eax, %eax
	js	.L168
	movl	%eax, %edx
	movb	$0, -1117(%rbp)
	andl	$1, %edx
	addl	$48, %edx
	movb	%dl, -1118(%rbp)
	movl	%eax, %edx
	sarl	$2, %eax
	sarl	%edx
	andl	$1, %eax
	andl	$1, %edx
	addl	$48, %eax
	addl	$48, %edx
	movb	%al, -1120(%rbp)
	movb	%dl, -1119(%rbp)
.L168:
	addl	$1, %ebx
	leal	0(%r13,%rbx), %eax
	movl	%eax, -1144(%rbp)
	cltq
	movzbl	-1088(%rbp,%rax), %edi
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L137:
	movl	%eax, %edx
	cltq
	movb	$0, (%rsi,%rax)
	cmpb	$9, %bl
	je	.L138
	cmpb	$32, %bl
	jne	.L139
.L138:
	leal	1(%r15,%rdx), %r9d
	movslq	%r9d, %r9
	addq	%r12, %r9
	movq	%r9, %rax
	.p2align 4
	.p2align 4
	.p2align 3
.L255:
	movzbl	(%rax), %ecx
	movq	%rax, %rdi
	addq	$1, %rax
	cmpb	$32, %cl
	je	.L255
	cmpb	$9, %cl
	je	.L255
	testb	%cl, %cl
	jne	.L142
.L139:
	movq	-1152(%rbp), %rdi
	movq	%rsi, -1192(%rbp)
	call	search_ST@PLT
	movq	-1192(%rbp), %rsi
	cmpl	$-1, %eax
	je	.L301
	testl	%eax, %eax
	js	.L147
.L146:
	movl	%eax, %edx
	movl	%eax, %edi
	movl	%eax, %esi
	movl	%eax, %ecx
	andl	$1, %edx
	sarl	$4, %edi
	movl	%eax, %r8d
	movl	%eax, %r9d
	addl	$48, %edx
	andl	$1, %edi
	sarl	$5, %esi
	movl	%eax, %r10d
	movb	%dl, -1090(%rbp)
	movl	%eax, %edx
	andl	$1, %esi
	sarl	$6, %ecx
	sarl	%edx
	andl	$1, %ecx
	sarl	$8, %r10d
	movb	$0, -1089(%rbp)
	sarl	$10, %r8d
	andl	$1, %edx
	andl	$1, %r10d
	sarl	$9, %r9d
	addl	$48, %edx
	movd	.LC77(%rip), %xmm0
	movb	%dl, -1091(%rbp)
	movl	%eax, %edx
	sarl	$2, %edx
	andl	$1, %edx
	addl	$48, %edx
	movb	%dl, -1092(%rbp)
	movl	%eax, %edx
	sall	$5, %edx
	andl	$256, %edx
	orl	%edi, %edx
	movl	%eax, %edi
	sall	$8, %edx
	sarl	$11, %edi
	orl	%esi, %edx
	movl	%eax, %esi
	sall	$8, %edx
	sarl	$12, %esi
	orl	%ecx, %edx
	movl	%eax, %ecx
	movd	%edx, %xmm4
	movl	%eax, %edx
	sarl	$7, %eax
	sarl	$14, %edx
	andl	$1, %eax
	sarl	$13, %ecx
	paddb	%xmm0, %xmm4
	movq	.LC78(%rip), %xmm0
	salq	$8, %rax
	orq	%r10, %rax
	andl	$1, %r9d
	andl	$1, %r8d
	andl	$1, %edi
	salq	$8, %rax
	andl	$1, %esi
	andl	$1, %ecx
	andl	$1, %edx
	orq	%r9, %rax
	movd	%xmm4, -1096(%rbp)
	salq	$8, %rax
	orq	%r8, %rax
	salq	$8, %rax
	orq	%rdi, %rax
	salq	$8, %rax
	orq	%rsi, %rax
	salq	$8, %rax
	orq	%rcx, %rax
	salq	$8, %rax
	orq	%rdx, %rax
	movq	%rax, %xmm5
	paddb	%xmm5, %xmm0
	movq	%xmm0, -1104(%rbp)
.L147:
	movq	-1136(%rbp), %rdi
	leaq	-1104(%rbp), %rdx
	xorl	%eax, %eax
	addl	$1, %r14d
	leaq	.LC80(%rip), %rsi
	call	fprintf@PLT
	movq	-1144(%rbp), %rsp
	jmp	.L107
	.p2align 4,,10
	.p2align 3
.L172:
	movl	-1144(%rbp), %edx
	addl	%r13d, %edx
	leal	1(%rdx), %eax
	cltq
	movzbl	-1088(%rbp,%rax), %eax
	testb	$-33, %al
	je	.L195
	cmpb	$9, %al
	je	.L195
	movb	%al, -1108(%rbp)
	leal	2(%rdx), %eax
	cltq
	movzbl	-1088(%rbp,%rax), %eax
	testb	$-33, %al
	je	.L174
	cmpb	$9, %al
	je	.L174
	addl	$3, %edx
	movb	%al, -1107(%rbp)
	movslq	%edx, %rax
	movzbl	-1088(%rbp,%rax), %eax
	testb	$-33, %al
	je	.L197
	cmpb	$9, %al
	je	.L197
	movb	%al, -1106(%rbp)
	movl	$3, %r15d
.L174:
	leaq	-1108(%rbp), %rbx
	movq	-1176(%rbp), %rdi
	movslq	%r15d, %r9
	movb	$0, -1108(%rbp,%r9)
	movq	%rbx, %rsi
	call	search_ST@PLT
	cmpl	$-1, %eax
	je	.L302
	testl	%eax, %eax
	js	.L173
	movl	%eax, %edx
	movb	$0, -1113(%rbp)
	andl	$1, %edx
	addl	$48, %edx
	movb	%dl, -1114(%rbp)
	movl	%eax, %edx
	sarl	$2, %eax
	sarl	%edx
	andl	$1, %eax
	andl	$1, %edx
	addl	$48, %eax
	addl	$48, %edx
	movb	%al, -1116(%rbp)
	movb	%dl, -1115(%rbp)
	jmp	.L173
.L142:
	cmpb	$47, %cl
	jne	.L303
	leal	2(%rdx,%r13), %eax
	subl	%r9d, %eax
	leal	1(%rax,%rdi), %eax
	cltq
	movzbl	-1088(%rbp,%rax), %eax
	cmpb	$47, %al
	jne	.L304
	movl	%r15d, %r13d
	movq	-1144(%rbp), %rsp
	jmp	.L117
.L289:
	movabsq	$2882348025450070016, %rdx
	btq	%rbx, %rdx
	jnc	.L133
	jmp	.L134
.L181:
	xorl	%r13d, %r13d
	jmp	.L112
.L294:
	leal	1(%r14), %esi
	leaq	.LC87(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L106
.L295:
	leal	1(%r14), %esi
	leaq	.LC86(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L106
.L189:
	movl	$2, %ebx
	jmp	.L165
.L301:
	movq	-1168(%rbp), %rdi
	call	search_ST@PLT
	movq	-1192(%rbp), %rsi
	cmpl	$-1, %eax
	jne	.L145
	movq	-1160(%rbp), %rdi
	movq	%rsi, -1192(%rbp)
	call	search_ST@PLT
	cmpl	$-1, %eax
	jne	.L145
	movq	-1192(%rbp), %rsi
	movq	-1176(%rbp), %rdi
	call	search_ST@PLT
	movq	-1192(%rbp), %rsi
	cmpl	$-1, %eax
	je	.L305
.L145:
	leal	1(%r14), %esi
	leaq	.LC84(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L125
.L198:
	movl	$1, %eax
	jmp	.L105
.L191:
	xorl	%r13d, %r13d
	jmp	.L169
.L184:
	xorl	%edx, %edx
	xorl	%r15d, %r15d
	xorl	%ebx, %ebx
	jmp	.L153
.L192:
	movl	$1, %r13d
	jmp	.L169
.L193:
	movl	$2, %r13d
	jmp	.L169
.L131:
	movb	$0, (%rsi)
	cmpb	$9, %bl
	je	.L183
	cmpb	$32, %bl
	jne	.L139
.L183:
	xorl	%edx, %edx
	jmp	.L138
.L195:
	xorl	%r15d, %r15d
	jmp	.L174
.L298:
	testb	%bl, %bl
	je	.L147
.L121:
	movsbl	%bl, %edx
	leal	1(%r14), %esi
	leaq	.LC82(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L125
.L197:
	movl	$2, %r15d
	jmp	.L174
.L188:
	xorl	%ebx, %ebx
	jmp	.L165
.L293:
	leal	1(%r14), %esi
	movq	%rbx, %rdx
	leaq	.LC91(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L106
.L292:
	leal	1(%r14), %esi
	leaq	.LC82(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L106
.L305:
	movl	-1180(%rbp), %r15d
	movq	-1152(%rbp), %rdi
	movl	%r15d, %edx
	leal	1(%r15), %ebx
	call	insert_ST@PLT
	movl	%ebx, -1180(%rbp)
	movq	%rax, -1152(%rbp)
	movl	%r15d, %eax
	jmp	.L146
.L302:
	leal	1(%r14), %esi
	movq	%rbx, %rdx
	leaq	.LC92(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L106
.L300:
	movq	-1144(%rbp), %rbx
	leal	1(%r14), %esi
	leaq	.LC90(%rip), %rdi
	xorl	%eax, %eax
	movq	%rbx, %rdx
	call	printf@PLT
	jmp	.L106
.L299:
	leal	1(%r14), %esi
	leaq	.LC89(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L106
.L304:
	movsbl	%al, %edx
	leal	1(%r14), %esi
	leaq	.LC82(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L125
.L303:
	movsbl	%cl, %edx
	leal	1(%r14), %esi
	leaq	.LC82(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	jmp	.L125
.L291:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE31:
	.size	assemble_to_hack, .-assemble_to_hack
	.section	.rodata.str1.1
.LC94:
	.string	"No file entered"
	.section	.rodata.str1.8
	.align 8
.LC95:
	.string	"Can assemble only one file at a time"
	.section	.rodata.str1.1
.LC96:
	.string	"File must have extension .asm"
.LC97:
	.string	"r"
.LC98:
	.string	"Cannot open file"
.LC101:
	.string	"w"
	.section	.rodata.str1.8
	.align 8
.LC102:
	.string	"Error occured while closing .hack file"
	.align 8
.LC103:
	.string	"Error occured while closing .asm file"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB104:
	.section	.text.startup,"ax",@progbits
.LHOTB104:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	je	.L325
	cmpl	$2, %edi
	jg	.L326
	movq	8(%rsi), %r8
	movq	%rsi, %r12
	movq	%r8, %rdi
	call	is_valid_filetype
	testl	%eax, %eax
	je	.L327
	leaq	.LC97(%rip), %rsi
	movq	%r8, %rdi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L321
	movq	8(%r12), %r12
	movq	%r12, %rdi
	call	strlen@PLT
	movzbl	(%r12), %edx
	addq	$17, %rax
	andq	$-16, %rax
	subq	%rax, %rsp
	movq	%rsp, %rdi
	cmpb	$46, %dl
	je	.L318
	movl	$1, %eax
	.p2align 5
	.p2align 4
	.p2align 3
.L314:
	movb	%dl, -1(%rdi,%rax)
	movq	%rax, %rcx
	addq	$1, %rax
	movzbl	-1(%r12,%rax), %edx
	cmpb	$46, %dl
	jne	.L314
.L313:
	movslq	%ecx, %rax
	addl	$4, %ecx
	leaq	.LC101(%rip), %rsi
	movslq	%ecx, %rcx
	movl	$1667328046, (%rdi,%rax)
	movw	$107, (%rdi,%rcx)
	call	fopen@PLT
	movq	%rbx, %rdi
	movq	%rax, %r13
	movq	%rax, %rsi
	call	assemble_to_hack
	movq	%r13, %rdi
	movl	%eax, %r12d
	call	fclose@PLT
	testl	%eax, %eax
	jne	.L322
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	%eax, %edx
	movl	%r12d, %eax
	xorl	$1, %eax
	testl	%edx, %edx
	jne	.L323
.L306:
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L328
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L327:
	.cfi_restore_state
	leaq	.LC96(%rip), %rdi
	call	puts@PLT
.L308:
	movl	$1, %eax
	jmp	.L306
.L326:
	leaq	.LC95(%rip), %rdi
	call	puts@PLT
	jmp	.L308
.L325:
	leaq	.LC94(%rip), %rdi
	call	puts@PLT
	jmp	.L308
.L318:
	xorl	%ecx, %ecx
	jmp	.L313
.L328:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB22:
.L322:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -40
	.cfi_offset 6, -16
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	leaq	.LC102(%rip), %rdi
	call	perror@PLT
	jmp	.L308
.L321:
	leaq	.LC98(%rip), %rdi
	call	perror@PLT
	jmp	.L308
.L323:
	leaq	.LC103(%rip), %rdi
	call	perror@PLT
	jmp	.L308
	.cfi_endproc
.LFE22:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE104:
	.section	.text.startup
.LHOTE104:
	.set	.LC77,.LC78
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC78:
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.ident	"GCC: (GNU) 14.2.1 20240910"
	.section	.note.GNU-stack,"",@progbits
