//
//  main.m
//  agent
//
//  Created by kemchenj on 4/6/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nanny.h"
#import "Baby.h"

int main(int argc, const char * argv[]) {
    Baby *bay = [Baby new];
    Nanny *gran = [Nanny new];

    bay.nanny = gran;
    bay.food = 10;
    bay.drowsiness = 10;

    [bay hungry];
    [bay sleepy];


    return 0;
}
