#include "consts.S"

.section .text
.global do_sized_malloc, pop_from_binlist
.type do_sized_malloc, %function
.type pop_from_binlist, %function

// (MALLOC_STRUCT, chunk size)
do_sized_malloc:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    stp x0, x1, [sp, #-0x10]!

.retry:
    ldp x0, x1, [sp]
    ldr x2, [x0, #OFF_PAGE_SIZE]
    ldr x0, [x0, #OFF_PAGE_HEAD]
    bl create_new_chunk
    cmp x0, #0
    b.ne .ret

    // page is full, try another.
    ldr x0, [sp] 
    ldr x0, [x0] // page = page->next
    cmp x0, #0
    b.ne .retry

    // last page, push a new
    ldr x0, [sp]
    bl push_new_page
    cmp x0, #0
    b.eq .ret // mmap could fail, return 0

    b .retry
.ret:
    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret