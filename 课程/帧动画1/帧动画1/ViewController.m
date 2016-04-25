//
//  ViewController.m
//  帧动画1
//
//  Created by kemchenj on 4/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

// 播放器
@property(nonatomic, strong) AVPlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stand];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)stand {
    [self play:@"stand" count:10];
}

- (IBAction)dazhao {
    [self play:@"dazhao" count:87];
}

-(void)play:(NSString *)imageName count:(int)count{
    NSMutableArray *images = [NSMutableArray array];
    for (int i=1; i<=count; i++) {
        NSString *name = [NSString stringWithFormat:@"%@_%d.png", imageName, i];
        UIImage *image = [UIImage imageNamed:name];
//        NSString *name      = [NSString stringWithFormat:@"%@_%d", imageName, i];
//        NSString *imagePath = [[NSBundle mainBundle]  pathForResource:name ofType:@"png"];
//        UIImage *image      = [UIImage imageWithContentsOfFile:imagePath];
        
        [images addObject:image];
    }
    
    self.imageView.animationImages = images;
    self.imageView.animationDuration = count / 13;
    self.imageView.animationRepeatCount = [imageName isEqualToString:@"stand"] ? 0 : 1;
    [self.imageView startAnimating];
    
    if ([imageName isEqualToString:@"stand"]) return;
    
    [self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
    
    // 获取安装包
    NSBundle *bundle = [NSBundle mainBundle];
    // 获取安装包内资源位置
    NSURL *url = [bundle URLForResource:imageName withExtension:@"mp3"];
    
    self.player = [AVPlayer playerWithURL: url];
    [self.player play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
