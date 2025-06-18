#include "../includes/armalloc.h"
#include <string.h>

int main() {

    for (size_t i = 0 ; i < 1000; i ++) {
        char *p = ft_malloc(0x50);
        if (p) {
            strcpy(p,  "AAAAA");
        }
        printf(">> %p\n", p );
    }


    // printf("======CHUNK HEADER======\n");
    // char *p = ft_malloc(0x50);


    // printf("SIZE: %lx    | FLAG: %lx\n", (unsigned long)*(p-0x10), (unsigned long)*(p-0x8));

    return 0;
}