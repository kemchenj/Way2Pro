//
//  ViewController.m
//  index line
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STCar.h"
#import "STCarGroup.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *carGroups;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

//- (NSArray *)carGroups
//{
//    if (!_carGroups) {
//        NSArray *carGroupDictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
//        
//        NSMutableArray *carGroupArray = [NSMutableArray array];
//        for (NSDictionary *carGroupDict in carGroupDictArray) {
//            [carGroupArray addObject:[STCarGroup groupWithDict:carGroupDict]];
//        }
//        
//        _carGroups = carGroupArray;
//    }
//    return _carGroups;
//}
//
//NSString *ID = @"car";
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
//    
//    self.tableView.sectionIndexColor = [UIColor grayColor];
//    self.tableView.sectionIndexBackgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
//}
//
//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}
//
//#pragma mark - DataSource
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    STCarGroup *carGroup = self.carGroups[section];
//    return carGroup.cars.count;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    
//    STCarGroup *carGroup = self.carGroups[indexPath.section];
//    STCar *car = carGroup.cars[indexPath.row];
//    
//    cell.imageView.image = [UIImage imageNamed:car.icon];
//    cell.textLabel.text = car.name;
//    
//    return cell;
//}
//
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return self.carGroups.count;
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    STCarGroup *carGroup = self.carGroups[section];
//    return carGroup.title;
//}
//
//-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return [self.carGroups valueForKeyPath:@"title"];
//}

- (NSArray *)carGroups
{
    if (!_carGroups) {
        // 加载字典数组
        NSArray *carGroupDictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        
        // 创建模型数组
        NSMutableArray *carGroupArray = [NSMutableArray array];
        
        // 将字典数组 -> 模型数组
        for (NSDictionary *carGroupDict in carGroupDictArray) {
            STCarGroup *carGroup = [STCarGroup groupWithDict:carGroupDict];
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
    STCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    STCarGroup *group = self.carGroups[indexPath.section];
    STCar *car = group.cars[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    STCarGroup *group = self.carGroups[section];
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
@end
