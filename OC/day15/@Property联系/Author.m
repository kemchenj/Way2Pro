//
//  Author.m
//  day15
//
//  Created by kemchenj on 4/5/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Author.h"

@implementation Author

-(NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"My account is %@, pwd is %@, registerDate is %@, icon is %@, birthday is %@", self.name, self.pwd, self.registerTime, self.icon, self.birthday];
    return desc;
}

@end
