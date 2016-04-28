//
//  ViewController.m
//  customCell
//
//  Created by kemchenj on 4/27/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STTg.h"
#import "STTgCell.h"
#import "MJExtension/MJExtension.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tgs;

@end

@implementation ViewController

NSString *ID = @"tg";

-(NSArray *)tgs
{
    if (!_tgs) {
        _tgs = [STTg objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 70;
//    [self.tableView registerClass:[STTgCell class] forCellReuseIdentifier:ID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([STTgCell class]) bundle:nil] forCellReuseIdentifier:ID];
    // bundle为nil的话默认在main bundle里面找
}

#pragma mark - <TableView DataSource>
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tgs.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STTgCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.tg = self.tgs[indexPath.row];
    
    return cell;
}

@end
