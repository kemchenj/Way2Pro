//
//  ViewController.m
//  GCD队列
//
//  Created by kemchenj on 5/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end



@implementation ViewController

- (IBAction)click:(id)sender
{
    [self test];
}

- (void)test;
{
    NSLog(@"test");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);

    dispatch_group_async(group, queue, ^{
        NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://media.licdn.com/mpr/mpr/shrinknp_800_800/AAEAAQAAAAAAAAPUAAAAJDQ3MGZhNDFjLWY4NTItNGE5YS1iZGVlLWQ4ODM0MzY3ZWZjMA.jpg"]];
        self.image = [UIImage imageWithData:data];
    });

    dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{

        //UIGraphicsBeginImageContext(CGSizeMake(300, 300));
        //
        //[self.image drawInRect:CGRectMake(0, 0, 300, 300)];

        self.imageView.image = self.image;
    });
}

@end
