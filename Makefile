CC = gcc
CFLAGS = -Wall -Wextra -Werror -MMD -MP -ffreestanding -fno-builtin
LDFLAGS = -nostdlib -static
TARGET = CRT

C_SRCS = srcs/main.c srcs/mini_crt.c
ASM_SRCS = srcs/crt0.s

OBJS = $(C_SRCS:.c=.o) $(ASM_SRCS:.s=.o)
DEPS = $(C_SRCS:.c=.d)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -Wall -Wextra -Werror $(LDFLAGS) $(OBJS) -o $(TARGET)

srcs/%.o: srcs/%.c
	$(CC) $(CFLAGS) -c $< -o $@

srcs/%.o: srcs/%.s
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(DEPS)

fclean: clean
	rm -f $(TARGET)

re: fclean all

-include $(DEPS)
.PHONY: all clean fclean re
