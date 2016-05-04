//
//  STCircleButton.m
//  购物车
//
//  Created by kemchenj on 4/30/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STCircleButton.h"

@implementation STCircleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib
{
    self.layer.borderWidth  = 1;
    self.layer.borderColor  = [UIColor redColor].CGColor;
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}

@end
