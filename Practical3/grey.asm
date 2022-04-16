section  .data
	fd:	dd	0
	fsize:	dq	0
	datao:	dq	0
	datai:	dq	0
	input:	db	0
	output:	db	0
section .bss

section .text
    GLOBAL greyscale
    extern open, close, read, write, malloc, lseek, printf

    greyscale:
	push	rbp
	mov	rbp, rsp
    sub rsp, 16
	
	mov	[input], rdi
	mov	[output], rsi
	
	mov	rsi, 2
	call	open
	mov	r14, rax

	mov	rdi, rax
	call	file_size

	mov	[fsize], rax

	mov	rdi, rax
	call	malloc
	mov	[datai], rax
	

	

	mov	rdi, r14
	mov	rsi, [datai]
	mov	rdx, [fsize]
	call	read

	mov rdi, rax
	call	close

	mov	rdi, r14
	mov	rsi, 0
	mov	rdx, 0
	call	lseek

	

	mov	rdi, [fsize]
	call	malloc
	mov	[datao], rax

	mov	r12, [datao]

	mov	r13, [datai]
	
	; xor	r15, r15

       mwhile:
	cmp	r15, [fsize]
	jge	_mend
	xor rcx, rcx
	mov	rcx, [r13+r15]
	mov	[r12+r15], rcx
	inc	r15
	jmp	mwhile
       _mend:

	mov	rdi, [output]
	mov	rsi, 0x42
	mov	rdx, 600o
        call    open
        mov     r14, rax

	mov	rdi, r14
	mov	rsi, [datao]
	mov	rdx, [fsize]
	call	write

    mov rdi, r14
    call close

	leave
	ret

   file_size:
push rbp
mov rbp, rsp
sub rsp, 16
.fd equ 0
.size equ 4
mov [rsp+.fd],edi
mov rsi,0 ;offset=0
mov rdx,2 ;whence=2
call lseek
mov [rsp+.size],rax
mov edi, [rsp+.fd]
mov rsi,0 ;offset=0
mov rdx,0 ;whence=0
call lseek
mov rax,[rsp+.size]
leave
ret

