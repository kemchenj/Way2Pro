//
//  STTg.m
//  customCell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTg.h"

@implementation STTg

+(instancetype)tgWithDict:(NSDictionary *)dict
{
    STTg *tg = [[STTg alloc] init];
    [tg setValuesForKeysWithDictionary:dict];
    return tg;
}

@end
