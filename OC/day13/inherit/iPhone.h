//
//  iPhone.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

//iPhone继承了来自于Phone的属性和方法
@interface iPhone : Phone
-(void)setCpu:(int)cpu;
-(int)cpu;
@end
