//
//  ViewController.m
//  optimzing
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STTableViewCell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

NSString *ID = @"wine";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
    [self.tableView registerClass:[STTableViewCell class] forCellReuseIdentifier:ID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd行的数据", indexPath.row];
    
    return cell;
}

@end
