//
//  main.m
//  self-2
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPhone.h"

@interface tst : NSObject
{
    @public
    iPhone *tt;
}
@end

@implementation tst
@end

int main(int argc, const char * argv[]) {
    tst *ttt = [tst new];
    ttt->tt= [iPhone new];
    NSLog(@"ttt->tt= %p", ttt->tt);
    NSLog(@"ttt    = %p", ttt);
    [ttt->tt cameraWithFlashlightStatus: kFlashlightStatusOn];
    
    return 0;
}
