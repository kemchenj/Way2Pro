//
//  Account.h
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct{
    int year;
    int month;
    int day;
    int hour;
    int minute;
    int second;
}MyDate;

@interface Account : NSObject

@property(nonatomic, assign)MyDate registerTime;
@property(nonatomic, retain)NSString *email;
@property(nonatomic, retain)NSString *pwd;

@end