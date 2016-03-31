//
//  Phone.m
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

@implementation Phone

-(void)signalWithNumber:(NSString *)number
{
    NSLog(@"利用手机打电话给%@", number);
}

-(void)sendMessageWithNumbhr:(NSString *)number andContent:(NSString *)content
{
    NSLog(@"利用手机发短信给%@, 内容是%@", number, content);
}

+(void)brand
{
    NSLog(@"品牌");
}
@end
