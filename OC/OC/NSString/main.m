//
//  main.m
//  NSString
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct{
    int year;
    int month;
    int day;
}MyDate;

@interface Person : NSObject
{
    @public
    NSString *_name; //定义姓名
    MyDate _birthday; //定义生日
}
@end

@implementation Person
@end

int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    p->_name = @"sb";
    
    //因为结构体已经初始化为0了, 再次初始化的时候就会报错了,但是可以逐个赋值.
    //p->_birthday = {1990, 12, 3};
    p->_birthday.year = 2014;
    p->_birthday.month = 05;
    p->_birthday.day = 12;
    NSLog(@"%@d的生日是:%d年%d月%d日", p->_name, p->_birthday.year, p->_birthday.month, p->_birthday.day);
    
    //也可以整体赋值
    MyDate de={1993, 11, 11};
    p->_birthday = de;
    NSLog(@"%@d的生日是:%d年%d月%d日", p->_name, p->_birthday.year, p->_birthday.month, p->_birthday.day);
    
    return 0;
}
