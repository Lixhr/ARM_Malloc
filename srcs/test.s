.text
.global get_struct
.type get_struct, %function

get_struct:
    adrp x0, :got:HEAP_STRUCT
    ldr  x0, [x0, :got_lo12:HEAP_STRUCT]
    ret

init_page_size:
    adrp x0, :got:HEAP_STRUCT
    ldr  x0, [x0, :got_lo12:HEAP_STRUCT]
    ret
