//
//  Author.h
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface Author : NSObject

@property(nonatomic, retain)NSString *name;
@property(nonatomic, retain)NSString *icon;
@property(nonatomic, assign, getter=isVip)BOOL vip;
@property(nonatomic, retain)Account *account;
@property(nonatomic, assign)MyDate birthday;

@end