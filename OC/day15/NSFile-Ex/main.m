//
//  main.m
//  NSFile-Ex
//
//  Created by xmg on 3/25/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        NSFileManager *manager;
        manager = [NSFileManager defaultManager];
        
        NSString *home;
        home = [@"~" stringByExpandingTildeInPath];
        
        NSMutableArray *files;
        files = [NSMutableArray arrayWithCapacity:42];
        
        // 因为enumeratorAtPath是NSEnumerator的子类,所以可以使用快速枚举
        for(NSString *filename in [manager enumeratorAtPath:home])
        {
            if([[filename pathExtension] isEqualTo:@"jpg"])
            {
                [files addObject:filename];
            }
        }
                                   
        for(NSString *filename in files)
        {
            NSLog(@"%@", filename);
        }
    }
    return 0;
}
