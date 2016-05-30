//
//  STSettingItem.h
//  CaiPiao
//
//  Created by kemchenj on 5/22/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface STSettingItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) UIImage  *icon;
@property (nonatomic, strong) void     (^operationBlock)(NSIndexPath *indexPath);

+(instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;

@end
