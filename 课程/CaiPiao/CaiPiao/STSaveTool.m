//
//  STSaveTool.m
//  CaiPiao
//
//  Created by kemchenj on 5/23/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STSaveTool.h"



#define STUserDefaults [NSUserDefaults standardUserDefaults]



@implementation STSaveTool

+ (id)objectForKey:(NSString *)defaultName;
{
    return [STUserDefaults objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName;
{
    [STUserDefaults setObject:value
                       forKey:defaultName
    ];
}


@end
