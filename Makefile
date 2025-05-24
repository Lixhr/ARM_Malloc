AS = aarch64-linux-gnu-as
CC = aarch64-linux-gnu-gcc
CFLAGS = -Wall -Wextra -Werror -z noexecstack -fPIC
ASFLAGS = -march=armv8-a

QEMU_ROOT = qemu-root
QEMU = qemu-aarch64

NAME = libarmalloc.so

TEST_DIR = ./tests/
TEST_FILES = main.c
TEST = $(addprefix $(TEST_DIR), $(TEST_FILES))
TEST_NAME = ./test

SRC_DIR = ./srcs/
SRC_FILES = test.s \
			global.s \
			malloc.s \
			init_struct.s 

OBJS_DIR = ./objs/
OBJS = $(addprefix $(OBJS_DIR), $(SRC_FILES:.s=.o))


$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -shared -o $@ $^ -Wl,--version-script=export.map

$(TEST_NAME): $(TEST) $(NAME)
	$(CC) $(CFLAGS) -g  -o $@ $(TEST) -L. -larmalloc

all: $(NAME)

$(OBJS_DIR):
	mkdir -p $@

$(OBJS_DIR)%.o: $(SRC_DIR)%.s | $(OBJS_DIR)
	$(CC) $(CFLAGS) -c -o $@ $< 

clean:
	rm -rf $(OBJS_DIR)

qemu:
	./qemu/skill-qemu-alpine/aarch64/run.sh

send: $(TEST_NAME)
	cd qemu ; ./send.sh

fclean: clean
	rm -f $(NAME)
	rm -f $(TEST_NAME)

re: fclean all

.PHONY: test