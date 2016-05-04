//
//  ViewController.m
//  5.4 Test
//
//  Created by kemchenj on 5/4/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STHero.h"
#import "STHeroCell.h"
#import "MJExtension.h"



@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSMutableArray *heros;

@end



@implementation ViewController

- (NSMutableArray *)heros
{
    if (!_heros) {
        _heros = [STHero objectArrayWithFilename:@"heros.plist"];
    }
    return _heros;
}

NSString *ID = @"hero";

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[STHeroCell class] forCellReuseIdentifier:ID];
}

//-(BOOL)prefersStatusBarHidden
//{
//    return YES;
//}



#pragma mark - <TableView DataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    cell.hero = self.heros[indexPath.row];

    return cell;
}



#pragma mark - <TableView Delegate>

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STHero *hero = self.heros[indexPath.row];
    return hero.cellHeight;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.heros removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"修改" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField *_Nonnull textField) {}];

    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if (![alert.textFields.lastObject.text isEqualToString:@""]) {
            STHero *hero = self.heros[indexPath.row];
            hero.name = alert.textFields.lastObject.text;
            [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            return;
        }
        return;
    }];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end