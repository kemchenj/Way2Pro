//
//  STTableViewController.m
//  Detail
//
//  Created by kemchenj on 5/12/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import "STTableViewController.h"



@interface STTableViewController ()

@end



@implementation STTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    self.automaticallyAdjustsScrollViewInsets     = NO;
    self.navigationController.navigationBar.alpha = 0;

    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init]
                                                  forBarMetrics:UIBarMetricsDefault
    ];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID   = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:ID
        ];
    }
    cell.textLabel.text = @"kem";

    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 0, 200)];
    view.backgroundColor = [UIColor grayColor];

    return view;
}


@end
