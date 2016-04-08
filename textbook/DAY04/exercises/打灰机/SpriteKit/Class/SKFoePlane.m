//
//  SKFoePlane.m
//  SpriteKit
//
//  Created by lnj on 14-3-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "SKFoePlane.h"

#import "SKSharedAtles.h"

@implementation SKFoePlane

+ (instancetype)createBigPlane{
    SKFoePlane *foePlane = (SKFoePlane *)[SKFoePlane spriteNodeWithTexture:[SKSharedAtles textureWithType:SKTextureTypeBigFoePlane]];
    foePlane.hp = 7;
    foePlane.type = SKFoePlaneTypeBig;
    foePlane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:foePlane.size];
    return foePlane;
}

+ (instancetype)createMediumPlane{
    SKFoePlane *foePlane = (SKFoePlane *)[SKFoePlane spriteNodeWithTexture:[SKSharedAtles textureWithType:SKTextureTypeMediumFoePlane]];
    foePlane.hp = 5;
    foePlane.type = SKFoePlaneTypeMedium;
    foePlane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:foePlane.size];
    return foePlane;
}

+ (instancetype)createSmallPlane{
    SKFoePlane *foePlane = (SKFoePlane *)[SKFoePlane spriteNodeWithTexture:[SKSharedAtles textureWithType:SKTextureTypeSmallFoePlane]];
    foePlane.hp = 1;
    foePlane.type = SKFoePlaneTypeSmall;
    foePlane.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:foePlane.size];
    return foePlane;
}


@end
