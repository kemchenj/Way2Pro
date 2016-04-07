//
//  SportProtocol.h
//  Day16
//
//  Created by kemchenj on 4/6/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

@protocol SportProtocol <NSObject>
@optional
-(void)tst;
@required
-(void)playFootball;
-(void)playBasketball;
@end