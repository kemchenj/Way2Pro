//
//  main.m
//  class-method2
//
//  Created by xmg on 3/20/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kIColorBlack,
    kIColorWhite,
    kIColorRichyGold
} IColor;
// 定义一个枚举类型iColor

@interface iPhone : NSObject
{
    @public
    float _model;
    int _cpu;
    double _size;
    IColor _color;
}
-(void)about;
+(NSString *)colorWithNumber:(IColor)number;
@end

@implementation iPhone

-(void)about
{
    NSString *name = [iPhone colorWithNumber:_color];
    NSLog(@"型号=%f, cpu=%i, 尺寸=%f, 颜色=%@", _model, _cpu, _size, name);
}

+(NSString *)colorWithNumber:(IColor)number
{
    NSString *name;
    switch (number){
        case 0:
            name = @"黑色";
            break;
        case 1:
            name = @"白色";
            break;
        case 2:
            name = @"土豪金";
            break;
        default:
            name = @"华强北";
            break;
    }
    return name;
}
  
@end

int main(int argc, const char * argv[]) {
    iPhone *p = [iPhone new];
    p->_color = kIColorRichyGold;
    [p about];
    
    return 0;
}
