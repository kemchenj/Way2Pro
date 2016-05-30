//
//  ViewController.m
//  互斥锁
//
//  Created by kemchenj on 5/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;
@property (nonatomic, strong) NSThread *thread3;
@property (nonatomic, strong) NSObject *obj;
@property (nonatomic, assign) NSInteger *totalCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.totalCount = 99;
    self.obj = [[NSObject alloc] init];

    self.thread1 = [[NSThread alloc] initWithTarget:self
                                           selector:@selector(saleTicket)
                                             object:nil
    ];
    self.thread2 = [[NSThread alloc] initWithTarget:self
                                           selector:@selector(saleTicket)
                                             object:nil
    ];
    self.thread3 = [[NSThread alloc] initWithTarget:self
                                           selector:@selector(saleTicket)
                                             object:nil
    ];

    [self.thread1 setName:@"Sales 1"];
    [self.thread2 setName:@"Sales 2"];
    [self.thread3 setName:@"Sales 3"];

    [self.thread1 start];
    [self.thread2 start];
    [self.thread3 start];
}

- (void)saleTicket;
{
    while (1) {
        @synchronized (self) {
            NSInteger count = self.totalCount;
            if (count > 0) {
                for (int i = 0; i < 10000000; ++i) {
                    int c = 22;
                }
                self.totalCount = count - 1;
                NSLog(@"%@售出去一张票, 还剩%zd张", [NSThread currentThread].name, _totalCount);
            } else {
                NSLog(@"%@发现已经没有票了", [NSThread currentThread].name);
                return;
            }
        }
    }
}


@end

