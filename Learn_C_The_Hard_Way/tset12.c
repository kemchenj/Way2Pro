#include <stdio.h>
#include <stdlib.h>

int main(int argc, char const *argv[]) {
        int number=0, number2=0;
        char char1;
        scanf("%d%c%d", &number, &char1, &number2);
        printf("%d, %c, %d\n", number, char1, number2);

        // setbuf(stdin, NULL);
        int c;
        while((c = getchar()) != '\n' && c != EOF);
        
        int number3=0;
        char char2;
        scanf("%d%c", &number3, &char2);
        printf("%d, %c\n", number3, char2);

        return 0;
}
