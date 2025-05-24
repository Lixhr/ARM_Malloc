.section .data
.global HEAP_STRUCT
.type HEAP_STRUCT, %object
.size HEAP_STRUCT, 8
.hidden HEAP_STRUCT

HEAP_STRUCT:
	.quad 0
