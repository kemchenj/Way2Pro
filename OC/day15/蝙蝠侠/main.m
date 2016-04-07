//
//  main.m
//  蝙蝠侠
//
//  Created by kemchenj on 3/31/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lieren.h"
#import "Enemy.h"
#import "che.h"
#import "Gun.h"

int main(int argc, const char * argv[]) {
    lieren* lnj = [lieren new];
    [lnj setCar:[che new]];
    [lnj.car setRocket: [Gun new]];
    
    dog* Dumb = [dog new];
    [lnj shoot:Dumb];
    return 0;
}
