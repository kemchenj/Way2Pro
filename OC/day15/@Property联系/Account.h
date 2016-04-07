//
//  Account.h
//  day15
//
//  Created by kemchenj on 4/5/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Status;

@interface Account : NSObject

@property NSDate *registerTime;
@property NSString *name;
@property NSString *pwd;

-(id)initWithName:(NSString*)name andPwd:(NSString*)password andRegisterTime:(NSString *)time;

@end
