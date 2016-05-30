//
//  ViewController.m
//  NSOperation
//
//  Created by kemchenj on 5/27/16.
//  Copyright (c) 2016 ST. All rights reserved.
//


#import "ViewController.h"



@interface RecipentUploadOperation : NSOperation
{
    NSPort *port;
    BOOL   runloopRunningman;
}

@property (nonatomic, strong) UIImage  *image;
@property (nonatomic, strong) NSString *JSON;

@end



@implementation RecipentUploadOperation

- (void)main;
{
    @autoreleasepool {
        [someAPI uploadImageData:UIImageJPEGRepresentation(self.image)
                        callback:^(
        [self quitRunLoop];
        )];
    }
}


@end



@interface ViewController ()

@end



@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end