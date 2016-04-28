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

NSString *ID = @"tweet";

- (NSArray *)tweets
{
    if (!_tweets) {
        _tweets = [STTweet objectArrayWithFilename:@"tweets.plist"];
    }
    return _tweets;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[STTweetCell class] forCellReuseIdentifier:ID ];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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
    STTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.tweet = self.tweets[indexPath.row];
    
    return cell;
}



#pragma mark - <TableView Delegate>

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STTweet *tweet = self.tweets[indexPath.row];
    
    return tweet.cellHeight;
}

@end
