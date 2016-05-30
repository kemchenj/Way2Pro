//
//  ViewController.m
//  PicCut
//
//  Created by kemchenj on 5/14/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Round.h"



@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView.image = [UIImage imageWithCircleBorderWH:10
                                                circleColor:[UIColor grayColor]
                                                  imageName:@"阿狸头像"
    ];
}

@end
