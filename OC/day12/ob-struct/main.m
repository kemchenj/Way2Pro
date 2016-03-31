//
//  main.m
//  ob-struct
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct{
    int year;
    int month;
    int day;
}Date;

@interface Student : NSObject
{
    @public
    NSString * _name;
    Date _birthday;
}
-(void)say;
@end

@implementation Student
-(void)say
{
    NSLog(@"name = %@; year = %i, month = %i, day = %i", _name, _birthday.year, _birthday.month, _birthday.day);
}
@end

int main(int argc, const char * argv[]) {
    Student *stu = [Student new];
    
    stu->_name = @"lnj";
    
    Date d = {1986, 1, 15};
    stu->_birthday = d;
    
    [stu say];
    
    return 0;
}
