//
//  STPushViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STPushViewController.h"
#import "STArrowItem.h"
#import "STAwardViewController.h"
#import "STScoreViewController.h"
#import "STGroupItem.h"



@implementation STPushViewController

- (void)viewDidLoad;
{
    [super viewDidLoad];

    [self setupGroup0];
}

-(void)setupGroup0
{
    STArrowItem *item = [STArrowItem itemWithIcon:nil
                                            title:@"开奖推送"
    ];
    item.descVcClass = [STAwardViewController class];

    STArrowItem *item1 = [STArrowItem itemWithIcon:nil
                                            title:@"比分直播"
    ];
    item1.descVcClass = [STScoreViewController class];
    STArrowItem *item2 = [STArrowItem itemWithIcon:nil
                                             title:@"比分直播"
    ];
    STArrowItem *item3 = [STArrowItem itemWithIcon:nil
                                             title:@"比分直播"
    ];

    STGroupItem *group = [[STGroupItem alloc] init];

    group.items = @[item, item1, item2, item3];

    [self.groups addObject:group];
}

@end
