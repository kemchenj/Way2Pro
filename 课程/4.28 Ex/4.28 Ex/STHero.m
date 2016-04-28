//
//  STHero.m
//  4.28 Ex
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STHero.h"

@implementation STHero

-(CGFloat)cellHeight
{
    if (_cellHeight == 0) {
        CGFloat margin = 10;
        
//        CGFloat iconX = margin;
//        CGFloat iconY = margin;
//        CGFloat iconWH = 50;
//        self.iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
//        
//        CGFloat nameX = iconWH + iconX * 2;
//        CGFloat nameY = margin;
//        CGFloat nameW = [UIScreen mainScreen].bounds.size.width - iconWH - 3 *margin;
//        CGFloat nameH = iconWH;
//        self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
//        
//        CGFloat introX = margin;
//        CGFloat introY = iconWH + iconY * 2;
//        CGFloat introW = [UIScreen mainScreen].bounds.size.width - 2 * margin;
//        CGSize introMaxSize = CGSizeMake(introW, MAXFLOAT);
//        NSDictionary *introAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
//        CGFloat introH = [self.intro boundingRectWithSize:introMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:introAttrs context:nil].size.height;
//        self.introFrame = CGRectMake(introX, introY, introW, introH);
//        
//        _cellHeight = iconWH + introH + margin * 3;
        
        CGFloat iconX  = margin;
        CGFloat iconY  = margin;
        CGFloat iconWH = 80;
        self.iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
        CGFloat nameX  = iconWH + 2 * margin;
        CGFloat nameY  = margin;
        CGFloat nameW  = [UIScreen mainScreen].bounds.size.width - iconWH - 3 *margin;
        NSDictionary *nameAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:20]};
        CGSize nameSize = [self.name sizeWithAttributes:nameAttrs];
        CGFloat nameH  = nameSize.height;
        self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
        
        CGFloat introX = nameX;
        CGFloat introY = nameY + nameH + margin;
        CGFloat introW = nameW;
        CGSize introMaxSize = CGSizeMake(introW, MAXFLOAT);
        NSDictionary *introAttrs = @{NSFontAttributeName : [UIFont systemFontOfSize:16]};
        CGFloat introH = [self.intro boundingRectWithSize:introMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:introAttrs context:nil].size.height;
        self.introFrame = CGRectMake(introX, introY, introW, introH);
        
        if ((introH + nameH + 3 * margin) > iconWH) {
            _cellHeight = introH + nameH + 3 * margin;
        } else {
            _cellHeight = iconWH + 2 * margin;
        }
 
    }
    return _cellHeight;
}

+(instancetype)heroWithDict:(NSDictionary *)dict
{
    STHero *hero = [[STHero alloc] init];
    [hero setValuesForKeysWithDictionary:dict];
    return hero;
}

@end
