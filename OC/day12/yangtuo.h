//
//  yangtuo.h
//  day12
//
//  Created by xmg on 3/29/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    black,
    white
}skinColor;

@interface yangtuo : NSObject
{
    int _age;
    double _length;
    skinColor _color;
    double _weight;
}
-(void) eat;
-(void) run;
@end
