CC = aarch64-linux-gnu-gcc

AS = aarch64-linux-gnu-as	
ASFLAGS = -march=armv8-a

QEMU_ROOT = qemu-root
QEMU = qemu-aarch64

NAME = libarmalloc.so

TEST_DIR = ./tests/
TEST_FILES = main.c
TEST = $(addprefix $(TEST_DIR), $(TEST_FILES))
TEST_NAME = ./test
CFLAGS = -Wall -Wextra -Werror -z noexecstack -fPIC

SRC_DIR = srcs/
MALLOC_DIR 		= malloc/
MALLOC_FILES 	= test.S \
				global.S \
				malloc.S \
				init_struct.S \
				map.S \
				get_size.S \
				utils.S \
				header.S \
				binlists.S 

SRC_FILES = $(addprefix $(MALLOC_DIR), $(MALLOC_FILES))

OBJS_DIR = ./objs/
OBJS = $(addprefix $(OBJS_DIR), $(SRC_FILES:.S=.o))

$(NAME): $(OBJS_DIR) $(OBJS)
	$(CC) $(CFLAGS) -shared -o $@ $(OBJS) -Wl,--version-script=export.map

$(TEST_NAME): $(TEST) $(NAME)
	$(CC) $(CFLAGS) -g -o $@ $(TEST) -L. -larmalloc

all: $(NAME)



$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)/$(MALLOC_DIR)


$(OBJS_DIR)%.o: $(SRC_DIR)%.S | $(OBJS_DIR)
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