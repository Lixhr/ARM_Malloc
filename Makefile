AS = arm-linux-gnueabi-as
CC = arm-linux-gnueabi-gcc
CFLAGS=-z noexecstack
NAME = libarmalloc.so

SRC_DIR = ./srcs/
OBJS_DIR = ./objs/
SRC_FILES = test.s

SRCS = $(addprefix $(SRC_DIR), $(SRC_FILES))
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

fclean: clean
	rm -f $(NAME)

re: fclean all
