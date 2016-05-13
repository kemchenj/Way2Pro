//
//  ViewController.m
//  preference
//
//  Created by kemchenj on 5/11/16.
//  Copyright (c) 2016 ST. All rights reserved.
//


#import "ViewController.h"
#import "STPerson.h"
#import "STDog.h"



@interface ViewController ()

@end



@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)save
{
    NSLog(@"%@", NSHomeDirectory());

    STPerson *person = [[STPerson alloc] init];
    person.name = @"kem";
    person.age  = 33;
    NSLog(@"%@", person);

    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //[defaults setObject:@"kem" forKey:@"name"];
    //[defaults setInteger:33 forKey:@"age"];
    //[defaults setBool:YES forKey:@"isRem"];

    STDog *dog = [[STDog alloc] init];
    dog.name   = @"wc";
    person.dog = dog;
    NSLog(@"%@", dog);

    NSString *path     = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,
                                                             YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"per.data"];
    [NSKeyedArchiver archiveRootObject:person toFile:filePath];
}

- (IBAction)load
{
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //
    //BOOL      isRem = [defaults boolForKey:@"isRem"];
    //NSString  *name = [defaults objectForKey:@"name"];
    //NSInteger age   = (NSInteger) (NSInteger *) [defaults integerForKey:@"age"];
    //
    //NSLog(@"name = %@, age = %i, isRem = %d", name, age, isRem);

    NSString *path     = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask,
                                                             YES)[0];
    NSString *filePath = [path stringByAppendingPathComponent:@"per.data"];
    STPerson *person   = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@", person);
    NSLog(@"%@", person.dog);
}

@end