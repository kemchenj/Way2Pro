//
//  STDrawView.m
//  freepaint
//
//  Created by kemchenj on 5/16/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STDrawView.h"
#import "STDrawPath.h"



@interface STDrawView ()

@property (nonatomic, strong) UIBezierPath   *path;
@property (nonatomic, strong) NSMutableArray *paths;

@end



@implementation STDrawView

- (NSMutableArray *)paths;
{
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (void)setImage:(UIImage *)image;
{
    _image = image;

    [self.paths addObject:image];

    [self setNeedsDisplay];
}

- (void)awakeFromNib;
{
    _lineWidth = 1;
    _lineColor = [UIColor blackColor];

    [[NSNotificationCenter defaultCenter] addObserverForName:@"handleImage"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      UIImage *image = note.userInfo[@"image"];
                                                      self.image = image;
                                                  }
    ];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    UITouch *touch = [touches anyObject];

    CGPoint curP = [touch locationInView:self];

    STDrawPath *path = [STDrawPath pathWithLineColor:self.lineColor];
    path.lineWidth = self.lineWidth;

    _path = path;

    [self.paths addObject:path];

    [path moveToPoint:curP];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
{
    UITouch *touch = [touches anyObject];

    CGPoint curP = [touch locationInView:self];

    [_path addLineToPoint:curP];

    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect;
{
    for (STDrawPath *path in self.paths) {
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *) path;
            [image drawInRect:rect];
        } else {
            [path.lineColor set];
            [path stroke];
        }
    }
}

- (void)clear;
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}

- (void)undo;
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}


@end
