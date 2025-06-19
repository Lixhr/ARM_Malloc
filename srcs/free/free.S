#include "consts.S"

.section .text
.global ft_free
.type ft_free, %function


ft_free:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    cmp x0, #0
    b.eq .ret_nostack // return if zero

    str x0, [sp, #-0x10]!
    sub x0, x0, 0x10

    ldp w1, w2, [x0, #OFF_MMAPED]
    stp w1, w2, [sp, #-0x10]! // store chunk flags

    // todo check binlists/flag for invalid frees
    // b.ne .invalid_free

    bl get_struct
    cmp x0, #0
    beq .ret_nostack

    add x0, x0, #OFF_FASTBIN
    ldr x1, [sp, 0x10]
    bl do_binlist_free

//    ldp w1, w2, [x0, ]

.invalid_free:
.ret:
    add sp, sp, 0x20
.ret_nostack:
    ldp x29, x30, [sp], #0x10
    ret
