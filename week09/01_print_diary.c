/*
 * This program reads the contents of "~/.diary"
 * and prints it to stdout.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    char *home_path = getenv("HOME");

    if (home_path == NULL) {
        home_path = ".";
    }

    char *filename = ".diary";
    int diary_pathname_len = strlen(home_path) +
                            strlen(filename) + 2;

    char diary_path[diary_pathname_len];
    snprintf(diary_path, sizeof diary_path, "%s/%s", home_path, filename);

    FILE *fp = fopen(diary_path, "r");
    if (fp == NULL) {
        perror(diary_path);
        return 1;
    }

    int byte;
    while ((byte = fgetc(fp)) != EOF) {
        fputc(byte, stdout);
    }

    fclose(fp);
    
    return 0;
}