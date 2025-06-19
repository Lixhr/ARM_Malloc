#include "../includes/armalloc.h"
#include <string.h>
#include <stdlib.h>

int main() {

    char *p1 = ft_malloc(0x40);

    while (p1) {

        strcpy(p1, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
        p1 = ft_malloc(0x40);
        printf("%p\n", p1);

    }



    return 0;
}