//
//  BabyProtocol.h
//  Day16
//
//  Created by kemchenj on 4/6/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Baby;

@protocol BabyProtocol <NSObject>

-(void)feedWithBaby:(Baby *)baby;
-(void)hypnosisWithBaby:(Baby *)baby;

@end