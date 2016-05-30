//
//  STMyLotteryViewController.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STMyLotteryViewController.h"
#import "STSettingViewController.h"



@interface STMyLotteryViewController ()

@property (nonatomic, weak) IBOutlet UIButton *loginButotn;

@end



@implementation STMyLotteryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage *image = _loginButotn.currentBackgroundImage;

    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5
                                       topCapHeight:image.size.height * 0.5
    ];

    [_loginButotn setBackgroundImage:image
                            forState:UIControlStateNormal
    ];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageNamed:@"Mylottery_config"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(setting)
    ];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"客服"
            forState:UIControlStateNormal
    ];
    [button setImage:[UIImage imageNamed:@"FBMM_Barbutton"]
            forState:UIControlStateNormal
    ];
    [button sizeToFit];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)setting;
{
    STSettingViewController *settingViewController = [[STSettingViewController alloc] init];
    [self.navigationController pushViewController:settingViewController
                                         animated:YES
    ];
}


@end
