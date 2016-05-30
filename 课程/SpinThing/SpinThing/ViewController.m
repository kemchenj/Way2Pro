//
//  ViewController.m
//  SpinThing
//
//  Created by kemchenj on 5/18/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "WheelView.h"



@interface ViewController ()

@property (nonatomic, weak) WheelView *wheelView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    WheelView *wheelView = [WheelView wheel];
    wheelView.center = self.view.center;

    self.wheelView = wheelView;
    [self.view addSubview:wheelView];
}

- (IBAction)startRotation:(id)sender
{
    [_wheelView startRotate];
}

- (IBAction)pauseRotation:(id)sender
{
    [_wheelView pauseRotate];
}



@end
