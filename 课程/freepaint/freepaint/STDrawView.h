//
//  STDrawView.h
//  freepaint
//
//  Created by kemchenj on 5/16/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface STDrawView : UIView

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIImage *image;

- (void)clear;

- (void)undo;

@end
