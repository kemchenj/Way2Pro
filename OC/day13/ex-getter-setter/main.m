//
//  main.m
//  ex-getter-setter
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "kLine.h"

int main(int argc, const char * argv[]) {
    kLine *line = [kLine new];
    [line setMax:200];
    [line setMin:100];
    
    NSLog(@"min = %i, max = %i, average = %i", [line min], [line max], [line average]);
    [line average];
    [line average];
    [line average];
    [line average];
    return 0;
}
