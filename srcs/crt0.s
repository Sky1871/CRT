.global _start

_start:
	mov %rsp, %rdi // Copies the value of the stack pointer into the first argument register
	and $-16, %rsp // Aligns the stack pointer to a 16-byte boundary
	call crt_init
