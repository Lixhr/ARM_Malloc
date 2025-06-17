#include "consts.S"

.section .text
.global pop_from_binlist, create_new_chunk
.type pop_from_binlist, %function
.type create_new_chunk, %function

/// ---------------------------------
/// | HEAP_STRUCT                   |
/// ---------------------------------
/// [   fastbins   ][   smallbins   ]

// (size, HEAP_STRUCT)
pop_from_binlist:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    cmp x0, #FASTBIN_SIZE
    b.eq .is_fastbin
    add x1, x1, 0x10 // get the corresponding binlist pointer 
.is_fastbin:

    str x0, [x1] // dereference the head
    cmp x0, #0
    b.eq .ret // nothing in binlist, ret 0

    ldr x3, [x0, #OFF_NEXT] 
    str x3, [x1] // head = curr->next

    str xzr, [x3] // curr->prev = NULL

.ret:
    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret

// (page_pointer, chunk_size, page_size)
create_new_chunk:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    add x4, x0, x2 // top_chunk_limit

    ldr x3, [x0, #TOP_CHUNK]
    mov x5, x3 // store current top chunk
    add x5, x5, x1
    cmp x5, x4 // if (top_chunk + chunk_size > page_pointer + page_size)
    b.gt .end_of_page

    str x5, [x0, #TOP_CHUNK] // store new top chunk
    mov x3, x0



    
    b .ret_chunk

.end_of_page:
    mov x0, #0
.ret_chunk:
    ldp x29, x30, [sp], #0x10
    ret