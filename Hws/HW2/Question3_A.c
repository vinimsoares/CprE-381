#include <stdio.h>
#include <stdlib.h>

//Name it differtly to avoid conflict with std librarys
void strcpy_new(char *dest, const char* src){
    while(*src != '\0'){
        *dest = *src;
        dest++;
        src++;
    }
    return;
}



int main(){

    char src[] = "Hello World!";
    char dest[20];

    strcpy_new(dest, src);

    printf("Source: %s\n", src);
    printf("Destination: %s\n", dest);



    return 0;
}