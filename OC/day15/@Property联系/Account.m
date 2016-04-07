//
//  Account.m
//  day15
//
//  Created by kemchenj on 4/5/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Status.h"
#import "Account.h"

@implementation Account

-(id)initWithName:(NSString*)name andPwd:(NSString*)password andRegisterTime:(NSString *)time;
{
    if (self = [super init]) {
        self.name = name;
        self.pwd = password;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // NSString转NSDate
        self.registerTime = [formatter dateFromString:time];
    }
    return self;
}

@end
