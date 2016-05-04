//
//  ViewController.m
//  数据刷新
//
//  Created by kemchenj on 5/2/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <MJExtension/MJExtension.h>
#import "ViewController.h"
#import "STWineCell.h"
#import "STWine.h"



@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property(weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSMutableArray     *wineArray;

@end




@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSMutableArray *)wineArray
{
    if (!_wineArray) {
        _wineArray = [STWine mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}



#pragma mark - <---数据刷新操作--->

- (IBAction)remove:(id)sender
{
    [self.wineArray removeObjectAtIndex:0];

    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationLeft];
}



#pragma mark - <---TableView DataSource--->

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"wine";

    STWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[STWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }

    cell.wine = self.wineArray[indexPath.row];
    return cell;
}



#pragma mark - <---TableView Delegate--->

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.wineArray removeObjectAtIndex:indexPath.row];

    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}



@end
