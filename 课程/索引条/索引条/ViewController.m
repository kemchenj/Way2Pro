//
//  ViewController.m
//  索引条
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"

#import "STCar.h"
#import "STCarGroup.h"

@interface ViewController()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *carGroups;

@end


@implementation ViewController

-(NSArray *)carGroups
{
    if (!_carGroups) {
        [STCarGroup setupObjectClassInArray:^NSDictionary *{
            return @{@"cars" : [STCar class]};
        }];
        
        _carGroups = [STCarGroup objectArrayWithFilename:@"cars.plist"];
    }
    return _carGroups;
}

NSString *ID = @"car";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    self.tableView.sectionIndexColor = [UIColor redColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor blackColor];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - <TableView DataSource>

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    STCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    STCarGroup *carGroup = self.carGroups[section];
    return carGroup.title;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    STCarGroup *carGroup = self.carGroups[indexPath.section];
    STCar *car = carGroup.cars[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    
    return cell;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    return [[self carGroups] valueForKeyPath:@"title"];
    NSMutableArray *tempArr = [NSMutableArray array];
    for (STCarGroup *group in self.carGroups) {
        NSString *title = group.title;
        [tempArr addObject:title];
    }
    return tempArr;
}

@end
