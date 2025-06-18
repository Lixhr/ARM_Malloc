#include "../includes/armalloc.h"
#include <string.h>

int main() {

    // for (size_t i = 0 ; i < 0x10; i ++) {
    //     char *p = ft_malloc(0x60);
    //     if (p) {
    //         strcpy(p,  "AAAAA");
    //     }
    //     printf(">> %p\n", p );
    // }

    char *p1 = ft_malloc(0x60);
    char *p2 = ft_malloc(0x60);
    char *p3 = ft_malloc(0x60);
    char *p4 = ft_malloc(0x60);

    ft_free(p1);
    ft_free(p2);
    ft_free(p3);
    ft_free(p4);
    // printf("======CHUNK HEADER======\n");
    // char *p = ft_malloc(0x50);


    // printf("SIZE: %lx    | FLAG: %lx\n", (unsigned long)*(p-0x10), (unsigned long)*(p-0x8));

    return 0;
}