#include "consts.S"

.section .text
.global do_binlist_free
.type do_binlist_free, %function

// (&(MALLOC_STRUCT->binlist), chunk_address)
do_binlist_free:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    str xzr, [x1, #OFF_PREV] // chunk->prev = NULL

    ldr x3, [x0]
    str x3, [x1, #OFF_NEXT] // chunk->next = head

    cmp x3, #0
    b.eq .ret // avoid null ptr dereference

    str x1, [x3, #OFF_PREV] // head->prev = chunk
    str x1, [x0] // update head
.ret:
    ldp x29, x30, [sp], #0x10
    ret
