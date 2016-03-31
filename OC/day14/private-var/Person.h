//
//  Person.h
//  day14
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
    
    @protected
    double _height;
    
    @private
    NSString *_name;
    
    @package
    double _weight;
}
@end