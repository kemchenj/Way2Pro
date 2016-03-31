//
//  main.m
//  multiObjManageEx
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"

int main(int argc, const char * argv[]) {
    // 1.给老王创建账号
    Account *lwAccount = [[Account alloc] init];
    lwAccount.email = @"xiaomage@520it.com";
    lwAccount.pwd = @"haomage";
    lwAccount.registerTime = (MyDate){2010, 1, 1, 17, 56, 34};
    
    // 2.根据账号设置用户信息
    Author *lwAuthor = [[Author alloc] init];
    lwAuthor.name = @"老王";
    lwAuthor.icon = @"lw.png";
    lwAuthor.vip = YES;
    lwAuthor.account = lwAccount;
    lwAuthor.birthday = (MyDate){1986, 3, 8, 18, 18, 18};
    
    // 3.发布微博
    Status *lwStatus = [[Status alloc] init];
    lwStatus.text = @"爆米花手机比逼格更有逼格";
    lwStatus.picture = @"phone.png";
    lwStatus.createTime = (MyDate){2015, 6, 20, 10, 23, 23};
    lwStatus.author = lwAuthor;
    lwStatus.commentCount = 100;
    lwStatus.reTweetCount = 90;
    lwStatus.likeCount = 200;
    
    // 1.给王大锤创建账号
    Account *dcAccount = [[Account alloc] init];
    dcAccount.email = @"dachuimeimei@520it.com";
    dcAccount.pwd = @"654321";
    dcAccount.registerTime = (MyDate){2012, 8, 8, 19, 26, 54};
    
    // 2.根据账号设置用户信息
    Author *dcAuthor = [[Author alloc] init];
    dcAuthor.name = @"王大锤";
    dcAuthor.icon = @"wdc.png";
    dcAuthor.vip = NO;
    dcAuthor.account = dcAccount;
    dcAuthor.birthday = (MyDate){1989, 9, 6, 14, 16, 28};

    // 3.发布微博
    Status *dcStatus = [[Status alloc] init];
    dcStatus.text = @"真的很有逼格";
    dcStatus.picture = nil;
    dcStatus.createTime = (MyDate){2015, 6, 21, 20, 47, 9};
    dcStatus.author = dcAuthor;
    dcStatus.commentCount = 0;
    dcStatus.reTweetCount = 0;
    dcStatus.likeCount = 0;
    dcStatus.repostStatus = lwStatus;
    
    [lwAccount release];
    [lwAuthor release];
    [lwStatus release];
    
    [dcAccount release];
    [dcAuthor release];
    [dcStatus release];
    
    return 0;
    return 0;
}
