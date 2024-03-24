#include <stdio.h>
#include <stdlib.h>

int main() {
    int *arr = (int *)malloc(10 * sizeof(int)); // Use malloc from the standard library
    if (arr == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        return 1;
    }
    
    for (int i = 0; i < 10; i++) {
        arr[i] = (i + 1) * (i + 1);
    }

    for (int i = 0; i < 10; i++) {
        printf("%d\n", arr[i]);
    }
    
    free(arr);
    return 0;
}
