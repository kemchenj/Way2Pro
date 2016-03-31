//
//  Android.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

// 继承了来自Phone的属性和方法
@interface Android : Phone
-(void)setCpu:(int)cpu;
-(int)cpu;

@end