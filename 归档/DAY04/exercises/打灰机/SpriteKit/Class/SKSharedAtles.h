//
//  SKSharedAtles.h
//  SpriteKit
//
//  Created by lnj on 14-3-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "SKFoePlane.h"

typedef NS_ENUM(int, SKTextureType) {
    SKTextureTypeBackground = 1,
    SKTextureTypeBullet = 2,
    SKTextureTypePlayerPlane = 3,
    SKTextureTypeSmallFoePlane = 4,
    SKTextureTypeMediumFoePlane = 5,
    SKTextureTypeBigFoePlane = 6,
};

@interface SKSharedAtles : SKTextureAtlas

+ (SKTexture *)textureWithType:(SKTextureType)type;

+ (SKAction *)playerPlaneAction;

+ (SKAction *)playerPlaneBlowupAction;

+ (SKAction *)hitActionWithFoePlaneType:(SKFoePlaneType)type;

+ (SKAction *)blowupActionWithFoePlaneType:(SKFoePlaneType)type;

@end
