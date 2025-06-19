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

    ldp x1, x2, [x0, #OFF_MMAPED]
    stp x1, x2, [sp, #-0x10]! // store chunk flags

    ldr x1, [x0, #OFF_CURR_SIZE]
    str x1, [sp, #-0x10]! // save chunk size


    // todo check binlists/flag for invalid frees
    // b.ne .invalid_free

    bl get_struct
    cmp x0, #0
    beq .ret_nostack

    ldr x1, [sp]
    cmp x1, #SMALLBIN_SIZE
    b.gt .big_chunk // check the chunk's size 


    // small chunks goes into binlists
    ldr x1, [sp, 0x20]
    ldr x2, [sp]
    bl do_binlist_free

.big_chunk: // bigger chunks should be on unsortedbin, or on mmaped bins.


.invalid_free:
.ret:
    add sp, sp, 0x30
.ret_nostack:
    ldp x29, x30, [sp], #0x10
    ret
