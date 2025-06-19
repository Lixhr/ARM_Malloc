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

    ldr x0, [x1] // dereference the head
    cmp x0, #0
    b.eq .ret // nothing in binlist, ret 0

    ldr x3, [x0, #OFF_NEXT] 
    str x3, [x1] // head = curr->next

    cmp x3, #0
    b.eq .ret
    str xzr, [x3] // curr->prev = NULL

.ret:
    ldp x29, x30, [sp], #0x10
    ret



// (page_pointer, chunk_size, page_size) 
create_new_chunk:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp


    ldr w3, [x0, #TOP_CHUNK] // get current top_chunk offset
    mov w5, w3
    add w5, w5, w1
    cmp w5, w2 // if (top_chunk + size > page_size) -> overflow
    b.gt .end_of_page


    str w5, [x0, #TOP_CHUNK] // store new top chunk

    ldr w6, [x0, #CHUNK_ALLOCATED]
    add w6, w6, 1
    str w6, [x0, #CHUNK_ALLOCATED] // update chunk counter

    add x0, x0, w3, uxtw // current chunk

    mov x2, #0 // is_mapped
    bl forge_header


    add x0, x0, #0x10 // the user should not be aware of the chunk's metadata
    b .ret_chunk

.end_of_page:
    mov x0, #0
.ret_chunk:
    ldp x29, x30, [sp], #0x10
    ret