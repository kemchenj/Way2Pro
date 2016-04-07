//
//  Baby.h
//  Day16
//
//  Created by kemchenj on 4/6/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BabyProtocol.h"

@interface Baby : NSObject

@property(nonatomic, assign)int food;
@property(nonatomic, assign)int drowsiness;
-(void)hungry;
-(void)sleepy;

@property(nonatomic, strong)id<BabyProtocol>nanny;

@end