//
//  ViewController.m
//  atom
//
//  Created by kemchenj on 5/20/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet DrawView *drawView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)startAction:(id)sender
{
    [_drawView startAnimate];
    NSLog(@"test");
}

- (IBAction)ReDraw:(id)sender
{
    [_drawView reDraw];
    NSLog(@"text");
}

@end
