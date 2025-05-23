.equ MMAP_SYSCALL, 9
.equ PAGE_SIZE, 0x1000
.equ PROT, 0x1 | 0x2 // read | write

.global get_page

get_page:
    mov x8, #MMAP_SYSCALL // mmap
    mov x0, #0
    mov x1, #PAGE_SIZE
    mov x2, #PAGE_FLAG