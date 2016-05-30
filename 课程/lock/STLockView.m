//
//  STLockView.m
//  lock
//
//  Created by kemchenj on 5/15/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STLockView.h"



@interface STLockView ()

@property (nonatomic, assign) CGPoint        curP;
@property (nonatomic, strong) NSMutableArray *selectedButtons;

@end



@implementation STLockView

- (NSMutableArray *)selectedButtons;
{
    if (!_selectedButtons) {
        _selectedButtons = [NSMutableArray array];
    }

    return _selectedButtons;
}

- (void)awakeFromNib;
{
    for (int i = 0; i < 9; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

        button.tag = i;

        [button setImage:[UIImage imageNamed:@"gesture_node_normal"]
                forState:UIControlStateNormal
        ];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"]
                forState:UIControlStateSelected
        ];

        button.userInteractionEnabled = NO;

        [self addSubview:button];
    }
}

- (instancetype)initWithFrame:(CGRect)frame;
{
    self = [super initWithFrame:frame];
    if (self) {
    }

    return self;
}

- (void)layoutSubviews;
{
    [super layoutSubviews];

    int col  = 0;
    int row  = 0;
    int cols = 3;

    CGFloat x  = 0;
    CGFloat y  = 0;
    CGFloat wh = 74;

    CGFloat margin = (self.bounds.size.width - cols * wh) / (cols + 1);

    for (int i = 0; i < 9; ++i) {
        UIButton *button = self.subviews[i];

        col = i % cols;
        row = i / cols;

        x = margin + (margin + wh) * col;
        y = (margin + wh) * row;
        button.frame = CGRectMake(x, y, wh, wh);
    }
}

- (void)drawRect:(CGRect)rect;
{
    if (self.selectedButtons.count == 0) {
        return;
    }

    UIBezierPath *path = [UIBezierPath bezierPath];

    int i = 0;

    for (UIButton *button in [self selectedButtons]) {
        if (i == 0) {
            [path moveToPoint:button.center];
        } else {
            [path addLineToPoint:button.center];
        }

        i++;
    }

    [path addLineToPoint:_curP];

    [[UIColor greenColor] set];

    path.lineWidth     = 10;
    path.lineJoinStyle = kCGLineJoinRound;

    [path stroke];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    [self selectBtnWithTouches:touches
                    withEvents:event
    ];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    [self selectBtnWithTouches:touches
                    withEvents:event
    ];

    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    NSMutableString *string = [NSMutableString string];

    for (UIButton *button in self.selectedButtons) {
        button.selected = NO;

        [string appendFormat:@"%i", button.tag];
    }

    [self.selectedButtons removeAllObjects];
    [self setNeedsDisplay];
}

- (void)selectBtnWithTouches:(NSSet *)touches withEvents:(UIEvent *)event;
{
    UITouch *touch = [touches anyObject];

    CGPoint curP = [touch locationInView:self];

    self.curP = curP;

    for (UIButton *button in self.subviews) {
        CGPoint btnP = [self convertPoint:curP
                                   toView:button
        ];

        if ([button pointInside:btnP withEvent:event] && !button.selected) {
            button.selected = YES;

            [self.selectedButtons addObject:button];
        }
    }
}

@end
