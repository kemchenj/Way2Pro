//
//  STTweetCell.h
//  自定义不等高cell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface STTweet : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, assign) BOOL vip;

@property (nonatomic, assign) CGRect  vipFrame;
@property (nonatomic, assign) CGRect  iconFrame;
@property (nonatomic, assign) CGRect  nameFrame;
@property (nonatomic, assign) CGRect  textFrame;
@property (nonatomic, assign) CGRect  pictureFrame;
@property (nonatomic, assign) CGFloat cellHeight;

//+ (instancetype)tweetWithDict:(NSDictionary *)dict;

@end
