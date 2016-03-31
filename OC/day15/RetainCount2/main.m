//
//  main.m
//  RetainCount2
//
//  Created by xmg on 3/25/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RetainTracker : NSObject
@end

@implementation RetainTracker

-(id)init
{
    if (self = [super init]) {
        NSLog(@"init: Retain count of %lu.", [self retainCount]);
    }
    return (self);
}

-(void)dealloc
{
    NSLog(@"dealloc called. Bye Bye.");
    [super dealloc];
}
@end

int main(int argc, const char * argv[]) {
    NSAutoreleasePool *pool;
    pool = [[NSAutoreleasePool alloc] init];
    // 创建一个自动释放池
    // 每次向某个对象发送autorelease的时候,这个对象都会被添加到这个自动释放池里
    
    RetainTracker *tracker;
    tracker = [RetainTracker new]; // count: 1
    // 创建一个新的tracker对象,因为它在创建时接收了一条new信息,所以其保留计数器的值为1
    
    [tracker retain]; // count: 2
    // 保留一次,计数器加1
    [tracker autorelease]; //count: still 2
    // 加入到自动释放池里
    [tracker release];// count: 1
    
    NSLog(@"releasing pool");
    [pool release];
    // 此时tracker存在于自动释放池里,所以计数器从1减到0,被释放掉
    // gets nuked, sends release to tracker
    @autoreleasepool {
        RetainTracker *tracker2;
        tracker2 = [RetainTracker new];// count: 1
        [tracker2 retain]; // count: 2
        [tracker2 autorelease]; // count: still 2
        [tracker2 release]; // count: 1
        
        NSLog(@"auto releasing pool");
    }
    return 0;
}
