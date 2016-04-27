//
//  ViewController.m
//  tableView
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STCar.h"
#import "STCarGroup.h"

@interface ViewController ()<UITableViewDataSource>
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *carGroups;
@end

@implementation ViewController

-(NSArray *)carGroups
{
    if (!_carGroups) {
        NSArray *carGrounpDictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        
        NSMutableArray *carGroupArray = [NSMutableArray array];
        
        for (NSDictionary *carGroupDict in carGrounpDictArray) {
            STCarGroup *carGroup = [STCarGroup carGroupWithDict:carGroupDict];
            [carGroupArray addObject:carGroup];
        }
        
        _carGroups = carGroupArray;
    }
    
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.carGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    STCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    STCarGroup *carGroup = self.carGroups[indexPath.section];
    STCar *car = carGroup.cars[indexPath.row];
    
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    STCarGroup *carGroup = self.carGroups[section];
    return carGroup.header;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    STCarGroup *carGroup = self.carGroups[section];
    return carGroup.footer;
}

@end
