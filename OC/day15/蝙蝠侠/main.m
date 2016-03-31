//
//  main.m
//  蝙蝠侠
//
//  Created by kemchenj on 3/31/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Batman.h"
#import "Enemy.h"
#import "BatmanTank.h"
#import "Launcher.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		Batman* lnj = [Batman new];
		[lnj setCar:[BatmanTank new]];
		[lnj.car setRocket: [Launcher new]];
		
		Enermy* Dumb = [Enermy new];
		[lnj shoot:Dumb];
	}
    return 0;
}
