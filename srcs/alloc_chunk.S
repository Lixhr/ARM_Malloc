#include "consts.S"

.section .text
.global get_aligned_size, get_chunk_size
.type get_aligned_size, %function
.type get_chunk_size, %function

// aligned = (size + 15) & ~15

// size = 88               =  1011000	
// size = size + 15 = 103  =  1100111
// aligned = size & ~15    =  1100111 & 0xffff..00

get_aligned_size:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    cmp x0, #0
    beq .zero_case

    add x0, x0, #15
    mov x1, #15
    mvn x1, x1 // x1 = ~15

    and x0, x0, x1
    b .ret
.zero_case:
    mov x0, #0x10
.ret:
    ldp x29, x30, [sp], #0x10
    ret

// (size+0x10) -> returns the real chunk size
get_chunk_size:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    bl get_aligned_size
    add x0, x0, #OFF_DATA // adding the header's size

    cmp x0 , #SMALLBIN_SIZE
    b.gt  .ret // mmaped page, no need to round

    cmp x0, #FASTBIN_SIZE
    b.gt .is_smallbin // greater than fastbin -> smallbin

    mov x0, #FASTBIN_SIZE
    b .ret_size

.is_smallbin:
    mov x0, #SMALLBIN_SIZE
.ret_size:
    ldp x29, x30, [sp], #0x10
    ret