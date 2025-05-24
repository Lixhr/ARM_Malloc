AS = aarch64-linux-gnu-as
CC = aarch64-linux-gnu-gcc
CFLAGS = -Wall -Wextra -Werror -z noexecstack -fPIC
ASFLAGS = -march=armv8-a

QEMU_ROOT = qemu-root
QEMU = qemu-aarch64

NAME = $(QEMU_ROOT)/lib/libarmalloc.so

TEST_DIR = ./tests/
TEST_FILES = main.c
TEST = $(addprefix $(TEST_DIR), $(TEST_FILES))
TEST_NAME = ./test

SRC_DIR = ./srcs/
SRC_FILES = test.s \
			global.s

OBJS_DIR = ./objs/
OBJS = $(addprefix $(OBJS_DIR), $(SRC_FILES:.s=.o))

$(QEMU_ROOT)/lib:
	mkdir -p $@

$(NAME): $(OBJS) | $(QEMU_ROOT)/lib
	$(CC) $(CFLAGS) -shared -o $@ $^ -Wl,--version-script=export.map

all: $(NAME)

$(OBJS_DIR):
	mkdir -p $@

$(OBJS_DIR)%.o: $(SRC_DIR)%.s | $(OBJS_DIR)
	$(CC) $(CFLAGS) -c -o $@ $< 

clean:
	rm -rf $(OBJS_DIR)

test: $(NAME)
	$(CC) $(TEST) -L${QEMU_ROOT}/lib -larmalloc -o $(TEST_NAME)
	$(QEMU) -L $(QEMU_ROOT) ./test -g 1234

fclean: clean
	rm -f $(NAME)
	rm -f $(TEST_NAME)

re: fclean all

.PHONY: test