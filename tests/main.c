#include "../includes/armalloc.h"
#include <string.h>

int main() {

    for (size_t i = 0 ; i < 0x1f; i ++) {
        char *p = ft_malloc(0x90);
        if (p) {
            strcpy(p,  "AAAAA");
        }
        printf(">> %p\n", p );
    }


    return 0;
}