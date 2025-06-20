#include "../includes/armalloc.h"
#include <string.h>
#include <stdlib.h>

void    fill(char *buf, size_t n, char c) {
    while (n) {
        *buf = c;
        buf ++;
        n --;
    }
}

int main() {
    char *fasts[100] = {0};
    char *small[100] = {0};


    for (size_t i = 0; i < 10; i ++) {
        fasts[i] = ft_malloc(0x40);
        fill(fasts[i], 0x40, 'A');

        small[i] = ft_malloc(0x170);
        fill(small[i], 0x170, 'B');
    }



    for (size_t i = 0; i < 10; i ++) {
        ft_free(fasts[i]);

        ft_free(small[i]);

    }




    return 0;
}