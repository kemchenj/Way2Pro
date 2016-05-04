//
//  STWineCellTableViewCell.m
//  cell refresh
//
//  Created by kemchenj on 4/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STWineCell.h"
#import "STWine.h"

@interface STWineCell ()

@property (weak, nonatomic) IBOutlet UIImageView *checkImage;

@end

@implementation STWineCell

-(void)setWine:(STWine *)wine
{
    _wine = wine;
    
    self.textLabel.text       = wine.name;
    self.imageView.image      = [UIImage imageNamed:wine.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥ %@.00", wine.money];
    
    self.checkImage.hidden = !wine.isChecked;
}

@end
