//
//  ViewController.m
//  clock
//
//  Created by kemchenj on 5/17/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

// 每秒秒针转6°
// 每分钟分针转30°
// 每小时时针转30°
// 每分钟时针转0.5°

#define kHeight _clockView.bounds.size.height * 0.5
#define kWidth _clockView.bounds.size.width * 0.5



@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *clockView;
@property (nonatomic, weak) CALayer              *secLayer;
@property (nonatomic, weak) CALayer              *minLayer;
@property (nonatomic, weak) CALayer              *hourLayer;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupHourLayer];
    [self setupMinLayer];
    [self setupSecLayer];

    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timeChange)
                                   userInfo:nil
                                    repeats:YES
    ];

    [self timeChange];
}

- (void)setupHourLayer;
{
    CALayer *layer = [CALayer layer];
    layer.cornerRadius    = 4;
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.anchorPoint     = CGPointMake(0.5, 1);
    layer.position        = CGPointMake(kWidth, kHeight);
    layer.bounds          = CGRectMake(0, 0, 4, 75);

    self.hourLayer = layer;
    [_clockView.layer addSublayer:layer];
}

- (void)setupMinLayer;
{
    CALayer *layer = [CALayer layer];
    layer.cornerRadius    = 4;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint     = CGPointMake(0.5, 1);
    layer.position        = CGPointMake(kWidth, kHeight);
    layer.bounds          = CGRectMake(0, 0, 4, 80);

    self.minLayer = layer;
    [_clockView.layer addSublayer:layer];
}

- (void)setupSecLayer;
{
    CALayer *layer = [CALayer layer];
    layer.cornerRadius    = 4;
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.anchorPoint     = CGPointMake(0.5, 1);
    layer.position        = CGPointMake(kWidth, kHeight);
    layer.bounds          = CGRectMake(0, 0, 2, 80);

    self.secLayer = layer;
    [_clockView.layer addSublayer:layer];
}

- (void)timeChange;
{
    NSCalendar *calendar = [NSCalendar currentCalendar];

    NSDateComponents *dataCmp = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour
                                            fromDate:[NSDate date]
    ];

    NSInteger minute = dataCmp.minute;
    CGFloat   minA   = (minute * 6) / 180.0 * M_PI;
    _minLayer.transform = CATransform3DMakeRotation(minA, 0, 0, 1);

    NSInteger hour  = dataCmp.hour;
    // minute 会在整点的时候清零
    CGFloat   hourA = (hour * 30 + minute * 0.5) / 180.0 * M_PI;
    _hourLayer.transform = CATransform3DMakeRotation(hourA, 0, 0, 1);

    NSInteger second = dataCmp.second;
    CGFloat   secA   = (second * 6) / 180.0 * M_PI;
    _secLayer.transform = CATransform3DMakeRotation(secA, 0, 0, 1);
}

@end
