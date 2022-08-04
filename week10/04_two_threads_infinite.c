/*
 * Example of two threads running infinitely.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <pthread.h>

void *thread_code(void *data) {
    char *string = (char *) data;

    while (true) {
        printf("%s", string);
    }

    return NULL;
}

int main(int argc, char *argv[]) {
    pthread_t thread;

    pthread_create(&thread, NULL, thread_code, "Hello\n");

    while (true) {
        printf("there\n");
    }

    pthread_join(thread, NULL);

    return EXIT_SUCCESS;
}
