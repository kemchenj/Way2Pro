//
//  Status.m
//  day15
//
//  Created by kemchenj on 4/5/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import "Author.h"
#import "Status.h"

@implementation Status

-(id)initWithText:(NSString*)content withCreateTime:(NSString*)time withAuthor:(id)person
{
    if (self = [super init]) {
        self.text = content;
        self.au = person;
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // NSString转NSDate
        self.createTime = [formatter dateFromString:time];
        
        self.picture = nil;
        self.repostStatus = nil;
        self.commentCount = 0;
        self.retweetCount = 0;
        self.likeCount = 0;
    }
    return self;
}

-(id)initWithPicture:(NSString *)pic WithText:(NSString*)content withCreateTime:(NSString*)time withAuthor:(id)person
{
    self = [self initWithText:content withCreateTime:time withAuthor:person];
    self.picture = pic;
    return self;
}

-(id)initWithRepo:(Status *)originPost withText:(NSString *)content withCreateTime:(NSString *)time withAuthor:(id)person
{
    self = [self initWithText:content withCreateTime:time withAuthor:person];
    self.repostStatus = originPost;
    originPost.retweetCount = originPost.retweetCount + 1;
//    originPost.retweetCount ++;
    return self;
}

-(NSString *)description
{
    NSString *desc = [NSString stringWithFormat:@"Content = %@, time = %@\nAuthor = %@", self.text, self.createTime, self.au];
    return desc;
}

@end
