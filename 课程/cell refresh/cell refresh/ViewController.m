//
//  ViewController.m
//  cell refresh
//
//  Created by kemchenj on 4/29/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"

#import "MJExtension/MJExtension.h"
#import "STWine.h"
#import "STWineCell.h"



@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton    *removeBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray * wineArray;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.allowsSelectionDuringEditing         = YES;
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
}

- (NSMutableArray *)wineArray
{
    if (!_wineArray) {
//        _wineArray = [STWine objectArrayWithFilename:@"wine.plist"];
        NSArray *wineDictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine" ofType:@"plist"]];
        
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in wineDictArray) {
            [temp addObject:[STWine wineWithDict:dict]];
        }
        
        _wineArray = temp;
    }
    return _wineArray;
}



#pragma mark - <Data Operation>

- (IBAction)MultiRemove
{
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    
    self.removeBtn.hidden = !self.tableView.isEditing;
}

- (IBAction)remove
{
    NSMutableArray *deleteWineArray = [NSMutableArray array];
//    for (NSIndexPath *indexPath in self.tableView.indexPathsForSelectedRows) {
//        [deleteWineArray addObject:self.wineArray[indexPath.row]];
//    }
//    
//    [self.wineArray removeObjectsInArray:deleteWineArray];
//    
//    [self.tableView deleteRowsAtIndexPaths:self.tableView.indexPathsForSelectedRows withRowAnimation:UITableViewRowAnimationLeft];
    
    for (STWine *wine in self.wineArray) {
        if (wine.isChecked) {
            [deleteWineArray addObject:wine];
        }
    }

    [self.wineArray removeObjectsInArray:deleteWineArray];

    [self.tableView reloadData];
}



#pragma mark - <TableView DataSource>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.wineArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"wine";
    STWineCell *cell    = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"STWineCell" owner:nil options:nil] lastObject];
    }
    
    cell.wine = self.wineArray[indexPath.row];
    return cell;
}



#pragma mark - <TableView Delegate>

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    STWine *wine = self.wineArray[indexPath.row];
    wine.checked = !wine.isChecked;
    
    [tableView reloadData];
}

//// Slide Opertaion
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self.wine wineArrayveObjectAtIndex:indexPath.row];
//    
//    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//}
//
//// Operation Button Name
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return @"删除";
//}

@end
