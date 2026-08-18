extern int main(int argc, char **argv, char **envp);

void sys_exit(int status) {
    __asm__ volatile("syscall" : : "a"(60), "D"(status) : "memory");
    __builtin_unreachable();
}

void crt_init(long *stack_ptr) {
    int argc = stack_ptr[0];
    char **argv = (char **)&stack_ptr[1];
    char **envp = (char **)&stack_ptr[argc + 2];
    int exit_code = main(argc, argv, envp);
    sys_exit(exit_code);
}
