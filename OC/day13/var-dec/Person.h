//
//  Person.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
    
    @private
    double _height;
    
    @protected
    double _weight;
    
    @package
    NSString *_name;
    NSString *_tel;
    NSString *_email;
}
@end