//
//  Phone.h
//  day13
//
//  Created by xmg on 3/21/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject
{
    int _cpu;
}

-(void)signalWithNumber:(NSString *)number;
-(void)sendMessageWithNumbhr:(NSString *)number andContent:(NSString *)content;
+(void)brand;

@end