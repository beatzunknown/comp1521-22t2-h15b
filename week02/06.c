#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100 || x >= 1000) goto else_case;
    printf("medium\n");
    goto end;

    else_case:
    printf("small/big\n");

    end:

    return 0;
}
