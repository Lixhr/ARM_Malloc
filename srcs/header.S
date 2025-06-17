#include "consts.S"

.section .text
.global forge_header
.type forge_header, %function

// (chunk, size, is_mmaped)
forge_header:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    str x1, [x0, #OFF_CURR_SIZE]
    str x2, [x0, #OFF_FLAGS]

    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret