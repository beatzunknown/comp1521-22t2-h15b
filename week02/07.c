#include <stdio.h>

int main(void) {
    int x = 24;

    loop:
    if (x >= 42) goto loop_end;
    printf("%d",x);
    printf("%c",'\n');
    x += 3;
    goto loop;

    loop_end:
    
    return 0;
}
