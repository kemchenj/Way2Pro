//
//  STSaveTool.h
//  CaiPiao
//
//  Created by kemchenj on 5/23/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STSaveTool : NSObject

+(id)objectForKey:(NSString *)defaultName;
+(void)setObject:(id)value forKey:(NSString *)defaultName;

@end
