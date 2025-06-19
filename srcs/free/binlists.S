#include "consts.S"

.section .text
.global do_binlist_free
.type do_binlist_free, %function

// (&(MALLOC_STRUCT->binlist), chunk_address, chunk_size)
do_binlist_free:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    cmp x2, #FASTBIN_SIZE
    b.le .is_fastbin
    add x0, x0, #OFF_SMALLBIN
.is_fastbin:
    ldr x4, [x0] // current head
    cmp x4, #0
    b.eq .no_head // avoid null ptr dereference

    str x1, [x4, #OFF_PREV] // old->prev = curr

.no_head:
    str x4, [x1, #OFF_NEXT] // curr->next = old | NULL
    str xzr, [x1, #OFF_PREV] // curr->prev = NULL

    str x1, [x0] // update head
.ret:
    ldp x29, x30, [sp], #0x10
    ret
