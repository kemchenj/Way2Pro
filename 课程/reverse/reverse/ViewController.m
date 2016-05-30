//
//  ViewController.m
//  reverse
//
//  Created by kemchenj on 5/20/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"self.view.layer = %@", self.view.layer);

    CAReplicatorLayer *replicatorLayer = (CAReplicatorLayer *) self.view.layer;
    replicatorLayer.instanceCount     = 2;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(M_PI, 0, 0, 1);

    replicatorLayer.instanceRedOffset -= 0.2;
    replicatorLayer.instanceBlueOffset -= 0.2;
    replicatorLayer.instanceGreenOffset -= 0.2;
    replicatorLayer.instanceAlphaOffset -= 0.2;
}

@end
