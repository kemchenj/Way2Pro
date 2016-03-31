//
//  Status.h
//  day15
//
//  Created by xmg on 3/23/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

@interface Status : NSObject

@property(nonatomic, retain)NSString *text;
@property(nonatomic, retain)NSString *picture;
@property(nonatomic, assign)MyDate createTime;
@property(nonatomic, retain)Author *author;
@property(nonatomic, assign)int commentCount;
@property(nonatomic, assign)int reTweetCount;
@property(nonatomic, assign)int likeCount;
@property(nonatomic, retain)Status *repostStatus;

@end