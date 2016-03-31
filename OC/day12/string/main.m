//
//  main.m
//  string
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iPhone : NSObject
- (NSString *)loadMessage;
@end

@implementation iPhone
- (NSString *)loadMessage
{
    return @"fire";
}
@end

int main(int argc, const char * argv[])
{
    NSString *str = @"game";
    NSUInteger len = [str length];
    NSLog(@"len = %lu", len);
    return 0;
}
