//
//  Person.h
//  day12
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iPhone.h"

@interface Person : NSObject
{
    @public
    int _age;
    NSString *_name;
}
-(void)say;
-(void)signal:(iPhone *)phone;
@end