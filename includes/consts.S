#ifndef CONSTS_H
# define CONSTS_H



# define TOP_CHUNK_INIT  0x10


# define MAP_PROT        0x01 | 0x02
# define MAP_FLAGS       0x20 | 0x02

# define FASTBIN_SIZE    0x60
# define SMALLBIN_SIZE   0x200


/// ---------------------------------

# define NEXT_PAGE         0x0
# define TOP_CHUNK         0x8
# define CHUNK_ALLOCATED   0xc
/// ----------------------------------------------------------
/// | PAGE STRUCTURE                                         |
/// ---------------------------------------------------------
/// [         next_page         ][  off_top_chunk  | count  ]
/// [                        chunks                         ]
/// [                        chunks                         ]


# define OFF_FASTBIN     0x00
# define OFF_SMALLBIN    0x08
# define OFF_LARGEBIN    0x10
# define OFF_UNSORTEDBIN 0x18
# define OFF_MUTEX       0x20
# define OFF_PAGE_HEAD   0x28
# define OFF_PAGE_SIZE   0x30
# define OFF_STRUCT_INIT 0x38

/// ---------------------------------
/// | HEAP_STRUCT                   |
/// ---------------------------------
/// [   fastbins   ][   smallbins   ]
/// [   largebins  ][  unsortedbin  ]
/// [     mutex    ][   page_head   ]
/// [   page_size  ][  struct_init  ]


/// FASTBIN   =  0x60
/// SMALLBIN  =  0x200
/// LARGEBIN  =  MMAPED



# define OFF_DATA 0x10 // from 0 to data

# define OFF_CURR_SIZE 0x0
# define OFF_MMAPED 0x8
# define OFF_FREED 0xc

/// -----------------------------------------
/// | ALLOCATED                             |
/// -----------------------------------------
/// [     curr_size    |  mmaped  |  freed  ]
/// [               data                    ]
/// ...



# define OFF_PREV 0x0
# define OFF_NEXT 0x8

/// -----------------------------------------
/// | FREED                                 |
/// -----------------------------------------
/// [     curr_size    |  mmaped  |  freed  ]
/// [       prev       |        next        ]
/// ...

#endif