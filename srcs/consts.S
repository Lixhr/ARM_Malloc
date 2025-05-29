#ifndef CONSTS_H
# define CONSTS_H

# define OFF_FASTBIN     0x00
# define OFF_SMALLBIN    0x08
# define OFF_LARGEBIN    0x10
# define OFF_UNSORTEDBIN 0x18
# define OFF_MUTEX       0x20
# define OFF_PAGE_HEAD   0x28
# define OFF_PAGE_SIZE   0x30
# define OFF_STRUCT_INIT 0x38

# define NEXT_PAGE       0x0
# define TOP_CHUNK       0x8

# define TOP_CHUNK_INIT  0x10


# define MAP_PROT        0x01 | 0x02
# define MAP_FLAGS       0x20 | 0x02


#endif