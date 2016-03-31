//
//  Person.h
//  day14
//
//  Created by xmg on 3/22/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property int age;

+(void)test;
-(void)demo;
-(void)signalWithNumber:(NSString *)number;
-(void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content;
-(void)makeObject:(id)obj andSel:(SEL)sel;

@end