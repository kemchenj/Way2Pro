//
//  Status.h
//  day15
//
//  Created by kemchenj on 4/5/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Author;

@interface Status : NSObject

@property NSString *text;
@property NSString *picture;
@property NSDate *createTime;
@property Author *au;
@property Status *repostStatus;
@property(assign) int commentCount;
@property(assign) int retweetCount;
@property(assign) int likeCount;

-(id)initWithText:(NSString*)content withCreateTime:(NSString*)time withAuthor:(id)person;
-(id)initWithPicture:(NSString *)pic WithText:(NSString*)content withCreateTime:(NSString*)time withAuthor:(id)person;
-(id)initWithRepo:(Status *)originPost withText:(NSString *)content withCreateTime:(NSString*)time withAuthor:(id)person;

@end
