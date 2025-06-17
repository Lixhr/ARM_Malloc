#include "consts.S"

.section .text
.global ft_malloc
.type ft_malloc, %function


ft_malloc:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    str x0, [sp, #-0x10]!

    bl get_struct
    cmp x0, #0
    beq .ret
    str x0, [sp, #0x8]

    ldr x0, [sp]
    bl get_chunk_size // get the final chunk size
    str x0, [sp]

    ldr x0, [sp, #0x8]
    bl fastbin

.ret:
    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret
