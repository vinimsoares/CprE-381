#include <stdio.h>
#include <stdlib.h>

//Name it differtly to avoid conflict with std librarys
char * strcpy_new(char *dest, const char* src){

    char *value = dest;
    while(*src != '\0'){
        *dest = *src;
        dest++;
        src++;
    }
    *dest = '\0';
    return value;
}



int main(){

    char src[] = "Hello World!";
    char dest[20];

    strcpy_new(dest, src);

    printf("Source: %s\n", src);
    printf("Destination: %s\n", dest);

    strcpy_new(dest, "Second try");

    printf("Destination: %s\n", dest);



    return 0;
}