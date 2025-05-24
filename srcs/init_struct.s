.section .text
.global init_struct
.type init_struct, %function

get_struct:
    stp x29, x30, [sp, #-16]!
    mov x29, sp


    mov x0, #1999

    ldp x29, x30, [sp], #16
    ret

init_struct:
    ret

    //  adrp x0, :got:HEAP_STRUCT
    //  ldr  x0, [x0, :got_lo12:HEAP_STRUCT]
    //  ldr x1, [x0, #16]
    //  mov x1, x0