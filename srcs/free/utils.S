#include "consts.S"

.section .text
.global get_page_base
.type get_page_base, %function

get_page_base:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    str x0, [sp, #-0x10]!

    bl getpagesize
    sub x0, x0, #1
    mvn x0, x0 // x0 = ~x0

    ldr x1, [sp]
    and x0, x0, x1

    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret