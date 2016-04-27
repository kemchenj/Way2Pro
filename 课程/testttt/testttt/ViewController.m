//
//  ViewController.m
//  11-索引条
//
//  Created by apple on 15/6/28.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "ViewController.h"
#import "MJCarGroup.h"
#import "MJCar.h"

@interface ViewController ()
/** 车数据 */
@property (nonatomic, strong) NSArray *carGroups;
@end

@implementation ViewController

- (NSArray *)carGroups
{
    if (!_carGroups) {
        // 加载字典数组
        NSArray *carGroupDictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        
        // 创建模型数组
        NSMutableArray *carGroupArray = [NSMutableArray array];
        
        // 将字典数组 -> 模型数组
        for (NSDictionary *carGroupDict in carGroupDictArray) {
            MJCarGroup *carGroup = [MJCarGroup groupWithDict:carGroupDict];
            [carGroupArray addObject:carGroup];
        }
        
        _carGroups = carGroupArray;
    }
    return _carGroups;
}

NSString *ID = @"car";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    // 设置右边索引文字的颜色
    self.tableView.sectionIndexColor = [UIColor redColor];
    // 设置右边索引文字的背景色
    self.tableView.sectionIndexBackgroundColor = [UIColor blackColor];
}

/**
 *  隐藏状态栏
 */
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - <数据源>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MJCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    MJCarGroup *group = self.carGroups[indexPath.section];
    MJCar *car = group.cars[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    MJCarGroup *group = self.carGroups[section];
    return group.title;
}

/**
 *  返回每一组的索引标题（数组中放的是字符串）
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    NSMutableArray *titles = [NSMutableArray array];
//    for (MJCarGroup *group in self.carGroups) {
//        [titles addObject:group.title];
//    }
//    return titles;
    return [self.carGroups valueForKeyPath:@"title"];
}

#pragma mark - <代理>
@end
