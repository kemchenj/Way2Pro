//
//  ViewController.m
//  单组数据
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STWine.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) NSArray *wineArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    // cell的行高
    self.tableView.rowHeight = 100;
    
    // section的header高度
    self.tableView.sectionHeaderHeight = 50;
    
    // section的footer高度
//    self.tableView.sectionFooterHeight = 100;
    
    // 分割线颜色
    self.tableView.separatorColor = [UIColor grayColor];
    
    // 分割线样式
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 表头控件
    self.tableView.tableHeaderView = [[UISwitch alloc] init];
    
    // 表尾控件
    self.tableView.tableFooterView = [[UISwitch alloc] init];
}

-(NSArray *)wineArray
{
    if (!_wineArray) {
        NSArray *wineDictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine" ofType:@"plist"]];
        
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *wineDict in wineDictArray) {
            [tempArr addObject:[STWine wineWithDict:wineDict]];
        }
        
        return tempArr;
    }
    return _wineArray;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    STWine *wine = self.wineArray[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:wine.icon];
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%@", wine.price];
    cell.detailTextLabel.textColor = [UIColor redColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中了---%@", indexPath);
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"取消选中---%@", indexPath);
}

@end
