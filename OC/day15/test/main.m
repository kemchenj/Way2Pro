//
//  main.m
//  test
//
//  Created by xmg on 3/25/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>

int main(){
    char *str = "kem";
    char *str2 = "gmail\n";
    char *str3 = "google\n";
    char *str5 = "loading\n";
    const char str4[] = "test\n";
    char str6[] = "get\n";
    
    printf("%p\n", str);
    printf("%p\n", &str);
    printf("%p\n", str4);
    printf("%p\n", str6);
    
    for (int i=0; i<50; i++) {
        printf("%c", str[i]);
    }
    printf("\n");
    return 0;
}
