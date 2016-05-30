//
// Created by kemchenj on 5/30/16.
// Copyright (c) 2016 kemchenj. All rights reserved.
//

#import "STApp.h"



@implementation STApp

- (STApp *)appWithDict:(NSDictionary *)dictionary;
{
    STApp *app = [[STApp alloc] init];
    [app setValuesForKeysWithDictionary:dictionary];
    return app;
}


@end