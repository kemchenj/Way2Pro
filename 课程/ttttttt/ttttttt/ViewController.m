//
//  ViewController.m
//  ttttttt
//
//  Created by kemchenj on 5/3/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "ViewController.h"
#import "STHero.h"
#import "STHeroCell.h"
#import "MJExtension.h"

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic, strong) NSArray *heros;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[STHeroCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
}

-(NSArray *)heros
{
    if (!_heros) {
        _heros = [STHero mj_objectArrayWithFilename:@"heros.plist"];
    }
    return _heros;
}



#pragma mark - <TableView DataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    NSLog(@"aaa");
    STHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.hero = self.heros[indexPath.row];
    
    return cell;
}

@end
