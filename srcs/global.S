.section .data
.global HEAP_STRUCT
.type HEAP_STRUCT, %object
.size HEAP_STRUCT, 64
.hidden HEAP_STRUCT

HEAP_STRUCT:
	.zero 64

/// ---------------------------------
/// | PAGE STRUCTURE                |
/// ---------------------------------
/// [   next_page   ][   top_chunk  ]
/// [            chunks             ]
/// [            chunks             ]
/// ...



/// ---------------------------------
/// | HEAP_STRUCT                   |
/// ---------------------------------
/// [   fastbins   ][   smallbins   ]
/// [   largebins  ][  unsortedbin  ]
/// [     mutex    ][   page_head   ]
/// [   page_size  ][  struct_init  ]




/// -----------------------------------------
/// | ALLOCATED                             |
/// -----------------------------------------
/// [     prev_size   ][ curr_size | mmaped ]
/// [               data                    ]
/// ...