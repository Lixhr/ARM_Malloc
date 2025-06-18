#include "consts.S"

.section .text
.global push_new_page
.type push_new_page, %function


//----------------------------------------------//


//mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
mmap_page:
    stp x29, x30, [sp, #-16]!
    mov x29, sp


    mov x0, #0
    mov x2, #MAP_PROT
    mov x3, #MAP_FLAGS
    mov x4, #-1
    mov x5, #0
    bl mmap

    cmp x0, 0
    blt .mmap_page_error

    b .mmap_page_ret
.mmap_page_error:
    mov x0, #-1

.mmap_page_ret:
    ldp x29, x30, [sp], #16
    ret



//----------------------------------------------//



// (page, struct_ptr)
fill_page_data:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    
    mov x5, 0x10
    str x5, [x0, 0x8]

    ldr x21, [x1, #OFF_PAGE_HEAD]   // x21 = struct->head
    str x21, [x0, #NEXT_PAGE]       // page->next = x21 = struct->head
    str x0, [x1, #OFF_PAGE_HEAD]

    ldp x29, x30, [sp], #16
    ret



//----------------------------------------------//



push_new_page:
    stp x29, x30, [sp, #-0x10]!
    mov x29, sp

    mov x9, x0
    str x9, [sp, #-0x10]!

    ldr x1, [x0, #OFF_PAGE_SIZE]
    bl mmap_page
    cmp x0, #0
    blt .push_error

    ldr x1, [sp]
    bl fill_page_data

    b .push_ret

.push_error:
    mov x0, #0
.push_ret:
    add sp, sp, #0x10
    ldp x29, x30, [sp], #0x10
    ret