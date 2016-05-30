//
//  ViewController.m
//  队列基本使用23123
//
//  Created by kemchenj on 5/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    [self blockOprationWithQueue];
}

- (void)blockOprationWithQueue
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];


    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3-----%@", [NSThread currentThread]);
    }];

    [operation3 addExecutionBlock:^{
        NSLog(@"-----------");
    }];

    //queue.maxConcurrentOperationCount = 1;

    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];

    [queue addOperationWithBlock:^{
        NSLog(@"4-----%@", [NSThread currentThread]);
    }];
}

- (void)invocationOperationWithQueue
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(download1)
                                                                              object:nil
    ];
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self
                                                                             selector:@selector(download2)
                                                                               object:nil
    ];
    NSInvocationOperation *operation3 = [[NSInvocationOperation alloc] initWithTarget:self
                                                                             selector:@selector(download3)
                                                                               object:nil
    ];

    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];

    NSLog(@"-----------");
}

- (void)download3;
{
    NSLog(@"3");
}

- (void)download2;
{
    NSLog(@"2");
}

- (void)download1;
{
    NSLog(@"1");
}

@end
