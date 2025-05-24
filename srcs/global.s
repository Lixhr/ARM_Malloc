.section .data
.global HEAP_STRUCT
.type HEAP_STRUCT, %object
.size HEAP_STRUCT, 56
.hidden HEAP_STRUCT

HEAP_STRUCT:
	.zero 56

/// ---------------------------------
/// PAGE STRUCTURE                  |
/// ---------------------------------
/// [   prev_page  ][   next_page   ]
/// [   top_chunk  ][]
/// [            chunks             ]
/// [            chunks             ]
/// [            chunks             ]
/// ...



/// ---------------------------------
/// HEAP_STRUCT                     |
/// ---------------------------------
/// [   fastbins   ][    smallbins  ]
/// [   largebins  ][  unsortedbin  ]
/// [     mutex    ][  first_page   ]
/// [   page_size  ] // maybe other data



