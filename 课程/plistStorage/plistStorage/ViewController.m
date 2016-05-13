//
//  ViewController.m
//  plistStorage
//
//  Created by kemchenj on 5/11/16.
//  Copyright (c) 2016 ST. All rights reserved.
//


#import "ViewController.h"
#import "STPerson.h"



@interface ViewController ()

@end



@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)save
{
    STPerson *person = [[STPerson alloc] init];
    person.age = 18;
    person.name = @"kem";

    NSArray *array = @[@"dili", @19, person];

    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@", path);

    NSString *filePath = [path stringByAppendingPathComponent:@"array.plist"];
    NSLog(@"%@", filePath);

    [array writeToFile:filePath atomically:YES];
}

- (IBAction)load
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"array.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];

    NSLog(@"%@", array);

    //NSString *dictPath =
}
@end