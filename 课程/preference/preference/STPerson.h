//
// Created by kemchenj on 5/11/16.
// Copyright (c) 2016 ST. All rights reserved.
//

#import <Foundation/Foundation.h>



@class STDog;



@interface STPerson : NSObject <NSCoding>

@property (nonatomic, strong) STDog     *dog;
@property (nonatomic, strong) NSString  *name;
@property (nonatomic, assign) NSInteger age;
@end