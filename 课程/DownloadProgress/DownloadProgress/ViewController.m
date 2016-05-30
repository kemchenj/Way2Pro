//
//  ViewController.m
//  DownloadProgress
//
//  Created by kemchenj on 5/13/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STProgressView.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel        *labelView;
@property (weak, nonatomic) IBOutlet STProgressView *progressView;

@end



@implementation ViewController

- (IBAction)valueChanged:(UISlider *)sender
{
    self.labelView.text        = [NSString stringWithFormat:@"%.2f%%", sender.value * 100];
    self.progressView.progress = sender.value;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
