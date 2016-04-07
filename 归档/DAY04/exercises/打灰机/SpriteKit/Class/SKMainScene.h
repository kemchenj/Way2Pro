//
//  SKMainScene.h
//  SpriteKit
//
//  Created by lnj on 14-3-14.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKMainScene : SKScene<SKPhysicsContactDelegate>{
    
    int _smallPlaneTime;
    int _mediumPlaneTime;
    int _bigPlaneTime;
    
    int _adjustmentBackgroundPosition;
    
    SKLabelNode *_scoreLabel;
    SKSpriteNode *_playerPlane;
    SKSpriteNode *_background1;
    SKSpriteNode *_background2;

    SKAction *_smallFoePlaneHitAction;
    SKAction *_mediumFoePlaneHitAction;
    SKAction *_bigFoePlaneHitAction;
    SKAction *_smallFoePlaneBlowupAction;
    SKAction *_mediumFoePlaneBlowupAction;
    SKAction *_bigFoePlaneBlowupAction;
}

@end
