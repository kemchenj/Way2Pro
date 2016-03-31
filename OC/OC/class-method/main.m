//
//  main.m
//  class-method
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iPhone : NSObject
{}
-(char*)loadMessage;
-(int)signal:(int)number;
-(int)sendMessageWithNumber:(int)number andContent:(char*)content;
+(int)sumWithValue:(int)value1 andValue2:(int)value2;
+(void)demo;
@end

@implementation iPhone

-(char*)loadMessage
{
    return "wife is god";
}

-(int)signal:(int)number
{
    NSLog(@"打电话给%i", number);
    return 1;
}

-(int)sendMessageWithNumber:(int)number andContent:(char *)content
{
    NSLog(@"发短信给%i, 内容是%s", number, content);
    return 1;
}

+(int)sumWithValue:(int)value1 andValue2:(int)value2
{
    return value1 + value2;
}

+(void)demo
{
    NSLog(@"demo");
}
@end

int main(int argc, const char * argv[]) {
    iPhone *p = [iPhone new];
    
    int result = [iPhone sumWithValue:10 andValue2:33];
    NSLog(@"%d", result);
    [iPhone demo];
    
    return 0;
}
