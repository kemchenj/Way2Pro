//
//  main.m
//  NSFile
//
//  Created by xmg on 3/25/16.
//  Copyright © 2016 xmg. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSFileManager *manager;
        manager = [NSFileManager defaultManager];
            // 建立一个文件管理器
        
        NSString *home;
        home = [@"~" stringByExpandingTildeInPath];
            // 将目录~拓展替换为绝对路径,当前用户的主目录
        
        NSDirectoryEnumerator *direnum;
        direnum = [manager enumeratorAtPath:home];
            // 把路径字符串传递给文件管理器
            // enumeratorAtPath:返回一个NSDictionaryEnumerator对象,它是NSEnumerator的子类,.每次在这儿枚举器对象中调用nextObject方法时, 都会返回该目录中下一个文件的路径.这个方法也能搜索子目录中的文件.迭代循环结束时,你将会得到主目录中每一个文件的路径.NSDictionaryEnumerator还提供了一些其它功能,比如为每个文件创建一个属性字典,但是在这里我们并不会用到.
        
        NSMutableArray *files;
            // NSMutableArray是NSArray的一个之类, 具有可变数组的特性
        files = [NSMutableArray arrayWithCapacity:42];
            // 建立一个可变数组保存文件名
            // 因为不知道会找到多少个jpg文件,所以容量参数随便选择了一个数42
            // 但容量参数并不能限制数组的大小
        
        NSString *filename;
        while (filename = [direnum nextObject]) {
            // 目录枚举器将会返回一个代表文件路径的NSString字符串.就像NSEnumerator一样,当枚举器结束时它会返回nil值,于是循环终止
            if ([[filename pathExtension] isEqual:@"jpg"]) {
                // pathExtension方法可以返回文件的拓展名(但不包括那个点)
                [files addObject: filename];
            }
        }
        NSEnumerator *fileenum;
        fileenum = [files objectEnumerator];
        
        while (filename = [fileenum nextObject]) {
            NSLog(@"%@", filename);
        }
    }
    return 0;
}
