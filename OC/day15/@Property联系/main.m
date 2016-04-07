//
//  main.m
//  @Property联系
//
//  Created by kemchenj on 4/5/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
#import "Account.h"
#import "Status.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Author *lw = [[Author alloc] initWithName:@"laowan" andPwd:@"xiaomage" andRegisterTime:@"2010-1-1 17:56:34"];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // NSString转NSDate
        lw.birthday = [formatter dateFromString:[NSString stringWithFormat:@"1986-3-8 18:18:18"]];
        
        Status *somethingNew = [[Status alloc]initWithPicture:@"phone.png" WithText:@"爆米花手机" withCreateTime:@"2015-6-20 10:23:23" withAuthor:lw];
        
//        NSLog(@"%@", lw);
        NSLog(@"%@", somethingNew);
    }
    return 0;
}
