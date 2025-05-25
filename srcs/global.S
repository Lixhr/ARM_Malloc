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
/// [   prev_page  ][   next_page   ]
/// [   top_chunk  ][]
/// [            chunks             ]
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
// maybe other data



