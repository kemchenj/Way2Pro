//
//  STDrawView.m
//  paint
//
//  Created by kemchenj on 5/14/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STDrawView.h"



@implementation STDrawView

- (void)awakeFromNib;
{
    [self drawText];
}

- (void)drawText;
{
    NSString *string = @"Hello World!";

    NSMutableDictionary *strArr = [NSMutableDictionary dictionary];

    strArr[NSFontAttributeName]            = [UIFont systemFontOfSize:50];
    strArr[NSStrokeWidthAttributeName]     = @1;
    strArr[NSForegroundColorAttributeName] = [UIColor redColor];

    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor      = [UIColor yellowColor];
    shadow.shadowOffset     = CGSizeMake(10, 10);
    shadow.shadowBlurRadius = 5;
    strArr[NSShadowAttributeName] = shadow;

    [string drawInRect:self.bounds withAttributes:strArr];
}

//- (void)drawRect:(CGRect)rect;
//{
//    UIImage *image = [UIImage imageNamed:@"阿狸头像"];
//    [image drawInRect:rect];
//}


@end
