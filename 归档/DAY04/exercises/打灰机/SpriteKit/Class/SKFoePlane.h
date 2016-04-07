//
//  SKFoePlane.h
//  SpriteKit
//
//  Created by lnj on 14-3-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

typedef NS_ENUM(int, SKFoePlaneType) {
    
    SKFoePlaneTypeBig = 1,
    SKFoePlaneTypeMedium = 2,
    SKFoePlaneTypeSmall = 3
};

@interface SKFoePlane : SKSpriteNode

@property (nonatomic,assign) int hp;
@property (nonatomic,assign) SKFoePlaneType type;


+ (instancetype)createBigPlane;

+ (instancetype)createMediumPlane;

+ (instancetype)createSmallPlane;

@end
