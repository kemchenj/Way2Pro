//
//  STArenaNavigationController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STArenaNavigationController.h"

@interface STArenaNavigationController()
@end


@implementation STArenaNavigationController

+ (void)initialize;
{
    if (self == [STArenaNavigationController class]) {
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];

        UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];

        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5
                                           topCapHeight:image.size.height * 0.5
        ];
    }
}

- (void)viewDidLoad;
{
    [super viewDidLoad];
}



@end
