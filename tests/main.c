#include "../includes/armalloc.h"
#include <string.h>

int main() {

    // for (size_t i = 0 ; i < 0x10; i ++) {
    //     char *p = ft_malloc(0x50);
    //     if (p) {
    //         strcpy(p,  "AAAAA");
    //     }
    //     printf(">> %p\n", p );
    // }

    // char *p1 = ft_malloc(0x50);
    //         // strcpy(p,  "AAAAA");

    // char *p2 = ft_malloc(0x50);
    // char *p3 = ft_malloc(0x50);
    // char *p4 = ft_malloc(0x50);

    // ft_free(p1);
    // ft_free(p2);
    // ft_free(p3);
    // ft_free(p4);


    // p1 = ft_malloc(0x50);
    // p2 = ft_malloc(0x50);
    // p3 = ft_malloc(0x50);
    // p4 = ft_malloc(0x50);


    char *p1 = ft_malloc(0x150);
    char *p2 = ft_malloc(0x150);
    char *p3 = ft_malloc(0x150);


    ft_free(p1);
    ft_free(p2);
    ft_free(p3);

    return 0;
}