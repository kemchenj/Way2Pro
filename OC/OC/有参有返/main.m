//
//  main.m
//  有参有返
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iPhone : NSObject
{
    @public
    float _model;
    int _cpu;
    double _size;
    int _color;
}
-(int)signal: (int)number;
-(int)sendMessageWithNumber:(int)number andContent:(NSString*)content;
@end

@implementation iPhone
-(int)signal:(int)number
{
    NSLog(@"打电话给%i", number);
    return 1;
}

-(int)sendMessageWithNumber:(int)number andContent:(NSString *)content
{
    NSLog(@"发信息给%i, 内容是%@", number, content);
    return 1;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        iPhone *p= [iPhone new];
        [p signal:13123123];
        [p sendMessageWithNumber:87349854 andContent:@"iosuoinqwoiiovniotio"];
    }
    return 0;
}
