.global _start

_start:
	mov %rsp, %rdi
	and $-16, %rsp
	call crt_init
