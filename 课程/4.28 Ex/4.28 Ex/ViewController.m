//
//  ViewController.m
//  4.28 Ex
//
//  Created by kemchenj on 4/28/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STHero.h"
#import "STHeroCell.h"
#import "MJExtension.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *heros;

@end



@implementation ViewController

- (NSArray *)heros
{
    if (!_heros) {
         _heros = [STHero objectArrayWithFilename:@"heros.plist"];
    }
    return _heros;
}

NSString *ID = @"hero";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[STHeroCell class] forCellReuseIdentifier:ID];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}



#pragma mark - <TableView DataSource>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.hero = self.heros[indexPath.row];
    
    return cell;
}



#pragma mark - <TableView Delegate>

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    STHero *hero = self.heros[indexPath.row];
    return hero.cellHeight;
}

@end
