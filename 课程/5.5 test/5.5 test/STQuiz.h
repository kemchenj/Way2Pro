//
//  STQuiz.h
//  5.5 test
//
//  Created by kemchenj on 5/5/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STQuiz : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, strong) NSArray *options;

@end
