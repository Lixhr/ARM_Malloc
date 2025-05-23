AS = arm-linux-gnueabi-as
CC = arm-linux-gnueabi-gcc
CFLAGS=-Wall -Wextra -Werror -z noexecstack

QEMU_ROOT=qemu-root
QEMU=qemu-arm

NAME = $(QEMU_ROOT)/lib/libarmalloc.so

TEST_DIR = ./tests/
TEST_FILES = main.c
TEST = $(addprefix $(TEST_DIR), $(TEST_FILES))
TEST_NAME=./test

SRC_DIR = ./srcs/
SRC_FILES = test.s
SRCS = $(addprefix $(SRC_DIR), $(SRC_FILES))


OBJS_DIR = ./objs/
OBJS = $(addprefix $(OBJS_DIR), $(SRC_FILES:.s=.o))



$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -shared -o $@ $^

all: $(NAME)


$(OBJS_DIR):
	mkdir -p $@

$(OBJS_DIR)%.o: $(SRC_DIR)%.s | $(OBJS_DIR)
	$(AS) -o $@ $<

clean:
	rm -rf $(OBJS_DIR)

test: $(NAME)
	arm-linux-gnueabi-gcc $(TEST) -L${QEMU_ROOT}/lib -larmalloc -o $(TEST_NAME)
	$(QEMU) -L $(QEMU_ROOT) $(TEST_NAME)

fclean: clean
	rm -f $(NAME)
	rm -f $(TEST_NAME)

re: fclean all

.PHONY: test
