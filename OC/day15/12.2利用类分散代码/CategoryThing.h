//
//  CategoryThing.h
//  day15
//
//  Created by xmg on 3/28/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryThing : NSObject
{
    NSInteger thing1;
    NSInteger thing2;
    NSInteger thing3;
}
@end

@interface CategoryThing (Thing1)
-(void) setThing1: (NSInteger)thing1;
-(NSInteger)thing1;
@end

@interface CategoryThing (Thing2)
-(void) setThing2: (NSInteger)thing2;
-(NSInteger)thing2;
@end

@interface CategoryThing (Thing3)
-(void) setThing3: (NSInteger)thing3;
-(NSInteger)thing3;
@end