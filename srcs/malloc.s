.section .text
.global ft_malloc
.type ft_malloc, %function


ft_malloc:
    stp x29, x30, [sp, #-16]!  // save fp / lr
    mov x29, sp

    bl get_struct

    ldp x29, x30, [sp], #16 // retore ret from frame pointer
    ret
