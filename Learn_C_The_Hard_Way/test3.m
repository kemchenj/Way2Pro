// #include <stdio.h>
#import <Foundation/Foundation.h>

int main(int argc, char const *argv[]) {
    int (^sumBlock)(int, int) = ^(int value1, int value2){
        return value1 + value2;
    };

    int res = sumBlock(10, 20);
    NSLog(@"res = %i", res);

    int (^minusBlock)(int, int) = ^(int value1, int value2){
        return value1 - value2;
    };

    res = minusBlock(10, 20);
    NSLog(@"res = %i", res);

    return 0;
}
