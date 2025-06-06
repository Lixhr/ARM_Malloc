#include "consts.S"

.global init_struct
.global get_struct
.type init_struct, %function
.type get_struct, %function

//----------------------------------------------//

get_struct:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    adrp x20, :got:HEAP_STRUCT
    ldr  x20, [x20, :got_lo12:HEAP_STRUCT]
    str x20, [sp, #-0x10]! // store struct

    ldr x19, [x20, #OFF_STRUCT_INIT]
    cmp x19, #0           // first call?
    bne .no_need_init

    mov x0, x20
    bl init_struct
    cmp x0, #0
    beq .ret

.no_need_init:
    ldr x0, [sp]
.ret:
    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret


//----------------------------------------------//


init_struct:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    mov x20, x0
    str x0, [sp, #-0x10]!

    bl getpagesize
    cmp x0, #0
    beq .init_ret
    str x0, [x20, #OFF_PAGE_SIZE]

    mov x0, x20
    bl push_new_page
    cmp x0, #0
    beq .ret

    ldr x20, [sp]
    mov x21, #1
    str x21, [x20, #OFF_STRUCT_INIT]
    mov x0, x20
    b .init_ret

.init_error:
    mov x0, #0
.init_ret:
    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret