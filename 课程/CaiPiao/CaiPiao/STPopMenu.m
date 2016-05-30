//
//  STPopMenu.m
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STPopMenu.h"



#define STKeyWindow [UIApplication sharedApplication].keyWindow



@implementation STPopMenu

+ (instancetype)popMenu;
{
    return [[NSBundle mainBundle] loadNibNamed:@"STPopMenu"
                                         owner:nil
                                       options:nil][0];
}

+ (instancetype)showInPoint:(CGPoint)point;
{
    STPopMenu *menu = [STPopMenu popMenu];

    menu.center = point;

    [STKeyWindow addSubview:menu];

    return menu;
}

- (void)hideInPoint:(CGPoint)point completion:(void (^)())completionBlock;
{
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.center    = point;
                         self.transform = CGAffineTransformMakeScale(0.01, 0.01);
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                         if (completionBlock) {
                             completionBlock();
                         }
                     }
    ];
}

- (IBAction)close:(id)sender
{
    if ([_delegate respondsToSelector:@selector(popMenuDidClickClose:)]) {
        [_delegate popMenuDidClickClose:self];
    }
}


@end
