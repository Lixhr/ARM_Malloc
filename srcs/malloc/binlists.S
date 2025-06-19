#include "consts.S"

.section .text
.global do_sized_malloc, pop_from_binlist
.type do_sized_malloc, %function
.type pop_from_binlist, %function

// (MALLOC_STRUCT)
do_sized_malloc:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    mov x1, #FASTBIN_SIZE
    stp x0, x1, [sp, #-0x10]!

    ldr x2, [x0, #OFF_PAGE_SIZE]
    ldr x0, [x0, #OFF_PAGE_HEAD]

    bl create_new_chunk

    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret