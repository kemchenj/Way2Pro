//
//  ViewController.m
//  自定义不等高cell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STTweet.h"
#import "STTweetCell.h"
#import "MJExtension.h"



@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tweets;

@end



@implementation ViewController

- (NSArray *)tweets
{
    if (!_tweets) {
        _tweets = [STTweet objectArrayWithFilename:@"tweets.plist"];
    }
    return _tweets;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[STTweetCell class] forCellReuseIdentifier:ID ];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // 告诉tableView所有cell的真实高度是自动计算（根据设置的约束来计算）
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    // 告诉tableView所有cell的估算高度
    self.tableView.estimatedRowHeight = 100;
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}



#pragma mark - <TableView DataSource>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tweet"];
    
    cell.tweet = self.tweets[indexPath.row];
    
    NSLog(@"cell高度: %f", cell.frame.size.height);
    NSLog(@"cell.height: %f", cell.height);
    
    return cell;
}



#pragma mark - <TableView Delegate>

STTweetCell *cell;

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"tweet"];
    }
    
    cell.tweet = self.tweets[indexPath.row];
    
    NSLog(@"cell高度    : %f", cell.frame.size.height);
    NSLog(@"cell.height : %f", cell.height);
    
    return cell.height;
}



@end
