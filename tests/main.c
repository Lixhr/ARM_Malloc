#include "../includes/armalloc.h"

int main() {
    char *test1 = ft_malloc(0x50);
    char *test2 = ft_malloc(0x50);

    printf("1: %p\n", test1);
    printf("2: %p\n", test2);

    sprintf("AAAAA", test1);
    sprintf("BBBBB", test2);


    return 0;
}