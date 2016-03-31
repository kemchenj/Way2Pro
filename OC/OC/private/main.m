//
//  main.m
//  private
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
@end

@implementation Dog

-(void)eat
{
    NSLog(@"啃骨头");
}
@end

int main(int argc, const char * argv[]) {
    Dog *d = [Dog new];
    SEL s1 = @selector(eat);
    [d performSelector:s1];
    
    return 0;
}
