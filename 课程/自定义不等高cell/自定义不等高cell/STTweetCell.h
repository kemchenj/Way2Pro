//
//  STTweetViewTableViewCell.h
//  自定义不等高cell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STTweet;

@interface STTweetCell : UITableViewCell

@property (nonatomic, strong) STTweet *tweet;
-(CGFloat)height;

@end
