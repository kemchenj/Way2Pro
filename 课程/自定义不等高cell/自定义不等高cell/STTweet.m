//
//  STTweetCell.m
//  自定义不等高cell
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTweet.h"

@implementation STTweet

-(CGFloat)cellHeight
{
    if (_cellHeight == 0) {
        CGFloat margin     = 10;
        
        // 头像
        CGFloat iconX  = margin;
        CGFloat iconY  = margin;
        CGFloat iconWH = 30;
        self.iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
        // 昵称(姓名)
        CGFloat nameY = iconY;
        CGFloat nameX = CGRectGetMaxX(self.iconFrame) + margin;
        // 计算文字所占据的尺寸
        NSDictionary *nameAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize nameSize = [self.name sizeWithAttributes:nameAttrs];
        self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
        
        // 文字
        CGFloat textX      = iconX;
        CGFloat textY      = CGRectGetMaxY(self.iconFrame) + margin;
        CGFloat textW      = [UIScreen mainScreen].bounds.size.width - 2 * textX;
        CGSize textMaxSize = CGSizeMake(textW, MAXFLOAT);
        
        NSDictionary *textAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGFloat textH = [self.text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.height;
        
        self.textFrame = CGRectMake(textX, textY, textW, textH);
        
        // 会员图标
        if (self.vip) {
            CGFloat vipW = 14;
            CGFloat vipH = nameSize.height;
            CGFloat vipX = CGRectGetMaxX(self.nameFrame) + margin;
            CGFloat vipY = nameY;
            self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
        }
        
        // 配图
        if (self.picture) {
            CGFloat pictureWH = 100;
            CGFloat pictureX  = textX;
            CGFloat pictureY  = CGRectGetMaxY(self.textFrame) + margin;
            
            self.pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);

            _cellHeight        = CGRectGetMaxY(self.pictureFrame);
        } else {
            _cellHeight = CGRectGetMaxY(self.textFrame);
        }
        
        _cellHeight += margin;
    }
    
    return _cellHeight;
}


@end
